import 'package:flutter/material.dart';

class BoxFitDemo extends StatelessWidget {
  const BoxFitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: GridView.count(
        crossAxisCount: 2, // show 2 images per row
        children: [
          // ---------------- CONTAIN ----------------
          Container(
            color: Colors.black,
            child: Image.asset(
              'assets/images/quantum_physics.jpg',
              fit: BoxFit.contain,
            ),
          ),
          // contain → scales the image so the ENTIRE thing is visible inside container
          // ✅ maintains aspect ratio
          // ❌ may leave empty space (letterboxing)

          // ---------------- COVER ----------------
          Container(
            color: Colors.black,
            child: Image.asset(
              'assets/images/quantum_physics.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // cover → scales image to COMPLETELY cover the container
          // ✅ maintains aspect ratio
          // ❌ crops edges if container ratio ≠ image ratio

          // ---------------- FILL ----------------
          Container(
            color: Colors.black,
            child: Image.asset(
              'assets/images/quantum_physics.jpg',
              fit: BoxFit.fill,
            ),
          ),
          // fill → stretches/squeezes image to EXACTLY fill container
          // ❌ does NOT maintain aspect ratio (image can look distorted)
          // ✅ no empty space, no cropping

          // ---------------- FIT WIDTH ----------------
          Container(
            color: Colors.black,
            child: Image.asset(
              'assets/images/quantum_physics.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          // fitWidth → scales image so WIDTH = container width
          // ✅ maintains aspect ratio
          // ❌ height may overflow or leave empty space

          // ---------------- FIT HEIGHT ----------------
          Container(
            color: Colors.black,
            child: Image.asset(
              'assets/images/quantum_physics.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          // fitHeight → scales image so HEIGHT = container height
          // ✅ maintains aspect ratio
          // ❌ width may overflow or leave empty space

          // ---------------- NONE ----------------
          Container(
            color: Colors.black,
            child: Image.asset(
              'assets/images/quantum_physics.jpg',
              fit: BoxFit.none,
            ),
          ),
          // none → no scaling
          // ✅ image keeps its ORIGINAL size
          // ❌ can be cropped if larger than container
          // ❌ can leave blank space if smaller

          // ---------------- SCALE DOWN ----------------
          Container(
            color: Colors.black,
            child: Image.asset(
              'assets/images/quantum_physics.jpg',
              fit: BoxFit.scaleDown,
            ),
          ),
          // scaleDown → like contain BUT never enlarges image
          // ✅ only shrinks when necessary
          // ❌ won’t upscale small images (avoids blur)
        ],
      ),
    );
  }
}
