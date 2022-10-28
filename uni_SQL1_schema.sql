CREATE DATABASE uni;

USE uni;


CREATE TABLE lecturer (
  `LecturerID` int NOT NULL AUTO_INCREMENT,
  `LecturerName` varchar(45) DEFAULT NULL,
  `LecturerEmail` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LecturerID`)
); 

EXPLAIN lecturer;

INSERT INTO lecturer VALUES ('1','Michal Kalecki','m.kalecki@miskatonic.ac.us','Economics'),('2','Hannah Relf','h.relf@miskatonic.ac.us','Experimental Theology'),('3','Charles Xavier','c.xavier@miskatonic.ac.us','Biology'),('4','Carol Danvers','c.danvers@miskatonic.ac.us','Physics'),('5','Stephen Strange','s.strange@miskatonic.ac.us','Chemistry'),('6','Makise Kurisu','m.kurisu@miskatonic.ac.us','Physics'),('7','Sylvia Tilly','s.tilly@miskatonic.ac.us','Physics'),('8','Henry Jones','h.jones@miskatonic.ac.us','History'),('9','Makoto Shinkai','m.shinkai@miskatonic.ac.us','Art'),('10','Umetaro Nozaki','u.nozaki@miskatonic.ac.us','Art'),('11','Josiah Bartlet','j.bartlet@miskatonic.ac.us','Economics'),('12','Adrian Veidt','a.veidt@miskatonic.ac.us','Business'),('13','Jay Gatsby','j.gatsby@miskatonic.ac.us','Business'),('14','Edward Elric','e.elric@miskatonic.ac.us','Chemistry'),('15','Daniel Jackson','d.jackson@miskatonic.ac.us','History'),('16','Richard Grimes','r.grimes@miskatonic.ac.us','Social Studies'),('17','Herbert West','h.west@miskatonic.ac.us','Biology');

SELECT * FROM lecturer;

CREATE TABLE course (
  CourseID int NOT NULL AUTO_INCREMENT,
  CourseName varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ;

EXPLAIN course;


INSERT INTO course VALUES (1,'Economics'),(2,'Politics'),(3,'Business'),(4,'Anime'),(5,'Particle Physics'),(6,'Quantum Physics'),(7,'Biology'),(8,'Chemistry'),(9,'Zombiology'),(10,'English Literature'),(11,'History'),(12,'Fine Art'),(13,'Deep-Space Radar Telemetry'),(14,'Deep-Space Radar Telemetry');

SELECT * FROM course;

-- Resumed Work from this point syntax problem with foreign key.

-- Create table module, changes subject to subjects and level to levels.

CREATE TABLE module (
  ModuleID int NOT NULL AUTO_INCREMENT,
  ModuleName varchar(90) DEFAULT NULL,
  Subjects varchar(45) DEFAULT NULL,
  Levels int DEFAULT NULL,
  CourseID int DEFAULT NULL,
  Credits int DEFAULT NULL,
  PRIMARY KEY (`ModuleID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
);

INSERT INTO module VALUES (52,'Macroeconomics','Economics',4,1,20),(53,'Microeconomics','Economics',4,1,20),(54,'Intermediate Macroeconomics','Economics',5,1,20),(55,'Intermediate Microeconomics','Economics',5,1,20),(56,'Advanced Macroeconomics','Economics',6,1,20),(57,'Advanced Microeconomics','Economics',6,1,20),(58,'Business Concepts','Business',4,3,20),(59,'Business Management','Business',5,3,20),(60,'Managing People','Human Resources',5,3,20),(61,'Business Planning','Business',6,3,20),(62,'Advanced Marketing','Marketing',6,3,20),(63,'Neoliberalism','Politics',4,2,20),(64,'Elementary Particles','Physics',5,5,20),(65,'Quantum Field Theory','Physics',5,5,20),(66,'Gobal Political Economy','Politics',4,2,20),(67,'Experimental Theology','Politics',4,2,20),(68,'Urban Survival','Social Studies',4,9,10),(69,'Wasteland Survival','Social Studies',4,9,10),(70,'History of the Undead','Social Studies',5,9,20),(71,'Public House Fortification','Social Studies',5,9,20),(72,'Searching for a Cure','Social Studies',6,9,30),(73,'Creating Compelling Characters','Art',4,4,10),(74,'Understanding the Tsundere','Art',4,4,20),(75,'Animated Landscapes','Art',5,4,20),(76,'Musubi','Art',5,4,30),(77,'Protagonist Hair','Art',6,4,30),(78,'Villainous Father Figures','Art',6,4,30),(79,'Temporal Displacement','Physics',4,6,20),(80,'Micro-blackhole theory','Physics',4,6,20),(81,'Telephonic Microwaves','Physics',5,6,30),(82,'Manipulating Molecular Distance','Physics',5,6,30),(83,'Temporal Displacement and the Temporal Lobe','Physics',6,6,40),(84,'Flora and Fauna','Biology',5,7,30),(85,'Extraterrestrial Flora and Fauna','Biology',6,7,30),(86,'Mitochondria','Biology',4,7,30),(87,'Working with Reanimation Salts','Chemistry',5,8,20),(88,'Extradimensional Colours','Chemistry',4,8,30),(89,'Exothermal Life preservation','Chemistry',6,8,30),(90,'Linguisitc Oddities of the works of Alhazred','English',6,10,20),(91,'Contemporary Critique of the Liber Ivonis','English',5,10,20),(92,'Introduction to Classic American Literature','English',4,10,10),(93,'Non-Euclidian Geometry','Physics',6,6,30),(94,'Understanding the Culture of Dagon','History',4,11,20),(95,'Mythology of the Deep Ones','History',5,11,20),(96,'The King in Yellow','History',6,11,20),(97,'History of Antarctic and oceanic civilisations','History',5,11,30),(98,'Interpretting Elder Script','History',5,11,30),(99,'Exhibition and Visual conext','Art',5,12,10),(100,'Art, space and audience','Art',4,12,10),(101,'Introduction to Art Theory','Art',4,12,20),(102,'Understanding the work of Pickman','Art',6,12,40),(103,'Transmutation and Equivalent Exchange','Chemistry',5,NULL,30),(104,'Alkahestry','Chemistry',4,NULL,30),(105,'String Theory','Physics',6,6,20),(106,'Exotic Matter','Physics',6,6,20),(107,'Harnessing the Einstein-Rosen Bridge','Physics',6,6,20),(108,'Supercollision and Minature Black Holes','Physics',6,6,20),(109,'String Theory','Physics',6,6,20),(110,'Exotic Matter','Physics',6,6,20),(111,'Harnessing the Einstein-Rosen Bridge','Physics',6,6,20),(112,'Supercollision and Minature Black Holes','Physics',6,6,20);

SELECT * FROM module;

-- Create table applications , added an s to orininal for code recognition

CREATE TABLE applications (
  `applicationID` int NOT NULL AUTO_INCREMENT,
  `Forenames` varchar(45) DEFAULT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `EmailAddress` varchar(45) DEFAULT NULL,
  `ContactNumber` varchar(45) DEFAULT NULL,
  `CourseAppliedFor` int DEFAULT NULL,
  `DateOfApplication` date DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`applicationID`),
  KEY `CourseAppliedFor` (`CourseAppliedFor`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`CourseAppliedFor`) REFERENCES `course` (`CourseID`)
) ;

