import 'package:clothes/clothes_app/core/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(){
  return AppBar(
    backgroundColor: Colors.green,
    title: Align(
        alignment: Alignment.topRight,
        child: Text('MIRAI.TEX', style: AppTextStyle.s18white,)),
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white,)),
    actions: [
      // TextButton(onPressed: (){}, child: Text('Instagram', style: AppTextStyle.s16white,)),
      // TextButton(onPressed: (){}, child: Text('Telegram', style: AppTextStyle.s16white,)),
      // TextButton(onPressed: (){}, child: Text('Whatsapp', style: AppTextStyle.s16white,)),
      // TextButton(onPressed: (){}, child: Text('Каталог', style: AppTextStyle.s16white,)),
    ],
  );
}
