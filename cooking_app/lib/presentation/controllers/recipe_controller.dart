import 'package:get/get.dart';
import 'package:cooking_app/data/models/feed.dart';
import 'package:cooking_app/domain/usecases/get_feed.dart';

class RecipeController extends GetxController {
  final GetFeed getFeed;

  RecipeController({required this.getFeed});

  var feed = Rx<Feed?>(null);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFeedData();
  }

  Future<void> loadFeedData() async {
    try {
      final feedData = await getFeed();
      feed.value = feedData;
    } catch (e) {
      Get.log("Error loading feed data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}