INSERT INTO applications VALUES (1,'Helen','Voight','helen.voight@example.com','07113863093',6,'2020-03-01',417,1),(2,'Dan','Torn','dan.torn@example.com','07343358643',10,'2020-03-01',418,1),(3,'Mena','Temple','mena.temple@example.com','07423198442',10,'2020-03-01',453,1),(4,'Michelle','Mcconaughey','michelle.mcconaughey@example.com','07731140180',7,'2020-03-01',470,1),(5,'Woody','Jolie','woody.jolie@example.com','07678560032',8,'2020-03-01',482,1),(6,'Kenneth','Pesci','kenneth.pesci@example.com','07398910896',6,'2020-03-01',488,1),(7,'Kirsten','Akroyd','kirsten.akroyd@example.com','07478406652',12,'2020-03-01',492,1),(8,'Daryl','Wahlberg','daryl.wahlberg@example.com','07306697895',1,'2020-03-01',495,1),(9,'Susan','Davis','susan.davis@example.com','07143146363',3,'2020-05-01',510,1),(10,'Russell','Bacall','russell.bacall@example.com','07642944749',3,'2020-05-01',512,1),(11,'Liza','Bergman','liza.bergman@example.com','07477342493',11,'2020-05-01',521,1),(12,'Julianne','Dench','julianne.dench@example.com','07250478756',11,'2020-05-01',523,1),(13,'Albert','Nolte','albert.nolte@example.com','07744154365',9,'2020-05-01',525,1),(14,'Rita','Reynolds','rita.reynolds@example.com','07763042958',8,'2020-05-01',535,1),(15,'Morgan','Williams','morgan.williams@example.com','07400678536',8,'2020-05-01',537,1),(16,'Vivien','Basinger','vivien.basinger@example.com','07214236374',3,'2020-05-01',558,1),(17,'Lisa','Monroe','lisa.monroe@example.com','07229556758',8,'2020-05-01',578,1),(18,'Rock','Dukakis','rock.dukakis@example.com','07770279042',2,'2020-05-01',588,1),(19,'Meryl','Allen','meryl.allen@example.com','07568130373',2,'2020-05-01',594,1),(20,'Reese','West','reese.west@example.com','07367397807',9,'2020-05-01',597,1),(32,'John','Smith','john.smith@example.com','07102718993',7,'2020-05-12',0,0),(33,'Sam','Taylor','sam.taylor@example.com','07148971909',11,'2020-02-12',0,0),(34,'Mary','Adams','mary.adams@example.com','07284554234',4,'2020-04-26',0,0),(35,'Nelson','Agholor','nelson.agholor@example.com','07249695274',NULL,'2020-03-01',0,0),(36,'Rosetta','Aguayo','rosetta.aguayo@example.com','07321922632',4,'2020-06-14',0,0),(37,'Henry','Anderson','henry.anderson@example.com','07318048334',10,'2020-01-17',0,0),
(38,'Danielle','Andrews','danielle.andrews@example.com','07537819481',9,'2020-03-09',0,0),(39,'Devin','Asiasi','devin.asiasi@example.com','07576010112',8,'2020-04-08',0,0),(40,'Jessica','Bailey','jessica.bailey@example.com','07598687482',2,'2020-01-19',0,0),(41,'Jasmine','Bentley','jasmine.bentley@example.com','07371777718',8,'2020-05-13',0,0),(42,'Montravius','Zuber','montravius.zuber@example.com','07370723330',7,'2020-04-03',0,0),(43,'Nelson','Zelem','nelson.zelem@example.com','07868619861',8,'2020-06-02',0,0),(44,'Henry','Wynn','henry.wynn@example.com','07808104973',9,'2020-01-06',0,0),(45,'David','Wubben-Moy','david.wubben-moy@example.com','07343808259',6,'2020-04-12',0,0),(46,'Devin','Wise','devin.wise@example.com','07166942677',12,'2020-02-28',0,0),(47,'Jake','Winovich','jake.winovich@example.com','07330702346',8,'2020-02-17',0,0),(48,'Christian','Williamson','christian.williamson@example.com','07484455857',12,'2020-05-14',0,0),(49,'JaWhaun','Williams','jawhaun.williams@example.com','07423125924',9,'2020-03-07',0,0),(50,'Rashod','Williams','rashod.williams@example.com','07398750082',12,'2020-01-29',0,0),(51,'Justin','Wilkerson','justin.wilkerson@example.com','07344881056',4,'2020-04-25',0,0),(52,'Joshuah','White','joshuah.white@example.com','07839367856',5,'2020-05-11',0,1),(53,'Brandon','White','brandon.white@example.com','07586695987',10,'2020-05-04',0,0),(54,'Kendrick','Walsh','kendrick.walsh@example.com','07538340459',11,'2020-08-24',0,0),(55,'Tashawn','Virgin','tashawn.virgin@example.com','07282177739',7,'2020-03-30',0,0),(56,'Trent','Van','trent.van@example.com','07772556092',3,'2020-04-19',0,0),(57,'Myles','Uche','myles.uche@example.com','07587100659',6,'2020-05-18',0,0),(58,'Yodny','Turner','yodny.turner@example.com','07602098481',11,'2020-02-16',0,0),(59,'Joe','Toone','joe.toone@example.com','07265427006',5,'2020-02-09',0,0),(60,'Adrian','Thurman','adrian.thurman@example.com','07755017327',8,'2020-06-06',0,0),(61,'Byron','Taylor','byron.taylor@example.com','07554055656',3,'2020-06-06',0,0),(62,'Korey','Stokes','korey.stokes@example.com','07843788456',2,'2020-01-18',0,0),(63,'Carl','Stidham','carl.stidham@example.com','07737563584',1,'2020-05-31',0,0),
(64,'Cody','Stevenson','cody.stevenson@example.com','07798213360',9,'2020-01-29',0,0),(65,'Kyle','Stanway','kyle.stanway@example.com','07685404583',1,'2020-02-22',0,0),(66,'James','Staniforth','james.staniforth@example.com','07243083603',7,'2020-03-27',0,0),(67,'Nick','Spence','nick.spence@example.com','07323314295',6,'2020-06-22',0,0),(68,'Troy','Sonnett','troy.sonnett@example.com','07478395517',2,'2020-03-17',0,0),(69,'Tyler','Smith','tyler.smith@example.com','07613140776',7,'2020-03-27',0,0),(70,'Stephon','Smith','stephon.smith@example.com','07383733874',3,'2020-03-28',0,0),(71,'Davon','Slater','davon.slater@example.com','07354063893',8,'2020-02-04',0,0),(72,'Lawrence','Simon','lawrence.simon@example.com','07210674138',2,'2020-03-10',0,0),(73,'Marvin','Sherman','marvin.sherman@example.com','07659153304',11,'2020-04-11',0,0),(74,'Terez','Scott','terez.scott@example.com','07379030546',3,'2020-06-27',0,0),(75,'Damien','Sauerbrunn','damien.sauerbrunn@example.com','07811862091',5,'2020-04-28',0,0),(76,'Keal','Salmon','keal.salmon@example.com','07379369615',9,'2020-01-14',0,0),(77,'Hunter','Russo','hunter.russo@example.com','07865540242',7,'2020-05-14',0,0),(78,'Justin','Ross','justin.ross@example.com','07113299070',1,'2020-01-15',0,0),(79,'Donta','Ross','donta.ross@example.com','07199409493',9,'2020-05-09',0,0),(80,'Brian','Roebuck','brian.roebuck@example.com','07526858169',8,'2020-05-30',0,0),(81,'J.C.','Redmond','j.c..redmond@example.com','07217950961',12,'2020-04-19',0,0),(82,'Michael','Rapinoe','michael.rapinoe@example.com','07155133598',12,'2020-03-22',0,0),(83,'Anfernee','Ramsey','anfernee.ramsey@example.com','07684522243',7,'2020-03-05',0,0),(84,'Jakob','Prince','jakob.prince@example.com','07489825548',NULL,'2020-04-13',0,0),(85,'Jonathan','Press','jonathan.press@example.com','07496397112',4,'2020-02-24',0,0),(86,'Mac','Phillips','mac.phillips@example.com','07870319339',NULL,'2020-02-23',0,0),(87,'Matt','Perkins','matt.perkins@example.com','07165753345',8,'2020-06-21',0,0),(88,'Ted','Parris','ted.parris@example.com','07839806137',11,'2020-08-29',0,0),(89,'Dalton','Onwenu','dalton.onwenu@example.com','07207733954',11,'2020-08-19',0,0),
(90,'Brandon','Olszewski','brandon.olszewski@example.com','07183613738',8,'2020-01-18',0,0),(91,'Matt','O’Hara','matt.o’hara@example.com','07711083595',1,'2020-03-12',0,0),(92,'Harvey','Nordin','harvey.nordin@example.com','07436197851',10,'2020-03-20',0,0),(93,'Marcus','Nobbs','marcus.nobbs@example.com','07768774896',8,'2020-02-27',0,0),(94,'Shaq','Nixon','shaq.nixon@example.com','07878793982',8,'2020-04-04',0,0),(95,'Devin','Newton','devin.newton@example.com','07505523453',5,'2020-02-21',0,0),(96,'Cameron','Naeher','cameron.naeher@example.com','07201318326',12,'2020-06-21',0,0),(97,'Raekwon','Murray','raekwon.murray@example.com','07679375338',3,'2020-03-19',0,0),(98,'Jakobi','Morgan','jakobi.morgan@example.com','07894786016',8,'2020-04-21',0,0),(99,'Sony','Morgan','sony.morgan@example.com','07606563947',1,'2020-01-28',0,0),(100,'Jalen','Mills','jalen.mills@example.com','07725198204',1,'2020-04-27',0,0),(101,'Bill','Michel','bill.michel@example.com','07833447800',8,'2020-06-15',0,0),(102,'Cam','Meyers','cam.meyers@example.com','07104029752',4,'2020-02-13',0,0),(103,'Tre','Mewis','tre.mewis@example.com','07573515927',12,'2020-04-23',0,0),(104,'Quinn','Mewis','quinn.mewis@example.com','07631560370',3,'2020-05-10',0,0),(105,'Gunner','Mead','gunner.mead@example.com','07168744708',2,'2020-05-24',0,0),(106,'Mike','McMillan','mike.mcmillan@example.com','07385449700',3,'2020-06-27',0,0),(107,'Ronnie','McManus','ronnie.mcmanus@example.com','07464874264',10,'2020-04-12',0,0),(108,'Adrian','McGrone','adrian.mcgrone@example.com','07452415692',5,'2020-05-26',0,0),(109,'R.J.','McCourty','r.j..mccourty@example.com','07206850224',10,'2020-02-13',0,0),(110,'Alex','Mason','alex.mason@example.com','07523728693',2,'2020-05-28',0,0),(111,'Angelo','Martin','angelo.martin@example.com','07683395574',11,'2020-09-13',0,0),(112,'Devin','MacIver','devin.maciver@example.com','07248754995',5,'2020-02-21',0,0),(113,'Will','Macario','will.macario@example.com','07746940613',6,'2020-04-25',0,0),(114,'Matthew','Lloyd','matthew.lloyd@example.com','07331548053',11,'2020-09-27',0,0),(115,'Devin','Lavelle','devin.lavelle@example.com','07460570062',4,'2020-03-01',0,0),
(116,'Jonnu','Langi','jonnu.langi@example.com','07568858922',5,'2020-04-29',0,0),(117,'Akeem','LaCosse','akeem.lacosse@example.com','07317347098',6,'2020-06-13',0,0),(118,'Rhamondre','Krueger','rhamondre.krueger@example.com','07724919933',10,'2020-03-20',0,0),(119,'Jarrett','Kirby','jarrett.kirby@example.com','07895888844',12,'2020-01-07',0,0),(120,'J.J.','King','j.j..king@example.com','07787814166',8,'2020-04-24',0,0),(121,'Nick','Kelly','nick.kelly@example.com','07843691601',4,'2020-06-06',0,0),(122,'Josh','Keene','josh.keene@example.com','07245139783',11,'2020-05-25',0,1),(123,'Kyle','Karras','kyle.karras@example.com','07642931103',7,'2020-01-05',0,0),(124,'Dee','Judon','dee.judon@example.com','07129738524',3,'2020-04-11',0,0),(125,'James','Jones','james.jones@example.com','07202647498',3,'2020-05-25',0,0),(126,'Kristian','Jones','kristian.jones@example.com','07233811665',4,'2020-03-08',0,0),(127,'Joejuan','Johnson','joejuan.johnson@example.com','07822900453',10,'2020-05-26',0,0),(128,'Chase','Jennings','chase.jennings@example.com','07403420041',6,'2020-05-17',0,0),(129,'Deatrich','James','deatrich.james@example.com','07834586922',NULL,'2020-06-09',0,0),(130,'Isaiah','Jackson','isaiah.jackson@example.com','07812192839',6,'2020-04-07',0,0),(131,'Isaiah','Jackson','isaiah.jackson@example.com','07582498872',NULL,'2020-01-22',0,0),(132,'Patrick','Hoyer','patrick.hoyer@example.com','07689355828',11,'2020-01-12',0,1),(133,'Julian','Houghton','julian.houghton@example.com','07247970694',NULL,'2020-03-27',0,0),(134,'Shilique','Horan','shilique.horan@example.com','07641232753',11,'2020-08-14',0,0),(135,'Jermaine','Hightower','jermaine.hightower@example.com','07205831110',8,'2020-06-19',0,0),(136,'John','Herron','john.herron@example.com','07384612273',6,'2020-03-12',0,0),(137,'Adrianna','Henry','adrianna.henry@example.com','07269022484',1,'2020-02-20',0,0),(138,'Alyssa','Hemp','alyssa.hemp@example.com','07558192286',6,'2020-05-04',0,0),(139,'Abby','Heath','abby.heath@example.com','07850014839',4,'2020-04-01',0,0),(140,'Tierna','Harry','tierna.harry@example.com','07279037552',NULL,'2020-04-25',0,0),(141,'Crystal','Harris','crystal.harris@example.com','07558658320',11,'2020-05-15',0,1),
(142,'Kelley','Hampton','kelley.hampton@example.com','07154822676',3,'2020-06-06',0,0),(143,'Becky','Hall','becky.hall@example.com','07606109023',6,'2020-02-25',0,1),(144,'Emily','Hall','emily.hall@example.com','07432177394',2,'2020-06-22',0,0),(145,'Julie','Guy','julie.guy@example.com','07835570716',10,'2020-01-30',0,0),(146,'Lindsey','Greenwood','lindsey.greenwood@example.com','07732518117',3,'2020-03-02',0,0),(147,'Rose','Godchaux','rose.godchaux@example.com','07631139941',NULL,'2020-04-05',0,0),(148,'Kristie','Gilmore','kristie.gilmore@example.com','07794206828',12,'2020-04-08',0,0),(149,'Samantha','Gaffney','samantha.gaffney@example.com','07740317782',8,'2020-01-15',0,0),(150,'Tobin','Fumagalli','tobin.fumagalli@example.com','07238870462',10,'2020-03-20',0,0),(151,'Carli','Franch','carli.franch@example.com','07156408889',2,'2020-02-12',0,0),(152,'Alex','Folk','alex.folk@example.com','07829271648',4,'2020-05-21',0,0),(153,'Christen','Fisk','christen.fisk@example.com','07570806486',4,'2020-05-26',0,0),(154,'Megan','Ferentz','megan.ferentz@example.com','07492776705',3,'2020-04-09',0,0),(155,'Jane','Ertz','jane.ertz@example.com','07856282084',1,'2020-02-22',0,0),(156,'Casey','England','casey.england@example.com','07278157552',4,'2020-01-16',0,0),(157,'Catarina','Eluemunor','catarina.eluemunor@example.com','07650549195',7,'2020-01-19',0,0),(158,'Lynn','Edelman','lynn.edelman@example.com','07272228678',8,'2020-06-11',0,0),(159,'Ellie','Dunn','ellie.dunn@example.com','07894485178',8,'2020-05-31',0,0),(160,'Sandy','Dugger','sandy.dugger@example.com','07430219321',9,'2020-06-20',0,0),(161,'Hannah','Davis','hannah.davis@example.com','07133903485',7,'2020-04-03',0,0),(162,'Emily','Davis','emily.davis@example.com','07177987641',7,'2020-01-14',0,0),(163,'Steph','Davidson','steph.davidson@example.com','07741888623',11,'2020-02-17',0,1),(164,'Lucy','Daly','lucy.daly@example.com','07793243295',5,'2020-01-24',0,0),(165,'Demi','Dahlkemper','demi.dahlkemper@example.com','07712012901',1,'2020-05-24',0,0),(166,'Millie','Cunningham','millie.cunningham@example.com','07590897060',12,'2020-05-24',0,0),(167,'Rachel','Cowart','rachel.cowart@example.com','07121546374',3,'2020-03-31',0,0),
(168,'Leah','Coombs','leah.coombs@example.com','07161860688',1,'2020-05-16',0,0),(169,'Lotte','Colbert','lotte.colbert@example.com','07113365616',11,'2020-06-22',0,0),(170,'Jill','Chung','jill.chung@example.com','07450049366',NULL,'2020-02-04',0,0),(171,'Keira','Christiansen','keira.christiansen@example.com','07205424951',6,'2020-05-07',0,0),(172,'Niamh','Charles','niamh.charles@example.com','07750476674',2,'2020-04-22',0,0),(173,'Ellen','Cardona','ellen.cardona@example.com','07566307613',9,'2020-03-06',0,0),(174,'Nikita','Campbell','nikita.campbell@example.com','07162557983',4,'2020-03-20',0,0),(175,'Fran','Calhoun','fran.calhoun@example.com','07717455395',3,'2020-03-04',0,0),(176,'Georgia','Cajuste','georgia.cajuste@example.com','07418690008',9,'2020-04-18',0,0),(177,'Lauren','Bryant','lauren.bryant@example.com','07482766896',6,'2020-06-06',0,0),(178,'Karen','Brown','karen.brown@example.com','07882836549',3,'2020-04-07',0,0),(179,'Alex','Bronze','alex.bronze@example.com','07553477950',NULL,'2020-01-09',0,0),(180,'Esme','Bright','esme.bright@example.com','07283254733',9,'2020-03-25',0,0),(181,'Millie','Bower','millie.bower@example.com','07661877865',6,'2020-05-07',0,1),(182,'Abbie','Bourne','abbie.bourne@example.com','07682634411',11,'2020-08-20',0,0),(183,'Grace','Bolden','grace.bolden@example.com','07305026839',3,'2020-05-31',0,0),(184,'Jordan','Bledsoe','jordan.bledsoe@example.com','07177050374',NULL,'2020-05-31',0,0),(185,'Lucy','Bethel','lucy.bethel@example.com','07458834605',9,'2020-06-09',0,0),(186,'Laura','Berry','laura.berry@example.com','07685794904',12,'2020-04-08',0,0),(187,'Katie','Bentley','katie.bentley@example.com','07216792137',7,'2020-01-12',0,0),(188,'Izzy','Barmore','izzy.barmore@example.com','07899470858',10,'2020-03-18',0,0),(189,'Ella','Bardsley','ella.bardsley@example.com','07648875185',10,'2020-02-25',0,0),(190,'Beth','Bailey','beth.bailey@example.com','07310686288',NULL,'2020-06-23',0,0),(191,'Bethany','Babajide','bethany.babajide@example.com','07241061061',11,'2020-08-02',0,0),(192,'Chloe','Asiasi','chloe.asiasi@example.com','07443800375',3,'2020-02-13',0,0),(193,'Ebony','Andrews','ebony.andrews@example.com','07880977643',7,'2020-01-22',0,0),
(194,'Rinsola','Anderson','rinsola.anderson@example.com','07380491363',7,'2020-02-15',0,0),(195,'Lauren','Agholor','lauren.agholor@example.com','07484178413',12,'2020-02-08',0,0),(196,'Alessia','Adams','alessia.adams@example.com','07272948118',NULL,'2020-05-25',0,0);

SELECT * FROM applications;

-- Create table class 

