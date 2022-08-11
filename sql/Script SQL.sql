
-- -------- DATA BASE -------- --
-- Se crea la base de datos y se posiciona en la misma
DROP DATABASE IF EXISTS db_winehouse;
CREATE DATABASE db_winehouse;
USE db_winehouse;
SET AUTOCOMMIT = 1;

                            
-- -------- USERS -------- --
-- Creacion de usuarios con contraseña
DROP USER IF EXISTS tomas@localhost; 
DROP USER IF EXISTS diego@localhost;
CREATE USER tomas@localhost IDENTIFIED BY 'coder2022';
CREATE USER diego@localhost IDENTIFIED BY 'coder2022';
-- Otorgar permisos a leer las tablas de la db db_winehouse al usuario tomas
GRANT SELECT ON db_winehouse.* TO tomas@localhost;
-- Otorga permisos a leer, insertar y modificar las tablas de la db db_winehouse al usuario sergio
GRANT SELECT, INSERT, UPDATE ON db_winehouse.* TO diego@localhost;


-- -------- TABLES -------- --
-- Creacion de tablas
CREATE TABLE `logs`(
	id_logs INT NOT NULL AUTO_INCREMENT,
    table_logs VARCHAR(20),
    dml VARCHAR(20),
	registered_logs DATETIME,
    user VARCHAR(50),
    db VARCHAR(20),
    version VARCHAR(20),
    CONSTRAINT PK_LOGS PRIMARY KEY (id_logs)
);
CREATE TABLE `user`(
	id_user INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
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
    age INT NOT NULL,
    CONSTRAINT PK_PERSONAL PRIMARY KEY (id_personal)
);
CREATE TABLE `account`(
    email VARCHAR (50) NOT NULL,
	user_password VARCHAR(50) NOT NULL,
	register_account DATETIME NOT NULL,
    CONSTRAINT PK_ACCOUNT PRIMARY KEY (email)
);
CREATE TABLE `address`(
    ip_user VARCHAR(20) NOT NULL,
	country_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    street VARCHAR(60) NOT NULL,
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
    requirement_purpose TEXT,
    CONSTRAINT PK_COMPANY PRIMARY KEY (duns_company)
);


-- -------- FOREIGN KEY-------- --
-- Se vinculan las tablas mediante Foreign Key
ALTER TABLE user
	ADD FOREIGN KEY FK_USER_ADDRESS (ip_user) REFERENCES address (ip_user),
	ADD FOREIGN KEY FK_USER_ACCOUNT (email) REFERENCES account (email),
	ADD FOREIGN KEY FK_USER_HISTORY (id_history) REFERENCES history (id_history),
    ADD FOREIGN KEY FK_USER_PERSONAL (id_personal) REFERENCES personal (id_personal);
ALTER TABLE history	
	ADD FOREIGN KEY FK_HISTORY_PAGE (name_page) REFERENCES page (name_page);
ALTER TABLE data
	ADD FOREIGN KEY FK_DATA_USER (id_user) REFERENCES user (id_user);
ALTER TABLE company
	ADD FOREIGN KEY FK_COMPANY_DATA (register_data) REFERENCES data (register_data);


-- -------- VIEWS -------- --
-- Vista de la tabla logs
CREATE OR REPLACE VIEW logs_view as
	SELECT id_logs, table_logs, dml, registered_logs, user
    FROM logs;
-- Vista de la tabla user
CREATE OR REPLACE VIEW user_view as
	SELECT * 
    FROM user;
-- Vista de nombre y fecha registrada de la pagina
CREATE OR REPLACE VIEW page_view as 
	SELECT name_page, date_registered_page 
	FROM page;
-- Vista de nombre y apellido del usuario
CREATE OR REPLACE VIEW personal_view as 
	SELECT user_first_name, user_last_name 
	FROM personal; 
-- Vista de duns, nombre y requerimiento de las empresas
CREATE OR REPLACE VIEW company_view as 
	SELECT duns_company, name_company, requirement_purpose 
	FROM company;
