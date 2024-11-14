// marble_game_event.dart
part of 'mg_bloc.dart';

abstract class MarbleGameEvent extends Equatable {
  const MarbleGameEvent();

  @override
  List<Object> get props => [];
}

class PlaceMarbleEvent extends MarbleGameEvent {
  final int row;
  final int col;

  const PlaceMarbleEvent(this.row, this.col);

  @override
  List<Object> get props => [row, col];
}

class RotateBoardEvent extends MarbleGameEvent {}
