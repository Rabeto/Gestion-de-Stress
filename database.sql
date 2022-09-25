BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Webapp_manage_stress" (
	"id"	integer NOT NULL,
	"Titre_MS"	varchar(50) NOT NULL,
	"Date_pub_MS"	datetime NOT NULL,
	"Fichier_MS"	varchar(100) NOT NULL,
	"Description_MS"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Webapp_ressources" (
	"id"	integer NOT NULL,
	"Titre_Ressource"	varchar(50) NOT NULL,
	"Fichier_Ressource"	varchar(100) NOT NULL,
	"Date_pub_Ressource"	datetime NOT NULL,
	"Description_Ressource"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Webapp_commentaires" (
	"id"	integer NOT NULL,
	"Titre_pub"	varchar(150) NOT NULL,
	"Comment_pub"	text NOT NULL,
	"Date_Comment_pub"	datetime NOT NULL,
	"Auteur_Comment_pub_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("Auteur_Comment_pub_id") REFERENCES "Webapp_utilisateur"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "Webapp_assistance" (
	"id"	integer NOT NULL,
	"Suivi_id"	bigint NOT NULL,
	"Cas_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("Suivi_id") REFERENCES "Webapp_utilisateur"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("Cas_id") REFERENCES "Webapp_message"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Webapp_news_post_Like" (
	"id"	integer NOT NULL,
	"news_post_id"	bigint NOT NULL,
	"utilisateur_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("utilisateur_id") REFERENCES "Webapp_utilisateur"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("news_post_id") REFERENCES "Webapp_news_post"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Webapp_message" (
	"id"	integer NOT NULL,
	"Date_send_msg"	datetime NOT NULL,
	"Content_msg"	text NOT NULL,
	"Object_msg"	varchar(150) NOT NULL,
	"User_send_msg_id"	bigint NOT NULL,
	"Status_msg"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("User_send_msg_id") REFERENCES "Webapp_utilisateur"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Webapp_room" (
	"id"	integer NOT NULL,
	"Theme"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Webapp_private_message" (
	"id"	integer NOT NULL,
	"Message"	varchar(1000) NOT NULL,
	"Date"	datetime NOT NULL,
	"User_id"	bigint NOT NULL,
	"Room"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("User_id") REFERENCES "Webapp_utilisateur"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Webapp_utilisateur" (
	"id"	integer NOT NULL,
	"Age"	integer,
	"Email"	varchar(254) NOT NULL,
	"Departement"	varchar(50) NOT NULL,
	"Fonction"	varchar(50) NOT NULL,
	"Username"	varchar(50) NOT NULL UNIQUE,
	"Password"	varchar(50) NOT NULL,
	"Image_profil"	varchar(100) NOT NULL,
	"Nom_Complet"	varchar(150) NOT NULL,
	"Status"	varchar(20) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Webapp_news_post" (
	"id"	integer NOT NULL,
	"Titre"	varchar(50) NOT NULL,
	"Date_pub"	datetime NOT NULL,
	"Type"	varchar(5) NOT NULL,
	"Fichier"	varchar(100) NOT NULL,
	"Auteur_pub_id"	bigint NOT NULL,
	"Contenu"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("Auteur_pub_id") REFERENCES "Webapp_utilisateur"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'Webapp','0001_initial','2022-06-08 08:12:28.996476'),
 (2,'Webapp','0002_auto_20220408_2211','2022-06-08 08:12:29.127982'),
 (3,'Webapp','0003_auto_20220409_0133','2022-06-08 08:12:29.255450'),
 (4,'Webapp','0004_auto_20220409_1232','2022-06-08 08:12:29.401471'),
 (5,'Webapp','0005_auto_20220409_1250','2022-06-08 08:12:29.546133'),
 (6,'Webapp','0006_auto_20220409_1430','2022-06-08 08:12:29.688740'),
 (7,'Webapp','0007_auto_20220409_1436','2022-06-08 08:12:29.844433'),
 (8,'Webapp','0008_auto_20220409_1506','2022-06-08 08:12:30.135417'),
 (9,'Webapp','0009_auto_20220410_2040','2022-06-08 08:12:30.429304'),
 (10,'Webapp','0010_auto_20220410_2139','2022-06-08 08:12:30.925639'),
 (11,'Webapp','0011_auto_20220410_2148','2022-06-08 08:12:31.313826'),
 (12,'Webapp','0012_delete_ressources','2022-06-08 08:12:31.666849'),
 (13,'Webapp','0013_ressources','2022-06-08 08:12:32.069285'),
 (14,'Webapp','0014_auto_20220411_1055','2022-06-08 08:12:32.215327'),
 (15,'Webapp','0015_delete_manage_stress','2022-06-08 08:12:32.335405'),
 (16,'Webapp','0016_manage_stress','2022-06-08 08:12:32.446482'),
 (17,'Webapp','0017_auto_20220411_1301','2022-06-08 08:12:32.559554'),
 (18,'Webapp','0018_auto_20220425_2150','2022-06-08 08:12:32.681638'),
 (19,'Webapp','0019_auto_20220426_0829','2022-06-08 08:12:32.829180'),
 (20,'Webapp','0020_comments','2022-06-08 08:12:33.087118'),
 (21,'Webapp','0021_remove_comments_auteur','2022-06-08 08:12:33.217271'),
 (22,'Webapp','0022_delete_comments','2022-06-08 08:12:33.341080'),
 (23,'Webapp','0023_comments','2022-06-08 08:12:33.464696'),
 (24,'Webapp','0024_auto_20220520_1131','2022-06-08 08:12:33.637520'),
 (25,'Webapp','0025_remove_comments_titre_pub','2022-06-08 08:12:33.815462'),
 (26,'Webapp','0026_remove_comments_com_pub_remove_user_adresse_and_more','2022-06-08 08:12:34.052499'),
 (27,'Webapp','0027_delete_comments','2022-06-08 08:12:34.271431'),
 (28,'Webapp','0028_comments','2022-06-08 08:12:34.408224'),
 (29,'Webapp','0029_rename_comments_commentaires_and_more','2022-06-08 08:12:34.542022'),
 (30,'Webapp','0030_delete_commentaires','2022-06-08 08:12:34.638525'),
 (31,'Webapp','0031_utilisateur_delete_user','2022-06-08 08:12:34.776013'),
 (32,'Webapp','0032_utilisateur_image_profil','2022-06-08 08:12:34.907169'),
 (33,'Webapp','0033_alter_utilisateur_image_profil','2022-06-08 08:12:35.054477'),
 (34,'Webapp','0034_news_post_auteur_pub_alter_news_post_contenu_and_more','2022-06-08 08:12:35.207059'),
 (35,'Webapp','0035_commentaires_alter_manage_stress_description_ms_and_more','2022-06-08 08:12:35.349917'),
 (36,'Webapp','0036_alter_news_post_auteur_pub','2022-06-08 08:12:35.487196'),
 (37,'Webapp','0037_alter_commentaires_auteur_comment_pub','2022-06-08 08:12:35.632726'),
 (38,'Webapp','0038_delete_commentaires','2022-06-08 08:12:35.762010'),
 (39,'Webapp','0039_alter_news_post_auteur_pub_commentaires','2022-06-08 08:12:36.272785'),
 (40,'Webapp','0040_remove_utilisateur_nom_remove_utilisateur_prenom_and_more','2022-06-08 08:12:36.597971'),
 (41,'Webapp','0041_alter_commentaires_auteur_comment_pub_and_more','2022-06-08 08:12:36.913696'),
 (42,'Webapp','0042_alter_commentaires_auteur_comment_pub','2022-06-08 08:12:37.290943'),
 (43,'Webapp','0043_remove_commentaires_id_and_more','2022-06-08 08:12:37.504564'),
 (44,'Webapp','0044_commentaires_id_and_more','2022-06-08 08:12:37.644141'),
 (45,'Webapp','0045_news_post_likes','2022-06-08 08:12:38.036639'),
 (46,'Webapp','0046_remove_news_post_likes_alter_news_post_auteur_pub','2022-06-08 08:12:38.178887'),
 (47,'Webapp','0047_remove_message_user_received_and_more','2022-06-08 08:12:38.358384'),
 (48,'contenttypes','0001_initial','2022-06-08 08:12:38.483383'),
 (49,'auth','0001_initial','2022-06-08 08:12:38.790715'),
 (50,'admin','0001_initial','2022-06-08 08:12:39.116981'),
 (51,'admin','0002_logentry_remove_auto_add','2022-06-08 08:12:39.303338'),
 (52,'admin','0003_logentry_add_action_flag_choices','2022-06-08 08:12:39.527171'),
 (53,'contenttypes','0002_remove_content_type_name','2022-06-08 08:12:39.701707'),
 (54,'auth','0002_alter_permission_name_max_length','2022-06-08 08:12:39.887183'),
 (55,'auth','0003_alter_user_email_max_length','2022-06-08 08:12:40.067754'),
 (56,'auth','0004_alter_user_username_opts','2022-06-08 08:12:40.227050'),
 (57,'auth','0005_alter_user_last_login_null','2022-06-08 08:12:40.371930'),
 (58,'auth','0006_require_contenttypes_0002','2022-06-08 08:12:40.740246'),
 (59,'auth','0007_alter_validators_add_error_messages','2022-06-08 08:12:40.895351'),
 (60,'auth','0008_alter_user_username_max_length','2022-06-08 08:12:41.343968'),
 (61,'auth','0009_alter_user_last_name_max_length','2022-06-08 08:12:41.495069'),
 (62,'auth','0010_alter_group_name_max_length','2022-06-08 08:12:41.625156'),
 (63,'auth','0011_update_proxy_permissions','2022-06-08 08:12:41.746237'),
 (64,'auth','0012_alter_user_first_name_max_length','2022-06-08 08:12:41.909345'),
 (65,'sessions','0001_initial','2022-06-08 08:12:42.143502'),
 (66,'Webapp','0048_assistance','2022-06-10 15:19:58.196389'),
 (67,'Webapp','0049_alter_assistance_status_assistance','2022-06-10 15:20:52.515613'),
 (68,'Webapp','0050_alter_assistance_status_assistance','2022-06-10 22:42:54.888724'),
 (69,'Webapp','0051_remove_assistance_status_assistance_and_more','2022-06-10 22:46:57.151817'),
 (70,'Webapp','0052_remove_message_status_assistance_message_status_msg','2022-06-10 22:48:24.624485'),
 (71,'Webapp','0053_alter_message_status_msg','2022-06-11 00:40:03.604211'),
 (72,'Webapp','0054_remove_assistance_cas_message_psy','2022-06-11 02:21:20.203026'),
 (73,'Webapp','0055_remove_message_psy','2022-06-11 02:21:20.423747'),
 (74,'Webapp','0056_assistance_cas','2022-06-11 02:21:20.608822'),
 (75,'Webapp','0057_reagir_news_post_likes','2022-06-27 20:17:58.223537'),
 (76,'Webapp','0058_remove_news_post_likes_delete_reagir','2022-06-27 20:26:00.389094'),
 (77,'Webapp','0059_like_post','2022-06-27 20:28:12.570331'),
 (78,'Webapp','0060_remove_like_post_reacteur_like_post_reacteur','2022-06-28 22:46:36.474199'),
 (79,'Webapp','0061_remove_like_post_reacteur_like_post_reacteur','2022-06-28 22:51:44.720002'),
 (80,'Webapp','0062_remove_like_post_reacteur_like_post_reacteur','2022-06-29 20:15:10.914863'),
 (81,'Webapp','0063_remove_like_post_reacteur_like_post_reacteur','2022-06-30 08:24:33.295416'),
 (82,'Webapp','0064_news_post_like_delete_like_post','2022-07-03 23:08:41.132634'),
 (83,'Webapp','0065_message_received_msg_alter_message_object_msg','2022-07-10 15:49:23.392655'),
 (84,'Webapp','0066_remove_message_received_msg','2022-07-10 16:29:04.135949'),
 (85,'Webapp','0067_room_private_message','2022-07-10 18:10:58.936738'),
 (86,'Webapp','0068_private_message_room','2022-07-10 19:53:05.631081'),
 (87,'Webapp','0069_alter_news_post_type_alter_utilisateur_status','2022-07-12 18:25:19.105203'),
 (88,'Webapp','0070_rename_profession_utilisateur_fonction','2022-07-13 10:57:00.476706'),
 (89,'Webapp','0071_alter_news_post_contenu','2022-07-15 20:59:58.929159'),
 (90,'Webapp','0072_alter_utilisateur_password','2022-08-17 20:49:41.855333');
INSERT INTO "Webapp_manage_stress" ("id","Titre_MS","Date_pub_MS","Fichier_MS","Description_MS") VALUES (1,'gerer son stress','2022-06-08 09:44:28.925969','FB_IMG_15755758912183431.jpg','exemple de cas'),
 (2,'azerty','2022-06-08 09:44:57.345835','FB_IMG_15755756549493307.jpg','asdezrfgtyhjuiolkm');
INSERT INTO "Webapp_ressources" ("id","Titre_Ressource","Fichier_Ressource","Date_pub_Ressource","Description_Ressource") VALUES (1,'Exemple 1','FB_IMG_15755776387992293.jpg','2022-06-08 09:42:17.530437','ceci est un exemple'),
 (2,'example 2','FB_IMG_15755776682477883.jpg','2022-06-08 09:42:55.877047','lorem ipsum'),
 (3,'exemple 3','FB_IMG_15755776170748244.jpg','2022-06-08 09:43:18.339703','qdsfhgdfsqwvx');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2022-06-08 09:39:56.830284','1','Utilisateur object (1)','[{"added": {}}]',11,1,1),
 (2,'2022-06-08 09:40:54.218756','2','Utilisateur object (2)','[{"added": {}}]',11,1,1),
 (3,'2022-06-08 09:41:27.072609','3','Utilisateur object (3)','[{"added": {}}]',11,1,1),
 (4,'2022-06-08 09:42:17.561236','1','Ressources object (1)','[{"added": {}}]',9,1,1),
 (5,'2022-06-08 09:42:55.903064','2','Ressources object (2)','[{"added": {}}]',9,1,1),
 (6,'2022-06-08 09:43:18.378754','3','Ressources object (3)','[{"added": {}}]',9,1,1),
 (7,'2022-06-08 09:44:29.040586','1','Manage_Stress object (1)','[{"added": {}}]',10,1,1),
 (8,'2022-06-08 09:44:57.388752','2','Manage_Stress object (2)','[{"added": {}}]',10,1,1),
 (9,'2022-06-08 09:45:45.493715','1','News_Post object (1)','[{"added": {}}]',8,1,1),
 (10,'2022-06-08 09:46:19.448617','2','News_Post object (2)','[{"added": {}}]',8,1,1),
 (11,'2022-06-08 09:46:19.867702','3','News_Post object (3)','[{"added": {}}]',8,1,1),
 (12,'2022-06-08 09:47:57.692955','4','News_Post object (4)','[{"added": {}}]',8,1,1),
 (13,'2022-06-08 09:47:58.133523','5','News_Post object (5)','[{"added": {}}]',8,1,1),
 (14,'2022-06-10 23:05:32.289805','1','Message object (1)','[{"changed": {"fields": ["Content msg"]}}]',7,1,2),
 (15,'2022-06-10 23:05:32.539978','1','Message object (1)','[]',7,1,2),
 (16,'2022-06-11 00:05:53.066355','2','Message object (2)','[{"added": {}}]',7,1,1),
 (17,'2022-06-11 00:40:43.130034','1','Message object (1)','',7,1,3),
 (18,'2022-06-11 00:40:47.686901','2','Message object (2)','',7,1,3),
 (19,'2022-06-11 00:56:25.308551','3','Assistance object (3)','',13,1,3),
 (20,'2022-06-11 00:56:25.473994','2','Assistance object (2)','',13,1,3),
 (21,'2022-06-11 01:17:21.817267','4','Assistance object (4)','',13,1,3),
 (22,'2022-06-11 01:20:44.248104','6','Assistance object (6)','',13,1,3),
 (23,'2022-06-11 01:43:33.533335','3','Message object (3)','',7,1,3),
 (24,'2022-06-11 01:58:35.116788','8','Assistance object (8)','',13,1,3),
 (25,'2022-06-11 02:21:06.046285','4','Message object (4)','',7,1,3),
 (26,'2022-06-11 02:26:00.874303','1','Message object (1)','[{"added": {}}]',7,1,1),
 (27,'2022-06-11 02:26:09.725062','1','Assistance object (1)','[{"added": {}}]',13,1,1),
 (28,'2022-06-27 21:33:11.727704','1','Like_Post object (1)','[{"added": {}}]',15,1,1),
 (29,'2022-06-27 21:34:53.304494','1','Like_Post object (1)','[{"changed": {"fields": ["Post"]}}]',15,1,2),
 (30,'2022-06-27 21:53:46.312444','1','Like_Post object (1)','[{"changed": {"fields": ["Reacteur"]}}]',15,1,2),
 (31,'2022-06-27 21:57:33.719289','1','Like_Post object (1)','[{"changed": {"fields": ["Reacteur"]}}]',15,1,2),
 (32,'2022-06-27 21:59:05.542194','1','Like_Post object (1)','',15,1,3),
 (33,'2022-06-27 22:00:53.742498','2','Like_Post object (2)','[{"added": {}}]',15,1,1),
 (34,'2022-06-27 22:01:11.689219','2','Like_Post object (2)','',15,1,3),
 (35,'2022-06-28 21:48:43.563154','5','News_Post object (5)','',8,1,3),
 (36,'2022-06-28 21:49:16.347916','3','News_Post object (3)','',8,1,3),
 (37,'2022-06-28 21:49:54.810931','3','Like_Post object (3)','[{"added": {}}]',15,1,1),
 (38,'2022-06-28 22:36:54.471616','7','Like_Post object (7)','',15,1,3),
 (39,'2022-06-28 22:36:54.666411','6','Like_Post object (6)','',15,1,3),
 (40,'2022-06-28 22:36:54.780351','5','Like_Post object (5)','',15,1,3),
 (41,'2022-06-28 22:36:54.903364','4','Like_Post object (4)','',15,1,3),
 (42,'2022-06-28 22:45:23.897817','8','Like_Post object (8)','',15,1,3),
 (43,'2022-06-28 22:45:33.231023','9','Like_Post object (9)','',15,1,3),
 (44,'2022-06-28 22:50:14.610344','2','Like_Post object (2)','[{"added": {}}]',15,1,1),
 (45,'2022-06-28 22:53:31.114337','2','Like_Post object (2)','',15,1,3),
 (46,'2022-06-29 20:10:23.372370','3','Like_Post object (3)','',15,1,3),
 (47,'2022-06-29 20:19:18.441002','2','Like_Post object (2)','[{"added": {}}]',15,1,1),
 (48,'2022-06-29 20:40:15.776317','2','Like_Post object (2)','',15,1,3),
 (49,'2022-06-29 20:40:15.903830','1','Like_Post object (1)','',15,1,3),
 (50,'2022-06-29 21:01:56.570735','18','Like_Post object (18)','',15,1,3),
 (51,'2022-06-29 21:14:08.395904','19','Like_Post object (19)','',15,1,3),
 (52,'2022-06-29 21:14:33.172383','20','Like_Post object (20)','',15,1,3),
 (53,'2022-06-29 21:39:14.868988','22','Like_Post object (22)','',15,1,3),
 (54,'2022-06-30 08:23:42.914603','30','Like_Post object (30)','',15,1,3),
 (55,'2022-06-30 08:23:43.299098','29','Like_Post object (29)','',15,1,3),
 (56,'2022-06-30 08:30:10.811377','3','Like_Post object (3)','[{"added": {}}]',15,1,1),
 (57,'2022-06-30 08:42:24.254755','7','Like_Post object (7)','',15,1,3),
 (58,'2022-06-30 11:27:25.315146','9','Like_Post object (9)','[{"added": {}}]',15,1,1),
 (59,'2022-06-30 13:58:58.875408','9','Like_Post object (9)','',15,1,3),
 (60,'2022-06-30 14:31:36.776409','10','Like_Post object (10)','',15,1,3),
 (61,'2022-06-30 14:32:03.806666','11','Like_Post object (11)','',15,1,3),
 (62,'2022-06-30 14:34:02.710481','12','Like_Post object (12)','',15,1,3),
 (63,'2022-06-30 14:35:40.507525','13','Like_Post object (13)','[{"added": {}}]',15,1,1),
 (64,'2022-07-03 22:04:42.254651','1','Utilisateur object (1)','[{"changed": {"fields": ["Password"]}}]',11,1,2),
 (65,'2022-07-03 22:50:37.839267','14','Like_Post object (14)','',15,1,3),
 (66,'2022-07-03 22:57:06.520081','17','Like_Post object (17)','',15,1,3),
 (67,'2022-07-03 23:02:17.518923','4','News_Post object (4)','',8,1,3),
 (68,'2022-07-03 23:02:17.655010','2','News_Post object (2)','',8,1,3),
 (69,'2022-07-03 23:02:17.788097','1','News_Post object (1)','',8,1,3),
 (70,'2022-07-03 23:27:11.818366','7','News_Post object (7)','[{"added": {}}]',8,1,1),
 (71,'2022-07-03 23:31:31.747640','7','News_Post object (7)','[{"changed": {"fields": ["Like"]}}]',8,1,2),
 (72,'2022-07-04 00:28:58.727673','1','Assistance object (1)','',13,1,3),
 (73,'2022-07-04 00:37:02.017993','1','Message object (1)','',7,1,3),
 (74,'2022-07-04 00:38:20.738917','2','Assistance object (2)','',13,1,3),
 (75,'2022-07-10 15:40:07.356868','2','Message object (2)','',7,1,3),
 (76,'2022-07-10 16:28:10.037705','1','Message object (1)','',7,1,3),
 (77,'2022-07-10 21:58:14.122223','6','Private_Message object (6)','',17,1,3),
 (78,'2022-07-10 21:58:14.240820','5','Private_Message object (5)','',17,1,3),
 (79,'2022-07-10 21:58:14.387637','4','Private_Message object (4)','',17,1,3),
 (80,'2022-07-10 21:58:14.494547','3','Private_Message object (3)','',17,1,3),
 (81,'2022-07-10 21:58:14.574399','2','Private_Message object (2)','',17,1,3),
 (82,'2022-07-10 22:04:48.230079','8','Private_Message object (8)','',17,1,3),
 (83,'2022-07-10 22:04:48.344466','7','Private_Message object (7)','',17,1,3),
 (84,'2022-07-10 22:32:59.420493','9','Private_Message object (9)','',17,1,3),
 (85,'2022-07-10 22:36:06.272392','11','Private_Message object (11)','',17,1,3),
 (86,'2022-07-10 22:36:06.420102','10','Private_Message object (10)','',17,1,3),
 (87,'2022-07-10 22:38:25.000095','1','Private_Message object (1)','',17,1,3),
 (88,'2022-07-10 22:57:08.694784','13','Private_Message object (13)','',17,1,3),
 (89,'2022-07-10 22:57:18.038171','12','Private_Message object (12)','',17,1,3),
 (90,'2022-07-10 22:59:18.425775','14','Private_Message object (14)','',17,1,3),
 (91,'2022-07-10 23:02:33.530374','15','Private_Message object (15)','',17,1,3),
 (92,'2022-07-10 23:03:00.020205','17','Private_Message object (17)','',17,1,3),
 (93,'2022-07-11 18:15:54.394897','1','Utilisateur object (1)','[{"changed": {"fields": ["Image profil"]}}]',11,1,2),
 (94,'2022-07-11 18:26:12.491939','1','Utilisateur object (1)','[{"changed": {"fields": ["Image profil"]}}]',11,1,2),
 (95,'2022-07-11 18:50:21.911367','1','Utilisateur object (1)','[{"changed": {"fields": ["Image profil"]}}]',11,1,2),
 (96,'2022-07-11 18:58:22.644866','1','Utilisateur object (1)','[{"changed": {"fields": ["Image profil"]}}]',11,1,2),
 (97,'2022-07-11 19:36:11.456306','1','Utilisateur object (1)','[{"changed": {"fields": ["Image profil"]}}]',11,1,2),
 (98,'2022-07-12 18:17:43.568826','3','Utilisateur object (3)','',11,1,3),
 (99,'2022-07-20 21:41:26.539993','7','News_Post object (7)','[{"changed": {"fields": ["Fichier"]}}]',8,1,2),
 (100,'2022-08-10 18:51:51.920164','7','News_Post object (7)','[{"changed": {"fields": ["Fichier"]}}]',8,1,2),
 (101,'2022-08-17 19:41:53.924195','2','Patrick Jane','[{"changed": {"fields": ["Password"]}}]',11,1,2),
 (102,'2022-08-17 20:10:00.858387','2','Patrick Jane','[{"changed": {"fields": ["Password"]}}]',11,1,2),
 (103,'2022-08-17 20:28:44.738775','2','Patrick Jane','[{"changed": {"fields": ["Password"]}}]',11,1,2),
 (104,'2022-08-17 20:51:36.870432','3','Ohatra fotsiny','[{"added": {}}]',11,1,1);
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'Webapp','message'),
 (8,'Webapp','news_post'),
 (9,'Webapp','ressources'),
 (10,'Webapp','manage_stress'),
 (11,'Webapp','utilisateur'),
 (12,'Webapp','commentaires'),
 (13,'Webapp','assistance'),
 (14,'Webapp','reagir'),
 (15,'Webapp','like_post'),
 (16,'Webapp','room'),
 (17,'Webapp','private_message');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_message','Can add message'),
 (26,7,'change_message','Can change message'),
 (27,7,'delete_message','Can delete message'),
 (28,7,'view_message','Can view message'),
 (29,8,'add_news_post','Can add news_ post'),
 (30,8,'change_news_post','Can change news_ post'),
 (31,8,'delete_news_post','Can delete news_ post'),
 (32,8,'view_news_post','Can view news_ post'),
 (33,9,'add_ressources','Can add ressources'),
 (34,9,'change_ressources','Can change ressources'),
 (35,9,'delete_ressources','Can delete ressources'),
 (36,9,'view_ressources','Can view ressources'),
 (37,10,'add_manage_stress','Can add manage_ stress'),
 (38,10,'change_manage_stress','Can change manage_ stress'),
 (39,10,'delete_manage_stress','Can delete manage_ stress'),
 (40,10,'view_manage_stress','Can view manage_ stress'),
 (41,11,'add_utilisateur','Can add utilisateur'),
 (42,11,'change_utilisateur','Can change utilisateur'),
 (43,11,'delete_utilisateur','Can delete utilisateur'),
 (44,11,'view_utilisateur','Can view utilisateur'),
 (45,12,'add_commentaires','Can add commentaires'),
 (46,12,'change_commentaires','Can change commentaires'),
 (47,12,'delete_commentaires','Can delete commentaires'),
 (48,12,'view_commentaires','Can view commentaires'),
 (49,13,'add_assistance','Can add assistance'),
 (50,13,'change_assistance','Can change assistance'),
 (51,13,'delete_assistance','Can delete assistance'),
 (52,13,'view_assistance','Can view assistance'),
 (53,14,'add_reagir','Can add reagir'),
 (54,14,'change_reagir','Can change reagir'),
 (55,14,'delete_reagir','Can delete reagir'),
 (56,14,'view_reagir','Can view reagir'),
 (57,15,'add_like_post','Can add like_ post'),
 (58,15,'change_like_post','Can change like_ post'),
 (59,15,'delete_like_post','Can delete like_ post'),
 (60,15,'view_like_post','Can view like_ post'),
 (61,16,'add_room','Can add room'),
 (62,16,'change_room','Can change room'),
 (63,16,'delete_room','Can delete room'),
 (64,16,'view_room','Can view room'),
 (65,17,'add_private_message','Can add private_ message'),
 (66,17,'change_private_message','Can change private_ message'),
 (67,17,'delete_private_message','Can delete private_ message'),
 (68,17,'view_private_message','Can view private_ message');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$320000$ayFbQ5wmsfK5w6OhHmXHue$WsXKlkrMlV+mkDnGK8h3R3X8oFHC9eHRUHFruKO/mHA=','2022-09-22 12:52:01.257167',1,'manfred','','',1,1,'2022-06-08 08:13:17.636988','');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('gb392yvy238sxteaonq22qwv76y47aqk','.eJxVjDsOwjAQBe_iGlnrH9iU9DmDtfaucQA5UpxUiLuTSCmgnZn33iLiutS4dp7jSOIqlDj9soT5yW0X9MB2n2Se2jKPSe6JPGyXw0T8uh3t30HFXrc1ezYlqexDuKBFKjYkY5XSADoxBUguBAYFcN64cRrYefKaiqHirROfL-BBN28:1nzr7F:uBNLFzRS7fXZSNgXDV8j2LzPtPXiRO9V3uFR-guDB_Q','2022-06-25 02:44:45.579370'),
 ('kxq9gth3bc834xzaf13vnbfje4wdutkh','.eJxVjDsOwjAQBe_iGlnrH9iU9DmDtfaucQA5UpxUiLuTSCmgnZn33iLiutS4dp7jSOIqlDj9soT5yW0X9MB2n2Se2jKPSe6JPGyXw0T8uh3t30HFXrc1ezYlqexDuKBFKjYkY5XSADoxBUguBAYFcN64cRrYefKaiqHirROfL-BBN28:1o3hmU:CX3YHEt5B9WXvYkAnVMrH9eFI7cPW1mqBy6wE1MtSNs','2022-07-05 17:35:14.586274'),
 ('10rz7f23uww33vxxa5cx27fueq07ypbu','.eJxVjMsOwiAQRf-FtSHDS8Gle7-BQGeQVgNJaVfGfxeSLnR7zr3nzXzYt-z3RqufkV2ZYKdfFsP0pDIELqE8Kp9q2dY58jHhh238XpFet2P7F8ih5f4mSypFMVnnLkEHTNpFpYWQADISOojGOQIBcO5cGQlkLFqJSWGy2vToyPXSUnPxWIl9vvnXPWI:1o6B06:tc38k-C2flWsVvDj1e1IUO1fxZSsudLes3MdYO9SaL8','2022-07-12 13:11:30.084570'),
 ('cb54z6oag1qgypt6kw6mrbwfegm59guc','.eJxVjMsOwiAQRf-FtSHDS8Gle7-BQGeQVgNJaVfGfxeSLnR7zr3nzXzYt-z3RqufkV2ZYKdfFsP0pDIELqE8Kp9q2dY58jHhh238XpFet2P7F8ih5f4mSypFMVnnLkEHTNpFpYWQADISOojGOQIBcO5cGQlkLFqJSWGy2vToyPXSUnPxWIl9vvnXPWI:1o6sJk:_o2iwA460OE7m3seDL_-qyH7bpuBAdi8J7DSKIUO1mc','2022-07-14 11:26:40.709557'),
 ('rx78k1zt4rw4pgnbdv2t0qo5uspqyng8','.eJxVjDsOwjAQBe_iGlnrH9iU9DmDtc6uSUIUS3FSIe6OI6WAdua9eYuI-zbEvfIaRxJ3ocTllyXsX7wcgiZcnkX2ZdnWMcljIk9bZVeI58e5_QsMWIf2Zs8mJ9X7EG5okbINyVilNIBOTAGSC4FBAVwbN04DO09eUzaUvXUteuRaaZ6K-HwBygI7YQ:1o89yd:aZaUdgSQtgJRgL8w_TrRGmVeE7TRTBpk-jlTg3-cFmA','2022-07-18 00:30:11.113408'),
 ('rtlegs3kvjy79s9hrsb0cg354rueeudd','.eJxVjMsOwiAQRf-FtSHDS8Gle7-BQGeQVgNJaVfGfxeSLnR7zr3nzXzYt-z3RqufkV2ZYKdfFsP0pDIELqE8Kp9q2dY58jHhh238XpFet2P7F8ih5f4mSypFMVnnLkEHTNpFpYWQADISOojGOQIBcO5cGQlkLFqJSWGy2vToyPXSUnPxWIl9vvnXPWI:1o8Sc9:4dtm5bOWL6tYZyF2oVNqx-U1SMv3GaSvFLgFMl81908','2022-07-18 20:24:13.735383'),
 ('q2qzeygcfnsvvrsxrkcwadzll3c1gzf8','.eJxVjDsOwjAQBe_iGlnrH9iU9DmDtc6uSUIUS3FSIe6OI6WAdua9eYuI-zbEvfIaRxJ3ocTllyXsX7wcgiZcnkX2ZdnWMcljIk9bZVeI58e5_QsMWIf2Zs8mJ9X7EG5okbINyVilNIBOTAGSC4FBAVwbN04DO09eUzaUvXUteuRaaZ6K-HwBygI7YQ:1oApIq:vW7sUVvpCu8QC6CqCRk5JK4Rxym4j3MLTD6j_2FZa_M','2022-07-25 09:02:04.128977'),
 ('ibz7bvtnneiqtlgyhw6a3w396xzhqnxh','eyJ1c2VyIjoibGpvIn0:1oAZMC:_zQ7xlrhhlmTZx1dQiU_ILreYpKymP8WKDiNTcrr5tE','2022-07-24 16:00:28.897588'),
 ('8c043c00fvy3xv4czw06euvd4d0rq8le','eyJ1c2VyIjoiam9obl9kb2UifQ:1oApJx:M_dC2pWay361pPrdbxYxU_OeJB9RJLEAXkR1pJx84zg','2022-07-25 09:03:13.385634'),
 ('nhct8e7qef2avzdvdx5n7w1ffsevz412','.eJxVjDsOwyAQBe9CHaHll0DK9DkDAu8S7EQgGbuKcveA5MbtzLz3ZXujld3ZUnPxWIldmA_7lv3gfsauxJnFML2pDIFLKK_Kp1q2dY58JPywjT8r0udxtKeDHFrua7KkUhSTde4WdMCkXVRaCAkgI6GDaJwjEADXzpWRQMailZgUJqsN-_0BFeA9Yg:1oAzC7:1YKw1kjjjmJ4hOIL-9dMDz8JfNmwehFL6cxaIvGOVNA','2022-07-25 19:35:47.883213'),
 ('h81zrxn4elpop66zy1ibldaa7m8q8c7r','.eJxVjMsOwiAQRf-FtSHDS8Gle7-BQGeQVgNJaVfGfxeSLnR7zr3nzXzYt-z3RqufkV2ZYKdfFsP0pDIELqE8Kp9q2dY58jHhh238XpFet2P7F8ih5f4mSypFMVnnLkEHTNpFpYWQADISOojGOQIBcO5cGQlkLFqJSWGy2vToyPXSUnPxWIl9vvnXPWI:1oBYyC:bRIT5gEWoh7JBx17IhFp24AGajSRw_-2XujpeeDOqbk','2022-07-27 09:47:48.071179'),
 ('18oaoqulln57rnc1kjap2mx4wbg2jxjz','eyJ1c2VyIjoiam9obl9kb2UifQ:1oCRYZ:cyJo_BYPUBeWntZS_YZqMXA05tTJ6VtTtR3ewRucao4','2022-07-29 20:04:59.573293'),
 ('h4gxbi7xpq2bmnw6pje4u1uchetx8ovt','.eJxVjDsOwjAQBe_iGlnrH9iU9DmDtfaucQA5UpxUiLuTSCmgnZn33iLiutS4dp7jSOIqlDj9soT5yW0X9MB2n2Se2jKPSe6JPGyXw0T8uh3t30HFXrc1ezYlqexDuKBFKjYkY5XSADoxBUguBAYFcN64cRrYefKaiqHirROfL-BBN28:1oEGpF:bs9gi_NOnrg-1TJsTi6WlaZlpaSjGM5fB0OUXutevMo','2022-08-03 21:01:45.721316'),
 ('v9awn60w4c36pqizm2ecsr1pzzqgf7ud','.eJxVjDsOwyAQBe9CHaHll0DK9DkDAu8S7EQgGbuKcveA5MbtzLz3ZXujld3ZUnPxWIldmA_7lv3gfsauxJnFML2pDIFLKK_Kp1q2dY58JPywjT8r0udxtKeDHFrua7KkUhSTde4WdMCkXVRaCAkgI6GDaJwjEADXzpWRQMailZgUJqsN-_0BFeA9Yg:1oEHR0:7QMHPr9Ujdbqa_BELt3E2FPPMjyozToUrfbcoV4u2DY','2022-08-03 21:40:46.305765'),
 ('6nwvwz1gvqcii02dwy2zuy2cwvemp9ld','.eJxVjMsOwiAQRf-FtSHDS8Gle7-BQGeQVgNJaVfGfxeSLnR7zr3nzXzYt-z3RqufkV2ZYKdfFsP0pDIELqE8Kp9q2dY58jHhh238XpFet2P7F8ih5f4mSypFMVnnLkEHTNpFpYWQADISOojGOQIBcO5cGQlkLFqJSWGy2vToyPXSUnPxWIl9vvnXPWI:1oFjff:GkpWCMPcRY8JBSzo03SW1cVZ8OxEHMRMe1xOfleT4lA','2022-08-07 22:01:55.350554'),
 ('5gmblb4r5afbjyk7kqpurkcwp4xst093','.eJxVjDsOwjAQBe_iGlnrH9iU9DmDtfaucQA5UpxUiLuTSCmgnZn33iLiutS4dp7jSOIqlDj9soT5yW0X9MB2n2Se2jKPSe6JPGyXw0T8uh3t30HFXrc1ezYlqexDuKBFKjYkY5XSADoxBUguBAYFcN64cRrYefKaiqHirROfL-BBN28:1oOPtQ:ezMW6RaxcrfbVwkhYUd-hKHOdz41gO6Z1PIvMJ6OudQ','2022-08-31 20:44:00.933366'),
 ('w31wocrcelo2h5orth0dfz81u2pwei89','.eJxVjDsOwjAQBe_iGlnrH9iU9DmDtfaucQA5UpxUiLuTSCmgnZn33iLiutS4dp7jSOIqlDj9soT5yW0X9MB2n2Se2jKPSe6JPGyXw0T8uh3t30HFXrc1ezYlqexDuKBFKjYkY5XSADoxBUguBAYFcN64cRrYefKaiqHirROfL-BBN28:1obLgP:EkddsjIX62bwp5gNDfatF_eMeaAy1CDbJLs5dg6AzkU','2022-10-06 12:52:01.464040');