-- Vista con join de user, account, history, personal y address
CREATE OR REPLACE VIEW join_view as
	SELECT u.id_user, p.user_first_name, p.user_last_name, ac.email, a.street, a.city, a.country_code, h.id_history
		FROM user u
		INNER JOIN address a
		ON u.ip_user = a.ip_user
		INNER JOIN account ac
		ON ac.email = u.email
		INNER JOIN history h
		ON h.id_history = u.id_history
        INNER JOIN personal p
        ON p.id_personal = u.id_personal
    ;
    
    
-- -------- FUNCTIONS -------- --
-- Funcion SQL muestra id mediante nombre y apellido de personal
DROP FUNCTION IF EXISTS `user_id`;
DELIMITER $$
CREATE FUNCTION `user_id`(name VARCHAR(20), last_name VARCHAR(20)) RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
	DECLARE id_u VARCHAR(50);
    SET id_u = (SELECT id_personal FROM personal WHERE 
					user_first_name IN (SELECT user_first_name FROM personal WHERE user_first_name = name) 
						AND 
					user_last_name IN (SELECT user_last_name FROM personal WHERE user_last_name = last_name)
				);
	IF isnull(id_u) THEN  
		RETURN CONCAT('Nombre o apellido invalido');
	ELSE 
	    RETURN CONCAT('ID usuario: ',id_u);
	END IF;
END$$

-- Funcion SQL muestra duns mediante nombre de empresa
DROP FUNCTION IF EXISTS `company_duns`;
DELIMITER $$
CREATE FUNCTION `company_duns`(name VARCHAR(20)) RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
	DECLARE duns_c VARCHAR(50);
    SET duns_c = (SELECT duns_company FROM company WHERE 
					name_company IN (SELECT name_company FROM company WHERE name_company = name) 
				);
	IF isnull(duns_c) THEN  
		RETURN CONCAT('Nombre invalido');
	ELSE 
	    RETURN CONCAT('duns empresa: ',duns_c);
	END IF;
END$$

-- Funcion SQL muestra descripcion mediante nombre de pagina
DROP FUNCTION IF EXISTS `page_info`;
DELIMITER $$
CREATE FUNCTION `page_info`(name VARCHAR(20)) RETURNS TEXT
READS SQL DATA
BEGIN
	DECLARE info_p TEXT;
    SET info_p = (SELECT info FROM page WHERE 
					name_page IN (SELECT name_page FROM page WHERE name_page = name) 
				);
	IF isnull(info_p) THEN  
		RETURN CONCAT('Nombre invalido');
	ELSE 
	    RETURN CONCAT('Descripcion empresa: ',info_p);
	END IF;
END$$

-- Funcion SQL muestra db correspondiente mediante id de usuario
DROP FUNCTION IF EXISTS `data_db`;
DELIMITER $$
CREATE FUNCTION `data_db`(id_u INT) RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
	DECLARE db_d INT;
    SET db_d = (SELECT db FROM data WHERE 
					id_user IN (SELECT id_user FROM user WHERE id_user = id_u) 
				);
	IF isnull(db_d) THEN  
		RETURN CONCAT('Id invalido');
	ELSE 
	    RETURN CONCAT('Base de datos: ', db_d);
	END IF;
END$$

-- Funcion SQL muestra cantidad de sentencias DML mediante nombre de usuario, sentencia y tabla
DROP FUNCTION IF EXISTS `logs_id`;
DELIMITER $$
CREATE FUNCTION `logs_id`(p_user VARCHAR(50), p_dml VARCHAR(20), p_table_logs VARCHAR(20)) RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
	DECLARE id_l INT;
    SET id_l = (SELECT COUNT(id_logs) FROM logs WHERE 
					user IN (SELECT user FROM logs WHERE user = p_user) 
										AND
				    dml IN (SELECT dml FROM logs WHERE dml = p_dml)
										AND
					table_logs IN (SELECT table_logs FROM logs WHERE table_logs = p_table_logs)
				);
	IF isnull(id_l) THEN  
		RETURN CONCAT('User, sentencia o tabla invalido');
	ELSE 
	    RETURN CONCAT('Cantidad de movimientos: ', id_l);
	END IF;
END$$


