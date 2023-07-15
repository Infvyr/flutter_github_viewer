import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/dio_extensions.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/network_exceptions.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/remote_response.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_headers.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_headers_cache.dart';

class RepoDetailRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  RepoDetailRemoteService(
    this._dio,
    this._headersCache,
  );

  Future<RemoteResponse<String>> getReadmeHtml(String fullRepoName) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/repos/$fullRepoName/readme',
    );

    final previousHeaders = await _headersCache.get(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {
            'If-None-Match': previousHeaders?.etag ?? '',
          },
          responseType: ResponseType.plain,
        ),
      );

      switch (response.statusCode) {
        case 304:
          return const RemoteResponse.notModified(maxPage: 0);
        case 200:
          final headers = GithubHeaders.parse(response);
          await _headersCache.save(requestUri, headers);
          final html = response.data as String;
          return RemoteResponse.withNewData(html, maxPage: 0);
        default:
          throw RestApiException(response.statusCode);
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  /// Returns null if there's no Internet connection.
  Future<bool?> getStarredStatus(String fullRepoName) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred/$fullRepoName',
    );

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          validateStatus: (status) => (status != null && status >= 200 && status < 400) || status == 404,
        ),
      );

      switch (response.statusCode) {
        case 204:
          return true;
        case 404:
          return false;
        default:
          throw RestApiException(response.statusCode);
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  /// Returns null if there's no Internet connection.
  Future<Unit?> switchStarredStatus(
    String fullRepoName, {
    required bool isCurrentlyStarred,
  }) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred/$fullRepoName',
    );

    try {
      final response = await (isCurrentlyStarred ? _dio.deleteUri(requestUri) : _dio.putUri(requestUri));

      if (response.statusCode == 204) {
        return unit;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