CREATE TABLE class (
  ClassID int NOT NULL AUTO_INCREMENT,
  LecturerID int DEFAULT NULL,
  ModuleID int DEFAULT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `LecturerID` (`LecturerID`),
  KEY `ModuleID` (`ModuleID`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`LecturerID`) REFERENCES `lecturer` (`LecturerID`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`)
) ;

INSERT INTO class VALUES (1,1,52),(2,1,53),(3,1,54),(4,1,55),(5,1,56),(6,1,57),(7,11,52),(8,11,53),(9,11,54),(10,11,55),(11,11,56),(12,11,57),(13,12,58),(14,12,59),(15,12,60),(16,12,61),(17,12,62),(18,13,58),(19,13,59),(20,13,60),(21,13,61),(22,13,62),(23,11,63),(24,4,64),(25,7,64),(26,6,65),(27,7,65),(28,11,66),(29,1,66),(30,2,67),(31,16,68),(32,16,69),(33,16,70),(34,16,71),(35,16,72),(36,9,73),(37,9,74),(38,9,75),(39,9,76),(40,9,77),(41,9,78),(42,10,73),(43,10,74),(44,10,75),(45,10,76),(46,10,77),(47,10,78),(48,4,79),(49,6,79),(50,7,79),(51,6,80),(52,7,80),(53,6,81),(54,7,81),(55,7,82),(56,6,83),(57,3,84),(58,17,84),(59,3,85),(60,17,85),(61,3,86),(62,17,86),(63,17,87),(64,14,87),(65,5,88),(66,14,88),(67,17,88),(68,17,89),(69,8,90),(70,8,91),(71,8,92),(72,15,90),(73,15,91),(74,15,92),(75,7,93),(76,5,93),(77,8,94),(78,8,95),(79,8,96),(80,8,97),(81,8,98),(82,15,94),(83,15,95),(84,15,96),(85,15,97),(86,15,98),(87,9,99),(88,9,100),(89,9,101),(90,9,102),(91,10,99),(92,10,100),(93,10,101),(94,10,102);

SELECT * FROM class;

-- Create table club

CREATE TABLE club (
  ClubID int NOT NULL AUTO_INCREMENT,
  ClubName varchar(90) DEFAULT NULL,
  JoiningFee int DEFAULT NULL,
  MembershipFee int DEFAULT NULL,
  EquipmentFee int DEFAULT NULL,
  SupervisingStaff int DEFAULT NULL,
  Active tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ClubID`),
  KEY `SupervisingStaff` (`SupervisingStaff`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`SupervisingStaff`) REFERENCES `lecturer` (`LecturerID`)
) ;

INSERT INTO club VALUES (1,'Democracy Club',10,0,0,11,1),(2,'Law Society',10,20,10,2,0),(3,'Airsoft Club',10,20,50,16,1),(4,'Animal Lovers',10,10,0,6,1),(5,'Dog Walkers',10,10,0,6,1),(6,'Anime and Manga Society',10,20,0,9,1),(7,'Cooking and Baking Club',10,30,15,10,0),(8,'Canoe Club',20,50,150,12,0),(9,'Chess Club',10,10,10,12,1),
(10,'Mysteries and Adventure Club',50,200,25,15,1),(11,'Scifi Fan Club',10,10,10,7,1),(12,'Ecology and Nature Club',10,10,0,7,1),(13,'Film Club',10,10,0,7,1),(14,'Gaming Club',20,10,0,4,1),(15,'Horror and Eldritch Horror Club',30,100,250,4,1),(16,'International Studies Society',10,10,5,8,1),(17,'Japanese Society',20,10,5,10,0),
(18,'Crafting Society',10,10,0,14,0),(19,'Marine Life Conservation Society',20,10,100,3,0),(20,'Palaeontology and Cloning Society',40,20,175,14,1),(21,'Photography Society',10,10,150,15,1),(22,'Reading Club',10,10,0,1,1),
(23,'Skyward Networks and Robotics Society',10,25,60,12,0),(24,'Roleplaying Society',20,20,10,5,1),(25,'Video Games and E Sports Club',10,20,0,13,1),(26,'American Football Team',10,10,150,13,1),(27,'Football Club',10,10,75,16,0),
(28,'Tennis Club',10,10,60,4,1),(29,'Swimming Club',10,20,45,4,1),(30,'Hockey Club',10,10,65,10,1);

SELECT * FROM club;

-- Create table FILE_BLOCK_SIZE

