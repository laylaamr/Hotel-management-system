import 'guest.dart';

class Room {
 late int roomNumber;
 late RoomType type;
  bool isAvailable;

  Room(this.roomNumber, this.type, {this.isAvailable = true});


  String toString() {
    return "Room Number: $roomNumber, Type: $type, Available: $isAvailable";
  }
}