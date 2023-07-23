import 'package:dio/dio.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/sembast_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sembastProvider = Provider((ref) => SembastDatabase());

final dioProvider = Provider((ref) => Dio());
