

abstract class MarbleGameEvent {
  const MarbleGameEvent();
}

class Player1Move extends MarbleGameEvent {
  final int row;
  final int col;

  const Player1Move(this.row, this.col);
}

class Player2Move extends MarbleGameEvent {
  final int row;
  final int col;

  const Player2Move(this.row, this.col);
}

class NewGameInitiated extends MarbleGameEvent {
  const NewGameInitiated();
}
