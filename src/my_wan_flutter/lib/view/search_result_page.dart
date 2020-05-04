import 'package:flutter/material.dart';
import 'package:mywanflutter/util/apis.dart';
import 'package:mywanflutter/widget/article_item_view.dart';
import 'package:mywanflutter/widget/refreshable_list.dart';

class SearchResultPage extends StatelessWidget {
  final String keyword;

  SearchResultPage(this.keyword);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(keyword),
      ),
      body: RefreshableList([Apis.search(keyword)], ['datas'], [''],
              (item, index) {
            return ArticleItemView(item);
          }),
    );
  }
}