INSERT INTO "Webapp_assistance" ("id","Suivi_id","Cas_id") VALUES (6,2,1);
INSERT INTO "Webapp_news_post_Like" ("id","news_post_id","utilisateur_id") VALUES (8,7,1);
INSERT INTO "Webapp_message" ("id","Date_send_msg","Content_msg","Object_msg","User_send_msg_id","Status_msg") VALUES (1,'2022-07-10 21:48:55.539145','exemple de contenu','stress des exams',1,'Pris en charge');
INSERT INTO "Webapp_room" ("id","Theme") VALUES (1,'stress des exams');
INSERT INTO "Webapp_private_message" ("id","Message","Date","User_id","Room") VALUES (16,'krkr m laolo ai','2022-07-10 23:02:39.686128',2,'stress des exams'),
 (18,'hey salut','2022-07-10 23:08:45.788520',2,'stress des exams'),
 (19,'cv','2022-07-10 23:11:22.682313',2,'stress des exams'),
 (20,'hey salut ravis de te discuter avec toi','2022-07-11 08:42:12.375236',1,'stress des exams'),
 (21,'quoi de neuf','2022-07-11 09:02:19.265533',2,'stress des exams'),
 (22,'il y a juste les exams qui arrivent','2022-07-11 09:03:34.355389',1,'stress des exams'),
 (23,'ah d''accord, bon chance','2022-07-11 09:22:41.952263',2,'stress des exams');
