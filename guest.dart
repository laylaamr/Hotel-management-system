import 'dart:io';

enum RoomType { single, double, suite }

class Guest {
 late String name;
 late String email;

  Guest(this.name, this.email);
}
