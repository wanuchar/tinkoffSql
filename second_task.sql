SELECT DISTINCT(name)
FROM pilot
         JOIN (SELECT second_pilot_id, first_pilot_id
               FROM race
                        JOIN (
                            SELECT * FROM plane WHERE cargo_flg = 0) plain on plain.plane_id = race.plane_id WHERE race.quantity > 30
             ) as race_plane
              on pilot.pilot_id = race_plane.second_pilot_id or pilot.pilot_id = race_plane.first_pilot_id
WHERE age > 45;