INSERT INTO "Webapp_utilisateur" ("id","Age","Email","Departement","Fonction","Username","Password","Image_profil","Nom_Complet","Status") VALUES (1,26,'azerty@qerty.com','gestion','etudiant','john_doe','john_doe','FB_IMG_15859993209638704_LV0RZy3.jpg','Dani Carvajal','Utilisateur Simple'),
 (2,32,'abc@def.com','qwerty_exemple_test_05','prof','ljo','123456789','FB_IMG_15866389033906876.jpg','Patrick Jane','Psychologue'),
 (3,26,'qwerty@azerty.co','qwerty','terster','ody','0123456789','2.PNG','Ohatra fotsiny','Utilisateur Simple');
INSERT INTO "Webapp_news_post" ("id","Titre","Date_pub","Type","Fichier","Auteur_pub_id","Contenu") VALUES (7,'ceci est un post','2022-08-10 18:51:51.895147','Posts','1656013174065.jpg',2,'lorem ipsum'),
 (8,'exemple de titre','2022-08-10 18:56:08.247478','Posts','',2,'ceci est un exemple de titre intitulee exemple titre'),
 (9,'exemple de titre nouveau','2022-08-10 19:04:05.633775','Posts','',2,'contenu de l''exemple de titre nouveau');
CREATE INDEX IF NOT EXISTS "Webapp_commentaires_Auteur_Comment_pub_id_588a3f6e" ON "Webapp_commentaires" (
	"Auteur_Comment_pub_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "Webapp_assistance_Suivi_id_54887df2" ON "Webapp_assistance" (
	"Suivi_id"
);
CREATE INDEX IF NOT EXISTS "Webapp_assistance_Cas_id_e7544f1b" ON "Webapp_assistance" (
	"Cas_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "Webapp_news_post_Like_news_post_id_utilisateur_id_d8fbea40_uniq" ON "Webapp_news_post_Like" (
	"news_post_id",
	"utilisateur_id"
);
CREATE INDEX IF NOT EXISTS "Webapp_news_post_Like_news_post_id_275b86c0" ON "Webapp_news_post_Like" (
	"news_post_id"
);
CREATE INDEX IF NOT EXISTS "Webapp_news_post_Like_utilisateur_id_1d929079" ON "Webapp_news_post_Like" (
	"utilisateur_id"
);
CREATE INDEX IF NOT EXISTS "Webapp_message_User_send_msg_id_a12903de" ON "Webapp_message" (
	"User_send_msg_id"
);
CREATE INDEX IF NOT EXISTS "Webapp_private_message_User_id_3d410896" ON "Webapp_private_message" (
	"User_id"
);
CREATE INDEX IF NOT EXISTS "Webapp_news_post_Auteur_pub_id_80df9623" ON "Webapp_news_post" (
	"Auteur_pub_id"
);
COMMIT;
