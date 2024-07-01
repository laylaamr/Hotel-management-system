import 'dart:io';

import 'guest.dart';
import 'hotel.dart';
import 'room.dart';

void main() {
  // Create some rooms
  List<Room> rooms = [
    Room(1, RoomType.single),
    Room(2, RoomType.double),
    Room(3, RoomType.suite),
  ];

  Hotel myHotel = Hotel("Grand Hotel", rooms);

  while (true) {
    print("\nWelcome to Grand Hotel");
    print("1. Book a room");
    print("2. Check in guest");
    print("3. Display available rooms");
    print("4. Display hotel details");
    print("5. Exit");

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case "1":
        String guestName = getGuestName();
        String guestEmail = getGuestEmail();
        Guest guest = Guest(guestName, guestEmail);

        print("Available room types:");
        for (var type in RoomType.values) {
          print(type);
        }
        String roomTypeString = stdin.readLineSync()!;
        RoomType roomType = RoomType.values.firstWhere(
                (type) => type.toString() == roomTypeString,
            orElse: () => throw Exception("Invalid room type"));

        myHotel.bookRoom(guest, roomType);
        break;
      case "2":
        String guestName = getGuestName();
        String guestEmail = getGuestEmail();
        Guest guest = Guest(guestName, guestEmail);
        int roomNumber = getRoomNumber();
        myHotel.checkIn(guest, roomNumber);
        break;
      case "3":
        myHotel.displayAvailableRooms();
        break;
      case "4":
        print(myHotel);
        break;
      case "5":
        print("Exiting Hotel Management System.");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

String getGuestName() {
  while (true) {
    print("Enter guest name: ");
    String name = stdin.readLineSync()!;
    if (name.isEmpty) {
      print("Guest name cannot be empty. Please try again.");
    } else {
      return name;
    }
  }
}

String getGuestEmail() {
  while (true) {
    print("Enter guest email: ");
    String email = stdin.readLineSync()!;
    if (email.isEmpty) {
      print("Guest email cannot be empty. Please try again.");
    } else {
      return email;
    }
  }
}

int getRoomNumber() {
  while (true) {
    print("Enter room number: ");
    String input = stdin.readLineSync()!;
    try {
      int roomNumber = int.parse(input);
      return roomNumber;
    } on FormatException {
      print("Invalid input. Please enter an integer for room number.");
    }
  }
}
