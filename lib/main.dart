import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SkeletonLoading(),
      ),
    );

class SkeletonLoading extends StatefulWidget {
  const SkeletonLoading({Key? key}) : super(key: key);

  @override
  _SkeletonLoadingState createState() => _SkeletonLoadingState();
}

class _SkeletonLoadingState extends State<SkeletonLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'スケルトンスクリーン',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          period: const Duration(milliseconds: 1000),
          child: skeletonItem(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget skeletonItem() => Column(
        children: [
          account(),
          const SizedBox(height: 20),
          indicatorArea(),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'スライドエリア',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: const [
                      Card(
                        color: Colors.grey,
                        shadowColor: Colors.blueGrey,
                        margin: EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: 100,
                          height: 80,
                        ),
                      ),
                      Card(
                        color: Colors.grey,
                        shadowColor: Colors.blueGrey,
                        margin: EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: 100,
                          height: 80,
                        ),
                      ),
                      Card(
                        color: Colors.grey,
                        shadowColor: Colors.blueGrey,
                        margin: EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: 100,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  Container indicatorArea() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Container account() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 150,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
