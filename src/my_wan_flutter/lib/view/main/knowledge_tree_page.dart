import 'package:flutter/material.dart';
import 'package:mywanflutter/config/colors.dart';
import 'package:mywanflutter/util/apis.dart';
import 'package:mywanflutter/util/nav_util.dart';
import 'package:mywanflutter/widget/refreshable_list.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

import '../knowledge_page.dart';


class KnowledgeTreePage extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return RefreshableList(
      [Apis.knowledgeTree()],
      [''],
      [''],
      _buildItem,
      divider: (index) {
        return Container(
          height: 20,
        );
      },
      showFloating: false,
    );
  }

  _buildItem(item, index) {
    return InkWell(
      onTap: () {
        NavUtil.navTo(
            _context,
            KnowledgePage(
              item['name'],
              item['children'],
            ));
      },
      child: Container(
        color: Color(0x6FECEFF6),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item['name'],
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Wrap(
                children: item['children'].map<Widget>((value) {
                  var color = tagColors[Random().nextInt(tagColors.length - 1)];
                  return Text(
                    value['name'],
                    style: TextStyle(fontSize: 16, color: color),
                  );
                }).toList(),
                spacing: 10,
                runSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
