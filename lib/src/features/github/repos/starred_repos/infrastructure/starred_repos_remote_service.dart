import 'package:dio/dio.dart';

class StarredReposRemoteService {
  StarredReposRemoteService(this._dio);

  final Dio _dio;

  // Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
  //     int page) async {}
}
