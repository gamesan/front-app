import '../request.dart';

class DemoApi {
  // 下拉刷新，上拉加载更多接口
  static getAppapi(page) {
    return Request.get(
      'http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$page',
    );
  }
}
