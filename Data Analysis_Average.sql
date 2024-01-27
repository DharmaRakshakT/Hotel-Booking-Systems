SELECT 
  r.room_type, 
  l.city, 
  ROUND(
    AVG(
      b.total_price / (
        TO_NUMBER(
          b.check_out_date - b.check_in_date
        )
      )
    ), 
    2
  ) AS avg_price_per_night 
FROM 
  Bookings b 
  JOIN room_types r ON b.room_type_id = r.room_type_id 
  JOIN Hotels h ON b.hotel_id = h.hotel_id 
  JOIN Location l ON h.location_id = l.location_id 
GROUP BY 
  CUBE (r.room_type, l.city) 
HAVING 
  r.room_type IS NOT NULL 
  AND l.city IS NOT NULL 
ORDER BY 
  l.city, 
  avg_price_per_night
