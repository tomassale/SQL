-- Se crea la base de datos y se posiciona en la misma
CREATE DATABASE DB_WineHouse;
USE DB_WineHouse;
-- Creacion de tablas
CREATE TABLE `user`(
	id_user INT NOT NULL AUTO_INCREMENT,
    user_mail VARCHAR(50) NOT NULL,
    id_personal INT NOT NULL,
    ip_user VARCHAR(20) NOT NULL,
    id_history INT NOT NULL,
    CONSTRAINT PK_USER PRIMARY KEY (id_user)
);
CREATE TABLE `personal`(
	id_personal INT NOT NULL AUTO_INCREMENT,
    gender VARCHAR(10) NOT NULL,
	user_first_name VARCHAR(20) NOT NULL,
    user_last_name VARCHAR(30) NOT NULL,
    CONSTRAINT PK_PERSONAL PRIMARY KEY (id_personal)
);
CREATE TABLE `account`(
    user_mail VARCHAR (50) NOT NULL,
	user_password VARCHAR(50) NOT NULL,
	register_account DATETIME NOT NULL,
    CONSTRAINT PK_ACCOUNT PRIMARY KEY (user_mail)
);
CREATE TABLE `address`(
    ip_user VARCHAR(20) NOT NULL,
	country_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    street VARCHAR (60) NOT NULL,
	CONSTRAINT PK_ADDRESS PRIMARY KEY (ip_user)
);
CREATE TABLE `history`(
	id_history INT NOT NULL AUTO_INCREMENT,
    person_history INT NOT NULL,
    name_page VARCHAR(50) NOT NULL,
    CONSTRAINT PK_HISTORY PRIMARY KEY (id_history)
);
CREATE TABLE `page`(
    name_page VARCHAR(50) NOT NULL,
	date_registered_page DATETIME NOT NULL,
    info TEXT NOT NULL,
	CONSTRAINT PK_PAGE PRIMARY KEY (name_page)
);
CREATE TABLE `data`(
	register_data INT NOT NULL AUTO_INCREMENT,
    db INT NOT NULL,
    id_user INT NOT NULL,
	date_data DATETIME NOT NULL,
	CONSTRAINT PK_DATA PRIMARY KEY (register_data)
);
CREATE TABLE `company`(
	duns_company VARCHAR(15),
    name_company VARCHAR(50),
    headquarters VARCHAR(50),
	register_data INT NOT NULL,
    requirement_purpose VARCHAR(200),
    CONSTRAINT PK_COMPANY PRIMARY KEY (duns_company)
);

-- Se vinculan las tablas mediante Foreign Key
ALTER TABLE user
	ADD FOREIGN KEY FK_USER_ADDRESS (ip_user) REFERENCES address (ip_user),
	ADD FOREIGN KEY FK_USER_ACCOUNT (user_mail) REFERENCES account (user_mail),
	ADD FOREIGN KEY FK_USER_HISTORY (id_history) REFERENCES history (id_history),
    ADD FOREIGN KEY FK_USER_PERSONAL (id_personal) REFERENCES personal (id_personal);
ALTER TABLE history	
	ADD FOREIGN KEY FK_HISTORY_PAGE (name_page) REFERENCES page (name_page);
ALTER TABLE data
	ADD FOREIGN KEY FK_DATA_USER (id_user) REFERENCES user (id_user);
ALTER TABLE company
	ADD FOREIGN KEY FK_COMPANY_DATA (register_data) REFERENCES data (register_data);

