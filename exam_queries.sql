/*
SELECT * FROM owner.owner;
SELECT * FROM owner_data.owner_data;
SELECT * FROM `kennel data`.kennel_data;
SELECT * FROM match_ids.match_ids;
SELECT * FROM `match data`.match_data;
SELECT * FROM `trainer data`.trainer_data;
SELECT * FROM `trick data`.trick_data;
*/

# 1. Which puppy has the highest overall grade average?
SELECT mi.`pn` AS `Pet Name`, AVG( md.`Grade` ) AS `Highest Average`
   FROM `schema`.`match_ids` as mi left outer join `schema`.`match_data` as md
   ON mi.mid = md.mid
   GROUP BY mi.`pn`
   Order By AVG( md.`Grade` ) Desc
   Limit 1;
# 2. Which trick gets puppies the best grade?
SELECT td.`Trick_Name` AS `Trick`, AVG( md.`Grade` ) AS `Highest Average`
   FROM `schema`.`trick_data` as td left outer join `schema`.`match_data` as md
   ON td.Trick_Name = md.trick_id
   GROUP BY td.`Trick_Name`
   Order By AVG( md.`Grade` ) Desc
   Limit 1;
# 3. Based on puppy averages, which trainer is the most successful?
SELECT concat(`tfn`, ' ', `tln`) AS 'Trainer', AVG( md.`Grade` ) AS `BestScore`
	FROM `schema`.`trainer_data` as td join match_ids as mi on mi.tid = td.tid
	join match_data as md on mi.mid = md.mid
	group by Trainer
	order by BestScore DESC
	Limit 1;
# 4. The trick “Heel” is a data entry error. Update the name of this trick to “Sit”.

# 5. Delete all references to the puppy named Idiot.

# 6. Which puppy has the lowest average grade? 

# 7. Based on the grades, which trick is the toughest?

# 8. Which owner has the best performing puppy?

# 9. Which week was the busiest week based on the number of puppies in training?

# 10. Based on the grades, which puppy makes the best coffee?
