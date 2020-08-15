import 'dart:convert';

BookModel pickUpFromJson(String str) => BookModel.romJson(json.decode(str));

String pickUpToJson(BookModel data) => json.encode(data.toJson());
class BookModel {
  String error;
  String message;
  List<Booked> booked;
  Booked mBooked;

  BookModel({this.error, this.message, this.booked,this.mBooked});



  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        error: json['error'],
        message: json['message'],
        booked: (json['reservation'] as List)
            .map((data) => Booked.fromJson(data))
            .toList());
  }


  factory BookModel.romJson(Map<String, dynamic> json) => new BookModel(
    mBooked: Booked.fromJson(json["reservation"]),
  );
  Map<String, dynamic> toJson() => {
    "results": mBooked.toJson(),
  };
}

class Booked {
  String reservationId;
  String userId;
  int serviceId;
  String reservationStatus;
  int seatNo;
  String createdAt;
  String serviceType;
  String startHour;
  String endHour;
  int availableSeats;

  Booked(
      {this.reservationId,
      this.userId,
      this.serviceId,
      this.reservationStatus,
      this.seatNo,
      this.createdAt,
      this.serviceType,
      this.startHour,
      this.endHour,
      this.availableSeats});

  factory Booked.fromJson(Map<String, dynamic> json) {
    return new Booked(
      reservationId: json['reservation_id'],
      userId: json['user_id'],
      serviceId: json['service_id'],
      reservationStatus: json['reservation_status'],
      seatNo: json['seats_number'],
      createdAt: json['created_at'],
      serviceType: json['service_type'],
      startHour: json['start_hours'],
      endHour: json['end_hours'],
      availableSeats: json['available_seats'],
    );
  }


  Map<String, dynamic> toJson() => {
    "reservation_id": reservationId,
    "user_id": userId,
    "service_id": serviceId,
    "reservation_status":reservationId,
    "seats_number":seatNo,
    "created_at":createdAt,
    "service_type":serviceType,
    "start_hours":startHour,
    "end_hours":endHour,
    "available_seats":availableSeats
  };


}
