INSERT INTO roles (role_name) VALUES ('Customer'), ('TravelAgent'), ('Admin');

INSERT INTO customers (first_name, last_name, email, password_hash, role_id)
VALUES
('Tina', 'Kales', 'tkales@gmail.com', 'klklkl',),
('Stiles', 'McCall', 'smccall23@gmail.com', 's67th', 1),
('Zeke', 'Argent', 'zargent89@gmail.com', 'zeke123', 1),
('Mia', 'Moline', 'mmoleme@gmail.com', '3386', 1)

INSERT INTO destinations (destination_name, region, country)
VALUES
('Paris', 'Ile-de-France', 'France'),
('Oryol', 'Moscow', 'Russia'),
('Rome', 'Milan', 'Italy'),
('Victoria falls', 'sub-saharan', 'Zimbabwe');

INSERT INTO flights (airline, departure_time, arrival_time, origin, destination_id, seat_class, price, capacity)
VALUES
('AirFrance', '2024-09-24 11:00:00', '2024-09-25 16:00:00', 'Paris', 1, 'Economy', 500.00, 200),
('Qatar Airways', '2024-06-05 12:20:00', '2024-06-06 17:00:00', 'Dubai', 2, 'Business', 1800.00, 20),
('Garuda Indonesia', '2024-12-05 08:00:00', '2024-12-06 12:00:00', 'Sydney', 2, 'Business', 1200.00, 50),
('AirFrance', '2024-08-15 10:00:00', '2024-08-16 14:00:00', 'New York', 1, 'Economy', 500.00, 200);

INSERT INTO accomodations (accomodation_name, destination_id, room_type, price_per_night, amenities)
VALUES
('Beacons Hotel', 1, 'Private Suite', 400.00, 'WiFi, Pool, Gym, room service'),
('Hotel Paris', 2, 'Deluxe Room', 200.00, 'WiFi, Pool, Gym'),
('Mystic Villa', 3, 'Private Villa', 700.00, 'Beach Access, Private Pool, Rental Car'), --rentl in tatenda's
('Villa Bali', 4, 'Private Villa', 300.00, 'Private Pool, Beach Access');

INSERT INTO services (service_name, price)
VALUES
('Extra Baggage', 50.00),
('Guided Tour', 100.00),
('Car Rental', 75.00);

INSERT INTO bookings (customer_id, flight_id, accomodation_id, total_price)
VALUES
(1, 1, 1, 700.00),
(2, 2, 2, 500.00),
(3, 3, 3, 1800.00),
(4, 4, 4, 1300.00),

INSERT INTO bookingservices (booking_id, service_id)
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO payments (booking_id, payment_method, amount)
VALUES
(1, 'Credit Card', 700.00),
(2, 'Bank Transfer', 500.00),
(3, 'Bank Transfer', 1800.00),
(4, 'Credit Card', 1300.00);

INSERT INTO feedback (booking_id, rating, comments)
VALUES
(1, 5, 'Excellent Service!'),
(2, 4, 'Great experience, but the flight was delayed.'),
(3, 1, 'Poor service!'),
(4, 5, 'Amazing service, I got assisted with everything in a very professional way.');

--after skills up to select ratings
-- INSERT INTO promotions (promotion_id, promotion_name, start_date, end_date, discount)
-- VALUES (1, 'Summer Sale', '2023-06-01', 2023-08)

