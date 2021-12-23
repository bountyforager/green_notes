import 'package:green_notes/models/app_models.dart';
import 'package:green_notes/utilities/api_handlers/green_api.dart';
import 'package:green_notes/utilities/constants/app_strings.dart';

class GreenRepository {
  final _greenApi = GreenApi();
  final String _endPoint = AppStrings().apiEndPoint;

  Future<List<GreenContent>> allFiles() async {
    final response = await _greenApi.get(_endPoint);

    if (response?.statusCode == 200) {
      
      return (response?.data as List)
          .map((e) => GreenContent.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<GreenContent>> get filesResults async {
    final _filesResults = await allFiles();
    return [..._filesResults];
  }
}
