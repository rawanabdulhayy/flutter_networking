abstract class NavEvent {
  //every event should extend this base class of all events
}
class NavItemSelected extends NavEvent {
  final int index;
  NavItemSelected(this.index);

  List<Object> get props => [index];
}