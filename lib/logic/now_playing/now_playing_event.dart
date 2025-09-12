//we are working on now playing widget
//what are the possible events for this widget?
//fetching data

//1- abstract class Event, the base class extended by all event classes
import 'package:equatable/equatable.dart';

//what is equatable? variables stored are compared by value
//variables store variables by reference (memory reference -- title and address) not by values.
//so user1 (Ali, 20 years), user2 (Ali, 20 years) are different in dart >> redundancy >> memory leak.
//equatable marks them as one, so they are only stored once in memory.

abstract class NowPlayingEvent extends Equatable{
  const NowPlayingEvent();
  //empty constructor? why?

@override
  List <Object> get props => [];
}
class FetchNowPlayingMovies extends NowPlayingEvent{}