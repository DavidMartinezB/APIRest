-- MySQL dump 10.13  Distrib 8.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: bd
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Abilities`
--

DROP TABLE IF EXISTS `Abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Abilities` (
  `ability_id` int NOT NULL AUTO_INCREMENT,
  `character_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `category` int DEFAULT NULL,
  PRIMARY KEY (`ability_id`),
  KEY `character_id` (`character_id`),
  KEY `category` (`category`),
  CONSTRAINT `Abilities_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `Characters` (`character_id`),
  CONSTRAINT `Abilities_ibfk_2` FOREIGN KEY (`category`) REFERENCES `Abilities_Category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abilities`
--

LOCK TABLES `Abilities` WRITE;
/*!40000 ALTER TABLE `Abilities` DISABLE KEYS */;
INSERT INTO `Abilities` VALUES (1,1,'Incendiary','EQUIP an incendiary grenade launcher. FIRE to launch a grenade that detonates as it comes to a rest on the floor, creating a lingering fire zone that damages players within the zone.',1),(2,1,'Sky Smoke','EQUIP a tactical map. FIRE to set locations where Brimstone smoke clouds will land. ALT FIRE to confirm, launching long-lasting smoke clouds that block vision in the selected area.',1),(3,1,'Stim Beacon','EQUIP a Stim Beacon. FIRE to toss the Stim Beacon in front of Brimstone. Upon landing, the Stim Beacon will create a field that grants players RapidFire.',1),(4,1,'Orbital Strike','EQUIP a tactical map. FIRE to launch a lingering orbital strike laser at the selected location, dealing high damage-over-time to players caught in the selected area.',2),(5,2,'Curveball','EQUIP a flare orb that takes a curving path and detonates shortly after throwing. FIRE to curve the flare orb to the left, detonating and blinding any player who sees the orb. ALT FIRE to curve the flare orb to the right.',1),(6,2,'Hot Hands','EQUIP a fireball. Fire to throw a fireball that explodes after a set amount of time or upon hitting the ground, creating a lingering fire zone that damages enemies.',1),(7,2,'Blaze','EQUIP a flame wall. FIRE to create a line of flame that moves forward, creating a wall of fire that blocks vision and damages players passing through it. ALT FIRE to bend the wall in the direction of your crosshair.',1),(8,2,'Run it Back','INSTANTLY place a marker at PhoenixÂ´s location. While this ability is active, dying or allowing the timer to expire will end this ability and bring Phoenix back to this location with full health.',2),(9,3,'Slow Orb','EQUIP a slowing orb. FIRE to throw a slowing orb forward that detonates upon landing, creating a lingering field that slows players caught inside of it.',1),(10,3,'Healing Orb','EQUIP a healing orb. FIRE with your crosshairs over a damaged ally to activate a heal-over-time on them. ALT FIRE while Sage is damaged to activate a self heal-over-time.',1),(11,3,'Barrier Orb','EQUIP a barrier orb. FIRE places a solid wall. ALT FIRE rotates the targeter.',1),(12,3,'Resurrection','EQUIP a resurrection ability. FIRE with your crosshairs over a dead ally to begin resurrecting them. After a brief channel, the ally will be brought back to life with full health.',2),(13,4,'Shock Bolt','EQUIP a bow with a shock bolt. FIRE to send the explosive bolt forward, detonating upon collision and damaging players nearby. HOLD FIRE to extend the range of the projectile.',1),(14,4,'Recon Bolt','EQUIP a bow with a recon bolt. FIRE to send the recon bolt forward, activating upon collision and revealing the location of nearby enemies caught in the line of sight of the bolt. HOLD FIRE to extend the range of the projectile.',1),(15,4,'Owl Drone','EQUIP an owl drone. FIRE to deploy and take control of movement of the drone. While in control of the drone, FIRE to shoot a marking dart. This dart will reveal the location of any player struck by the dart.',1),(16,4,'HunterÂ´s Fury','EQUIP a bow with three long-range, wall-piercing energy blasts. FIRE to release an energy blast in a line in front of Sova, dealing damage and revealing the location of enemies caught in the line. This ability can be RE-USED up to two more times while the ability timer is active.',2),(17,5,'Poison Cloud','EQUIP a gas emitter. FIRE to throw the emitter that perpetually remains throughout the round. RE-USE the ability to create a toxic gas cloud at the cost of fuel. This ability can be RE-USED more than once and can be picked up to be REDEPLOYED.',1),(18,5,'Toxic Screen','EQUIP a gas emitter launcher. FIRE to deploy a long line of gas emitters. RE-USE the ability to create a tall wall of toxic gas at the cost of fuel. This ability can be RE-USED more than once.',1),(19,5,'Snake Bite','EQUIP a chemical launcher. FIRE to launch a canister that shatters upon hitting the floor, creating a lingering chemical zone that damages and slows enemies.',1),(20,5,'ViperÂ´s Pit','EQUIP a chemical sprayer. FIRE to spray a chemical cloud in all directions around Viper, creating a large cloud that reduces the vision range and maximum health of players inside of it. HOLD FIRE to cancel the cloud.',2),(21,6,'Cyber Cage','EQUIP a cyber cage. FIRE to toss the cyber cage in front of Cypher. ACTIVATE to create a zone that blocks vision.',1),(22,6,'Spycam','EQUIP a spycam. FIRE to place the spycam at the targeted location. RE-USE this ability to take control of the camera view. While in control of the camera, FIRE to shoot a marking dart. This dart will reveal the location of any player struck by the dart.',1),(23,6,'Trapwire','EQUIP a trapwire. FIRE to place a destructible and covert tripwire at the targeted location. RE-USE the ability to create a second tripwire. ACTIVATE a tripwire to create a connection between the placed tripwires, and reveal the location of all players who cross the tripwire.',1),(24,6,'Neural Theft','INSTANTLY use on a dead enemy player in your crosshairs to reveal the location of all living enemy players.',2),(25,7,'Devour','Enemies killed by Reyna leave behind Soul Orbs that last 3 seconds. INSTANTLY consume a nearby soul orb, rapidly healing for a short duration. Health gained through this skill exceeding 100 will decay over time. If EMPRESS is active, this skill will automatically cast and not consume the orb.',1),(26,7,'Dismiss','INSTANTLY consume a nearby soul orb, becoming intangible and invulnerable for a short duration.',1),(27,7,'Leer','EQUIP an ethereal, destructible eye. ACTIVATE to cast the eye a short distance forward. The eye will Nearsight all enemies who look at it.',1),(28,7,'Empress','INSTANTLY enter a frenzy, increasing firing, equip and reload speed dramatically. Scoring a kill renews the duration.',2),(29,8,'Alarmbot','EQUIP a covert Alarmbot. FIRE to deploy a bot that hunts down enemies that get in range. After reaching its target, the bot explodes, applying Vulnerable. HOLD EQUIP to recall a deployed bot.',1),(30,8,'Turret','EQUIP a Turret. FIRE to deploy a turret that fires at enemies in a 180-degree cone. HOLD EQUIP to recall the deployed turret.',1),(31,8,'Nanoswarm','EQUIP a Nanoswarm grenade. FIRE to throw the grenade. Upon landing, the Nanoswarm goes covert. ACTIVATE the Nanoswarm to deploy a damaging swarm of nanobots.',1),(32,8,'Lockdown','EQUIP the Lockdown device. FIRE to deploy the device. After a long windup, the device Detains all enemies caught in the radius. The device can be destroyed by enemies.',2),(33,9,'Flashpoint','EQUIP a blinding charge. FIRE the charge to set a fast-acting burst through the wall. The charge detonates to blind all players looking at it.',1),(34,9,'Fault Line','EQUIP a seismic blast. HOLD FIRE to increase the distance. RELEASE to set off the quake, dazing all players in its zone and in a line up to the zone.',1),(35,9,'Aftershock','EQUIP a fusion charge. FIRE the charge to set a slow-acting burst through the wall. The burst does heavy damage to all players caught in its zone.',1),(36,9,'Rolling Thunder','EQUIP a seismic charge. FIRE to send a cascading quake through all terrain in a large cone. The quake dazes and knocks up anyone caught in its zone.',2),(37,10,'Paranoia','INSTANTLY fire a shadow projectile forward, briefly reducing the vision range of all players it touches. This projectile can pass through walls.',1),(38,10,'Dark Cover','EQUIP a shadow orb and see its range indicator. FIRE to throw the shadow orb to the marked location, creating a long-lasting shadow sphere that blocks vision. HOLD FIRE while targeting to move the marker further away. HOLD ALT FIRE while targeting to move the marker closer.',1),(39,10,'Shrouded Step','EQUIP a shadow walk ability and see its range indicator. FIRE to begin a brief channel, then teleport to the marked location.',1),(40,10,'From the Shadows','EQUIP a tactical map. FIRE to begin teleporting to the selected location. While teleporting, Omen will appear as a Shade that can be destroyed by an enemy to cancel his teleport.',2),(41,11,'Updraft','INSTANTLY propel Jett high into the air.',1),(42,11,'Tailwind','INSTANTLY propel Jett in the direction she is moving. If Jett is standing still, she will propel forward.',1),(43,11,'Cloudburst','INSTANTLY throw a projectile that expands into a brief vision-blocking cloud on impact with a surface. HOLD the ability key to curve the smoke in the direction of your crosshair.',1),(44,11,'Blade Storm','EQUIP a set of highly accurate throwing knives that recharge on killing an opponent. FIRE to throw a single knife at your target. ALTERNATE FIRE to throw all remaining daggers at your target.',2),(45,12,'Blast Pack','INSTANTLY throw a Blast Pack that sticks to surfaces. RE-USE the ability after deployment to detonate, propelling Raze in the direction she is facing.',1),(46,12,'Paint Shells','EQUIP a cluster grenade. FIRE to throw the grenade, which does damage and creates sub-munitions, each doing damage to anyone in their range.',1),(47,12,'Boom Bot','EQUIP a Boom Bot. FIRE will deploy the bot, causing it to travel in a straight line on the ground, bouncing off walls. The Boom Bot will lock on to any enemies in its frontal cone and chase them, exploding for heavy damage if it reaches them.',1),(48,12,'Showstopper','EQUIP a rocket launcher. FIRE shoots a rocket that does massive area damage on contact with anything.',2),(49,13,'Trailblazer','EQUIP a Tasmanian tiger trinket. FIRE to send out and take control of the predator. While in control, FIRE to leap forward, exploding in a concussive blast and damaging directly hit enemies.',1),(50,13,'Guiding Light','EQUIP a hawk trinket. FIRE to send it forward. HOLD FIRE to guide the hawk in the direction of your crosshair. RE-USE while the hawk is in flight to transform it into a flash that goes off on impact.',1),(51,13,'Regrowth','EQUIP a healing trinket. HOLD FIRE to channel, healing allies in the cone and self. Can be reused until her healing pool is depleted.',1),(52,13,'Seekers','EQUIP a Seeker trinket. FIRE to send out three Seekers to track down the three closest enemies. If a Seeker reaches its target, it nearsights them.',2),(53,14,'Blindside','EQUIP to a rip unstable dimensional fragment. FIRE to throw the fragment, activating a flash that winds up once it collides with a hard surface in the world.',1),(54,14,'Gatecrash','EQUIP to harness a rift tether. FIRE to send the tether out moving forward. ALT FIRE to place a tether in place. ACTIVATE to teleport to the tetherÂ´s location.',1),(55,14,'Fakeout','EQUIP to send an echo that, when activated, mimics footsteps. FIRE to send the echo forward. ALT FIRE to place an echo in place. ACTIVATE the echo to send it forward.',1),(56,14,'Dimensional Drift','EQUIP a mask that can see between dimensions. FIRE to drift into YoruÂ´s dimension, unable to be affected or seen by enemies from the outside.',2),(57,15,'Nova Pulse','Place Stars in Astral Form (X) ACTIVATE a Star to detonate a Nova Pulse. The Nova Pulse charges briefly then strikes, concussing all players in its area.',1),(58,15,'Nebula','Place Stars in Astral Form (Ultimate Key). ACTIVATE a Star to transform it into a Nebula (smoke). USE a Star to Dissipate it, returning the Star to be placed in a new location after a delay. Dissipate briefly forms a fake Nebula at the Stars location before returning.',1),(59,15,'Gravity Well','Place Stars in Astral Form (X) ACTIVATE a Star to form a Gravity Well. Players in the area are pulled toward the center before it explodes, making them fragile.',1),(60,15,'Astral Form/Cosmic Divide','ACTIVATE to enter Astral Form where you can place Stars with PRIMARY FIRE. Stars can be reactivated later, transforming them into a Nova Pulse, Nebula, or Gravity Well. When Cosmic Divide is charged, use SECONDARY FIRE in Astral Form to begin aiming it, then PRIMARY FIRE to select two locations. An infinite Cosmic Divide connects the two points you select. Cosmic Divide blocks bullets and heavily dampens audio.',2),(61,16,'Flash/Drive','EQUIP a flash grenade. FIRE to throw the grenade. The flash grenade explodes after a short fuse, blinding any player who sees the explosion.',1),(62,16,'Zero/Point','EQUIP a suppression blade. FIRE to throw the blade, activating a suppress. The blade sticks to the first surface it hits, winds up, and suppresses anyone in the radius of the explosion.',1),(63,16,'Frag/Ment','EQUIP an explosive fragment. FIRE to throw the fragment. The fragment sticks to the floor and explodes multiple times, dealing near lethal damage at the center with each explosion.',1),(64,16,'Null/CMD','INSTANTLY overload with polarized radianite energy that pulses from KAY/O in a massive radius. Enemies hit with pulse are suppressed for a short duration.',2),(65,17,'Headhunter','ACTIVATE to equip a heavy pistol. ALT FIRE with the pistol equipped to aim down sights.',1),(66,17,'Rendezvous','EQUIP a teleport anchor. FIRE to place it on the ground. While on the ground and in range of the anchor, REACTIVATE to quickly teleport to the anchor. The anchor can be picked up to be REDEPLOYED.',1),(67,17,'Trademark','EQUIP a trap that scans for enemies. FIRE to place it on the ground. When a visible enemy comes in range, the trap counts down and then destabilizes the terrain around them, creating a lingering field that Slows players caught inside of it. The trap can be picked up to be REDEPLOYED.',1),(68,17,'Tour de Force','ACTIVATE to summon a powerful, custom sniper rifle that will kill an enemy with any direct hit to the upper body. ALT FIRE to aim down sights. Killing an enemy creates a lingering field that Slows players caught inside of it.',2),(69,18,'Relay Bolt','INSTANTLY throw an energy bolt that bounces once. Upon hitting each surface, the bolt electrifies the ground below with a concussive blast.',1),(70,18,'High Gear','INSTANTLY channel NeonÂ´s power for increased speed. When charged, ALT FIRE to trigger an electric slide. Slide charge resets every two kills.',1),(71,18,'Fast Lane','FIRE two energy lines forward on the ground that extends a short distance or until they hit a surface. The lines rise into walls of static electricity that block vision and damage enemies passing through them.',1),(72,18,'Overdrive','Unleash NeonÂ´s full power and speed for a short duration. FIRE to channel the power into a deadly lightning beam with high movement accuracy. The duration resets on each kill.',2),(73,19,'Seize','EQUIP an orb of nightmare ink. FIRE to throw the orb which will plummet to the ground after a set amount of time. Upon hitting the gound, the ink will explode and create a zone in which enemies who are caught in it cannot escape the zone by normal means. RE-USE the ability to drop the projectile early in-flight.',1),(74,19,'Haunt','Equip a nightmarish entity. FIRE to throw the orb which will plummet to the ground after a set amount of time. Upon hitting the ground, the orb will turn into a nightmarish entity that will reveal the location of enemies caught in its line of sight. Enemies can destroy this entity. RE-USE the ability to drop the projectile early in-flight.',1),(75,19,'Prowler','EQUIP a Prowler. FIRE will send the Prowler out, causing it to travel in a straight line. The Prowler will lock onto any enemies or trails in their frontal vision cone and chase them, nearsighting them if it reaches them. HOLD the FIRE button to steer the Prowler in the direction of your crosshair.',1),(76,19,'Nightfall','EQUIP the power of Fear. FIRE to send out a wave of nightmare energy that can traverse through walls. The energy creates a trail to the opponent as well as deafens and decays them.',2),(77,20,'Cove','EQUIP a sphere of shielding water. FIRE to throw. ALT FIRE to underhand throw. Upon impacting the ground, spawn a destructible water shield that blocks bullets.',1),(78,20,'High Tide','EQUIP a wall of water. FIRE to send the water forward along the ground. HOLD FIRE to guide the water in the direction of your crosshair, passing through the world, spawning a wall along the waterâ€™s path. ALT FIRE while bending to stop the water early. Players hit are SLOWED',1),(79,20,'Cascade','EQUIP a wave of water. FIRE to send the wave rolling forward and through walls. RE-USE to stop the wave. Players hit are SLOWED.',1),(80,20,'Reckoning','EQUIP the full power of your Artifact. FIRE to summon a geyser pool on the ground. Enemy players in the area are targeted by successive geyser strikes. Players caught within a strike are CONCUSSED.',2),(81,21,'Wingman','EQUIP Wingman FIRE to send Wingman forward seeking enemies. Wingman unleashes a concussive blast toward the first enemy he sees ALT FIRE when targeting a Spike site or planted Spike to have Wingman defuse or plant the Spike. To plant, Gekko must have the Spike in his inventory. When Wingman expires he reverts into a dormant globule INTERACT to reclaim the globule and gain another Wingman charge after a short cooldown.',1),(82,21,'Dizzy','EQUIP Dizzy FIRE to send Dizzy soaring forward through the air. Dizzy charges then unleashes plasma blasts at enemies in line of sight. Enemies hit by her plasma are blinded. When Dizzy expires she reverts into a dormant globule INTERACT to reclaim the globule and gain another Dizzy charge after a short cooldown.',1),(83,21,'Mosh pit','EQUIP Mosh FIRE to throw Mosh like a grenade ALT FIRE to throw underhand. Upon landing Mosh duplicates across a large area then after a short delay explodes.',1),(84,21,'Thrash','EQUIP Thrash FIRE to link with Thrashâ€™s mind and steer her through enemy territory ACTIVATE to lunge forward and explode, detaining any enemies in a small radius. When Thrash expires she reverts into a dormant globule INTERACT to reclaim the globule and gain another Thrash charge after a short cooldown. Thrash can be reclaimed once.',2),(85,22,'Sonic Sensor','EQUIP a Sonic Sensor. FIRE to deploy. The sensor monitors an area for enemies making sound. It concusses that area if footsteps, weapons fire, or significant noise are detected.',1),(86,22,'Barrier Mesh','EQUIP a Barrier Mesh disc. FIRE to throw forward. Upon landing, the disc generates barriers from the origin point that block character movement.',1),(87,22,'Gravnet','EQUIP a GravNet grenade. FIRE to throw. ALT FIRE to lob the grenade underhand. The GravNet detonates upon landing, forcing any enemies caught within to crouch and move slowly.',1),(88,22,'Annihilation','EQUIP a Nanowire Accelerator. FIRE to unleash a pulse of nanowires that captures the first enemy contacted. The cocooned enemy is pulled along a nanowire path and will die if they reach the end, unless they are freed. The nanowire cocoon is destructible.',2),(89,23,'undercut','EQUIP a molecular bolt. Fire to throw it forward, applying a brief FRAGILE to all players it touches. The bolt can pass through solid objects, including walls.',1),(90,23,'Double Tap','START a focus timer. Once completed, enter a flow state during which downed enemies you kill or damage generate an energy orb. Shooting this orb grants you a shield which absorbs one instance of damage from any source.',1),(91,23,'Contingency','EQUIP to assemble prismatic energy. FIRE to push an indestructible wall of energy forward that blocks bullets.',1),(92,23,'Kill Contract','EQUIP an interdimensional arena. FIRE to hurl a column of energy through the battlefield, pulling you and the first enemy hit into the arena. You and your opponent duel to the death.',2),(93,24,'Meddle','EQUIP a fragment of immortality essence. FIRE to throw the fragment, which erupts after a short delay and temporarily decays all targets caught inside.',1),(94,24,'Ruse','EQUIP to view the battlefield. FIRE to set the locations where Cloveâ€™s clouds will settle. ALT FIRE to confirm, launching clouds that block vision in the chosen areas. Clove can use this ability after death.',1),(95,24,'Pick-Me-Up','INSTANTLY absorb the life force of a fallen enemy that Clove damaged or killed, gaining haste and temporary health.',1),(96,24,'Not Dead Yet','After dying, ACTIVATE to resurrect. Once resurrected, Clove must earn a kill or a damaging assist within a set time or they will die.',2);
/*!40000 ALTER TABLE `Abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Abilities_Category`
--

DROP TABLE IF EXISTS `Abilities_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Abilities_Category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abilities_Category`
--

LOCK TABLES `Abilities_Category` WRITE;
/*!40000 ALTER TABLE `Abilities_Category` DISABLE KEYS */;
INSERT INTO `Abilities_Category` VALUES (1,'purcheable'),(2,'ultimate');
/*!40000 ALTER TABLE `Abilities_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Abilities_Store`
--

DROP TABLE IF EXISTS `Abilities_Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Abilities_Store` (
  `ability_id` int NOT NULL,
  `category_store_id` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ability_id`,`category_store_id`),
  KEY `category_store_id` (`category_store_id`),
  CONSTRAINT `Abilities_Store_ibfk_1` FOREIGN KEY (`ability_id`) REFERENCES `Abilities` (`ability_id`),
  CONSTRAINT `Abilities_Store_ibfk_2` FOREIGN KEY (`category_store_id`) REFERENCES `Category_Store` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abilities_Store`
--

LOCK TABLES `Abilities_Store` WRITE;
/*!40000 ALTER TABLE `Abilities_Store` DISABLE KEYS */;
INSERT INTO `Abilities_Store` VALUES (1,3,200.00),(2,3,200.00),(3,3,200.00),(4,3,200.00),(5,3,200.00),(6,3,200.00),(7,3,200.00),(8,3,200.00),(9,3,200.00),(10,3,200.00),(11,3,200.00),(12,3,200.00),(13,3,200.00),(14,3,200.00),(15,3,200.00),(16,3,200.00),(17,3,200.00),(18,3,200.00),(19,3,200.00),(20,3,200.00),(21,3,200.00),(22,3,200.00),(23,3,200.00),(24,3,200.00),(25,3,200.00),(26,3,200.00),(27,3,200.00),(28,3,200.00),(29,3,200.00),(30,3,200.00),(31,3,200.00),(32,3,200.00),(33,3,200.00),(34,3,200.00),(35,3,200.00),(36,3,200.00),(37,3,200.00),(38,3,200.00),(39,3,200.00),(40,3,200.00),(41,3,200.00),(42,3,200.00),(43,3,200.00),(44,3,200.00),(45,3,200.00),(46,3,200.00),(47,3,200.00),(48,3,200.00),(49,3,200.00),(50,3,200.00),(51,3,200.00),(52,3,200.00),(53,3,200.00),(54,3,200.00),(55,3,200.00),(56,3,200.00),(57,3,200.00),(58,3,200.00),(59,3,200.00),(60,3,200.00),(61,3,200.00),(62,3,200.00),(63,3,200.00),(64,3,200.00),(65,3,200.00),(66,3,200.00),(67,3,200.00),(68,3,200.00),(69,3,200.00),(70,3,200.00),(71,3,200.00),(72,3,200.00),(73,3,200.00),(74,3,200.00),(75,3,200.00),(76,3,200.00),(77,3,200.00),(78,3,200.00),(79,3,200.00),(80,3,200.00),(81,3,200.00),(82,3,200.00),(83,3,200.00),(84,3,200.00),(85,3,200.00),(86,3,200.00),(87,3,200.00),(88,3,200.00),(89,3,200.00),(90,3,200.00),(91,3,200.00),(92,3,200.00),(93,3,200.00),(94,3,200.00),(95,3,200.00),(96,3,200.00);
/*!40000 ALTER TABLE `Abilities_Store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category_Store`
--

DROP TABLE IF EXISTS `Category_Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category_Store` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category_Store`
--

