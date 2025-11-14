import 'package:cooking_app/domain/usecases/get_recipe_details.dart';
import 'package:get/get.dart';
import 'package:cooking_app/data/models/feed_details.dart';

class DetailsController extends GetxController {
  final GetRecipeDetails getRecipeDetails;

  DetailsController({required this.getRecipeDetails});

  var feedDetails = Rx<FeedDetails?>(null);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFeedDetails();
  }

  Future<void> loadFeedDetails() async {
    try {
      final details = await getRecipeDetails();
      feedDetails.value = details;
    } catch (e) {
      Get.log("Error loading feed details: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
