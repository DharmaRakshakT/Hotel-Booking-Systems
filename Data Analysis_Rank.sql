SELECT 
  hotel_id, 
  hotel_name, 
  rating, 
  state, 
  city, 
  RANK() OVER (
    ORDER BY 
      rating DESC
  ) AS rating_rank 
FROM 
  hotels h 
  JOIN location l ON h.location_id = l.location_id;
