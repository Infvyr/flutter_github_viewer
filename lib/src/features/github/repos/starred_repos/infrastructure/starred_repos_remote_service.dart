import 'package:dio/dio.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/network_exceptions.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/remote_response.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_headers.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_headers_cache.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_repo_dto.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/dio_extensions.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/pagination_config.dart';

class StarredReposRemoteService {
  StarredReposRemoteService(this._dio, this._headersCache);

  final Dio _dio;
  final GithubHeadersCache _headersCache;

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
      int page) async {
    const token = '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';
    const accept = 'application/vnd.github.v3.html+json';
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred',
      {
        'page': '$page',
        'per_page': '$PaginationConfig.itemsPerPage',
      },
    );

    final previousHeaders = await _headersCache.get(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {
            'Authorization': 'bearer $token',
            'Accept': accept,
            'If-None-Match': previousHeaders.etag ?? '',
          },
        ),
      );

      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          maxPage: previousHeaders.link?.maxPage ?? 0,
        );
      } else if (response.statusCode == 200) {
        final headers = GithubHeaders.parse(response);
        await _headersCache.save(requestUri, headers);
        final convertedData = (response.data as List<dynamic>)
            .map((e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
            .toList();
        return RemoteResponse.withNewData(
          convertedData,
          maxPage: headers.link?.maxPage ?? 1,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return RemoteResponse.noConnection(
          maxPage: previousHeaders.link?.maxPage ?? 0,
        );
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
