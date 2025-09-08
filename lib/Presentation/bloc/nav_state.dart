import 'package:equatable/equatable.dart';

class NavState extends Equatable {
  //what's the programs's state? the number being rebuilt; the selected index.
  final int selectedIndex;
  NavState({required this.selectedIndex});

  NavState copyWith({int? selectedIndex}) {
    return NavState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  List<Object> get props => [selectedIndex];
}
//
// ### 🔹 Counter Example (simple state)
//
// Typical counter Bloc state looks like this:
//
// ```dart
// class CounterState {
// final int count;
// CounterState(this.count);
// }
// ```
//
// When the event comes in, you just do:
//
// ```dart
// on<Increment>((event, emit) {
// emit(CounterState(state.count + 1));
// });
// ```
//
// Why no `copyWith`?
//
// * Because the state only has **one property** (`count`).
// * When it changes, you must always create a **new state anyway**.
// * There’s nothing else to preserve, so you don’t need a helper like `copyWith`.
//
// ---
//
// ### 🔹 Navigation Example (more complex state)
//
// Your `NavState` now has:
//
// ```dart
// class NavState {
// final int selectedIndex;
// // later you might add more...
// }
// ```
//
// Right now it’s still simple. But imagine tomorrow you add:
//
// ```dart
// class NavState {
// final int selectedIndex;
// final bool isDarkMode;
// final String username;
// final bool isLoading;
// }
// ```
//
// If you didn’t use `copyWith`, every time you want to change **just one field**, you’d have to pass everything again:
//
// ```dart
// emit(NavState(
// selectedIndex: event.index,
// isDarkMode: state.isDarkMode,
// username: state.username,
// isLoading: state.isLoading,
// ));
// ```
//
// That gets messy fast.
//
// With `copyWith`:
//
// ```dart
// emit(state.copyWith(selectedIndex: event.index));
// ```
//
// Much cleaner ✅
//
// ---
//
// ### 🔹 So the difference
//
// * **Counter example** → Only 1 field → no need for `copyWith`.
// * **Complex states** (like navigation, auth, forms, etc.) → Many fields → `copyWith` saves you from repeating everything.
//
// ---
//
// 👉 So `copyWith` is not mandatory. It’s just a **convenience tool** for when your state grows more complex.
//
// ---
//
// Do you want me to show you how your current `NavState` could work **without** `copyWith`, and then compare it with the `copyWith` version, so you see the practical difference?
//
// Great question 👌 let’s break it down.
//
// ---
//
// ### 🔹 `copyWith`
//
// ```dart
// NavState copyWith({int? selectedIndex}) {
// return NavState(
// selectedIndex: selectedIndex ?? this.selectedIndex,
// );
// }
// ```
//
// * In **Bloc**, state objects are usually **immutable**.
//
// * That means we don’t *modify* an existing state, we always create a **new state object**.
// * `copyWith` is just a helper method that makes creating a new state easier:
//
// * If you pass a new `selectedIndex`, it replaces it.
// * If you don’t, it keeps the old one (`?? this.selectedIndex`).
//
// ✅ Example:
//
// ```dart
// var state1 = NavState(selectedIndex: 0);
// var state2 = state1.copyWith(selectedIndex: 1);
//
// // state1.selectedIndex == 0
// // state2.selectedIndex == 1
// ```
//
// So when your **`NavBloc`** receives an event, it does:
//
// ```dart
// emit(state.copyWith(selectedIndex: event.index));
// ```
//
// instead of manually rebuilding the whole object.
//
// ---
//
// ### 🔹 `props`
//
// ```dart
// List<Object> get props => [selectedIndex];
// ```
//
// * This is used when you extend **`Equatable`** (a package that helps compare objects).
// * Normally, Dart compares objects by **reference** (are they the exact same instance in memory?).
// * With `Equatable` and `props`, it compares them by **value**.
//
// ✅ Example:
//
// ```dart
// final a = NavState(selectedIndex: 0);
// final b = NavState(selectedIndex: 0);
//
// print(a == b); // false, if not using Equatable (different objects)
// print(a == b); // true, if using Equatable + props includes selectedIndex
// ```
//
// This is super useful in Bloc:
//
// * It prevents unnecessary rebuilds in `BlocBuilder` if the state didn’t actually change.
// * Without it, every emitted state (even if identical) could trigger a rebuild.
//
// ---
//
// ### 🔹 Why both matter
//
// * **`copyWith`** → to easily create *new immutable states*.
// * **`props` (Equatable)** → to check if a *new state is really different* from the old one.
//
// ---
//
// 👉 Do you want me to rewrite your `NavState` fully with `Equatable` so you see it in context?
