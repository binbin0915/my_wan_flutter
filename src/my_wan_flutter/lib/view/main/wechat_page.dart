import 'package:flutter/material.dart';
import 'package:mywanflutter/util/apis.dart';
import 'package:mywanflutter/widget/article_tab_page.dart';

class WechatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ArticleTabPage(
        Apis.wxChapters(), null);
  }
}