-- -------- PROCEDURES -------- --
-- Stored Procedure ordena campo de tabla con especificacion de asc or desc
DROP PROCEDURE IF EXISTS `sp_get_order`;
DELIMITER $$
CREATE PROCEDURE `sp_get_order`(IN p_table VARCHAR(50), IN p_field VARCHAR(50), IN p_ord VARCHAR(20))
BEGIN
	IF p_table = '' THEN
		SELECT 'Seleccione tabla' ERROR;
	ELSE
		SET @order_table = CONCAT(' ', p_table);
		IF p_field = '' THEN
			SET @order_field = '';
		ELSE
			IF p_ord = '' THEN
				SET @order_way = '';
			ELSE
				SET @order_field = CONCAT(' ORDER BY ', p_field);
                SET @order_way = CONCAT(' ', upper(p_ord));
			END IF;
		END IF;
    END IF;
	SET @clausula = CONCAT('SELECT * FROM ', @order_table, @order_field, @order_way);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END$$

-- Stored procedure insertar datos en tablas --
DROP PROCEDURE IF EXISTS `sp_insert_address`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_address`(
	IN p_ip_user VARCHAR(20), 
    IN p_country_code VARCHAR(50), 
    IN p_city VARCHAR(50), 
    IN p_street VARCHAR(50))
BEGIN
	IF p_ip_user = '' OR p_country_code = '' OR p_city = '' OR p_street = '' THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) 
        VALUES (p_ip_user, p_country_code, p_city, p_street);
        SELECT * FROM address a WHERE a.ip_user = p_ip_user; 
	END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_history`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_history`(
	IN p_person_history INT, 
    IN p_name_page VARCHAR(50))
BEGIN
	IF p_person_history = 0 OR p_name_page = '' THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO history (`id_history`,`person_history`,`name_page`) 
        VALUES (NULL, p_person_history, p_name_page);
        SELECT MAX(id_history) id, person_history, name_page FROM history;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_page`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_page`(
	IN p_name_page VARCHAR(50), 
    IN p_date_registered_page DATETIME, 
    IN p_info TEXT)
BEGIN
	IF p_name_page = '' OR p_date_registered_page = '' OR p_info = '' THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO page (`name_page`,`date_registered_page`,`info`) 
        VALUES (p_name_page, p_date_registered_page, p_info);
        SELECT * FROM page p WHERE p.name_page = p_name_page; 
	END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_data`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_data`(
	IN p_db INT, 
    IN p_id_user INT)
BEGIN
	IF p_db = '' OR p_id_user = '' THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) 
        VALUES (NULL, p_db, p_id_user, NULL);
        SELECT MAX(register_data) id, db, id_user, date_data date FROM data;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_company`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_company`(
	IN p_duns_company VARCHAR(15), 
    IN p_name_company VARCHAR(50), 
    IN p_headquarters VARCHAR(50), 
    IN p_register_data INT, 
    IN p_requirement_purpose VARCHAR(200))
BEGIN
	IF p_duns_company = '' OR p_name_company = '' OR p_headquarters = '' OR p_register_data = 0 OR p_requirement_purpose = '' THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) 
        VALUES (p_duns_company, p_name_company, p_headquarters, p_register_data, p_requirement_purpose);
        SELECT * FROM company c WHERE c.duns_company = p_duns_company; 
	END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_user`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_user`(
	IN p_email VARCHAR(50), 
    IN p_id_personal INT, 
    IN p_ip_user VARCHAR(20), 
    IN p_id_history INT)
BEGIN
	IF p_email = '' OR p_id_personal = 0 OR p_ip_user = '' OR p_id_history = 0 THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO user (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) 
        VALUES (p_duns_company, p_name_company, p_headquarters, p_register_data, p_requirement_purpose);
        SELECT MAX(id_user) id, email email, id_personal, ip_user ip, id_history FROM user;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_personal`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_personal`(
	IN p_gender VARCHAR(10), 
    IN p_first_name VARCHAR(50), 
    IN p_last_name VARCHAR(30), 
    IN p_age INT)
BEGIN
	IF p_gender = '' OR p_first_name = '' OR p_last_name = '' OR p_age = 0  THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`,`age`) 
        VALUES (NULL, p_gender, p_first_name, p_last_name, p_age);
        SELECT MAX(id_personal) id, gender, user_first_name first_name, user_last_name last_name, age FROM personal;
	END IF;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_account`;
DELIMITER $$
CREATE PROCEDURE `sp_insert_account`(
	IN p_email VARCHAR(50), 
    IN p_user_password VARCHAR(50), 
    IN p_register_account DATETIME)
BEGIN
	IF p_email = '' OR p_user_password = '' OR p_register_account = '' THEN
		SELECT 'Parametro faltante o invalido' ERROR;
	ELSE
        INSERT INTO account (`email`,`user_password`,`register_account`) 
        VALUES (p_email, p_user_password, p_register_account);
        SELECT * FROM account a WHERE a.email = p_email; 
	END IF;
END$$

-- Stored procedure eliminar datos en tablas
DROP PROCEDURE IF EXISTS `sp_delete_address`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_address`(IN p_ip_user VARCHAR(15))
BEGIN
	DELETE FROM user u WHERE u.ip_user = p_ip_user;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_history`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_history`(IN p_id_history VARCHAR(15))
