import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template/src/widgets/side_bar_moon/model/base_model/base_model.dart';
import 'package:template/src/widgets/side_bar_moon/model/feature_menu_model/feature_menu_model.dart';

part 'side_bar_service.g.dart';

@RestApi()
abstract class SideBarService {
  factory SideBarService(Dio dio, {String? baseUrl}) = _SideBarService;

  @GET('https://bussapi.moon.vn/api/project/FeatureInTab/{projectName}/{tagId}')
  Future<BaseModel<List<FeatureMenuModel>>> getFeature({
    @Path('tagId') required int tagId,
    @Path('projectName') required String projectName,
  });
}
