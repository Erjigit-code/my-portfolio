import 'package:exam_app/constants/constants.dart';
import 'package:exam_app/pages/category/category_page.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final category = data[index];
        String originalText = category['name'];
        String editedText =
            originalText.replaceAll('кондитерское', 'кондитерские');
        TextSpan formattedText = TextSpan(
          text: editedText,
          style: TextStyle(
              color: Constants.blackColor,
              fontSize: 20,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500),
        );
        Text editedTextWidget = Text.rich(formattedText);
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CategoryPage(categoryName: category['name']);
                },
              ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 148,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      category['image_url'],
                    ),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 12,
                      left: 16,
                      child: SizedBox(
                          width: 191, height: 50, child: editedTextWidget))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