BEGIN
	DELETE FROM history h WHERE h.id_history = p_id_history;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_page`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_page`(IN p_name_page VARCHAR(15))
BEGIN
	DELETE FROM page p WHERE p.name_page = p_name_page;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_data`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_data`(IN p_register_data VARCHAR(15))
BEGIN
	DELETE FROM data d WHERE d.register_data = p_register_data;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_company`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_company`(IN p_duns_company VARCHAR(15))
BEGIN
	DELETE FROM company c WHERE c.duns_company = p_duns_company;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_personal`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_personal`(IN p_id_personal VARCHAR(15))
BEGIN
	DELETE FROM personal p WHERE p.id_personal = p_id_personal;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_user`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_user`(IN p_id_user VARCHAR(15))
BEGIN
	DELETE FROM user u WHERE u.id_user = p_id_user;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$

DROP PROCEDURE IF EXISTS `sp_delete_account`;
DELIMITER $$
CREATE PROCEDURE `sp_delete_account`(IN p_email VARCHAR(15))
BEGIN
	DELETE FROM account a WHERE a.email = p_email;
    SELECT 'Elemento eliminado exitosamente' EXITOSO;
END$$


-- -------- TRIGGERS -------- --
-- Triggers before insert tablas registro logs
CREATE TRIGGER BEF_INS_personal_logs
BEFORE INSERT ON personal
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "personal", "Insert", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_INS_address_logs
BEFORE INSERT ON address
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "address", "Insert", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_INS_account_logs
BEFORE INSERT ON account
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "account", "Insert", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_INS_history_logs
BEFORE INSERT ON history
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "history", "Insert", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_INS_user_logs
BEFORE INSERT ON user
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "user", "Insert", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_INS_page_logs
BEFORE INSERT ON page
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "page", "Insert", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_INS_data_logs
BEFORE INSERT ON data
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "data", "Insert", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_INS_company_logs
BEFORE INSERT ON company
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "company", "Insert", NOW(), USER(), DATABASE(), VERSION());

-- Triggers before delete tablas registro logs
CREATE TRIGGER BEF_DEL_personal_logs
BEFORE DELETE ON personal
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "personal", "Delete", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_DEL_address_logs
BEFORE DELETE ON address
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "address", "Delete", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_DEL_account_logs
BEFORE DELETE ON account
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "account", "Delete", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_DEL_history_logs
BEFORE DELETE ON history
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "history", "Delete", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_DEL_user_logs
BEFORE DELETE ON user
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "user", "Delete", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_DEL_page_logs
BEFORE DELETE ON page
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "page", "Delete", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_DEL_data_logs
BEFORE DELETE ON data
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "data", "Delete", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_DEL_company_logs
BEFORE DELETE ON company
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "company", "Delete", NOW(), USER(), DATABASE(), VERSION());