LOCK TABLES `Category_Store` WRITE;
/*!40000 ALTER TABLE `Category_Store` DISABLE KEYS */;
INSERT INTO `Category_Store` VALUES (1,'Weapons'),(2,'Shields'),(3,'Abilities');
/*!40000 ALTER TABLE `Category_Store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Characters`
--

DROP TABLE IF EXISTS `Characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Characters` (
  `character_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `description` text,
  `url_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Characters`
--

LOCK TABLES `Characters` WRITE;
/*!40000 ALTER TABLE `Characters` DISABLE KEYS */;
INSERT INTO `Characters` VALUES (1,'Brimstone','Controller','Joining from the USA, Brimstoneâ€™s orbital arsenal ensures his squad always has the advantage. His ability to deliver utility precisely and safely make him the unmatched boots-on-the-ground commander.','url_imagen_omen'),(2,'Phoenix','Duelist','Hailing from the UK, Phoenix is a self-sufficient fragger who brings the heat. With flash and flare, he lights up the battlefield with his fiery abilities.','url_imagen_omen'),(3,'Sage','Sentinel','The bastion of China, Sage creates safety for herself and her team wherever she goes. Able to revive fallen friends and stave off forceful assaults, she provides a calm center to a hellish battlefield.','url_imagen_omen'),(4,'Sova','Initiator','Born from the eternal winter of RussiaÂ´s tundra, Sova tracks, finds, and eliminates enemies with ruthless efficiency and precision. His custom bow and incredible scouting abilities ensure that even if you run, you cannot hide.','url_imagen_omen'),(5,'Viper','Controller','The American chemist, Viper deploys an array of poisonous chemical devices to control the battlefield and cripple the enemyÂ´s vision. If the toxins donÂ´t kill her prey, her mind games surely will.','url_imagen_omen'),(6,'Cypher','Sentinel','The Moroccan information broker, Cypher is a one-man surveillance network who keeps tabs on the enemyÂ´s every move. No secret is safe. No maneuver goes unseen. Cypher is always watching.','url_imagen_omen'),(7,'Reyna','Duelist','Forged in the heart of Mexico, Reyna dominates single combat, popping off with each kill she scores. Her capability is only limited by her raw skill, making her highly dependent on performance.','url_imagen_omen'),(8,'Killjoy','Sentinel','The genius of Germany. Killjoy secures the battlefield with ease using her arsenal of inventions. If the damage from her gear doesnÂ´t stop her enemies, her robotsÂ´ debuff will help make short work of them.','url_imagen_omen'),(9,'Breach','Initiator','Breach fires powerful, targeted kinetic blasts to aggressively clear a path through enemy ground. The damage and disruption he inflicts ensure no fight is ever fair.','url_imagen_omen'),(10,'Omen','Controller','A phantom of a memory, Omen hunts in the shadows. He renders enemies blind, \nteleports across the field, then lets paranoia take hold as his foe scrambles to learn where he might strike next.','url_imagen_omen'),(11,'Jett','Duelist','Representing her home country of South Korea, Jett agile and evasive fighting style lets her take risks no one else can. \nShe runs circles around every skirmish, cutting enemies before they even know what hit them.','url_imagen_omen'),(12,'Raze','Duelist','Raze explodes out of Brazil with her big personality and big guns. With her blunt-force-trauma playstyle, \nshe excels at flushing entrenched enemies and clearing tight spaces with a generous dose of \"boom.\"','url_imagen_omen'),(13,'Skye','Initiator','Hailing from Australia, Skye and her band of beasts trail-blaze the way through hostile territory. \nWith her creations hampering the enemy, and her power to heal others, the team is strongest and safest by Skyeâ€™s side.','url_imagen_omen'),(14,'Yoru','Duelist','Japanese native, Yoru, rips holes straight through reality to infiltrate enemy lines unseen. \nUsing deception and aggression in equal measure, he gets the drop on each target before they know where to look.','url_imagen_omen'),(15,'Astra','Controller','Ghanaian Agent Astra harnesses the energies of the cosmos to reshape battlefields to her whim. With full command of her astral form and a talent for deep strategic foresight, sheÂ´s always eons ahead of her enemyÂ´s next move.','url_imagen_omen'),(16,'KAY/O','Initiator','KAY/O is a machine of war built for a single purpose: neutralizing radiants. His power to Suppress enemy abilities dismantles his opponents capacity to fight back, securing him and his allies the ultimate edge.','url_imagen_omen'),(17,'Chamber','Sentinel','Well-dressed and well-armed, French weapons designer Chamber expels aggressors with deadly precision. He leverages his custom arsenal to hold the line and pick off enemies from afar, with a contingency built for every plan.','url_imagen_omen'),(18,'Neon','Duelist','Filipino Agent Neon surges forward at shocking speeds, discharging bursts of bioelectric radiance as fast as her body generates it. She races ahead to catch enemies off guard, then strikes them down quicker than lightning.','url_imagen_omen'),(19,'Fade','Initiator','Turkish bounty hunter, Fade, unleashes the power of raw nightmares to seize enemy secrets. Attuned with terror itself, she hunts targets and reveals their deepest fearsâ€”before crushing them in the dark.','url_imagen_omen'),(20,'Harbor','Controller','Hailing from Indiaâ€™s coast, Harbor storms the field wielding ancient technology with dominion over water. He unleashes frothing rapids and crushing waves to shield his allies or pummel those that oppose him.','url_imagen_omen'),(21,'Gekko','Initiator','Gekko the Angeleno leads a tight-knit crew of calamitous creatures. His buddies bound forward, scattering enemies out of the way, with Gekko chasing them down to regroup and go again.','url_imagen_omen'),(22,'Deadlock','Sentinel','Norwegian operative Deadlock deploys an array of cutting-edge nanowire to secure the battlefield from even the most lethal assault. No one escapes her vigilant watch, nor survives her unyielding ferocity.','url_imagen_omen'),(23,'Iso','Duelist','Chinese fixer for hire, Iso falls into a flow state to dismantle the opposition. Reconfiguring ambient energy into bulletproof protection, he advances with focus towards his next duel to the death.','url_imagen_omen'),(24,'Clove','Controller','Scottish troublemaker Clove makes mischief for enemies in both the heat of combat and the cold of death. The young immortal keeps foes guessing, even from beyond the grave, their return to the living only ever a moment away.','url_imagen_omen');
/*!40000 ALTER TABLE `Characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items_Store`
--

DROP TABLE IF EXISTS `Items_Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items_Store` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `weapon_id` int DEFAULT NULL,
  `shield_id` int DEFAULT NULL,
  `ability_id` int DEFAULT NULL,
  `category_store_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `weapon_id` (`weapon_id`),
  KEY `shield_id` (`shield_id`),
  KEY `ability_id` (`ability_id`),
  KEY `category_store_id` (`category_store_id`),
  CONSTRAINT `Items_Store_ibfk_1` FOREIGN KEY (`weapon_id`) REFERENCES `Weapons` (`weapon_id`),
  CONSTRAINT `Items_Store_ibfk_2` FOREIGN KEY (`shield_id`) REFERENCES `Shields` (`shield_id`),
  CONSTRAINT `Items_Store_ibfk_3` FOREIGN KEY (`ability_id`) REFERENCES `Abilities` (`ability_id`),
  CONSTRAINT `Items_Store_ibfk_4` FOREIGN KEY (`category_store_id`) REFERENCES `Category_Store` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items_Store`
--

LOCK TABLES `Items_Store` WRITE;
/*!40000 ALTER TABLE `Items_Store` DISABLE KEYS */;
INSERT INTO `Items_Store` VALUES (1,1,NULL,NULL,1,0.00),(2,2,NULL,NULL,1,300.00),(3,3,NULL,NULL,1,450.00),(4,4,NULL,NULL,1,500.00),(5,5,NULL,NULL,1,800.00),(6,6,NULL,NULL,1,1100.00),(7,7,NULL,NULL,1,1600.00),(8,8,NULL,NULL,1,850.00),(9,9,NULL,NULL,1,1850.00),(10,10,NULL,NULL,1,2050.00),(11,11,NULL,NULL,1,2250.00),(12,12,NULL,NULL,1,2900.00),(13,13,NULL,NULL,1,2900.00),(14,14,NULL,NULL,1,950.00),(15,15,NULL,NULL,1,2400.00),(16,16,NULL,NULL,1,4700.00),(17,17,NULL,NULL,1,1600.00),(18,18,NULL,NULL,1,3200.00),(32,NULL,1,NULL,2,400.00),(33,NULL,2,NULL,2,1000.00),(35,NULL,NULL,1,3,200.00),(36,NULL,NULL,2,3,200.00),(37,NULL,NULL,3,3,200.00),(38,NULL,NULL,4,3,200.00),(39,NULL,NULL,5,3,200.00),(40,NULL,NULL,6,3,200.00),(41,NULL,NULL,7,3,200.00),(42,NULL,NULL,8,3,200.00),(43,NULL,NULL,9,3,200.00),(44,NULL,NULL,10,3,200.00),(45,NULL,NULL,11,3,200.00),(46,NULL,NULL,12,3,200.00),(47,NULL,NULL,13,3,200.00),(48,NULL,NULL,14,3,200.00),(49,NULL,NULL,15,3,200.00),(50,NULL,NULL,16,3,200.00),(51,NULL,NULL,17,3,200.00),(52,NULL,NULL,18,3,200.00),(53,NULL,NULL,19,3,200.00),(54,NULL,NULL,20,3,200.00),(55,NULL,NULL,21,3,200.00),(56,NULL,NULL,22,3,200.00),(57,NULL,NULL,23,3,200.00),(58,NULL,NULL,24,3,200.00),(59,NULL,NULL,25,3,200.00),(60,NULL,NULL,26,3,200.00),(61,NULL,NULL,27,3,200.00),(62,NULL,NULL,28,3,200.00),(63,NULL,NULL,29,3,200.00),(64,NULL,NULL,30,3,200.00),(65,NULL,NULL,31,3,200.00),(66,NULL,NULL,32,3,200.00),(67,NULL,NULL,33,3,200.00),(68,NULL,NULL,34,3,200.00),(69,NULL,NULL,35,3,200.00),(70,NULL,NULL,36,3,200.00),(71,NULL,NULL,37,3,200.00),(72,NULL,NULL,38,3,200.00),(73,NULL,NULL,39,3,200.00),(74,NULL,NULL,40,3,200.00),(75,NULL,NULL,41,3,200.00),(76,NULL,NULL,42,3,200.00),(77,NULL,NULL,43,3,200.00),(78,NULL,NULL,44,3,200.00),(79,NULL,NULL,45,3,200.00),(80,NULL,NULL,46,3,200.00),(81,NULL,NULL,47,3,200.00),(82,NULL,NULL,48,3,200.00),(83,NULL,NULL,49,3,200.00),(84,NULL,NULL,50,3,200.00),(85,NULL,NULL,51,3,200.00),(86,NULL,NULL,52,3,200.00),(87,NULL,NULL,53,3,200.00),(88,NULL,NULL,54,3,200.00),(89,NULL,NULL,55,3,200.00),(90,NULL,NULL,56,3,200.00),(91,NULL,NULL,57,3,200.00),(92,NULL,NULL,58,3,200.00),(93,NULL,NULL,59,3,200.00),(94,NULL,NULL,60,3,200.00),(95,NULL,NULL,61,3,200.00),(96,NULL,NULL,62,3,200.00),(97,NULL,NULL,63,3,200.00),(98,NULL,NULL,64,3,200.00),(99,NULL,NULL,65,3,200.00),(100,NULL,NULL,66,3,200.00),(101,NULL,NULL,67,3,200.00),(102,NULL,NULL,68,3,200.00),(103,NULL,NULL,69,3,200.00),(104,NULL,NULL,70,3,200.00),(105,NULL,NULL,71,3,200.00),(106,NULL,NULL,72,3,200.00),(107,NULL,NULL,73,3,200.00),(108,NULL,NULL,74,3,200.00),(109,NULL,NULL,75,3,200.00),(110,NULL,NULL,76,3,200.00),(111,NULL,NULL,77,3,200.00),(112,NULL,NULL,78,3,200.00),(113,NULL,NULL,79,3,200.00),(114,NULL,NULL,80,3,200.00),(115,NULL,NULL,81,3,200.00),(116,NULL,NULL,82,3,200.00),(117,NULL,NULL,83,3,200.00),(118,NULL,NULL,84,3,200.00),(119,NULL,NULL,85,3,200.00),(120,NULL,NULL,86,3,200.00),(121,NULL,NULL,87,3,200.00),(122,NULL,NULL,88,3,200.00),(123,NULL,NULL,89,3,200.00),(124,NULL,NULL,90,3,200.00),(125,NULL,NULL,91,3,200.00),(126,NULL,NULL,92,3,200.00),(127,NULL,NULL,93,3,200.00),(128,NULL,NULL,94,3,200.00),(129,NULL,NULL,95,3,200.00),(130,NULL,NULL,96,3,200.00);
/*!40000 ALTER TABLE `Items_Store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shields`
--

DROP TABLE IF EXISTS `Shields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shields` (
  `shield_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `resistance` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `url_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shield_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `Shields_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Category_Store` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shields`
--

LOCK TABLES `Shields` WRITE;
/*!40000 ALTER TABLE `Shields` DISABLE KEYS */;
INSERT INTO `Shields` VALUES (1,2,'Light Shield','Light Shields are the cheapest and weakest shields in the game. They provide 25 points of armor.',25,400.00,'url'),(2,2,'Heavy Shield','Heavy Shields are the most expensive and resistant shields in the game. They provide 50 points of armor.',50,1000.00,'url');
/*!40000 ALTER TABLE `Shields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Weapons`
--

DROP TABLE IF EXISTS `Weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Weapons` (
  `weapon_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `weapon_category_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `url_image` varchar(255) DEFAULT NULL,
  `fire_rate` float DEFAULT NULL,
  `fire_mode` varchar(50) DEFAULT NULL,
  `magazine` int DEFAULT NULL,
  `reload_time` int DEFAULT NULL,
  `equip_time` int DEFAULT NULL,
  `run_speed` int DEFAULT NULL,
  `reserve_ammo` int DEFAULT NULL,
  `wall_penetration` varchar(50) DEFAULT NULL,
  `close_legs_damage` int DEFAULT NULL,
  `medium_legs_damage` int DEFAULT NULL,
  `far_legs_damage` int DEFAULT NULL,
  `close_body_damage` int DEFAULT NULL,
  `medium_body_damage` int DEFAULT NULL,
  `far_body_damage` int DEFAULT NULL,
  `close_head_damage` int DEFAULT NULL,
  `medium_head_damage` int DEFAULT NULL,
  `far_head_damage` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`weapon_id`),
  KEY `category_id` (`category_id`),
  KEY `weapon_category_id` (`weapon_category_id`),
  CONSTRAINT `Weapons_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Category_Store` (`category_id`),
  CONSTRAINT `Weapons_ibfk_2` FOREIGN KEY (`weapon_category_id`) REFERENCES `Weapons_Category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Weapons`
--

LOCK TABLES `Weapons` WRITE;
/*!40000 ALTER TABLE `Weapons` DISABLE KEYS */;
INSERT INTO `Weapons` VALUES (1,1,1,'Classic','The Classic is a pistol that is available for free at the start of each round. It is semi-automatic and has a high fire rate.','url',6.75,'semi',12,2,1,6,36,'low',10,10,10,26,22,19,78,66,57,0.00),(2,1,1,'Shorty','The Shorty is a shotgun. It is semi-automatic and has a medium fire rate.','url',3.3,'semi',2,2,1,5,6,'low',9,5,2,11,6,3,22,12,6,300.00),(3,1,1,'Frenzy','The Frenzy is a pistol. It is automatic and has a high fire rate.','url',10,'auto',13,2,1,6,39,'low',22,17,17,26,21,21,78,63,63,450.00),(4,1,1,'Ghost','The Ghost is a pistol. It is semi-automatic and has a high fire rate.','url',6.75,'semi',15,2,1,6,45,'medium',25,25,21,30,30,25,105,105,87,500.00),(5,1,1,'Sheriff','The Sheriff is a pistol. It is semi-automatic and has a low fire rate.','url',4,'semi',6,2,1,5,24,'high',46,46,42,55,55,50,159,159,145,800.00),(6,1,2,'Stinger','The Stinger is a submachine gun. It is automatic and has a high fire rate.','url',16,'auto',20,2,1,6,60,'low',22,19,19,27,23,23,67,57,57,1100.00),(7,1,2,'Spectre','The Spectre is a submachine gun. It is automatic and has a high fire rate.','url',13.33,'auto',30,2,1,6,90,'low',10,10,10,26,22,18,78,66,54,1600.00),(8,1,3,'Bucky','The Bucky is a shotgun. It is semi-automatic and has a low fire rate.','url',1.1,'semi',5,2,1,5,10,'low',17,11,7,20,13,9,40,26,18,850.00),(9,1,3,'Judge','The Judge is a shotgun. It is semi-automatic and has a medium fire rate.','url',3.5,'auto',5,2,1,5,15,'low',14,8,5,17,10,7,34,20,14,1850.00),(10,1,4,'Bulldog','The Bulldog is a rifle. It is automatic and has a medium fire rate.','url',10,'auto',24,3,1,5,72,'medium',29,29,29,35,35,35,115,115,115,2050.00),(11,1,4,'Guardian','The Guardian is a rifle. It is semi-automatic and has a low fire rate.','url',5.25,'semi',12,3,1,5,36,'high',49,49,49,65,65,65,195,195,195,2250.00),(12,1,4,'Phantom','The Phantom is a rifle. It is automatic and has a medium fire rate.','url',11,'auto',30,3,1,5,60,'medium',33,29,26,39,35,31,156,140,124,2900.00),(13,1,4,'Vandal','The Vandal is a rifle. It is automatic and has a medium fire rate.','url',9.75,'auto',25,3,1,5,50,'medium',34,34,34,40,40,40,160,160,160,2900.00),(14,1,5,'Marshal','The Marshal is a sniper rifle. It is semi-automatic and has a low fire rate.','url',1.5,'semi',5,3,1,5,15,'medium',85,85,85,101,101,101,202,202,202,950.00),(15,1,5,'Outlaw','The Outlaw is a sniper rifle. It is semi-automatic and has a low fire rate.','url',2.75,'semi',2,2,1,5,10,'high',119,119,119,140,140,140,238,238,238,2400.00),(16,1,5,'Operator','The Operator is a sniper rifle. It is semi-automatic and has a low fire rate.','url',0.6,'semi',5,4,2,5,10,'high',120,120,120,150,150,150,255,255,255,4700.00),(17,1,6,'Ares','The Ares is a machine gun. It is automatic and has a high fire rate.','url',13,'auto',50,3,1,5,100,'high',25,25,23,30,30,28,72,72,67,1600.00),(18,1,6,'Odin','The Odin is a machine gun. It is automatic and has a high fire rate.','url',15.6,'auto',100,5,1,5,200,'high',32,32,26,38,38,31,95,95,77,3200.00);
/*!40000 ALTER TABLE `Weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Weapons_Category`
--

DROP TABLE IF EXISTS `Weapons_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Weapons_Category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Weapons_Category`
--

LOCK TABLES `Weapons_Category` WRITE;
/*!40000 ALTER TABLE `Weapons_Category` DISABLE KEYS */;
INSERT INTO `Weapons_Category` VALUES (1,'Pistols'),(2,'SMGs'),(3,'Shotguns'),(4,'Rifles'),(5,'Snipers'),(6,'Machine Guns');
/*!40000 ALTER TABLE `Weapons_Category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-18 10:14:12
