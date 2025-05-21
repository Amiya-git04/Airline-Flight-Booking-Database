--- 1.. Find the Total Number of Bookings for Each Flight 
SELECT 
    f.flight_id,
    f.flight_number,
    COUNT(b.booking_id) AS total_bookings
FROM 
    Flights f
LEFT JOIN 
    Bookings b ON f.flight_id = b.flight_id
GROUP BY 
    f.flight_id, f.flight_number
ORDER BY 
    total_bookings DESC;

---2. List All Passengers Who Have Booked a Specific Flight (e.g., Flight Number 'AI202') 

SELECT 
    p.passenger_id,
    p.first_name,
    p.last_name,
    p.email,
    p.phone,
    f.flight_number
FROM 
    Passengers p
JOIN 
    Bookings b ON p.passenger_id = b.passenger_id
JOIN 
    Flights f ON b.flight_id = f.flight_id
WHERE 
    f.flight_number = 'AI202';

--- 3 . Find the Total Number of Flights Departing from a Specific Airport (e.g., 'JFK') 
SELECT 
    a.airport_name,
    COUNT(f.flight_id) AS total_departing_flights
FROM 
    Flights f
JOIN 
    Airports a ON f.departure_airport_id = a.airport_id
WHERE 
    a.airport_name = 'John F. Kennedy International'
GROUP BY 
    a.airport_name;

--- 4 .Find the Flight with the Most Passengers Booked (Most Popular Flight) 
SELECT TOP 1
    f.flight_id,
    f.flight_number,
    COUNT(b.booking_id) AS total_passengers
FROM 
    Flights f
JOIN 
    Bookings b ON f.flight_id = b.flight_id
GROUP BY 
    f.flight_id, f.flight_number
ORDER BY 
    total_passengers DESC;

--- 5. . Get the Total Payment Amount for All Confirmed Bookings 
SELECT 
    SUM(p.amount) AS total_confirmed_payment
FROM 
    Payments p
JOIN 
    Bookings b ON p.booking_id = b.booking_id
WHERE 
    b.status = 'Confirmed';

--- 6. List All Flights Departing After a Specific Date and Time (e.g., '2024-06-01 10:00:00') 
SELECT 
    f.flight_id,
    f.flight_number,
    a1.airport_name AS departure_airport,
    a2.airport_name AS arrival_airport,
    f.departure_time,
    f.arrival_time,
    f.status
FROM 
    Flights f
JOIN 
    Airports a1 ON f.departure_airport_id = a1.airport_id
JOIN 
    Airports a2 ON f.arrival_airport_id = a2.airport_id
WHERE 
    f.departure_time > '2024-06-01 10:00:00'
ORDER BY 
    f.departure_time;

--- 7.  Find the Number of Bookings Made in Each Seat Class (e.g., Economy, Business) 
SELECT 
    seat_class,
    COUNT(booking_id) AS total_bookings
FROM 
    Bookings
GROUP BY 
    seat_class
ORDER BY 
    total_bookings DESC;

--- 8. List All Flights That Have Been Cancelled 
SELECT 
    f.flight_id,
    f.flight_number,
    a1.airport_name AS departure_airport,
    a2.airport_name AS arrival_airport,
    f.departure_time,
    f.arrival_time,
    f.status
FROM 
    Flights f
JOIN 
    Airports a1 ON f.departure_airport_id = a1.airport_id
JOIN 
    Airports a2 ON f.arrival_airport_id = a2.airport_id
WHERE 
    f.status = 'Cancelled'
ORDER BY 
    f.departure_time;

--- 9. Find the Average Payment Amount for Confirmed Bookings 
SELECT 
    AVG(p.amount) AS avg_confirmed_payment
FROM 
    Payments p
JOIN 
    Bookings b ON p.booking_id = b.booking_id
WHERE 
    b.status = 'Confirmed';

--- 10. Get the Total Number of Bookings and Total Payment Amount for Each Passenger 
SELECT 
    p.passenger_id,
    CONCAT(p.first_name, ' ', p.last_name) AS passenger_name,
    COUNT(b.booking_id) AS total_bookings,
    COALESCE(SUM(pay.amount), 0) AS total_payment_amount
FROM 
    Passengers p
LEFT JOIN 
    Bookings b ON p.passenger_id = b.passenger_id
LEFT JOIN 
    Payments pay ON b.booking_id = pay.booking_id
GROUP BY 
    p.passenger_id, p.first_name, p.last_name
ORDER BY 
    p.passenger_id;