-- Triggers before update tablas registro logs
CREATE TRIGGER BEF_UPD_personal_logs
BEFORE UPDATE ON personal
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "personal", "Update", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_UPD_address_logs
BEFORE UPDATE ON address
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "address", "Update", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_UPD_account_logs
BEFORE UPDATE ON account
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "account", "Update", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_UPD_history_logs
BEFORE UPDATE ON history
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "history", "Update", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_UPD_user_logs
BEFORE UPDATE ON user
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "user", "Update", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_UPD_page_logs
BEFORE UPDATE ON page
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "page", "Update", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_UPD_data_logs
BEFORE UPDATE ON data
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "data", "Update", NOW(), USER(), DATABASE(), VERSION());

CREATE TRIGGER BEF_UPD_company_logs
BEFORE UPDATE ON company
FOR EACH ROW
INSERT INTO logs VALUES (NULL, "company", "Update", NOW(), USER(), DATABASE(), VERSION());


-- -------- INSERTS -------- --
-- Se insertan los datos en las tablas
INSERT INTO personal (`id_personal`,`gender`,`user_first_name`,`user_last_name`,`age`) 
VALUES  (null,'Female','Jaimie','Dufton', 30),
	    (null,'Male','Jasun','Rossant', 55),
		(null,'Female','Audrye','Guise', 70),
		(null,'Female','Julietta','Frances', 46),
		(null,'Female','Reiko','Forcer', 21),
		(null,'Male','Kerwinn','Walkinshaw', 17),
		(null,'Female','Doti','Moller', 61),
		(null,'Female','Aveline','Thorndale', 19),
		(null,'Female','Ema','Outlaw', 23),
		(null,'Female','Amelita','Emanuel', 41),
		(null,'Female','Agatha','Vel', 86),
		(null,'Male','Charlton','Joderli', 37),
		(null,'Female','Deidre','Inman', 75),
		(null,'Male','Ernie','Goscar', 46),
		(null,'Male','Der','Pinching', 76);
INSERT INTO address (`ip_user`,`country_code`,`city`,`street`) 
VALUES  ('102.231.167.128','CN','Dachong','5709 Dunning Drive'),
		('107.191.247.221','KZ','Qulsary','4 Kim Circle'),
		('113.196.201.118','AR','Cipolletti','2 Moulton Plaza'),
		('125.207.210.105','IR','Kabudarahang','511 Green Alley'),
		('128.31.85.175','FR','Pouzauges','2791 Corscot Parkway'),
		('144.128.37.184','TO','Pangai','3244 Mosinee Park'),
		('170.2.31.135','FI','Lestijarvi','7 Pearson Parkway'),
		('182.104.207.141','FR','Levallois-Perret','1 Schiller Hill'),
		('198.1.168.51','NG','Maiyema','61 Carberry Point'),
		('199.52.19.14','US','Austin','6003 Moulton Road'),
		('23.206.0.188','BW','Ghanzi','7490 Hudson Parkway'),
		('237.155.207.205','CN','Dongqu','3726 Ramsey Avenue'),
		('240.253.8.236','ID','Manggis','560 Drewry Crossing'),
		('29.100.248.181','CN','Leiwang','334 Ilene Circle'),
		('92.178.65.217','PT','Soure','91048 Village Green Junction');
INSERT INTO page (`name_page`,`date_registered_page`,`info`) 
VALUES  ('Douglas-Walsh','2022-01-15 07:39:57','odio cras mi pede malesuada in imperdiet et commodo vulputate'),
		('Erdman','2022-05-04 07:59:01','eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor'),
		('Graham and Wuckert','2021-09-30 15:21:13','aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in'),
		('Gutkowski-Franecki','2022-04-02 13:11:30','eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit'),
		('Heaney-Wolf','2021-12-25 03:34:42','erat fermentum justo nec condimentum neque sapien placerat ante nulla justo'),
		('Hoppe-Harber','2022-06-09 02:14:28','malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem'),
		('Kub-Crist','2021-12-03 03:30:13','quis turpis sed ante vivamus tortor duis mattis egestas metus'),
		('Leffler-Dickens','2021-12-26 11:09:50','id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec'),
		('Lubowitz and Luettgen','2022-05-14 21:15:37','justo aliquam quis turpis eget elit sodales scelerisque mauris sit'),
		('Maggio and Pagac','2022-04-09 05:23:48','morbi a ipsum integer a nibh in quis justo maecenas rhoncus'),
		('Powlowski and Sons','2022-03-14 10:22:06','phasellus sit amet erat nulla tempus vivamus in felis eu'),
		('Shanahan Group','2022-04-03 19:56:46','sapien a libero nam dui proin leo odio porttitor id consequat in'),
		('Stanton-Fay','2022-01-18 21:59:57','nam nulla integer pede justo lacinia eget tincidunt eget tempus'),
		('Weber and Rohan','2022-03-07 13:20:18','pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum'),
		('Wiza and Powlowski','2022-03-30 23:10:31','id nisl venenatis lacinia aenean sit amet justo morbi ut odio');
