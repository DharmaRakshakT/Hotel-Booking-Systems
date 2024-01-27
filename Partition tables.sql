SELECT 
  state, 
  hotel_name, 
  total_bookings, 
  booking_rank 
FROM 
  (
    SELECT 
      loc.state, 
      h.hotel_name, 
      COUNT(b.booking_id) AS total_bookings, 
      RANK() OVER (
        PARTITION BY loc.state 
        ORDER BY 
          COUNT(b.booking_id) DESC
      ) AS booking_rank 
    FROM 
      Bookings b 
      JOIN Hotels h ON b.hotel_id = h.hotel_id 
      JOIN Location loc ON h.location_id = loc.location_id 
    GROUP BY 
      loc.state, 
      h.hotel_name
  ) ranked 
WHERE 
  booking_rank <= 3;

