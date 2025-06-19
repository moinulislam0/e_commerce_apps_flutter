class ResponseModels {
  final int statusCode;
  final bool isSuccess;
  final dynamic returnData;

  ResponseModels(
      {required this.isSuccess,
      required this.returnData,
      required this.statusCode});
}