INSERT INTO history (`id_history`,`person_history`,`name_page`) 
VALUES  (null,1,'Gutkowski-Franecki'),
		(null,2,'Kub-Crist'),
		(null,3,'Douglas-Walsh'),
		(null,7,'Leffler-Dickens'),
		(null,4,'Leffler-Dickens'),
		(null,5,'Leffler-Dickens'),
		(null,6,'Shanahan Group'),
		(null,10,'Leffler-Dickens'),
		(null,12,'Leffler-Dickens'),
		(null,10,'Hoppe-Harber'),
		(null,2,'Leffler-Dickens'),
		(null,11,'Stanton-Fay'),
		(null,13,'Heaney-Wolf'),
		(null,8,'Leffler-Dickens'),
		(null,14,'Powlowski and Sons');
INSERT INTO account (`email`,`user_password`,`register_account`) 
VALUES  ('abelison3@hc360.com','DncpgPW','2022-05-08 05:51:13'),
		('afattorec@hud.gov','cNCT54Okf','2021-07-09 19:27:02'),
		('bbearward7@globo.com','7HI9JpnYMPRS','2022-05-16 03:30:05'),
		('dcassells1@bloomberg.com','4tKv989S1Lmk','2021-12-20 14:17:16'),
		('dmcinility6@rediff.com','u6jyjofjH','2021-11-04 23:19:33'),
		('fexonb@japanpost.jp','rIsxqOT','2022-06-26 14:16:24'),
		('ganwyl4@wordpress.com','qp3hpI8MBi','2022-05-02 02:49:30'),
		('hdoche9@diigo.com','0qbkEs0G','2022-02-21 13:12:03'),
		('mglowinski0@answers.com','ibbPz2v5Crk','2021-07-06 12:35:15'),
		('nblade8@creativecommons.org','DEYEVdeTfHz','2021-07-24 17:37:47'),
		('sbartkiewicze@shutterfly.com','e6riweUowTA','2022-02-07 11:19:51'),
		('scasol2@paypal.com','77RAlVtvA','2021-09-21 05:11:59'),
		('speacocka@g.co','p8yg6M','2021-12-25 18:47:14'),
		('tdelany5@arstechnica.com','uzVT84w40','2021-08-04 22:13:49'),
		('twetternd@1und1.de','QcxNh6R','2021-12-21 19:37:56');
INSERT INTO user (`id_user`,`email`,`id_personal`,`ip_user`,`id_history`) 
VALUES  (null,'abelison3@hc360.com',2,'199.52.19.14',2),
		(null,'mglowinski0@answers.com',15,'125.207.210.105',15),
		(null,'dmcinility6@rediff.com',1,'170.2.31.135',1),
		(null,'sbartkiewicze@shutterfly.com',4,'23.206.0.188',4),
		(null,'bbearward7@globo.com',6,'29.100.248.181',6),
		(null,'afattorec@hud.gov',7,'102.231.167.128',7),
		(null,'ganwyl4@wordpress.com',10,'182.104.207.141',10),
		(null,'tdelany5@arstechnica.com',12,'240.253.8.236',12),
		(null,'nblade8@creativecommons.org',5,'107.191.247.221',5),
		(null,'dcassells1@bloomberg.com',9,'198.1.168.51',9),
		(null,'speacocka@g.co',11,'144.128.37.184',11),
		(null,'fexonb@japanpost.jp',14,'128.31.85.175',14),
		(null,'scasol2@paypal.com',13,'92.178.65.217',13),
		(null,'hdoche9@diigo.com',3,'237.155.207.205',3),
		(null,'twetternd@1und1.de',8,'113.196.201.118',8);
