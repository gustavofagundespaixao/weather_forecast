import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Shimmer.fromColors(
          baseColor: Colors.grey[50],
          highlightColor: Colors.grey,
          child: Container(color: Colors.white, height: 8),
        ),
        subtitle: Shimmer.fromColors(
          baseColor: Colors.grey[50],
          highlightColor: Colors.grey,
          child: Container(color: Colors.white, height: 8),
        ),
        trailing: Shimmer.fromColors(
          baseColor: Colors.grey[50],
          highlightColor: Colors.grey,
          child: Container(color: Colors.white, height: 30, width: 60),
        ),
      ),
    );
  }
}
