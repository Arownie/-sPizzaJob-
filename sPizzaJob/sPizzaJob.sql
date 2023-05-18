INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_pizza','Pizza',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_pizza','Pizza',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_pizza', 'Pizza', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('pizza', 'Pizza', 1);


INSERT INTO `job_grades` ( job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('pizza',0,'recrue','Recrue',12,'{}','{}'),
	('pizza',1,'novice','Novice',24,'{}','{}'),
	('pizza',2,'experimente','Experimente',36,'{}','{}'),
	('pizza',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('pizza',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('pizza2', 'Pizza 2 viandes', -1),
        ('pizza3', 'Pizza 3 viandes', -1),
        ('pizzaxll', 'Pizza XXL', -1),
        ('gigapizza', 'Giga pizza', -1),
        ('petitefrite', 'Petite Frite', -1),
        ('moyennefrite', 'Moyenne Frite', -1),
        ('grandefrite', 'Grande Frite', -1),
        ('sundaynature', 'Sunday Nature', -1),
        ('sundayfraise', 'Sunday Fraise', -1),
	('pizzafroid2', 'Pizza 2 viandes Froid', -1),
        ('pizzafroid3', 'Pizza 3 viandes Froid', -1),
        ('gigapizzafroid', 'Giga Pizza Froid', -1),
        ('pizzafroidxll', 'Pizza XXL Froid', -1),
        ('petitefroidfrite', 'Petite Frite Froid', -1),
        ('moyennefroidfrite', 'Moyenne Frite Froid', -1),
        ('grandefroidfrite', 'Grande Frite Froid', -1),
	('gobeletvide', 'Gobelet vide', -1),
        ('gobeletdecoca', 'Gobelelet de coca', -1),
        ('gobeletdehawai', 'Gobelelet de hawai', -1),
        ('gobeletdeicetea', 'Gobelelet de icetea', -1)

;







