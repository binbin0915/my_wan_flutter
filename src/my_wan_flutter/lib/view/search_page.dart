import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mywanflutter/config/colors.dart';
import 'package:mywanflutter/config/tag.dart';
import 'package:mywanflutter/util/apis.dart';
import 'package:mywanflutter/util/hint_uitl.dart';
import 'package:mywanflutter/util/nav_util.dart';
import 'package:mywanflutter/view/search_result_page.dart';
import 'package:mywanflutter/widget/refreshable_list.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            search(value);
          },
          decoration: InputDecoration(
            hintText: '请输入搜索内容...',
            hintStyle: TextStyle(color: Colors.white54),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              search(_controller.text);
            },
          )
        ],
      ),
      body: RefreshableList(
        [Apis.hotKeys()],
        [''],
        [Tags.hotKey],
        _buildItem,
        showFloating: false,
      ),
    );
  }

  _buildItem(item, index) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              '大家都在搜',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: item.map<Widget>((value) {
                var color = tagColors[Random().nextInt(tagColors.length - 1)];
                return InkWell(
                  onTap: () {
                    search(value['name']);
                  },
                  child: Text(
                    value['name'],
                    style: TextStyle(fontSize: 16, color: color),
                  ),
                );
              }).toList(),
              spacing: 20,
              runSpacing: 20,
            ),
          ),
        ],
      ),
    );
  }

  search(String keyword) {
    if (keyword.isNotEmpty) {
      NavUtil.navTo(
          context,
          SearchResultPage(
            keyword,
          ));
    } else {
      HintUtil.toast(context, '搜索内容不能为空...');
    }
  }
}
