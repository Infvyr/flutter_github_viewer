import 'package:dio/dio.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_headers_cache.dart';

class StarredReposRemoteService {
  StarredReposRemoteService(this._dio, this._headersCache);

  final Dio _dio;
  final GithubHeadersCache _headersCache;

  // Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
  //     int page) async {}
}
