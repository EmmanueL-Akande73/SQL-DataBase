CREATE DATABASE easytravel;
\c easytravel

CREATE TABLE roles(
    role_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INT REFERENCES roles(role_id) ON DELETE CASCADE,
    loyalty_points INT DEFAULT 0
);

CREATE TABLE loyaltyprogram(
    loyalty_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
    points_earned INT DEFAULT 0,
    points_redeemed INT DEFAULT 0
);

CREATE TABLE destinations(
    destination_id SERIAL PRIMARY KEY,
    destination_name VARCHAR (100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE flights(
    flight_id SERIAL PRIMARY KEY,
    airline VARCHAR(100) NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    origin VARCHAR(100) NOT NULL,
    destination_id INT REFERENCES destinations(destination_id) ON DELETE CASCADE,
    seat_class VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE accomodations(
    accomodation_id SERIAL PRIMARY KEY,
    accomodation_name VARCHAR(100) NOT NULL,
    destination_id INT REFERENCES destinations(destination_id) ON DELETE CASCADE,
    room_type VARCHAR(50) NOT NULL,
    price_per_night NUMERIC(10, 2) NOT NULL,
    amenities TEXT
);

CREATE TABLE taxitransfers(
    transfer_id SERIAL PRIMARY KEY,
    destination_id INT REFERENCES destinations(destination_id) ON DELETE CASCADE,
    transfer_type VARCHAR(50) NOT NULL,
    special_requests TEXT
);

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL
):

CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
    flight_id INT REFERENCES flights(flight_id) ON DELETE SET NULL,
    accomodation_id INT REFERENCES accomodations(accomodation_id) ON DELETE SET NULL,
    transfer_id INT REFERENCES taxitransfers(transfer_id) ON DELETE SET NULL,
    total_price NUMERIC(10, 2) NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pending'
);

CREATE TABLE bookingservices(
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    service_id INT REFERENCES services(service_id) ON DELETE CASCADE,
    PRIMARY KEY (booking_id, service_id)
);

CREATE TABLE payments(
    payment_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    payment_method VARCHAR(50) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE feedback(
    feedback_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1AND 5),
    comments TEXT
);

CREATE TABLE promotions(
    promotion_id SERIAL PRIMARY KEY,
    promotion_name VARCHAR(100) NOT NULL,
    discount_percentage NUMERIC(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    is_loyalty_exclusive BOOLEAN DEFAULT FALSE
);

CREATE TABLE bookingpromotions(
    booking_id INT REFERENCES bookings(booking_id) ON DELETE CASCADE,
    promotion_id INT REFERENCES promotions(promotion_id) ON DELETE CASCADE,
    PRIMARY KEY (booking_id, promotion_id)
);