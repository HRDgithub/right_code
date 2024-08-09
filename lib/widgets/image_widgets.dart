import 'dart:typed_data';

import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork(
      {super.key,
      required this.dimension,
      required this.url,
      this.fit = BoxFit.cover});
  final BoxFit fit;
  final double dimension;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: FittedBox(
          fit: fit,
          child: Center(
            child: Image(
              fit: fit,
              image: NetworkImage(url),
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomImageAsset extends StatelessWidget {
  const CustomImageAsset(
      {super.key,
      required this.dimension,
      required this.path,
      this.fit = BoxFit.cover});
  final BoxFit fit;
  final double dimension;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: FittedBox(
          fit: fit,
          child: Center(
            child: Image(
              image: AssetImage(path),
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomImageMemory extends StatelessWidget {
  const CustomImageMemory(
      {super.key,
      required this.dimension,
      required this.data,
      this.fit = BoxFit.cover});
  final BoxFit fit;
  final double dimension;
  final Uint8List data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: FittedBox(
          fit: fit,
          child: Center(
            child: Image(
              image: MemoryImage(data),
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
      ),
    );
  }
}
