import 'package:clothes/core/app_constants/app_string.dart';
import 'package:clothes/core/utils.dart';
import 'package:flutter/material.dart';

import '../../core/app_text_style.dart';

class AssortmentText extends StatelessWidget
{
  const AssortmentText(
      {super.key});

  @override
  Widget build(BuildContext context)
  {
    final device = getDevice(MediaQuery.of(context).size.width);
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 30, bottom: 30),
          child: Text(
            AppString.assortment,
            style: device == DeviceSize.desktop ? AppTextStyle.s30w500 : (device == DeviceSize.tablet ? AppTextStyle.s22w600 : AppTextStyle.s16w400),
          ),
        ),
      ],
    );
  }
}

