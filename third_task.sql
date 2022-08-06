select COUNT(pilot_id) as 'count_name', name
FROM (SELECT *
FROM pilot
         JOIN
     (SELECT flight_id, flight_dt, first_pilot_id
      FROM race
               JOIN plane ap ON ap.plane_id = race.plane_id AND flight_dt BETWEEN YEAR(NOW()) AND YEAR(NOW())
      WHERE cargo_flg = 1) races ON a_pilot.pilot_id = races.first_pilot_id
) AS ssss
GROUP BY name
ORDER BY count_name DESC
LIMIT 10