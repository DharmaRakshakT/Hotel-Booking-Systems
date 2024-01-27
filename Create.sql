CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    city VARCHAR(255),
    State VARCHAR(255),
    pincode INT UNIQUE
);


CREATE TABLE Hotels (
  hotel_id INT PRIMARY KEY,
  hotel_name VARCHAR(255),
  location_id INT, 
  address VARCHAR(255),
  phone VARCHAR(20),
  number_of_rooms INT,
  Rating INT,
  FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(20),
  address VARCHAR(255)
);

  CREATE TABLE Room_Types (
      Room_Type_id INT PRIMARY KEY, 
      Room_Type VARCHAR(50), 
      Number_of_Beds INT, 
      Number_of_Baths INT
);

CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY, 
  customer_id INT,
  hotel_id INT,
  room_type_id INT,
  booking_date DATE,
  check_in_date DATE, 
  check_out_date DATE,
  total_price DECIMAL(10,2),

  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),
  FOREIGN KEY (room_type_id) REFERENCES Room_Types(room_type_id)
);
