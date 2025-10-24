/*
 Navicat Premium Data Transfer

 Source Server         : Zon
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3307
 Source Schema         : tp_sport

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 07/10/2025 15:02:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`image_url` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, 'banner1', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/slider_1.jpg?1758159424922', NULL, 1, '2025-09-18 16:04:37', '2025-09-18 16:40:11');
INSERT INTO `banners` VALUES (2, 'banner2', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/slider_2.jpg?1758159424922', NULL, 1, '2025-09-18 16:08:41', '2025-09-18 16:40:11');
INSERT INTO `banners` VALUES (3, 'banner3', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/slider_3.jpg?1758159424922', NULL, 1, '2025-09-18 16:13:43', '2025-09-18 16:40:11');
INSERT INTO `banners` VALUES (4, 'banner4', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/slider_4.jpg?1758159424922', NULL, 1, '2025-09-18 16:13:43', '2025-09-18 16:40:11');
INSERT INTO `banners` VALUES (5, 'banner5', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/slider_5.jpg?1758159424922', NULL, 1, '2025-09-18 16:13:43', '2025-09-18 16:40:11');
INSERT INTO `banners` VALUES (6, 'banner6', 'https://theme.hstatic.net/1000288768/1000753028/14/home_slider_image_4.jpg?v=4515', NULL, 0, '2025-10-02 10:17:33', '2025-10-02 13:31:08');
INSERT INTO `banners` VALUES (7, 'bannr7', 'https://n7media.coolmate.me/image/August2024/top-5-thuong-hieu-viet-nam-ban-quan-ao-the-thao-hot-nhat-hien-nay_860.jpg', NULL, 0, '2025-10-02 10:22:24', '2025-10-02 10:22:51');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brand_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `brand_banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `brand_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`brand_image` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'ADIDAS', 'https://bizweb.dktcdn.net/100/340/361/files/thiet-ke-chua-co-ten-46.jpg?v=1743148484275', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-thuong-hieu-1620x300-1banner-web-29d71b9e-dcee-4842-b72d-e6baeacae6a6.jpg?v=1712807252138', NULL, '2025-09-18 16:04:37', '2025-09-29 18:43:21');
INSERT INTO `brands` VALUES (2, 'ASICS', 'https://bizweb.dktcdn.net/100/340/361/files/thiet-ke-chua-co-ten-47.jpg?v=1743148484854', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-asics-c7dbc286-8c40-420d-9812-8d49ff109eaf.jpg?v=1751617291367', NULL, '2025-09-18 16:08:41', '2025-09-19 15:12:35');
INSERT INTO `brands` VALUES (3, 'Nike', 'https://bizweb.dktcdn.net/100/340/361/files/thiet-ke-chua-co-ten-48.jpg?v=1743148485199', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-asics-c7dbc286-8c40-420d-9812-8d49ff109eaf.jpg?v=1751617291367', NULL, '2025-09-18 16:13:43', '2025-09-19 15:12:42');
INSERT INTO `brands` VALUES (4, 'Le coq sportif', 'https://bizweb.dktcdn.net/100/340/361/files/thiet-ke-chua-co-ten-49.jpg?v=1743148485950', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-thuong-hieu-1620x300-2banner-web-24e891c2-051f-4526-a76c-f7e43b7005d2.jpg?v=1712046061167', NULL, '2025-09-18 16:13:43', '2025-09-19 15:12:49');
INSERT INTO `brands` VALUES (5, 'Li-Ning', 'https://bizweb.dktcdn.net/100/340/361/files/thiet-ke-chua-co-ten-50.jpg?v=1743148486704', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-thuong-hieu-1620x300banner-web-54efe737-68fc-4cd0-89dd-d7f4e13b85f5.jpg?v=1712045955189', NULL, '2025-09-18 16:13:43', '2025-09-19 15:12:53');
INSERT INTO `brands` VALUES (6, '361°', 'https://bizweb.dktcdn.net/100/340/361/files/thiet-ke-chua-co-ten-51.jpg', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-thuong-hieu-1620x300-4banner-web-67e9b8e9-88a6-48c3-8631-805d42acd652.jpg?v=1712045977848', NULL, '2025-09-18 16:13:43', '2025-09-19 15:12:54');
INSERT INTO `brands` VALUES (7, 'Sport Equipment', 'https://i.ibb.co/PG2dd2hc/367483668-294253883255761-6562776433951421847-n.jpg', NULL, 'https://thethaoviet.com.vn/wp-content/uploads/2017/11/31.jpg', NULL, '2025-10-02 09:56:28', '2025-10-02 10:01:48');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, 1);
INSERT INTO `cart` VALUES (2, 16, 0);
INSERT INTO `cart` VALUES (3, 17, 0);
INSERT INTO `cart` VALUES (4, 18, 0);
INSERT INTO `cart` VALUES (5, 21, 0);
INSERT INTO `cart` VALUES (8, 25, 0);

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_id`(`cart_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_detail
-- ----------------------------
INSERT INTO `cart_detail` VALUES (2, 1, 3, 10, 1850000);
INSERT INTO `cart_detail` VALUES (11, 1, 4, 5, 300000);
INSERT INTO `cart_detail` VALUES (25, 1, 7, 2, 250000);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Nike', 'Genius is an infinite capacity for taking pains. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does. If it scares you, it might be a good thing to try. The reason why a great man is great is that he resolves to be a great man. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. The On Startup feature allows you to control what tabs appear when you launch Navicat. After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target. I destroy my enemies when I make them my friends. If it scares you, it might be a good thing to try. How we spend our days is, of course, how we spend our lives. Creativity is intelligence having fun. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools. To connect to a database or schema, simply double-click it in the pane. Remember that failure is an event, not a person. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network. A comfort zone is a beautiful place, but nothing ever grows there. If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution. A man’s best friends are his ten fingers. To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature. Difficult circumstances serve as a textbook of life for people. SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security. To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature. In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible. Optimism is the one quality more associated with success and happiness than any other. You must be the change you wish to see in the world. Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not be stored to Navicat Cloud. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information in the General tab. Navicat Monitor requires a repository to store alerts and metrics for historical analysis. There is no way to happiness. Happiness is the way. To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. Success consists of going from failure to failure without loss of enthusiasm. A man is not old until regrets take the place of dreams. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network.', '2015-11-23 17:18:15', '2025-09-18 17:22:46');
INSERT INTO `categories` VALUES (2, 'Adidas', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. There is no way to happiness. Happiness is the way. Navicat Monitor requires a repository to store alerts and metrics for historical analysis. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. Success consists of going from failure to failure without loss of enthusiasm. Typically, it is employed as an encrypted version of Telnet. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. Flexible settings enable you to set up a custom key for comparison and synchronization. Flexible settings enable you to set up a custom key for comparison and synchronization. If it scares you, it might be a good thing to try. Champions keep playing until they get it right. The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools. Typically, it is employed as an encrypted version of Telnet. Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process. A man is not old until regrets take the place of dreams. A man is not old until regrets take the place of dreams. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections. I destroy my enemies when I make them my friends. Flexible settings enable you to set up a custom key for comparison and synchronization. Creativity is intelligence having fun. If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution. Optimism is the one quality more associated with success and happiness than any other. Monitored servers include MySQL, MariaDB and SQL Server, and compatible with cloud databases like Amazon RDS, Amazon Aurora, Oracle Cloud, Google Cloud and Microsoft Azure. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network. You can select any connections, objects or projects, and then select the corresponding buttons on the Information Pane. Anyone who has ever made anything of importance was disciplined. The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. The Synchronize to Database function will give you a full picture of all database differences. A man is not old until regrets take the place of dreams. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. You cannot save people, you can just love them. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. The Synchronize to Database function will give you a full picture of all database differences. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily. Actually it is just in an idea when feel oneself can achieve and cannot achieve. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. It wasn’t raining when Noah built the ark. You cannot save people, you can just love them. Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from. You will succeed because most people are lazy. You can select any connections, objects or projects, and then select the corresponding buttons on the Information Pane. Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually. Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not be stored to Navicat Cloud. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view. Difficult circumstances serve as a textbook of life for people. Anyone who has never made a mistake has never tried anything new. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network. If you wait, all that happens is you get older. SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security. The reason why a great man is great is that he resolves to be a great man. In a Telnet session, all communications, including username and password, are transmitted in plain-text, allowing anyone to listen-in on your session and steal passwords and other information. The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools. Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. If opportunity doesn’t knock, build a door. Remember that failure is an event, not a person. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms.', '2002-03-01 15:00:14', '2025-09-18 17:22:52');
INSERT INTO `categories` VALUES (3, 'ASICS', 'If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible. SQL Editor allows you to create and edit SQL text, prepare and execute selected queries. SQL Editor allows you to create and edit SQL text, prepare and execute selected queries. Champions keep playing until they get it right. Optimism is the one quality more associated with success and happiness than any other. There is no way to happiness. Happiness is the way. Creativity is intelligence having fun. In a Telnet session, all communications, including username and password, are transmitted in plain-text, allowing anyone to listen-in on your session and steal passwords and other information. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms. If you wait, all that happens is you get older. Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models. If the plan doesn’t work, change the plan, but never the goal. If opportunity doesn’t knock, build a door. If opportunity doesn’t knock, build a door. It wasn’t raining when Noah built the ark. Creativity is intelligence having fun. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. Difficult circumstances serve as a textbook of life for people. Optimism is the one quality more associated with success and happiness than any other. You must be the change you wish to see in the world. The Synchronize to Database function will give you a full picture of all database differences. In a Telnet session, all communications, including username and password, are transmitted in plain-text, allowing anyone to listen-in on your session and steal passwords and other information. A comfort zone is a beautiful place, but nothing ever grows there. Actually it is just in an idea when feel oneself can achieve and cannot achieve. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. It wasn’t raining when Noah built the ark. If the plan doesn’t work, change the plan, but never the goal. A query is used to extract data from the database in a readable format according to the user\'s request. To connect to a database or schema, simply double-click it in the pane. The Synchronize to Database function will give you a full picture of all database differences. After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections. If the plan doesn’t work, change the plan, but never the goal. Success consists of going from failure to failure without loss of enthusiasm. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. The Synchronize to Database function will give you a full picture of all database differences. Creativity is intelligence having fun. A query is used to extract data from the database in a readable format according to the user\'s request. All journeys have secret destinations of which the traveler is unaware. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms. Creativity is intelligence having fun. If it scares you, it might be a good thing to try. A comfort zone is a beautiful place, but nothing ever grows there. Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually. The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview. Flexible settings enable you to set up a custom key for comparison and synchronization. What you get by achieving your goals is not as important as what you become by achieving your goals. A man is not old until regrets take the place of dreams. You cannot save people, you can just love them. A comfort zone is a beautiful place, but nothing ever grows there. Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models. In the middle of winter I at last discovered that there was in me an invincible summer. The reason why a great man is great is that he resolves to be a great man. Anyone who has ever made anything of importance was disciplined. There is no way to happiness. Happiness is the way. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms. Always keep your eyes open. Keep watching. Because whatever you see can inspire you. With its well-designed Graphical User Interface(GUI), Navicat lets you quickly and easily create, organize, access and share information in a secure and easy way. Anyone who has never made a mistake has never tried anything new. It wasn’t raining when Noah built the ark. Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually. Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on a remote server, and move files from one machine to another. Such sessions are also susceptible to session hijacking, where a malicious user takes over your session once you have authenticated. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. Navicat Monitor can be installed on any local computer or virtual machine and does not require any software installation on the servers being monitored. You can select any connections, objects or projects, and then select the corresponding buttons on the Information Pane. There is no way to happiness. Happiness is the way. The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools. Remember that failure is an event, not a person. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. A man’s best friends are his ten fingers. A query is used to extract data from the database in a readable format according to the user\'s request. Export Wizard allows you to export data from tables, collections, views, or query results to any available formats. Always keep your eyes open. Keep watching. Because whatever you see can inspire you. If it scares you, it might be a good thing to try. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. Navicat Monitor can be installed on any local computer or virtual machine and does not require any software installation on the servers being monitored. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. If you wait, all that happens is you get older.', '2017-08-28 23:40:13', '2025-10-02 15:53:27');
INSERT INTO `categories` VALUES (4, 'Golf', 'The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily. If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms. Anyone who has never made a mistake has never tried anything new. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms. You can select any connections, objects or projects, and then select the corresponding buttons on the Information Pane. Typically, it is employed as an encrypted version of Telnet. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does. Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not be stored to Navicat Cloud. Flexible settings enable you to set up a custom key for comparison and synchronization. Anyone who has never made a mistake has never tried anything new. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. You must be the change you wish to see in the world. You will succeed because most people are lazy. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. Navicat Monitor requires a repository to store alerts and metrics for historical analysis. After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections. To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source. The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview. After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target. The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. Such sessions are also susceptible to session hijacking, where a malicious user takes over your session once you have authenticated. Typically, it is employed as an encrypted version of Telnet. Sometimes you win, sometimes you learn. Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily.', '2001-10-17 13:22:10', '2025-09-18 18:06:39');
INSERT INTO `categories` VALUES (5, 'Bóng Đá', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature. A query is used to extract data from the database in a readable format according to the user\'s request. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network. A man’s best friends are his ten fingers. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information in the General tab. Success consists of going from failure to failure without loss of enthusiasm. Typically, it is employed as an encrypted version of Telnet. All journeys have secret destinations of which the traveler is unaware. If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution. All journeys have secret destinations of which the traveler is unaware. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. If opportunity doesn’t knock, build a door. If you wait, all that happens is you get older. You must be the change you wish to see in the world. How we spend our days is, of course, how we spend our lives. Flexible settings enable you to set up a custom key for comparison and synchronization. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view. You must be the change you wish to see in the world. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. Always keep your eyes open. Keep watching. Because whatever you see can inspire you. If opportunity doesn’t knock, build a door. You must be the change you wish to see in the world. Success consists of going from failure to failure without loss of enthusiasm. A man’s best friends are his ten fingers. Anyone who has ever made anything of importance was disciplined. Optimism is the one quality more associated with success and happiness than any other. Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process. The reason why a great man is great is that he resolves to be a great man. The Synchronize to Database function will give you a full picture of all database differences. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. A man’s best friends are his ten fingers. Navicat 15 has added support for the system-wide dark mode. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. Navicat Monitor can be installed on any local computer or virtual machine and does not require any software installation on the servers being monitored. The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. There is no way to happiness. Happiness is the way. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms. You can select any connections, objects or projects, and then select the corresponding buttons on the Information Pane. All journeys have secret destinations of which the traveler is unaware. Always keep your eyes open. Keep watching. Because whatever you see can inspire you. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. Monitored servers include MySQL, MariaDB and SQL Server, and compatible with cloud databases like Amazon RDS, Amazon Aurora, Oracle Cloud, Google Cloud and Microsoft Azure. Navicat 15 has added support for the system-wide dark mode. Success consists of going from failure to failure without loss of enthusiasm. To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature. Navicat 15 has added support for the system-wide dark mode. The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. The Synchronize to Database function will give you a full picture of all database differences. Creativity is intelligence having fun. The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview. There is no way to happiness. Happiness is the way. To connect to a database or schema, simply double-click it in the pane. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information in the General tab. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more.', '2006-02-20 10:24:13', '2025-10-01 17:21:06');
INSERT INTO `categories` VALUES (6, 'Thiết bị tập luyện', 'Thiết bị', '2025-10-02 15:51:13', '2025-10-02 15:51:13');

-- ----------------------------
-- Table structure for category_product
-- ----------------------------
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_product_category`(`category_id` ASC) USING BTREE,
  INDEX `fk_category_product_product`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_category_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_category_product_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category_product
-- ----------------------------
INSERT INTO `category_product` VALUES (1, 2, 1);
INSERT INTO `category_product` VALUES (2, 2, 3);
INSERT INTO `category_product` VALUES (3, 2, 4);
INSERT INTO `category_product` VALUES (4, 2, 5);
INSERT INTO `category_product` VALUES (5, 2, 6);
INSERT INTO `category_product` VALUES (6, 2, 7);
INSERT INTO `category_product` VALUES (7, 2, 8);
INSERT INTO `category_product` VALUES (8, 2, 9);
INSERT INTO `category_product` VALUES (9, 2, 10);
INSERT INTO `category_product` VALUES (10, 2, 11);
INSERT INTO `category_product` VALUES (11, 2, 12);
INSERT INTO `category_product` VALUES (12, 2, 13);
INSERT INTO `category_product` VALUES (13, 2, 17);
INSERT INTO `category_product` VALUES (14, 2, 18);
INSERT INTO `category_product` VALUES (15, 2, 19);
INSERT INTO `category_product` VALUES (16, 2, 20);
INSERT INTO `category_product` VALUES (17, 2, 21);
INSERT INTO `category_product` VALUES (18, 2, 22);
INSERT INTO `category_product` VALUES (19, 2, 23);
INSERT INTO `category_product` VALUES (21, 2, 27);
INSERT INTO `category_product` VALUES (22, 2, 28);
INSERT INTO `category_product` VALUES (23, 2, 29);
INSERT INTO `category_product` VALUES (24, 2, 30);
INSERT INTO `category_product` VALUES (25, 2, 31);
INSERT INTO `category_product` VALUES (26, 1, 32);
INSERT INTO `category_product` VALUES (27, 1, 33);
INSERT INTO `category_product` VALUES (28, 1, 34);
INSERT INTO `category_product` VALUES (29, 1, 35);
INSERT INTO `category_product` VALUES (31, 1, 103);
INSERT INTO `category_product` VALUES (32, 4, 104);
INSERT INTO `category_product` VALUES (33, 3, 105);
INSERT INTO `category_product` VALUES (34, 5, 106);
INSERT INTO `category_product` VALUES (35, 2, 107);
INSERT INTO `category_product` VALUES (36, 3, 108);
INSERT INTO `category_product` VALUES (37, 1, 109);
INSERT INTO `category_product` VALUES (38, 4, 110);
INSERT INTO `category_product` VALUES (39, 2, 111);
INSERT INTO `category_product` VALUES (40, 5, 112);
INSERT INTO `category_product` VALUES (41, 1, 113);
INSERT INTO `category_product` VALUES (42, 3, 114);
INSERT INTO `category_product` VALUES (43, 3, 115);
INSERT INTO `category_product` VALUES (44, 5, 116);
INSERT INTO `category_product` VALUES (45, 1, 117);
INSERT INTO `category_product` VALUES (46, 5, 118);
INSERT INTO `category_product` VALUES (47, 5, 119);
INSERT INTO `category_product` VALUES (48, 2, 120);
INSERT INTO `category_product` VALUES (49, 4, 121);
INSERT INTO `category_product` VALUES (50, 2, 122);
INSERT INTO `category_product` VALUES (51, 3, 123);
INSERT INTO `category_product` VALUES (52, 4, 124);
INSERT INTO `category_product` VALUES (53, 3, 125);
INSERT INTO `category_product` VALUES (54, 5, 126);
INSERT INTO `category_product` VALUES (55, 4, 127);
INSERT INTO `category_product` VALUES (56, 5, 128);
INSERT INTO `category_product` VALUES (57, 2, 129);
INSERT INTO `category_product` VALUES (58, 5, 130);
INSERT INTO `category_product` VALUES (59, 5, 131);
INSERT INTO `category_product` VALUES (60, 3, 132);
INSERT INTO `category_product` VALUES (61, 5, 133);
INSERT INTO `category_product` VALUES (62, 4, 134);
INSERT INTO `category_product` VALUES (63, 5, 135);
INSERT INTO `category_product` VALUES (64, 5, 136);
INSERT INTO `category_product` VALUES (65, 3, 137);
INSERT INTO `category_product` VALUES (66, 1, 138);
INSERT INTO `category_product` VALUES (67, 5, 139);
INSERT INTO `category_product` VALUES (68, 2, 140);
INSERT INTO `category_product` VALUES (69, 4, 141);
INSERT INTO `category_product` VALUES (70, 1, 142);
INSERT INTO `category_product` VALUES (71, 1, 143);
INSERT INTO `category_product` VALUES (72, 5, 144);
INSERT INTO `category_product` VALUES (73, 3, 145);
INSERT INTO `category_product` VALUES (74, 5, 146);
INSERT INTO `category_product` VALUES (75, 4, 147);
INSERT INTO `category_product` VALUES (76, 2, 148);
INSERT INTO `category_product` VALUES (77, 2, 149);
INSERT INTO `category_product` VALUES (78, 2, 150);
INSERT INTO `category_product` VALUES (79, 1, 151);
INSERT INTO `category_product` VALUES (80, 5, 152);
INSERT INTO `category_product` VALUES (81, 5, 153);
INSERT INTO `category_product` VALUES (82, 1, 154);
INSERT INTO `category_product` VALUES (83, 3, 155);
INSERT INTO `category_product` VALUES (84, 2, 156);
INSERT INTO `category_product` VALUES (85, 3, 157);
INSERT INTO `category_product` VALUES (86, 4, 158);
INSERT INTO `category_product` VALUES (87, 1, 159);
INSERT INTO `category_product` VALUES (88, 4, 160);
INSERT INTO `category_product` VALUES (89, 3, 161);
INSERT INTO `category_product` VALUES (90, 3, 162);
INSERT INTO `category_product` VALUES (91, 1, 163);
INSERT INTO `category_product` VALUES (92, 4, 164);
INSERT INTO `category_product` VALUES (93, 4, 165);
INSERT INTO `category_product` VALUES (94, 3, 166);
INSERT INTO `category_product` VALUES (95, 4, 167);
INSERT INTO `category_product` VALUES (96, 4, 168);
INSERT INTO `category_product` VALUES (97, 2, 169);
INSERT INTO `category_product` VALUES (98, 2, 170);
INSERT INTO `category_product` VALUES (99, 2, 171);
INSERT INTO `category_product` VALUES (100, 5, 172);
INSERT INTO `category_product` VALUES (101, 1, 173);
INSERT INTO `category_product` VALUES (102, 4, 174);
INSERT INTO `category_product` VALUES (103, 5, 175);
INSERT INTO `category_product` VALUES (104, 5, 176);
INSERT INTO `category_product` VALUES (105, 5, 177);
INSERT INTO `category_product` VALUES (106, 1, 178);
INSERT INTO `category_product` VALUES (107, 3, 179);
INSERT INTO `category_product` VALUES (108, 4, 180);
INSERT INTO `category_product` VALUES (109, 5, 181);
INSERT INTO `category_product` VALUES (110, 3, 182);
INSERT INTO `category_product` VALUES (111, 1, 183);
INSERT INTO `category_product` VALUES (112, 5, 184);
INSERT INTO `category_product` VALUES (113, 2, 185);
INSERT INTO `category_product` VALUES (114, 5, 186);
INSERT INTO `category_product` VALUES (115, 4, 187);
INSERT INTO `category_product` VALUES (116, 4, 188);
INSERT INTO `category_product` VALUES (117, 2, 189);
INSERT INTO `category_product` VALUES (118, 1, 190);
INSERT INTO `category_product` VALUES (119, 2, 191);
INSERT INTO `category_product` VALUES (120, 5, 192);
INSERT INTO `category_product` VALUES (121, 1, 193);
INSERT INTO `category_product` VALUES (122, 5, 194);
INSERT INTO `category_product` VALUES (123, 5, 195);
INSERT INTO `category_product` VALUES (124, 1, 196);
INSERT INTO `category_product` VALUES (125, 5, 196);
INSERT INTO `category_product` VALUES (126, 1, 197);
INSERT INTO `category_product` VALUES (127, 1, 198);
INSERT INTO `category_product` VALUES (128, 5, 198);
INSERT INTO `category_product` VALUES (129, 2, 199);
INSERT INTO `category_product` VALUES (130, 1, 200);
INSERT INTO `category_product` VALUES (131, 3, 200);
INSERT INTO `category_product` VALUES (132, 3, 201);
INSERT INTO `category_product` VALUES (133, 1, 201);
INSERT INTO `category_product` VALUES (134, 2, 202);
INSERT INTO `category_product` VALUES (135, 3, 202);
INSERT INTO `category_product` VALUES (136, 2, 203);
INSERT INTO `category_product` VALUES (137, 5, 203);
INSERT INTO `category_product` VALUES (138, 3, 204);
INSERT INTO `category_product` VALUES (139, 1, 204);
INSERT INTO `category_product` VALUES (140, 3, 205);
INSERT INTO `category_product` VALUES (141, 1, 206);
INSERT INTO `category_product` VALUES (142, 2, 207);
INSERT INTO `category_product` VALUES (143, 2, 208);
INSERT INTO `category_product` VALUES (144, 4, 208);
INSERT INTO `category_product` VALUES (145, 1, 209);
INSERT INTO `category_product` VALUES (146, 4, 209);
INSERT INTO `category_product` VALUES (147, 4, 210);
INSERT INTO `category_product` VALUES (148, 3, 211);
INSERT INTO `category_product` VALUES (149, 1, 212);
INSERT INTO `category_product` VALUES (150, 5, 212);
INSERT INTO `category_product` VALUES (151, 4, 213);
INSERT INTO `category_product` VALUES (152, 1, 213);
INSERT INTO `category_product` VALUES (153, 2, 214);
INSERT INTO `category_product` VALUES (154, 1, 215);
INSERT INTO `category_product` VALUES (155, 2, 215);
INSERT INTO `category_product` VALUES (156, 1, 216);
INSERT INTO `category_product` VALUES (157, 3, 216);
INSERT INTO `category_product` VALUES (158, 1, 217);
INSERT INTO `category_product` VALUES (159, 1, 218);
INSERT INTO `category_product` VALUES (160, 4, 219);
INSERT INTO `category_product` VALUES (161, 1, 219);
INSERT INTO `category_product` VALUES (162, 1, 220);
INSERT INTO `category_product` VALUES (163, 3, 221);
INSERT INTO `category_product` VALUES (164, 4, 221);
INSERT INTO `category_product` VALUES (165, 5, 222);
INSERT INTO `category_product` VALUES (166, 2, 222);
INSERT INTO `category_product` VALUES (167, 1, 223);
INSERT INTO `category_product` VALUES (168, 3, 224);
INSERT INTO `category_product` VALUES (169, 5, 224);
INSERT INTO `category_product` VALUES (170, 5, 225);
INSERT INTO `category_product` VALUES (171, 4, 226);
INSERT INTO `category_product` VALUES (172, 5, 226);
INSERT INTO `category_product` VALUES (173, 3, 227);
INSERT INTO `category_product` VALUES (174, 5, 228);
INSERT INTO `category_product` VALUES (175, 3, 229);
INSERT INTO `category_product` VALUES (176, 5, 229);
INSERT INTO `category_product` VALUES (177, 5, 230);
INSERT INTO `category_product` VALUES (178, 5, 231);
INSERT INTO `category_product` VALUES (179, 1, 232);
INSERT INTO `category_product` VALUES (180, 5, 233);
INSERT INTO `category_product` VALUES (181, 5, 234);
INSERT INTO `category_product` VALUES (182, 2, 234);
INSERT INTO `category_product` VALUES (183, 2, 235);
INSERT INTO `category_product` VALUES (184, 3, 236);
INSERT INTO `category_product` VALUES (185, 5, 237);
INSERT INTO `category_product` VALUES (186, 3, 238);
INSERT INTO `category_product` VALUES (187, 5, 239);
INSERT INTO `category_product` VALUES (188, 4, 240);
INSERT INTO `category_product` VALUES (189, 4, 241);
INSERT INTO `category_product` VALUES (190, 1, 242);
INSERT INTO `category_product` VALUES (191, 4, 242);
INSERT INTO `category_product` VALUES (192, 5, 243);
INSERT INTO `category_product` VALUES (193, 2, 243);
INSERT INTO `category_product` VALUES (194, 4, 244);
INSERT INTO `category_product` VALUES (195, 5, 245);
INSERT INTO `category_product` VALUES (196, 1, 245);
INSERT INTO `category_product` VALUES (197, 1, 246);
INSERT INTO `category_product` VALUES (198, 2, 246);
INSERT INTO `category_product` VALUES (199, 1, 247);
INSERT INTO `category_product` VALUES (200, 5, 248);
INSERT INTO `category_product` VALUES (201, 4, 249);
INSERT INTO `category_product` VALUES (202, 1, 249);
INSERT INTO `category_product` VALUES (203, 1, 250);
INSERT INTO `category_product` VALUES (204, 5, 251);
INSERT INTO `category_product` VALUES (205, 4, 252);
INSERT INTO `category_product` VALUES (206, 4, 253);
INSERT INTO `category_product` VALUES (207, 1, 253);
INSERT INTO `category_product` VALUES (208, 3, 254);
INSERT INTO `category_product` VALUES (209, 2, 255);
INSERT INTO `category_product` VALUES (210, 2, 256);
INSERT INTO `category_product` VALUES (211, 1, 256);
INSERT INTO `category_product` VALUES (212, 4, 257);
INSERT INTO `category_product` VALUES (213, 1, 257);
INSERT INTO `category_product` VALUES (214, 1, 258);
INSERT INTO `category_product` VALUES (215, 4, 258);
INSERT INTO `category_product` VALUES (216, 2, 259);
INSERT INTO `category_product` VALUES (217, 3, 259);
INSERT INTO `category_product` VALUES (218, 1, 260);
INSERT INTO `category_product` VALUES (219, 5, 261);
INSERT INTO `category_product` VALUES (220, 2, 261);
INSERT INTO `category_product` VALUES (221, 4, 262);
INSERT INTO `category_product` VALUES (222, 5, 262);
INSERT INTO `category_product` VALUES (223, 5, 263);
INSERT INTO `category_product` VALUES (224, 3, 263);
INSERT INTO `category_product` VALUES (225, 2, 264);
INSERT INTO `category_product` VALUES (226, 1, 265);
INSERT INTO `category_product` VALUES (227, 1, 266);
INSERT INTO `category_product` VALUES (228, 1, 267);
INSERT INTO `category_product` VALUES (229, 4, 267);
INSERT INTO `category_product` VALUES (230, 4, 268);
INSERT INTO `category_product` VALUES (231, 3, 268);
INSERT INTO `category_product` VALUES (232, 6, 269);
INSERT INTO `category_product` VALUES (233, 6, 269);
INSERT INTO `category_product` VALUES (234, 6, 270);
INSERT INTO `category_product` VALUES (235, 6, 271);
INSERT INTO `category_product` VALUES (236, 6, 272);
INSERT INTO `category_product` VALUES (237, 6, 272);
INSERT INTO `category_product` VALUES (238, 6, 273);
INSERT INTO `category_product` VALUES (239, 6, 274);
INSERT INTO `category_product` VALUES (240, 6, 274);
INSERT INTO `category_product` VALUES (241, 6, 275);
INSERT INTO `category_product` VALUES (242, 6, 277);
INSERT INTO `category_product` VALUES (243, 6, 278);
INSERT INTO `category_product` VALUES (244, 6, 279);
INSERT INTO `category_product` VALUES (245, 6, 280);
INSERT INTO `category_product` VALUES (246, 6, 281);
INSERT INTO `category_product` VALUES (247, 6, 282);
INSERT INTO `category_product` VALUES (248, 6, 283);
INSERT INTO `category_product` VALUES (249, 6, 284);
INSERT INTO `category_product` VALUES (250, 6, 285);
INSERT INTO `category_product` VALUES (251, 6, 286);
INSERT INTO `category_product` VALUES (252, 6, 287);
INSERT INTO `category_product` VALUES (253, 6, 288);
INSERT INTO `category_product` VALUES (254, 6, 289);
INSERT INTO `category_product` VALUES (255, 6, 290);
INSERT INTO `category_product` VALUES (256, 6, 291);
INSERT INTO `category_product` VALUES (257, 6, 292);
INSERT INTO `category_product` VALUES (258, 6, 293);
INSERT INTO `category_product` VALUES (259, 6, 294);
INSERT INTO `category_product` VALUES (260, 6, 295);
INSERT INTO `category_product` VALUES (261, 6, 296);
INSERT INTO `category_product` VALUES (262, 6, 297);
INSERT INTO `category_product` VALUES (263, 6, 298);
INSERT INTO `category_product` VALUES (264, 6, 299);
INSERT INTO `category_product` VALUES (265, 6, 300);
INSERT INTO `category_product` VALUES (266, 6, 301);
INSERT INTO `category_product` VALUES (267, 6, 302);
INSERT INTO `category_product` VALUES (268, 6, 303);
INSERT INTO `category_product` VALUES (269, 6, 304);
INSERT INTO `category_product` VALUES (270, 6, 305);
INSERT INTO `category_product` VALUES (271, 6, 306);
INSERT INTO `category_product` VALUES (272, 6, 307);
INSERT INTO `category_product` VALUES (273, 6, 308);

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED NULL DEFAULT NULL,
  `discount_percent` int NULL DEFAULT NULL,
  `start` date NULL DEFAULT NULL,
  `end` date NULL DEFAULT NULL,
  `des` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_discount_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES (1, 1, 15, '2025-09-30', '2025-10-22', NULL, 1, '2025-09-18 17:38:38', '2025-09-18 17:38:42');
INSERT INTO `discount` VALUES (2, 2, 20, '2025-09-30', '2025-10-30', NULL, 1, '2025-09-18 18:13:53', '2025-09-18 18:14:08');
INSERT INTO `discount` VALUES (3, 3, 10, '2025-09-30', '2025-10-30', NULL, 1, '2025-09-18 18:13:53', '2025-09-18 18:13:53');
INSERT INTO `discount` VALUES (4, 6, 15, '2025-10-01', '2025-10-29', NULL, 1, '2025-09-18 18:13:53', '2025-09-18 18:13:53');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `employee_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `owner_id` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`) USING BTREE,
  UNIQUE INDEX `employees_email_unique`(`email` ASC) USING BTREE,
  INDEX `employees_owner_id_foreign`(`owner_id` ASC) USING BTREE,
  CONSTRAINT `employees_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (2, 'phong1212', 'ngophongcoder26@gmail.com', '0397760835', '$2y$12$RFDONKBtmm47PcLMSH4KP.v0AD2Djji6J2ki15am2fCUc5mYo8JPq', 'active', 1, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (3, 'PhongNt', 'Phongnt@gmail.com', '0397760825', '$2y$12$BOhb/vkAba4gI6.r2kwP0e6P8WD7c6gZZ2w07jdiHK3HZubfj4ctm', 'active', 1, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (4, 'Quan', 'quandm@gmail.com', '0904856521', '$2y$12$dIJoYT..R7euuutgheFL6uH7eubYZiwZ8dIQ99ZDadpDc5oAgYoXi', 'active', 1, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (5, 'Dieu', 'hdieu12706@gmail.com', '0376390962', '$2y$12$aJjhltH3e4bjzbeZUrLUZ.la6bZdUFGldyCkf9mB363VpHAfGJkvq', 'inactive', 1, NULL, NULL, NULL);
INSERT INTO `employees` VALUES (6, 'Khanh', 'nhanvien@gmail.com', '0904856521', '$2y$12$DOBdtFahSYh9w0UasxNSkuqJArlRttTdggW5tt28n//STAZ2zv7M.', 'active', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `feedback` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL,
  `answer` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isApproved` tinyint NULL DEFAULT 0,
  `feedback_id` int NULL DEFAULT NULL,
  `order_id` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `fk_feedbacks_order`(`order_id` ASC) USING BTREE,
  CONSTRAINT `fk_feedbacks_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_feedbacks_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------
INSERT INTO `feedbacks` VALUES (2, 16, 'Chất lượng tuyệt lắm nha, nhưng mà mình thấy sản phẩm có vẻ chưa đa dạng lắm', 'Ngô Phong', 4, 'Cảm ơn bạn, bên mình sẽ cố gắng mang đến cho các bạn nhiều sản phẩm hơn ạ', 1, NULL, 8);
INSERT INTO `feedbacks` VALUES (3, 15, 'Yêu shop nhiều, ưng lắm đó', 'HuyNhat', 4, 'Cảm ơn bạn nha', 0, NULL, 8);
INSERT INTO `feedbacks` VALUES (4, 17, 'Admin cho mình hỏi có được đổi trả sản phẩm không ạ?', 'NamKhanh', 5, 'Có nha bạn', 0, NULL, 10);
INSERT INTO `feedbacks` VALUES (5, 15, 'Shop làm ăn chán thế', 'Dahlia', 4, 'Bạn có thể cho mình biết tại sao không ạ?', 0, NULL, 9);
INSERT INTO `feedbacks` VALUES (6, 16, 'Điểm 10 cho chất lượng nè', 'MinhQuan', 5, 'Yêu bạn nhiều', 1, NULL, 10);
INSERT INTO `feedbacks` VALUES (7, 15, 'Trang Web này thật tuyệt vời', 'MinhChinh', 5, 'Cảm ơn bạn nhiều. Mong bạn tiếp tục ủng hộ chúng mình', 1, NULL, 10);
INSERT INTO `feedbacks` VALUES (8, 15, '5 sao cho page luôn ạ', 'TienPhong', 5, NULL, 1, NULL, 10);
INSERT INTO `feedbacks` VALUES (11, 30, 'Tốt', 'QuocAnh', 4, NULL, 0, NULL, 21);

-- ----------------------------
-- Table structure for image_product
-- ----------------------------
DROP TABLE IF EXISTS `image_product`;
CREATE TABLE `image_product`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `image_id` bigint UNSIGNED NOT NULL,
  `image_order` int UNSIGNED NULL DEFAULT 0,
  `image_role` enum('main','gallery','thumbnail') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'gallery',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `image_product_product_id_index`(`product_id` ASC) USING BTREE,
  INDEX `image_product_image_id_index`(`image_id` ASC) USING BTREE,
  INDEX `image_product_image_role_index`(`image_role` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of image_product
-- ----------------------------
INSERT INTO `image_product` VALUES (1, 1, 1, 38, 'main', '2025-09-14 22:52:19', '2025-09-14 22:53:31');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `image_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_size` bigint UNSIGNED NULL DEFAULT NULL,
  `image_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for materials
-- ----------------------------
DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials`  (
  `material_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `material_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`material_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of materials
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2025_04_06_034824_create_owner_table', 2);
INSERT INTO `migrations` VALUES (4, '2025_04_06_034901_create_employee_table', 2);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\Customer', 14);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `size_id` int NOT NULL,
  `sold_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `sold_quantity` int UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_order_product_size`(`order_id` ASC, `product_id` ASC, `size_id` ASC) USING BTREE,
  INDEX `fk_orderdetails_product`(`product_id` ASC) USING BTREE,
  INDEX `fk_orderdetails_size`(`size_id` ASC) USING BTREE,
  CONSTRAINT `fk_orderdetails_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetails_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetails_size` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`size_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (11, 9, 18, 1, 1800000.00, 1);
INSERT INTO `order_details` VALUES (12, 10, 21, 1, 1500000.00, 1);
INSERT INTO `order_details` VALUES (13, 11, 20, 1, 1500000.00, 1);
INSERT INTO `order_details` VALUES (14, 12, 21, 1, 1500000.00, 1);
INSERT INTO `order_details` VALUES (15, 13, 17, 1, 1840000.00, 1);
INSERT INTO `order_details` VALUES (16, 14, 18, 1, 1440000.00, 1);
INSERT INTO `order_details` VALUES (17, 15, 18, 1, 1440000.00, 1);
INSERT INTO `order_details` VALUES (18, 16, 20, 1, 1200000.00, 1);
INSERT INTO `order_details` VALUES (19, 17, 21, 1, 1200000.00, 1);
INSERT INTO `order_details` VALUES (20, 18, 18, 1, 1440000.00, 1);
INSERT INTO `order_details` VALUES (21, 19, 20, 1, 1200000.00, 1);
INSERT INTO `order_details` VALUES (22, 20, 18, 1, 1440000.00, 6);
INSERT INTO `order_details` VALUES (23, 21, 17, 1, 1840000.00, 1);
INSERT INTO `order_details` VALUES (24, 22, 13, 1, 800000.00, 1);
INSERT INTO `order_details` VALUES (25, 23, 32, 5, 2502802.05, 1);
INSERT INTO `order_details` VALUES (26, 23, 105, 12, 2164025.70, 1);
INSERT INTO `order_details` VALUES (27, 24, 126, 15, 1422655.00, 3);
INSERT INTO `order_details` VALUES (28, 24, 127, 12, 1275382.00, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_date` date NULL DEFAULT NULL,
  `order_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `receiver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `receiver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_id` bigint UNSIGNED NULL DEFAULT NULL,
  `employee_id` bigint UNSIGNED NULL DEFAULT NULL,
  `voucher_id` bigint UNSIGNED NULL DEFAULT NULL,
  `payment_method_id` bigint UNSIGNED NULL DEFAULT NULL,
  `shipping_method_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `fk_orders_user`(`customer_id` ASC) USING BTREE,
  INDEX `fk_orders_employee`(`employee_id` ASC) USING BTREE,
  INDEX `fk_orders_voucher`(`voucher_id` ASC) USING BTREE,
  INDEX `fk_orders_payment`(`payment_method_id` ASC) USING BTREE,
  INDEX `fk_orders_shipping`(`shipping_method_id` ASC) USING BTREE,
  CONSTRAINT `fk_orders_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_payment` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`method_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_shipping` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`method_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_user` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (8, '2025-09-24', 'cart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (9, '2025-09-25', 'cancelled', 'Phong Ngo', '0904856521', 'Ha Noi', 27, NULL, 8, 1, 2);
INSERT INTO `orders` VALUES (10, '2025-09-25', 'confirmed', 'Phong Ngo', '0904856521', 'Ha Noi', 27, NULL, NULL, 2, 2);
INSERT INTO `orders` VALUES (11, '2025-09-25', 'completed', 'Phong Ngo', '0904856521', 'Ha Noi', 27, NULL, 5, 1, 1);
INSERT INTO `orders` VALUES (12, '2025-09-29', 'cart', NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (13, '2025-10-01', 'confirmed', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 2, 1, 1);
INSERT INTO `orders` VALUES (14, '2025-09-29', 'completed', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 3, 1, 2);
INSERT INTO `orders` VALUES (15, '2025-09-30', 'completed', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 4, 1, 1);
INSERT INTO `orders` VALUES (16, '2025-09-26', 'completed', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 5, 1, 1);
INSERT INTO `orders` VALUES (17, '2025-10-01', 'pending', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 8, 1, 1);
INSERT INTO `orders` VALUES (18, '2025-10-01', 'confirmed', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 14, 1, 1);
INSERT INTO `orders` VALUES (19, '2025-10-01', 'pending', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 7, 3, 2);
INSERT INTO `orders` VALUES (20, '2025-10-01', 'confirmed', 'Phong Ngo', '0904856521', 'Ha Noi', 30, NULL, 3, 1, 2);
INSERT INTO `orders` VALUES (21, '2025-10-01', 'returned', 'Phong Ngo', '0904856521', 'Ha Noi', 30, NULL, 11, 1, 2);
INSERT INTO `orders` VALUES (22, '2025-10-01', 'cart', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (23, '2025-10-03', 'confirmed', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 11, 1, 1);
INSERT INTO `orders` VALUES (24, '2025-10-03', 'confirmed', 'Phong Ngo', '0904856521', 'Ha Noi', 26, NULL, 15, 1, 2);

-- ----------------------------
-- Table structure for owners
-- ----------------------------
DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners`  (
  `owner_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`owner_id`) USING BTREE,
  UNIQUE INDEX `owners_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of owners
-- ----------------------------
INSERT INTO `owners` VALUES (1, 'admin', 'admin@admin', '0904856521', '$2y$12$ipZIUBJzufgGRf.RI7cL0e7YWbxz0gktTk.KgwwmBptA2wehdXuby', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods`  (
  `method_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID phương thức thanh toán',
  `method_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên phương thức thanh toán',
  PRIMARY KEY (`method_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES (1, '	Thanh toán online qua cổng VNPAY');
INSERT INTO `payment_methods` VALUES (2, '	Thanh toán khi giao hàng (COD)');
INSERT INTO `payment_methods` VALUES (3, 'Thanh toán online qua cổng Momo');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for product_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE `product_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `origin` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `long_description` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `weight` varchar(11) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `material` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `length` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_productdetail_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_detail
-- ----------------------------
INSERT INTO `product_detail` VALUES (30, 'QA1', 'Việt Nam', 'Áo khoác hàng chính hãng, chất liệu cao cấp 50% Polyester, 25% Cotton, 25% Rayon, phù hợp tập luyện và đi chơi.', NULL, NULL, '100% polyester', NULL, 'Đen');
INSERT INTO `product_detail` VALUES (31, 'XA1', 'Việt Nam', 'Áo khoác Arsenal chính hãng, chất liệu cao cấp, co giãn tốt.', NULL, NULL, '100% polyester', NULL, 'Xanh lá');
INSERT INTO `product_detail` VALUES (32, 'QA2', 'Việt Nam', 'Quần nỉ bóng đá Arsenal chất liệu mềm mại, thoải mái vận động.', NULL, NULL, '100% polyester', NULL, 'Đen');
INSERT INTO `product_detail` VALUES (33, 'QA3', 'Việt Nam', 'Giày bóng đá Predator Pro Unisex với đế bám chắc và thiết kế hiện đại.', NULL, NULL, '100% polyester', NULL, 'Trắng');
INSERT INTO `product_detail` VALUES (34, 'HT1', 'Việt Nam', 'Quả bóng adidas UCL League chuẩn thi đấu, độ bền cao.', NULL, NULL, '100% polyester', NULL, 'Trắng');
INSERT INTO `product_detail` VALUES (35, 'QA4', 'Việt Nam', 'Tất bóng đá adidas chất liệu cotton mềm, co giãn, thoáng khí.', NULL, NULL, '100% polyester', NULL, 'Trắng');
INSERT INTO `product_detail` VALUES (36, 'HT2', 'Việt Nam', 'Tất bóng đá MU sân nhà chất lượng cao.', NULL, NULL, '100% polyester', NULL, 'Đen');
INSERT INTO `product_detail` VALUES (37, 'HT3', 'Việt Nam', 'Áo jersey Arsenal chính hãng, thấm hút mồ hôi tốt.', NULL, NULL, '100% polyester', NULL, 'Đỏ');
INSERT INTO `product_detail` VALUES (38, 'HT4', 'Việt Nam', 'Áo thủ môn Liverpool chất liệu thoáng mát, co giãn.', NULL, NULL, '100% polyester', NULL, 'Xanh lá');
INSERT INTO `product_detail` VALUES (39, 'TA1', 'Việt Nam', 'Áo jersey Liverpool sân nhà chính hãng.', NULL, NULL, '100% polyester', NULL, 'Đỏ');
INSERT INTO `product_detail` VALUES (40, 'TA2', 'Việt Nam', 'Quần short Liverpool chất liệu thoáng mát.', NULL, NULL, '100% polyester', NULL, 'Đen');
INSERT INTO `product_detail` VALUES (41, 'XA2', 'Việt Nam', 'Quần short Liverpool US Pack mềm mại, co giãn.', NULL, NULL, '100% polyester', NULL, 'Xám');
INSERT INTO `product_detail` VALUES (42, 'XA3', 'Việt Nam', 'Áo hoodie Liverpool chính hãng, giữ ấm tốt.', NULL, NULL, '100% polyester', NULL, 'Đỏ');
INSERT INTO `product_detail` VALUES (43, 'XA4', 'Việt Nam', 'Áo bóng đá Liverpool US Pack Unisex.', NULL, NULL, '100% polyester', NULL, 'Đỏ');
INSERT INTO `product_detail` VALUES (44, 'TA3', 'Việt Nam', 'Áo jersey Liverpool Terrace Icons Unisex.', NULL, NULL, '100% polyester', NULL, 'Trắng');
INSERT INTO `product_detail` VALUES (45, 'TA4', 'Việt Nam', 'Áo jersey trẻ em Liverpool chính hãng.', NULL, NULL, '100% polyester', NULL, 'Xanh lá');
INSERT INTO `product_detail` VALUES (46, 'TA5', 'Việt Nam', 'Bộ quần áo bóng đá trẻ em Liverpool chính hãng.', NULL, NULL, '100% polyester', NULL, 'Đỏ');
INSERT INTO `product_detail` VALUES (47, 'TA6', 'Việt Nam', 'Áo jersey Real Madrid Third Nam.', NULL, NULL, '100% polyester', NULL, 'Xanh da trời');
INSERT INTO `product_detail` VALUES (48, 'HT5', 'Việt Nam', 'Áo jersey trẻ em Real Madrid Third Unisex.', NULL, NULL, '100% polyester', NULL, 'Xanh da trời');
INSERT INTO `product_detail` VALUES (50, 'JR3092', 'Việt Nam', 'Giày chạy bộ Runfalcon 5 Nữ nhẹ, đế êm.', NULL, NULL, '100% polyester', NULL, 'Trắng');
INSERT INTO `product_detail` VALUES (51, 'JQ3811', 'Việt Nam', 'Giày chạy bộ Ultrarun 5 Nam.', NULL, NULL, '100% polyester', NULL, 'Xanh da trời');
INSERT INTO `product_detail` VALUES (52, 'JQ1761', 'Việt Nam', 'Giày chạy bộ Supernova Comfortglide Nữ.', NULL, NULL, '100% polyester', NULL, 'Vàng');
INSERT INTO `product_detail` VALUES (53, 'JI3389', 'Việt Nam', 'Giày chạy bộ Runfalcon 5 Nữ.', NULL, NULL, '100% polyester', NULL, 'Đen');
INSERT INTO `product_detail` VALUES (54, 'JI2991', 'Việt Nam', 'Giày chạy bộ Adizero SL2 Nữ.', NULL, NULL, '100% polyester', NULL, 'Hồng');
INSERT INTO `product_detail` VALUES (55, '1011C077400', 'Việt Nam', 'Giày chạy bộ ASICS GT-1000 14 Nam.', NULL, NULL, '100% polyester', NULL, 'Xanh');
INSERT INTO `product_detail` VALUES (56, '1011B984402', 'Việt Nam', 'Giày chạy bộ ASICS VERSABLAST 4 Nam.', NULL, NULL, '100% polyester', NULL, 'Xanh');
INSERT INTO `product_detail` VALUES (57, '1011B979002', 'Việt Nam', 'Giày chạy trail ASICS GEL-SONOMA 8 Nam.', NULL, NULL, '100% polyester', NULL, 'Đen');
INSERT INTO `product_detail` VALUES (58, 'W6825322311', 'Việt Nam', 'Giày chạy bộ 361º Nữ W682532231-1.', NULL, NULL, '100% polyester', NULL, 'Đen');
INSERT INTO `product_detail` VALUES (61, 'ASICS4', 'Vietnam', 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.400', NULL, NULL, 'Tổng hợp', NULL, 'MIDNIGHT/BLACK');
INSERT INTO `product_detail` VALUES (62, 'ASICS5', 'Vietnam', 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.002', NULL, NULL, 'Tổng hợp', NULL, 'BLACK/WHITE');
INSERT INTO `product_detail` VALUES (63, 'ASICS6', 'Vietnam', 'Áo gió chạy bộ ASICS ROAD LITE-SHOW PACKABLE Nam - 2011D358.001', NULL, NULL, 'Tổng hợp', NULL, 'PERFORMANCE BLACK/DARK COBALT');
INSERT INTO `product_detail` VALUES (64, 'ASICS7', 'Vietnam', 'Áo T-shirt chạy bộ ASICS ROAD LITE-SHOW Nam - 2011D357.001', NULL, NULL, 'Tổng hợp', NULL, 'PERFORMANCE BLACK');
INSERT INTO `product_detail` VALUES (65, 'ASICS8', 'Vietnam', 'Chân váy tennis/pickleball ASICS MATCH Nữ - 2042A392.200', NULL, NULL, 'Tổng hợp', NULL, 'CREAM');
INSERT INTO `product_detail` VALUES (66, 'ASICS9', 'Vietnam', 'Áo Polo tennis/pickleball ASICS MATCH ACTIBREEZE Nam - 2041A365.400', NULL, NULL, 'Tổng hợp', NULL, 'MIDNIGHT');
INSERT INTO `product_detail` VALUES (67, 'ASICS10', 'Vietnam', 'Áo T-shirt tennis/pickleball ASICS GAME ALL OVER PRINT Nam - 2041A353.400', NULL, NULL, 'Tổng hợp', NULL, 'MIDNIGHT');
INSERT INTO `product_detail` VALUES (68, 'ASICS11', 'Vietnam', 'Quần short tennis/pickleball ASICS COURT 7IN Nam - 2041A344.400', NULL, NULL, 'Tổng hợp', NULL, 'MIDNIGHT');
INSERT INTO `product_detail` VALUES (69, 'ASICS12', 'Vietnam', 'Áo Polo tennis/pickleball ASICS COURT Nam - 2041A340.301', NULL, NULL, 'Tổng hợp', NULL, 'JASPER GREEN');
INSERT INTO `product_detail` VALUES (70, 'ASICS13', 'Vietnam', 'Quần short chạy trail ASICS FUJITRAIL ALL OVER PRINT 5IN Nam - 2011D392.001', NULL, NULL, 'Tổng hợp', NULL, 'PERFORMANCE BLACK');
INSERT INTO `product_detail` VALUES (71, 'ASICS14', 'Vietnam', 'Áo T-shirt tennis/pickleball ASICS COURT SS Nam - 2041A339.301', NULL, NULL, 'Tổng hợp', NULL, 'JASPER GREEN');
INSERT INTO `product_detail` VALUES (72, 'ASICS121', 'Vietnam', 'Áo T-shirt tennis/pickleball ASICS MATCH ACTIBREEZE SS Nam - 2041A320.325', NULL, NULL, 'Tổng hợp', NULL, 'JASPER GREEN');
INSERT INTO `product_detail` VALUES (73, 'ASICS123', 'Vietnam', 'Áo Tank Top chạy trail ASICS FUJITRAIL Nữ - 2012D324.101', NULL, NULL, 'Tổng hợp', NULL, 'CREAM/RAINSTORM GREY');
INSERT INTO `product_detail` VALUES (74, 'ASICS213', 'Vietnam', 'Áo T-shirt chạy trail ASICS FUJITRAIL LOGO SS Nữ - 2012D314.100', NULL, NULL, '100% cotton', NULL, 'CREAM');
INSERT INTO `product_detail` VALUES (75, 'ASICS43', 'Vietnam', 'Quần short chạy trail ASICS FUJITRAIL ALL OVER PRINT 5IN Nam - 2011D392.300', NULL, NULL, '100% cotton', NULL, 'MANTLE GREEN');
INSERT INTO `product_detail` VALUES (76, 'ASICS342', 'Vietnam', 'Áo gió tập luyện ASICS NAGINO ACTIBREEZE SHORT Nữ - 2032D146.300', NULL, NULL, '100% cotton', NULL, 'WHISPER GREEN');
INSERT INTO `product_detail` VALUES (77, 'ASICS432', 'Vietnam', 'Áo gió chạy trail ASICS FUJITRAIL PACKABLE WINDBREAKER Nam - 2011D389.002', NULL, NULL, '100% cotton', NULL, 'PERFORMANCE BLACK');
INSERT INTO `product_detail` VALUES (78, 'ASICS6534', 'Vietnam', 'Áo T-shirt tập luyện ASICS ALL OVER PRINT Nam - 2031F199.300', NULL, NULL, '100% cotton', NULL, 'MANTLE GREEN/BROWN STONE');
INSERT INTO `product_detail` VALUES (79, 'ASICS6435', 'Vietnam', 'Áo ba lỗ chạy trail ASICS FUJITRAIL SINGLET Nam - 2011D388.300', NULL, NULL, '100% cotton', NULL, 'MANTLE GREEN/KHAKI');
INSERT INTO `product_detail` VALUES (80, 'ASICS76', 'Vietnam', 'Bó gối ASICS VBELBOWPAD GELPAD Unisex - 3053A152.002', NULL, NULL, '100% cotton', NULL, 'PERFORMANCE BLACK/BRIGHT ROSE');
INSERT INTO `product_detail` VALUES (81, 'ASICS5645', 'Vietnam', 'Bó gối ASICS VBELBOWPAD GELPAD Unisex - 3053A152.001', NULL, NULL, '100% cotton', NULL, 'PERFORMANCE BLACK/BRILLIANT WHITE');
INSERT INTO `product_detail` VALUES (82, 'ASICS6345', 'Vietnam', 'Mũ lưỡi trai chạy bộ ASICS RUNNING LIGHT WOVEN Unisex - 3013B124.020', NULL, NULL, 'Tổng hợp\r\n', NULL, 'STEEL GREY');
INSERT INTO `product_detail` VALUES (83, 'ASIC453S', 'Vietnam', 'Áo T-shirt tập luyện ASICS ALL OVER PRINT Nam - 2031F199.020', NULL, NULL, 'Tổng hợp\r\n', NULL, 'GRAPHITE GREY/PERFORMANCE BLACK');
INSERT INTO `product_detail` VALUES (84, 'AS34534ICS', 'Vietnam', 'Áo T-shirt tập luyện ASICS ACTIBREEZE PANEL JACQUARD Nam - 2031F123.001', NULL, NULL, 'Tổng hợp\r\n', NULL, 'PERFORMANCE BLACK');
INSERT INTO `product_detail` VALUES (85, 'AS34ICS', 'Vietnam', 'Áo T-shirt tennis/pickleball ASICS GAME ALL OVER PRINT Nữ - 2042A385.100', NULL, NULL, 'Tổng hợp\r\n', NULL, 'CREAM');
INSERT INTO `product_detail` VALUES (86, 'ASI654S', 'Vietnam', 'Áo Tank Top tennis/pickleball ASICS PADEL COURT Nữ - 2042A383.001', NULL, NULL, 'Tổng hợp\r\n', NULL, 'PERFORMANCE BLACK');
INSERT INTO `product_detail` VALUES (87, 'ASIC4534S', 'Vietnam', 'Chân váy tennis/pickleball ASICS PADEL COURT Nữ - 2042A381.002', NULL, NULL, 'Tổng hợp\r\n', NULL, 'PERFORMANCE BLACK/STONE WASH');
INSERT INTO `product_detail` VALUES (88, 'ASI756CS', 'Vietnam', 'Áo Tank Top tennis/pickleball ASICS COURT Nữ - 2042A370.702', NULL, NULL, 'Tổng hợp\r\n', NULL, 'BRIGHT ROSE');
INSERT INTO `product_detail` VALUES (89, 'ASICS100', 'Vietnam', 'Áo Tank Top tennis/pickleball ASICS COURT Nữ - 2042A370.400', NULL, NULL, 'Tổng hợp\r\n', NULL, 'MIDNIGHT');
INSERT INTO `product_detail` VALUES (90, 'NK001', 'Vietnam', 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-015', NULL, NULL, NULL, NULL, 'PRPLTM/ANTHRA');
INSERT INTO `product_detail` VALUES (91, 'NK002', 'Vietnam', 'Giày chạy bộ trẻ em Nike Uplift Sc (Gs) IF1749-100', NULL, NULL, NULL, NULL, 'SAIL/BLACK');
INSERT INTO `product_detail` VALUES (92, 'NK003', 'Vietnam', 'Giày thời trang Nike Terra Manta Nam HQ4502-100', NULL, NULL, NULL, NULL, 'WHITE/BLACK');
INSERT INTO `product_detail` VALUES (93, 'NK004', 'Vietnam', 'Giày thời trang Nike Killshot 2 Ltr Prm Nam HQ1657-004', NULL, NULL, NULL, NULL, 'SFTPRL/LTBTTN');
INSERT INTO `product_detail` VALUES (94, 'NK005', 'Vietnam', 'Giày thời trang Nike W Pacific Nữ HM4771-603', NULL, NULL, NULL, NULL, 'PARPIN/PLTVLT');
INSERT INTO `product_detail` VALUES (95, 'NK006', 'Vietnam', 'Giày thời trang Nike Court Shot Nam FQ8146-112', NULL, NULL, NULL, NULL, 'WHITE/BLACK');
INSERT INTO `product_detail` VALUES (96, 'NK007', 'Vietnam', 'Giày chạy bộ Nike Air Winflo 11 Nữ FJ9510-109', NULL, NULL, NULL, NULL, 'PALIVR/MRSGLD');
INSERT INTO `product_detail` VALUES (97, 'NK008', 'Vietnam', 'Giày chạy bộ Nike Downshifter 13 Nam FD6454-107', NULL, NULL, NULL, NULL, 'WHITE/BLACK');
INSERT INTO `product_detail` VALUES (98, 'NK009', 'Vietnam', 'Giày chạy bộ Nike W Air Zoom Pegasus 41 Nữ FD2723-114', NULL, NULL, NULL, NULL, 'SAIL/M SILV');
INSERT INTO `product_detail` VALUES (99, 'NK010', 'Vietnam', 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-115', NULL, NULL, NULL, NULL, 'WHITE/M SILV');
INSERT INTO `product_detail` VALUES (100, 'NK011', 'Vietnam', 'Giày thời trang Nike Wmns Air Max 90 Nữ DH8010-100', NULL, NULL, NULL, NULL, 'WHITE/WHITE');
INSERT INTO `product_detail` VALUES (101, 'NK012', 'Vietnam', 'Balo thể thao Nike HERITAGE BKPK Unisex DC4244-010', NULL, NULL, NULL, NULL, 'BLACK/WHITE');
INSERT INTO `product_detail` VALUES (102, 'NK013', 'Vietnam', 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-001', NULL, NULL, NULL, NULL, 'BLACK/WHITE');
INSERT INTO `product_detail` VALUES (103, 'NK014', 'Vietnam', 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-101', NULL, NULL, NULL, NULL, 'WHITE/WHITE');
INSERT INTO `product_detail` VALUES (104, 'NK015', 'Vietnam', 'Giày thời trang trẻ em Nike Terra Manta (Gs) HV9702-101', NULL, NULL, NULL, NULL, 'WHITE/BLACK');
INSERT INTO `product_detail` VALUES (105, 'NK016', 'Vietnam', 'Giày thời trang Nike Uplift Sc Nam IB2765-100', NULL, NULL, NULL, NULL, 'SAIL/BLACK');
INSERT INTO `product_detail` VALUES (106, 'NK017', 'Vietnam', 'Giày thời trang Nike Initiator Nam 394055-001', NULL, NULL, NULL, NULL, 'M SILV/BLACK');
INSERT INTO `product_detail` VALUES (107, 'NK018', 'Vietnam', 'Giày thời trang Nike Court Legacy NN Nữ DH3161-112', NULL, NULL, NULL, NULL, 'SAIL/WHTONX');
INSERT INTO `product_detail` VALUES (108, 'NK019', 'Vietnam', 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-106', NULL, NULL, NULL, NULL, 'SAIL/M SILV');
INSERT INTO `product_detail` VALUES (109, 'NK020', 'Vietnam', 'Giày chạy bộ Nike Air Winflo 11 Nữ FJ9510-108', NULL, NULL, NULL, NULL, 'SAIL/M SILV');
INSERT INTO `product_detail` VALUES (110, 'NK021', 'Vietnam', 'Giày chạy bộ Nike VOMERO 18 Nam HM6803-101', NULL, NULL, NULL, NULL, 'SMTWHT/BLACK');
INSERT INTO `product_detail` VALUES (111, 'NK022', 'Vietnam', 'Giày chạy bộ Nike Revolution 8 Nam HJ9198-101', NULL, NULL, NULL, NULL, 'WHITE/BLACK');
INSERT INTO `product_detail` VALUES (112, 'NK023', 'Vietnam', 'Giày chạy bộ Nike Revolution 8 Nam HJ9198-003', NULL, NULL, NULL, NULL, 'BLACK/WHITE');
INSERT INTO `product_detail` VALUES (113, 'NK024', 'Vietnam', 'Giày chạy bộ Nike Revolution 8 Nữ HJ8485-100', NULL, NULL, NULL, NULL, 'WHITE/M SILV');
INSERT INTO `product_detail` VALUES (114, 'NK025', 'Vietnam', 'Giày chạy bộ Nike Air Zoom Rival Fly 4 Nam FV6040-001', NULL, NULL, NULL, NULL, 'BLACK/WHITE');
INSERT INTO `product_detail` VALUES (115, 'NK026', 'Vietnam', 'Giày chạy bộ Nike Journey Run Nam FN0228-104', NULL, NULL, NULL, NULL, 'WHITE/M SILV');
INSERT INTO `product_detail` VALUES (116, 'NK027', 'Vietnam', 'Giày chạy bộ Nike Journey Run Nữ FJ7765-113', NULL, NULL, NULL, NULL, 'WHITE/HYDRAN');
INSERT INTO `product_detail` VALUES (117, 'NK028', 'Vietnam', 'Giày chạy bộ Nike Downshifter 13 Nam FD6454-010', NULL, NULL, NULL, NULL, 'COOLGREY/WHITE');
INSERT INTO `product_detail` VALUES (118, 'NK029', 'Vietnam', 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-014', NULL, NULL, NULL, NULL, 'GHOST/BLVOID');
INSERT INTO `product_detail` VALUES (119, 'NK030', 'Vietnam', 'Giày chạy bộ Nike VOMERO 18 Nam HM6803-100', NULL, NULL, NULL, NULL, 'WHITE/BLACK');
INSERT INTO `product_detail` VALUES (120, 'NK031', 'Vietnam', 'Giày chạy bộ Nike Air Winflo 11 Nam FJ9509-002', NULL, NULL, NULL, NULL, 'BLACK/ANTHRA');
INSERT INTO `product_detail` VALUES (121, 'NK032', 'Vietnam', 'Giày chạy bộ Nike Quest 6 Nam FD6033-107', NULL, NULL, NULL, NULL, 'WHITE/UNVRED');
INSERT INTO `product_detail` VALUES (122, 'LQ001', 'Vietnam', 'Giày thể thao le coq sportif nam L241MCNS0120-AAD', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (123, 'LQ002', 'Vietnam', 'Áo khoác nỉ le coq golf nam QGMXJL60V-BG00', NULL, NULL, NULL, NULL, 'Beige');
INSERT INTO `product_detail` VALUES (124, 'LQ003', 'Vietnam', 'Áo khoác nỉ le coq golf nam QGMXJL53V-WH00', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (125, 'LQ004', 'Vietnam', 'Áo khoác gió le coq sportif Nam LT5SJG10MV-BK00', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (126, 'LQ005', 'Vietnam', 'Áo polo dài tay le coq golf Nam GP321MTL93-BLCK', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (127, 'LQ006', 'Vietnam', 'Áo khoác gió le coq golf Nam LG4FWB05MV-BK00', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (128, 'LQ007', 'Vietnam', 'Quần Short nam le coq golf QGMXJD51V-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (129, 'LQ008', 'Vietnam', 'Áo khoác nỉ le coq golf nam QGMXJL53V-GR00', NULL, NULL, NULL, NULL, 'Green');
INSERT INTO `product_detail` VALUES (130, 'LQ009', 'Vietnam', 'Áo khoác nỉ le coq golf nam QGMXJL53V-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (131, 'LQ010', 'Vietnam', 'Áo khoác gió le coq golf nam QGMXJK01V-GY00', NULL, NULL, NULL, NULL, 'Grey');
INSERT INTO `product_detail` VALUES (132, 'LQ011', 'Vietnam', 'Áo khoác gió le coq golf nam QGMXJK01V-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (133, 'LQ012', 'Vietnam', 'Quần lót le coq golf Nữ QGWXJM50V-BK00', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (134, 'LQ013', 'Vietnam', 'Quần lót le coq golf Nữ QGWXJM50V-GY00', NULL, NULL, NULL, NULL, 'Grey');
INSERT INTO `product_detail` VALUES (135, 'LQ014', 'Vietnam', 'Quần short le coq sportif Nam LN5FHP20MV-WR00', NULL, NULL, NULL, NULL, 'Red');
INSERT INTO `product_detail` VALUES (136, 'LQ015', 'Vietnam', 'Quần short le coq sportif Nam LN5FHP20MV-WH00', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (137, 'LQ016', 'Vietnam', 'Quần short le coq sportif Nam LN5FHP20MV-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (138, 'LQ017', 'Vietnam', 'Chân váy le coq sportif Nữ QQ322OSK72-PPP0', NULL, NULL, NULL, NULL, 'Pink');
INSERT INTO `product_detail` VALUES (139, 'LQ018', 'Vietnam', 'Chân váy le coq sportif Nữ QQ322OSK72-BLK0', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (140, 'LQ019', 'Vietnam', 'Chân váy le coq sportif Nữ LN5FSK20LV-WR00', NULL, NULL, NULL, NULL, 'Red');
INSERT INTO `product_detail` VALUES (141, 'LQ020', 'Vietnam', 'Chân váy le coq sportif Nữ LN5FSK20LV-WH00', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (142, 'LQ021', 'Vietnam', 'Chân váy le coq sportif Nữ LN5FSK20LV-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (143, 'LQ022', 'Vietnam', 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-WR00', NULL, NULL, NULL, NULL, 'Red');
INSERT INTO `product_detail` VALUES (144, 'LQ023', 'Vietnam', 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-WH00', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (145, 'LQ024', 'Vietnam', 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (146, 'LQ025', 'Vietnam', 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-WR00', NULL, NULL, NULL, NULL, 'Red');
INSERT INTO `product_detail` VALUES (147, 'LQ026', 'Vietnam', 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-WH00', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (148, 'LQ027', 'Vietnam', 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (149, 'LQ028', 'Vietnam', 'Áo T-shirt le coq sportif Nam LT5FHT02MV-WH00', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (150, 'LQ029', 'Vietnam', 'Áo T-shirt le coq sportif Nam LT5FHT02MV-BK00', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (151, 'LQ030', 'Vietnam', 'Áo T-shirt le coq sportif Nam LN5FHT21MV-WH00', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (152, 'LQ031', 'Vietnam', 'Áo T-shirt le coq sportif Nam LN5FHT21MV-NV00', NULL, NULL, NULL, NULL, 'Navy');
INSERT INTO `product_detail` VALUES (153, 'LQ032', 'Vietnam', 'Áo T-shirt le coq sportif Nam LN5FHT20MV-WR00', NULL, NULL, NULL, NULL, 'Red');
INSERT INTO `product_detail` VALUES (154, 'LIN001', 'Vietnam', 'Giày cầu lông chuyên nghiệp Li-Ning Nam P-AYZU021-1', NULL, NULL, NULL, NULL, 'Standard White / Vermilion Red');
INSERT INTO `product_detail` VALUES (155, 'LIN002', 'Vietnam', 'Giày cầu lông chuyên nghiệp Li-Ning Nữ P-AYZU019-2', NULL, NULL, NULL, NULL, 'Standard White / Wave Blue');
INSERT INTO `product_detail` VALUES (156, 'LIN003', 'Vietnam', 'Giày cầu lông Li-Ning Thunder Nữ P-AYZU015-1', NULL, NULL, NULL, NULL, 'Standard White / Light Blue Purple');
INSERT INTO `product_detail` VALUES (157, 'LIN004', 'Vietnam', 'Giày cầu lông Li-Ning Hunting Nữ P-AYZT009-2', NULL, NULL, NULL, NULL, 'White/Pink');
INSERT INTO `product_detail` VALUES (158, 'LIN005', 'Vietnam', 'Giày cầu lông Li-Ning Hunting Nữ P-AYZT009-1', NULL, NULL, NULL, NULL, 'White/Blue');
INSERT INTO `product_detail` VALUES (159, 'LIN006', 'Vietnam', 'Giày cầu lông Li-Ning Blade LITE Nam P-AYZT005-3', NULL, NULL, NULL, NULL, 'Standard White/Black');
INSERT INTO `product_detail` VALUES (160, 'LIN007', 'Vietnam', 'Giày cầu lông Li-Ning Blade LITE Unisex P-AYZT005-2', NULL, NULL, NULL, NULL, 'Selected Navy Blue / Fluorescent Begonia Red');
INSERT INTO `product_detail` VALUES (161, 'LIN008', 'Vietnam', 'Giày cầu lông Li-Ning Nam P-AYTV025-1', NULL, NULL, NULL, NULL, 'White/Blue/Red');
INSERT INTO `product_detail` VALUES (162, 'LIN009', 'Vietnam', 'Giày cầu lông Li-Ning Nam P-AYTV023-1', NULL, NULL, NULL, NULL, 'White/Blue');
INSERT INTO `product_detail` VALUES (163, 'LIN010', 'Vietnam', 'Giày cầu lông Li-Ning Nam P-AYTV015-3', NULL, NULL, NULL, NULL, 'Standard White / Glory Red');
INSERT INTO `product_detail` VALUES (164, 'LIN011', 'Vietnam', 'Giày cầu lông Li-Ning Unisex P-AYTV003-3', NULL, NULL, NULL, NULL, 'Standard White / Magenta');
INSERT INTO `product_detail` VALUES (165, 'LIN012', 'Vietnam', 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-4', NULL, NULL, NULL, NULL, 'Blueprint/Neon');
INSERT INTO `product_detail` VALUES (166, 'LIN013', 'Vietnam', 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-2', NULL, NULL, NULL, NULL, 'White/ Blue');
INSERT INTO `product_detail` VALUES (167, 'LIN014', 'Vietnam', 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-1', NULL, NULL, NULL, NULL, 'Standard White / Black');
INSERT INTO `product_detail` VALUES (168, 'LIN015', 'Vietnam', 'Giày cầu lông Li-Ning Unisex P-AYTU001-9', NULL, NULL, NULL, NULL, 'Standard White / Navy Blue');
INSERT INTO `product_detail` VALUES (169, 'LIN016', 'Vietnam', 'Giày cầu lông Li-Ning Nam P-AYTT001-5', NULL, NULL, NULL, NULL, 'Standard White');
INSERT INTO `product_detail` VALUES (170, 'LIN017', 'Vietnam', 'Giày cầu lông Li-Ning Thunder LITE Nam P-AYTS020-7', NULL, NULL, NULL, NULL, 'Standard White');
INSERT INTO `product_detail` VALUES (171, 'LIN018', 'Vietnam', 'Giày cầu lông Li-Ning Nam P-AYTS016-7', NULL, NULL, NULL, NULL, 'Standard White / Navy Blue');
INSERT INTO `product_detail` VALUES (172, 'LIN019', 'Vietnam', 'Băng tay Li-Ning Unisex P-AHWR014-7', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (173, 'LIN020', 'Vietnam', 'Băng tay Li-Ning Unisex P-AHWR010-8', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (174, 'LIN021', 'Vietnam', 'Băng tay Li-Ning Unisex P-AHWR010-7', NULL, NULL, NULL, NULL, 'Blue');
INSERT INTO `product_detail` VALUES (175, 'LIN022', 'Vietnam', 'Tất cổ ngắn Li-Ning Unisex P-AWSU075-3', NULL, NULL, NULL, NULL, 'White Black');
INSERT INTO `product_detail` VALUES (176, 'LIN023', 'Vietnam', 'Chân váy Li-Ning Nữ ASKV140-2V', NULL, NULL, NULL, NULL, 'Naval Academy');
INSERT INTO `product_detail` VALUES (177, 'LIN024', 'Vietnam', 'Quần short Li-Ning Nữ AKSV452-3V', NULL, NULL, NULL, NULL, 'Naval Academy');
INSERT INTO `product_detail` VALUES (178, 'LIN025', 'Vietnam', 'Quần short Li-Ning Nam AKSV459-3V', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (179, 'LIN026', 'Vietnam', 'Quần nỉ Li-Ning Nữ AKLV356-3V', NULL, NULL, NULL, NULL, 'Naval Academy');
INSERT INTO `product_detail` VALUES (180, 'LIN027', 'Vietnam', 'Quần gió Li-Ning Nam AYKV753-1V', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (181, 'LIN028', 'Vietnam', 'Quần gió Li-Ning Nam AYKV371-2V', NULL, NULL, NULL, NULL, 'Naval Academy');
INSERT INTO `product_detail` VALUES (182, 'LIN029', 'Vietnam', 'Giày thời trang Li-Ning THE RIZZ Nam AGCV455-1V', NULL, NULL, NULL, NULL, 'Milk White');
INSERT INTO `product_detail` VALUES (183, 'LIN030', 'Vietnam', 'Giày thời trang COMMON 80S Nam AGCV207-2V', NULL, NULL, NULL, NULL, 'Blanc De Blanc/Black');
INSERT INTO `product_detail` VALUES (184, 'LIN031', 'Vietnam', 'Áo T-shirt Li-Ning Nữ AHSV472-6V', NULL, NULL, NULL, NULL, 'Naval Academy');
INSERT INTO `product_detail` VALUES (185, 'LIN032', 'Vietnam', 'Áo T-shirt Li-Ning Nữ AHSV472-1V', NULL, NULL, NULL, NULL, 'Milk White');
INSERT INTO `product_detail` VALUES (186, '361001', 'Vietnam', 'Quần short 361º Nam W552539106-4C', NULL, NULL, NULL, NULL, 'Grey');
INSERT INTO `product_detail` VALUES (187, '361002', 'Vietnam', 'Quần short 361º Nam W552539106-3C', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (188, '361003', 'Vietnam', 'Quần nỉ 361º Nữ W562539051B-1C', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (189, '361004', 'Vietnam', 'Quần nỉ 361º Nam W552534709-2C', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (190, '361005', 'Vietnam', 'Quần gió 361º Nam W552534704-3C', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (191, '361006', 'Vietnam', 'Quần gió 361º Nam W552533708-1C', NULL, NULL, NULL, NULL, 'Green');
INSERT INTO `product_detail` VALUES (192, '361007', 'Vietnam', 'Quần gió 361º Nam W552533704-1C', NULL, NULL, NULL, NULL, 'Grey Khaki');
INSERT INTO `product_detail` VALUES (193, '361008', 'Vietnam', 'Giày thời trang 361º XING RAN 4.0 Nam W572536602-6', NULL, NULL, NULL, NULL, 'Egret/Grey Blue');
INSERT INTO `product_detail` VALUES (194, '361009', 'Vietnam', 'Giày thời trang 361º QIHANG 4.0 Nam W572536608-3', NULL, NULL, NULL, NULL, 'Egret/Oat Milk');
INSERT INTO `product_detail` VALUES (195, '361010', 'Vietnam', 'Giày thời trang 361º QIHANG 4.0 Nam W572536608-1', NULL, NULL, NULL, NULL, 'Egret/Green');
INSERT INTO `product_detail` VALUES (196, '361011', 'Vietnam', 'Giày thời trang 361º Nam W672536621-3', NULL, NULL, NULL, NULL, 'Egret/Dk.Blue');
INSERT INTO `product_detail` VALUES (197, '361012', 'Vietnam', 'Giày thời trang 361º Nam W672536621-2', NULL, NULL, NULL, NULL, 'Egret/Black Cherry');
INSERT INTO `product_detail` VALUES (198, '361013', 'Vietnam', 'Giày chạy bộ 361º Nam W572532221-3', NULL, NULL, NULL, NULL, 'Circular Grey/Iceberg Green');
INSERT INTO `product_detail` VALUES (199, '361014', 'Vietnam', 'Giày chạy bộ 361º Funky TimeⅡ Nữ W582532209-11', NULL, NULL, NULL, NULL, 'Obsidian Black/Gold');
INSERT INTO `product_detail` VALUES (200, '361015', 'Vietnam', 'Giày chạy bộ 361º Funky TimeⅡ Nam W572532209-7', NULL, NULL, NULL, NULL, 'Egret/Dk.Blue');
INSERT INTO `product_detail` VALUES (201, '361016', 'Vietnam', 'Áo Polo dài tay 361º Nữ W562539102-2C', NULL, NULL, NULL, NULL, 'Dk.Blue');
INSERT INTO `product_detail` VALUES (202, '361017', 'Vietnam', 'Áo Polo dài tay 361º Nữ W562539102-1C', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (203, '361018', 'Vietnam', 'Áo nỉ có mũ 361º Nữ W562539051A-2C', NULL, NULL, NULL, NULL, 'Dk.Blue');
INSERT INTO `product_detail` VALUES (204, '361019', 'Vietnam', 'Áo khoác nỉ có mũ 361º Nữ W562539052A-3C', NULL, NULL, NULL, NULL, 'White');
INSERT INTO `product_detail` VALUES (205, '361020', 'Vietnam', 'Áo khoác nỉ có mũ 361º Nữ W562539052A-2C', NULL, NULL, NULL, NULL, 'Dk.Blue');
INSERT INTO `product_detail` VALUES (206, '361021', 'Vietnam', 'Áo gió có mũ 361º Nữ W562532057A-3C', NULL, NULL, NULL, NULL, 'Yellow');
INSERT INTO `product_detail` VALUES (207, '361022', 'Vietnam', 'Áo gió có mũ 361º Nữ W562532057A-2C', NULL, NULL, NULL, NULL, 'Lt.Green');
INSERT INTO `product_detail` VALUES (208, '361023', 'Vietnam', 'Quần nỉ 361º Nữ W562539051B-2C', NULL, NULL, NULL, NULL, 'Dk.Blue');
INSERT INTO `product_detail` VALUES (209, '361024', 'Vietnam', 'Quần nỉ 361º Nữ W562534009B-1C', NULL, NULL, NULL, NULL, 'Dk.Blue');
INSERT INTO `product_detail` VALUES (210, '361025', 'Vietnam', 'Quần nỉ 361º Nữ W562534006B-5C', NULL, NULL, NULL, NULL, 'Dk.Blue');
INSERT INTO `product_detail` VALUES (211, '361026', 'Vietnam', 'Quần gió 361º Nữ W562539010B-4C', NULL, NULL, NULL, NULL, 'Lt.Brown');
INSERT INTO `product_detail` VALUES (212, '361027', 'Vietnam', 'Quần gió 361º Nam W552533708-2C', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (213, '361028', 'Vietnam', 'Quần gió 361º Nam W552533704-2C', NULL, NULL, NULL, NULL, 'Black');
INSERT INTO `product_detail` VALUES (214, '361029', 'Vietnam', 'Giày thời trang 361º QIHANG 4.0 Nữ W582536608-3', NULL, NULL, NULL, NULL, 'Egret/Mineral Green');
INSERT INTO `product_detail` VALUES (215, '361030', 'Vietnam', 'Giày thời trang 361º Nữ W682536621-2', NULL, NULL, NULL, NULL, 'Egret/Black Cherry');
INSERT INTO `product_detail` VALUES (216, '361031', 'Vietnam', 'Giày chạy bộ 361º Nebulae Nữ W582532215-1', NULL, NULL, NULL, NULL, 'Egret/Mineral Green');
INSERT INTO `product_detail` VALUES (217, '361032', 'Vietnam', 'Giày chạy bộ 361º Nebulae Nam W572532216-5', NULL, NULL, NULL, NULL, 'Egret/Dk.Blue');
INSERT INTO `product_detail` VALUES (218, 'SPO001', 'Vietnam', 'Máy chạy bộ đa năng HQ-9800', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (219, 'SPO002', 'Vietnam', 'Máy chạy bộ điện AGT-109L', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (220, 'SPO003', 'Vietnam', 'Máy chạy bộ điện Aguri AGT 106ILE', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (221, 'SPO004', 'Vietnam', 'Máy chạy bộ điện AGURI AGT-102LE', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (222, 'SPO005', 'Vietnam', 'Máy chạy bộ điện AGURI AGT-104T', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (223, 'SPO006', 'Vietnam', 'MÁY CHẠY BỘ ĐIỆN DL-T4', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (224, 'SPO007', 'Vietnam', 'Máy chạy bộ điện đa năng HQ-V1C', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (225, 'SPO008', 'Vietnam', 'Máy Chạy Bộ Điện HQ- 223', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (226, 'SPO009', 'Vietnam', 'Máy Chạy Bộ Điện HQ- 333', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (227, 'SPO010', 'Vietnam', 'Máy Chạy Bộ Điện HQ- 555', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (228, 'SPO011', 'Vietnam', 'Máy Chạy Bộ Điện HQ- 9600', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (229, 'SPO012', 'Vietnam', 'Máy chạy bộ điện HQ-112', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (230, 'SPO013', 'Vietnam', 'Máy chạy bộ điện HQ-222', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (231, 'SPO014', 'Vietnam', 'Máy chạy bộ điện HQ-777', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (232, 'SPO015', 'Vietnam', 'Máy chạy bộ điện Oreni RE-5', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (233, 'SPO016', 'Vietnam', 'Máy chạy bộ điện PF- 115', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (234, 'SPTO001', 'Vietnam', 'Bàn xoay eo nhựa Thanh Xuân', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (235, 'SPTO002', 'Vietnam', 'Bàn Xoay Eo Sắt Thanh Xuân', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (236, 'SPTO003', 'Vietnam', 'Bánh tạ gang', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (237, 'SPTO004', 'Vietnam', 'Bao Đấm Star Sport', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (238, 'SPTO005', 'Vietnam', 'Bộ dây đàn hồi ngũ sắc Pseudois', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (239, 'SPTO006', 'Vietnam', 'Bộ tạ đa năng 4 in 1 loại 20Kg', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (240, 'SPTO007', 'Vietnam', 'Bộ tạ đa năng 4 in 1 loại 30kg', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (241, 'SPTO008', 'Vietnam', 'Bộ tạ đa năng 4 in 1 loại 40kg', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (242, 'SPTO009', 'Vietnam', 'Bộ xà đơn, xà kép đa năng Thiên Trường', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (243, 'SPTO010', 'Vietnam', 'Bóng đấm tập phản xạ', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (244, 'SPTO011', 'Vietnam', 'Dàn Tạ Đa Năng Xuki 2018', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (245, 'SPTO012', 'Vietnam', 'Dây kéo tay lò xo đa năng', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (246, 'SPTO013', 'Vietnam', 'Dây thừng kéo co, dây thừng trang trí', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (247, 'SPTO014', 'Vietnam', 'Dụng cụ massage hỗ trợ tập lưng và cột sống', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (248, 'SPTO015', 'Vietnam', 'Đòn tạ đặc', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (249, 'SPTO016', 'Vietnam', 'Đòn tạ tay 35cm nhập khẩu', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (250, 'SPTV001', 'Vietnam', 'Ghế đẩy tạ đơn Xuki', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (251, 'SPTV002', 'Vietnam', 'Ghế đẩy tạ xuki', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (252, 'SPTV003', 'Vietnam', 'Ghế đẩy tạ xuki có ép', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (253, 'SPTV004', 'Vietnam', 'GHẾ TẠ ĐA NĂNG BEN 502 (601502)', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (254, 'SPTV005', 'Vietnam', 'Ghế tạ đa năng Thanh Xuân', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (255, 'SPTV006', 'Vietnam', 'Ghế tập đẩy tạ đơn Ben 601401', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (256, 'SPTV007', 'Vietnam', 'Ghế tập Gym DDS-1201', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (257, 'SPTV008', 'Vietnam', 'Ghế Tập Gym Đa Năng DDS-1205', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (258, 'SPTV009', 'Vietnam', 'Ghế tập gym KK – 021D', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (259, 'SPTV010', 'Vietnam', 'Ghế tập Gym KK-022D', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (260, 'SPTV011', 'Vietnam', 'Ghế tập gym Miking PS-031', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (261, 'SPTV012', 'Vietnam', 'Ghế tập tạ đa năng Alas 770D', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (262, 'SPTV013', 'Vietnam', 'Ghế tập tạ đa năng Ben 601521', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (263, 'SPTV014', 'Vietnam', 'Ghế tập tạ đa năng MP-15', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (264, 'SPTV015', 'Vietnam', 'GHẾ TẬP TẠ ĐA NĂNG MP-16', NULL, NULL, NULL, NULL, 'Multi Color');
INSERT INTO `product_detail` VALUES (265, 'SPTV016', 'Vietnam', 'Ghế tập tạ đa năng NMS-7301', NULL, NULL, NULL, NULL, 'Multi Color');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `image_hover` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `short_description` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `amount` int NOT NULL,
  `price` decimal(11, 2) NULL DEFAULT NULL,
  `product_id` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `brand_id` int UNSIGNED NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sport_id` int NULL DEFAULT NULL,
  `entry_date` date NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id_UNIQUE`(`product_id` ASC) USING BTREE,
  INDEX `fk_products_brand`(`brand_id` ASC) USING BTREE,
  INDEX `fk_products_sport`(`sport_id` ASC) USING BTREE,
  CONSTRAINT `fk_products_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_products_sport` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Áo khoác nỉ adidas Liverpool FC Terrace Icons Nam - JW5464', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-ao-track-top-liverpool-fc-terrace-icons-mau-xanh-la-jw5464-hm1.jpg?v=1758083540923', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-94-ao-track-top-liverpool-fc-terrace-icons-mau-xanh-la-jw5464-hm30.jpg?v=1758170122590', 'Áo khoác nỉ adidas Liverpool FC Terrace Icons Nam - JW5464', 340, 2500000.00, 'QA1', 1, 'male', 16, '2025-09-15', 1, '2025-10-03 08:49:18', NULL, NULL);
INSERT INTO `products` VALUES (3, 'Áo khoác nỉ adidas Arsenal Terrace Icons Nam - JM9390', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-74-ao-track-top-arsenal-terrace-icons-jm9390-hm1.jpg?v=1758073731820', '[\"https:\\/\\/bizweb.dktcdn.net\\/thumb\\/large\\/100\\/340\\/361\\/products\\/imgi-83-ao-track-top-arsenal-terrace-icons-jm9390-hm30.jpg?v=1758170124977\"]', 'Áo khoác nỉ adidas Arsenal Terrace Icons Nam - JM9390', 290, 2500000.00, 'XA1', 1, 'male', 16, '2025-09-15', 1, '2025-10-03 08:49:20', NULL, NULL);
INSERT INTO `products` VALUES (4, 'Quần nỉ bóng đá adidas Arsenal Terrace Icons Nam - JM9389', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-90-quan-track-pant-arsenal-terrace-icons-jm9389-hm7.jpg?v=1758073404700', '[\"https:\\/\\/bizweb.dktcdn.net\\/thumb\\/large\\/100\\/340\\/361\\/products\\/imgi-93-quan-track-pant-arsenal-terrace-icons-jm9389-hm30.jpg?v=1758170125070\"]', 'Quần nỉ bóng đá adidas Arsenal Terrace Icons Nam - JM9389', 281, 2200000.00, 'QA2', 1, 'male', 16, '2025-09-15', 1, '2025-10-03 08:49:22', NULL, NULL);
INSERT INTO `products` VALUES (5, 'Giày bóng đá adidas Predator Pro Unisex - JI1181', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-giay-san-co-nhan-tao-predator-pro-trang-ji1181-06-standard.jpg?v=1758011162023', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-77-giay-san-co-nhan-tao-predator-pro-trang-ji1181-01-00-standard-hover.jpg?v=1758011162880', 'Giày bóng đá adidas Predator Pro Unisex - JI1181', 150, 2900000.00, 'QA3', 1, 'male', 16, '2025-09-15', 1, '2025-10-03 08:49:25', NULL, NULL);
INSERT INTO `products` VALUES (6, 'Quả bóng đá adidas Vòng bảng UCL League 25/26 Unisex - JP1540', 'ball', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/bong-thi-djau-vong-bang-ucl-league-mua-giai-25-26-trang-jp1540-01-00-standard.jpg?v=1756892330740', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-80-bong-thi-djau-vong-bang-ucl-league-mua-giai-25-26-trang-jp1540.jpg?v=1756883499657', 'Quả bóng đá adidas Vòng bảng UCL League 25/26 Unisex - JP1540', 200, 950000.00, 'HT1', 1, 'male', 16, '2025-09-15', 1, '2025-10-03 08:49:29', NULL, NULL);
INSERT INTO `products` VALUES (7, 'Tất bóng đá adidas Sân nhà FC Bayern 25/26 Nam - JJ2151', 'socks', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-77-djoi-tat-san-nha-fc-bayern-mua-giai-25-26-trang-jj2151-01-01-00-standard.jpg?v=1756882177257', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-78-djoi-tat-san-nha-fc-bayern-mua-giai-25-26-trang-jj2151-01-02-hover-standard.jpg?v=1756882178063', 'Tất bóng đá adidas Sân nhà FC Bayern 25/26 Nam - JJ2151', 199, 450000.00, 'QA4', 1, 'male', 16, '2025-09-15', 1, '2025-10-03 08:49:32', NULL, NULL);
INSERT INTO `products` VALUES (8, 'Tất bóng đá adidas Sân nhà Manchester United 25/26 Nam - JI7436', 'socks', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-76-djoi-tat-san-nha-manchester-united-mua-giai-25-26-djen-ji7436-01-02-hover-standard.jpg?v=1756881881100', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-78-djoi-tat-san-nha-manchester-united-mua-giai-25-26-djen-ji7436-42-detail.jpg?v=1756881881100', 'Tất bóng đá adidas Sân nhà Manchester United 25/26 Nam - JI7436', 105, 450000.00, 'HT2', 1, 'male', 16, '2025-09-15', 1, '2025-10-03 08:49:34', NULL, NULL);
INSERT INTO `products` VALUES (9, 'Áo jersey bóng đá adidas Arsenal Terrace Icons Unisex - KB6427', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-ao-djau-arsenal-terrace-icons-kb6427-hm1.jpg?v=1756372831337', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-83-ao-djau-arsenal-terrace-icons-kb6427-hm3-hover.jpg?v=1756372847217', 'Áo jersey bóng đá adidas Arsenal Terrace Icons Unisex - KB6427', 350, 1800000.00, 'HT3', 1, 'male', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (10, 'Áo jersey bóng đá adidas Thủ môn Liverpool FC 25/26 Nam - JZ4088', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-93-ao-djau-thu-mon-liverpool-fc-mua-giai-25-26-mau-xanh-la-jz4088.jpg?v=1755225359337', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-88-ao-djau-thu-mon-liverpool-fc-mua-giai-25-26-mau-xanh-la-jz4088-01-laydown.jpg?v=1755316457203', 'Áo jersey bóng đá adidas Thủ môn Liverpool FC 25/26 Nam - JZ4088', 350, 2200000.00, 'HT4', 1, 'male', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (11, 'Áo jersey bóng đá adidas Sân nhà Liverpool FC 25/26 Nam - JY4237', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-86-ao-djau-san-nha-chinh-hang-liverpool-fc-mua-giai-25-26-djo-jy4237-hm1.jpg?v=1755225706963', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-95-ao-djau-san-nha-chinh-hang-liverpool-fc-mua-giai-25-26-djo-jy4237-hm30.jpg?v=1755316457300', 'Áo jersey bóng đá adidas Sân nhà Liverpool FC 25/26 Nam - JY4237', 350, 3000000.00, 'TA1', 1, 'unisex', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (12, 'Quần short bóng đá adidas Liverpool FC Terrace Icons Nam - JW8005', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-78-quan-short-liverpool-fc-terrace-icons-djen-jw8005-21-model.jpg?v=1758006257763', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-quan-short-liverpool-fc-terrace-icons-djen-jw8005-01-laydown.jpg?v=1758170149540', 'Quần short bóng đá adidas Liverpool FC Terrace Icons Nam - JW8005', 350, 1200000.00, 'TA2', 1, 'unisex', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (13, 'Quần short bóng đá adidas Liverpool FC US Pack Nam - JW5485', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-79-quan-short-liverpool-fc-us-pack-xam-jw5485-21-model.jpg?v=1755227027437', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-quan-short-liverpool-fc-us-pack-xam-jw5485-01-laydown.jpg?v=1755316458377', 'Quần short bóng đá adidas Liverpool FC US Pack Nam - JW5485', 350, 1000000.00, 'XA2', 1, 'unisex', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (17, 'Áo hoodie bóng đá adidas Liverpool FC Z.N.E. Nam - JW5484', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-81-liverpool-fc-adidas-z-n-e-anthem-jacket-red-jw5484-21-model.jpg?v=1755227211827', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-85-liverpool-fc-adidas-z-n-e-anthem-jacket-red-jw5484-01-laydown.jpg?v=1755316458503', 'Áo hoodie bóng đá adidas Liverpool FC Z.N.E. Nam - JW5484', 350, 2300000.00, 'XA3', 1, 'unisex', 16, '2025-09-15', 1, '2025-10-01 22:59:51', NULL, NULL);
INSERT INTO `products` VALUES (18, 'Áo bóng đá adidas Liverpool FC US Pack Nam - JW5480', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-81-ao-djau-liverpool-fc-us-pack-djo-jw5480-25-model.jpg?v=1755227742890', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-ao-djau-liverpool-fc-us-pack-djo-jw5480-01-laydown.jpg?v=1755316458600', 'Áo bóng đá adidas Liverpool FC US Pack Nam - JW5480', 350, 1800000.00, 'XA4', 1, 'unisex', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (19, 'Áo jersey bóng đá adidas Liverpool FC Terrace Icons Unisex - JW5466', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-78-ao-djau-liverpool-fc-terrace-icons-trang-jw5466-hm1.jpg?v=1758006063387', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-87-ao-djau-liverpool-fc-terrace-icons-trang-jw5466-hm30.jpg?v=1758170149900', 'Áo jersey bóng đá adidas Liverpool FC Terrace Icons Unisex - JW5466', 350, 1800000.00, 'TA3', 1, 'male', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (20, 'Áo jersey bóng đá trẻ em adidas Thứ Ba Liverpool FC 25/26 Unisex - JV6468', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-81-ao-djau-thu-ba-liverpool-fc-mua-giai-25-26-danh-cho-tre-em-mau-xanh-la-jv6468-20-01-model.jpg?v=1758005827223', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-86-ao-djau-thu-ba-liverpool-fc-mua-giai-25-26-danh-cho-tre-em-mau-xanh-la-jv6468-01-laydown.jpg?v=1758170150440', 'Áo jersey bóng đá trẻ em adidas Thứ Ba Liverpool FC 25/26 Unisex - JV6468', 350, 1500000.00, 'TA4', 1, 'male', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (21, 'Bộ quần áo bóng đá trẻ em adidas Sân nhà Liverpool FC 25/26 Unisex - JV6442', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-89-bo-trang-phuc-mini-san-nha-liverpool-fc-mua-giai-25-26-danh-cho-be-djo-jv6442-20-01-model.jpg?v=1755228209113', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-94-bo-trang-phuc-mini-san-nha-liverpool-fc-mua-giai-25-26-danh-cho-be-djo-jv6442-01-laydown.jpg?v=1755316459280', 'Bộ quần áo bóng đá trẻ em adidas Sân nhà Liverpool FC 25/26 Unisex - JV6442', 350, 1500000.00, 'TA5', 1, 'male', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (22, 'Áo jersey bóng đá adidas Real Madrid 25/26 Third Nam - JV5845', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-84-real-madrid-25-26-third-jersey-blue-jv5845-21-model.jpg?v=1756869110797', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-87-real-madrid-25-26-third-jersey-blue-jv5845-01-laydown.jpg?v=1756892338167', 'Áo jersey bóng đá adidas Real Madrid 25/26 Third Nam - JV5845', 350, 2200000.00, 'TA6', 1, 'male', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (23, 'Áo jersey bóng đá trẻ em adidas Real Madrid 25/26 Third Unisex - JP3930', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-81-ao-djau-thu-ba-real-madrid-mua-giai-25-26-danh-cho-tre-em-mau-xanh-da-troi-jp3930-20-01-model.jpg?v=1756868738043', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-85-ao-djau-thu-ba-real-madrid-mua-giai-25-26-danh-cho-tre-em-mau-xanh-da-troi-jp3930-01-laydown.jpg?v=1756892339360', 'Áo jersey bóng đá trẻ em adidas Real Madrid 25/26 Third Unisex - JP3930', 350, 1500000.00, 'HT5', 1, 'male', 16, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (27, 'Giày chạy bộ adidas Runfalcon 5 Nữ - JR3092', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-86-giay-chay-bo-runfalcon-5-trang-jr3092-06-standard.jpg?v=1758075912993', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-81-giay-chay-bo-runfalcon-5-trang-jr3092-01-00-standard.jpg?v=1758075913917', 'Giày chạy bộ adidas Runfalcon 5 Nữ - JR3092', 350, 1800000.00, 'JR3092', 1, 'female', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (28, 'Giày chạy bộ adidas Ultrarun 5 Nam - JQ3811', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-87-giay-chay-bo-ultrarun-5-mau-xanh-da-troi-jq3811-hm7.jpg?v=1758075560740', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-91-giay-chay-bo-ultrarun-5-mau-xanh-da-troi-jq3811.jpg?v=1758075561643', 'Giày chạy bộ adidas Ultrarun 5 Nam - JQ3811', 350, 2200000.00, 'JQ3811', 1, 'male', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (29, 'Giày chạy bộ adidas Supernova Comfortglide Nữ - JQ1761', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-87-giay-chay-bo-supernova-comfortglide-mau-vang-jq1761-06-standard.jpg?v=1758074952030', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-giay-chay-bo-supernova-comfortglide-mau-vang-jq1761-01-00-standard.jpg?v=1758074953003', 'Giày chạy bộ adidas Supernova Comfortglide Nữ - JQ1761', 350, 2900000.00, 'JQ1761', 1, 'female', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (30, 'Giày chạy bộ adidas Runfalcon 5 Nữ - JI3389', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-88-giay-chay-bo-runfalcon-5-djo-ji3389-hm7.jpg?v=1758073120937', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-92-giay-chay-bo-runfalcon-5-djo-ji3389.jpg?v=1758073122437', 'Giày chạy bộ adidas Runfalcon 5 Nữ - JI3389', 350, 1800000.00, 'JI3389', 1, 'female', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (31, 'Giày chạy bộ adidas Adizero SL2 Nữ - JI2991', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-83-giay-adizero-sl2-hong-ji2991-06-standard.jpg?v=1758073011407', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-78-giay-adizero-sl2-hong-ji2991-01-00-standard.jpg?v=1758073012390', 'Giày chạy bộ adidas Adizero SL2 Nữ - JI2991', 350, 3000000.00, 'JI2991', 1, 'female', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (32, 'Giày chạy bộ ASICS GT-1000 14 Nam - 1011C077.400', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t103621-618.jpg?v=1757907498063', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t103542-245.jpg?v=1757907499053', 'Giày chạy bộ ASICS GT-1000 14 Nam - 1011C077.400', 350, 2944473.00, '1011C077400', 2, 'male', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (33, 'Giày chạy bộ ASICS VERSABLAST 4 Nam - 1011B984.402', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t101025-526.jpg?v=1757905906510', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t101017-703.jpg?v=1757905906510', 'Giày chạy bộ ASICS VERSABLAST 4 Nam - 1011B984.402', 350, 1864473.00, '1011B984402', 2, 'male', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (34, 'Giày chạy trail ASICS GEL-SONOMA 8 Nam - 1011B979.002', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t100438-904.jpg?v=1757905552603', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t100408-151.jpg?v=1757905552603', 'Giày chạy trail ASICS GEL-SONOMA 8 Nam - 1011B979.002', 350, 2159018.00, '1011B979002', 2, 'male', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (35, 'Giày chạy bộ 361º Nữ W682532231-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q3s20643922c99fae3e6f495cab-51d2763d-c741-42dd-83d0-2a5fb2aac50d.jpg?v=1756953332247', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q3s206444a62d67cb932a498089-d2985784-d0b1-459b-b35f-30315fea45bf.jpg?v=1756953332247', 'Giày chạy bộ 361º Nữ W682532231-1', 350, 1364727.00, 'W6825322311', 6, 'female', 11, '2025-09-15', 1, '2025-09-23 22:33:08', NULL, NULL);
INSERT INTO `products` VALUES (100, 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.101', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-06-16t114107-754.jpg?v=1750153665010', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-06-16t114100-743.jpg?v=1750387998173', 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.101', 350, 4515382.00, 'ASICS', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:01:53', NULL, NULL);
INSERT INTO `products` VALUES (103, 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.400', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/asics-75.jpg?v=1752115037370', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/asics-73.jpg?v=1752115038313', 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.400', 350, 4515382.00, 'ASICS4', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (104, 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.002', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-08-12t140633-328.jpg?v=1754982541257', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-08-12t140706-858.jpg?v=1754982541257', 'Giày chạy bộ ASICS GEL-KAYANO 32 Nam - 1011C052.002', 350, 4515382.00, 'ASICS5', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (105, 'Áo gió chạy bộ ASICS ROAD LITE-SHOW PACKABLE Nam - 2011D358.001', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t154153-342.jpg?v=1757925819790', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t154200-520.jpg?v=1757925820553', 'Áo gió chạy bộ ASICS ROAD LITE-SHOW PACKABLE Nam - 2011D358.001', 350, 2404473.00, 'ASICS6', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (106, 'Áo T-shirt chạy bộ ASICS ROAD LITE-SHOW Nam - 2011D357.001', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t155029-437.jpg?v=1757926314863', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t155036-958.jpg?v=1757926316210', 'Áo T-shirt chạy bộ ASICS ROAD LITE-SHOW Nam - 2011D357.001', 350, 1079018.00, 'ASICS7', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (107, 'Chân váy tennis/pickleball ASICS MATCH Nữ - 2042A392.200', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t155408-043.jpg?v=1757926519630', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t155416-335.jpg?v=1757926520587', 'Chân váy tennis/pickleball ASICS MATCH Nữ - 2042A392.200', 350, 1422655.00, 'ASICS8', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (108, 'Áo Polo tennis/pickleball ASICS MATCH ACTIBREEZE Nam - 2041A365.400', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-09-23t134114-735.jpg?v=1758609722280', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-09-23t134121-175.jpg?v=1758609722813', 'Áo Polo tennis/pickleball ASICS MATCH ACTIBREEZE Nam - 2041A365.400', 350, 1766291.00, 'ASICS9', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (109, 'Áo T-shirt tennis/pickleball ASICS GAME ALL OVER PRINT Nam - 2041A353.400', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t155712-510.jpg?v=1757926702713', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t155720-953.jpg?v=1757926704170', 'Áo T-shirt tennis/pickleball ASICS GAME ALL OVER PRINT Nam - 2041A353.400', 350, 1275382.00, 'ASICS10', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (110, 'Quần short tennis/pickleball ASICS COURT 7IN Nam - 2041A344.400', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t160408-443.jpg?v=1757927133843', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t160425-013.jpg?v=1757927134943', 'Quần short tennis/pickleball ASICS COURT 7IN Nam - 2041A344.400', 350, 931745.00, 'ASICS11', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (111, 'Áo Polo tennis/pickleball ASICS COURT Nam - 2041A340.301', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-13t112303-895.jpg?v=1757737435120', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-13t112311-641.jpg?v=1757737435663', 'Áo Polo tennis/pickleball ASICS COURT Nam - 2041A340.301', 350, 931745.00, 'ASICS12', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (112, 'Quần short chạy trail ASICS FUJITRAIL ALL OVER PRINT 5IN Nam - 2011D392.001', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t114034-163.jpg?v=1758602881587', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t114043-425.jpg?v=1758602885457', 'Quần short chạy trail ASICS FUJITRAIL ALL OVER PRINT 5IN Nam - 2011D392.001', 350, 1079018.00, 'ASICS13', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (113, 'Áo T-shirt tennis/pickleball ASICS COURT SS Nam - 2041A339.301', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-09-23t133447-569.jpg?v=1758609339810', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-09-23t133455-668.jpg?v=1758609340343', 'Áo T-shirt tennis/pickleball ASICS COURT SS Nam - 2041A339.301', 350, 784473.00, 'ASICS14', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (114, 'Áo T-shirt tennis/pickleball ASICS MATCH ACTIBREEZE SS Nam - 2041A320.325', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-09-23t133116-954.jpg?v=1758609130983', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-09-23t133122-981.jpg?v=1758609131497', 'Áo T-shirt tennis/pickleball ASICS MATCH ACTIBREEZE SS Nam - 2041A320.325', 350, 1569927.00, 'ASICS121', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (115, 'Áo Tank Top chạy trail ASICS FUJITRAIL Nữ - 2012D324.101', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t132529-341.jpg?v=1758608812737', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t132558-241.jpg?v=1758608813277', 'Áo Tank Top chạy trail ASICS FUJITRAIL Nữ - 2012D324.101', 350, 981818.00, 'ASICS123', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (116, 'Áo T-shirt chạy trail ASICS FUJITRAIL LOGO SS Nữ - 2012D314.100', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t132007-662.jpg?v=1758608482167', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t132016-954.jpg?v=1758608482720', 'Áo T-shirt chạy trail ASICS FUJITRAIL LOGO SS Nữ - 2012D314.100', 350, 784473.00, 'ASICS213', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (117, 'Quần short chạy trail ASICS FUJITRAIL ALL OVER PRINT 5IN Nam - 2011D392.300', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t131118-177.jpg?v=1758608052187', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t131216-700.jpg?v=1758608053223', 'Quần short chạy trail ASICS FUJITRAIL ALL OVER PRINT 5IN Nam - 2011D392.300', 350, 1079018.00, 'ASICS43', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (118, 'Áo gió tập luyện ASICS NAGINO ACTIBREEZE SHORT Nữ - 2032D146.300', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t151340-793.jpg?v=1757924182033', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t151346-632.jpg?v=1757924183653', 'Áo gió tập luyện ASICS NAGINO ACTIBREEZE SHORT Nữ - 2032D146.300', 350, 2257200.00, 'ASICS342', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (119, 'Áo gió chạy trail ASICS FUJITRAIL PACKABLE WINDBREAKER Nam - 2011D389.002', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t161102-530.jpg?v=1757927684450', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t161251-513.jpg?v=1757927685037', 'Áo gió chạy trail ASICS FUJITRAIL PACKABLE WINDBREAKER Nam - 2011D389.002', 350, 2404473.00, 'ASICS432', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (120, 'Áo T-shirt tập luyện ASICS ALL OVER PRINT Nam - 2031F199.300', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t150618-182.jpg?v=1757923669490', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t150624-359.jpg?v=1757923670180', 'Áo T-shirt tập luyện ASICS ALL OVER PRINT Nam - 2031F199.300', 350, 931745.00, 'ASICS6534', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (121, 'Áo ba lỗ chạy trail ASICS FUJITRAIL SINGLET Nam - 2011D388.300', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t111554-952.jpg?v=1758601971297', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-23t111754-990.jpg?v=1758601972020', 'Áo ba lỗ chạy trail ASICS FUJITRAIL SINGLET Nam - 2011D388.300', 350, 981818.00, 'ASICS6435', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (122, 'Bó gối ASICS VBELBOWPAD GELPAD Unisex - 3053A152.002', 'other', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t152815-452.jpg?v=1757924910787', 'nan', 'Bó gối ASICS VBELBOWPAD GELPAD Unisex - 3053A152.002', 350, 391745.00, 'ASICS76', 2, 'unisex', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (123, 'Bó gối ASICS VBELBOWPAD GELPAD Unisex - 3053A152.001', 'other', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t153532-532.jpg?v=1757925351830', 'nan', 'Bó gối ASICS VBELBOWPAD GELPAD Unisex - 3053A152.001', 350, 391745.00, 'ASICS5645', 2, 'unisex', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (124, 'Mũ lưỡi trai chạy bộ ASICS RUNNING LIGHT WOVEN Unisex - 3013B124.020', 'other', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t152032-724.jpg?v=1757924521130', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t152049-181.jpg?v=1757924521933', 'Mũ lưỡi trai chạy bộ ASICS RUNNING LIGHT WOVEN Unisex - 3013B124.020', 350, 637200.00, 'ASICS6345', 2, 'unisex', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (125, 'Áo T-shirt tập luyện ASICS ALL OVER PRINT Nam - 2031F199.020', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t150031-431.jpg?v=1757923354847', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t150037-210.jpg?v=1757923355673', 'Áo T-shirt tập luyện ASICS ALL OVER PRINT Nam - 2031F199.020', 350, 931745.00, 'ASIC453S', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (126, 'Áo T-shirt tập luyện ASICS ACTIBREEZE PANEL JACQUARD Nam - 2031F123.001', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t145021-488.jpg?v=1757922700527', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t145029-988.jpg?v=1757922701063', 'Áo T-shirt tập luyện ASICS ACTIBREEZE PANEL JACQUARD Nam - 2031F123.001', 350, 1422655.00, 'AS34534ICS', 2, 'male', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (127, 'Áo T-shirt tennis/pickleball ASICS GAME ALL OVER PRINT Nữ - 2042A385.100', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t144453-440.jpg?v=1757922453970', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t144500-401.jpg?v=1757922454797', 'Áo T-shirt tennis/pickleball ASICS GAME ALL OVER PRINT Nữ - 2042A385.100', 350, 1275382.00, 'AS34ICS', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (128, 'Áo Tank Top tennis/pickleball ASICS PADEL COURT Nữ - 2042A383.001', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t144117-096.jpg?v=1757922136347', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t144124-135.jpg?v=1757922137187', 'Áo Tank Top tennis/pickleball ASICS PADEL COURT Nữ - 2042A383.001', 350, 784473.00, 'ASI654S', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (129, 'Chân váy tennis/pickleball ASICS PADEL COURT Nữ - 2042A381.002', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t143622-463.jpg?v=1757921880407', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t143628-895.jpg?v=1757921881300', 'Chân váy tennis/pickleball ASICS PADEL COURT Nữ - 2042A381.002', 350, 981818.00, 'ASIC4534S', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (130, 'Áo Tank Top tennis/pickleball ASICS COURT Nữ - 2042A370.702', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t141254-663.jpg?v=1758783121847', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t141248-204.jpg?v=1758783126710', 'Áo Tank Top tennis/pickleball ASICS COURT Nữ - 2042A370.702', 350, 715745.00, 'ASI756CS', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (131, 'Áo Tank Top tennis/pickleball ASICS COURT Nữ - 2042A370.400', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t140900-129.jpg?v=1757920198730', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/them-tieu-de-2025-09-15t140906-027.jpg?v=1757920199477', 'Áo Tank Top tennis/pickleball ASICS COURT Nữ - 2042A370.400', 350, 715745.00, 'ASICS100', 2, 'female', 11, '2025-10-02', 1, '2025-10-02 01:16:53', NULL, NULL);
INSERT INTO `products` VALUES (132, 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-015', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/air-zoom-pegasus-41-8cc319df-ffed-4805-b568-1a22de8dd49c.jpg?v=1757986312963', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/air-zoom-pegasus-41-2-23f972aa-66d7-476b-8d0a-363f5350751c.jpg?v=1757986314150', 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-015', 100, 3890000.00, 'NK001', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (133, 'Giày chạy bộ trẻ em Nike Uplift Sc (Gs) IF1749-100', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-uplift-sc-gs.jpg?v=1757987281033', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-uplift-sc-gs-2.jpg?v=1757987426477', 'Giày chạy bộ trẻ em Nike Uplift Sc (Gs) IF1749-100', 100, 1511000.00, 'NK002', 3, 'unisex', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (134, 'Giày thời trang Nike Terra Manta Nam HQ4502-100', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-terra-manta.jpg?v=1757988238863', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-terra-manta-2.jpg?v=1757988239533', 'Giày thời trang Nike Terra Manta Nam HQ4502-100', 100, 2699000.00, 'NK003', 3, 'male', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (135, 'Giày thời trang Nike Killshot 2 Ltr Prm Nam HQ1657-004', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/killshot-2-ltr-prm.jpg?v=1757988370487', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/killshot-2-ltr-prm-2.jpg?v=1757988449207', 'Giày thời trang Nike Killshot 2 Ltr Prm Nam HQ1657-004', 100, 3327400.00, 'NK004', 3, 'male', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (136, 'Giày thời trang Nike W Pacific Nữ HM4771-603', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/2ef7e6a1-25d6-4dfb-9c67-1ae53c19a4d8.jpg?v=1757988583777', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/2e3125b7-f1b1-4750-b733-da7ed1799f38.jpg?v=1757988584867', 'Giày thời trang Nike W Pacific Nữ HM4771-603', 100, 2365200.00, 'NK005', 3, 'female', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (137, 'Giày thời trang Nike Court Shot Nam FQ8146-112', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/court-shot.jpg?v=1757988851430', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/court-shot-2.jpg?v=1757988864023', 'Giày thời trang Nike Court Shot Nam FQ8146-112', 100, 2365200.00, 'NK006', 3, 'male', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (138, 'Giày chạy bộ Nike Air Winflo 11 Nữ FJ9510-109', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-nike-air-winflo-11-a35bbabc-d598-4999-99c7-6351b1885c20.jpg?v=1757989606900', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-nike-air-winflo-11-2-e6921b2f-9086-48a8-87a0-fd0f0ceeb04d.jpg?v=1757989607847', 'Giày chạy bộ Nike Air Winflo 11 Nữ FJ9510-109', 100, 3170300.00, 'NK007', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (139, 'Giày chạy bộ Nike Downshifter 13 Nam FD6454-107', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-downshifter-13-cb4adb65-14fc-4f22-bbab-140f63373371.jpg?v=1757989740150', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-downshifter-13-2-3793eeb9-ed07-4f1f-8efe-183ec07c104b.jpg?v=1757989740150', 'Giày chạy bộ Nike Downshifter 13 Nam FD6454-107', 100, 2227700.00, 'NK008', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (140, 'Giày chạy bộ Nike W Air Zoom Pegasus 41 Nữ FD2723-114', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-air-zoom-pegasus-41-8-69bd548c-9261-4554-b2ef-1e1ef169dd05.jpg?v=1757991524457', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-air-zoom-pegasus-41-10.jpg?v=1757991536543', 'Giày chạy bộ Nike W Air Zoom Pegasus 41 Nữ FD2723-114', 100, 3890000.00, 'NK009', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (141, 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-115', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/air-zoom-pegasus-41-10-52af43a5-a26f-44de-86c5-2532ed3d3ad5.jpg?v=1757991759167', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/air-zoom-pegasus-41-12-0f1646fd-d119-4862-92be-c878fee1eb46.jpg?v=1757991772990', 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-115', 100, 3890000.00, 'NK010', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (142, 'Giày thời trang Nike Wmns Air Max 90 Nữ DH8010-100', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-air-max-90.jpg?v=1757992154363', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-air-max-90-2.jpg?v=1757992154363', 'Giày thời trang Nike Wmns Air Max 90 Nữ DH8010-100', 100, 3798700.00, 'NK011', 3, 'female', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (143, 'Balo thể thao Nike HERITAGE BKPK Unisex DC4244-010', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nk-heritage-bkpk.jpg?v=1754558108727', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nk-heritage-bkpk-1.jpg?v=1755074365873', 'Balo thể thao Nike HERITAGE BKPK Unisex DC4244-010', 100, 921900.00, 'NK012', 3, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (144, 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-001', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-downshifter-13-18621dcf-f0dd-4518-b110-ff3ea2725839.jpg?v=1754465360390', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-downshifter-13-2-675f7ee5-4788-4b9e-b156-fefcf69d4088.jpg?v=1754629098317', 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-001', 100, 2227700.00, 'NK013', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (145, 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-101', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/3c6a577e-0c5a-416b-9fc5-0e03a45ca90e.jpg?v=1754465502087', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/676559b2-ca5c-453a-82e0-40c52a48ff2e.jpg?v=1754629098390', 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-101', 100, 2227700.00, 'NK014', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (146, 'Giày thời trang trẻ em Nike Terra Manta (Gs) HV9702-101', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/terra-manta-gs.jpg?v=1754465673190', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/terra-manta-gs-2.jpg?v=1754629098487', 'Giày thời trang trẻ em Nike Terra Manta (Gs) HV9702-101', 100, 1923400.00, 'NK015', 3, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (147, 'Giày thời trang Nike Uplift Sc Nam IB2765-100', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-uplift-sc.jpg?v=1754465830993', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-uplift-sc-2.jpg?v=1754629098557', 'Giày thời trang Nike Uplift Sc Nam IB2765-100', 100, 2060800.00, 'NK016', 3, 'male', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (148, 'Giày thời trang Nike Initiator Nam 394055-001', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-initiator-df568f77-350d-4951-8cee-f0518b2ece05.jpg?v=1754465999307', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-initiator-2-2301291a-0158-4b7e-8696-ecb088dfce25.jpg?v=1754629098640', 'Giày thời trang Nike Initiator Nam 394055-001', 100, 2699000.00, 'NK017', 3, 'male', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (149, 'Giày thời trang Nike Court Legacy NN Nữ DH3161-112', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-nike-court-legacy-nn.jpg?v=1754466363340', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-nike-court-legacy-nn-2.jpg?v=1754629098720', 'Giày thời trang Nike Court Legacy NN Nữ DH3161-112', 100, 2227700.00, 'NK018', 3, 'female', 17, '2025-10-01', 1, '2025-10-02 10:02:56', NULL, NULL);
INSERT INTO `products` VALUES (150, 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-106', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-downshifter-13-4-1577491c-4055-4193-b27b-348407afdf0b.jpg?v=1754466490127', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-downshifter-13-10.jpg?v=1754629098797', 'Giày chạy bộ Nike Downshifter 13 Nữ FD6476-106', 100, 2227700.00, 'NK019', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (151, 'Giày chạy bộ Nike Air Winflo 11 Nữ FJ9510-108', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-nike-air-winflo-11.jpg?v=1754466681377', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/wmns-nike-air-winflo-11-2.jpg?v=1754629098890', 'Giày chạy bộ Nike Air Winflo 11 Nữ FJ9510-108', 100, 3170300.00, 'NK020', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (152, 'Giày chạy bộ Nike VOMERO 18 Nam HM6803-101', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-vomero-18.jpg?v=1757485507790', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/3.jpg?v=1757485507790', 'Giày chạy bộ Nike VOMERO 18 Nam HM6803-101', 100, 4259000.00, 'NK021', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (153, 'Giày chạy bộ Nike Revolution 8 Nam HJ9198-101', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-revolution-8.jpg?v=1752560984117', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-revolution-8-2.jpg?v=1752641773123', 'Giày chạy bộ Nike Revolution 8 Nam HJ9198-101', 100, 2060800.00, 'NK022', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (154, 'Giày chạy bộ Nike Revolution 8 Nam HJ9198-003', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-revolution-8-8.jpg?v=1752561348707', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-revolution-8-10.jpg?v=1752641773207', 'Giày chạy bộ Nike Revolution 8 Nam HJ9198-003', 100, 2060800.00, 'NK023', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (155, 'Giày chạy bộ Nike Revolution 8 Nữ HJ8485-100', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-revolution-8.jpg?v=1752561578123', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-revolution-8-2.jpg?v=1752641773330', 'Giày chạy bộ Nike Revolution 8 Nữ HJ8485-100', 100, 2060800.00, 'NK024', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (156, 'Giày chạy bộ Nike Air Zoom Rival Fly 4 Nam FV6040-001', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-air-zoom-rival-fly-4.jpg?v=1752561768210', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-air-zoom-rival-fly-4-2.jpg?v=1752641773440', 'Giày chạy bộ Nike Air Zoom Rival Fly 4 Nam FV6040-001', 100, 3170300.00, 'NK025', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (157, 'Giày chạy bộ Nike Journey Run Nam FN0228-104', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-journey-run.jpg?v=1752562006847', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-journey-run-2.jpg?v=1752641773530', 'Giày chạy bộ Nike Journey Run Nam FN0228-104', 100, 2865900.00, 'NK026', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (158, 'Giày chạy bộ Nike Journey Run Nữ FJ7765-113', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-journey-run.jpg?v=1752562213547', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w-nike-journey-run-2.jpg?v=1752641773607', 'Giày chạy bộ Nike Journey Run Nữ FJ7765-113', 100, 2865900.00, 'NK027', 3, 'female', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (159, 'Giày chạy bộ Nike Downshifter 13 Nam FD6454-010', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-downshifter-13.jpg?v=1752562435233', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-downshifter-13-2.jpg?v=1752641773677', 'Giày chạy bộ Nike Downshifter 13 Nam FD6454-010', 100, 2227700.00, 'NK028', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (160, 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-014', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/air-zoom-pegasus-41-10.jpg?v=1752562707487', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/air-zoom-pegasus-41-12.jpg?v=1752641773753', 'Giày chạy bộ Nike Air Zoom Pegasus 41 Nam FD2722-014', 100, 3890000.00, 'NK029', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (161, 'Giày chạy bộ Nike VOMERO 18 Nam HM6803-100', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-vomero-18-10.jpg?v=1752562950907', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/1-b48c9275-7c8c-4aeb-9d6d-2ac993266d82.jpg?v=1753950515937', 'Giày chạy bộ Nike VOMERO 18 Nam HM6803-100', 100, 4259000.00, 'NK030', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (162, 'Giày chạy bộ Nike Air Winflo 11 Nam FJ9509-002', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-air-winflo-11.jpg?v=1752563151427', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-air-winflo-11-2.jpg?v=1752641773937', 'Giày chạy bộ Nike Air Winflo 11 Nam FJ9509-002', 100, 3170300.00, 'NK031', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (163, 'Giày chạy bộ Nike Quest 6 Nam FD6033-107', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-quest-6-7.jpg?v=1752563394193', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/nike-quest-6-1.jpg?v=1752641774023', 'Giày chạy bộ Nike Quest 6 Nam FD6033-107', 100, 2532100.00, 'NK032', 3, 'male', 11, '2025-10-01', 1, '2025-10-02 01:41:34', NULL, NULL);
INSERT INTO `products` VALUES (164, 'Giày thể thao le coq sportif nam L241MCNS0120-AAD', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/5cca4a4bce411d66be426192593911.jpg?v=1757128037820', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/98a9ec4db10427f16a605e1524c93c.jpg?v=1757128037820', 'Giày thể thao le coq sportif nam L241MCNS0120-AAD', 100, 1711309.00, 'LQ001', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (165, 'Áo khoác nỉ le coq golf nam QGMXJL60V-BG00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em0082946l787571a161ca40.jpg?v=1757128037977', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em0082945l23b7d08783da47.jpg?v=1757128037977', 'Áo khoác nỉ le coq golf nam QGMXJL60V-BG00', 100, 2398582.00, 'LQ002', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (166, 'Áo khoác nỉ le coq golf nam QGMXJL53V-WH00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em00850323l1cd811066e904.jpg?v=1757128038047', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em00850318l1d62565bb5474.jpg?v=1757128038047', 'Áo khoác nỉ le coq golf nam QGMXJL53V-WH00', 100, 1711309.00, 'LQ003', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (167, 'Áo khoác gió le coq sportif Nam LT5SJG10MV-BK00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1452em0267614lcb3c9037fa504b.jpg?v=1757128038127', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1452em02675916l957c0bdb61dd4.jpg?v=1757128038127', 'Áo khoác gió le coq sportif Nam LT5SJG10MV-BK00', 100, 1757455.00, 'LQ004', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (168, 'Áo polo dài tay le coq golf Nam GP321MTL93-BLCK', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/gp321mtl93blckl1b59e017e53ea49.jpg?v=1757128038217', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/gp321mtl93blckl220b805eb742446.jpg?v=1757128038217', 'Áo polo dài tay le coq golf Nam GP321MTL93-BLCK', 100, 2641091.00, 'LQ005', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (169, 'Áo khoác gió le coq golf Nam LG4FWB05MV-BK00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/1000000010087746061020475c45f3.jpg?v=1757128038297', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/lg4fwb05m089bfb70e0539343499ee.jpg?v=1757128038297', 'Áo khoác gió le coq golf Nam LG4FWB05MV-BK00', 100, 3132000.00, 'LQ006', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (170, 'Quần Short nam le coq golf QGMXJD51V-NV00', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/qgmxjd51vnv00ll2291d02ef7bbf40.jpg?v=1757040218820', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/qgmxjd51vnv00ll1c680ec83856b4c.jpg?v=1756893483900', 'Quần Short nam le coq golf QGMXJD51V-NV00', 100, 1075091.00, 'LQ007', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (171, 'Áo khoác nỉ le coq golf nam QGMXJL53V-GR00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em0085038l1a8ba3ff58694e.jpg?v=1757128038450', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em0085032ldf202c8585e241.jpg?v=1757128038450', 'Áo khoác nỉ le coq golf nam QGMXJL53V-GR00', 100, 1711309.00, 'LQ008', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (172, 'Áo khoác nỉ le coq golf nam QGMXJL53V-NV00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em00850316l63d0dd077e004.jpg?v=1757128038553', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em00850317l73de149848c94.jpg?v=1757128038553', 'Áo khoác nỉ le coq golf nam QGMXJL53V-NV00', 100, 1711309.00, 'LQ009', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (173, 'Áo khoác gió le coq golf nam QGMXJK01V-GY00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em0086261l83c09cd98d4643.jpg?v=1757128038640', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em00862610le3d1a3a9c2854.jpg?v=1757128038640', 'Áo khoác gió le coq golf nam QGMXJK01V-GY00', 100, 1642582.00, 'LQ010', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (174, 'Áo khoác gió le coq golf nam QGMXJK01V-NV00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em00862819l4f35256967bd4.jpg?v=1757128038723', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/le1872em0086281l18a4827df49c43.jpg?v=1757128038723', 'Áo khoác gió le coq golf nam QGMXJK01V-NV00', 100, 1642582.00, 'LQ011', 4, 'male', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (175, 'Quần lót le coq golf Nữ QGWXJM50V-BK00', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc028502005c01ad1984916bc6045.jpg?v=1756526638240', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02857f7d4239a52be4f79a9eb75.jpg?v=1756526638240', 'Quần lót le coq golf Nữ QGWXJM50V-BK00', 100, 559636.00, 'LQ012', 4, 'female', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (176, 'Quần lót le coq golf Nữ QGWXJM50V-GY00', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02835b9c49016044c46ae9a559b.jpg?v=1756526638287', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc0284316d675ac3ee34f9f81a67a.jpg?v=1756526638287', 'Quần lót le coq golf Nữ QGWXJM50V-GY00', 100, 559636.00, 'LQ013', 4, 'female', 14, '2025-10-01', 1, '2025-10-02 01:46:36', NULL, NULL);
INSERT INTO `products` VALUES (177, 'Quần short le coq sportif Nam LN5FHP20MV-WR00', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc028146cbb118d0f57477d854fa2.jpg?v=1756526638347', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02830594f03fe30fd4bc2b84352.jpg?v=1756526638347', 'Quần short le coq sportif Nam LN5FHP20MV-WR00', 100, 1364727.00, 'LQ014', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (178, 'Quần short le coq sportif Nam LN5FHP20MV-WH00', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc027699a53aa8b5ea2487cab1243.jpg?v=1756526638410', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02789ac89fa927b864b5b9ef565.jpg?v=1756526638410', 'Quần short le coq sportif Nam LN5FHP20MV-WH00', 100, 1364727.00, 'LQ015', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (179, 'Quần short le coq sportif Nam LN5FHP20MV-NV00', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02798ef6f2a8df86b437e8b72ba.jpg?v=1756526638517', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc0280938331f966c424170b58698.jpg?v=1756526638517', 'Quần short le coq sportif Nam LN5FHP20MV-NV00', 100, 1364727.00, 'LQ016', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (180, 'Chân váy le coq sportif Nữ QQ322OSK72-PPP0', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02917f56ed79d225a4a0db61b23.jpg?v=1756526638667', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc029259dcadd1167c340dca92c07.jpg?v=1756526638667', 'Chân váy le coq sportif Nữ QQ322OSK72-PPP0', 100, 1855636.00, 'LQ017', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (181, 'Chân váy le coq sportif Nữ QQ322OSK72-BLK0', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02934e8a758f960c24554a22eb7.jpg?v=1756526638720', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc0294378b71aca44a14de8be8b86.jpg?v=1756526638720', 'Chân váy le coq sportif Nữ QQ322OSK72-BLK0', 100, 1855636.00, 'LQ018', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (182, 'Chân váy le coq sportif Nữ LN5FSK20LV-WR00', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02900b7bbf65460714afa8a3a79.jpg?v=1756526638793', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02908a02af9e1ecd6418c9430c9.jpg?v=1756526638793', 'Chân váy le coq sportif Nữ LN5FSK20LV-WR00', 100, 1364727.00, 'LQ019', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (183, 'Chân váy le coq sportif Nữ LN5FSK20LV-WH00', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02880262988b8303d4938aa0ea2.jpg?v=1756526638863', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02889c0cf9c0c2884411fa0bdbf.jpg?v=1756526638863', 'Chân váy le coq sportif Nữ LN5FSK20LV-WH00', 100, 1364727.00, 'LQ020', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (184, 'Chân váy le coq sportif Nữ LN5FSK20LV-NV00', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02862fc3f2c6e677c4821916e91.jpg?v=1756526638927', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc028711607f96a676548fab5be50.jpg?v=1756526638927', 'Chân váy le coq sportif Nữ LN5FSK20LV-NV00', 100, 1364727.00, 'LQ021', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:30', NULL, NULL);
INSERT INTO `products` VALUES (185, 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-WR00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc029504112f8eb17d94ce5958c05.jpg?v=1756526639003', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02960284281c81e32456998ee86.jpg?v=1756526639003', 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-WR00', 100, 1364727.00, 'LQ022', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (186, 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-WH00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc0298020cc057ca7ab84dc8bab13.jpg?v=1756526639107', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc0298044fec6d8cff474a1b88d22.jpg?v=1756526639107', 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-WH00', 100, 1364727.00, 'LQ023', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (187, 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-NV00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02968c47952bfff1a4265ad12d4.jpg?v=1756526639190', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc0296435e6af89e73749b48566c2.jpg?v=1756526639190', 'Áo T-shirt le coq sportif Nữ LN5FHT21LV-NV00', 100, 1364727.00, 'LQ024', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (188, 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-WR00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc03018ed5aa581c38d449bb03c7a.jpg?v=1756526639263', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc030169d4faa1affdb4511a3840d.jpg?v=1756526639263', 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-WR00', 100, 1266545.00, 'LQ025', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (189, 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-WH00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc03007c754ca5b013243c9911fd5.jpg?v=1756526639337', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc03013634afa1e0f7141fc9941ba.jpg?v=1756526639337', 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-WH00', 100, 1266545.00, 'LQ026', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (190, 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-NV00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02997165025a9de6740ddaffa22.jpg?v=1756526639403', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc02995518c9e2ec3b44b8093e382.jpg?v=1756526639403', 'Áo T-shirt le coq sportif Nữ LN5FHT20LV-NV00', 100, 1266545.00, 'LQ027', 4, 'female', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (191, 'Áo T-shirt le coq sportif Nam LT5FHT02MV-WH00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/lt5fht02mvwh00330a35f6d32bb4a2.jpg?v=1756526639463', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/lt5fht02mvwh002f0fbcdf494704ff.jpg?v=1756526639463', 'Áo T-shirt le coq sportif Nam LT5FHT02MV-WH00', 100, 1561091.00, 'LQ028', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (192, 'Áo T-shirt le coq sportif Nam LT5FHT02MV-BK00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/lt5fht02mvbk002257004e8dc3640c.jpg?v=1756526639533', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/lt5fht02mvbk00623561a9d10b143e.jpg?v=1756526639533', 'Áo T-shirt le coq sportif Nam LT5FHT02MV-BK00', 100, 1561091.00, 'LQ029', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (193, 'Áo T-shirt le coq sportif Nam LN5FHT21MV-WH00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/ln5fht21mvwh0023cdd78078fe2498.jpg?v=1756526639597', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/ln5fht21mvwh007fc4a976a1337453.jpg?v=1756526639597', 'Áo T-shirt le coq sportif Nam LN5FHT21MV-WH00', 100, 1364727.00, 'LQ030', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (194, 'Áo T-shirt le coq sportif Nam LN5FHT21MV-NV00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/ln5fht21mvnv0077f5539f2ad7f4d9.jpg?v=1756526639677', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/ln5fht21mvnv0033ec1c28c670e42e.jpg?v=1756526639677', 'Áo T-shirt le coq sportif Nam LN5FHT21MV-NV00', 100, 1364727.00, 'LQ031', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (195, 'Áo T-shirt le coq sportif Nam LN5FHT20MV-WR00', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/ln5fht20mvwr003561bb7339cf54e4.jpg?v=1756526639747', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/ln5fht20mvwr002c7fd69b9cb9e4a2.jpg?v=1756526639747', 'Áo T-shirt le coq sportif Nam LN5FHT20MV-WR00', 100, 1561091.00, 'LQ032', 4, 'male', 17, '2025-10-01', 1, '2025-10-02 10:03:31', NULL, NULL);
INSERT INTO `products` VALUES (196, 'Giày cầu lông chuyên nghiệp Li-Ning Nam P-AYZU021-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-17-c28c51fd3079aa7826395cb7c58919c29a79113cbed28f78a416962bc33ef066b38624078f777ed3.jpg?v=1759212817040', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-18-12f2a9699801a8224b19575e38b3490f893ac4a6e7578d0a02d021da2ba003b0b38624078f777ed3.jpg?v=1759212817827', 'Giày cầu lông chuyên nghiệp Li-Ning Nam P-AYZU021-1', 100, 2258182.00, 'LIN001', 5, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:04:54', NULL, NULL);
INSERT INTO `products` VALUES (197, 'Giày cầu lông chuyên nghiệp Li-Ning Nữ P-AYZU019-2', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-80-5c4dd46c02cda01556044b252a5daeb5c3abb45db9882a318ad148a898e1cf2bb38624078f777ed3.jpg?v=1759213094390', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-18-a67c4beade0d9686912d6e89be8e1a30d277103dd724e7f3c87318266be6c5acb38624078f777ed3.jpg?v=1759213095303', 'Giày cầu lông chuyên nghiệp Li-Ning Nữ P-AYZU019-2', 100, 2209091.00, 'LIN002', 5, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (198, 'Giày cầu lông Li-Ning Thunder Nữ P-AYZU015-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-30-b58a001bd1fdf8955cd45ba75c7054867213c96dd65dbb9505baacf4a3805f81b38624078f777ed3.jpg?v=1759213327370', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-18-eb093d4c0ec0ca2fb500afaa4e2f33e3eb3cf9fe6a94b23d564278afaecaedf2b38624078f777ed3.jpg?v=1759213328240', 'Giày cầu lông Li-Ning Thunder Nữ P-AYZU015-1', 100, 2454545.00, 'LIN003', 5, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (199, 'Giày cầu lông Li-Ning Hunting Nữ P-AYZT009-2', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-2-giay-cau-long-lining-ayzt009-2-hong-noi-dia-trung-1727221743.jpg?v=1759214285983', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-3-giay-cau-long-lining-ayzt009-2-hong-noi-dia-trung-1-1727221748.jpg?v=1759214286493', 'Giày cầu lông Li-Ning Hunting Nữ P-AYZT009-2', 100, 1620000.00, 'LIN004', 5, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:04:54', NULL, NULL);
INSERT INTO `products` VALUES (200, 'Giày cầu lông Li-Ning Hunting Nữ P-AYZT009-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-34.png?v=1759215729720', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/thiet-ke-chua-co-ten-2025-09-30t135741-279.jpg?v=1759215730240', 'Giày cầu lông Li-Ning Hunting Nữ P-AYZT009-1', 100, 1620000.00, 'LIN005', 5, 'unisex', 13, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (201, 'Giày cầu lông Li-Ning Blade LITE Nam P-AYZT005-3', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-15-7d3305b3afd38fcc3ff9e5386e7b684c791864615a51637ec753f2dd7b424c3ab38624078f777ed3.jpg?v=1759216280680', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-16-9bd0bdc0a2c6e414acd4e73ca0b98819474f1ae48a87a36ad79aa3e87b9f4d7bb38624078f777ed3.jpg?v=1759216281627', 'Giày cầu lông Li-Ning Blade LITE Nam P-AYZT005-3', 100, 1600364.00, 'LIN006', 5, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (202, 'Giày cầu lông Li-Ning Blade LITE Unisex P-AYZT005-2', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-76-60fdc6c0bf9507a1884d3979e4473f24c6e2abdae9faadb50137b1437c9b9800b38624078f777ed3.jpg?v=1759217972007', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-16-b5fe0f04ca9bcd901162e8e101df1fb84c1543e58b47ec7cd3e10d8e61b52e75b38624078f777ed3.jpg?v=1759217972960', 'Giày cầu lông Li-Ning Blade LITE Unisex P-AYZT005-2', 100, 1600364.00, 'LIN007', 5, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (203, 'Giày cầu lông Li-Ning Nam P-AYTV025-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-2-xx-00569-6f98ed47483049a3bb09b511f20b9629.jpg?v=1759218376323', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-3-xx-00576-80b1407a325947e08be28f443ac823bc.jpg?v=1759218377413', 'Giày cầu lông Li-Ning Nam P-AYTV025-1', 100, 1620000.00, 'LIN008', 5, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (204, 'Giày cầu lông Li-Ning Nam P-AYTV023-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-2-xx-00547-a4e91d07747241d89e9769f4b2c4ad76-1.jpg?v=1759287439663', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-3-xx-00549-0495a8bd6ca340fca99528650f8d0b35.jpg?v=1759287440863', 'Giày cầu lông Li-Ning Nam P-AYTV023-1', 100, 1600364.00, 'LIN009', 5, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (205, 'Giày cầu lông Li-Ning Nam P-AYTV015-3', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-72-4a96f1f2d283bbe7ae8220eec9c4a8176c336446a4f14295c9c81653bab0817cb38624078f777ed3.jpg?v=1759287001237', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-18-3bff8201b03e7db396d2c39e7274e109abf38fd95dcc50fde8d15ad67b272e53b38624078f777ed3.jpg?v=1759287002207', 'Giày cầu lông Li-Ning Nam P-AYTV015-3', 100, 1227273.00, 'LIN010', 5, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (206, 'Giày cầu lông Li-Ning Unisex P-AYTV003-3', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-83-451b96ae83ec3ad9bc131e2ad05110cbd9b9cb8206fb6e521ac850a15be9c1bbb38624078f777ed3.jpg?v=1759286752007', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-18-8f07fd0cd2991c3b086cb2f16910db36886726a61a59159210aaa285eacae6acb38624078f777ed3.jpg?v=1759286753207', 'Giày cầu lông Li-Ning Unisex P-AYTV003-3', 100, 1472727.00, 'LIN011', 5, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (207, 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-4', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-82-345849a852554b8eea6a08a748399678a9d2701a5457efb8a44e428668de215ab38624078f777ed3.jpg?v=1759286171733', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-19-84eeddb1efa6069fcf541680b44fbea9f7e763ddd4515edc326dfd498f56c6cdb38624078f777ed3.jpg?v=1759286175853', 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-4', 100, 1300909.00, 'LIN012', 5, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (208, 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-2', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-80-5b899fe7ad794381420580521fedab25f2ae84c9b46e62855444955cabf1ac03b38624078f777ed3.jpg?v=1759286425017', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-18-afb45f5ca32a379a3c28525b026c04a8ff4f7ee072d1b9cfeafa4eab5d7dfa20b38624078f777ed3.jpg?v=1759286428023', 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-2', 100, 1300909.00, 'LIN013', 5, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (209, 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-81-4cfd17c35daf89745ef76924504e3fa05b34083a3e47a75d8c802f569aed30e5b38624078f777ed3.jpg?v=1759286043003', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-74-46331a4180a28ac7c2034756191404b99bbb92a4486ebbd7c63b6c056fde5374b38624078f777ed3.jpg?v=1759286048133', 'Giày cầu lông Li-Ning Swift LITE Unisex P-AYTU025-1', 100, 1300909.00, 'LIN014', 5, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (210, 'Giày cầu lông Li-Ning Unisex P-AYTU001-9', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-75-abffdbd193dfdb68d69c72427d93e1f6f3c9b621b2aea3661715badbc4b2e667b38624078f777ed3.jpg?v=1759285747617', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-16-57c8aa6ad10ecefaa88542bf76f4b042bfce9c011889bd79258af6c4b0d8b4fdb38624078f777ed3.jpg?v=1759285748633', 'Giày cầu lông Li-Ning Unisex P-AYTU001-9', 100, 1178182.00, 'LIN015', 5, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:53:49', NULL, NULL);
INSERT INTO `products` VALUES (211, 'Giày cầu lông Li-Ning Nam P-AYTT001-5', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-84-03a203ddfffe177c80b01a0bfdad561aafbcd9c85a24a730e81e913a69cb94c0b38624078f777ed3.jpg?v=1759285006113', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/cau-long-giay-1.jpg?v=1759285328910', 'Giày cầu lông Li-Ning Nam P-AYTT001-5', 100, 1178182.00, 'LIN016', 5, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:04:54', NULL, NULL);
INSERT INTO `products` VALUES (212, 'Giày cầu lông Li-Ning Thunder LITE Nam P-AYTS020-7', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-84-6c5bef4cecc84a94946a46850caecb5853080da4978313442a27c84a21270eebb38624078f777ed3.jpg?v=1759219987057', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-16-c2bff670fd4d26e0372ef4365c57e51afa2c845638a5d8244dcee63a1c22f7b2b38624078f777ed3.jpg?v=1759219988340', 'Giày cầu lông Li-Ning Thunder LITE Nam P-AYTS020-7', 100, 1129091.00, 'LIN017', 5, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:04:54', NULL, NULL);
INSERT INTO `products` VALUES (213, 'Giày cầu lông Li-Ning Nam P-AYTS016-7', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-30-0145b679fee3aaf6076f01c75af8b02aaa3b6f5f0795e99d5ff836a328f3840fb38624078f777ed3.jpg?v=1759219683180', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-20-6f802e5c0533146d43f49fea50f149ec2ecabb6fa96b1f4310cb3c865f697d38b38624078f777ed3.jpg?v=1759219690247', 'Giày cầu lông Li-Ning Nam P-AYTS016-7', 100, 1080000.00, 'LIN018', 5, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:04:54', NULL, NULL);
INSERT INTO `products` VALUES (214, 'Băng tay Li-Ning Unisex P-AHWR014-7', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-65-3ca01dc4bc3e5aee4c09b3666d7391c42a71562b0646d9b6ab19023cfe577b0db38624078f777ed3.jpg?v=1759307618067', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-16-f7b40f8dc5a4715a2d83a044a0d7ebfbfb6504ba5c21d6fd4489b9d942cf22e0b38624078f777ed3.jpg?v=1759307618937', 'Băng tay Li-Ning Unisex P-AHWR014-7', 100, 63818.00, 'LIN019', 5, 'unisex', 13, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (215, 'Băng tay Li-Ning Unisex P-AHWR010-8', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-67-d2fc425c0f2d89493a32c44fc150e88b9bc188ab069d3b349e663ea1b3642591b38624078f777ed3.jpg?v=1759307991540', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-16-a3753427c40190cc4229cfa5a8fd85b6f7aafe592f56ef869f97c5da8fecf938b38624078f777ed3.jpg?v=1759307991540', 'Băng tay Li-Ning Unisex P-AHWR010-8', 100, 58909.00, 'LIN020', 5, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (216, 'Băng tay Li-Ning Unisex P-AHWR010-7', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-15-4dc4241bab3a6c67adb44333cf2cf91daea5379a45c104c4129b2936fef18b19b38624078f777ed3.jpg?v=1759308105810', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/imgi-16-3389d1fa4a008038e391bd9220df7033873f2d1ed9308e13c82c4f9452be5f21b38624078f777ed3.jpg?v=1759308106520', 'Băng tay Li-Ning Unisex P-AHWR010-7', 100, 58909.00, 'LIN021', 5, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (217, 'Tất cổ ngắn Li-Ning Unisex P-AWSU075-3', 'socks', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/xx005954cab07ec66234ec69f892de-bae42c45-027b-4524-8315-1ca3929db4d2.jpg?v=1758786138057', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/xx0059900aeac2fc72a42ed9904906-deb94b53-78d3-4e45-b7fb-5ec3b99c90ce.jpg?v=1758786138057', 'Tất cổ ngắn Li-Ning Unisex P-AWSU075-3', 100, 98182.00, 'LIN022', 5, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:54:35', NULL, NULL);
INSERT INTO `products` VALUES (218, 'Chân váy Li-Ning Nữ ASKV140-2V', 'clothes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc08327bc312674708b4b72b07c88.jpg?v=1758786138120', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc083334bd6a85e20f94049b4050c.jpg?v=1758786138120', 'Chân váy Li-Ning Nữ ASKV140-2V', 100, 1561091.00, 'LIN023', 5, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:54:50', NULL, NULL);
INSERT INTO `products` VALUES (219, 'Quần short Li-Ning Nữ AKSV452-3V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc084725d16befe885a48aca225ff.jpg?v=1758786138210', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc08473b692240b5dd8449eaadac8.jpg?v=1758786138210', 'Quần short Li-Ning Nữ AKSV452-3V', 100, 873818.00, 'LIN024', 5, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:42:04', NULL, NULL);
INSERT INTO `products` VALUES (220, 'Quần short Li-Ning Nam AKSV459-3V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc99811e33f831ce264c53b9bce0e.jpg?v=1758786138307', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc9987c14f498ac70e4b57a269da9.jpg?v=1758786138307', 'Quần short Li-Ning Nam AKSV459-3V', 100, 873818.00, 'LIN025', 5, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (221, 'Quần nỉ Li-Ning Nữ AKLV356-3V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc0834000c621e512bd4b0aaddf5c.jpg?v=1758786138403', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc08347bb227e91c55b4c3cb38ad9.jpg?v=1758786138403', 'Quần nỉ Li-Ning Nữ AKLV356-3V', 100, 1266545.00, 'LIN026', 5, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (222, 'Quần gió Li-Ning Nam AYKV753-1V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc9942b9176b29e360454fbf2cd7f.jpg?v=1758786138497', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc9948c878a70731d84baea0ab005.jpg?v=1758786138497', 'Quần gió Li-Ning Nam AYKV753-1V', 100, 1561091.00, 'LIN027', 5, 'unisex', 11, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (223, 'Quần gió Li-Ning Nam AYKV371-2V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc9906bd8b3fe4b4c148b7b5651c0.jpg?v=1758786138580', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc9902d97c5724a8f648399a2a6cf.jpg?v=1758786138580', 'Quần gió Li-Ning Nam AYKV371-2V', 100, 1266545.00, 'LIN028', 5, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (224, 'Giày thời trang Li-Ning THE RIZZ Nam AGCV455-1V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/86e76db370ebfab5a3fa193e9658d5.jpg?v=1758786138690', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/4ebf9deb80b30aed53a2c63c6879fa.jpg?v=1758786138690', 'Giày thời trang Li-Ning THE RIZZ Nam AGCV455-1V', 100, 1953818.00, 'LIN029', 5, 'unisex', 11, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (225, 'Giày thời trang COMMON 80S Nam AGCV207-2V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3087003478e30a0c3d41dda98f9.jpg?v=1758786138830', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308701fbd1d7ea155c42f38b600.jpg?v=1758786138830', 'Giày thời trang COMMON 80S Nam AGCV207-2V', 100, 1757455.00, 'LIN030', 5, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (226, 'Áo T-shirt Li-Ning Nữ AHSV472-6V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc08244copy7780a7c149744f67a7.jpg?v=1758786138940', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc08239e07e34eb463d485c9455e7.jpg?v=1758786138940', 'Áo T-shirt Li-Ning Nữ AHSV472-6V', 100, 873818.00, 'LIN031', 5, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (227, 'Áo T-shirt Li-Ning Nữ AHSV472-1V', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30889353a875b725214740ae8fa.jpg?v=1758786139040', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/dsc082326a83de71f9524c018aaa01.jpg?v=1758786139040', 'Áo T-shirt Li-Ning Nữ AHSV472-1V', 100, 873818.00, 'LIN032', 5, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:45:43', NULL, NULL);
INSERT INTO `products` VALUES (228, 'Quần short 361º Nam W552539106-4C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309206b06a4846872a4ebca5855.jpg?v=1758763485617', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30920480182254231a4267a3ef5.jpg?v=1758763485617', 'Quần short 361º Nam W552539106-4C', 100, 972000.00, '361001', 6, 'unisex', 13, '2025-10-01', 1, '2025-10-02 02:55:07', NULL, NULL);
INSERT INTO `products` VALUES (229, 'Quần short 361º Nam W552539106-3C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3092207b2d112164e24c4e99bb9.jpg?v=1758763485727', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309223e0314e7b1246445b9789c.jpg?v=1758763485727', 'Quần short 361º Nam W552539106-3C', 100, 972000.00, '361002', 6, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:55:07', NULL, NULL);
INSERT INTO `products` VALUES (230, 'Quần nỉ 361º Nữ W562539051B-1C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309082ec37bd0867234ac1b1f50.jpg?v=1758763485827', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30908540376d90bac44b23a3381.jpg?v=1758763485827', 'Quần nỉ 361º Nữ W562539051B-1C', 100, 1168364.00, '361003', 6, 'unisex', 13, '2025-10-01', 1, '2025-10-02 02:55:07', NULL, NULL);
INSERT INTO `products` VALUES (231, 'Quần nỉ 361º Nam W552534709-2C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3091525a6cf26208864d718373f.jpg?v=1758763485927', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309151c2597b1277774cf187fd1.jpg?v=1758763485927', 'Quần nỉ 361º Nam W552534709-2C', 100, 1266545.00, '361004', 6, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:05:05', NULL, NULL);
INSERT INTO `products` VALUES (232, 'Quần gió 361º Nam W552534704-3C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3091808ed70cf72cc240a18e9d9.jpg?v=1758763486020', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309177062806996cbc438f9223b.jpg?v=1758763486020', 'Quần gió 361º Nam W552534704-3C', 100, 1168364.00, '361005', 6, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:55:07', NULL, NULL);
INSERT INTO `products` VALUES (233, 'Quần gió 361º Nam W552533708-1C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3091685d1e0603fb6043e8b28ab.jpg?v=1758763486140', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30917201d2a613ae934ef7bfd40.jpg?v=1758763486140', 'Quần gió 361º Nam W552533708-1C', 100, 1266545.00, '361006', 6, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:55:07', NULL, NULL);
INSERT INTO `products` VALUES (234, 'Quần gió 361º Nam W552533704-1C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30914465211e7237e94a9fa8e52.jpg?v=1758763486237', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309147b73b732c5353418ca1b86.jpg?v=1758763486237', 'Quần gió 361º Nam W552533704-1C', 100, 1168364.00, '361007', 6, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:55:07', NULL, NULL);
INSERT INTO `products` VALUES (235, 'Giày thời trang 361º XING RAN 4.0 Nam W572536602-6', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30864755e336a6e27e47a68f241.jpg?v=1758763486333', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308648806c3b3b985f4802bc669.jpg?v=1758763486333', 'Giày thời trang 361º XING RAN 4.0 Nam W572536602-6', 100, 1561091.00, '361008', 6, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (236, 'Giày thời trang 361º QIHANG 4.0 Nam W572536608-3', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q300093e3f371e4b6b44aff814a.jpg?v=1758763486430', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q300091ef660da5546a4b1c9cde.jpg?v=1758763486430', 'Giày thời trang 361º QIHANG 4.0 Nam W572536608-3', 100, 1266545.00, '361009', 6, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (237, 'Giày thời trang 361º QIHANG 4.0 Nam W572536608-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q300108b9090b90421e47fd8d06.jpg?v=1758763486523', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q3001060791377c0ff54efb9c60.jpg?v=1758763486523', 'Giày thời trang 361º QIHANG 4.0 Nam W572536608-1', 100, 1266545.00, '361010', 6, 'unisex', 11, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (238, 'Giày thời trang 361º Nam W672536621-3', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3087148fd75c4ee58949d3aaf3e.jpg?v=1758763486630', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308715195b0459303c48868ce81.jpg?v=1758763486630', 'Giày thời trang 361º Nam W672536621-3', 100, 972000.00, '361011', 6, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (239, 'Giày thời trang 361º Nam W672536621-2', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308652af2fbba6e86b41fa9693f.jpg?v=1758763486787', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3086535dd70e562f4d48b3a6d96.jpg?v=1758763486787', 'Giày thời trang 361º Nam W672536621-2', 100, 972000.00, '361012', 6, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (240, 'Giày chạy bộ 361º Nam W572532221-3', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q30015388c28bcb56e74cdebcc1.jpg?v=1758763486917', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q300151522fe5bef2ed46ddb92a.jpg?v=1758763486917', 'Giày chạy bộ 361º Nam W572532221-3', 100, 1561091.00, '361013', 6, 'unisex', 13, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (241, 'Giày chạy bộ 361º Funky TimeⅡ Nữ W582532209-11', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q300135acacc64fb16c41aba11f.jpg?v=1758763487023', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q300133ae700a482cb947a7be60.jpg?v=1758763487023', 'Giày chạy bộ 361º Funky TimeⅡ Nữ W582532209-11', 100, 1561091.00, '361014', 6, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (242, 'Giày chạy bộ 361º Funky TimeⅡ Nam W572532209-7', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308632cfde84238f004027ba6f3.jpg?v=1758763487150', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308633319fbc414fff4192af32b.jpg?v=1758763487150', 'Giày chạy bộ 361º Funky TimeⅡ Nam W572532209-7', 100, 1561091.00, '361015', 6, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:55:32', NULL, NULL);
INSERT INTO `products` VALUES (243, 'Áo Polo dài tay 361º Nữ W562539102-2C', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308941cfff004070c04abda58a5.jpg?v=1758763487273', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3089447fe1c36619ef4a63bf436.jpg?v=1758763487273', 'Áo Polo dài tay 361º Nữ W562539102-2C', 100, 972000.00, '361016', 6, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:52:52', NULL, NULL);
INSERT INTO `products` VALUES (244, 'Áo Polo dài tay 361º Nữ W562539102-1C', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w5625391011c1f66be65a1d1344d29.jpg?v=1758763487407', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/w5625391011c5f53a6dbab8a54d9db.jpg?v=1758763487407', 'Áo Polo dài tay 361º Nữ W562539102-1C', 100, 972000.00, '361017', 6, 'unisex', 17, '2025-10-01', 1, '2025-10-02 10:05:05', NULL, NULL);
INSERT INTO `products` VALUES (245, 'Áo nỉ có mũ 361º Nữ W562539051A-2C', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30892945aa845e8a21449696bf4.jpg?v=1758763487503', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3089323aebb579b44a40c19378f.jpg?v=1758763487503', 'Áo nỉ có mũ 361º Nữ W562539051A-2C', 100, 1364727.00, '361018', 6, 'unisex', 16, '2025-10-01', 1, '2025-10-02 02:52:52', NULL, NULL);
INSERT INTO `products` VALUES (246, 'Áo khoác nỉ có mũ 361º Nữ W562539052A-3C', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308955cf84d902649c462081a2d.jpg?v=1758763487600', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3089635a742ed0cbac4da0beb42.jpg?v=1758763487600', 'Áo khoác nỉ có mũ 361º Nữ W562539052A-3C', 100, 1462909.00, '361019', 6, 'unisex', 13, '2025-10-01', 1, '2025-10-02 02:52:31', NULL, NULL);
INSERT INTO `products` VALUES (247, 'Áo khoác nỉ có mũ 361º Nữ W562539052A-2C', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30899859bd100965894284a2f33.jpg?v=1758763487687', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30899523d9e383c8e04017a0c34.jpg?v=1758763487687', 'Áo khoác nỉ có mũ 361º Nữ W562539052A-2C', 100, 1462909.00, '361020', 6, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:52:52', NULL, NULL);
INSERT INTO `products` VALUES (248, 'Áo gió có mũ 361º Nữ W562532057A-3C', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3090059f23d2a7281a4db1a9eba.jpg?v=1758763487767', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309010af782f70f9b44d75b7dbb.jpg?v=1758763487767', 'Áo gió có mũ 361º Nữ W562532057A-3C', 100, 1462909.00, '361021', 6, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:52:52', NULL, NULL);
INSERT INTO `products` VALUES (249, 'Áo gió có mũ 361º Nữ W562532057A-2C', 'shirt', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309013783afbf18b7545aab2348.jpg?v=1758763487863', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3090123f6f6d60f7454498971ba.jpg?v=1758763487863', 'Áo gió có mũ 361º Nữ W562532057A-2C', 100, 1462909.00, '361022', 6, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:52:52', NULL, NULL);
INSERT INTO `products` VALUES (250, 'Quần nỉ 361º Nữ W562539051B-2C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309112d3efec60c29c49849c6dd.jpg?v=1758690722467', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3091159b98e0f7190d49ce907d9.jpg?v=1758690722467', 'Quần nỉ 361º Nữ W562539051B-2C', 100, 1168364.00, '361023', 6, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:55:41', NULL, NULL);
INSERT INTO `products` VALUES (251, 'Quần nỉ 361º Nữ W562534009B-1C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309121506a57feb3bc4904b7f68.jpg?v=1758690722553', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30911801deffc83f41499994ead.jpg?v=1758690722553', 'Quần nỉ 361º Nữ W562534009B-1C', 100, 1168364.00, '361024', 6, 'unisex', 11, '2025-10-01', 1, '2025-10-02 02:55:41', NULL, NULL);
INSERT INTO `products` VALUES (252, 'Quần nỉ 361º Nữ W562534006B-5C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30910829fa4f2bd5b84dceae813.jpg?v=1758690722650', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3091049c422717ac234abba8502.jpg?v=1758685577140', 'Quần nỉ 361º Nữ W562534006B-5C', 100, 1168364.00, '361025', 6, 'unisex', 10, '2025-10-01', 1, '2025-10-02 02:55:41', NULL, NULL);
INSERT INTO `products` VALUES (253, 'Quần gió 361º Nữ W562539010B-4C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30922837fd0739e6c8488da471f.jpg?v=1758690722717', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3092314a9e209d9022462e950f6.jpg?v=1758690722717', 'Quần gió 361º Nữ W562539010B-4C', 100, 1168364.00, '361026', 6, 'unisex', 14, '2025-10-01', 1, '2025-10-02 02:55:41', NULL, NULL);
INSERT INTO `products` VALUES (254, 'Quần gió 361º Nam W552533708-2C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30919719d5e6386bd6428091f64.jpg?v=1758690722790', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309201caf74c31e1414233b5ec9.jpg?v=1758690722790', 'Quần gió 361º Nam W552533708-2C', 100, 1266545.00, '361027', 6, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:55:41', NULL, NULL);
INSERT INTO `products` VALUES (255, 'Quần gió 361º Nam W552533704-2C', 'trousers', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s30916552647e2356c8419c9ee9a.jpg?v=1758690722897', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s309160d0acc655275e405b85b1f.jpg?v=1758690722897', 'Quần gió 361º Nam W552533704-2C', 100, 1168364.00, '361028', 6, 'unisex', 13, '2025-10-01', 1, '2025-10-02 02:55:41', NULL, NULL);
INSERT INTO `products` VALUES (256, 'Giày thời trang 361º QIHANG 4.0 Nữ W582536608-3', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308540327ab9a5ca3a48cc82bb6.jpg?v=1758690722977', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3085412d5b4fd227eb4ada834b7.jpg?v=1758690722977', 'Giày thời trang 361º QIHANG 4.0 Nữ W582536608-3', 100, 1266545.00, '361029', 6, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:55:51', NULL, NULL);
INSERT INTO `products` VALUES (257, 'Giày thời trang 361º Nữ W682536621-2', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308525bbce44951b2c486995d2a.jpg?v=1758690723063', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308526e89023e14816414291b1b.jpg?v=1758690723063', 'Giày thời trang 361º Nữ W682536621-2', 100, 873818.00, '361030', 6, 'unisex', 11, '2025-10-01', 1, '2025-10-02 02:55:51', NULL, NULL);
INSERT INTO `products` VALUES (258, 'Giày chạy bộ 361º Nebulae Nữ W582532215-1', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q3000621093690687a74e53ac8c.jpg?v=1758690723140', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/361q3000609ad72ef104dc4c9b9e2b.jpg?v=1758690723140', 'Giày chạy bộ 361º Nebulae Nữ W582532215-1', 100, 1462909.00, '361031', 6, 'unisex', 12, '2025-10-01', 1, '2025-10-02 02:55:51', NULL, NULL);
INSERT INTO `products` VALUES (259, 'Giày chạy bộ 361º Nebulae Nam W572532216-5', 'shoes', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s308639e9c6b65d016143618aac7.jpg?v=1758690723243', 'https://bizweb.dktcdn.net/thumb/large/100/340/361/products/q3s3086404a8d60d6fb8042bc9b788.jpg?v=1758690723243', 'Giày chạy bộ 361º Nebulae Nam W572532216-5', 100, 1462909.00, '361032', 6, 'unisex', 15, '2025-10-01', 1, '2025-10-02 02:55:51', NULL, NULL);
INSERT INTO `products` VALUES (260, 'Máy chạy bộ đa năng HQ-9800', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/HQ-9800-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/HQ-9800-300x300.jpg', 'Máy chạy bộ đa năng HQ-9800', 100, 25900000.00, 'SPO001', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (261, 'Máy chạy bộ điện AGT-109L', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/6001-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/6001-300x300.jpg', 'Máy chạy bộ điện AGT-109L', 100, 28500000.00, 'SPO002', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (262, 'Máy chạy bộ điện Aguri AGT 106ILE', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2020/07/600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2020/07/600-300x300.jpg', 'Máy chạy bộ điện Aguri AGT 106ILE', 100, 12500000.00, 'SPO003', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (263, 'Máy chạy bộ điện AGURI AGT-102LE', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2020/07/61-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2020/07/61-1-300x300.jpg', 'Máy chạy bộ điện AGURI AGT-102LE', 100, 19000000.00, 'SPO004', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (264, 'Máy chạy bộ điện AGURI AGT-104T', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2020/08/61-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2020/08/61-1-300x300.jpg', 'Máy chạy bộ điện AGURI AGT-104T', 100, 21990000.00, 'SPO005', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (265, 'MÁY CHẠY BỘ ĐIỆN DL-T4', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/M%C3%A1y-ch%E1%BA%A1y-b%E1%BB%99-DL-T4-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/M%C3%A1y-ch%E1%BA%A1y-b%E1%BB%99-DL-T4-300x300.jpg', 'MÁY CHẠY BỘ ĐIỆN DL-T4', 100, 22500000.00, 'SPO006', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (266, 'Máy chạy bộ điện đa năng HQ-V1C', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/01/Untitled-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/01/Untitled-1-300x300.jpg', 'Máy chạy bộ điện đa năng HQ-V1C', 100, 13950000.00, 'SPO007', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (267, 'Máy Chạy Bộ Điện HQ- 223', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2016/11/266x266-1.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2016/11/266x266-1.jpg', 'Máy Chạy Bộ Điện HQ- 223', 100, 14500000.00, 'SPO008', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (268, 'Máy Chạy Bộ Điện HQ- 333', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/01/may-chay-bo-dien-hq-333-01-copy-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/01/may-chay-bo-dien-hq-333-01-copy-300x300.jpg', 'Máy Chạy Bộ Điện HQ- 333', 100, 16500000.00, 'SPO009', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (269, 'Máy Chạy Bộ Điện HQ- 555', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/01/may-chay-bo-dien-hq-555-01-copy-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/01/may-chay-bo-dien-hq-555-01-copy-300x300.jpg', 'Máy Chạy Bộ Điện HQ- 555', 100, 18600000.00, 'SPO010', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (270, 'Máy Chạy Bộ Điện HQ- 9600', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/01/36a85b06f7a652ac69d0688d983d3759-copy-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/01/36a85b06f7a652ac69d0688d983d3759-copy-300x300.jpg', 'Máy Chạy Bộ Điện HQ- 9600', 100, 22000000.00, 'SPO011', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (271, 'Máy chạy bộ điện HQ-112', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/1-300x300.jpg', 'Máy chạy bộ điện HQ-112', 100, 12500000.00, 'SPO012', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (272, 'Máy chạy bộ điện HQ-222', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2020/03/May-chay-bo-dien-HQ-222-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2020/03/May-chay-bo-dien-HQ-222-300x300.jpg', 'Máy chạy bộ điện HQ-222', 100, 13000000.00, 'SPO013', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (273, 'Máy chạy bộ điện HQ-777', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2022/04/61-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2022/04/61-300x300.jpg', 'Máy chạy bộ điện HQ-777', 100, 25450000.00, 'SPO014', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (274, 'Máy chạy bộ điện Oreni RE-5', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/03/RE5-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/03/RE5-300x300.jpg', 'Máy chạy bộ điện Oreni RE-5', 100, 25000000.00, 'SPO015', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (275, 'Máy chạy bộ điện PF- 115', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/02/115D-600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/02/115D-600-300x300.jpg', 'Máy chạy bộ điện PF- 115', 100, 22000000.00, 'SPO016', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (277, 'Bàn xoay eo nhựa Thanh Xuân', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/ban-xoay-eo-nhua-thanh-xuan-2-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/ban-xoay-eo-nhua-thanh-xuan-2-300x300.jpg', 'Bàn xoay eo nhựa Thanh Xuân', 100, 180000.00, 'SPTO001', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (278, 'Bàn Xoay Eo Sắt Thanh Xuân', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/ban-xoay-eo-sat-thanh-xuan-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/ban-xoay-eo-sat-thanh-xuan-300x300.jpg', 'Bàn Xoay Eo Sắt Thanh Xuân', 100, 200000.00, 'SPTO002', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (279, 'Bánh tạ gang', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/05/600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/05/600-300x300.jpg', 'Bánh tạ gang', 100, 30000.00, 'SPTO003', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (280, 'Bao Đấm Star Sport', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/06/600x600-3-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/06/600x600-3-300x300.jpg', 'Bao Đấm Star Sport', 100, 550000.00, 'SPTO004', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (281, 'Bộ dây đàn hồi ngũ sắc Pseudois', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/11/600-5-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/11/600-5-300x300.jpg', 'Bộ dây đàn hồi ngũ sắc Pseudois', 100, 560000.00, 'SPTO005', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (282, 'Bộ tạ đa năng 4 in 1 loại 20Kg', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/600-4-in1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/600-4-in1-300x300.jpg', 'Bộ tạ đa năng 4 in 1 loại 20Kg', 100, 1950000.00, 'SPTO006', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (283, 'Bộ tạ đa năng 4 in 1 loại 30kg', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/600-4-in1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/600-4-in1-300x300.jpg', 'Bộ tạ đa năng 4 in 1 loại 30kg', 100, 2250000.00, 'SPTO007', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (284, 'Bộ tạ đa năng 4 in 1 loại 40kg', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/600-4-in1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/10/600-4-in1-300x300.jpg', 'Bộ tạ đa năng 4 in 1 loại 40kg', 100, 2500000.00, 'SPTO008', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (285, 'Bộ xà đơn, xà kép đa năng Thiên Trường', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/600-300x300.jpg', 'Bộ xà đơn, xà kép đa năng Thiên Trường', 100, 3900000.00, 'SPTO009', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (286, 'Bóng đấm tập phản xạ', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/09/fdc8a938a46b6509ca42efeb93c4bdf7-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/09/fdc8a938a46b6509ca42efeb93c4bdf7-300x300.jpg', 'Bóng đấm tập phản xạ', 100, 750000.00, 'SPTO010', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (287, 'Dàn Tạ Đa Năng Xuki 2018', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/600-11-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/600-11-300x300.jpg', 'Dàn Tạ Đa Năng Xuki 2018', 100, 2000000.00, 'SPTO011', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (288, 'Dây kéo tay lò xo đa năng', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/08/day-keo-lo-xo-da-nang-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/08/day-keo-lo-xo-da-nang-1-300x300.jpg', 'Dây kéo tay lò xo đa năng', 100, 290000.00, 'SPTO012', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (289, 'Dây thừng kéo co, dây thừng trang trí', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/day-thung-keo-co-600x600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/10/day-thung-keo-co-600x600-300x300.jpg', 'Dây thừng kéo co, dây thừng trang trí', 100, 600000.00, 'SPTO013', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (290, 'Dụng cụ massage hỗ trợ tập lưng và cột sống', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/600-2-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/600-2-300x300.jpg', 'Dụng cụ massage hỗ trợ tập lưng và cột sống', 100, 320000.00, 'SPTO014', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (291, 'Đòn tạ đặc', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/05/600-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/05/600-1-300x300.jpg', 'Đòn tạ đặc', 100, 380000.00, 'SPTO015', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (292, 'Đòn tạ tay 35cm nhập khẩu', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2023/03/600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2023/03/600-300x300.jpg', 'Đòn tạ tay 35cm nhập khẩu', 100, 200000.00, 'SPTO016', 7, 'unisex', 17, '2025-10-01', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (293, 'Ghế đẩy tạ đơn Xuki', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/600-9-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/600-9-300x300.jpg', 'Ghế đẩy tạ đơn Xuki', 100, 1500000.00, 'SPTV001', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (294, 'Ghế đẩy tạ xuki', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/08/600x600-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/08/600x600-1-300x300.jpg', 'Ghế đẩy tạ xuki', 100, 1700000.00, 'SPTV002', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (295, 'Ghế đẩy tạ xuki có ép', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/08/600x600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/08/600x600-300x300.jpg', 'Ghế đẩy tạ xuki có ép', 100, 950000.00, 'SPTV003', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (296, 'GHẾ TẠ ĐA NĂNG BEN 502 (601502)', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/09/gian_tap_ta_da_nang_ben_6015021-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/09/gian_tap_ta_da_nang_ben_6015021-300x300.jpg', 'GHẾ TẠ ĐA NĂNG BEN 502 (601502)', 100, 7500000.00, 'SPTV004', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (297, 'Ghế tạ đa năng Thanh Xuân', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/01/600x600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/01/600x600-300x300.jpg', 'Ghế tạ đa năng Thanh Xuân', 100, 2500000.00, 'SPTV005', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (298, 'Ghế tập đẩy tạ đơn Ben 601401', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/05/600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/05/600-300x300.jpg', 'Ghế tập đẩy tạ đơn Ben 601401', 100, 2000000.00, 'SPTV006', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (299, 'Ghế tập Gym DDS-1201', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/03/DDS600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/03/DDS600-300x300.jpg', 'Ghế tập Gym DDS-1201', 100, 2550000.00, 'SPTV007', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (300, 'Ghế Tập Gym Đa Năng DDS-1205', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/03/600-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/03/600-1-300x300.jpg', 'Ghế Tập Gym Đa Năng DDS-1205', 100, 3650000.00, 'SPTV008', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (301, 'Ghế tập gym KK – 021D', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/12/600-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/12/600-300x300.jpg', 'Ghế tập gym KK – 021D', 100, 2500000.00, 'SPTV009', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (302, 'Ghế tập Gym KK-022D', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2021/03/KK022D-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2021/03/KK022D-300x300.jpg', 'Ghế tập Gym KK-022D', 100, 2850000.00, 'SPTV010', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (303, 'Ghế tập gym Miking PS-031', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2020/12/Untitled-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2020/12/Untitled-1-300x300.jpg', 'Ghế tập gym Miking PS-031', 100, 2500000.00, 'SPTV011', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (304, 'Ghế tập tạ đa năng Alas 770D', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/thiet-ke-ghe-tap-ta-alas-770d-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/thiet-ke-ghe-tap-ta-alas-770d-300x300.jpg', 'Ghế tập tạ đa năng Alas 770D', 100, 4200000.00, 'SPTV012', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (305, 'Ghế tập tạ đa năng Ben 601521', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/600-4-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/11/600-4-300x300.jpg', 'Ghế tập tạ đa năng Ben 601521', 100, 4980000.00, 'SPTV013', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (306, 'Ghế tập tạ đa năng MP-15', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2017/12/600x600-2-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2017/12/600x600-2-300x300.jpg', 'Ghế tập tạ đa năng MP-15', 100, 2100000.00, 'SPTV014', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (307, 'GHẾ TẬP TẠ ĐA NĂNG MP-16', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2018/05/600-2-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2018/05/600-2-300x300.jpg', 'GHẾ TẬP TẠ ĐA NĂNG MP-16', 100, 4500000.00, 'SPTV015', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);
INSERT INTO `products` VALUES (308, 'Ghế tập tạ đa năng NMS-7301', 'equipment', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/Ghe-tap-ta-da-nang-NMS-7301-1-300x300.jpg', 'https://thethaoviet.com.vn/wp-content/uploads/2019/10/Ghe-tap-ta-da-nang-NMS-7301-1-300x300.jpg', 'Ghế tập tạ đa năng NMS-7301', 100, 4500000.00, 'SPTV016', 7, 'unisex', 17, '2025-10-02', 1, '2025-10-02 09:57:30', NULL, NULL);

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'owner', 'customer', '2025-09-29 19:18:36', '2025-09-29 19:18:36');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('3nqM4mEE9d0ruXXJzEBMseAyOmKQx7EAFWgFWN9t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTFvOTVzcXdqb1RiSU1ZRnR5OFRQc1dSd1IyVmdSSWNob3pOMlBjNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob21lcGFnZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759590865);
INSERT INTO `sessions` VALUES ('Rq3TleTuouZriCUqUu30gL177EuhL2UIVeoz9jT1', 26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidUd4bUczRHJuc0FUd2hRSEhDdUF2ZVJmVUNzM1NmUmlkMXNObjB3SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9vcmRlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUyOiJsb2dpbl9vd25lcl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1NToibG9naW5fY3VzdG9tZXJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyNjt9', 1759462714);

-- ----------------------------
-- Table structure for shipping_methods
-- ----------------------------
DROP TABLE IF EXISTS `shipping_methods`;
CREATE TABLE `shipping_methods`  (
  `method_id` int NOT NULL AUTO_INCREMENT,
  `method_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_fee` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`method_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shipping_methods
-- ----------------------------
INSERT INTO `shipping_methods` VALUES (1, 'Nhanh', 30000.00);
INSERT INTO `shipping_methods` VALUES (2, 'Hỏa tốc', 60000.00);
INSERT INTO `shipping_methods` VALUES (3, 'Tiết kiệm', 15000.00);

-- ----------------------------
-- Table structure for size_product
-- ----------------------------
DROP TABLE IF EXISTS `size_product`;
CREATE TABLE `size_product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `size_id` int NOT NULL,
  `product_id` int NOT NULL,
  `size_order` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_size_product_size`(`size_id` ASC) USING BTREE,
  INDEX `fk_size_product_product`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_size_product_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_size_product_size` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`size_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of size_product
-- ----------------------------
INSERT INTO `size_product` VALUES (1, 1, 1, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (2, 2, 1, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (3, 3, 1, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (4, 4, 1, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (5, 5, 1, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (6, 6, 1, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (7, 7, 1, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (8, 1, 2, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (9, 2, 2, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (10, 3, 2, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (11, 4, 2, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (12, 5, 2, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (13, 6, 2, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (14, 7, 2, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (15, 1, 3, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (16, 2, 3, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (17, 3, 3, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (18, 4, 3, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (19, 5, 3, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (20, 6, 3, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (21, 7, 3, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (22, 1, 4, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (23, 2, 4, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (24, 3, 4, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (25, 4, 4, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (26, 5, 4, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (27, 6, 4, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (28, 7, 4, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (29, 1, 5, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (30, 2, 5, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (31, 3, 5, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (32, 4, 5, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (33, 5, 5, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (34, 6, 5, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (35, 7, 5, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (36, 1, 6, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (37, 2, 6, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (38, 3, 6, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (39, 4, 6, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (40, 5, 6, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (41, 6, 6, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (42, 7, 6, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (43, 1, 7, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (44, 2, 7, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (45, 3, 7, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (46, 4, 7, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (47, 5, 7, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (48, 6, 7, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (49, 7, 7, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (50, 1, 8, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (51, 2, 8, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (52, 3, 8, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (53, 4, 8, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (54, 5, 8, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (55, 6, 8, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (56, 7, 8, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (57, 1, 9, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (58, 2, 9, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (59, 3, 9, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (60, 4, 9, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (61, 5, 9, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (62, 6, 9, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (63, 7, 9, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (64, 1, 10, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (65, 2, 10, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (66, 3, 10, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (67, 4, 10, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (68, 5, 10, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (69, 6, 10, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (70, 7, 10, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (71, 1, 11, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (72, 2, 11, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (73, 3, 11, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (74, 4, 11, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (75, 5, 11, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (76, 6, 11, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (77, 7, 11, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (78, 1, 12, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (79, 2, 12, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (80, 3, 12, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (81, 4, 12, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (82, 5, 12, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (83, 6, 12, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (84, 7, 12, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (85, 1, 13, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (86, 2, 13, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (87, 3, 13, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (88, 4, 13, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (89, 5, 13, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (90, 6, 13, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (91, 7, 13, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (92, 1, 14, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (93, 2, 14, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (94, 3, 14, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (95, 4, 14, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (96, 5, 14, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (97, 6, 14, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (98, 7, 14, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (99, 1, 15, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (100, 2, 15, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (101, 3, 15, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (102, 4, 15, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (103, 5, 15, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (104, 6, 15, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (105, 7, 15, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (106, 1, 16, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (107, 2, 16, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (108, 3, 16, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (109, 4, 16, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (110, 5, 16, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (111, 6, 16, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (112, 7, 16, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (113, 1, 17, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (114, 2, 17, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (115, 3, 17, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (116, 4, 17, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (117, 5, 17, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (118, 6, 17, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (119, 7, 17, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (120, 1, 18, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (121, 2, 18, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (122, 3, 18, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (123, 4, 18, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (124, 5, 18, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (125, 6, 18, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (126, 7, 18, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (127, 1, 19, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (128, 2, 19, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (129, 3, 19, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (130, 4, 19, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (131, 5, 19, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (132, 6, 19, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (133, 7, 19, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (134, 1, 20, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (135, 2, 20, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (136, 3, 20, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (137, 4, 20, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (138, 5, 20, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (139, 6, 20, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (140, 7, 20, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (141, 1, 21, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (142, 2, 21, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (143, 3, 21, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (144, 4, 21, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (145, 5, 21, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (146, 6, 21, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (147, 7, 21, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (148, 1, 22, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (149, 2, 22, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (150, 3, 22, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (151, 4, 22, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (152, 5, 22, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (153, 6, 22, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (154, 7, 22, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (155, 1, 23, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (156, 2, 23, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (157, 3, 23, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (158, 4, 23, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (159, 5, 23, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (160, 6, 23, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (161, 7, 23, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (169, 1, 25, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (170, 2, 25, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (171, 3, 25, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (172, 4, 25, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (173, 5, 25, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (174, 6, 25, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (175, 7, 25, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (176, 5, 26, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (177, 6, 26, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (178, 7, 26, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (179, 8, 26, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (180, 9, 26, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (181, 10, 26, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (182, 5, 27, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (183, 6, 27, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (184, 7, 27, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (185, 8, 27, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (186, 9, 27, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (187, 10, 27, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (188, 5, 28, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (189, 6, 28, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (190, 7, 28, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (191, 8, 28, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (192, 9, 28, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (193, 10, 28, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (194, 5, 29, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (195, 6, 29, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (196, 7, 29, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (197, 8, 29, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (198, 9, 29, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (199, 10, 29, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (200, 5, 30, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (201, 6, 30, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (202, 7, 30, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (203, 8, 30, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (204, 9, 30, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (205, 10, 30, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (206, 5, 31, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (207, 6, 31, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (208, 7, 31, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (209, 8, 31, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (210, 9, 31, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (211, 10, 31, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (212, 5, 32, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (213, 6, 32, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (214, 7, 32, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (215, 8, 32, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (216, 9, 32, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (217, 10, 32, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (218, 5, 33, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (219, 6, 33, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (220, 7, 33, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (221, 8, 33, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (222, 9, 33, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (223, 10, 33, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (224, 5, 34, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (225, 6, 34, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (226, 7, 34, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (227, 8, 34, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (228, 9, 34, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (229, 10, 34, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (230, 5, 35, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (231, 6, 35, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (232, 7, 35, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (233, 8, 35, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (234, 9, 35, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (235, 10, 35, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (243, 12, 100, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (244, 13, 100, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (245, 14, 100, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (246, 15, 100, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (248, 12, 103, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (249, 13, 103, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (250, 14, 103, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (251, 15, 103, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (252, 12, 104, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (253, 13, 104, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (254, 14, 104, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (255, 15, 104, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (256, 12, 105, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (257, 13, 105, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (258, 14, 105, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (259, 15, 105, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (260, 12, 106, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (261, 13, 106, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (262, 14, 106, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (263, 15, 106, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (264, 12, 107, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (265, 13, 107, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (266, 14, 107, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (267, 15, 107, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (268, 12, 108, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (269, 13, 108, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (270, 14, 108, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (271, 15, 108, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (272, 12, 109, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (273, 13, 109, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (274, 14, 109, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (275, 15, 109, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (276, 12, 110, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (277, 13, 110, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (278, 14, 110, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (279, 15, 110, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (280, 12, 111, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (281, 13, 111, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (282, 14, 111, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (283, 15, 111, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (284, 12, 112, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (285, 13, 112, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (286, 14, 112, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (287, 15, 112, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (288, 12, 113, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (289, 13, 113, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (290, 14, 113, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (291, 15, 113, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (292, 12, 114, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (293, 13, 114, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (294, 14, 114, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (295, 15, 114, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (296, 12, 115, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (297, 13, 115, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (298, 14, 115, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (299, 15, 115, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (300, 12, 116, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (301, 13, 116, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (302, 14, 116, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (303, 15, 116, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (304, 12, 117, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (305, 13, 117, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (306, 14, 117, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (307, 15, 117, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (308, 12, 118, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (309, 13, 118, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (310, 14, 118, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (311, 15, 118, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (312, 12, 119, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (313, 13, 119, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (314, 14, 119, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (315, 15, 119, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (316, 12, 120, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (317, 13, 120, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (318, 14, 120, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (319, 15, 120, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (320, 12, 121, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (321, 13, 121, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (322, 14, 121, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (323, 15, 121, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (324, 12, 122, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (325, 13, 122, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (326, 14, 122, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (327, 15, 122, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (328, 12, 123, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (329, 13, 123, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (330, 14, 123, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (331, 15, 123, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (332, 12, 124, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (333, 13, 124, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (334, 14, 124, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (335, 15, 124, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (336, 12, 125, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (337, 13, 125, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (338, 14, 125, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (339, 15, 125, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (340, 12, 126, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (341, 13, 126, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (342, 14, 126, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (343, 15, 126, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (344, 12, 127, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (345, 13, 127, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (346, 14, 127, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (347, 15, 127, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (348, 12, 128, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (349, 13, 128, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (350, 14, 128, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (351, 15, 128, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (352, 12, 129, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (353, 13, 129, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (354, 14, 129, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (355, 15, 129, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (356, 12, 130, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (357, 13, 130, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (358, 14, 130, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (359, 15, 130, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (360, 12, 131, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (361, 13, 131, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (362, 14, 131, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (363, 15, 131, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (364, 8, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (365, 9, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (366, 10, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (367, 11, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (368, 12, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (369, 13, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (370, 14, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (371, 15, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (372, 16, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (373, 17, 132, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (374, 8, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (375, 9, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (376, 10, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (377, 11, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (378, 12, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (379, 13, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (380, 14, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (381, 15, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (382, 16, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (383, 17, 133, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (384, 8, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (385, 9, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (386, 10, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (387, 11, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (388, 12, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (389, 13, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (390, 14, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (391, 15, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (392, 16, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (393, 17, 134, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (394, 8, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (395, 9, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (396, 10, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (397, 11, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (398, 12, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (399, 13, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (400, 14, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (401, 15, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (402, 16, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (403, 17, 135, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (404, 8, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (405, 9, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (406, 10, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (407, 11, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (408, 12, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (409, 13, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (410, 14, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (411, 15, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (412, 16, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (413, 17, 136, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (414, 8, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (415, 9, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (416, 10, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (417, 11, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (418, 12, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (419, 13, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (420, 14, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (421, 15, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (422, 16, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (423, 17, 137, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (424, 8, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (425, 9, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (426, 10, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (427, 11, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (428, 12, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (429, 13, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (430, 14, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (431, 15, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (432, 16, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (433, 17, 138, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (434, 8, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (435, 9, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (436, 10, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (437, 11, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (438, 12, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (439, 13, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (440, 14, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (441, 15, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (442, 16, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (443, 17, 139, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (444, 8, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (445, 9, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (446, 10, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (447, 11, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (448, 12, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (449, 13, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (450, 14, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (451, 15, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (452, 16, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (453, 17, 140, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (454, 8, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (455, 9, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (456, 10, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (457, 11, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (458, 12, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (459, 13, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (460, 14, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (461, 15, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (462, 16, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (463, 17, 141, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (464, 8, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (465, 9, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (466, 10, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (467, 11, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (468, 12, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (469, 13, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (470, 14, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (471, 15, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (472, 16, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (473, 17, 142, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (474, 8, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (475, 9, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (476, 10, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (477, 11, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (478, 12, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (479, 13, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (480, 14, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (481, 15, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (482, 16, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (483, 17, 143, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (484, 8, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (485, 9, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (486, 10, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (487, 11, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (488, 12, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (489, 13, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (490, 14, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (491, 15, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (492, 16, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (493, 17, 144, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (494, 8, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (495, 9, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (496, 10, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (497, 11, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (498, 12, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (499, 13, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (500, 14, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (501, 15, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (502, 16, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (503, 17, 145, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (504, 8, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (505, 9, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (506, 10, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (507, 11, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (508, 12, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (509, 13, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (510, 14, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (511, 15, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (512, 16, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (513, 17, 146, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (514, 8, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (515, 9, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (516, 10, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (517, 11, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (518, 12, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (519, 13, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (520, 14, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (521, 15, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (522, 16, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (523, 17, 147, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (524, 8, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (525, 9, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (526, 10, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (527, 11, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (528, 12, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (529, 13, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (530, 14, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (531, 15, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (532, 16, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (533, 17, 148, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (534, 8, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (535, 9, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (536, 10, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (537, 11, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (538, 12, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (539, 13, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (540, 14, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (541, 15, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (542, 16, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (543, 17, 149, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (544, 8, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (545, 9, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (546, 10, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (547, 11, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (548, 12, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (549, 13, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (550, 14, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (551, 15, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (552, 16, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (553, 17, 150, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (554, 8, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (555, 9, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (556, 10, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (557, 11, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (558, 12, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (559, 13, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (560, 14, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (561, 15, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (562, 16, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (563, 17, 151, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (564, 8, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (565, 9, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (566, 10, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (567, 11, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (568, 12, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (569, 13, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (570, 14, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (571, 15, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (572, 16, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (573, 17, 152, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (574, 8, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (575, 9, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (576, 10, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (577, 11, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (578, 12, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (579, 13, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (580, 14, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (581, 15, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (582, 16, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (583, 17, 153, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (584, 8, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (585, 9, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (586, 10, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (587, 11, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (588, 12, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (589, 13, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (590, 14, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (591, 15, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (592, 16, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (593, 17, 154, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (594, 8, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (595, 9, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (596, 10, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (597, 11, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (598, 12, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (599, 13, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (600, 14, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (601, 15, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (602, 16, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (603, 17, 155, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (604, 8, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (605, 9, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (606, 10, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (607, 11, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (608, 12, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (609, 13, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (610, 14, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (611, 15, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (612, 16, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (613, 17, 156, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (614, 8, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (615, 9, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (616, 10, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (617, 11, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (618, 12, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (619, 13, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (620, 14, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (621, 15, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (622, 16, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (623, 17, 157, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (624, 8, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (625, 9, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (626, 10, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (627, 11, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (628, 12, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (629, 13, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (630, 14, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (631, 15, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (632, 16, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (633, 17, 158, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (634, 8, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (635, 9, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (636, 10, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (637, 11, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (638, 12, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (639, 13, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (640, 14, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (641, 15, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (642, 16, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (643, 17, 159, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (644, 8, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (645, 9, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (646, 10, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (647, 11, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (648, 12, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (649, 13, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (650, 14, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (651, 15, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (652, 16, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (653, 17, 160, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (654, 8, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (655, 9, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (656, 10, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (657, 11, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (658, 12, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (659, 13, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (660, 14, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (661, 15, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (662, 16, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (663, 17, 161, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (664, 8, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (665, 9, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (666, 10, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (667, 11, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (668, 12, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (669, 13, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (670, 14, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (671, 15, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (672, 16, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (673, 17, 162, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (674, 8, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (675, 9, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (676, 10, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (677, 11, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (678, 12, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (679, 13, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (680, 14, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (681, 15, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (682, 16, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (683, 17, 163, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (684, 8, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (685, 9, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (686, 10, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (687, 11, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (688, 12, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (689, 13, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (690, 14, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (691, 15, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (692, 16, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (693, 17, 164, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (694, 1, 165, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (695, 2, 165, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (696, 3, 165, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (697, 4, 165, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (698, 5, 165, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (699, 6, 165, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (700, 7, 165, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (701, 1, 166, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (702, 2, 166, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (703, 3, 166, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (704, 4, 166, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (705, 5, 166, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (706, 6, 166, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (707, 7, 166, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (708, 1, 167, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (709, 2, 167, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (710, 3, 167, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (711, 4, 167, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (712, 5, 167, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (713, 6, 167, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (714, 7, 167, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (715, 1, 168, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (716, 2, 168, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (717, 3, 168, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (718, 4, 168, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (719, 5, 168, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (720, 6, 168, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (721, 7, 168, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (722, 1, 169, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (723, 2, 169, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (724, 3, 169, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (725, 4, 169, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (726, 5, 169, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (727, 6, 169, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (728, 7, 169, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (729, 1, 170, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (730, 2, 170, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (731, 3, 170, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (732, 4, 170, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (733, 5, 170, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (734, 6, 170, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (735, 7, 170, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (736, 1, 171, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (737, 2, 171, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (738, 3, 171, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (739, 4, 171, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (740, 5, 171, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (741, 6, 171, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (742, 7, 171, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (743, 1, 172, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (744, 2, 172, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (745, 3, 172, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (746, 4, 172, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (747, 5, 172, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (748, 6, 172, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (749, 7, 172, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (750, 1, 173, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (751, 2, 173, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (752, 3, 173, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (753, 4, 173, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (754, 5, 173, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (755, 6, 173, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (756, 7, 173, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (757, 1, 174, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (758, 2, 174, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (759, 3, 174, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (760, 4, 174, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (761, 5, 174, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (762, 6, 174, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (763, 7, 174, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (764, 1, 175, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (765, 2, 175, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (766, 3, 175, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (767, 4, 175, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (768, 5, 175, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (769, 6, 175, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (770, 7, 175, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (771, 1, 176, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (772, 2, 176, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (773, 3, 176, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (774, 4, 176, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (775, 5, 176, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (776, 6, 176, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (777, 7, 176, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (778, 1, 177, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (779, 2, 177, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (780, 3, 177, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (781, 4, 177, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (782, 5, 177, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (783, 6, 177, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (784, 7, 177, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (785, 1, 178, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (786, 2, 178, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (787, 3, 178, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (788, 4, 178, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (789, 5, 178, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (790, 6, 178, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (791, 7, 178, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (792, 1, 179, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (793, 2, 179, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (794, 3, 179, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (795, 4, 179, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (796, 5, 179, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (797, 6, 179, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (798, 7, 179, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (799, 1, 180, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (800, 2, 180, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (801, 3, 180, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (802, 4, 180, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (803, 5, 180, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (804, 6, 180, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (805, 7, 180, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (806, 1, 181, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (807, 2, 181, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (808, 3, 181, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (809, 4, 181, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (810, 5, 181, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (811, 6, 181, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (812, 7, 181, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (813, 1, 182, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (814, 2, 182, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (815, 3, 182, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (816, 4, 182, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (817, 5, 182, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (818, 6, 182, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (819, 7, 182, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (820, 1, 183, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (821, 2, 183, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (822, 3, 183, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (823, 4, 183, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (824, 5, 183, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (825, 6, 183, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (826, 7, 183, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (827, 1, 184, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (828, 2, 184, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (829, 3, 184, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (830, 4, 184, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (831, 5, 184, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (832, 6, 184, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (833, 7, 184, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (834, 1, 185, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (835, 2, 185, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (836, 3, 185, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (837, 4, 185, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (838, 5, 185, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (839, 6, 185, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (840, 7, 185, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (841, 1, 186, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (842, 2, 186, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (843, 3, 186, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (844, 4, 186, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (845, 5, 186, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (846, 6, 186, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (847, 7, 186, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (848, 1, 187, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (849, 2, 187, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (850, 3, 187, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (851, 4, 187, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (852, 5, 187, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (853, 6, 187, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (854, 7, 187, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (855, 1, 188, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (856, 2, 188, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (857, 3, 188, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (858, 4, 188, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (859, 5, 188, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (860, 6, 188, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (861, 7, 188, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (862, 1, 189, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (863, 2, 189, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (864, 3, 189, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (865, 4, 189, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (866, 5, 189, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (867, 6, 189, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (868, 7, 189, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (869, 1, 190, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (870, 2, 190, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (871, 3, 190, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (872, 4, 190, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (873, 5, 190, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (874, 6, 190, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (875, 7, 190, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (876, 1, 191, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (877, 2, 191, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (878, 3, 191, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (879, 4, 191, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (880, 5, 191, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (881, 6, 191, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (882, 7, 191, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (883, 1, 192, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (884, 2, 192, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (885, 3, 192, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (886, 4, 192, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (887, 5, 192, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (888, 6, 192, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (889, 7, 192, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (890, 1, 193, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (891, 2, 193, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (892, 3, 193, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (893, 4, 193, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (894, 5, 193, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (895, 6, 193, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (896, 7, 193, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (897, 1, 194, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (898, 2, 194, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (899, 3, 194, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (900, 4, 194, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (901, 5, 194, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (902, 6, 194, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (903, 7, 194, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (904, 1, 195, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (905, 2, 195, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (906, 3, 195, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (907, 4, 195, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (908, 5, 195, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (909, 6, 195, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (910, 7, 195, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (911, 2, 196, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (912, 3, 196, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (913, 4, 196, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (914, 2, 197, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (915, 3, 197, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (916, 4, 197, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (917, 2, 198, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (918, 3, 198, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (919, 4, 198, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (920, 2, 199, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (921, 3, 199, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (922, 4, 199, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (923, 2, 200, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (924, 3, 200, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (925, 4, 200, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (926, 2, 201, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (927, 3, 201, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (928, 4, 201, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (929, 2, 202, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (930, 3, 202, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (931, 4, 202, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (932, 2, 203, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (933, 3, 203, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (934, 4, 203, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (935, 2, 204, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (936, 3, 204, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (937, 4, 204, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (938, 2, 205, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (939, 3, 205, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (940, 4, 205, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (941, 2, 206, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (942, 3, 206, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (943, 4, 206, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (944, 2, 207, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (945, 3, 207, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (946, 4, 207, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (947, 2, 208, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (948, 3, 208, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (949, 4, 208, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (950, 2, 209, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (951, 3, 209, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (952, 4, 209, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (953, 2, 210, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (954, 3, 210, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (955, 4, 210, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (956, 2, 211, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (957, 3, 211, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (958, 4, 211, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (959, 2, 212, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (960, 3, 212, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (961, 4, 212, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (962, 2, 213, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (963, 3, 213, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (964, 4, 213, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (965, 2, 214, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (966, 3, 214, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (967, 4, 214, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (968, 2, 215, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (969, 3, 215, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (970, 4, 215, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (971, 2, 216, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (972, 3, 216, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (973, 4, 216, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (974, 2, 217, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (975, 3, 217, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (976, 4, 217, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (977, 2, 218, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (978, 3, 218, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (979, 4, 218, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (980, 2, 219, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (981, 3, 219, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (982, 4, 219, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (983, 2, 220, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (984, 3, 220, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (985, 4, 220, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (986, 2, 221, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (987, 3, 221, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (988, 4, 221, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (989, 2, 222, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (990, 3, 222, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (991, 4, 222, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (992, 2, 223, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (993, 3, 223, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (994, 4, 223, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (995, 2, 224, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (996, 3, 224, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (997, 4, 224, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (998, 2, 225, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (999, 3, 225, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1000, 4, 225, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1001, 2, 226, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1002, 3, 226, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1003, 4, 226, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1004, 2, 227, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1005, 3, 227, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1006, 4, 227, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1007, 2, 228, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1008, 3, 228, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1009, 4, 228, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1010, 2, 229, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1011, 3, 229, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1012, 4, 229, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1013, 2, 230, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1014, 3, 230, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1015, 4, 230, 50, NULL, NULL);
INSERT INTO `size_product` VALUES (1016, 2, 231, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1017, 3, 231, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1018, 4, 231, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1019, 2, 232, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1020, 3, 232, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1021, 4, 232, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1022, 2, 233, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1023, 3, 233, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1024, 4, 233, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1025, 2, 234, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1026, 3, 234, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1027, 4, 234, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1028, 2, 235, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1029, 3, 235, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1030, 4, 235, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1031, 2, 236, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1032, 3, 236, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1033, 4, 236, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1034, 2, 237, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1035, 3, 237, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1036, 4, 237, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1037, 2, 238, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1038, 3, 238, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1039, 4, 238, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1040, 2, 239, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1041, 3, 239, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1042, 4, 239, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1043, 2, 240, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1044, 3, 240, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1045, 4, 240, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1046, 2, 241, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1047, 3, 241, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1048, 4, 241, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1049, 2, 242, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1050, 3, 242, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1051, 4, 242, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1052, 2, 243, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1053, 3, 243, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1054, 4, 243, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1055, 2, 244, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1056, 3, 244, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1057, 4, 244, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1058, 2, 245, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1059, 3, 245, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1060, 4, 245, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1061, 2, 246, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1062, 3, 246, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1063, 4, 246, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1064, 2, 247, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1065, 3, 247, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1066, 4, 247, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1067, 2, 248, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1068, 3, 248, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1069, 4, 248, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1070, 2, 249, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1071, 3, 249, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1072, 4, 249, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1073, 2, 250, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1074, 3, 250, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1075, 4, 250, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1076, 2, 251, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1077, 3, 251, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1078, 4, 251, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1079, 2, 252, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1080, 3, 252, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1081, 4, 252, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1082, 2, 253, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1083, 3, 253, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1084, 4, 253, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1085, 2, 254, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1086, 3, 254, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1087, 4, 254, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1088, 2, 255, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1089, 3, 255, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1090, 4, 255, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1091, 2, 256, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1092, 3, 256, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1093, 4, 256, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1094, 2, 257, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1095, 3, 257, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1096, 4, 257, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1097, 2, 258, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1098, 3, 258, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1099, 4, 258, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1100, 2, 259, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1101, 3, 259, 0, NULL, NULL);
INSERT INTO `size_product` VALUES (1102, 4, 259, 0, NULL, NULL);

-- ----------------------------
-- Table structure for sizes
-- ----------------------------
DROP TABLE IF EXISTS `sizes`;
CREATE TABLE `sizes`  (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `size_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`size_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sizes
-- ----------------------------
INSERT INTO `sizes` VALUES (1, 'XS', 'qa');
INSERT INTO `sizes` VALUES (2, 'S', 'qa');
INSERT INTO `sizes` VALUES (3, 'M', 'qa');
INSERT INTO `sizes` VALUES (4, 'L', 'qa');
INSERT INTO `sizes` VALUES (5, 'XL', 'qa');
INSERT INTO `sizes` VALUES (6, 'XXL', 'qa');
INSERT INTO `sizes` VALUES (7, 'XXXL', 'qa');
INSERT INTO `sizes` VALUES (8, '6', 'shoes');
INSERT INTO `sizes` VALUES (9, '6-', 'shoes');
INSERT INTO `sizes` VALUES (10, '7', 'shoes');
INSERT INTO `sizes` VALUES (11, '7-', 'shoes');
INSERT INTO `sizes` VALUES (12, '8', 'shoes');
INSERT INTO `sizes` VALUES (13, '8-', 'shoes');
INSERT INTO `sizes` VALUES (14, '9', 'shoes');
INSERT INTO `sizes` VALUES (15, '9-', 'shoes');
INSERT INTO `sizes` VALUES (16, '10', 'shoes');
INSERT INTO `sizes` VALUES (17, '10-', 'shoes');

-- ----------------------------
-- Table structure for sports
-- ----------------------------
DROP TABLE IF EXISTS `sports`;
CREATE TABLE `sports`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `banner_image_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sports
-- ----------------------------
INSERT INTO `sports` VALUES (10, 'PickeBall', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_1_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/pickleball.jpg?v=1751074077888', NULL, 1, 'Chọn lựa những mẫu vợt, giày chuyên nghiệp và trang phục pickleball chuyên dụng từ các nhãn hiệu hàng đầu như adidas, ASICS, Li-Ning,... tại MaxxSport. Dành cho người chơi ở mọi giới tính, lứa tuổi và trình độ, giúp bạn sẵn sàng lên sân.  ', NULL, NULL, NULL);
INSERT INTO `sports` VALUES (11, 'Chạy bộ', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_2_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-dong-san-pham-1620x300banner-web-06805833-8185-4ad8-bec2-388bf6907129.jpg?v=1712045444972', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sports` VALUES (12, 'Cầu lông', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_3_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/cau-long.jpg?v=1753089679387', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sports` VALUES (13, 'Tennis', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_4_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/tennis.jpg', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sports` VALUES (14, 'Golf', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_5_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-dong-san-pham-1620x300-1banner-web-6d60ec71-00f7-49b6-b0b4-cfeab5088979.jpg?v=1712045473514', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sports` VALUES (15, 'Bóng rổ', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_6_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/bong-da.jpg?v=1751074283581', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sports` VALUES (16, 'Bóng đá', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_7_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/bong-da.jpg?v=1751074283581', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sports` VALUES (17, 'Tập luyện', 'https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/season_coll_8_img.png?1758159424922', NULL, 'https://bizweb.dktcdn.net/100/340/361/files/banner-dong-san-pham-1620x300-2banner-web.jpg?v=1712045725947', NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT 0,
  `fullname` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone_number` int NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isLocked` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 14, 1, 'Administrator', 12345, 'Ngõ 445 Lạc Long Quân, Tây Hồ, Hà Nội', 0);
INSERT INTO `user_info` VALUES (2, 15, 0, 'Phạm Quang Anh', 852665998, 'Tây Hồ, Hà Nội', 0);
INSERT INTO `user_info` VALUES (3, 16, 0, 'Hoàng Mỹ Linh', 828151298, 'Xuân Thủy, Cầu Giấy, Hà Nội', 0);
INSERT INTO `user_info` VALUES (4, 17, 0, 'Phạm Sơn Tùng', 12345, 'Thành Công. Ba Đình, Hà Nội', 0);
INSERT INTO `user_info` VALUES (5, 18, 0, 'Trần Đình Hiếu', 515141, 'Hoa Bằng, Cầu Giấy, Hà Nội', 0);
INSERT INTO `user_info` VALUES (11, 21, 0, 'Lê Quang Thế Anh', 1554456, 'Việt Nam', 0);
INSERT INTO `user_info` VALUES (14, 25, 0, 'Trần Đình Hiếu', 2132132, 'Yên Hòa, Hà Nội', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_number` int NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reset_token_expire` datetime NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (14, 'admin', 'admin@admin', NULL, NULL, '$2y$12$ipZIUBJzufgGRf.RI7cL0e7YWbxz0gktTk.KgwwmBptA2wehdXuby', NULL, NULL, 'active', NULL, NULL, '2019-04-23 15:33:17', '2019-04-23 15:33:17');
INSERT INTO `users` VALUES (15, 'quanganh', 'quanganh@gmail.com', NULL, NULL, '$2y$10$DTeeooNkiXql1Y9HqstvbOLCXnYJ.MsGJW6aPhrplJpGZkgXvPRaG', NULL, NULL, 'active', NULL, NULL, '2019-04-23 15:33:39', '2019-04-23 15:33:39');
INSERT INTO `users` VALUES (16, 'linh', 'linh@gmail.com', NULL, NULL, '$2y$10$iq9NTp/4Rz31PVizwfSHieEnb/v3PAP7I6lpEm2BaxTteztBjG9UC', NULL, NULL, 'active', NULL, NULL, '2019-04-23 15:34:06', '2019-04-23 15:34:06');
INSERT INTO `users` VALUES (17, 'tung', 'tung@gmail.com', NULL, NULL, '$2y$10$ba4MjCTQkBb7QO4Sx6fva./vc2yOb8uqu9ZQ5G0V980caiwr4Vx32', NULL, NULL, 'active', NULL, NULL, '2019-04-23 15:34:35', '2019-04-23 15:34:35');
INSERT INTO `users` VALUES (21, 'theanh', 'theanh28@gmail.com', NULL, NULL, '$2y$10$GHzBjUqBeLJ8mr6cGFJwbeVDydjhKbpqAgtJLFqe/9DqSO1xu8.xK', NULL, NULL, 'active', NULL, NULL, '2019-04-27 13:59:37', '2019-04-27 13:59:37');
INSERT INTO `users` VALUES (25, 'hieu', 'hieu@gmail.com', NULL, NULL, '$2y$10$R88uZ3GCVjojjg/8YEkXb.se8Je.62mWeS6mQBQEKvgP.v8lLcAjO', NULL, NULL, 'active', NULL, NULL, '2019-05-13 01:41:04', '2019-05-13 01:41:04');
INSERT INTO `users` VALUES (26, 'phongnt', 'ngophongcoder26@gmail.com', NULL, 397760835, '$2y$12$x50Tsv1M5XaCniZ3N/Q/x.w8Ksqq8ySH450BQfqQ2l96I.oZuY.HC', 'FRPlrLNogziavAv1q9Agiu7rwnjDiG7B1aKLNrIB7Avgfu8bmPBDapW33FH4', '2025-09-30 19:25:14', 'active', 'Nam Định', NULL, NULL, NULL);
INSERT INTO `users` VALUES (27, 'Demo', 'demo@example.com', NULL, 123456789, '$2y$12$ebbEo9ChXnRdSO29YNDtB.01Mh.ioFxo3w9PQ7b9z2vKWGn5OQgq.', NULL, NULL, 'active', 'Việt Nam', NULL, NULL, NULL);
INSERT INTO `users` VALUES (28, 'Ngô Nam Khánh', 'ngonamkhanh0608@gmail.com', NULL, 904856521, '$2y$12$7rVoNXL5/ChJH8BqJpEt7.M57wTYZ2sHE2xKyECFyEhOIquQU/D9a', NULL, NULL, NULL, 'Nam Dinh', NULL, NULL, NULL);
INSERT INTO `users` VALUES (29, 'Phong123', 'ngotienphong2610@gmail.com', NULL, 909090909, '$2y$12$oibqmGF8gIubTkb/epNv/OouJiAerfBRUhB3BhY5OVWFWNMxgujhe', NULL, NULL, NULL, 'Ninh Binh', NULL, NULL, NULL);
INSERT INTO `users` VALUES (30, 'LastUser', 'ngo12.vanphong@gmail.com', NULL, 397760835, '$2y$12$seu87ylW085BRuL4KARmCeqgwUgLTAsqhT7TXCAShpzdydb8KYJve', '15aAfm2gDz6jfffiNUdVgioHfkhvaazbFTOnvkmzWVHf8KtMlQK78KOtyKOO', '2025-09-30 19:17:28', NULL, 'Nghia Hung', NULL, NULL, NULL);
INSERT INTO `users` VALUES (31, 'Admin', 'anhvn.hqgroup@gmail.com', NULL, 397760835, '$2y$12$ipZIUBJzufgGRf.RI7cL0e7YWbxz0gktTk.KgwwmBptA2wehdXuby', NULL, NULL, NULL, 'Ha Noi', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã voucher',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Số tiền giảm cố định',
  `discount_percentage` decimal(5, 2) NULL DEFAULT NULL COMMENT 'Giảm giá theo %',
  `start_date` datetime NOT NULL COMMENT 'Ngày bắt đầu',
  `expiry_date` datetime NOT NULL COMMENT 'Ngày hết hạn',
  `minimum_purchase_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT 'Giá trị tối thiểu đơn hàng',
  `maximum_purchase_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Giá trị tối đa đơn hàng (nếu có)',
  `max_usage_count` int UNSIGNED NULL DEFAULT NULL COMMENT 'Số lần tối đa được sử dụng',
  `usage_count` int UNSIGNED NULL DEFAULT 0 COMMENT 'Số lần đã sử dụng',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '1=Hoạt động, 0=Ngừng',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
INSERT INTO `vouchers` VALUES (2, 'VOUCHER02', NULL, 10.00, '2025-09-25 00:00:00', '2025-11-30 23:59:59', 200000.00, 1000000.00, 50, 0, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (3, 'VOUCHER03', 50000.00, NULL, '2025-10-01 00:00:00', '2025-12-01 00:00:00', 250.00, NULL, 200, 2, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (4, 'VOUCHER04', NULL, 15.00, '2025-09-30 00:00:00', '2025-11-30 23:59:59', 400000.00, 1500000.00, 80, 1, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (5, 'VOUCHER05', 200000.00, NULL, '2025-09-25 00:00:00', '2025-12-31 23:59:59', 1000000.00, NULL, 30, 2, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (6, 'VOUCHER06', NULL, 5.00, '2025-09-25 00:00:00', '2025-10-31 23:59:59', 100000.00, 500000.00, 500, 0, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (7, 'VOUCHER07', 150000.00, NULL, '2025-10-01 00:00:00', '2025-12-31 23:59:59', 800000.00, NULL, 40, 2, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (8, 'VOUCHER08', NULL, 20.00, '2025-09-25 00:00:00', '2025-11-15 23:59:59', 500000.00, 2000000.00, 60, 2, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (9, 'VOUCHER09', 75000.00, NULL, '2025-10-05 00:00:00', '2025-12-15 23:59:59', 300000.00, NULL, 120, 0, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (11, 'VOUCHER11', 50000.00, NULL, '2025-09-25 00:00:00', '2025-12-31 23:59:59', 200000.00, NULL, 300, 5, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (14, 'VOUCHER14', NULL, 25.00, '2025-10-01 00:00:00', '2025-12-15 23:59:59', 1000000.00, 3000000.00, 20, 2, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (15, 'VOUCHER15', 300000.00, NULL, '2025-09-25 00:00:00', '2025-12-31 23:59:59', 2000000.00, NULL, 10, 1, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (16, 'VOUCHER16', NULL, 7.50, '2025-09-25 00:00:00', '2025-11-30 23:59:59', 250000.00, 800000.00, 200, 0, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (17, 'VOUCHER17', 90000.00, NULL, '2025-10-01 00:00:00', '2025-12-31 23:59:59', 400000.00, NULL, 70, 1, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (18, 'VOUCHER18', NULL, 18.00, '2025-09-28 00:00:00', '2025-12-01 23:59:59', 600000.00, 1500000.00, 60, 0, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (19, 'VOUCHER19', 110000.00, NULL, '2025-09-25 00:00:00', '2025-12-31 23:59:59', 500000.00, NULL, 100, 0, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (20, 'VOUCHER20', NULL, 30.00, '2025-10-01 00:00:00', '2025-12-31 23:59:59', 1000000.00, 5000000.00, 15, 0, 1, '2025-09-25 17:10:22', '2025-09-25 17:10:22');
INSERT INTO `vouchers` VALUES (21, 'DEMO123', 20000.00, NULL, '2025-09-29 00:00:00', '2025-10-31 00:00:00', 100000.00, NULL, 1000, 0, 1, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