CREATE TABLE fees (
  FeeID int NOT NULL AUTO_INCREMENT,
  CourseID int DEFAULT NULL,
  FullTimeFee int DEFAULT NULL,
  PartTimeFee int DEFAULT NULL,
  ScholarshipDiscount int DEFAULT NULL,
  FeeYear year DEFAULT NULL,
  PRIMARY KEY (`FeeID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
) ;

INSERT INTO fees VALUES (1,1,12000,8400,1500,2020),(2,2,6000,4200,500,2020),(3,3,10000,7000,600,2020),(4,4,11000,8400,550,2020),(5,5,4000,2800,2000,2020),(6,6,12000,8400,1800,2020),(7,7,6000,4200,300,2020),(8,8,6000,4200,200,2020),(9,9,10000,7000,0,2020),(10,10,6000,4200,0,2020),(11,11,10000,7000,150,2020),(12,12,8000,5600,800,2020);

SELECT * FROM fees;

-- Creat table student

CREATE TABLE student (
  StudentID int NOT NULL AUTO_INCREMENT,
  CourseID int DEFAULT NULL,
  Forenames varchar(45) DEFAULT NULL,
  Surname varchar(45) DEFAULT NULL,
  DateOfBirth date DEFAULT NULL,
  EmailAddress varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
);


INSERT INTO student VALUES (401,12,'Penelope','Guiness','2001-12-27','penelope.guiness@example.com'),(402,1,'Nick','Wahlberg','2001-05-17','nick.wahlberg@example.com'),(403,9,'Ed','Chase','2002-05-10','ed.chase@example.com'),(404,NULL,'Jennifer','Davis','2002-08-04','jennifer.davis@example.com'),(405,1,'Johnny','Lollobrigida','2000-09-23','johnny.lollobrigida@example.com'),(406,1,'Bette','Nicholson','2001-10-31','bette.nicholson@example.com'),(407,7,'Grace','Mostel','2002-04-20','grace.mostel@example.com'),(408,3,'Matthew','Johansson','2001-03-06','matthew.johansson@example.com'),(409,5,'Joe','Swank','2001-10-26','joe.swank@example.com'),
(410,7,'Christian','Gable','2001-03-19','christian.gable@example.com'),(411,3,'Zero','Cage','2000-10-17','zero.cage@example.com'),(412,12,'Karl','Berry','2002-02-09','karl.berry@example.com'),(413,6,'Uma','Wood','2001-10-08','uma.wood@example.com'),(414,NULL,'Vivien','Bergen','2000-10-13','vivien.bergen@example.com'),(415,12,'Cuba','Olivier','2000-09-20','cuba.olivier@example.com'),(416,3,'Fred','Costner','2001-12-14','fred.costner@example.com'),(417,6,'Helen','Voight','2002-07-28','helen.voight@example.com'),(418,10,'Dan','Torn','2002-02-19','dan.torn@example.com'),(419,12,'Bob','Fawcett','2002-03-08','bob.fawcett@example.com'),(420,6,'Lucille','Tracy','2001-04-25','lucille.tracy@example.com'),
(421,9,'Kirsten','Paltrow','2001-02-14','kirsten.paltrow@example.com'),(422,NULL,'Elvis','Marx','2001-11-23','elvis.marx@example.com'),(423,5,'Sandra','Kilmer','2002-04-19','sandra.kilmer@example.com'),(424,5,'Cameron','Streep','2002-01-26','cameron.streep@example.com'),(425,9,'Kevin','Bloom','2002-02-15','kevin.bloom@example.com'),(426,2,'Rip','Crawford','2001-01-03','rip.crawford@example.com'),(427,4,'Julia','Mcqueen','2001-02-19','julia.mcqueen@example.com'),
(428,8,'Woody','Hoffman','2002-07-05','woody.hoffman@example.com'),(429,12,'Alec','Wayne','2001-09-25','alec.wayne@example.com'),(430,5,'Sandra','Peck','2002-07-27','sandra.peck@example.com'),(431,1,'Sissy','Sobieski','2001-01-03','sissy.sobieski@example.com'),(432,7,'Tim','Hackman','2001-10-03','tim.hackman@example.com'),(433,8,'Milla','Peck','2002-08-23','milla.peck@example.com'),(434,4,'Audrey','Olivier','2001-10-04','audrey.olivier@example.com'),
(435,10,'Judy','Dean','2001-12-13','judy.dean@example.com'),(436,5,'Burt','Dukakis','2002-03-13','burt.dukakis@example.com'),(437,6,'Val','Bolger','2002-08-11','val.bolger@example.com'),(438,3,'Tom','Mckellen','2001-06-25','tom.mckellen@example.com'),(439,4,'Goldie','Brody','2002-04-16','goldie.brody@example.com'),(440,3,'Johnny','Cage','2002-07-18','johnny.cage@example.com'),(441,1,'Jodie','Degeneres','2001-05-18','jodie.degeneres@example.com'),
(442,8,'Tom','Miranda','2001-10-19','tom.miranda@example.com'),(443,4,'Kirk','Jovovich','2001-01-26','kirk.jovovich@example.com'),(444,11,'Nick','Stallone','2001-05-28','nick.stallone@example.com'),(445,5,'Reese','Kilmer','2001-01-18','reese.kilmer@example.com'),(446,7,'Parker','Goldberg','2002-02-07','parker.goldberg@example.com'),(447,6,'Julia','Barrymore','2002-07-02','julia.barrymore@example.com'),(448,6,'Frances','Day-Lewis','2000-10-25','frances.day-lewis@example.com'),(449,10,'Anne','Cronyn','2000-12-20','anne.cronyn@example.com'),(450,4,'Natalie','Hopkins','2001-02-23','natalie.hopkins@example.com'),(451,5,'Gary','Phoenix','2001-11-19','gary.phoenix@example.com'),
(452,8,'Carmen','Hunt','2002-01-07','carmen.hunt@example.com'),(453,10,'Mena','Temple','2002-06-05','mena.temple@example.com'),(454,6,'Penelope','Pinkett','2001-12-28','penelope.pinkett@example.com'),(455,9,'Fay','Kilmer','2001-03-24','fay.kilmer@example.com'),(456,10,'Dan','Harris','2002-08-29','dan.harris@example.com'),(457,7,'Jude','Cruise','2001-10-14','jude.cruise@example.com'),(458,4,'Christian','Akroyd','2002-08-29','christian.akroyd@example.com'),
(459,9,'Dustin','Tautou','2001-03-19','dustin.tautou@example.com'),(460,5,'Henry','Berry','2002-02-23','henry.berry@example.com'),(461,3,'Christian','Neeson','2002-02-05','christian.neeson@example.com'),(462,7,'Jayne','Neeson','2000-10-11','jayne.neeson@example.com'),(463,9,'Cameron','Wray','2002-01-16','cameron.wray@example.com'),(464,7,'Ray','Johansson','2001-05-13','ray.johansson@example.com'),(465,12,'Angela','Hudson','2001-07-11','angela.hudson@example.com'),
(466,3,'Mary','Tandy','2000-10-17','mary.tandy@example.com'),(467,11,'Jessica','Bailey','2002-05-17','jessica.bailey@example.com'),(468,5,'Rip','Winslet','2001-07-14','rip.winslet@example.com'),(469,9,'Kenneth','Paltrow','2002-02-08','kenneth.paltrow@example.com'),(470,7,'Michelle','Mcconaughey','2001-06-01','michelle.mcconaughey@example.com'),(471,3,'Adam','Grant','2000-12-21','adam.grant@example.com'),(472,12,'Sean','Williams','2000-09-28','sean.williams@example.com'),(473,2,'Gary','Penn','2001-12-31','gary.penn@example.com'),(474,10,'Milla','Keitel','2002-04-18','milla.keitel@example.com'),(475,8,'Burt','Posey','2001-02-23','burt.posey@example.com'),
(476,5,'Angelina','Astaire','2001-08-10','angelina.astaire@example.com'),(477,3,'Cary','Mcconaughey','2002-03-08','cary.mcconaughey@example.com'),(478,10,'Groucho','Sinatra','2002-02-18','groucho.sinatra@example.com'),(479,2,'Mae','Hoffman','2001-02-04','mae.hoffman@example.com'),(480,1,'Ralph','Cruz','2001-06-30','ralph.cruz@example.com'),(481,4,'Scarlett','Damon','2001-11-24','scarlett.damon@example.com'),(482,8,'Woody','Jolie','2002-02-24','woody.jolie@example.com'),(483,4,'Ben','Willis','2000-12-08','ben.willis@example.com'),(484,9,'James','Pitt','2001-08-12','james.pitt@example.com'),(485,7,'Minnie','Zellweger','2000-10-11','minnie.zellweger@example.com'),
(486,6,'Greg','Chaplin','2001-05-09','greg.chaplin@example.com'),(487,11,'Spencer','Peck','2001-10-07','spencer.peck@example.com'),(488,6,'Kenneth','Pesci','2001-10-16','kenneth.pesci@example.com'),(489,12,'Charlize','Dench','2001-01-04','charlize.dench@example.com'),(490,7,'Sean','Guiness','2001-11-25','sean.guiness@example.com'),(491,8,'Christopher','Berry','2002-03-29','christopher.berry@example.com'),(492,12,'Kirsten','Akroyd','2001-12-11','kirsten.akroyd@example.com'),(493,8,'Ellen','Presley','2001-05-19','ellen.presley@example.com'),(494,9,'Kenneth','Torn','2002-06-21','kenneth.torn@example.com'),(495,1,'Daryl','Wahlberg','2001-04-29','daryl.wahlberg@example.com'),
(496,11,'Gene','Willis','2002-03-21','gene.willis@example.com'),(497,2,'Meg','Hawke','2001-11-18','meg.hawke@example.com'),(498,12,'Chris','Bridges','2002-01-15','chris.bridges@example.com'),(499,4,'Jim','Mostel','2002-05-04','jim.mostel@example.com'),(500,2,'Spencer','Depp','2002-04-13','spencer.depp@example.com'),(501,4,'Susan','Davis','2001-09-21','susan.davis@example.com'),(502,11,'Walter','Torn','2001-10-01','walter.torn@example.com'),
(503,10,'Matthew','Leigh','2001-02-28','matthew.leigh@example.com'),(504,6,'Penelope','Cronyn','2001-06-06','penelope.cronyn@example.com'),(505,8,'Sidney','Crowe','2002-07-06','sidney.crowe@example.com'),(506,3,'Groucho','Dunst','2001-05-27','groucho.dunst@example.com'),(507,4,'Gina','Degeneres','2002-04-24','gina.degeneres@example.com'),(508,1,'Warren','Nolte','2001-11-19','warren.nolte@example.com'),(509,7,'Sylvester','Dern','2001-07-14','sylvester.dern@example.com'),(510,3,'Susan','Davis','2001-09-16','susan.davis@example.com'),(511,11,'Cameron','Zellweger','2001-12-07','cameron.zellweger@example.com'),
(512,3,'Russell','Bacall','2001-06-06','russell.bacall@example.com'),(513,7,'Morgan','Hopkins','2001-04-27','morgan.hopkins@example.com'),(514,6,'Morgan','Mcdormand','2001-12-30','morgan.mcdormand@example.com'),(515,2,'Harrison','Bale','2001-11-23','harrison.bale@example.com'),(516,2,'Dan','Streep','2001-04-29','dan.streep@example.com'),(517,4,'Renee','Tracy','2001-11-10','renee.tracy@example.com'),(518,6,'Cuba','Allen','2002-05-27','cuba.allen@example.com'),(519,2,'Warren','Jackman','2002-07-08','warren.jackman@example.com'),(520,8,'Penelope','Monroe','2002-08-23','penelope.monroe@example.com'),(521,11,'Liza','Bergman','2001-08-14','liza.bergman@example.com'),
(522,5,'Salma','Nolte','2001-07-23','salma.nolte@example.com'),(523,11,'Julianne','Dench','2001-10-14','julianne.dench@example.com'),(524,2,'Scarlett','Bening','2001-08-30','scarlett.bening@example.com'),(525,9,'Albert','Nolte','2001-11-25','albert.nolte@example.com'),(526,3,'Frances','Tomei','2001-04-17','frances.tomei@example.com'),(527,6,'Kevin','Garland','2002-06-16','kevin.garland@example.com'),(528,9,'Cate','Mcqueen','2002-03-08','cate.mcqueen@example.com'),
(529,5,'Daryl','Crawford','2001-12-17','daryl.crawford@example.com'),(530,9,'Greta','Keitel','2001-04-25','greta.keitel@example.com'),(531,2,'Jane','Jackman','2002-05-02','jane.jackman@example.com'),(532,1,'Adam','Hopper','2001-09-12','adam.hopper@example.com'),(533,2,'Richard','Penn','2001-05-01','richard.penn@example.com'),(534,3,'Gene','Hopkins','2002-03-16','gene.hopkins@example.com'),(535,8,'Rita','Reynolds','2001-02-27','rita.reynolds@example.com'),
(536,9,'Ed','Mansfield','2000-12-16','ed.mansfield@example.com'),(537,8,'Morgan','Williams','2001-09-06','morgan.williams@example.com'),(538,2,'Lucille','Dee','2000-09-14','lucille.dee@example.com'),(539,11,'Ewan','Gooding','2002-08-21','ewan.gooding@example.com'),(540,9,'Whoopi','Hurt','2001-12-30','whoopi.hurt@example.com'),(541,11,'Cate','Harris','2001-03-20','cate.harris@example.com'),(542,2,'Jada','Ryder','2000-11-20','jada.ryder@example.com'),
(543,10,'River','Dean','2000-12-21','river.dean@example.com'),(544,4,'Angela','Witherspoon','2001-08-17','angela.witherspoon@example.com'),(545,5,'Kim','Allen','2000-11-11','kim.allen@example.com'),(546,10,'Albert','Johansson','2002-02-05','albert.johansson@example.com'),(547,6,'Fay','Winslet','2000-10-11','fay.winslet@example.com'),(548,2,'Emily','Dee','2001-04-14','emily.dee@example.com'),(549,12,'Russell','Temple','2001-09-06','russell.temple@example.com'),
(550,4,'Jayne','Nolte','2001-03-27','jayne.nolte@example.com'),(551,4,'Geoffrey','Heston','2001-11-28','geoffrey.heston@example.com'),(552,2,'Ben','Harris','2002-04-16','ben.harris@example.com'),(553,9,'Minnie','Kilmer','2001-06-12','minnie.kilmer@example.com'),(554,9,'Meryl','Gibson','2001-01-23','meryl.gibson@example.com'),(555,2,'Ian','Tandy','2001-05-27','ian.tandy@example.com'),(556,12,'Fay','Wood','2002-01-19','fay.wood@example.com'),
(557,3,'Greta','Malden','2000-12-28','greta.malden@example.com'),(558,3,'Vivien','Basinger','2002-02-16','vivien.basinger@example.com'),(559,11,'Laura','Brody','2001-03-12','laura.brody@example.com'),(560,5,'Chris','Depp','2002-06-08','chris.depp@example.com'),(561,10,'Harvey','Hope','2001-12-20','harvey.hope@example.com'),(562,8,'Oprah','Kilmer','2002-01-22','oprah.kilmer@example.com'),(563,7,'Christopher','West','2002-07-30','christopher.west@example.com'),
(564,3,'Humphrey','Willis','2002-08-25','humphrey.willis@example.com'),(565,5,'Al','Garland','2002-01-07','al.garland@example.com'),(566,1,'Nick','Degeneres','2001-04-07','nick.degeneres@example.com'),(567,5,'Laurence','Bullock','2002-03-02','laurence.bullock@example.com'),(568,5,'Will','Wilson','2002-01-15','will.wilson@example.com'),(569,4,'Kenneth','Hoffman','2001-11-27','kenneth.hoffman@example.com'),(570,6,'Mena','Hopper','2001-11-11','mena.hopper@example.com'),(571,11,'Olympia','Pfeiffer','2000-09-13','olympia.pfeiffer@example.com'),(572,5,'Groucho','Williams','2002-05-06','groucho.williams@example.com'),(573,10,'Alan','Dreyfuss','2002-06-24','alan.dreyfuss@example.com'),
(574,10,'Michael','Bening','2001-04-25','michael.bening@example.com'),(575,6,'William','Hackman','2001-07-05','william.hackman@example.com'),(576,7,'Jon','Chase','2002-05-22','jon.chase@example.com'),(577,11,'Gene','Mckellen','2001-05-21','gene.mckellen@example.com'),(578,8,'Lisa','Monroe','2002-03-04','lisa.monroe@example.com'),(579,6,'Ed','Guiness','2001-04-09','ed.guiness@example.com'),(580,3,'Jeff','Silverstone','2002-08-29','jeff.silverstone@example.com'),
(581,2,'Matthew','Carrey','2001-11-19','matthew.carrey@example.com'),(582,4,'Debbie','Akroyd','2001-08-23','debbie.akroyd@example.com'),(583,11,'Russell','Close','2001-05-06','russell.close@example.com'),
(584,2,'Humphrey','Garland','2002-05-20','humphrey.garland@example.com'),(585,7,'Michael','Bolger','2001-05-04','michael.bolger@example.com'),(586,12,'Julia','Zellweger','2002-06-02','julia.zellweger@example.com'),(587,2,'Renee','Ball','2001-08-13','renee.ball@example.com'),(588,2,'Rock','Dukakis','2002-07-04','rock.dukakis@example.com'),(589,10,'Cuba','Birch','2002-01-06','cuba.birch@example.com'),(590,7,'Audrey','Bailey','2001-07-26','audrey.bailey@example.com'),(591,4,'Gregory','Gooding','2002-08-30','gregory.gooding@example.com'),(592,5,'John','Suvari','2000-12-09','john.suvari@example.com'),(593,3,'Burt','Temple','2001-06-21','burt.temple@example.com'),
(594,2,'Meryl','Allen','2002-06-04','meryl.allen@example.com'),(595,8,'Jayne','Silverstone','2002-05-21','jayne.silverstone@example.com'),(596,1,'Bela','Walken','2000-09-27','bela.walken@example.com'),(597,9,'Reese','West','2001-10-23','reese.west@example.com'),(598,2,'Mary','Keitel','2002-07-22','mary.keitel@example.com'),(599,4,'Julia','Fawcett','2001-10-12','julia.fawcett@example.com'),(600,3,'Thora','Temple','2002-05-17','thora.temple@example.com'),
(601,11,'Josh','Keene',NULL,'josh.keene@example.com'),(602,11,'Patrick','Hoyer',NULL,'patrick.hoyer@example.com'),(603,11,'Crystal','Harris',NULL,'crystal.harris@example.com'),(604,11,'Steph','Davidson',NULL,'steph.davidson@example.com');

SELECT * FROM student;

-- Create table registration

CREATE TABLE registration (
  RegID int NOT NULL AUTO_INCREMENT,
  StudentID int DEFAULT NULL,
  ClassID int DEFAULT NULL,
  PRIMARY KEY (`RegID`),
  KEY `StudentID` (`StudentID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`)
);

INSERT INTO registration VALUES (1,402,1),(2,405,1),(3,406,1),(4,431,1),(5,441,1),(6,480,1),(7,495,7),(8,508,7),(9,532,7),(10,566,7),(11,596,7),(12,402,2),(13,405,2),(14,406,2),(15,431,2),(16,441,2),(17,480,2),(18,495,8),(19,508,8),(20,532,8),(21,566,8),(22,596,8),(23,402,3),(24,405,3),(25,406,3),(26,431,3),(27,441,3),(28,480,3),(29,495,9),(30,508,9),(31,532,9),(32,566,9),(33,596,9),(34,402,4),(35,405,4),(36,406,4),(37,431,4),(38,441,4),(39,480,4),(40,495,10),(41,508,10),(42,532,10),(43,566,10),(44,596,10),(45,402,5),(46,405,5),(47,406,5),(48,431,5),(49,441,5),(50,480,5),(51,495,11),(52,508,11),(53,532,11),(54,566,11),(55,596,11),(56,402,6),(57,405,6),
(58,406,6),(59,431,6),(60,441,6),(61,480,6),(62,495,12),(63,508,12),(64,532,12),(65,566,12),(66,596,12),(67,426,23),(68,473,23),(69,479,23),(70,497,23),(71,500,23),(72,515,23),(73,516,23),(74,519,23),(75,524,23),(76,531,23),(77,533,23),(78,538,23),(79,542,23),(80,548,23),(81,552,23),(82,555,23),(83,581,23),(84,584,23),(85,587,23),(86,588,23),(87,594,23),(88,598,23),(89,426,29),(90,473,29),(91,479,29),(92,497,29),(93,500,29),(94,515,29),(95,516,29),(96,519,29),(97,524,29),(98,531,29),(99,533,29),(100,538,28),(101,542,28),(102,548,28),(103,552,28),(104,555,28),(105,581,28),(106,584,28),(107,587,28),(108,588,28),(109,594,28),(110,598,28),(111,426,30),
(112,473,30),(113,479,30),(114,497,30),(115,500,30),(116,515,30),(117,516,30),(118,519,30),(119,524,30),(120,531,30),(121,533,30),(122,538,30),(123,542,30),(124,548,30),(125,552,30),(126,555,30),(127,581,30),(128,584,30),(129,587,30),(130,588,30),(131,594,30),(132,598,30),(133,408,13),(134,411,13),(135,416,13),(136,438,13),(137,440,13),(138,461,13),(139,466,13),(140,471,13),(141,477,13),(142,506,13),(143,510,18),(144,512,18),(145,526,18),(146,534,18),(147,557,18),(148,558,18),(149,564,18),(150,580,18),(151,593,18),(152,600,18),(153,408,14),(154,411,14),(155,416,14),(156,438,14),(157,440,14),(158,461,14),(159,466,14),(160,471,14),(161,477,14),
(162,506,14),(163,510,19),(164,512,19),(165,526,19),(166,534,19),(167,557,19),(168,558,19),(169,564,19),(170,580,19),(171,593,19),(172,600,19),(173,408,15),(174,411,15),(175,416,15),(176,438,15),(177,440,15),(178,461,15),(179,466,15),(180,471,15),(181,477,15),(182,506,15),(183,510,20),(184,512,20),(185,526,20),(186,534,20),(187,557,20),(188,558,20),(189,564,20),(190,580,20),(191,593,20),(192,600,20),(193,408,16),(194,411,16),(195,416,16),(196,438,16),(197,440,16),(198,461,16),(199,466,16),(200,471,16),(201,477,16),(202,506,16),(203,510,21),(204,512,21),(205,526,21),(206,534,21),(207,557,21),(208,558,21),(209,564,21),(210,580,21),(211,593,21),
(212,600,21),(213,408,17),(214,411,17),(215,416,17),(216,438,17),(217,440,17),(218,461,17),(219,466,17),(220,471,17),(221,477,17),(222,506,17),(223,510,22),(224,512,22),(225,526,22),(226,534,22),(227,557,22),(228,558,22),(229,564,22),(230,580,22),(231,593,22),(232,600,22),(233,427,36),(234,434,36),(235,439,36),(236,443,36),(237,450,36),(238,458,36),(239,481,36),(240,483,36),(241,499,36),(242,501,36),(243,507,42),(244,517,42),(245,544,42),(246,550,42),(247,551,42),(248,569,42),(249,582,42),(250,591,42),(251,599,42),(252,427,37),(253,434,37),(254,439,37),(255,443,37),(256,450,37),(257,458,37),(258,481,37),(259,483,37),(260,499,37),(261,501,37),
(262,507,43),(263,517,43),(264,544,43),(265,550,43),(266,551,43),(267,569,43),(268,582,43),(269,591,43),(270,599,43),(271,427,38),(272,434,38),(273,439,38),(274,443,38),(275,450,38),(276,458,38),(277,481,38),(278,483,38),(279,499,38),(280,501,38),(281,507,44),(282,517,44),(283,544,44),(284,550,44),(285,551,44),(286,569,44),(287,582,44),(288,591,44),(289,599,44),(290,427,39),(291,434,39),(292,439,39),(293,443,39),(294,450,39),(295,458,39),(296,481,39),(297,483,39),(298,499,39),(299,501,39),(300,507,45),(301,517,45),(302,544,45),(303,550,45),(304,551,45),(305,569,45),(306,582,45),(307,591,45),(308,599,45),(309,427,40),(310,434,40),(311,439,40),
(312,443,40),(313,450,40),(314,458,40),(315,481,40),(316,483,40),(317,499,40),(318,501,40),(319,507,46),(320,517,46),(321,544,46),(322,550,46),(323,551,46),(324,569,46),(325,582,46),(326,591,46),(327,599,46),(328,427,41),(329,434,41),(330,439,41),(331,443,41),(332,450,41),(333,458,41),(334,481,41),(335,483,41),(336,499,41),(337,501,41),(338,507,47),(339,517,47),(340,544,47),(341,550,47),(342,551,47),(343,569,47),(344,582,47),(345,591,47),(346,599,47),(347,404,24),(348,409,24),(349,423,24),(350,424,24),(351,430,24),(352,436,24),(353,445,24),(354,451,24),(355,460,24),(356,468,24),(357,476,25),(358,522,25),(359,529,25),(360,545,25),(361,560,25),
(362,565,25),(363,567,25),(364,568,25),(365,572,25),(366,592,25),(367,404,26),(368,409,26),(369,423,26),(370,424,26),(371,430,26),(372,436,26),(373,445,26),(374,451,26),(375,460,26),(376,468,26),(377,476,27),(378,522,27),(379,529,27),(380,545,27),(381,560,27),(382,565,27),(383,567,27),(384,568,27),(385,572,27),(386,592,27),(387,413,48),(388,414,48),(389,417,48),(390,420,48),(391,437,48),(392,447,48),(393,448,49),(394,454,49),(395,486,49),(396,488,49),(397,504,49),(398,514,49),(399,518,50),(400,527,50),(401,547,50),(402,570,50),(403,575,50),(404,579,50),(405,413,51),(406,414,51),(407,417,51),(408,420,51),(409,437,51),(410,447,51),(411,448,51),
(412,454,51),(413,486,51),(414,488,52),(415,504,52),(416,514,52),(417,518,52),(418,527,52),(419,547,52),(420,570,52),(421,575,52),(422,579,52),(423,413,53),(424,414,53),(425,417,53),(426,420,53),(427,437,53),(428,447,53),(429,448,53),(430,454,53),(431,486,53),(432,488,54),(433,504,54),(434,514,54),(435,518,54),(436,527,54),(437,547,54),(438,570,54),(439,575,54),(440,579,54),(441,413,55),(442,414,55),(443,417,55),(444,420,55),(445,437,55),(446,447,55),(447,448,55),(448,454,55),(449,486,55),(450,488,55),(451,504,55),(452,514,55),(453,518,55),(454,527,55),(455,547,55),(456,570,55),(457,575,55),(458,579,55),(459,413,56),(460,414,56),(461,417,56),
(462,420,56),(463,437,56),(464,447,56),(465,448,56),(466,454,56),(467,486,56),(468,488,56),(469,504,56),(470,514,56),(471,518,56),(472,527,56),(473,547,56),(474,570,56),(475,575,56),(476,579,56),(477,413,76),(478,414,76),(479,417,76),(480,420,76),(481,437,76),(482,447,76),(483,448,76),(484,454,76),(485,486,76),(486,488,75),(487,504,75),(488,514,75),(489,518,75),(490,527,75),(491,547,75),(492,570,75),(493,575,75),(494,579,75),(495,407,57),(496,410,57),(497,432,57),(498,446,57),(499,457,57),(500,462,57),(501,464,57),(502,470,57),(503,485,58),(504,490,58),(505,509,58),(506,513,58),(507,563,58),(508,576,58),(509,585,58),(510,590,58),(511,407,59),
(512,410,59),(513,432,59),(514,446,59),(515,457,59),(516,462,59),(517,464,59),(518,470,59),(519,485,60),(520,490,60),(521,509,60),(522,513,60),(523,563,60),(524,576,60),(525,585,60),(526,590,60),(527,407,61),(528,410,61),(529,432,61),(530,446,61),(531,457,61),(532,462,61),(533,464,61),(534,470,61),(535,485,62),(536,490,62),(537,509,62),(538,513,62),(539,563,62),(540,576,62),(541,585,62),(542,590,62),(543,422,64),(544,428,64),(545,433,64),(546,442,64),(547,452,64),(548,475,64),(549,482,64),(550,491,64),(551,493,63),(552,505,63),(553,520,63),(554,535,63),(555,537,63),(556,562,63),(557,578,63),(558,595,63),(559,422,65),(560,428,65),(561,433,65),
(562,442,65),(563,452,65),(564,475,65),(565,482,66),(566,491,66),(567,493,66),(568,505,66),(569,520,66),(570,535,67),(571,537,67),(572,562,67),(573,578,67),(574,595,67),(575,422,68),(576,428,68),(577,433,68),(578,442,68),(579,452,68),(580,475,68),(581,482,68),(582,491,68),(583,493,68),(584,505,68),(585,520,68),(586,535,68),(587,537,68),(588,562,68),(589,578,68),(590,595,68),(591,403,31),(592,421,31),(593,425,31),(594,455,31),(595,459,31),(596,463,31),(597,469,31),(598,484,31),(599,494,31),(600,525,31),(601,528,31),(602,530,31),(603,536,31),(604,540,31),(605,553,31),(606,554,31),(607,597,31),(608,403,32),(609,421,32),(610,425,32),(611,455,32),
(612,459,32),(613,463,32),(614,469,32),(615,484,32),(616,494,32),(617,525,32),(618,528,32),(619,530,32),(620,536,32),(621,540,32),(622,553,32),(623,554,32),(624,597,32),(625,403,33),(626,421,33),(627,425,33),(628,455,33),(629,459,33),(630,463,33),(631,469,33),(632,484,33),(633,494,33),(634,525,33),(635,528,33),(636,530,33),(637,536,33),(638,540,33),(639,553,33),(640,554,33),(641,597,33),(642,403,34),(643,421,34),(644,425,34),(645,455,34),(646,459,34),(647,463,34),(648,469,34),(649,484,34),(650,494,34),(651,525,34),(652,528,34),(653,530,34),(654,536,34),(655,540,34),(656,553,34),(657,554,34),(658,597,34),(659,403,35),(660,421,35),(661,425,35),
(662,455,35),(663,459,35),(664,463,35),(665,469,35),(666,484,35),(667,494,35),(668,525,35),(669,528,35),(670,530,35),(671,536,35),(672,540,35),(673,553,35),(674,554,35),(675,597,35),(676,418,69),(677,435,69),(678,449,69),(679,453,69),(680,456,69),(681,474,69),(682,478,69),(683,503,72),(684,543,72),(685,546,72),(686,561,72),(687,573,72),(688,574,72),(689,589,72),(690,418,70),(691,435,70),(692,449,70),(693,453,70),(694,456,70),(695,474,70),(696,478,70),(697,503,73),(698,543,73),(699,546,73),(700,561,73),(701,573,73),(702,574,73),(703,589,73),(704,418,71),(705,435,71),(706,449,71),(707,453,71),(708,456,71),(709,474,71),(710,478,71),(711,503,74),
(712,543,74),(713,546,74),(714,561,74),(715,573,74),(716,574,74),(717,589,74),(718,444,77),(719,467,77),(720,487,77),(721,496,77),(722,502,77),(723,511,77),(724,521,77),(725,523,82),(726,539,82),(727,541,82),(728,559,82),(729,571,82),(730,577,82),(731,583,82),(732,444,78),(733,467,78),(734,487,78),(735,496,78),(736,502,78),(737,511,78),(738,521,78),(739,523,83),(740,539,83),(741,541,83),(742,559,83),(743,571,83),(744,577,83),(745,583,83),(746,444,79),(747,467,79),(748,487,79),(749,496,79),(750,502,79),(751,511,79),(752,521,79),(753,523,84),(754,539,84),(755,541,84),(756,559,84),(757,571,84),(758,577,84),(759,583,84),(760,444,80),(761,467,80),
(762,487,80),(763,496,80),(764,502,80),(765,511,80),(766,521,80),(767,523,85),(768,539,85),(769,541,85),(770,559,85),(771,571,85),(772,577,85),(773,583,85),(774,444,81),(775,467,81),(776,487,81),(777,496,81),(778,502,81),(779,511,81),(780,521,81),(781,523,86),(782,539,86),(783,541,86),(784,559,86),(785,571,86),(786,577,86),(787,583,86),(788,401,87),(789,412,87),(790,415,87),(791,419,87),(792,429,87),(793,465,87),(794,472,87),(795,489,91),(796,492,91),(797,498,91),(798,549,91),(799,556,91),(800,586,91),(801,401,88),(802,412,88),(803,415,88),(804,419,88),(805,429,88),(806,465,88),(807,472,88),(808,489,92),(809,492,92),(810,498,92),(811,549,92),
(812,556,92),(813,586,92),(814,401,89),(815,412,89),(816,415,89),(817,419,89),(818,429,89),(819,465,89),(820,472,89),(821,489,93),(822,492,93),(823,498,93),(824,549,93),(825,556,93),(826,586,93),(827,401,90),(828,412,90),(829,415,90),(830,419,90),(831,429,90),(832,465,90),(833,472,90),(834,489,94),(835,492,94),(836,498,94),(837,549,94),(838,556,94),(839,586,94);

SELECT * FROM registration;

-- Create table SCHEDULE

CREATE TABLE schedule (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `ClassID` int DEFAULT NULL,
  `CDate` date DEFAULT NULL,
  `FeedbackScore` int DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`)
) ;

INSERT INTO schedule VALUES (1,1,'2020-09-17',9),(2,2,'2020-09-28',10),(3,3,'2020-10-15',10),(4,4,'2020-09-25',10),(5,5,'2020-09-09',6),(6,6,'2020-10-01',8),(7,7,'2020-10-13',6),(8,8,'2020-10-08',9),(9,9,'2020-09-14',10),
(10,10,'2020-09-24',7),(11,11,'2020-10-05',9),(12,12,'2020-10-06',8),(13,13,'2020-10-08',6),(14,14,'2020-10-13',9),(15,15,'2020-09-22',6),(16,16,'2020-09-21',9),(17,17,'2020-09-15',10),(18,18,'2020-10-16',7),
(19,19,'2020-09-30',9),(20,20,'2020-10-07',7),(21,21,'2020-09-17',9),(22,22,'2020-10-12',6),(23,23,'2020-10-01',6),(24,24,'2020-09-16',9),(25,25,'2020-10-06',9),(26,26,'2020-09-18',10),(27,27,'2020-09-21',7),
(28,28,'2020-09-07',8),(29,29,'2020-09-28',9),(30,30,'2020-10-08',7),(31,31,'2020-09-24',7),(32,32,'2020-10-09',10),(33,33,'2020-09-30',8),(34,34,'2020-09-11',8),(35,35,'2020-10-06',6),(36,36,'2020-09-08',6),
(37,37,'2020-10-16',6),(38,38,'2020-09-15',6),(39,39,'2020-09-16',7),(40,40,'2020-09-09',7),(41,41,'2020-09-07',8),(42,42,'2020-09-22',9),(43,43,'2020-10-02',7),(44,44,'2020-09-22',7),(45,45,'2020-10-14',7),
(46,46,'2020-10-13',10),(47,47,'2020-09-22',9),(48,48,'2020-10-01',6),(49,49,'2020-10-07',9),(50,50,'2020-09-23',7),(51,51,'2020-09-30',8),(52,52,'2020-09-09',8),(53,53,'2020-09-10',10),(54,54,'2020-09-08',6),
(55,55,'2020-09-11',10),(56,56,'2020-09-08',6),(57,57,'2020-09-10',10),(58,58,'2020-09-11',7),(59,59,'2020-09-07',6),(60,60,'2020-09-09',10),(61,61,'2020-09-07',9),(62,62,'2020-09-10',8),(63,63,'2020-09-10',8),
(64,64,'2020-09-10',8),(65,65,'2020-09-08',8),(66,66,'2020-09-11',6),(67,67,'2020-09-10',7),(68,68,'2020-09-11',10),(69,69,'2020-09-08',7),(70,70,'2020-09-11',7),(71,71,'2020-09-07',9),(72,72,'2020-09-09',6),
(73,73,'2020-09-11',8),(74,74,'2020-09-07',8),(75,75,'2020-09-08',8),(76,76,'2020-09-07',7),(77,77,'2020-09-09',10),(78,78,'2020-09-08',6),(79,79,'2020-09-08',6),(80,80,'2020-09-08',10),(81,81,'2020-09-09',9),
(82,82,'2020-09-11',8),(83,83,'2020-09-11',7),(84,84,'2020-09-10',9),(85,85,'2020-09-10',6),(86,86,'2020-09-11',6),(87,87,'2020-09-09',7),(88,88,'2020-09-08',10),(89,89,'2020-09-09',7),(90,90,'2020-09-07',9),
(91,91,'2020-09-07',10),(92,92,'2020-09-08',6),(93,93,'2020-09-09',6),(94,94,'2020-09-09',8),(95,1,'2020-09-24',10),(96,2,'2020-10-05',8),(97,3,'2020-10-22',6),(98,4,'2020-10-02',7),(99,5,'2020-09-16',8),
(100,6,'2020-10-08',9),(101,7,'2020-10-20',7),(102,8,'2020-10-15',6),(103,9,'2020-09-21',3),(104,10,'2020-10-01',7),(105,11,'2020-10-12',10),(106,12,'2020-10-13',6),(107,13,'2020-10-15',7),(108,14,'2020-10-20',9),
(109,15,'2020-09-29',7),(110,16,'2020-09-28',8),(111,17,'2020-09-22',7),(112,18,'2020-10-23',8),(113,19,'2020-10-07',7),(114,20,'2020-10-14',6),(115,21,'2020-09-24',8),(116,22,'2020-10-19',8),(117,23,'2020-10-08',6),
(118,24,'2020-09-23',9),(119,25,'2020-10-13',10),(120,26,'2020-09-25',7),(121,27,'2020-09-28',8),(122,28,'2020-09-14',9),(123,29,'2020-10-05',7),(124,30,'2020-10-15',10),(125,31,'2020-10-01',10),(126,32,'2020-10-16',7),
(127,33,'2020-10-07',7),(128,34,'2020-09-18',8),(129,35,'2020-10-13',8),(130,36,'2020-09-15',8),(131,37,'2020-10-23',6),(132,38,'2020-09-22',10),(133,39,'2020-09-23',8),(134,40,'2020-09-16',10),(135,41,'2020-09-14',6),
(136,42,'2020-09-29',8),(137,43,'2020-10-09',7),(138,44,'2020-09-29',7),(139,45,'2020-10-21',10),(140,46,'2020-10-20',10),(141,47,'2020-09-29',7),(142,48,'2020-10-08',10),(143,49,'2020-10-14',9),(144,50,'2020-09-30',7),
(145,51,'2020-10-07',8),(146,52,'2020-09-16',6),(147,53,'2020-09-17',8),(148,54,'2020-09-15',6),(149,55,'2020-09-18',9),(150,56,'2020-09-15',10),(151,57,'2020-09-17',7),(152,58,'2020-09-18',6),(153,59,'2020-09-14',9),
(154,60,'2020-09-16',6),(155,61,'2020-09-14',10),(156,62,'2020-09-17',6),(157,63,'2020-09-17',6),(158,64,'2020-09-17',9),(159,65,'2020-09-15',9),(160,66,'2020-09-18',7),(161,67,'2020-09-17',10),(162,68,'2020-09-18',10),
(163,69,'2020-09-15',10),(164,70,'2020-09-18',7),(165,71,'2020-09-14',10),(166,72,'2020-09-16',9),(167,73,'2020-09-18',7),(168,74,'2020-09-14',9),(169,75,'2020-09-15',6),(170,76,'2020-09-14',10),(171,77,'2020-09-16',9),
(172,78,'2020-09-15',9),(173,79,'2020-09-15',10),(174,80,'2020-09-15',9),(175,81,'2020-09-16',8),(176,82,'2020-09-18',6),(177,83,'2020-09-18',8),(178,84,'2020-09-17',7),(179,85,'2020-09-17',9),(180,86,'2020-09-18',10),
(181,87,'2020-09-16',6),(182,88,'2020-09-15',8),(183,89,'2020-09-16',6),(184,90,'2020-09-14',2),(185,91,'2020-09-14',7),(186,92,'2020-09-15',9),(187,93,'2020-09-16',9),(188,94,'2020-09-16',8),(189,1,'2020-10-01',6),
(190,2,'2020-10-12',8),(191,3,'2020-10-29',8),(192,4,'2020-10-09',8),(193,5,'2020-09-23',7),(194,6,'2020-10-15',6),(195,7,'2020-10-27',8),(196,8,'2020-10-22',10),(197,9,'2020-09-28',7),(198,10,'2020-10-08',6),
(199,11,'2020-10-19',7),(200,12,'2020-10-20',7),(201,13,'2020-10-22',9),(202,14,'2020-10-27',8),(203,15,'2020-10-06',8),(204,16,'2020-10-05',10),(205,17,'2020-09-29',6),(206,18,'2020-10-30',6),(207,19,'2020-10-14',8),
(208,20,'2020-10-21',8),(209,21,'2020-10-01',10),(210,22,'2020-10-26',6),(211,23,'2020-10-15',9),(212,24,'2020-09-30',10),(213,25,'2020-10-20',8),(214,26,'2020-10-02',9),(215,27,'2020-10-05',8),(216,28,'2020-09-21',9),
(217,29,'2020-10-12',9),(218,30,'2020-10-22',9),(219,31,'2020-10-08',2),(220,32,'2020-10-23',8),(221,33,'2020-10-14',8),(222,34,'2020-09-25',7),(223,35,'2020-10-20',8),(224,36,'2020-09-22',8),(225,37,'2020-10-30',10),
(226,38,'2020-09-29',6),(227,39,'2020-09-30',6),(228,40,'2020-09-23',9),(229,41,'2020-09-21',9),(230,42,'2020-10-06',9),(231,43,'2020-10-16',9),(232,44,'2020-10-06',10),(233,45,'2020-10-28',6),(234,46,'2020-10-27',7),
(235,47,'2020-10-06',6),(236,48,'2020-10-15',7),(237,49,'2020-10-21',10),(238,50,'2020-10-07',10),(239,51,'2020-10-14',8),(240,52,'2020-09-23',8),(241,53,'2020-09-24',8),(242,54,'2020-09-22',6),(243,55,'2020-09-25',10),
(244,56,'2020-09-22',8),(245,57,'2020-09-24',10),(246,58,'2020-09-25',9),(247,59,'2020-09-21',6),(248,60,'2020-09-23',7),(249,61,'2020-09-21',7),(250,62,'2020-09-24',6),(251,63,'2020-09-24',9),(252,64,'2020-09-24',9),
(253,65,'2020-09-22',8),(254,66,'2020-09-25',8),(255,67,'2020-09-24',6),(256,68,'2020-09-25',8),(257,69,'2020-09-22',10),(258,70,'2020-09-25',10),(259,71,'2020-09-21',8),(260,72,'2020-09-23',8),(261,73,'2020-09-25',8),
(262,74,'2020-09-21',9),(263,75,'2020-09-22',6),(264,76,'2020-09-21',6),(265,77,'2020-09-23',9),(266,78,'2020-09-22',8),(267,79,'2020-09-22',8),(268,80,'2020-09-22',7),(269,81,'2020-09-23',6),(270,82,'2020-09-25',6),
(271,83,'2020-09-25',10),(272,84,'2020-09-24',6),(273,85,'2020-09-24',9),(274,86,'2020-09-25',10),(275,87,'2020-09-23',7),(276,88,'2020-09-22',7),(277,89,'2020-09-23',7),(278,90,'2020-09-21',7),(279,91,'2020-09-21',6),
(280,92,'2020-09-22',9),(281,93,'2020-09-23',10),(282,94,'2020-09-23',8),(283,1,'2020-10-08',6),(284,2,'2020-10-19',8),(285,3,'2020-11-05',8),(286,4,'2020-10-16',10),(287,5,'2020-09-30',9),(288,6,'2020-10-22',6),
(289,7,'2020-11-03',6),(290,8,'2020-10-29',7),(291,9,'2020-10-05',8),(292,10,'2020-10-15',8),(293,11,'2020-10-26',9),(294,12,'2020-10-27',7),(295,13,'2020-10-29',6),(296,14,'2020-11-03',9),(297,15,'2020-10-13',6),
(298,16,'2020-10-12',9),(299,17,'2020-10-06',8),(300,18,'2020-11-06',7),(301,19,'2020-10-21',9),(302,20,'2020-10-28',7),(303,21,'2020-10-08',10),(304,22,'2020-11-02',8),(305,23,'2020-10-22',10),(306,24,'2020-10-07',10),
(307,25,'2020-10-27',9),(308,26,'2020-10-09',10),(309,27,'2020-10-12',6),(310,28,'2020-09-28',9),(311,29,'2020-10-19',9),(312,30,'2020-10-29',8),(313,31,'2020-10-15',6),(314,32,'2020-10-30',6),(315,33,'2020-10-21',9),
(316,34,'2020-10-02',9),(317,35,'2020-10-27',9),(318,36,'2020-09-29',7),(319,37,'2020-11-06',6),(320,38,'2020-10-06',6),(321,39,'2020-10-07',8),(322,40,'2020-09-30',9),(323,41,'2020-09-28',7),(324,42,'2020-10-13',9),
(325,43,'2020-10-23',9),(326,44,'2020-10-13',6),(327,45,'2020-11-04',7),(328,46,'2020-11-03',9),(329,47,'2020-10-13',9),(330,48,'2020-10-22',9),(331,49,'2020-10-28',9),(332,50,'2020-10-14',10),(333,51,'2020-10-21',10),
(334,52,'2020-09-30',7),(335,53,'2020-10-01',7),(336,54,'2020-09-29',9),(337,55,'2020-10-02',9),(338,56,'2020-09-29',8),(339,57,'2020-10-01',9),(340,58,'2020-10-02',10),(341,59,'2020-09-28',7),(342,60,'2020-09-30',10),
(343,61,'2020-09-28',10),(344,62,'2020-10-01',7),(345,63,'2020-10-01',6),(346,64,'2020-10-01',8),(347,65,'2020-09-29',9),(348,66,'2020-10-02',9),(349,67,'2020-10-01',8),(350,68,'2020-10-02',6),(351,69,'2020-09-29',9),
(352,70,'2020-10-02',8),(353,71,'2020-09-28',10),(354,72,'2020-09-30',8),(355,73,'2020-10-02',8),(356,74,'2020-09-28',10),(357,75,'2020-09-29',9),(358,76,'2020-09-28',7),(359,77,'2020-09-30',7),(360,78,'2020-09-29',10),
(361,79,'2020-09-29',6),(362,80,'2020-09-29',10),(363,81,'2020-09-30',7),(364,82,'2020-10-02',8),(365,83,'2020-10-02',10),(366,84,'2020-10-01',9),(367,85,'2020-10-01',9),(368,86,'2020-10-02',7),(369,87,'2020-09-30',10),
(370,88,'2020-09-29',9),(371,89,'2020-09-30',6),(372,90,'2020-09-28',9),(373,91,'2020-09-28',9),(374,92,'2020-09-29',7),(375,93,'2020-09-30',7),(376,94,'2020-09-30',9),(377,1,'2020-10-15',7),(378,2,'2020-10-26',6),
(379,3,'2020-11-12',7),(380,4,'2020-10-23',8),(381,5,'2020-10-07',7),(382,6,'2020-10-29',4),(383,7,'2020-11-10',10),(384,8,'2020-11-05',6),(385,9,'2020-10-12',9),(386,10,'2020-10-22',8),(387,11,'2020-11-02',6),
(388,12,'2020-11-03',10),(389,13,'2020-11-05',10),(390,14,'2020-11-10',9),(391,15,'2020-10-20',8),(392,16,'2020-10-19',10),(393,17,'2020-10-13',8),(394,18,'2020-11-13',8),(395,19,'2020-10-28',10),(396,20,'2020-11-04',7),
(397,21,'2020-10-15',7),(398,22,'2020-11-09',8),(399,23,'2020-10-29',6),(400,24,'2020-10-14',10),(401,25,'2020-11-03',10),(402,26,'2020-10-16',7),(403,27,'2020-10-19',7),(404,28,'2020-10-05',10),(405,29,'2020-10-26',9),
(406,30,'2020-11-05',9),(407,31,'2020-10-22',9),(408,32,'2020-11-06',9),(409,33,'2020-10-28',6),(410,34,'2020-10-09',8),(411,35,'2020-11-03',10),(412,36,'2020-10-06',7),(413,37,'2020-11-13',10),(414,38,'2020-10-13',10),
(415,39,'2020-10-14',6),(416,40,'2020-10-07',10),(417,41,'2020-10-05',9),(418,42,'2020-10-20',8),(419,43,'2020-10-30',9),(420,44,'2020-10-20',9),(421,45,'2020-11-11',8),(422,46,'2020-11-10',8),(423,47,'2020-10-20',9),
(424,48,'2020-10-29',6),(425,49,'2020-11-04',8),(426,50,'2020-10-21',9),(427,51,'2020-10-28',7),(428,52,'2020-10-07',6),(429,53,'2020-10-08',10),(430,54,'2020-10-06',10),(431,55,'2020-10-09',10),(432,56,'2020-10-06',9),
(433,57,'2020-10-08',8),(434,58,'2020-10-09',6),(435,59,'2020-10-05',10),(436,60,'2020-10-07',7),(437,61,'2020-10-05',8),(438,62,'2020-10-08',10),(439,63,'2020-10-08',7),(440,64,'2020-10-08',10),(441,65,'2020-10-06',6),
(442,66,'2020-10-09',6),(443,67,'2020-10-08',9),(444,68,'2020-10-09',10),(445,69,'2020-10-06',7),(446,70,'2020-10-09',6),(447,71,'2020-10-05',6),(448,72,'2020-10-07',7),(449,73,'2020-10-09',8),(450,74,'2020-10-05',7),
(451,75,'2020-10-06',6),(452,76,'2020-10-05',6),(453,77,'2020-10-07',9),(454,78,'2020-10-06',10),(455,79,'2020-10-06',9),(456,80,'2020-10-06',9),(457,81,'2020-10-07',8),(458,82,'2020-10-09',10),(459,83,'2020-10-09',6),
(460,84,'2020-10-08',6),(461,85,'2020-10-08',7),(462,86,'2020-10-09',8),(463,87,'2020-10-07',10),(464,88,'2020-10-06',7),(465,89,'2020-10-07',10),(466,90,'2020-10-05',10),(467,91,'2020-10-05',7),(468,92,'2020-10-06',7),
(469,93,'2020-10-07',10),(470,94,'2020-10-07',7),(471,1,'2020-10-22',9),(472,2,'2020-11-02',9),(473,3,'2020-11-19',9),(474,4,'2020-10-30',10),(475,5,'2020-10-14',8),(476,6,'2020-11-05',9),(477,7,'2020-11-17',7),
(478,8,'2020-11-12',7),(479,9,'2020-10-19',9),(480,10,'2020-10-29',10),(481,11,'2020-11-09',6),(482,12,'2020-11-10',9),(483,13,'2020-11-12',5),(484,14,'2020-11-17',6),(485,15,'2020-10-27',8),(486,16,'2020-10-26',8),
(487,17,'2020-10-20',6),(488,18,'2020-11-20',7),(489,19,'2020-11-04',8),(490,20,'2020-11-11',8),(491,21,'2020-10-22',8),(492,22,'2020-11-16',8),(493,23,'2020-11-05',8),(494,24,'2020-10-21',10),(495,25,'2020-11-10',7),
(496,26,'2020-10-23',7),(497,27,'2020-10-26',9),(498,28,'2020-10-12',10),(499,29,'2020-11-02',8),(500,30,'2020-11-12',8),(501,31,'2020-10-29',6),(502,32,'2020-11-13',10),(503,33,'2020-11-04',10),(504,34,'2020-10-16',7),
(505,35,'2020-11-10',7),(506,36,'2020-10-13',10),(507,37,'2020-11-20',8),(508,38,'2020-10-20',8),(509,39,'2020-10-21',10),(510,40,'2020-10-14',6),(511,41,'2020-10-12',9),(512,42,'2020-10-27',7),(513,43,'2020-11-06',9),
(514,44,'2020-10-27',8),(515,45,'2020-11-18',6),(516,46,'2020-11-17',7),(517,47,'2020-10-27',10),(518,48,'2020-11-05',7),(519,49,'2020-11-11',7),(520,50,'2020-10-28',7),(521,51,'2020-11-04',8),(522,52,'2020-10-14',10),
(523,53,'2020-10-15',6),(524,54,'2020-10-13',7),(525,55,'2020-10-16',9),(526,56,'2020-10-13',6),(527,57,'2020-10-15',6),(528,58,'2020-10-16',6),(529,59,'2020-10-12',8),(530,60,'2020-10-14',6),(531,61,'2020-10-12',8),
(532,62,'2020-10-15',7),(533,63,'2020-10-15',6),(534,64,'2020-10-15',7),(535,65,'2020-10-13',10),(536,66,'2020-10-16',8),(537,67,'2020-10-15',7),(538,68,'2020-10-16',8),(539,69,'2020-10-13',10),(540,70,'2020-10-16',8),
(541,71,'2020-10-12',9),(542,72,'2020-10-14',7),(543,73,'2020-10-16',8),(544,74,'2020-10-12',9),(545,75,'2020-10-13',7),(546,76,'2020-10-12',8),(547,77,'2020-10-14',10),(548,78,'2020-10-13',6),(549,79,'2020-10-13',8),
(550,80,'2020-10-13',9),(551,81,'2020-10-14',8),(552,82,'2020-10-16',6),(553,83,'2020-10-16',7),(554,84,'2020-10-15',10),(555,85,'2020-10-15',8),(556,86,'2020-10-16',10),(557,87,'2020-10-14',10),(558,88,'2020-10-13',9),
(559,89,'2020-10-14',6),(560,90,'2020-10-12',6),(561,91,'2020-10-12',10),(562,92,'2020-10-13',9),(563,93,'2020-10-14',7),(564,94,'2020-10-14',7),(565,1,'2020-10-29',8),(566,2,'2020-11-09',6),(567,3,'2020-11-26',10),
(568,4,'2020-11-06',10),(569,5,'2020-10-21',10),(570,6,'2020-11-12',10),(571,7,'2020-11-24',6),(572,8,'2020-11-19',10),(573,9,'2020-10-26',9),(574,10,'2020-11-05',9),(575,11,'2020-11-16',10),(576,12,'2020-11-17',7),
(577,13,'2020-11-19',10),(578,14,'2020-11-24',10),(579,15,'2020-11-03',6),(580,16,'2020-11-02',10),(581,17,'2020-10-27',9),(582,18,'2020-11-27',10),(583,19,'2020-11-11',8),(584,20,'2020-11-18',6),(585,21,'2020-10-29',6),
(586,22,'2020-11-23',8),(587,23,'2020-11-12',8),(588,24,'2020-10-28',9),(589,25,'2020-11-17',7),(590,26,'2020-10-30',9),(591,27,'2020-11-02',7),(592,28,'2020-10-19',8),(593,29,'2020-11-09',8),(594,30,'2020-11-19',7),
(595,31,'2020-11-05',9),(596,32,'2020-11-20',7),(597,33,'2020-11-11',9),(598,34,'2020-10-23',8),(599,35,'2020-11-17',10),(600,36,'2020-10-20',9),(601,37,'2020-11-27',7),(602,38,'2020-10-27',7),(603,39,'2020-10-28',10),
(604,40,'2020-10-21',9),(605,41,'2020-10-19',6),(606,42,'2020-11-03',10),(607,43,'2020-11-13',6),(608,44,'2020-11-03',8),(609,45,'2020-11-25',7),(610,46,'2020-11-24',6),(611,47,'2020-11-03',6),(612,48,'2020-11-12',7),
(613,49,'2020-11-18',8),(614,50,'2020-11-04',7),(615,51,'2020-11-11',8),(616,52,'2020-10-21',10),(617,53,'2020-10-22',7),(618,54,'2020-10-20',8),(619,55,'2020-10-23',10),(620,56,'2020-10-20',10),(621,57,'2020-10-22',6),
(622,58,'2020-10-23',7),(623,59,'2020-10-19',6),(624,60,'2020-10-21',8),(625,61,'2020-10-19',9),(626,62,'2020-10-22',6),(627,63,'2020-10-22',7),(628,64,'2020-10-22',7),(629,65,'2020-10-20',6),(630,66,'2020-10-23',6),
(631,67,'2020-10-22',6),(632,68,'2020-10-23',9),(633,69,'2020-10-20',8),(634,70,'2020-10-23',9),(635,71,'2020-10-19',8),(636,72,'2020-10-21',9),(637,73,'2020-10-23',7),(638,74,'2020-10-19',9),(639,75,'2020-10-20',9),
(640,76,'2020-10-19',9),(641,77,'2020-10-21',9),(642,78,'2020-10-20',7),(643,79,'2020-10-20',7),(644,80,'2020-10-20',7),(645,81,'2020-10-21',6),(646,82,'2020-10-23',6),(647,83,'2020-10-23',9),(648,84,'2020-10-22',9),
(649,85,'2020-10-22',7),(650,86,'2020-10-23',6),(651,87,'2020-10-21',7),(652,88,'2020-10-20',8),(653,89,'2020-10-21',6),(654,90,'2020-10-19',9),(655,91,'2020-10-19',8),(656,92,'2020-10-20',7),(657,93,'2020-10-21',6),
(658,94,'2020-10-21',10),(659,1,'2020-11-05',9),(660,2,'2020-11-16',6),(661,3,'2020-12-03',9),(662,4,'2020-11-13',7),(663,5,'2020-10-28',7),(664,6,'2020-11-19',9),(665,7,'2020-12-01',7),(666,8,'2020-11-26',6),
(667,9,'2020-11-02',6),(668,10,'2020-11-12',10),(669,11,'2020-11-23',10),(670,12,'2020-11-24',10),(671,13,'2020-11-26',10),(672,14,'2020-12-01',8),(673,15,'2020-11-10',10),(674,16,'2020-11-09',6),(675,17,'2020-11-03',8),
(676,18,'2020-12-04',6),(677,19,'2020-11-18',10),(678,20,'2020-11-25',10),(679,21,'2020-11-05',10),(680,22,'2020-11-30',9),(681,23,'2020-11-19',7),(682,24,'2020-11-04',8),(683,25,'2020-11-24',7),(684,26,'2020-11-06',6),
(685,27,'2020-11-09',9),(686,28,'2020-10-26',8),(687,29,'2020-11-16',9),(688,30,'2020-11-26',6),(689,31,'2020-11-12',10),(690,32,'2020-11-27',9),(691,33,'2020-11-18',10),(692,34,'2020-10-30',8),(693,35,'2020-11-24',8),
(694,36,'2020-10-27',8),(695,37,'2020-12-04',7),(696,38,'2020-11-03',9),(697,39,'2020-11-04',6),(698,40,'2020-10-28',7),(699,41,'2020-10-26',7),(700,42,'2020-11-10',10),(701,43,'2020-11-20',9),(702,44,'2020-11-10',7),
(703,45,'2020-12-02',7),(704,46,'2020-12-01',8),(705,47,'2020-11-10',10),(706,48,'2020-11-19',8),(707,49,'2020-11-25',6),(708,50,'2020-11-11',6),(709,51,'2020-11-18',7),(710,52,'2020-10-28',6),(711,53,'2020-10-29',10),
(712,54,'2020-10-27',6),(713,55,'2020-10-30',9),(714,56,'2020-10-27',8),(715,57,'2020-10-29',10),(716,58,'2020-10-30',10),(717,59,'2020-10-26',6),(718,60,'2020-10-28',7),(719,61,'2020-10-26',7),(720,62,'2020-10-29',6),
(721,63,'2020-10-29',8),(722,64,'2020-10-29',6),(723,65,'2020-10-27',10),(724,66,'2020-10-30',9),(725,67,'2020-10-29',7),(726,68,'2020-10-30',7),(727,69,'2020-10-27',9),(728,70,'2020-10-30',7),(729,71,'2020-10-26',10),
(730,72,'2020-10-28',8),(731,73,'2020-10-30',10),(732,74,'2020-10-26',7),(733,75,'2020-10-27',9),(734,76,'2020-10-26',8),(735,77,'2020-10-28',7),(736,78,'2020-10-27',6),(737,79,'2020-10-27',9),(738,80,'2020-10-27',6),
(739,81,'2020-10-28',8),(740,82,'2020-10-30',9),(741,83,'2020-10-30',6),(742,84,'2020-10-29',8),(743,85,'2020-10-29',7),(744,86,'2020-10-30',7),(745,87,'2020-10-28',8),(746,88,'2020-10-27',7),(747,89,'2020-10-28',9),
(748,90,'2020-10-26',10),(749,91,'2020-10-26',10),(750,92,'2020-10-27',10),(751,93,'2020-10-28',6),(752,94,'2020-10-28',10),(753,1,'2020-11-12',7),(754,2,'2020-11-23',7),(755,3,'2020-12-10',7),(756,4,'2020-11-20',7),
(757,5,'2020-11-04',6),(758,6,'2020-11-26',6),(759,7,'2020-12-08',7),(760,8,'2020-12-03',10),(761,9,'2020-11-09',6),(762,10,'2020-11-19',10),(763,11,'2020-11-30',7),(764,12,'2020-12-01',9),(765,13,'2020-12-03',9),
(766,14,'2020-12-08',8),(767,15,'2020-11-17',7),(768,16,'2020-11-16',8),(769,17,'2020-11-10',6),(770,18,'2020-12-11',10),(771,19,'2020-11-25',7),(772,20,'2020-12-02',9),(773,21,'2020-11-12',7),(774,22,'2020-12-07',8),
(775,23,'2020-11-26',6),(776,24,'2020-11-11',10),(777,25,'2020-12-01',7),(778,26,'2020-11-13',9),(779,27,'2020-11-16',9),(780,28,'2020-11-02',9),(781,29,'2020-11-23',9),(782,30,'2020-12-03',7),(783,31,'2020-11-19',7),
(784,32,'2020-12-04',10),(785,33,'2020-11-25',8),(786,34,'2020-11-06',6),(787,35,'2020-12-01',10),(788,36,'2020-11-03',6),(789,37,'2020-12-11',7),(790,38,'2020-11-10',8),(791,39,'2020-11-11',7),(792,40,'2020-11-04',9),
(793,41,'2020-11-02',10),(794,42,'2020-11-17',6),(795,43,'2020-11-27',6),(796,44,'2020-11-17',6),(797,45,'2020-12-09',9),(798,46,'2020-12-08',6),(799,47,'2020-11-17',6),(800,48,'2020-11-26',6),(801,49,'2020-12-02',6),
(802,50,'2020-11-18',10),(803,51,'2020-11-25',7),(804,52,'2020-11-04',10),(805,53,'2020-11-05',7),(806,54,'2020-11-03',6),(807,55,'2020-11-06',6),(808,56,'2020-11-03',6),(809,57,'2020-11-05',8),(810,58,'2020-11-06',7),
(811,59,'2020-11-02',8),(812,60,'2020-11-04',7),(813,61,'2020-11-02',8),(814,62,'2020-11-05',6),(815,63,'2020-11-05',9),(816,64,'2020-11-05',8),(817,65,'2020-11-03',10),(818,66,'2020-11-06',6),(819,67,'2020-11-05',7),
(820,68,'2020-11-06',6),(821,69,'2020-11-03',6),(822,70,'2020-11-06',6),(823,71,'2020-11-02',9),(824,72,'2020-11-04',10),(825,73,'2020-11-06',10),(826,74,'2020-11-02',9),(827,75,'2020-11-03',7),(828,76,'2020-11-02',8),
(829,77,'2020-11-04',8),(830,78,'2020-11-03',7),(831,79,'2020-11-03',9),(832,80,'2020-11-03',6),(833,81,'2020-11-04',8),(834,82,'2020-11-06',9),(835,83,'2020-11-06',7),(836,84,'2020-11-05',9),(837,85,'2020-11-05',8),
(838,86,'2020-11-06',7),(839,87,'2020-11-04',9),(840,88,'2020-11-03',6),(841,89,'2020-11-04',10),(842,90,'2020-11-02',7),(843,91,'2020-11-02',8),(844,92,'2020-11-03',7),(845,93,'2020-11-04',7),(846,94,'2020-11-04',7),
(847,1,'2020-11-19',10),(848,2,'2020-11-30',8),(849,3,'2020-12-17',8),(850,4,'2020-11-27',8),(851,5,'2020-11-11',9),(852,6,'2020-12-03',7),(853,7,'2020-12-15',8),(854,8,'2020-12-10',7),(855,9,'2020-11-16',6),
(856,10,'2020-11-26',10),(857,11,'2020-12-07',8),(858,12,'2020-12-08',7),(859,13,'2020-12-10',8),(860,14,'2020-12-15',6),(861,15,'2020-11-24',8),(862,16,'2020-11-23',6),(863,17,'2020-11-17',10),(864,18,'2020-12-18',6),
(865,19,'2020-12-02',10),(866,20,'2020-12-09',7),(867,21,'2020-11-19',6),(868,22,'2020-12-14',9),(869,23,'2020-12-03',7),(870,24,'2020-11-18',6),(871,25,'2020-12-08',7),(872,26,'2020-11-20',9),(873,27,'2020-11-23',7),
(874,28,'2020-11-09',8),(875,29,'2020-11-30',7),(876,30,'2020-12-10',7),(877,31,'2020-11-26',6),(878,32,'2020-12-11',10),(879,33,'2020-12-02',8),(880,34,'2020-11-13',9),(881,35,'2020-12-08',6),(882,36,'2020-11-10',6),
(883,37,'2020-12-18',10),(884,38,'2020-11-17',9),(885,39,'2020-11-18',7),(886,40,'2020-11-11',6),(887,41,'2020-11-09',7),(888,42,'2020-11-24',9),(889,43,'2020-12-04',7),(890,44,'2020-11-24',9),(891,45,'2020-12-16',10),
(892,46,'2020-12-15',9),(893,47,'2020-11-24',7),(894,48,'2020-12-03',8),(895,49,'2020-12-09',8),(896,50,'2020-11-25',9),(897,51,'2020-12-02',6),(898,52,'2020-11-11',10),(899,53,'2020-11-12',6),(900,54,'2020-11-10',9),
(901,55,'2020-11-13',10),(902,56,'2020-11-10',9),(903,57,'2020-11-12',8),(904,58,'2020-11-13',10),(905,59,'2020-11-09',7),(906,60,'2020-11-11',7),(907,61,'2020-11-09',8),(908,62,'2020-11-12',6),(909,63,'2020-11-12',8),
(910,64,'2020-11-12',8),(911,65,'2020-11-10',10),(912,66,'2020-11-13',7),(913,67,'2020-11-12',7),(914,68,'2020-11-13',8),(915,69,'2020-11-10',7),(916,70,'2020-11-13',8),(917,71,'2020-11-09',6),(918,72,'2020-11-11',9),
(919,73,'2020-11-13',9),(920,74,'2020-11-09',7),(921,75,'2020-11-10',8),(922,76,'2020-11-09',7),(923,77,'2020-11-11',10),(924,78,'2020-11-10',6),(925,79,'2020-11-10',9),(926,80,'2020-11-10',8),(927,81,'2020-11-11',6),
(928,82,'2020-11-13',10),(929,83,'2020-11-13',7),(930,84,'2020-11-12',10),(931,85,'2020-11-12',7),(932,86,'2020-11-13',8),(933,87,'2020-11-11',9),(934,88,'2020-11-10',10),(935,89,'2020-11-11',10),(936,90,'2020-11-09',9),
(937,91,'2020-11-09',6),(938,92,'2020-11-10',10),(939,93,'2020-11-11',8),(940,94,'2020-11-11',6),(941,1,'2020-11-26',7),(942,2,'2020-12-07',8),(943,3,'2020-12-24',9),(944,4,'2020-12-04',10),(945,5,'2020-11-18',9),
(946,6,'2020-12-10',10),(947,7,'2020-12-22',8),(948,8,'2020-12-17',10),(949,9,'2020-11-23',7),(950,10,'2020-12-03',10),(951,11,'2020-12-14',7),(952,12,'2020-12-15',7),(953,13,'2020-12-17',7),(954,14,'2020-12-22',10),
(955,15,'2020-12-01',6),(956,16,'2020-11-30',6),(957,17,'2020-11-24',9),(958,18,'2020-12-25',9),(959,19,'2020-12-09',8),(960,20,'2020-12-16',9),(961,21,'2020-11-26',10),(962,22,'2020-12-21',7),(963,23,'2020-12-10',9),
(964,24,'2020-11-25',9),(965,25,'2020-12-15',9),(966,26,'2020-11-27',7),(967,27,'2020-11-30',8),(968,28,'2020-11-16',7),(969,29,'2020-12-07',6),(970,30,'2020-12-17',7),(971,31,'2020-12-03',10),(972,32,'2020-12-18',7),
(973,33,'2020-12-09',10),(974,34,'2020-11-20',9),(975,35,'2020-12-15',10),(976,36,'2020-11-17',7),(977,37,'2020-12-25',8),(978,38,'2020-11-24',10),(979,39,'2020-11-25',9),(980,40,'2020-11-18',8),(981,41,'2020-11-16',9),
(982,42,'2020-12-01',7),(983,43,'2020-12-11',9),(984,44,'2020-12-01',10),(985,45,'2020-12-23',10),(986,46,'2020-12-22',9),(987,47,'2020-12-01',6),(988,48,'2020-12-10',7),(989,49,'2020-12-16',9),(990,50,'2020-12-02',10),
(991,51,'2020-12-09',9),(992,52,'2020-11-18',7),(993,53,'2020-11-19',6),(994,54,'2020-11-17',10),(995,55,'2020-11-20',6),(996,56,'2020-11-17',10),(997,57,'2020-11-19',10),(998,58,'2020-11-20',8),(999,59,'2020-11-16',7),
(1000,60,'2020-11-18',6),(1001,61,'2020-11-16',8),(1002,62,'2020-11-19',7),(1003,63,'2020-11-19',6),(1004,64,'2020-11-19',10),(1005,65,'2020-11-17',9),(1006,66,'2020-11-20',8),(1007,67,'2020-11-19',10),(1008,68,'2020-11-20',8),
(1009,69,'2020-11-17',7),(1010,70,'2020-11-20',6),(1011,71,'2020-11-16',9),(1012,72,'2020-11-18',7),(1013,73,'2020-11-20',9),(1014,74,'2020-11-16',6),(1015,75,'2020-11-17',6),(1016,76,'2020-11-16',10),(1017,77,'2020-11-18',8),
(1018,78,'2020-11-17',6),(1019,79,'2020-11-17',10),(1020,80,'2020-11-17',9),(1021,81,'2020-11-18',8),(1022,82,'2020-11-20',10),(1023,83,'2020-11-20',7),(1024,84,'2020-11-19',7),(1025,85,'2020-11-19',7),(1026,86,'2020-11-20',8),(1027,87,'2020-11-18',6),(1028,88,'2020-11-17',8),(1029,89,'2020-11-18',6),(1030,90,'2020-11-16',6),(1031,91,'2020-11-16',8),(1032,92,'2020-11-17',8),(1033,93,'2020-11-18',10),(1034,94,'2020-11-18',6),(1035,1,'2020-12-03',7),
(1036,2,'2020-12-14',7),(1037,3,'2020-12-31',10),(1038,4,'2020-12-11',7),(1039,5,'2020-11-25',7),(1040,6,'2020-12-17',9),(1041,7,'2020-12-29',10),(1042,8,'2020-12-24',6),(1043,9,'2020-11-30',10),(1044,10,'2020-12-10',9),
(1045,11,'2020-12-21',7),(1046,12,'2020-12-22',8),(1047,13,'2020-12-24',8),(1048,14,'2020-12-29',8),(1049,15,'2020-12-08',6),(1050,16,'2020-12-07',8),(1051,17,'2020-12-01',10),(1052,18,'2021-01-01',8),(1053,19,'2020-12-16',10),
(1054,20,'2020-12-23',9),(1055,21,'2020-12-03',6),(1056,22,'2020-12-28',6),(1057,23,'2020-12-17',9),(1058,24,'2020-12-02',7),(1059,25,'2020-12-22',10),(1060,26,'2020-12-04',7),(1061,27,'2020-12-07',9),(1062,28,'2020-11-23',8),
(1063,29,'2020-12-14',7),(1064,30,'2020-12-24',7),(1065,31,'2020-12-10',10),(1066,32,'2020-12-25',7),(1067,33,'2020-12-16',6),(1068,34,'2020-11-27',9),(1069,35,'2020-12-22',6),(1070,36,'2020-11-24',8),(1071,37,'2021-01-01',6),
(1072,38,'2020-12-01',6),(1073,39,'2020-12-02',8),(1074,40,'2020-11-25',9),(1075,41,'2020-11-23',6),(1076,42,'2020-12-08',6),(1077,43,'2020-12-18',7),(1078,44,'2020-12-08',9),(1079,45,'2020-12-30',6),(1080,46,'2020-12-29',10),
(1081,47,'2020-12-08',7),(1082,48,'2020-12-17',10),(1083,49,'2020-12-23',9),(1084,50,'2020-12-09',8),(1085,51,'2020-12-16',10),(1086,52,'2020-11-25',7),(1087,53,'2020-11-26',9),(1088,54,'2020-11-24',8),(1089,55,'2020-11-27',7),
(1090,56,'2020-11-24',7),(1091,57,'2020-11-26',7),(1092,58,'2020-11-27',6),(1093,59,'2020-11-23',9),(1094,60,'2020-11-25',8),(1095,61,'2020-11-23',8),(1096,62,'2020-11-26',10),(1097,63,'2020-11-26',6),(1098,64,'2020-11-26',7),
(1099,65,'2020-11-24',10),(1100,66,'2020-11-27',6),(1101,67,'2020-11-26',7),(1102,68,'2020-11-27',10),(1103,69,'2020-11-24',8),(1104,70,'2020-11-27',7),(1105,71,'2020-11-23',8),(1106,72,'2020-11-25',6),(1107,73,'2020-11-27',10),
(1108,74,'2020-11-23',10),(1109,75,'2020-11-24',7),(1110,76,'2020-11-23',7),(1111,77,'2020-11-25',8),(1112,78,'2020-11-24',6),(1113,79,'2020-11-24',10),(1114,80,'2020-11-24',8),(1115,81,'2020-11-25',6),(1116,82,'2020-11-27',9),
(1117,83,'2020-11-27',9),(1118,84,'2020-11-26',9),(1119,85,'2020-11-26',10),(1120,86,'2020-11-27',10),(1121,87,'2020-11-25',8),(1122,88,'2020-11-24',7),(1123,89,'2020-11-25',9),(1124,90,'2020-11-23',9),(1125,91,'2020-11-23',7),
(1126,92,'2020-11-24',7),(1127,93,'2020-11-25',10),(1128,94,'2020-11-25',7);

