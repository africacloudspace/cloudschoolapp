import 'dart:convert';

import 'dart:io' show Platform;
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

import 'package:flutter/foundation.dart';

enum SqroolEnvironment {
  production,
  sandBox,
}

enum HeadersConfig {
  sqrool,
  cdata,
}

enum HashMethodType { v1, v2 }

enum ApiKeysConfigurations { keyV1, keyV2 }

class APIService {

}
