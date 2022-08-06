SELECT *
FROM (
         SELECT COUNT(*) AS count_name, name
         FROM pilot
                  JOIN race ar ON pilot.pilot_id = ar.second_pilot_id
         WHERE destination = 'Шереметьево'
           AND flight_dt BETWEEN CONCAT(YEAR(NOW()), '-08-01') AND CONCAT(YEAR(NOW()), '-08-31')
         GROUP BY name) AS sher
WHERE sher.count_name = 3;