INSERT INTO data (`register_data`,`db`,`id_user`,`date_data`) 
VALUES  (1,1,1,NOW()),
		(2,1,2,NOW()),
		(3,1,3,NOW()),
		(4,1,4,NOW()),
		(5,1,5,NOW()),
		(6,1,6,NOW()),
		(7,1,7,NOW()),
		(8,2,8,NOW()),
		(9,2,9,NOW()),
		(10,2,10,NOW()),
		(11,2,11,NOW()),
		(12,2,12,NOW()),
		(13,2,13,NOW()),
		(14,2,14,NOW()),
		(15,2,15,NOW());
INSERT INTO company (`duns_company`,`name_company`,`headquarters`,`register_data`,`requirement_purpose`) 
VALUES  ('04-413-3487','Jaxspan','Mibu',1,'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'),
		('07-679-8593','Realpoint','Podeebrady',1,'blandit mi in porttitor pede justo eu massa donec dapibus duis at'),
		('13-844-8586','Mudo','Leluo',5,'posuere nonummy integer non velit donec diam neque vestibulum eget vulputate'),
		('19-854-1813','Wikido','Carregado',7,'at turpis donec posuere metus vitae ipsum aliquam non mauris'),
		('33-055-2198','Browsecat','Yate-Barrage',2,'libero quis orci nullam molestie nibh in lectus pellentesque at nulla'),
		('35-063-1428','Feedspan','Cipanjang',12,'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque'),
		('37-113-3087','Feedmix','Maroua',4,'varius integer ac leo pellentesque ultrices mattis odio donec vitae'),
		('40-965-0993','Vidoo','Khiliomodhi',6,'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis'),
		('41-017-6232','Yata','Taguing',2,'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum'),
		('43-365-5872','Twinte','Esmeraldas',5,'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet'),
		('46-781-5086','Photofeed','Pantaibesar',4,'lectus aliquam sit amet diam in magna bibendum imperdiet nullam'),
		('50-512-7635','Bluejam','Ranizow',10,'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non'),
		('81-510-2753','Gigazoom','Gununganyar',7,'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo'),
		('93-730-6330','Skinix','Jayapura',8,'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu'),
		('98-385-2640','Youspan','Tambakmerak',3,'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat');


-- -------- TRANSACTION -------- --
#Anulacion de autocommit
SET AUTOCOMMIT = 0;
#Eliminacion de datos tabla company
START TRANSACTION;
SAVEPOINT INITIAL_DELETE;
	DELETE FROM company WHERE duns_company = '93-730-6330';
	DELETE FROM company WHERE name_company = 'Youspan';
#Reinsercion de datos eliminados tabla company
#SAVEPOINT REINSERT;
#	INSERT INTO company 
#    VALUES ('93-730-6330','Skinix','Jayapura',8,'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu'),
#		    ('98-385-2640','Youspan','Tambakmerak',3,'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat');
SAVEPOINT FINAL_DELETE;
# ROLLBACK; Segunda opcion en caso de eliminar los datos y no haber hecho el commit
COMMIT;
#Insercion de datos tabla personal
START TRANSACTION;
SAVEPOINT INITIAL_INSERT;
	INSERT INTO personal 
    VALUES (null, 'Male', 'Dominik', 'Blakemore',18),
		   (null, 'Female', 'Sofia', 'Pallaske', 46),
		   (null, 'Female', 'Shena', 'Villaron', 27),
		   (null, 'Female', 'Eugenia', 'Denyer', 34);
SAVEPOINT MIDDLE;
	INSERT INTO personal 
    VALUES (null, 'Female', 'Martynne', 'Incogna', 50),
		   (null, 'Female', 'Anabelle', 'FitzGibbon', 16),
		   (null, 'Male', 'Otto', 'Kingcote', 14),
		   (null, 'Male', 'Decca', 'Vennings', 25);
SAVEPOINT FINAL_INSERT;
# RELEASE SAVEPOINT MIDDLE; Borrar el savepoint del medio
# ROLLBACK TO INITIAL_INSERT; Volver al inicio de la transaccion
COMMIT;