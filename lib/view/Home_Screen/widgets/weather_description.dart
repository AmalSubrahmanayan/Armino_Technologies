import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_text_styles.dart';

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weather Details', style: AppTextStyles.summaryTextSty),
        SizedBox(height: 5),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Health effects can be immediately felt by sensitive groups. '
              'Healthy individuals may experience difficulty breathing and throat irritation with prolonged exposure. '
              'Limit outdoor activity.',
              style: AppTextStyles.summaryTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