SELECT * FROM schedule;



/*In the section below the code 
for the TASK given will be 
written down and exceuted:*/


/*IASK 2
Retrieving Data*/

SELECT * FROM student;

-- Obtain all information on the students not attending course 1

SELECT * FROM student 
WHERE NOT CourseID=1;

-- Obtain the first name, surname and Date of Birth for the student with the email address: val.bolger@example.com  

SELECT 
    Forenames,
    Surname,
    DateOfBirth
FROM student
WHERE 
    EmailAddress='val.bolger@example.com';

-- Obtain a list of the modules which have the subject Economics

SELECT * 
FROM module
WHERE Subjects= 'Economics';

-- Obtain a list of courses applied for and their application dates which are scheduled before 21st September 2020

SELECT * FROM applications;

SELECT * FROM schedule;


SELECT CourseAppliedFor, DateOfApplication
FROM applications
WHERE DateOfApplication < '2020-09-21'; /*application dates scheduled before 21st September 2020*/


/*IASK 3
Creating Calculations*/

-- Count how many students are enrolled overall

SELECT *FROM student;

-- 1.Count returns results as 204 students
SELECT COUNT(StudentID)
FROM student; 

--Calculate the sum of full time fees for every full-time course

SELECT * FROM fees;

-- 2.Sum of all FullTimeFee returns 101000

SELECT SUM(FullTimeFee)
FROM fees;

-- 3.Identify the cost of the least and most expensive course

SELECT MIN(FullTimeFee)
FROM fees; -- least expensive fulltime course = 4000

SELECT MAX(FullTimeFee)
FROM fees; -- most expensive fulltime course = 12000

-- 4.Calculate the average cost of all part time courses

SELECT AVG(PartTimeFee)
FROM fees; -- The average returns 5950.0000

/* 5.Calculate the fee of each full time course 
after applying (subtracting) the scholarship discount*/

SELECT FullTimeFee, FullTimeFee - ScholarshipDiscount 
AS FullTimeFeeDiscounted
FROM fees;



/*TASK 4
Database Functions*/

/* 1.Write a select statement to obtain 
all of the student information for successful 
applications made for Course 11 which do not relate 
to current students*/

/* 1.Write a select statement to obtain all of the 
student information for successful applications made 
for Course 11 which do not relate to current students*/

SELECT * FROM student;
WHERE CourseID= 11;

SELECT StudentID
FROM applications;

/* 2.Modify the select statement from the previous example 
into an insert statement and insert the data into the student 
table*/

