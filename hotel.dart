import 'guest.dart';
import 'room.dart';

class Hotel {
  late String name;
 late List<Room> rooms;

  Hotel(this.name, this.rooms);

  void bookRoom(Guest guest, RoomType roomType) {
    for (var room in rooms) {
      if (room.type == roomType && room.isAvailable) {
        room.isAvailable = false;
        print("Room ${room.roomNumber} booked for ${guest.name}!");
        return;
      }
    }
    print("Sorry, no room of type $roomType available.");
  }

  List<Room> getAvailableRooms() {
    return rooms.where((room) => room.isAvailable).toList();
  }

  void displayAvailableRooms() {
    print("Available Rooms:");
    for (var room in getAvailableRooms()) {
      print(room);
    }
  }

  void checkIn(Guest guest, int roomNumber) {
    for (var room in rooms) {
      if (room.roomNumber == roomNumber) {
        if (room.isAvailable) {
          print("Room not available for check-in.");
          return;
        } else {
          print("Welcome ${guest.name}! You are checked in to room $roomNumber.");
          return;
        }
      }
    }
    print("Room number $roomNumber not found.");
  }
  String getHotelDetails() {
    String roomList = "";
    for (var room in rooms) {
      roomList += room.toString() + "\n";
    }

    int totalRooms = rooms.length;
    int availableRooms = getAvailableRooms().length;

    return "Hotel Name: $name\n"
        "Total Rooms: $totalRooms\n"
        "Available Rooms: $availableRooms\n"
        "Rooms:\n$roomList";
  }


  String toString() {
    String roomList = "";
    for (var room in rooms) {
      roomList += room.toString() + "\n";
    }
    return "Hotel Name: $name\nRooms:\n$roomList";
  }

}
