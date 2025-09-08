import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});
  final List<String> moviesImages = const [
    "https://www.themoviedb.org/t/p/w1280/xbSuFiJbbBWCkyCCKIMfuDCA4yV.jpg",
    "https://www.themoviedb.org/t/p/w1280/8XfIKOPmuCZLh5ooK13SPKeybWF.jpg",
    "https://www.themoviedb.org/t/p/w1280/wVYREutTvI2tmxr6ujrHT704wGF.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    //a new widget to a new package; Carousel Slider, takes options and items (a list of items to display using the list.map((item){}))
    return CarouselSlider(
      items:
          moviesImages.map((image) {
            return Stack(
              children: [
                Image.network(
                  image,
                  width: double.infinity,
                  height: double.infinity,
                  //contain: eltabe3y — it stays true to its original shape, nothing cut off.
                  //cover: kulaha — container is fully filled, but you might lose edges.
                  //height and width only fits those w mesh muhem l tani fit
                  //fill: Force fit — no empty space, no cropping, but shape may look weird.

                // cover → keeps original proportions (aspect ratio) → crops edges if needed.
                // fill → ignores proportions → stretches/squishes image to fit container.
                  fit: BoxFit.fill,
                ),
                //where the child of the positioned widget should be positioned within the stack relatively.
                Positioned(
                  top: 324,
                  left: 120,
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "NOW PLAYING",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
      options: CarouselOptions(height: 370, autoPlay: true, viewportFraction:1),
    );
  }
}
/*
===========================
        .map() vs .forEach()
===========================

🔹 .map()
- Purpose: TRANSFORM each element into a new form.
- Returns: An Iterable (you can call .toList() to get a List).
- Must return a value for each element.
- Non-destructive → original list is NOT changed.
- Best when: you want a NEW list of transformed elements (data → data, data → widgets).

Example:
List<int> numbers = [1, 2, 3];
List<int> doubled = numbers.map((n) => n * 2).toList();
// doubled = [2, 4, 6]

Flutter example:
List<String> names = ["Rawan", "Omar", "Laila"];
Column(
  children: names.map((name) => Text(name)).toList(),
);
// maps each String → Text widget

---

🔹 .forEach()
- Purpose: EXECUTE an action for each element (side effects).
- Returns: void (nothing).
- No return value required inside callback.
- Non-destructive → original list is NOT changed.
- Best when: you just want to DO something with each item (logging, updating state, printing).

Example:
List<int> numbers = [1, 2, 3];
numbers.forEach((n) {
  print(n * 2);
});
// prints 2, 4, 6 but doesn’t return a new list

Flutter example:
List<String> names = ["Rawan", "Omar", "Laila"];
names.forEach((name) {
  debugPrint("Hello $name");
});
// Useful for logging, API calls, side effects

---

🔹 Key Differences
- .map() → creates a new collection (transform data → data).
- .forEach() → runs through list, does actions (side effects).
- .map() needs a return value for each element.
- .forEach() ignores return values completely.
- .map() = functional transformation.
- .forEach() = procedural iteration.

---

🔹 When to use:
- Use .map() → when building new lists, or widget trees from data.
- Use .forEach() → when you need to print, log, update variables, or trigger effects but don’t need a new list.

🔹 Memory trick:
- map = “make new”
- forEach = “for side effects”
*/
