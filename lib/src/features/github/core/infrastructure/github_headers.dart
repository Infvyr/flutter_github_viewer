import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_headers.freezed.dart';
part 'github_headers.g.dart';

@freezed
class GithubHeaders with _$GithubHeaders {
  const GithubHeaders._();
  const factory GithubHeaders({
    String? etag,
    PaginationLink? link,
  }) = _GithubHeaders;

  factory GithubHeaders.parse(Response response) {
    final headers = response.headers;
    final link = headers.map['Link']?.first;

    return GithubHeaders(
      etag: headers.map['Etag']?.first,
      link: PaginationLink.parse(
        link?.split(',') ?? [],
        requestUrl: response.realUri.toString(),
      ),
    );
  }

  factory GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$GithubHeadersFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const PaginationLink._();
  const factory PaginationLink({required int maxPage}) = _PaginationLink;

  factory PaginationLink.parse(
    List<String> values, {
    required String requestUrl,
  }) {
    return PaginationLink(
      maxPage: _extractPageNumber(
        values.firstWhere(
          (element) => element.contains('rel="last"'),
          orElse: () => requestUrl,
        ),
      ),
    );
  }

  static int _extractPageNumber(String value) {
    final uriString = RegExp(
            r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)')
        .stringMatch(value);
    return int.parse(Uri.parse(uriString!).queryParameters['page']!);
  }

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}