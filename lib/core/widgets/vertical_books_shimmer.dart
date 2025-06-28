import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VerticalBooksShimmer extends StatelessWidget {
  const VerticalBooksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Row(
                children: [
                  // صورة الكتاب
                  Container(
                    width: 90,
                    height: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 30),
                  // باقي التفاصيل
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // العنوان
                        Container(
                          height: 16,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        // المؤلف
                        Container(height: 14, width: 100, color: Colors.white),
                        const SizedBox(height: 16),
                        // السعر + التقييم
                        Row(
                          children: [
                            // السعر
                            Container(
                              width: 50,
                              height: 16,
                              color: Colors.white,
                            ),
                            const Spacer(),
                            // تقييم النجوم
                            Row(
                              children: List.generate(5, (index) {
                                return Container(
                                  width: 12,
                                  height: 12,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  color: Colors.white,
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