-- Se insertan los datos en las tablas
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Jaimie','Dufton');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Male','Der','Pinching');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Male','Jasun','Rossant');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Audrye','Guise');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Julietta','Frances');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Reiko','Forcer');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Male','Kerwinn','Walkinshaw');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Doti','Moller');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Aveline','Thorndale');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Ema','Outlaw');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Amelita','Emanuel');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Agatha','Vel');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Male','Charlton','Joderli');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Female','Deidre','Inman');
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`) VALUES (null,'Male','Ernie','Goscar');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('102.231.167.128','CN','Dachong','5709 Dunning Drive');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('107.191.247.221','KZ','Qulsary','4 Kim Circle');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('113.196.201.118','AR','Cipolletti','2 Moulton Plaza');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('125.207.210.105','IR','Kabudarahang','511 Green Alley');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('128.31.85.175','FR','Pouzauges','2791 Corscot Parkway');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('144.128.37.184','TO','Pangai','3244 Mosinee Park');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('170.2.31.135','FI','Lestijarvi','7 Pearson Parkway');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('182.104.207.141','FR','Levallois-Perret','1 Schiller Hill');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('198.1.168.51','NG','Maiyema','61 Carberry Point');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('199.52.19.14','US','Austin','6003 Moulton Road');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('23.206.0.188','BW','Ghanzi','7490 Hudson Parkway');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('237.155.207.205','CN','Dongqu','3726 Ramsey Avenue');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('240.253.8.236','ID','Manggis','560 Drewry Crossing');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('29.100.248.181','CN','Leiwang','334 Ilene Circle');
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) VALUES ('92.178.65.217','PT','Soure','91048 Village Green Junction');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Douglas-Walsh','2022-01-15 07:39:57','odio cras mi pede malesuada in imperdiet et commodo vulputate');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Erdman','2022-05-04 07:59:01','eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Graham and Wuckert','2021-09-30 15:21:13','aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Gutkowski-Franecki','2022-04-02 13:11:30','eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Heaney-Wolf','2021-12-25 03:34:42','erat fermentum justo nec condimentum neque sapien placerat ante nulla justo');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Hoppe-Harber','2022-06-09 02:14:28','malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Kub-Crist','2021-12-03 03:30:13','quis turpis sed ante vivamus tortor duis mattis egestas metus');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Leffler-Dickens','2021-12-26 11:09:50','id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Lubowitz and Luettgen','2022-05-14 21:15:37','justo aliquam quis turpis eget elit sodales scelerisque mauris sit');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Maggio and Pagac','2022-04-09 05:23:48','morbi a ipsum integer a nibh in quis justo maecenas rhoncus');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Powlowski and Sons','2022-03-14 10:22:06','phasellus sit amet erat nulla tempus vivamus in felis eu');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Shanahan Group','2022-04-03 19:56:46','sapien a libero nam dui proin leo odio porttitor id consequat in');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Stanton-Fay','2022-01-18 21:59:57','nam nulla integer pede justo lacinia eget tincidunt eget tempus');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Weber and Rohan','2022-03-07 13:20:18','pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) VALUES ('Wiza and Powlowski','2022-03-30 23:10:31','id nisl venenatis lacinia aenean sit amet justo morbi ut odio');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,1,'Gutkowski-Franecki');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,2,'Kub-Crist');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,3,'Douglas-Walsh');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,7,'Leffler-Dickens');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,4,'Leffler-Dickens');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,5,'Leffler-Dickens');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,6,'Shanahan Group');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,10,'Leffler-Dickens');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,12,'Leffler-Dickens');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,10,'Hoppe-Harber');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,2,'Leffler-Dickens');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,11,'Stanton-Fay');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,13,'Heaney-Wolf');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,8,'Leffler-Dickens');
INSERT INTO history (`id_history`,`person_history`,`name_page`) VALUES (null,14,'Powlowski and Sons');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('abelison3@hc360.com','DncpgPW','2022-05-08 05:51:13');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('afattorec@hud.gov','cNCT54Okf','2021-07-09 19:27:02');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('bbearward7@globo.com','7HI9JpnYMPRS','2022-05-16 03:30:05');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('dcassells1@bloomberg.com','4tKv989S1Lmk','2021-12-20 14:17:16');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('dmcinility6@rediff.com','u6jyjofjH','2021-11-04 23:19:33');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('fexonb@japanpost.jp','rIsxqOT','2022-06-26 14:16:24');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('ganwyl4@wordpress.com','qp3hpI8MBi','2022-05-02 02:49:30');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('hdoche9@diigo.com','0qbkEs0G','2022-02-21 13:12:03');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('mglowinski0@answers.com','ibbPz2v5Crk','2021-07-06 12:35:15');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('nblade8@creativecommons.org','DEYEVdeTfHz','2021-07-24 17:37:47');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('sbartkiewicze@shutterfly.com','e6riweUowTA','2022-02-07 11:19:51');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('scasol2@paypal.com','77RAlVtvA','2021-09-21 05:11:59');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('speacocka@g.co','p8yg6M','2021-12-25 18:47:14');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('tdelany5@arstechnica.com','uzVT84w40','2021-08-04 22:13:49');
INSERT INTO account (`user_mail`,`user_password`,`register_account`) VALUES ('twetternd@1und1.de','QcxNh6R','2021-12-21 19:37:56');
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'abelison3@hc360.com',2,'199.52.19.14',2);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'mglowinski0@answers.com',15,'125.207.210.105',15);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'dmcinility6@rediff.com',1,'170.2.31.135',1);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'sbartkiewicze@shutterfly.com',4,'23.206.0.188',4);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'bbearward7@globo.com',6,'29.100.248.181',6);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'afattorec@hud.gov',7,'102.231.167.128',7);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'ganwyl4@wordpress.com',10,'182.104.207.141',10);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'tdelany5@arstechnica.com',12,'240.253.8.236',12);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'nblade8@creativecommons.org',5,'107.191.247.221',5);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'dcassells1@bloomberg.com',9,'198.1.168.51',9);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'speacocka@g.co',11,'144.128.37.184',11);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'fexonb@japanpost.jp',14,'128.31.85.175',14);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'scasol2@paypal.com',13,'92.178.65.217',13);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'hdoche9@diigo.com',3,'237.155.207.205',3);
INSERT INTO user (`id_user`,`user_mail`,`id_personal`,`ip_user`,`id_history`) VALUES (null,'twetternd@1und1.de',8,'113.196.201.118',8);
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (1,1,1,'2021-11-02 16:14:08');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (2,1,2,'2022-02-08 03:28:34');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (3,1,3,'2021-09-07 18:53:41');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (4,1,4,'2022-05-26 01:54:42');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (5,1,5,'2021-10-01 11:59:15');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (6,1,6,'2022-02-24 08:56:40');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (7,1,7,'2022-03-14 03:45:43');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (8,2,8,'2022-03-14 13:21:06');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (9,2,9,'2021-12-26 16:18:36');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (10,2,10,'2022-04-09 21:10:50');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (11,2,11,'2021-07-20 23:10:01');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (12,2,12,'2022-04-17 02:25:04');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (13,2,13,'2021-10-24 11:31:37');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (14,2,14,'2022-02-28 17:45:37');
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) VALUES (15,2,15,'2022-05-19 08:34:54');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('04-413-3487','Jaxspan','Mibu',1,'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('07-679-8593','Realpoint','Podeebrady',1,'blandit mi in porttitor pede justo eu massa donec dapibus duis at');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('13-844-8586','Mudo','Leluo',5,'posuere nonummy integer non velit donec diam neque vestibulum eget vulputate');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('19-854-1813','Wikido','Carregado',7,'at turpis donec posuere metus vitae ipsum aliquam non mauris');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('33-055-2198','Browsecat','Yate-Barrage',2,'libero quis orci nullam molestie nibh in lectus pellentesque at nulla');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('35-063-1428','Feedspan','Cipanjang',12,'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('37-113-3087','Feedmix','Maroua',4,'varius integer ac leo pellentesque ultrices mattis odio donec vitae');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('40-965-0993','Vidoo','Khiliomodhi',6,'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('41-017-6232','Yata','Taguing',2,'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('43-365-5872','Twinte','Esmeraldas',5,'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('46-781-5086','Photofeed','Pantaibesar',4,'lectus aliquam sit amet diam in magna bibendum imperdiet nullam');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('50-512-7635','Bluejam','Ranizow',10,'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('81-510-2753','Gigazoom','Gununganyar',7,'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('93-730-6330','Skinix','Jayapura',8,'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu');
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) VALUES ('98-385-2640','Youspan','Tambakmerak',3,'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat');