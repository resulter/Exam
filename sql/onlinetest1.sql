/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : onlinetest

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-03-30 18:26:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for factory_c
-- ----------------------------
DROP TABLE IF EXISTS `factory_c`;
CREATE TABLE `factory_c` (
  `FACTORY_ID` varchar(255) NOT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  `FACTORY_NAME` varchar(255) DEFAULT NULL,
  `CONTRACTOR` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `MOBILE` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `CNOTE` varchar(255) DEFAULT NULL,
  `ORDER_NO` int(100) DEFAULT NULL,
  `STATE` int(100) DEFAULT NULL,
  PRIMARY KEY (`FACTORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factory_c
-- ----------------------------

-- ----------------------------
-- Table structure for q_direction
-- ----------------------------
DROP TABLE IF EXISTS `q_direction`;
CREATE TABLE `q_direction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_direction
-- ----------------------------
INSERT INTO `q_direction` VALUES ('1', 'Reading Directions', '<p>In this part of the Reading section. you will read 3 passages.\r\n				In the test you will have 60 minutes to read the passage and answer\r\n				the questions.</p>\r\n			<p>Most questions are worth 1 point but the last question in this\r\n				set is worth more than 1 point. The directions indicate how many\r\n				points you may receive.</p>\r\n			<p>Some passages include a word or phrase that is underlined in\r\n				blue. Click on the word or phrase to see a definition or an\r\n				explanation.</p>\r\n			<p>When you want to move to the next question. click on Next. You\r\n				may skip questions and go back them later if you want to return to\r\n				previous questions. click on Back.</p>\r\n			<p>You can click on Review at any time and the review screen will\r\n				show you which questions you have answered and which you have not\r\n				answered. From this review screen, you may go directly to any\r\n				question you have already seen in the Reading section.</p>\r\n			<p class=\"tips\">Click on Continue to go on</p>', '阅读题目描述');
INSERT INTO `q_direction` VALUES ('2', 'Listening Directions', ' <p>The listening section will assess how well you understand lectures and conversations in English.</p>\r\n    <p>This section is split into 2 separately timed parts. You will hear 1 conversation and 2 lectures in each part. Each conversation or lecture will only be played one time. There will be questions after each conversation or lecture. The questions are generally about the main idea and supporting details. Some questions will pertain to a speaker\'s purpose or attitude.  Base your answers on what is stated or implied by the speakers.</p>\r\n    <p>You are allowed to take notes while listening. You may use these notes to help you to answer the question. The notes will not be scored.</p>\r\n    <p>If you wish to change the volume while listening, click the VOLUME icon at the top of the screen. You will see this icon for some questions:<span class=\"icon-listen-headset\"></span>This indicates you will hear, but not see, part of the question.</p>\r\n    <p>Certain questions have special directions. These will be on the screen in a gray box.  Most questions that appear on the test will be worth 1 point. Certain questions worth more than 1 point will have special directions indicating how many points they are worth.</p>\r\n    <p>Each question must be answered in order to proceed. After answering, click NEXT, then click OK to confirm your choice and move on to the next question. After clicking OK, you will not be able to return to previous questions.</p>\r\n    <p>It will take roughly 60 minutes to listen to the Conversations and Lectures and complete the questions. You will be given 35 minutes for completing the questions.</p>\r\n', '听力');
INSERT INTO `q_direction` VALUES ('3', 'Speaking Directions', '<p>The speaking section will assess your ability to speak about a\r\n		variety of topics. This section contains 6 questions.</p>\r\n	<br>\r\n	<p>Questions 1 and 2 will ask you to speak about familiar topics.</p>\r\n	<br>\r\n	<p>Questions 3 and 4 will ask you to first read a short text.\r\n		Afterwards, you will listen to a talk on the same topic. Then, you\r\n		will be asked a question about what you have just read and heard. A\r\n		complete answer combines appropriate information from the text and the\r\n		talk. You will be assessed on your ability to speak clearly and\r\n		coherently, as well as your ability to accurately convey information\r\n		about things you read and heard.</p>\r\n	<br>\r\n	<p>Questions 5 and 6 will ask you to first listen to part of a\r\n		conversation or lecture. Afterwards, you will be asked a question\r\n		about what you have just heard. You will be assessed on your ability\r\n		to speak clearly and coherently, as well as your ability to accurately\r\n		convey information about things you heard.</p>\r\n\r\n	<br>\r\n	<p>You may take notes while reading and while listening to the\r\n		conversation and lectures. These notes may be used when preparing your\r\n		response.</p>\r\n	<br>\r\n	<p>Pay close attention to the directions for each question.\r\n		Directions will not appear on the screen.</p>\r\n	<br>\r\n	<p>You will have a short time to prepare your response for each\r\n		question. A clock will display the remaining time. Once this\r\n		preparation time is over, you will begin your response. A clock will\r\n		display the remaining time. Once this response time is over, a message\r\n		will appear on the screen.</p>', '口语');
INSERT INTO `q_direction` VALUES ('4', 'Writing Directions', '<p>The writing section will assess how well you can use writing to communicate in an academic environment. This section contains 2 writing tasks.</p>\r\n			<p>In the first writing task, you will be asked to read a passage and listen to a lecture. Then you will answer a question based on the things you have read and heard.\r\n			 In the second writing task, you will be asked to answer a question based on your personal knowledge and experience.</p>\r\n			<p class=\"tips\">Click on Continue to go on</p>', '写作');

-- ----------------------------
-- Table structure for q_listening_option
-- ----------------------------
DROP TABLE IF EXISTS `q_listening_option`;
CREATE TABLE `q_listening_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` char(1) DEFAULT NULL COMMENT '字母A、B、C',
  `item_name` varchar(512) DEFAULT NULL,
  `order_num` int(2) DEFAULT NULL COMMENT '从数字1开始，数字小的放在前面',
  `question_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_listening_option
-- ----------------------------
INSERT INTO `q_listening_option` VALUES ('1', 'A', 'To sign up for a seminar on using electronic sources for research', '1', '1', null);
INSERT INTO `q_listening_option` VALUES ('2', 'B', 'To report that a journal is missing from the reference area', '2', '1', null);
INSERT INTO `q_listening_option` VALUES ('3', 'C', 'To find out the procedure for checking out journal articles', '3', '1', null);
INSERT INTO `q_listening_option` VALUES ('4', 'D', 'To ask about how to look for resources for a class paper', '4', '1', null);
INSERT INTO `q_listening_option` VALUES ('5', 'A', 'They are not easy to find if a professor put them on reserve ', '1', '2', null);
INSERT INTO `q_listening_option` VALUES ('6', 'B', 'Most of them are accessible in an electronic format', '2', '2', null);
INSERT INTO `q_listening_option` VALUES ('7', 'C', 'Most of them can be checked out for three weeks', '3', '2', null);
INSERT INTO `q_listening_option` VALUES ('8', 'D', 'Printed versions from the past three years are located in the reference section.', '4', '2', null);
INSERT INTO `q_listening_option` VALUES ('9', 'A', 'Choose an easier research topic', '1', '3', null);
INSERT INTO `q_listening_option` VALUES ('10', 'B', 'Concentrate on five journals', '2', '3', null);
INSERT INTO `q_listening_option` VALUES ('11', 'C', 'Read the summaries of the articles first', '3', '3', null);
INSERT INTO `q_listening_option` VALUES ('12', 'D', 'Install a new program on her home computer', '4', '3', null);
INSERT INTO `q_listening_option` VALUES ('13', 'A', 'She thinks she might need additional help from the man', '1', '4', null);
INSERT INTO `q_listening_option` VALUES ('14', 'B', 'She does not have a computer at home', '2', '4', null);
INSERT INTO `q_listening_option` VALUES ('15', 'C', 'She has to hand in her assignment by the end of the day', '3', '4', null);
INSERT INTO `q_listening_option` VALUES ('16', 'D', 'She will be meeting a friend in the library later on', '4', '4', null);
INSERT INTO `q_listening_option` VALUES ('17', 'A', 'She had forgotten about the information', '1', '5', null);
INSERT INTO `q_listening_option` VALUES ('18', 'B', 'She is surprised she was not aware of the information', '2', '5', null);
INSERT INTO `q_listening_option` VALUES ('19', 'C', 'She is annoyed that the information was published only recently', '3', '5', null);
INSERT INTO `q_listening_option` VALUES ('20', 'D', 'She is concerned that the librarian gave her incorrect information', '4', '5', null);
INSERT INTO `q_listening_option` VALUES ('21', 'A', 'To explain the difference between two artistic styles', '1', '6', null);
INSERT INTO `q_listening_option` VALUES ('22', 'B', 'To describe a new art gallery to the class', '2', '6', null);
INSERT INTO `q_listening_option` VALUES ('23', 'C', 'To introduce an artist\'s work to the class', '3', '6', null);
INSERT INTO `q_listening_option` VALUES ('24', 'D', 'To show how artists\' styles can evolve over time', '4', '6', null);
INSERT INTO `q_listening_option` VALUES ('25', 'A', 'It resembles a photograph', '1', '7', null);
INSERT INTO `q_listening_option` VALUES ('26', 'B', 'It may be Frantzen\'s best known painting', '2', '7', null);
INSERT INTO `q_listening_option` VALUES ('27', 'C', 'It was painted in the Impressionist style', '3', '7', null);
INSERT INTO `q_listening_option` VALUES ('28', 'D', 'It was painted while Frantzen lived abroad', '4', '7', null);
INSERT INTO `q_listening_option` VALUES ('29', 'A', 'To study human form and movement', '1', '8', null);
INSERT INTO `q_listening_option` VALUES ('30', 'B', 'To earn money by painting portraits', '2', '8', null);
INSERT INTO `q_listening_option` VALUES ('31', 'C', 'To paint farm animals in an outdoor setting', '3', '8', null);
INSERT INTO `q_listening_option` VALUES ('32', 'D', 'To meet people who could model for her paining', '4', '8', null);
INSERT INTO `q_listening_option` VALUES ('33', 'A', 'It was painted at an art fair', '1', '9', null);
INSERT INTO `q_listening_option` VALUES ('34', 'B', 'It combines Impressionism with Realism', '2', '9', null);
INSERT INTO `q_listening_option` VALUES ('35', 'C', 'It convinced Frantzen that she was a good illustrator', '3', '9', null);
INSERT INTO `q_listening_option` VALUES ('36', 'D', 'It was originally meant to be used in an advertisement', '4', '9', null);
INSERT INTO `q_listening_option` VALUES ('37', 'A', 'He wants to point out mistakes that young artists commonly make', '1', '10', null);
INSERT INTO `q_listening_option` VALUES ('38', 'B', 'He thinks her example can inspire the students in their own lives', '2', '10', null);
INSERT INTO `q_listening_option` VALUES ('39', 'C', 'Her difficulties remind him of the difficulties he himself experienced as a young girl', '3', '10', null);
INSERT INTO `q_listening_option` VALUES ('40', 'D', 'Her difficulties are the subject of some of the paintings in the gallery that the students will visit', '4', '10', null);
INSERT INTO `q_listening_option` VALUES ('41', 'A', 'The difference in age among American mountain ranges', '1', '11', null);
INSERT INTO `q_listening_option` VALUES ('42', 'B', 'The importance of a technique used for dating geological materials', '2', '11', null);
INSERT INTO `q_listening_option` VALUES ('43', 'C', 'The recent discovery of an ancient canyon', '3', '11', null);
INSERT INTO `q_listening_option` VALUES ('44', 'D', 'A comparison of various minerals used for dating', '4', '11', null);
INSERT INTO `q_listening_option` VALUES ('45', 'A', 'An ancient lake located in the American Southwest', '1', '12', null);
INSERT INTO `q_listening_option` VALUES ('46', 'B', 'A desert that once connected two continents', '2', '12', null);
INSERT INTO `q_listening_option` VALUES ('47', 'C', 'Sands carried by a river from the Appalachian Mountains', '3', '12', null);
INSERT INTO `q_listening_option` VALUES ('48', 'D', 'A nearby mountain range that had flattened out over time', '4', '12', null);
INSERT INTO `q_listening_option` VALUES ('49', 'A', 'It can be performed outside a laboratory', '1', '13', null);
INSERT INTO `q_listening_option` VALUES ('50', 'B', 'It can now be done more efficiently', '2', '13', null);
INSERT INTO `q_listening_option` VALUES ('51', 'C', 'It no longer involves radioactive elements', '3', '13', null);
INSERT INTO `q_listening_option` VALUES ('52', 'D', 'It can be used in fields other than geology', '4', '13', null);
INSERT INTO `q_listening_option` VALUES ('53', 'A', 'To give another example of how uranium-lead dating might be useful', '1', '14', null);
INSERT INTO `q_listening_option` VALUES ('54', 'B', 'To explain how the Grand Canyon was formed', '2', '14', null);
INSERT INTO `q_listening_option` VALUES ('55', 'C', 'To demonstrate how difficult uranium-lead dating is', '3', '14', null);
INSERT INTO `q_listening_option` VALUES ('56', 'D', 'To disprove a theory about the age of Earth\'s first mountain ranges', '4', '14', null);
INSERT INTO `q_listening_option` VALUES ('57', 'A', 'The class is easier than other geology classes', '1', '15', null);
INSERT INTO `q_listening_option` VALUES ('58', 'B', 'The class has already studied the information he is discussing', '2', '15', null);
INSERT INTO `q_listening_option` VALUES ('59', 'C', 'Some students should take a course in geological dating techniques', '3', '15', null);
INSERT INTO `q_listening_option` VALUES ('60', 'D', 'He will discuss the topic later in the class', '4', '15', null);
INSERT INTO `q_listening_option` VALUES ('61', 'A', 'A lesson Matthew prepared for his students', '1', '16', null);
INSERT INTO `q_listening_option` VALUES ('62', 'B', 'A class Matthew has been observing', '2', '16', null);
INSERT INTO `q_listening_option` VALUES ('63', 'C', 'A term paper that Matthew has written', '3', '16', null);
INSERT INTO `q_listening_option` VALUES ('64', 'D', 'A problem in Matthew\'s classroom', '4', '16', null);
INSERT INTO `q_listening_option` VALUES ('65', 'A', 'It will help him become a more effective teacher', '1', '17', null);
INSERT INTO `q_listening_option` VALUES ('66', 'B', 'It could help improve his study habits', '2', '17', null);
INSERT INTO `q_listening_option` VALUES ('67', 'C', 'It has improved his public-speaking skills', '3', '17', null);
INSERT INTO `q_listening_option` VALUES ('68', 'D', 'It may be the most difficult assignment he has had', '4', '17', null);
INSERT INTO `q_listening_option` VALUES ('69', 'A', 'To identify a topic frequently discussed in third grade', '1', '18', null);
INSERT INTO `q_listening_option` VALUES ('70', 'B', 'To get the professor\'s opinion about a lesson he taught', '2', '18', null);
INSERT INTO `q_listening_option` VALUES ('71', 'C', 'To make a suggestion to improve the class he is taking', '3', '18', null);
INSERT INTO `q_listening_option` VALUES ('72', 'D', 'To illustrate a technique used to teach a third-grade class', '4', '18', null);
INSERT INTO `q_listening_option` VALUES ('73', 'A', 'Reviewing other student\'s reports', '1', '19', null);
INSERT INTO `q_listening_option` VALUES ('74', 'B', 'Using books in the library', '2', '19', null);
INSERT INTO `q_listening_option` VALUES ('75', 'C', 'Interviewing their classmates', '3', '19', null);
INSERT INTO `q_listening_option` VALUES ('76', 'D', 'Speaking in public', '4', '19', null);
INSERT INTO `q_listening_option` VALUES ('77', 'A', 'Hand in his assignment early', '1', '20', null);
INSERT INTO `q_listening_option` VALUES ('78', 'B', 'Try to start a study group', '2', '20', null);
INSERT INTO `q_listening_option` VALUES ('79', 'C', 'Make a presentation to the class', '3', '20', null);
INSERT INTO `q_listening_option` VALUES ('80', 'D', 'Choose a topic for his paper', '4', '20', null);
INSERT INTO `q_listening_option` VALUES ('81', 'A', 'Art in the Neolithic period', '1', '21', null);
INSERT INTO `q_listening_option` VALUES ('82', 'B', 'The site of a Neolithic town', '2', '21', null);
INSERT INTO `q_listening_option` VALUES ('83', 'C', 'Methods of making stone tools', '3', '21', null);
INSERT INTO `q_listening_option` VALUES ('84', 'D', 'The domestication of plants and animals by early farmers', '4', '21', null);
INSERT INTO `q_listening_option` VALUES ('85', 'A', 'They were made of stone that came from Catalhoyuk', '1', '22', null);
INSERT INTO `q_listening_option` VALUES ('86', 'B', 'They were among the sharpest tools available at the time', '2', '22', null);
INSERT INTO `q_listening_option` VALUES ('87', 'C', 'They were often used in religious rituals', '3', '22', null);
INSERT INTO `q_listening_option` VALUES ('88', 'D', 'They were used primarily for agriculture', '4', '22', null);
INSERT INTO `q_listening_option` VALUES ('89', 'A', 'They were in the roof', '1', '23', null);
INSERT INTO `q_listening_option` VALUES ('90', 'B', 'They were usually kept closed', '2', '23', null);
INSERT INTO `q_listening_option` VALUES ('91', 'C', 'They allowed smoke to escape from the house', '3', '23', null);
INSERT INTO `q_listening_option` VALUES ('92', 'D', 'They stood opposite one another across narrow streets', '4', '23', null);
INSERT INTO `q_listening_option` VALUES ('93', 'A', 'The graves contained precious stones', '1', '24', null);
INSERT INTO `q_listening_option` VALUES ('94', 'B', 'Many people were buried in each grave', '2', '24', null);
INSERT INTO `q_listening_option` VALUES ('95', 'C', 'The grave were located under the house floors', '3', '24', null);
INSERT INTO `q_listening_option` VALUES ('96', 'D', 'The graves contained ashes rather than bones', '4', '24', null);
INSERT INTO `q_listening_option` VALUES ('97', 'A', 'She thinks it is a good guess, but only a guess', '1', '25', null);
INSERT INTO `q_listening_option` VALUES ('98', 'B', 'She thinks some evidence supports it, but other evidence contradicts it.', '2', '25', null);
INSERT INTO `q_listening_option` VALUES ('99', 'C', 'She thinks that further excavations will soon disprove it', '3', '25', null);
INSERT INTO `q_listening_option` VALUES ('100', 'D', 'She thinks that it is not appropriate to make such guesses about the distant past ', '4', '25', null);
INSERT INTO `q_listening_option` VALUES ('101', 'A', 'The types of habitats marmots prefer', '1', '26', null);
INSERT INTO `q_listening_option` VALUES ('102', 'B', 'Methods of observing marmot behavior', '2', '26', null);
INSERT INTO `q_listening_option` VALUES ('103', 'C', 'Feeding habits of some marmot species', '3', '26', null);
INSERT INTO `q_listening_option` VALUES ('104', 'D', 'Differences in behavior between marmot species', '4', '26', null);
INSERT INTO `q_listening_option` VALUES ('105', 'A', 'They do not hide from humans', '1', '27', null);
INSERT INTO `q_listening_option` VALUES ('106', 'B', 'They reside in many regions throughout North America', '2', '27', null);
INSERT INTO `q_listening_option` VALUES ('107', 'C', 'They are active in open areas during the day', '3', '27', null);
INSERT INTO `q_listening_option` VALUES ('108', 'D', 'Their burrows are easy to locate', '4', '27', null);
INSERT INTO `q_listening_option` VALUES ('109', 'A', 'Type of food available', '1', '28', null);
INSERT INTO `q_listening_option` VALUES ('110', 'B', 'The size of the population', '2', '28', null);
INSERT INTO `q_listening_option` VALUES ('111', 'C', 'Interaction with other marmot species', '3', '28', null);
INSERT INTO `q_listening_option` VALUES ('112', 'D', 'Adaptations to the climate', '4', '28', null);
INSERT INTO `q_listening_option` VALUES ('113', 'A', 'To inform the student that his definition is incorrect', '1', '29', null);
INSERT INTO `q_listening_option` VALUES ('114', 'B', 'To suggest that the student did not do the reading', '2', '29', null);
INSERT INTO `q_listening_option` VALUES ('115', 'C', 'To encourage the student to try again', '3', '29', null);
INSERT INTO `q_listening_option` VALUES ('116', 'D', 'To change the topic of discussion', '4', '29', null);
INSERT INTO `q_listening_option` VALUES ('117', 'A', 'To express a similar concern', '1', '30', null);
INSERT INTO `q_listening_option` VALUES ('118', 'B', 'To encourage the student to explain what she means', '2', '30', null);
INSERT INTO `q_listening_option` VALUES ('119', 'C', 'To address the student\'s concern', '3', '30', null);
INSERT INTO `q_listening_option` VALUES ('120', 'D', 'To agree with the student', '4', '30', null);
INSERT INTO `q_listening_option` VALUES ('121', 'A', 'To borrow some charts and graphs from her', '1', '31', null);
INSERT INTO `q_listening_option` VALUES ('122', 'B', 'To ask her to explain some statistical procedures', '2', '31', null);
INSERT INTO `q_listening_option` VALUES ('123', 'C', 'To talk about report he is writing', '3', '31', null);
INSERT INTO `q_listening_option` VALUES ('124', 'D', 'To discuss a grade he got on a paper', '4', '31', null);
INSERT INTO `q_listening_option` VALUES ('125', 'A', 'Climate charts', '1', '32', null);
INSERT INTO `q_listening_option` VALUES ('126', 'B', 'Interviews with meteorologists', '2', '32', null);
INSERT INTO `q_listening_option` VALUES ('127', 'C', 'Journals notes', '3', '32', null);
INSERT INTO `q_listening_option` VALUES ('128', 'D', 'Statistical tests', '4', '32', null);
INSERT INTO `q_listening_option` VALUES ('129', 'A', 'To demonstrate a way of remembering things', '1', '33', null);
INSERT INTO `q_listening_option` VALUES ('130', 'B', 'To explain why she needs to leave soon', '2', '33', null);
INSERT INTO `q_listening_option` VALUES ('131', 'C', 'To illustrate a point that appears in his report', '3', '33', null);
INSERT INTO `q_listening_option` VALUES ('132', 'D', 'To emphasize the importance of good health', '4', '33', null);
INSERT INTO `q_listening_option` VALUES ('133', 'A', 'Help him collect more data in other areas of the state', '1', '34', null);
INSERT INTO `q_listening_option` VALUES ('134', 'B', 'Submit his research findings for publication', '2', '34', null);
INSERT INTO `q_listening_option` VALUES ('135', 'C', 'Give him the doctor\'s telephone number', '3', '34', null);
INSERT INTO `q_listening_option` VALUES ('136', 'D', 'Review the first version of his report', '4', '34', null);
INSERT INTO `q_listening_option` VALUES ('137', 'A', 'To question the length of the paper', '1', '35', null);
INSERT INTO `q_listening_option` VALUES ('138', 'B', 'To offer encouragement', '2', '35', null);
INSERT INTO `q_listening_option` VALUES ('139', 'C', 'To dispute the data sources', '3', '35', null);
INSERT INTO `q_listening_option` VALUES ('140', 'D', 'To explain a theory', '4', '35', null);
INSERT INTO `q_listening_option` VALUES ('141', 'A', 'The development of motor skills in children', '1', '36', null);
INSERT INTO `q_listening_option` VALUES ('142', 'B', 'How psychologists measure muscle activity in the throat', '2', '36', null);
INSERT INTO `q_listening_option` VALUES ('143', 'C', 'A theory about the relationship between muscle activity and thinking', '3', '36', null);
INSERT INTO `q_listening_option` VALUES ('144', 'D', 'A study on deaf people\'s problem-solving techniques', '4', '36', null);
INSERT INTO `q_listening_option` VALUES ('145', 'A', 'To give an example of a laryngeal habit', '1', '37', null);
INSERT INTO `q_listening_option` VALUES ('146', 'B', 'To explain the meaning of a term', '2', '37', null);
INSERT INTO `q_listening_option` VALUES ('147', 'C', 'To explain why he is discussing laryngeal habits', '3', '37', null);
INSERT INTO `q_listening_option` VALUES ('148', 'D', 'To remind students of a point he had discussed previously', '4', '37', null);
INSERT INTO `q_listening_option` VALUES ('149', 'A', 'It is not possible to study their thinking habits', '1', '38', null);
INSERT INTO `q_listening_option` VALUES ('150', 'B', 'They exhibit laryngeal habits', '2', '38', null);
INSERT INTO `q_listening_option` VALUES ('151', 'C', 'The muscles in their hands move when they solve problems', '3', '38', null);
INSERT INTO `q_listening_option` VALUES ('152', 'D', 'They do not exhibit ideomotor action', '4', '38', null);
INSERT INTO `q_listening_option` VALUES ('153', 'A', 'A study on problem solving took place there', '1', '39', null);
INSERT INTO `q_listening_option` VALUES ('154', 'B', 'Students should go there to read more about behaviorism', '2', '39', null);
INSERT INTO `q_listening_option` VALUES ('155', 'C', 'Students\' eyes will turn toward it if they think about it', '3', '39', null);
INSERT INTO `q_listening_option` VALUES ('156', 'D', 'He learned aboutWilliam James\' concept of thinking there', '4', '39', null);
INSERT INTO `q_listening_option` VALUES ('157', 'A', 'An action people make that they are not aware of', '1', '40', null);
INSERT INTO `q_listening_option` VALUES ('158', 'B', 'That behaviorists are not really scientists', '2', '40', null);
INSERT INTO `q_listening_option` VALUES ('159', 'C', 'How psychologists study children', '3', '40', null);
INSERT INTO `q_listening_option` VALUES ('160', 'D', 'A method for remembering locations', '4', '40', null);
INSERT INTO `q_listening_option` VALUES ('161', 'A', 'Similarities between cotton fibers and manila hemp fibers', '1', '41', null);
INSERT INTO `q_listening_option` VALUES ('162', 'B', 'Various types of manila hemp fibers', '2', '41', null);
INSERT INTO `q_listening_option` VALUES ('163', 'C', 'The economic importance of Manila hemp fibers', '3', '41', null);
INSERT INTO `q_listening_option` VALUES ('164', 'D', 'A use of Manila hemp fibers', '4', '41', null);
INSERT INTO `q_listening_option` VALUES ('165', 'A', 'To tell the class a joke', '1', '42', null);
INSERT INTO `q_listening_option` VALUES ('166', 'B', 'To apologize for not completing some work', '2', '42', null);
INSERT INTO `q_listening_option` VALUES ('167', 'C', 'To introduce the topic of the lecture', '3', '42', null);
INSERT INTO `q_listening_option` VALUES ('168', 'D', 'To encourage students to ask about her trip', '4', '42', null);
INSERT INTO `q_listening_option` VALUES ('169', 'A', 'It is a commercial brand name', '1', '43', null);
INSERT INTO `q_listening_option` VALUES ('170', 'B', 'Part of the name is inappropriate', '2', '43', null);
INSERT INTO `q_listening_option` VALUES ('171', 'C', 'The name has recently changed', '3', '43', null);
INSERT INTO `q_listening_option` VALUES ('172', 'D', 'The name was first used in the 1940\'s', '4', '43', null);
INSERT INTO `q_listening_option` VALUES ('173', 'A', 'To demonstrate a disadvantage of steel cables', '1', '44', null);
INSERT INTO `q_listening_option` VALUES ('174', 'B', 'To give an example of the creative use of color', '2', '44', null);
INSERT INTO `q_listening_option` VALUES ('175', 'C', 'To show that steel cables are able to resist salt water', '3', '44', null);
INSERT INTO `q_listening_option` VALUES ('176', 'D', 'To give an example of a use of Manila hemp', '4', '44', null);
INSERT INTO `q_listening_option` VALUES ('177', 'A', 'Manila hemp was cheaper', '1', '45', null);
INSERT INTO `q_listening_option` VALUES ('178', 'B', 'Manila hemp was easier to produce', '2', '45', null);
INSERT INTO `q_listening_option` VALUES ('179', 'C', 'Manila hemp is more resistant to salt water', '3', '45', null);
INSERT INTO `q_listening_option` VALUES ('180', 'D', 'Manila hemp is lighter in weight', '4', '45', null);
INSERT INTO `q_listening_option` VALUES ('181', 'A', 'Their courses for next semester', '1', '46', null);
INSERT INTO `q_listening_option` VALUES ('182', 'B', 'Their plans for the weekend', '2', '46', null);
INSERT INTO `q_listening_option` VALUES ('183', 'C', 'A poetry club', '3', '46', null);
INSERT INTO `q_listening_option` VALUES ('184', 'D', 'A class assignment', '4', '46', null);
INSERT INTO `q_listening_option` VALUES ('185', 'A', 'Register for classes', '1', '47', null);
INSERT INTO `q_listening_option` VALUES ('186', 'B', 'Finish writing his master\'s thesis', '2', '47', null);
INSERT INTO `q_listening_option` VALUES ('187', 'C', 'Leave his job at the coffee shop', '3', '47', null);
INSERT INTO `q_listening_option` VALUES ('188', 'D', 'Take a short vacation', '4', '47', null);
INSERT INTO `q_listening_option` VALUES ('189', 'A', 'To find out how often the club meets', '1', '48', null);
INSERT INTO `q_listening_option` VALUES ('190', 'B', 'To inform her that the date of the next meeting has changed', '2', '48', null);
INSERT INTO `q_listening_option` VALUES ('191', 'C', 'To complain that not enough people are reading their poems', '3', '48', null);
INSERT INTO `q_listening_option` VALUES ('192', 'D', 'To encourage her to attend', '4', '48', null);
INSERT INTO `q_listening_option` VALUES ('193', 'A', 'She is looking forward to hearing her professor\'s poetry', '1', '49', null);
INSERT INTO `q_listening_option` VALUES ('194', 'B', 'She is interested in attending but she has no time', '2', '49', null);
INSERT INTO `q_listening_option` VALUES ('195', 'C', 'She thinks the poetry that is read there is not very good', '3', '49', null);
INSERT INTO `q_listening_option` VALUES ('196', 'D', 'She used to participate but did not enjoy it', '4', '49', null);
INSERT INTO `q_listening_option` VALUES ('197', 'A', 'They will both take courses', '1', '50', null);
INSERT INTO `q_listening_option` VALUES ('198', 'B', 'They will both have full-time jobs', '2', '50', null);
INSERT INTO `q_listening_option` VALUES ('199', 'C', 'They will travel to England together', '3', '50', null);
INSERT INTO `q_listening_option` VALUES ('200', 'D', 'They will teach a class together', '4', '50', null);
INSERT INTO `q_listening_option` VALUES ('201', 'A', 'To illustrate the importance of extrinsic values', '1', '51', null);
INSERT INTO `q_listening_option` VALUES ('202', 'B', 'To explain Aristotle\'s views about the importance of teaching', '2', '51', null);
INSERT INTO `q_listening_option` VALUES ('203', 'C', 'To explain why people change what they value', '3', '51', null);
INSERT INTO `q_listening_option` VALUES ('204', 'D', 'To discuss Aristotle\'s views about human happiness', '4', '51', null);
INSERT INTO `q_listening_option` VALUES ('205', 'A', 'Teaching', '1', '52', null);
INSERT INTO `q_listening_option` VALUES ('206', 'B', 'Exercise', '2', '52', null);
INSERT INTO `q_listening_option` VALUES ('207', 'C', 'Health', '3', '52', null);
INSERT INTO `q_listening_option` VALUES ('208', 'D', 'Playing a musical instrument', '4', '52', null);
INSERT INTO `q_listening_option` VALUES ('209', 'A', 'Because it is so difficult for people to attain', '1', '53', null);
INSERT INTO `q_listening_option` VALUES ('210', 'B', 'Because it is valued for its own sake by all people', '2', '53', null);
INSERT INTO `q_listening_option` VALUES ('211', 'C', 'Because it is a means to a productive life', '3', '53', null);
INSERT INTO `q_listening_option` VALUES ('212', 'D', 'Because most people agree about what happiness is', '4', '53', null);
INSERT INTO `q_listening_option` VALUES ('213', 'A', 'Fame cannot be obtained without help from other people', '1', '54', null);
INSERT INTO `q_listening_option` VALUES ('214', 'B', 'Fame cannot be obtained by all people', '2', '54', null);
INSERT INTO `q_listening_option` VALUES ('215', 'C', 'Fame does not last forever', '3', '54', null);
INSERT INTO `q_listening_option` VALUES ('216', 'D', 'People cannot share their fame with other people', '4', '54', null);
INSERT INTO `q_listening_option` VALUES ('217', 'A', 'Teaching is not a highly valued profession in society', '1', '55', null);
INSERT INTO `q_listening_option` VALUES ('218', 'B', 'She may change professions in order to earn more money', '2', '55', null);
INSERT INTO `q_listening_option` VALUES ('219', 'C', 'The reason she is a teacher has little to do with her salary', '3', '55', null);
INSERT INTO `q_listening_option` VALUES ('220', 'D', 'More people would become teachers if the salary were higher', '4', '55', null);
INSERT INTO `q_listening_option` VALUES ('221', 'A', 'A law of gravitation', '1', '56', null);
INSERT INTO `q_listening_option` VALUES ('222', 'B', 'An estimate of the distance between Mars and Jupiter', '2', '56', null);
INSERT INTO `q_listening_option` VALUES ('223', 'C', 'A prediction of how many asteroids there are', '3', '56', null);
INSERT INTO `q_listening_option` VALUES ('224', 'D', 'A pattern in the spacing of the planets', '4', '56', null);
INSERT INTO `q_listening_option` VALUES ('225', 'A', 'To describe the size of the asteroids', '1', '57', null);
INSERT INTO `q_listening_option` VALUES ('226', 'B', 'To explain how the asteroids belt was discovered', '2', '57', null);
INSERT INTO `q_listening_option` VALUES ('227', 'C', 'To explain how gravitational forces influence the planets', '3', '57', null);
INSERT INTO `q_listening_option` VALUES ('228', 'D', 'To describe the impact of telescopes on astronomy', '4', '57', null);
INSERT INTO `q_listening_option` VALUES ('229', 'A', 'By demonstrating how it is derived mathematically', '1', '58', null);
INSERT INTO `q_listening_option` VALUES ('230', 'B', 'By describing the discovery of Uranus', '2', '58', null);
INSERT INTO `q_listening_option` VALUES ('231', 'C', 'By drawing attention to the inaccuracy of a certain pattern', '3', '58', null);
INSERT INTO `q_listening_option` VALUES ('232', 'D', 'By telling the names of several of the asteroids', '4', '58', null);
INSERT INTO `q_listening_option` VALUES ('233', 'A', 'It is farther from the Sun than Uranus', '1', '59', null);
INSERT INTO `q_listening_option` VALUES ('234', 'B', 'Bode believed it was made up of small stars', '2', '59', null);
INSERT INTO `q_listening_option` VALUES ('235', 'C', 'It is located where people expected to find a planet', '3', '59', null);
INSERT INTO `q_listening_option` VALUES ('236', 'D', 'Ceres is the only one of the asteroids that can be seen without a telescope', '4', '59', null);
INSERT INTO `q_listening_option` VALUES ('237', 'A', 'To introduce an alternative application of Bode\'s Law', '1', '60', null);
INSERT INTO `q_listening_option` VALUES ('238', 'B', 'To give an example of what Bode\'s law cannot explain', '2', '60', null);
INSERT INTO `q_listening_option` VALUES ('239', 'C', 'To describe the limitations of gravitational theory', '3', '60', null);
INSERT INTO `q_listening_option` VALUES ('240', 'D', 'To contrast Bode\'s Law with a real scientific law', '4', '60', null);
INSERT INTO `q_listening_option` VALUES ('241', 'A', 'To notify the university of her change of address', '1', '61', null);
INSERT INTO `q_listening_option` VALUES ('242', 'B', 'To find out where her physics class is being held', '2', '61', null);
INSERT INTO `q_listening_option` VALUES ('243', 'C', 'To get directions to the science building', '3', '61', null);
INSERT INTO `q_listening_option` VALUES ('244', 'D', 'To complain about her physics class being canceled', '4', '61', null);
INSERT INTO `q_listening_option` VALUES ('245', 'A', 'She threw it away by mistake', '1', '62', null);
INSERT INTO `q_listening_option` VALUES ('246', 'B', 'Her roommate forgot to give it to her', '2', '62', null);
INSERT INTO `q_listening_option` VALUES ('247', 'C', 'It was sent to her old mailing address', '3', '62', null);
INSERT INTO `q_listening_option` VALUES ('248', 'D', 'It was sent to another student by mistake', '4', '62', null);
INSERT INTO `q_listening_option` VALUES ('249', 'A', 'Not enough students signed up to take the class', '1', '63', null);
INSERT INTO `q_listening_option` VALUES ('250', 'B', 'No professors were available to teach the class', '2', '63', null);
INSERT INTO `q_listening_option` VALUES ('251', 'C', 'The university changed its requirements for physics students', '3', '63', null);
INSERT INTO `q_listening_option` VALUES ('252', 'D', 'There were no classrooms available in the science building at the hour', '4', '63', null);
INSERT INTO `q_listening_option` VALUES ('253', 'A', 'Consult with her advisor about her class schedule', '1', '64', null);
INSERT INTO `q_listening_option` VALUES ('254', 'B', 'Check with the registrar\'s office about the location of the class', '2', '64', null);
INSERT INTO `q_listening_option` VALUES ('255', 'C', 'Register for her classes early', '3', '64', null);
INSERT INTO `q_listening_option` VALUES ('256', 'D', 'Call the physics department', '4', '64', null);
INSERT INTO `q_listening_option` VALUES ('257', 'A', 'He know the physics class has been canceled', '1', '65', null);
INSERT INTO `q_listening_option` VALUES ('258', 'B', 'He is not sure where the science building is', '2', '65', null);
INSERT INTO `q_listening_option` VALUES ('259', 'C', 'Many of the room assignments have been changed', '3', '65', null);
INSERT INTO `q_listening_option` VALUES ('260', 'D', 'The women can check for herself where her class is', '4', '65', null);
INSERT INTO `q_listening_option` VALUES ('261', 'A', 'Major changes in the migratory patterns of hummingbirds', '1', '66', null);
INSERT INTO `q_listening_option` VALUES ('262', 'B', 'The adaptation of hummingbirds to urban environments', '2', '66', null);
INSERT INTO `q_listening_option` VALUES ('263', 'C', 'Concern about the reduction of hummingbird habitat', '3', '66', null);
INSERT INTO `q_listening_option` VALUES ('264', 'D', 'The impact of ecotourism on hummingbird populations', '4', '66', null);
INSERT INTO `q_listening_option` VALUES ('265', 'A', 'An increase in the ecotourism industry', '1', '67', null);
INSERT INTO `q_listening_option` VALUES ('266', 'B', 'An increase in the use of land to raise crops and cattle', '2', '67', null);
INSERT INTO `q_listening_option` VALUES ('267', 'C', 'A decrease in banding studies', '3', '67', null);
INSERT INTO `q_listening_option` VALUES ('268', 'D', 'A decrease in the distance traveled during migration', '4', '67', null);
INSERT INTO `q_listening_option` VALUES ('269', 'A', 'They have built a series of hummingbird feeding stations', '1', '68', null);
INSERT INTO `q_listening_option` VALUES ('270', 'B', 'They have supported new laws that punish polluters of wildlife habitats', '2', '68', null);
INSERT INTO `q_listening_option` VALUES ('271', 'C', 'They have replanted native flowers in once polluted areas', '3', '68', null);
INSERT INTO `q_listening_option` VALUES ('272', 'D', 'They have learned to identify various hummingbird species', '4', '68', null);
INSERT INTO `q_listening_option` VALUES ('273', 'A', 'Receiving radio signals from electronic tracking devices', '1', '69', null);
INSERT INTO `q_listening_option` VALUES ('274', 'B', 'Being contacted by people who recapture banded birds', '2', '69', null);
INSERT INTO `q_listening_option` VALUES ('275', 'C', 'Counting the birds that return to the same region every year', '3', '69', null);
INSERT INTO `q_listening_option` VALUES ('276', 'D', 'Comparing old and young birds\'migration routes', '4', '69', null);
INSERT INTO `q_listening_option` VALUES ('277', 'A', 'Hummingbirds have totally disappeared from some countries due to recent habitat destruction', '1', '70', null);
INSERT INTO `q_listening_option` VALUES ('278', 'B', 'Programs to replant flowers native to hummingbird habitats are not succeeding', '2', '70', null);
INSERT INTO `q_listening_option` VALUES ('279', 'C', 'Some groups of hummingbirds have changed their migration patterns', '3', '70', null);
INSERT INTO `q_listening_option` VALUES ('280', 'D', 'Some plant species pollinated by hummingbirds have become extinct', '4', '70', null);
INSERT INTO `q_listening_option` VALUES ('281', 'A', 'To discuss the style of an early filmmaker', '1', '71', null);
INSERT INTO `q_listening_option` VALUES ('282', 'B', 'To describe different types of filmmaking in the 1930s', '2', '71', null);
INSERT INTO `q_listening_option` VALUES ('283', 'C', 'To discuss the emergence of the documentary film', '3', '71', null);
INSERT INTO `q_listening_option` VALUES ('284', 'D', 'To describe Painleve\'s influence on today\'s science-fiction films', '4', '71', null);
INSERT INTO `q_listening_option` VALUES ('285', 'A', 'They do not have sound', '1', '72', null);
INSERT INTO `q_listening_option` VALUES ('286', 'B', 'They are filmed underwater', '2', '72', null);
INSERT INTO `q_listening_option` VALUES ('287', 'C', 'They are easy to understand', '3', '72', null);
INSERT INTO `q_listening_option` VALUES ('288', 'D', 'They are difficult to categorize', '4', '72', null);
INSERT INTO `q_listening_option` VALUES ('289', 'A', 'They show animals out of their natural habitat', '1', '73', null);
INSERT INTO `q_listening_option` VALUES ('290', 'B', 'They depict animals as having both human and animal characteristics', '2', '73', null);
INSERT INTO `q_listening_option` VALUES ('291', 'C', 'The narration is scientific and difficult to understand', '3', '73', null);
INSERT INTO `q_listening_option` VALUES ('292', 'D', 'The audiences of the 1920s and 1930s were not used to films shot underwater', '4', '73', null);
INSERT INTO `q_listening_option` VALUES ('293', 'A', 'To explain that they were difficult to film in the 1930s', '1', '74', null);
INSERT INTO `q_listening_option` VALUES ('294', 'B', 'To point out that Cousteau made documentaries about them', '2', '74', null);
INSERT INTO `q_listening_option` VALUES ('295', 'C', 'To illustrate Pianleve\'s fascination with unusual animals', '3', '74', null);
INSERT INTO `q_listening_option` VALUES ('296', 'D', 'To explain why Painleve\'s underwater films were not successful', '4', '74', null);
INSERT INTO `q_listening_option` VALUES ('297', 'A', 'To explain how Painleve influenced Cousteau', '1', '75', null);
INSERT INTO `q_listening_option` VALUES ('298', 'B', 'To emphasize the uniqueness of Painleve\'s filming style', '2', '75', null);
INSERT INTO `q_listening_option` VALUES ('299', 'C', 'To emphasize the artistic value of Cousteau\'s documentary films', '3', '75', null);
INSERT INTO `q_listening_option` VALUES ('300', 'D', 'To demonstrate the superiority of Painleve\'s filmmaking equipment', '4', '75', null);
INSERT INTO `q_listening_option` VALUES ('301', 'A', 'To ask about a class assignment', '1', '76', null);
INSERT INTO `q_listening_option` VALUES ('302', 'B', 'To find out about a mid-semester project', '2', '76', null);
INSERT INTO `q_listening_option` VALUES ('303', 'C', 'To get information about summer jobs', '3', '76', null);
INSERT INTO `q_listening_option` VALUES ('304', 'D', 'To discuss ways to improve his grade', '4', '76', null);
INSERT INTO `q_listening_option` VALUES ('305', 'A', 'A farmhouse', '1', '77', null);
INSERT INTO `q_listening_option` VALUES ('306', 'B', 'A pottery factory', '2', '77', null);
INSERT INTO `q_listening_option` VALUES ('307', 'C', 'A clothing store', '3', '77', null);
INSERT INTO `q_listening_option` VALUES ('308', 'D', 'A bottle-manufacturing plant', '4', '77', null);
INSERT INTO `q_listening_option` VALUES ('309', 'A', 'Off-campus travel is paid off', '1', '78', null);
INSERT INTO `q_listening_option` VALUES ('310', 'B', 'Students can leave class early', '2', '78', null);
INSERT INTO `q_listening_option` VALUES ('311', 'C', 'The location is convenient', '3', '78', null);
INSERT INTO `q_listening_option` VALUES ('312', 'D', 'It fulfills a graduation requirement', '4', '78', null);
INSERT INTO `q_listening_option` VALUES ('313', 'A', 'Offering extra class credit', '1', '79', null);
INSERT INTO `q_listening_option` VALUES ('314', 'B', 'Paying the students for their time', '2', '79', null);
INSERT INTO `q_listening_option` VALUES ('315', 'C', 'Asking for student volunteers from outside her class', '3', '79', null);
INSERT INTO `q_listening_option` VALUES ('316', 'D', 'Providing flexible work schedules', '4', '79', null);
INSERT INTO `q_listening_option` VALUES ('317', 'A', 'The name of the senior researcher', '1', '80', null);
INSERT INTO `q_listening_option` VALUES ('318', 'B', 'What book he needs to read before the next lecture', '2', '80', null);
INSERT INTO `q_listening_option` VALUES ('319', 'C', 'When the train session will be scheduled', '3', '80', null);
INSERT INTO `q_listening_option` VALUES ('320', 'D', 'Where the project is located', '4', '80', null);
INSERT INTO `q_listening_option` VALUES ('321', 'A', 'The oldest known cave art', '1', '81', null);
INSERT INTO `q_listening_option` VALUES ('322', 'B', 'How ancient cave art is dated', '2', '81', null);
INSERT INTO `q_listening_option` VALUES ('323', 'C', 'The homes of Paleolithic humans', '3', '81', null);
INSERT INTO `q_listening_option` VALUES ('324', 'D', 'How Paleolithic humans thought about animals', '4', '81', null);
INSERT INTO `q_listening_option` VALUES ('325', 'A', 'To describe her reaction to seeing the paintings', '1', '82', null);
INSERT INTO `q_listening_option` VALUES ('326', 'B', 'To explain the universal appeal for the Chauvet paintings', '2', '82', null);
INSERT INTO `q_listening_option` VALUES ('327', 'C', 'To demonstrate the size of most Paleolithic cave art', '3', '82', null);
INSERT INTO `q_listening_option` VALUES ('328', 'D', 'To emphasize his point about the age of Chauvet paintings', '4', '82', null);
INSERT INTO `q_listening_option` VALUES ('329', 'A', 'It is extremely well done', '1', '83', null);
INSERT INTO `q_listening_option` VALUES ('330', 'B', 'It probably reflected artists\' religious beliefs', '2', '83', null);
INSERT INTO `q_listening_option` VALUES ('331', 'C', 'It is less sophisticated than the art at Lascaux and Altamira', '3', '83', null);
INSERT INTO `q_listening_option` VALUES ('332', 'D', 'It is probably not much older than the art at Lascaux and Altamira', '4', '83', null);
INSERT INTO `q_listening_option` VALUES ('333', 'A', 'They suggest that Paleolithic people cooked their food in the cave', '1', '84', null);
INSERT INTO `q_listening_option` VALUES ('334', 'B', 'They prove that people came to the cave long after the paintings were made', '2', '84', null);
INSERT INTO `q_listening_option` VALUES ('335', 'C', 'They show how much light the Paleolithic artists needed for their work', '3', '84', null);
INSERT INTO `q_listening_option` VALUES ('336', 'D', 'They were used in recent times to date the paintings', '4', '84', null);
INSERT INTO `q_listening_option` VALUES ('337', 'A', 'Most of them are horses', '1', '85', null);
INSERT INTO `q_listening_option` VALUES ('338', 'B', 'Many of them are dangerous', '2', '85', null);
INSERT INTO `q_listening_option` VALUES ('339', 'C', 'Many of them are shown alongside humans', '3', '85', null);
INSERT INTO `q_listening_option` VALUES ('340', 'D', 'All of them are species that are still found in France', '4', '85', null);
INSERT INTO `q_listening_option` VALUES ('341', 'A', 'Different ways of magnifying the spectrum of a star', '1', '86', null);
INSERT INTO `q_listening_option` VALUES ('342', 'B', 'How a chemical element was first discovered on the Sun', '2', '86', null);
INSERT INTO `q_listening_option` VALUES ('343', 'C', 'How astronomers identify the chemical elements in a star', '3', '86', null);
INSERT INTO `q_listening_option` VALUES ('344', 'D', 'Why the spectra of different stars are composed of different colors', '4', '86', null);
INSERT INTO `q_listening_option` VALUES ('345', 'A', 'It is defined incorrectly in the textbooks', '1', '87', null);
INSERT INTO `q_listening_option` VALUES ('346', 'B', 'It was first used in the nineteenth century', '2', '87', null);
INSERT INTO `q_listening_option` VALUES ('347', 'C', 'It is rarely used by astronomers', '3', '87', null);
INSERT INTO `q_listening_option` VALUES ('348', 'D', 'It does not refer only to harmful energy', '4', '87', null);
INSERT INTO `q_listening_option` VALUES ('349', 'A', 'The stars are approximately the same distance from the Earth', '1', '88', null);
INSERT INTO `q_listening_option` VALUES ('350', 'B', 'The stars probably have some chemical elements in common', '2', '88', null);
INSERT INTO `q_listening_option` VALUES ('351', 'C', 'The stars have nearly the same brightness', '3', '88', null);
INSERT INTO `q_listening_option` VALUES ('352', 'D', 'The stars are probably of the same size', '4', '88', null);
INSERT INTO `q_listening_option` VALUES ('353', 'A', 'To cause an element to emit light', '1', '89', null);
INSERT INTO `q_listening_option` VALUES ('354', 'B', 'To study an element in combination with other elements', '2', '89', null);
INSERT INTO `q_listening_option` VALUES ('355', 'C', 'To remove impurities from the element', '3', '89', null);
INSERT INTO `q_listening_option` VALUES ('356', 'D', 'To measure an element\'s resistance to heat', '4', '89', null);
INSERT INTO `q_listening_option` VALUES ('357', 'A', 'He is about to provide some background information', '1', '90', null);
INSERT INTO `q_listening_option` VALUES ('358', 'B', 'He is about to repeat what he just said', '2', '90', null);
INSERT INTO `q_listening_option` VALUES ('359', 'C', 'He intends to focus on the history of astronomy', '3', '90', null);
INSERT INTO `q_listening_option` VALUES ('360', 'D', 'He intends to explain two different points of view', '4', '90', null);

-- ----------------------------
-- Table structure for q_listening_passage
-- ----------------------------
DROP TABLE IF EXISTS `q_listening_passage`;
CREATE TABLE `q_listening_passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audio_url` varchar(255) DEFAULT NULL COMMENT '阅读音频的外链',
  `image_url` varchar(255) DEFAULT NULL COMMENT '听力播放音频时背景图片的url',
  `title` varchar(255) DEFAULT NULL,
  `title_cn` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_listening_passage
-- ----------------------------
INSERT INTO `q_listening_passage` VALUES ('1', '/static/toefl/listening_audio/xpo/tpo1/listening_passage_1_0812b0da91a8ba2f306db0402477d5f3.mp3', '/static/toefl/listening-topic-img/TPO/TPO01/TPO-01-C1.jpg', 'Find articles in the library', '在图书馆找文献资料', null);
INSERT INTO `q_listening_passage` VALUES ('2', '/static/toefl/listening_audio/xpo/tpo1/listening_passage_2_1a117cbad2e6eedb8f71adf42bab04e0.mp3', '/static/toefl/listening-topic-img/TPO/TPO01/TPO-01-L1.jpg', 'Rose Frantzen', '画家弗兰森', null);
INSERT INTO `q_listening_passage` VALUES ('3', '/static/toefl/listening_audio/xpo/tpo1/listening_passage_3_789430f9854dae8ec018e1d60db5db4c.mp3', '/static/toefl/listening-topic-img/TPO/TPO01/TPO-01-L2.jpg', 'Uranium-Lead Dating', '用铀来测定地质年代', null);
INSERT INTO `q_listening_passage` VALUES ('4', '/static/toefl/listening_audio/xpo/tpo1/listening_passage_4_593bfacfdeb2fd164cd48d36b20e887e.mp3', '/static/toefl/listening-topic-img/TPO/TPO01/TPO-01-C2.jpg', 'Classroom observation and feedback', '听课感受与分享', null);
INSERT INTO `q_listening_passage` VALUES ('5', '/static/toefl/listening_audio/xpo/tpo1/listening_passage_5_55840ceae0c05bdafbd027eaf60e397a.mp3', '/static/toefl/listening-topic-img/TPO/TPO01/TPO-01-L3.jpg', 'Catalhoyuk', '农业遗址卡特胡约', null);
INSERT INTO `q_listening_passage` VALUES ('6', '/static/toefl/listening_audio/xpo/tpo1/listening_passage_6_9d21494b7d67a599712036b8530d6c1d.mp3', '/static/toefl/listening-topic-img/TPO/TPO01/TPO-01-L4.jpg', 'Marmots', '两种土拨鼠的生活习性', null);
INSERT INTO `q_listening_passage` VALUES ('7', '/static/toefl/listening_audio/xpo/tpo02/tpo_02_c1_8d2f3304b87d298d685d1bd9408d2468.mp3', '/static/toefl/listening-topic-img/TPO/TPO02/TPO-02-C1.jpg', 'Write up the research project', '如何写研究报告', null);
INSERT INTO `q_listening_passage` VALUES ('8', '/static/toefl/listening_audio/xpo/tpo02/tpo_02_l1_1023647c7598068a7fd6b857cbf3bbd1.mp3', '/static/toefl/listening-topic-img/TPO/TPO02/TPO-02-L1.jpg', 'Behaviorism', '肌肉运动和思维的关系', null);
INSERT INTO `q_listening_passage` VALUES ('9', '/static/toefl/listening_audio/xpo/tpo02/tpo_02_l2_cbe0473e838fc59a8823e20ad3f905d4.mp3', '/static/toefl/listening-topic-img/TPO/TPO02/TPO-02-L2.jpg', 'Manila Hemp', '马尼拉麻的用途', null);
INSERT INTO `q_listening_passage` VALUES ('10', '/static/toefl/listening_audio/xpo/tpo02/tpo_02_c2_845b53a7496882fafd2e2df251bca7d5.mp3', '/static/toefl/listening-topic-img/TPO/TPO02/TPO-02-C2.jpg', 'Poetry club activity and time management', '诗社活动与课余安排', null);
INSERT INTO `q_listening_passage` VALUES ('11', '/static/toefl/listening_audio/xpo/tpo02/tpo_02_l3_22cbe3e4dfabc82b939a5f0577731d4c.mp3', '/static/toefl/listening-topic-img/TPO/TPO02/TPO-02-L3.jpg', 'Aristotle', '亚里士多德的幸福观', null);
INSERT INTO `q_listening_passage` VALUES ('12', '/static/toefl/listening_audio/xpo/tpo02/tpo_02_l4_e6b8c2c4b3dc1f052ea0dc4fae868b8a.mp3', '/static/toefl/listening-topic-img/TPO/TPO02/TPO-02-L4.jpg', 'Bode\'s Law', '行星分布的伯德模式', null);
INSERT INTO `q_listening_passage` VALUES ('13', '/static/toefl/listening_audio/xpo/tpo03/tpo_03_c1_d42a62bd5b87ab8e2e188d90e32a2e6f.mp3', '/static/toefl/listening-topic-img/TPO/TPO03/TPO-03-C1.jpg', 'Find where to take physics classes', '物理课的上课地点', null);
INSERT INTO `q_listening_passage` VALUES ('14', '/static/toefl/listening_audio/xpo/tpo03/tpo_03_l1_855f1fcef1b375341d25407374ec567a.mp3', '/static/toefl/listening-topic-img/TPO/TPO03/TPO-03-L1.jpg', 'Humming Birds', '蜂鸟栖息地的减少', null);
INSERT INTO `q_listening_passage` VALUES ('15', '/static/toefl/listening_audio/xpo/tpo03/tpo_03_l2_b971688e54012842123cb3c0c2557d7e.mp3', '/static/toefl/listening-topic-img/TPO/TPO03/TPO-03-L2.jpg', 'Jean Painlev&eacute;', '潘拉维作品的风格', null);
INSERT INTO `q_listening_passage` VALUES ('16', '/static/toefl/listening_audio/xpo/tpo03/tpo_03_c2_c34376fe08063ac8cb42f98a325248aa.mp3', '/static/toefl/listening-topic-img/TPO/TPO03/TPO-03-C2.jpg', 'Apply for an archaeology project', '申请参加考古研究项目', null);
INSERT INTO `q_listening_passage` VALUES ('17', '/static/toefl/listening_audio/xpo/tpo03/tpo_03_l3_b46096ff69fedb1065b65b966efb6f8a.mp3', '/static/toefl/listening-topic-img/TPO/TPO03/TPO-03-L3.jpg', 'Chauvet Paintings', '肖维洞穴艺术', null);
INSERT INTO `q_listening_passage` VALUES ('18', '/static/toefl/listening_audio/xpo/tpo03/tpo_03_l4_01d7f4c709932b164cd8565949449c99.mp3', '/static/toefl/listening-topic-img/TPO/TPO03/TPO-03-L4.jpg', 'Spectroscopy', '光谱学在天文中的应用', null);

-- ----------------------------
-- Table structure for q_listening_question
-- ----------------------------
DROP TABLE IF EXISTS `q_listening_question`;
CREATE TABLE `q_listening_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `question` text,
  `question_url` varchar(255) DEFAULT NULL,
  `right_answer` varchar(255) DEFAULT NULL,
  `vtype` int(11) DEFAULT NULL COMMENT '1单选、2多选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_listening_question
-- ----------------------------
INSERT INTO `q_listening_question` VALUES ('1', null, '1', 'Why does the student go to see the librarian?', '/static/toefl/listening_audio/xpo/tpo1/listening_1_46027ee9500e5e5b92bbbc1cabdfea85.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('2', null, '2', 'What does the librarian say about the availability of journals and articles in the library?', '/static/toefl/listening_audio/xpo/tpo1/listening_2_ad4b09e1f74bcfc616bb93016b46cb5a.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('3', null, '3', 'What does the librarian suggest the student should do to save time?', '/static/toefl/listening_audio/xpo/tpo1/listening_3_e34229ea9285f0e7a79a9d6a1c4534e8.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('4', null, '4', 'What can be inferred about why the woman decides to use the computer in the library?', '/static/toefl/listening_audio/xpo/tpo1/listening_4_ce763677e127c49c35e78f86eb1d88be.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('5', null, '5', 'Why does the woman say this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo1/listening_5_83a24a368ae19a82447200bc2fb1645b.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('6', null, '1', 'What is the purpose of the lecture?', '/static/toefl/listening_audio/xpo/tpo1/listening_6_0a495aabdbd6d75e464755ca8904eb99.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('7', null, '2', 'What does the professor say about Frantzen\'s painting of a farm scene?', '/static/toefl/listening_audio/xpo/tpo1/listening_7_7b44892a2d1609f22249b63bcf022159.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('8', null, '3', 'Why did Frantzen go to the Sales Barn?', '/static/toefl/listening_audio/xpo/tpo1/listening_8_dfd81530208ccc4bbc099715a3b71c8a.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('9', null, '4', 'What does the professor imply about the painting of the young woman surrounded by pumpkins?', '/static/toefl/listening_audio/xpo/tpo1/listening_9_e03643a17c69c2bff7442ab606d0610b.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('10', null, '5', 'Why does the professor discuss Frantzen\'s difficulties as a young painter?', '/static/toefl/listening_audio/xpo/tpo1/listening_10_d85631b1e150d96b11146c7b48336e03.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('11', null, '1', 'What does the professor mainly discuss?', '/static/toefl/listening_audio/xpo/tpo1/listening_12_750b1a919d79bb6c6c2f5c7c4214b8aa.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('12', null, '2', 'Before the use of uranium-lead analysis, where did most geologists think the Grand Canyon sandstone came from?', '/static/toefl/listening_audio/xpo/tpo1/listening_13_bf0e0a084baf061f08384d09f041c71d.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('13', null, '3', 'According to the professor, what change has caused uranium-lead dating to gain popularity recently?', '/static/toefl/listening_audio/xpo/tpo1/listening_15_5ab0e0450460550bdb83d566a1513bbc.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('14', null, '4', 'Why does the professor talk about the breaking apart of Earth\'s continents?', '/static/toefl/listening_audio/xpo/tpo1/listening_16_0efad316a79e46d1a03d5dea77e23b01.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('15', null, '5', 'What does the professor imply when he says this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo1/listening_17_9b95d2a0f2955ecb0321fef4b85f7889.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('16', null, '1', 'What is the conversation mainly about', '/static/toefl/listening_audio/xpo/tpo1/listening_18_8f69c43324a5e28532c2471775642d03.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('17', null, '2', 'What is Matthew\'s opinion about observing Mr. Grabell\'s third-grade class?', '/static/toefl/listening_audio/xpo/tpo1/listening_19_af0c8bf94dc78af8efa9558b9f1f90b4.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('18', null, '3', 'Why does Matthew mention Greek and Roman mythology?', '/static/toefl/listening_audio/xpo/tpo1/listening_20_94fe01facdc9c01dc2c6a97310708f29.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('19', null, '4', 'What important skills did Mr.Grabell introduce to his third-grade class?', '/static/toefl/listening_audio/xpo/tpo1/listening_21_93689643fd6260639cdca43f501e36f1.mp3', 'B@D@E', null);
INSERT INTO `q_listening_question` VALUES ('20', null, '5', 'What will Matthew probably do in next Wednesday\'s class?', '/static/toefl/listening_audio/xpo/tpo1/listening_22_0c754deb2736d589fa6d5ac50de9c8ca.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('21', null, '1', 'What is the lecture mainly about?', '/static/toefl/listening_audio/xpo/tpo1/listening_23_dbd2f7b107384f63b6a0b31f95c2548a.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('22', null, '2', 'What does the professor imply about the tools used by the people of Catalhoyuk?', '/static/toefl/listening_audio/xpo/tpo1/listening_24_a5d63dc69bf353a543643de5bf673216.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('23', null, '3', 'What does the professor say about the entrances to the horses in Catalhoyuk?', '/static/toefl/listening_audio/xpo/tpo1/listening_25_42d36b0b935f2fd4cfaf5c06c272a5bb.mp3', 'A@C', null);
INSERT INTO `q_listening_question` VALUES ('24', null, '4', 'What does the professor say about Catalhoyuk graves?', '/static/toefl/listening_audio/xpo/tpo1/listening_26_541aec906eeb3cd0d3c9943c647caaaa.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('25', null, '5', 'What does the professor think of the idea that the inhabitants of Catalhoyuk deliberately arranged their house so that they could live near their ancestors\' graves?', '/static/toefl/listening_audio/xpo/tpo1/listening_27_1fdd0a3f86584caf0fd0aa95202a4a3b.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('26', null, '1', 'What is the main topic of the lecture', '/static/toefl/listening_audio/xpo/tpo1/listening_29_605c1f450eee1bdb629105600926ca6e.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('27', null, '2', 'According to the case study, why are marmots ideal for observation', '/static/toefl/listening_audio/xpo/tpo1/listening_30_1118e7bb7c671323af79e6e59ae58f54.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('28', null, '3', 'What reason does the professor give for the difference in marmot behaviour patterns?', '/static/toefl/listening_audio/xpo/tpo1/listening_32_fdc82e1ea7fd97fa2cf8c1dc8831925a.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('29', null, '4', 'Why does the professor say this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo1/listening_33_94f0eb216716984264da5991b8c406de.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('30', null, '5', 'Why does the professor say this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo1/listening_34_6b11c849f4632c0a914a688d2f330eb8.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('31', null, '1', 'Why does the man go to see his professor?', '/static/toefl/listening_audio/xpo/tpo02/listening_1_7c211c0aba342c5fa459c89075ddc01c.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('32', null, '2', 'What information will the man include in his report?', '/static/toefl/listening_audio/xpo/tpo02/listening_2_cf29aa55b52e0f2f22849c398160036a.mp3', 'A@B@A@A', null);
INSERT INTO `q_listening_question` VALUES ('33', null, '3', 'Why does the professor tell the man about the appointment at the doctor\'s office?', '/static/toefl/listening_audio/xpo/tpo02/listening_3_0139f8ad04c4c07d05df55c024492173.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('34', null, '4', 'What does the professor offer to do for the man?', '/static/toefl/listening_audio/xpo/tpo02/listening_4_5520ea01e87fcc8def0ce2834404b34b.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('35', null, '5', 'Why does the professor say this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo02/listening_5_716d9bf3b9aa2c39d3077fa9e269837a.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('36', null, '1', 'What is the professor mainly discussing?', '/static/toefl/listening_audio/xpo/tpo02/listening_6_70b38446c7fc8a833a6d734d0ab21f91.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('37', null, '2', 'Why does the professor say this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo02/listening_7_22e884d83656156d6fd1fd0a99ab8e35.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('38', null, '3', 'Why does the professor say about people who use sign language?', '/static/toefl/listening_audio/xpo/tpo02/listening_8_d0ed240f91b882b249427b9e64b2ee50.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('39', null, '4', 'What point does the professor make when he refers to the university library?', '/static/toefl/listening_audio/xpo/tpo02/listening_9_7c32d8d2b00a7e837d631aabdc9bce63.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('40', null, '5', 'The professor describes a magic trick to the class,what does the magic trick demonstrate?', '/static/toefl/listening_audio/xpo/tpo02/listening_10_dc185dd3262901f9499b06ed69e8e0ba.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('41', null, '1', 'What aspect of Manila hemp fibers does the professor mainly discuss in the lecture', '/static/toefl/listening_audio/xpo/tpo02/listening_12_49c249ac836fcd3b11c83102d7a3ea7d.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('42', null, '2', 'Why does the professor mention going away for the weekend?', '/static/toefl/listening_audio/xpo/tpo02/listening_13_8ef5fd65a2072ca9e1d2a196d68fd3f1.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('43', null, '3', 'What does the professor imply about the name Manila hemp?', '/static/toefl/listening_audio/xpo/tpo02/listening_14_dd43896ad3ad8320e4a8a442d7a6ebda.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('44', null, '4', 'Why does the professor mention the Golden Gate Bridge?', '/static/toefl/listening_audio/xpo/tpo02/listening_15_cf2fecc6856731e886cdd37cebbcf1a7.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('45', null, '5', 'According to the professor, what was the main reason that many ships used Manila hemp ropes instead of steel cables?', '/static/toefl/listening_audio/xpo/tpo02/listening_16_b6513d0b1c87ee4fcd61b0e3258a0621.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('46', null, '1', 'What are the students mainly discussing?', '/static/toefl/listening_audio/xpo/tpo02/listening_18_8be8b6d9a0b97be643adb76987cadd4c.mp3', 'A@C', null);
INSERT INTO `q_listening_question` VALUES ('47', null, '2', 'What does the man plan to do at the end of the month?', '/static/toefl/listening_audio/xpo/tpo02/listening_19_ded17e6b4aa68a6ce1ec88b5ec073424.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('48', null, '3', 'Why does the man talk to the woman about the &quot;Poetry Kitchen&quot;?', '/static/toefl/listening_audio/xpo/tpo02/listening_20_0c1cf56ad74edbf3d4f3870ded73a28d.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('49', null, '4', 'What is the woman\'s attitude toward participating in the poetry club?', '/static/toefl/listening_audio/xpo/tpo02/listening_21_1986f1d94beebd07df4b4aba508b740f.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('50', null, '5', 'What will the students do in the summer?', '/static/toefl/listening_audio/xpo/tpo02/listening_22_204c7f8c1424a8249662496fbf883fd2.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('51', null, '1', 'What is the main purpose of the lecture?', '/static/toefl/listening_audio/xpo/tpo02/listening_23_e564d07695890b689eec664b9982a5cb.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('52', null, '2', 'The professor gives examples of things that have value for her. Indicate for each example what type of value it has for her.', '/static/toefl/listening_audio/xpo/tpo02/listening_24_143642649d557397c46b822b0b8656f1.mp3', 'B@A@C@B', null);
INSERT INTO `q_listening_question` VALUES ('53', null, '3', 'Why is happiness central to Aristotle\'s theory?', '/static/toefl/listening_audio/xpo/tpo02/listening_25_9641ad6b6c3d6d668155ae790f394cb7.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('54', null, '4', 'According to the professor, why does Aristotle think that fame cannot provide true happiness?', '/static/toefl/listening_audio/xpo/tpo02/listening_26_006482e40fabd4fdea320ae5a4077310.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('55', null, '5', 'What does the professor mean when she says this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo02/listening_27_96c881c85ee6dc54bd7f056be34fc98a.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('56', null, '1', 'What is Bode\'s law?', '/static/toefl/listening_audio/xpo/tpo02/listening_28_e57b134e8a067d039a3b2e371b7a8b4a.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('57', null, '2', 'Why does the professor explain Bode\'s Law to the class?', '/static/toefl/listening_audio/xpo/tpo02/listening_29_e23dc394d653ecd17453e7a13561b203.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('58', null, '3', 'How does the professor introduce Bode\'s Law?', '/static/toefl/listening_audio/xpo/tpo02/listening_30_5656b4480b239ec7618e1cb9eaeca3c3.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('59', null, '4', 'According to the professor, what two factors contributed to the discovery of the asteroid Ceres?', '/static/toefl/listening_audio/xpo/tpo02/listening_31_316c5254c761fa0309102ca9aa104df0.mp3', 'A@D', null);
INSERT INTO `q_listening_question` VALUES ('60', null, '5', 'What does the professor imply about the asteroid belt?', '/static/toefl/listening_audio/xpo/tpo02/listening_32_b1e34f9c9ad3d89055b9836599e3e9f5.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('61', null, '1', 'Why does the women come to the office?', '/static/toefl/listening_audio/xpo/tpo03/listening_1_b6ad2401dcf67e75d5c51aeb2dadf0e9.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('62', null, '2', 'What happened to the letter the university sent to the woman?', '/static/toefl/listening_audio/xpo/tpo03/listening_2_56e162b015c5fc66f423c33693ea9a58.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('63', null, '3', 'Why was the woman\'s physics class canceled?', '/static/toefl/listening_audio/xpo/tpo03/listening_3_2c370db16c9fb8bd19c933b911e793a7.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('64', null, '4', 'What does the man suggest the woman do before the beginning of next semester?', '/static/toefl/listening_audio/xpo/tpo03/listening_4_f2306bac4158c00da6f60ea9a650d7c8.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('65', null, '5', 'What does the man imply when he says this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo03/listening_5_9cb31a2d88d58d203e3a130b04d3beb5.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('66', null, '1', 'What does the professor mainly discuss?', '/static/toefl/listening_audio/xpo/tpo03/listening_6_da44a4461952a762d97b7ee7acc3efaf.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('67', null, '2', 'What does the professor imply might cause a decrease in the hummingbird population?', '/static/toefl/listening_audio/xpo/tpo03/listening_7_acbe2db756fda311ac18ed16bc6113c4.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('68', null, '3', 'What does the professor say people have done to help hummingbirds survive?', '/static/toefl/listening_audio/xpo/tpo03/listening_8_d9b762f72744615e991c14db78fe844f.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('69', null, '4', 'What way of collecting information about migrating hummingbirds does the professor mention?', '/static/toefl/listening_audio/xpo/tpo03/listening_9_07f0b5222d5971c9f414149ea1397a8d.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('70', null, '5', 'What does the professor imply researchers have learned while studying hummingbird migration?', '/static/toefl/listening_audio/xpo/tpo03/listening_10_52df96e2c6d12ea21502adac6fd7666f.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('71', null, '1', 'What is the main purpose of the lecture?', '/static/toefl/listening_audio/xpo/tpo03/listening_12_4c876a29c4bf38da85926e39b192d29a.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('72', null, '2', 'Why are Painleve\'s films typical of the films of the 1920s and 1930s?', '/static/toefl/listening_audio/xpo/tpo03/listening_13_e89953f0ac4d74a9251472df61bd1c97.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('73', null, '3', 'According to the professor, how did Painleve\'s film confuse the audience?', '/static/toefl/listening_audio/xpo/tpo03/listening_14_0cd8b5e49a2967ca8582b123b08fc637.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('74', null, '4', 'Why does the professor mention sea horses?', '/static/toefl/listening_audio/xpo/tpo03/listening_15_28f7bd348e115c50baa5b71e8738a319.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('75', null, '5', 'Why does the professor compare the film style of Jacques Cousteau and Jean Painleve?', '/static/toefl/listening_audio/xpo/tpo03/listening_16_6486b2cdc86246beeab8e3efd6c54fca.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('76', null, '1', 'Why does the student go to see the professor?', '/static/toefl/listening_audio/xpo/tpo03/listening_18_608d9c861552e33bf54f91dd7cddafe2.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('77', null, '2', 'What was originally located on the site of the lecture hall?', '/static/toefl/listening_audio/xpo/tpo03/listening_19_17d8b738687a97d02e087110093a56b6.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('78', null, '3', 'What is mentioned as an advantage of working on this project?', '/static/toefl/listening_audio/xpo/tpo03/listening_20_e66e4abbe48e9bccce536efa023c9792.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('79', null, '4', 'What is the professor considering doing to get more volunteers?', '/static/toefl/listening_audio/xpo/tpo03/listening_21_1b9872dd5e0ec38869bd5a7fe92605a1.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('80', null, '5', 'What information does the student still need to get from the professor?', '/static/toefl/listening_audio/xpo/tpo03/listening_22_04f09f79b59b1bf7a680f43596692d16.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('81', null, '1', 'What does the professor mainly discuss?', '/static/toefl/listening_audio/xpo/tpo03/listening_23_5fa7e6882a23293fff6ca31d9f49f3a7.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('82', null, '2', 'Why does the professor mention his daughter?', '/static/toefl/listening_audio/xpo/tpo03/listening_24_1950ba1b4cef71120da7cc235b7a9475.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('83', null, '3', 'What is the professor\'s opinion about the art at the Chauvet cave?', '/static/toefl/listening_audio/xpo/tpo03/listening_25_763db51b82d7048cfce203694822dff4.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('84', null, '4', 'According to the professor, what is the significance of charcoal marks on the walls of the Chauvet cave?', '/static/toefl/listening_audio/xpo/tpo03/listening_26_8f23df18acfa29a57be94055f5935f01.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('85', null, '5', 'Compared to other Paleolithic art, what is unusual about the animals painted at Chauvet?', '/static/toefl/listening_audio/xpo/tpo03/listening_27_f732e41bcd7a914777fd7082d287e3b4.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('86', null, '1', 'What is the lecture mainly about?', '/static/toefl/listening_audio/xpo/tpo03/listening_29_a766bd3e48debb605613ba2d9850019c.mp3', 'C', null);
INSERT INTO `q_listening_question` VALUES ('87', null, '2', 'What does the professor explain to one of the students about the term &quot;radiation&quot;?', '/static/toefl/listening_audio/xpo/tpo03/listening_30_7fe186bf5c6befc5226e73783976ec32.mp3', 'D', null);
INSERT INTO `q_listening_question` VALUES ('88', null, '3', 'What can be inferred about two stars if their spectra have similar spectral line patterns?', '/static/toefl/listening_audio/xpo/tpo03/listening_31_be83b2b990bda851f717b1c2cd5bfb04.mp3', 'B', null);
INSERT INTO `q_listening_question` VALUES ('89', null, '4', 'According to the professor, what is the purpose of heating an element in a spectroscopic flame test?', '/static/toefl/listening_audio/xpo/tpo03/listening_32_71fdee8135802907fabd1950489124ee.mp3', 'A', null);
INSERT INTO `q_listening_question` VALUES ('90', null, '5', 'Why does the professor say this:<span class=\"icon-listen-headset\"></span>', '/static/toefl/listening_audio/xpo/tpo03/listening_33_93ebaa5dca662420913af6d174ab4142.mp3', 'A', null);

-- ----------------------------
-- Table structure for q_listening_section
-- ----------------------------
DROP TABLE IF EXISTS `q_listening_section`;
CREATE TABLE `q_listening_section` (
  `id` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_listening_section
-- ----------------------------

-- ----------------------------
-- Table structure for q_listening_subject
-- ----------------------------
DROP TABLE IF EXISTS `q_listening_subject`;
CREATE TABLE `q_listening_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `passage_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_listening_subject
-- ----------------------------

-- ----------------------------
-- Table structure for q_reading_option
-- ----------------------------
DROP TABLE IF EXISTS `q_reading_option`;
CREATE TABLE `q_reading_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` char(1) DEFAULT NULL COMMENT '字母A、B、C',
  `item_name` varchar(512) DEFAULT NULL,
  `order_num` int(2) DEFAULT NULL COMMENT '从数字1开始，数字小的放在前面',
  `question_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_reading_option
-- ----------------------------
INSERT INTO `q_reading_option` VALUES ('1', 'A', 'It cannot hold rainwater for long periods of time.', '1', '1', null);
INSERT INTO `q_reading_option` VALUES ('2', 'B', 'It prevents most groundwater from circulating.', '2', '1', null);
INSERT INTO `q_reading_option` VALUES ('3', 'C', 'It has the capacity to store large amounts of water.', '3', '1', null);
INSERT INTO `q_reading_option` VALUES ('4', 'D', 'It absorbs most of the water it contains from rivers.', '4', '1', null);
INSERT INTO `q_reading_option` VALUES ('5', 'A', 'confusing', '1', '2', null);
INSERT INTO `q_reading_option` VALUES ('6', 'B', 'comforting', '2', '2', null);
INSERT INTO `q_reading_option` VALUES ('7', 'C', 'unbelievable', '3', '2', null);
INSERT INTO `q_reading_option` VALUES ('8', 'D', 'interesting ', '4', '2', null);
INSERT INTO `q_reading_option` VALUES ('9', 'A', 'far away ', '1', '3', null);
INSERT INTO `q_reading_option` VALUES ('10', 'B', 'hidden ', '2', '3', null);
INSERT INTO `q_reading_option` VALUES ('11', 'C', 'partly visible', '3', '3', null);
INSERT INTO `q_reading_option` VALUES ('12', 'D', 'discovered', '4', '3', null);
INSERT INTO `q_reading_option` VALUES ('13', 'A', 'Inside pieces of sand and gravel', '1', '4', null);
INSERT INTO `q_reading_option` VALUES ('14', 'B', 'On top of beds of rock', '2', '4', null);
INSERT INTO `q_reading_option` VALUES ('15', 'C', 'In fast rivers that are flowing beneath the soil', '3', '4', null);
INSERT INTO `q_reading_option` VALUES ('16', 'D', 'In spaces between pieces of sediment', '4', '4', null);
INSERT INTO `q_reading_option` VALUES ('17', 'A', 'fast rivers', '1', '5', null);
INSERT INTO `q_reading_option` VALUES ('18', 'B', 'glaciers', '2', '5', null);
INSERT INTO `q_reading_option` VALUES ('19', 'C', 'the huge volumes of water created by glacial melting', '3', '5', null);
INSERT INTO `q_reading_option` VALUES ('20', 'D', 'the particles carried in water from melting glaciers', '4', '5', null);
INSERT INTO `q_reading_option` VALUES ('21', 'A', 'A mountain valley ', '1', '6', null);
INSERT INTO `q_reading_option` VALUES ('22', 'B', 'Flat land', '2', '6', null);
INSERT INTO `q_reading_option` VALUES ('23', 'C', 'A lake floor', '3', '6', null);
INSERT INTO `q_reading_option` VALUES ('24', 'D', 'The seafloor', '4', '6', null);
INSERT INTO `q_reading_option` VALUES ('25', 'A', 'cover', '1', '7', null);
INSERT INTO `q_reading_option` VALUES ('26', 'B', 'change', '2', '7', null);
INSERT INTO `q_reading_option` VALUES ('27', 'C', 'separate', '3', '7', null);
INSERT INTO `q_reading_option` VALUES ('28', 'D', 'surround', '4', '7', null);
INSERT INTO `q_reading_option` VALUES ('29', 'A', 'that is enough about', '1', '8', null);
INSERT INTO `q_reading_option` VALUES ('30', 'B', 'now let us turn to', '2', '8', null);
INSERT INTO `q_reading_option` VALUES ('31', 'C', 'of greater concern are', '3', '8', null);
INSERT INTO `q_reading_option` VALUES ('32', 'D', 'this is related to', '4', '8', null);
INSERT INTO `q_reading_option` VALUES ('33', 'A', 'washed', '1', '9', null);
INSERT INTO `q_reading_option` VALUES ('34', 'B', 'dragged', '2', '9', null);
INSERT INTO `q_reading_option` VALUES ('35', 'C', 'filled up', '3', '9', null);
INSERT INTO `q_reading_option` VALUES ('36', 'D', 'soaked through', '4', '9', null);
INSERT INTO `q_reading_option` VALUES ('37', 'A', 'It is unusually solid.', '1', '10', null);
INSERT INTO `q_reading_option` VALUES ('38', 'B', 'It often has high porosity.', '2', '10', null);
INSERT INTO `q_reading_option` VALUES ('39', 'C', 'It has a low proportion of empty space.', '3', '10', null);
INSERT INTO `q_reading_option` VALUES ('40', 'D', 'It is highly permeable.', '4', '10', null);
INSERT INTO `q_reading_option` VALUES ('41', 'A', 'changed ', '1', '11', null);
INSERT INTO `q_reading_option` VALUES ('42', 'B', 'debated', '2', '11', null);
INSERT INTO `q_reading_option` VALUES ('43', 'C', 'created', '3', '11', null);
INSERT INTO `q_reading_option` VALUES ('44', 'D', 'supported', '4', '11', null);
INSERT INTO `q_reading_option` VALUES ('45', 'A', 'ascribes', '1', '12', null);
INSERT INTO `q_reading_option` VALUES ('46', 'B', 'leaves', '2', '12', null);
INSERT INTO `q_reading_option` VALUES ('47', 'C', 'limits', '3', '12', null);
INSERT INTO `q_reading_option` VALUES ('48', 'D', 'contrasts', '4', '12', null);
INSERT INTO `q_reading_option` VALUES ('49', 'A', 'are mainly hypothetical ', '1', '13', null);
INSERT INTO `q_reading_option` VALUES ('50', 'B', 'are well supported by factual evidence ', '2', '13', null);
INSERT INTO `q_reading_option` VALUES ('51', 'C', 'have rarely been agreed upon by anthropologists', '3', '13', null);
INSERT INTO `q_reading_option` VALUES ('52', 'D', 'were expressed in the early stages of theater\'s development', '4', '13', null);
INSERT INTO `q_reading_option` VALUES ('53', 'A', 'To establish a positive connection between the members of the society', '1', '14', null);
INSERT INTO `q_reading_option` VALUES ('54', 'B', 'To help society members better understand the forces controlling their food supply', '2', '14', null);
INSERT INTO `q_reading_option` VALUES ('55', 'C', 'To distinguish their beliefs from those of other societies ', '3', '14', null);
INSERT INTO `q_reading_option` VALUES ('56', 'D', 'To increase the society\'s prosperity', '4', '14', null);
INSERT INTO `q_reading_option` VALUES ('57', 'A', 'the acting out of rites', '1', '15', null);
INSERT INTO `q_reading_option` VALUES ('58', 'B', 'the divorce of ritual performers from the rest of society', '2', '15', null);
INSERT INTO `q_reading_option` VALUES ('59', 'C', 'the separation of myths from rites', '3', '15', null);
INSERT INTO `q_reading_option` VALUES ('60', 'D', 'the celebration of supernatural forces', '4', '15', null);
INSERT INTO `q_reading_option` VALUES ('61', 'A', 'artistic', '1', '16', null);
INSERT INTO `q_reading_option` VALUES ('62', 'B', 'important ', '2', '16', null);
INSERT INTO `q_reading_option` VALUES ('63', 'C', 'independent', '3', '16', null);
INSERT INTO `q_reading_option` VALUES ('64', 'D', 'established', '4', '16', null);
INSERT INTO `q_reading_option` VALUES ('65', 'A', 'Emphasizing theater as entertainment ', '1', '17', null);
INSERT INTO `q_reading_option` VALUES ('66', 'B', 'Developing a new understanding of why events occur', '2', '17', null);
INSERT INTO `q_reading_option` VALUES ('67', 'C', 'Finding a more sophisticated way of representing mythical characters', '3', '17', null);
INSERT INTO `q_reading_option` VALUES ('68', 'D', 'Moving from a primarily oral tradition to a more written tradition', '4', '17', null);
INSERT INTO `q_reading_option` VALUES ('69', 'A', 'Theater allows people to face that they are afraid of.', '1', '18', null);
INSERT INTO `q_reading_option` VALUES ('70', 'B', 'Theater gives an opportunity to imagine a better reality.', '2', '18', null);
INSERT INTO `q_reading_option` VALUES ('71', 'C', 'Theater is a way to enjoy imitating other people.', '3', '18', null);
INSERT INTO `q_reading_option` VALUES ('72', 'D', 'Theater provides people the opportunity to better understand the human mind.', '4', '18', null);
INSERT INTO `q_reading_option` VALUES ('73', 'A', 'The author presents two theories for a historical phenomenon.', '1', '19', null);
INSERT INTO `q_reading_option` VALUES ('74', 'B', 'The author argues against theories expressed earlier in the passage.', '2', '19', null);
INSERT INTO `q_reading_option` VALUES ('75', 'C', 'The author argues for replacing older theories with a new one.', '3', '19', null);
INSERT INTO `q_reading_option` VALUES ('76', 'D', 'The author points out problems with two popular theories.', '4', '19', null);
INSERT INTO `q_reading_option` VALUES ('77', 'A', 'compromise', '1', '20', null);
INSERT INTO `q_reading_option` VALUES ('78', 'B', 'inclination', '2', '20', null);
INSERT INTO `q_reading_option` VALUES ('79', 'C', 'tradition', '3', '20', null);
INSERT INTO `q_reading_option` VALUES ('80', 'D', 'respect', '4', '20', null);
INSERT INTO `q_reading_option` VALUES ('81', 'A', 'gradual', '1', '21', null);
INSERT INTO `q_reading_option` VALUES ('82', 'B', 'complex', '2', '21', null);
INSERT INTO `q_reading_option` VALUES ('83', 'C', 'visible', '3', '21', null);
INSERT INTO `q_reading_option` VALUES ('84', 'D', 'striking', '4', '21', null);
INSERT INTO `q_reading_option` VALUES ('85', 'A', 'In an area that has little water ', '1', '22', null);
INSERT INTO `q_reading_option` VALUES ('86', 'B', 'In an area that has little sunlight', '2', '22', null);
INSERT INTO `q_reading_option` VALUES ('87', 'C', 'Above a transition area', '3', '22', null);
INSERT INTO `q_reading_option` VALUES ('88', 'D', 'On a mountain that has on upper timberline.', '4', '22', null);
INSERT INTO `q_reading_option` VALUES ('89', 'A', 'Both are treeless zones.', '1', '23', null);
INSERT INTO `q_reading_option` VALUES ('90', 'B', 'Both mark forest boundaries.', '2', '23', null);
INSERT INTO `q_reading_option` VALUES ('91', 'C', 'Both are surrounded by desert areas.', '3', '23', null);
INSERT INTO `q_reading_option` VALUES ('92', 'D', 'Both suffer from a lack of moisture.', '4', '23', null);
INSERT INTO `q_reading_option` VALUES ('93', 'A', 'They cannot grow in cold climates.', '1', '24', null);
INSERT INTO `q_reading_option` VALUES ('94', 'B', 'They do not exist at the upper timberline.', '2', '24', null);
INSERT INTO `q_reading_option` VALUES ('95', 'C', 'They areless likely than evergreens to survive at the upper timberline.', '3', '24', null);
INSERT INTO `q_reading_option` VALUES ('96', 'D', 'They do not require as much moisture as evergreens do.', '4', '24', null);
INSERT INTO `q_reading_option` VALUES ('97', 'A', 'require', '1', '25', null);
INSERT INTO `q_reading_option` VALUES ('98', 'B', 'resist', '2', '25', null);
INSERT INTO `q_reading_option` VALUES ('99', 'C', 'achieve', '3', '25', null);
INSERT INTO `q_reading_option` VALUES ('100', 'D', 'endure', '4', '25', null);
INSERT INTO `q_reading_option` VALUES ('101', 'A', 'valleys', '1', '26', null);
INSERT INTO `q_reading_option` VALUES ('102', 'B', 'trees', '2', '26', null);
INSERT INTO `q_reading_option` VALUES ('103', 'C', 'heights', '3', '26', null);
INSERT INTO `q_reading_option` VALUES ('104', 'D', 'ridges', '4', '26', null);
INSERT INTO `q_reading_option` VALUES ('105', 'A', 'adapted', '1', '27', null);
INSERT INTO `q_reading_option` VALUES ('106', 'B', 'likely', '2', '27', null);
INSERT INTO `q_reading_option` VALUES ('107', 'C', 'difficult', '3', '27', null);
INSERT INTO `q_reading_option` VALUES ('108', 'D', 'resistant', '4', '27', null);
INSERT INTO `q_reading_option` VALUES ('109', 'A', 'Tree growth is negatively affected by the snow cover in valleys', '1', '28', null);
INSERT INTO `q_reading_option` VALUES ('110', 'B', 'Tree growth is greater in valleys than on ridges.', '2', '28', null);
INSERT INTO `q_reading_option` VALUES ('111', 'C', 'Tree growth on ridges is not affected by high-velocity winds.', '3', '28', null);
INSERT INTO `q_reading_option` VALUES ('112', 'D', 'Tree growth lasts longer in those latitudes than it does in the tropics.', '4', '28', null);
INSERT INTO `q_reading_option` VALUES ('113', 'A', 'Because of their deformed shapes at high altitudes, trees are not likely to be seriously harmed by the strong winds typical of those altitudes.', '1', '29', null);
INSERT INTO `q_reading_option` VALUES ('114', 'B', 'As altitude increases, the velocity of winds increase, leading to a serious decrease in the number of trees found at high altitudes.', '2', '29', null);
INSERT INTO `q_reading_option` VALUES ('115', 'C', 'The deformed shapes of trees at high altitudes show that wind velocity, which increase with altitude, can cause serious hardship for trees.', '3', '29', null);
INSERT INTO `q_reading_option` VALUES ('116', 'D', 'Increased wind velocity at high altitudes deforms the shapes of trees, and this may cause serious stress for trees.', '4', '29', null);
INSERT INTO `q_reading_option` VALUES ('117', 'A', 'To argue that none of several environment factors that are believed to contribute to that phenomenon do in fact play a role in causing it.', '1', '30', null);
INSERT INTO `q_reading_option` VALUES ('118', 'B', 'To argue in support of one particular explanation of that phenomenon against several competing explanations', '2', '30', null);
INSERT INTO `q_reading_option` VALUES ('119', 'C', 'To explain why the primary environmental factor responsible for that phenomenon has not yet been identified', '3', '30', null);
INSERT INTO `q_reading_option` VALUES ('120', 'D', 'To present several environmental factors that may contribute to a satisfactory explanation of that phenomenon', '4', '30', null);
INSERT INTO `q_reading_option` VALUES ('121', 'A', 'Restricted', '1', '31', null);
INSERT INTO `q_reading_option` VALUES ('122', 'B', 'Endangered', '2', '31', null);
INSERT INTO `q_reading_option` VALUES ('123', 'C', 'Prevented', '3', '31', null);
INSERT INTO `q_reading_option` VALUES ('124', 'D', 'Rejected', '4', '31', null);
INSERT INTO `q_reading_option` VALUES ('125', 'A', 'Increased stony content', '1', '32', null);
INSERT INTO `q_reading_option` VALUES ('126', 'B', 'Reduced water absorption', '2', '32', null);
INSERT INTO `q_reading_option` VALUES ('127', 'C', 'Increased numbers of spaces in the soil', '3', '32', null);
INSERT INTO `q_reading_option` VALUES ('128', 'D', 'Reduced water runoff', '4', '32', null);
INSERT INTO `q_reading_option` VALUES ('129', 'A', 'Fragile', '1', '33', null);
INSERT INTO `q_reading_option` VALUES ('130', 'B', 'Predictable', '2', '33', null);
INSERT INTO `q_reading_option` VALUES ('131', 'C', 'Complex', '3', '33', null);
INSERT INTO `q_reading_option` VALUES ('132', 'D', 'Valuable', '4', '33', null);
INSERT INTO `q_reading_option` VALUES ('133', 'A', 'Adjusting to stresses created by settlement', '1', '34', null);
INSERT INTO `q_reading_option` VALUES ('134', 'B', 'Retaining their fertility after desertification', '2', '34', null);
INSERT INTO `q_reading_option` VALUES ('135', 'C', 'Providing water for irrigating crops', '3', '34', null);
INSERT INTO `q_reading_option` VALUES ('136', 'D', 'Attracting populations in search of food and fuel', '4', '34', null);
INSERT INTO `q_reading_option` VALUES ('137', 'A', 'Openly', '1', '35', null);
INSERT INTO `q_reading_option` VALUES ('138', 'B', 'Impressively', '2', '35', null);
INSERT INTO `q_reading_option` VALUES ('139', 'C', 'Objectively', '3', '35', null);
INSERT INTO `q_reading_option` VALUES ('140', 'D', 'Increasingly', '4', '35', null);
INSERT INTO `q_reading_option` VALUES ('141', 'A', 'Lack of proper irrigation techniques', '1', '36', null);
INSERT INTO `q_reading_option` VALUES ('142', 'B', 'Failure to plant crops suited to the particular area', '2', '36', null);
INSERT INTO `q_reading_option` VALUES ('143', 'C', 'Removal of the original vegetation', '3', '36', null);
INSERT INTO `q_reading_option` VALUES ('144', 'D', 'Excessive use of dried animal waste', '4', '36', null);
INSERT INTO `q_reading_option` VALUES ('145', 'A', 'Consisting of', '1', '37', null);
INSERT INTO `q_reading_option` VALUES ('146', 'B', 'Hidden by', '2', '37', null);
INSERT INTO `q_reading_option` VALUES ('147', 'C', 'Except for', '3', '37', null);
INSERT INTO `q_reading_option` VALUES ('148', 'D', 'Lacking in', '4', '37', null);
INSERT INTO `q_reading_option` VALUES ('149', 'A', 'Interfere with the irrigation of land', '1', '38', null);
INSERT INTO `q_reading_option` VALUES ('150', 'B', 'Limit the evaporation of water', '2', '38', null);
INSERT INTO `q_reading_option` VALUES ('151', 'C', 'Require more absorption of air by the soil', '3', '38', null);
INSERT INTO `q_reading_option` VALUES ('152', 'D', 'Bring salts to the surface', '4', '38', null);
INSERT INTO `q_reading_option` VALUES ('153', 'A', 'Soil erosion', '1', '39', null);
INSERT INTO `q_reading_option` VALUES ('154', 'B', 'Global warming', '2', '39', null);
INSERT INTO `q_reading_option` VALUES ('155', 'C', 'Insufficient irrigation', '3', '39', null);
INSERT INTO `q_reading_option` VALUES ('156', 'D', 'The raising of livestock', '4', '39', null);
INSERT INTO `q_reading_option` VALUES ('157', 'A', 'Desertification is a significant problem because it is so hard to reverse and affects large areas of land and great numbers of people.', '1', '40', null);
INSERT INTO `q_reading_option` VALUES ('158', 'B', 'Slowing down the process of desertification is difficult because of population growth that has spread over large areas of land.', '2', '40', null);
INSERT INTO `q_reading_option` VALUES ('159', 'C', 'The spread of deserts is considered a very serious problem that can be solved only if large numbers of people in various countries are involved in the effort.', '3', '40', null);
INSERT INTO `q_reading_option` VALUES ('160', 'D', 'Desertification is extremely hard to reverse unless the population is reduced in the vast areas affected.', '4', '40', null);
INSERT INTO `q_reading_option` VALUES ('161', 'A', 'It clearly indicates that cetaceans are mammals.', '1', '41', null);
INSERT INTO `q_reading_option` VALUES ('162', 'B', 'It cannot conceal the fact that cetaceans are mammals.', '2', '41', null);
INSERT INTO `q_reading_option` VALUES ('163', 'C', 'It is the main difference between cetaceans and land-dwelling mammals.', '3', '41', null);
INSERT INTO `q_reading_option` VALUES ('164', 'D', 'It cannot yield clues about the origins of cetaceans.', '4', '41', null);
INSERT INTO `q_reading_option` VALUES ('165', 'A', 'It is not difficult to imagine what they looked like', '1', '42', null);
INSERT INTO `q_reading_option` VALUES ('166', 'B', 'There were great numbers of them.', '2', '42', null);
INSERT INTO `q_reading_option` VALUES ('167', 'C', 'They lived in the sea only.', '3', '42', null);
INSERT INTO `q_reading_option` VALUES ('168', 'D', 'They did not leave many fossil remains', '4', '42', null);
INSERT INTO `q_reading_option` VALUES ('169', 'A', 'Exact', '1', '43', null);
INSERT INTO `q_reading_option` VALUES ('170', 'B', 'Scarce', '2', '43', null);
INSERT INTO `q_reading_option` VALUES ('171', 'C', 'Valuable', '3', '43', null);
INSERT INTO `q_reading_option` VALUES ('172', 'D', 'Initial', '4', '43', null);
INSERT INTO `q_reading_option` VALUES ('173', 'A', 'Hearing structures', '1', '44', null);
INSERT INTO `q_reading_option` VALUES ('174', 'B', 'Adaptations for diving', '2', '44', null);
INSERT INTO `q_reading_option` VALUES ('175', 'C', 'Skull shapes', '3', '44', null);
INSERT INTO `q_reading_option` VALUES ('176', 'D', 'Breeding locations', '4', '44', null);
INSERT INTO `q_reading_option` VALUES ('177', 'A', 'Pakicetus', '1', '45', null);
INSERT INTO `q_reading_option` VALUES ('178', 'B', 'Fish', '2', '45', null);
INSERT INTO `q_reading_option` VALUES ('179', 'C', 'Life', '3', '45', null);
INSERT INTO `q_reading_option` VALUES ('180', 'D', 'ocean', '4', '45', null);
INSERT INTO `q_reading_option` VALUES ('181', 'A', 'Explained', '1', '46', null);
INSERT INTO `q_reading_option` VALUES ('182', 'B', 'Visible', '2', '46', null);
INSERT INTO `q_reading_option` VALUES ('183', 'C', 'Identified', '3', '46', null);
INSERT INTO `q_reading_option` VALUES ('184', 'D', 'Located', '4', '46', null);
INSERT INTO `q_reading_option` VALUES ('185', 'A', 'Lived later than Ambulocetus natans', '1', '47', null);
INSERT INTO `q_reading_option` VALUES ('186', 'B', 'Lived at the same time as Pakicetus', '2', '47', null);
INSERT INTO `q_reading_option` VALUES ('187', 'C', 'Was able to swim well', '3', '47', null);
INSERT INTO `q_reading_option` VALUES ('188', 'D', 'Could not have walked on land', '4', '47', null);
INSERT INTO `q_reading_option` VALUES ('189', 'A', 'On land', '1', '48', null);
INSERT INTO `q_reading_option` VALUES ('190', 'B', 'Both on land and at sea', '2', '48', null);
INSERT INTO `q_reading_option` VALUES ('191', 'C', 'In shallow water', '3', '48', null);
INSERT INTO `q_reading_option` VALUES ('192', 'D', 'In a marine environment', '4', '48', null);
INSERT INTO `q_reading_option` VALUES ('193', 'A', 'Fossil legs of early whales are a rare find.', '1', '49', null);
INSERT INTO `q_reading_option` VALUES ('194', 'B', 'The legs provided important information about the evolution of cetaceans.', '2', '49', null);
INSERT INTO `q_reading_option` VALUES ('195', 'C', 'The discovery allowed scientists to reconstruct a complete skeleton of the whale.', '3', '49', null);
INSERT INTO `q_reading_option` VALUES ('196', 'D', 'Until that time, only the front legs of early whales had been discovered.', '4', '49', null);
INSERT INTO `q_reading_option` VALUES ('197', 'A', 'Even though Ambulocetus swam by moving its body up and down, it did not have a backbone.', '1', '50', null);
INSERT INTO `q_reading_option` VALUES ('198', 'B', 'The backbone of Ambulocetus, which allowed it to swim, provides evidence of its missing fluke.', '2', '50', null);
INSERT INTO `q_reading_option` VALUES ('199', 'C', 'Although Ambulocetus had no fluke, its backbone structure shows that it swam like modern whales.', '3', '50', null);
INSERT INTO `q_reading_option` VALUES ('200', 'D', 'By moving the rear parts of their bodies up and down, modern whales swim in a different way from the way Ambulocetus swam.', '4', '50', null);
INSERT INTO `q_reading_option` VALUES ('201', 'A', 'One individual at a time viewed a film.', '1', '51', null);
INSERT INTO `q_reading_option` VALUES ('202', 'B', 'Customers could view one film after another.', '2', '51', null);
INSERT INTO `q_reading_option` VALUES ('203', 'C', 'Prizefights were the most popular subjects for films.', '3', '51', null);
INSERT INTO `q_reading_option` VALUES ('204', 'D', 'Each film was short.', '4', '51', null);
INSERT INTO `q_reading_option` VALUES ('205', 'A', 'Explain Edison\'s financial success', '1', '52', null);
INSERT INTO `q_reading_option` VALUES ('206', 'B', 'Describe the model used to design Kinetoscope parlors', '2', '52', null);
INSERT INTO `q_reading_option` VALUES ('207', 'C', 'Contrast their popularity to that of Kinetoscope parlors', '3', '52', null);
INSERT INTO `q_reading_option` VALUES ('208', 'D', 'illustrate how much more technologically advanced Kinetoscope parlors were', '4', '52', null);
INSERT INTO `q_reading_option` VALUES ('209', 'A', 'Edison was more interested in developing a variety of machines than in developing a technology based on only one.', '1', '53', null);
INSERT INTO `q_reading_option` VALUES ('210', 'B', 'Edison refused to work on projection technology because he did not think exhibitors would replace their projectors with newer machines.', '2', '53', null);
INSERT INTO `q_reading_option` VALUES ('211', 'C', 'Edison did not want to develop projection technology because it limited the number of machines he could sell.', '3', '53', null);
INSERT INTO `q_reading_option` VALUES ('212', 'D', 'Edison would not develop projection technology unless exhibitors agreed to purchase more than one projector from him.', '4', '53', null);
INSERT INTO `q_reading_option` VALUES ('213', 'A', 'Frequently', '1', '54', null);
INSERT INTO `q_reading_option` VALUES ('214', 'B', 'Easily', '2', '54', null);
INSERT INTO `q_reading_option` VALUES ('215', 'C', 'Intelligently', '3', '54', null);
INSERT INTO `q_reading_option` VALUES ('216', 'D', 'Obviously', '4', '54', null);
INSERT INTO `q_reading_option` VALUES ('217', 'A', 'Criticism', '1', '55', null);
INSERT INTO `q_reading_option` VALUES ('218', 'B', 'Leadership', '2', '55', null);
INSERT INTO `q_reading_option` VALUES ('219', 'C', 'Help', '3', '55', null);
INSERT INTO `q_reading_option` VALUES ('220', 'D', 'Approval', '4', '55', null);
INSERT INTO `q_reading_option` VALUES ('221', 'A', 'They were a more expensive form of entertainment.', '1', '56', null);
INSERT INTO `q_reading_option` VALUES ('222', 'B', 'They were viewed by larger audiences.', '2', '56', null);
INSERT INTO `q_reading_option` VALUES ('223', 'C', 'They were more educational.', '3', '56', null);
INSERT INTO `q_reading_option` VALUES ('224', 'D', 'They did not require live entertainers.', '4', '56', null);
INSERT INTO `q_reading_option` VALUES ('225', 'A', 'They decided how to combine various components of the film program.', '1', '57', null);
INSERT INTO `q_reading_option` VALUES ('226', 'B', 'They advised film-makers on appropriate movie content.', '2', '57', null);
INSERT INTO `q_reading_option` VALUES ('227', 'C', 'They often took part in the live-action performances.', '3', '57', null);
INSERT INTO `q_reading_option` VALUES ('228', 'D', 'They produced and prerecorded the material that was shown in the theaters.', '4', '57', null);
INSERT INTO `q_reading_option` VALUES ('229', 'A', 'Sound and motion were simultaneously produced in the Mutoscope.', '1', '58', null);
INSERT INTO `q_reading_option` VALUES ('230', 'B', 'More than one person could view the images at the same time with the Mutoscope.', '2', '58', null);
INSERT INTO `q_reading_option` VALUES ('231', 'C', 'The Mutoscope was a less sophisticated earlier prototype of the Kinetoscope.', '3', '58', null);
INSERT INTO `q_reading_option` VALUES ('232', 'D', 'A different type of material was used to produce the images used in the Mutocope.', '4', '58', null);
INSERT INTO `q_reading_option` VALUES ('233', 'A', 'The advent of projection', '1', '59', null);
INSERT INTO `q_reading_option` VALUES ('234', 'B', 'The viewer\'s relationship with the image', '2', '59', null);
INSERT INTO `q_reading_option` VALUES ('235', 'C', 'A similar machine', '3', '59', null);
INSERT INTO `q_reading_option` VALUES ('236', 'D', 'Celluloid', '4', '59', null);
INSERT INTO `q_reading_option` VALUES ('237', 'A', 'Small in size', '1', '60', null);
INSERT INTO `q_reading_option` VALUES ('238', 'B', 'Inexpensive to create', '2', '60', null);
INSERT INTO `q_reading_option` VALUES ('239', 'C', 'Unfocused', '3', '60', null);
INSERT INTO `q_reading_option` VALUES ('240', 'D', 'Limited in subject matter', '4', '60', null);
INSERT INTO `q_reading_option` VALUES ('241', 'A', 'grow up', '1', '61', null);
INSERT INTO `q_reading_option` VALUES ('242', 'B', 'build up', '2', '61', null);
INSERT INTO `q_reading_option` VALUES ('243', 'C', 'spread out', '3', '61', null);
INSERT INTO `q_reading_option` VALUES ('244', 'D', 'break apart', '4', '61', null);
INSERT INTO `q_reading_option` VALUES ('245', 'A', 'Microscopic organisms that live in mud produce crude oil and natural gas.', '1', '62', null);
INSERT INTO `q_reading_option` VALUES ('246', 'B', 'Large amounts of oxygen are needed for petroleum formation to begin.', '2', '62', null);
INSERT INTO `q_reading_option` VALUES ('247', 'C', 'Petroleum is produced when organic material in sediments combines with decaying marine organisms.', '3', '62', null);
INSERT INTO `q_reading_option` VALUES ('248', 'D', 'Petroleum formation appears to begin in marine sediments where organic matter is present.', '4', '62', null);
INSERT INTO `q_reading_option` VALUES ('249', 'A', 'describe how petroleum is formed', '1', '63', null);
INSERT INTO `q_reading_option` VALUES ('250', 'B', 'explain why petroleum formation is a slow process', '2', '63', null);
INSERT INTO `q_reading_option` VALUES ('251', 'C', 'provide evidence that a marine environment is necessary for petroleum formation', '3', '63', null);
INSERT INTO `q_reading_option` VALUES ('252', 'D', 'show that oil commonly occurs in association with gas', '4', '63', null);
INSERT INTO `q_reading_option` VALUES ('253', 'A', 'Higher temperatures and pressures promote sedimentation, which is responsible for petroleum formation.', '1', '64', null);
INSERT INTO `q_reading_option` VALUES ('254', 'B', 'Deposits of sediments on top of organic matter increase the temperature of and pressure on the matter.', '2', '64', null);
INSERT INTO `q_reading_option` VALUES ('255', 'C', 'Increase pressure and heat from the weight of the sediment turn the organic remains into petroleum.', '3', '64', null);
INSERT INTO `q_reading_option` VALUES ('256', 'D', 'The remains of microscopic organisms transform into petroleum once they are buried under mud.', '4', '64', null);
INSERT INTO `q_reading_option` VALUES ('257', 'A', 'nearby', '1', '65', null);
INSERT INTO `q_reading_option` VALUES ('258', 'B', 'existing', '2', '65', null);
INSERT INTO `q_reading_option` VALUES ('259', 'C', 'special', '3', '65', null);
INSERT INTO `q_reading_option` VALUES ('260', 'D', 'deep', '4', '65', null);
INSERT INTO `q_reading_option` VALUES ('261', 'A', 'They make bringing the oil to the surface easier.', '1', '66', null);
INSERT INTO `q_reading_option` VALUES ('262', 'B', 'They signal the presence of huge oil reserves.', '2', '66', null);
INSERT INTO `q_reading_option` VALUES ('263', 'C', 'They waste more oil than they collect.', '3', '66', null);
INSERT INTO `q_reading_option` VALUES ('264', 'D', 'They are unlikely to occur nowadays.', '4', '66', null);
INSERT INTO `q_reading_option` VALUES ('265', 'A', 'Drilling under the ocean\'s surface', '1', '67', null);
INSERT INTO `q_reading_option` VALUES ('266', 'B', 'Limiting drilling to accessible locations', '2', '67', null);
INSERT INTO `q_reading_option` VALUES ('267', 'C', 'Using highly sophisticated drilling equipment', '3', '67', null);
INSERT INTO `q_reading_option` VALUES ('268', 'D', 'Constructing technologically advanced drilling platforms', '4', '67', null);
INSERT INTO `q_reading_option` VALUES ('269', 'A', 'More oil is extracted from the sea than from land.', '1', '68', null);
INSERT INTO `q_reading_option` VALUES ('270', 'B', 'Drilling for oil requires major financial investments.', '2', '68', null);
INSERT INTO `q_reading_option` VALUES ('271', 'C', 'The global demand for oil has increased over the years.', '3', '68', null);
INSERT INTO `q_reading_option` VALUES ('272', 'D', 'The North Slope of Alaska has substantial amounts of oil.', '4', '68', null);
INSERT INTO `q_reading_option` VALUES ('273', 'A', 'shifting', '1', '69', null);
INSERT INTO `q_reading_option` VALUES ('274', 'B', 'inclining', '2', '69', null);
INSERT INTO `q_reading_option` VALUES ('275', 'C', 'forming', '3', '69', null);
INSERT INTO `q_reading_option` VALUES ('276', 'D', 'rolling', '4', '69', null);
INSERT INTO `q_reading_option` VALUES ('277', 'A', 'permission to access the area where oil has been found', '1', '70', null);
INSERT INTO `q_reading_option` VALUES ('278', 'B', 'the availability of sufficient quantities of oil in a pool', '2', '70', null);
INSERT INTO `q_reading_option` VALUES ('279', 'C', 'the location of the market in relation to the drilling site', '3', '70', null);
INSERT INTO `q_reading_option` VALUES ('280', 'D', 'the political situation in the region where drilling would occur', '4', '70', null);

-- ----------------------------
-- Table structure for q_reading_passage
-- ----------------------------
DROP TABLE IF EXISTS `q_reading_passage`;
CREATE TABLE `q_reading_passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `title_cn` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_reading_passage
-- ----------------------------
INSERT INTO `q_reading_passage` VALUES ('1', 'Groundwater', '<p>Groundwater is the word used to describe water that saturates the ground, filling all the available spaces. By far the most abundant type of groundwater is meteoric water; this is the groundwater that circulates as part of the water cycle. Ordinary meteoric water is water that has soaked into the ground from the surface, from precipitation (rain and snow) and from lakes and streams. There it remains, sometimes for long periods, before emerging at the surface again. At first thought it seems incredible that there can be enough space in the \"solid\"ground underfoot to hold all this water.</p>\r\n<p>The necessary space is there, however, in many forms. The commonest spaces are those among the particles—sand grains and tiny pebbles—of loose, unconsolidated sand and gravel. Beds of this material, out of sight beneath the soil, are common. They are found wherever fast rivers carrying loads of coarse sediment once flowed. For example, as the great ice sheets that covered North America during the last ice age steadily melted away, huge volumes of water flowed from them. The water was always laden with pebbles, gravel, and sand, known as glacial outwash, that was deposited as the flow slowed down.</p>\r\n<p>The same thing happens to this day, though on a smaller scale, wherever a sediment-laden river or stream emerges from a mountain valley onto relatively flat land, dropping its load as the current slows: the water usually spreads out fanwise, depositing the sediment in the form of a smooth, fan-shaped slope. Sediments are also dropped where a river slows on entering a lake or the sea, the deposited sediments are on a lake floor or the seafloor at first, but will be located inland at some future date, when the sea level falls or the land rises; such beds are sometimes thousands of meters thick.</p>\r\n<p>In lowland country almost any spot on the ground may overlie what was once the bed of a river that has since become buried by soil; if they are now below the water\'s upper surface (the water table), the gravels and sands of the former riverbed, and its sandbars, will be saturated with groundwater.</p>\r\n<p>So much for unconsolidated sediments. Consolidated (or cemented) sediments, too, contain millions of minute water-holding pores. This is because the gaps among the original grains are often not totally plugged with cementing chemicals; also, parts of the original grains may become dissolved by percolating groundwater, either while consolidation is taking place or at any time afterwards. The result is that sandstone, for example, can be as porous as the loose sand from which it was formed.</p>\r\n<p>Thus a proportion of the total volume of any sediment, loose or cemented, consists of empty space. Most crystalline rocks are much more solid; a common exception is basalt, a form of solidified volcanic lava, which is sometimes full of tiny bubbles that make it very porous.</p>\r\n<p>The proportion of empty space in a rock is known as its porosity. But note that porosity is not the same as permeability, which measures the ease with which water can flow through a material; this depends on the sizes of the individual cavities and the crevices linking them.</p>\r\n<p>Much of the water in a sample of water-saturated sediment or rock will drain from it if the sample is put in a suitable dry place. But some will remain, clinging to all solid surfaces. It is held there by the force of surface tension without which water would drain instantly from any wet surface, leaving it totally dry. The total volume of water in the saturated sample must therefore be thought of as consisting of water that can, and water that cannot, drain away.</p>\r\n<p>The relative amount of these two kinds of water varies greatly from one kind of rock or sediment to another, even though their porosities may be the same. What happens depends on pore size. If the pores are large, the water in them will exist as drops too heavy for surface tension to hold, and it will drain away; but if the pores are small enough, the water in them will exist as thin films, too light to overcome the force of surface tension holding them in place; then the water will be firmly held.</p>', '地下水', '');
INSERT INTO `q_reading_passage` VALUES ('2', 'The Origins of Theater', '<p>It should be obvious that cetaceans-whales, porpoises, and dolphins-are mammals. They breathe through lungs, not through gills, and give birth to live young. Their streamlined bodies, the absence of hind legs, and the presence of a fluke1 and blowhole2 cannot disguise their affinities with land dwelling mammals.However, unlike the cases of sea otters and pinnipeds (seals, sea lions, and walruses, whose limbs are functional both on land and at sea), it is not easy to envision what the first whales looked like. Extinct but already fully marine cetaceans are known from the fossil record. How was the gap between a walking mammal and a swimming whale bridged? Missing until recently were fossils clearly intermediate, or transitional, between land mammals and cetaceans.</p>\r\n<p>Very exciting discoveries have finally allowed scientists to reconstruct the most likely origins of cetaceans. In 1979, a team looking for fossils in northern Pakistan found what proved to be the oldest fossil whale. The fossil was officially named Pakicetus in honor of the country where the discovery was made. Pakicetus was found embedded in rocks formed from river deposits that were 52 million years old. The river that formed these deposits was actually not far from an ancient ocean known as the Tethys Sea.</p>\r\n<p>The fossil consists of a complete skull of an archaeocyte, an extinct group of ancestors of modern cetaceans. Although limited to a skull, the Pakicetus fossil provides precious details on the origins of cetaceans. The skull is cetacean-like but its jawbones lack the enlarged space that is filled with fat or oil and used for receiving underwater sound in modern whales. Pakicetus probably detected sound through the ear opening as in land mammals. The skull also lacks a blowhole, another cetacean adaptation for diving. Other features, however, show experts that Pakicetus is a transitional form between a group of extinct flesh- eating mammals, the mesonychids, and cetaceans. It has been suggested that Pakicetus fed on fish in shallow water and was not yet adapted for life in the open ocean. It probably bred and gave birth on land.</p>\r\n<p>Another major discovery was made in Egypt in 1989. Several skeletons of another early whale, Basilosaurus, were found in sediments left by the Tethys Sea and now exposed in the Sahara desert. This whale lived around 40 million years ago, 12 million years after Pakicetus. Many incomplete skeletons were found but they included, for the first time in an archaeocyte, a complete hind leg that features a foot with three tiny toes. Such legs would have been far too small to have supported the 50-foot-long Basilosaurus on land. Basilosaurus was undoubtedly a fully marine whale with possibly nonfunctional, or vestigial, hind legs.</p>\r\n<p>An even more exciting find was reported in 1994, also from Pakistan. The now extinct whale Ambulocetus natans (\"the walking whale that swam\") lived in the Tethys Sea 49 million years ago. It lived around 3 million years after Pakicetus but 9 million before Basilosaurus. The fossil luckily includes a good portion of the hind legs. The legs were strong and ended in long feet very much like those of a modern pinniped. The legs were certainly functional both on land and at sea. The whale retained a tail and lacked a fluke, the major means of locomotion in modern cetaceans. The structure of the backbone shows, however, that Ambulocetus swam like modern whales by moving the rear portion of its body up and down, even though a fluke was missing. The large hind legs were used for propulsion in water. On land, where it probably bred and gave birth, Ambulocetus may have moved around very much like a modern sea lion. It was undoubtedly a whale that linked life on land with life at sea.</p>\r\n<p>1. Fluke: the two parts that constitute the large triangular tail of a whale</p>\r\n<p>2. Blowhole: a hole in the top of the head used for breathing</p>', '戏剧的起源', '');
INSERT INTO `q_reading_passage` VALUES ('3', 'Timberline Vegetation on Mountains', '<p>The transition from forest to treeless tundra on a mountain slope is often a dramatic one. Within a vertical distance of just a few tens of meters, trees disappear as a life-form and are replaced by low shrubs, herbs, and grasses. This rapid zone of transition is called the upper timberline or tree line. In many semiarid areas there is also a lower timberline where the forest passes into steppe or desert at its lower edge, usually because of a lack of moisture.</p>\r\n<p>The upper timberline, like the snow line, is highest in the tropics and lowest in the Polar Regions. It ranges from sea level in the Polar Regions to 4,500 meters in the dry subtropics and 3,500-4,500 meters in the moist tropics. Timberline trees are normally evergreens, suggesting that these have some advantage over deciduous trees (those that lose their leaves) in the extreme environments of the upper timberline. There are some areas, however, where broadleaf deciduous trees form the timberline. Species of birch, for example, may occur at the timberline in parts of the Himalayas.</p>\r\n<p>At the upper timberline the trees begin to become twisted and deformed. This is particularly true for trees in the middle and upper latitudes, which tend to attain greater heights on ridges, whereas in the tropics the trees reach their greater heights in the valleys. This is because middle- and upper- latitude timberlines are strongly influenced by the duration and depth of the snow cover. As the snow is deeper and lasts longer in the valleys, trees tend to attain greater heights on the ridges, even though they are more exposed to high-velocity winds and poor, thin soils there. In the tropics, the valleys appear to be more favorable because they are less prone to dry out, they have less frost, and they have deeper soils.</p>\r\n<p>There is still no universally agreed-on explanation for why there should be such a dramatic cessation of tree growth at the upper timberline. Various environmental factors may play a role. Too much snow, for example, can smother trees, and avalanches and snow creep can damage or destroy them. Late-lying snow reduces the effective growing season to the point where seedlings cannot establish themselves. Wind velocity also increases with altitude and may cause serious stress for trees, as is made evident by the deformed shapes at high altitudes. Some scientists have proposed that the presence of increasing levels of ultraviolet light with elevation may play a role, while browsing and grazing animals like the ibex may be another contributing factor. Probably the most important environmental factor is temperature, for if the growing season is too short and temperatures are too low, tree shoots and buds cannot mature sufficiently to survive the winter months.</p>\r\n<p>Above the tree line there is a zone that is generally called alpine tundra. Immediately adjacent to the timberline, the tundra consists of a fairly complete cover of low-lying shrubs, herbs, and grasses, while higher up the number and diversity of species decrease until there is much bare ground with occasional mosses and lichens and some prostrate cushion plants. Some plants can even survive in favorable microhabitats above the snow line. The highest plants in the world occur at around 6,100 meters on Makalu in the Himalayas. At this great height, rocks, warmed by the sun, melt small snowdrifts.</p>\r\n<p>The most striking characteristic of the plants of the alpine zone is their low growth form. This enables them to avoid the worst rigors of high winds and permits them to make use of the higher temperatures immediately adjacent to the ground surface. In an area where low temperatures are limiting to life, the importance of the additional heat near the surface is crucial. The low growth form can also permit the plants to take advantage of the insulation provided by a winter snow cover. In the equatorial mountains the low growth form is less prevalent.</p>', '山上树带界线的植被', '');
INSERT INTO `q_reading_passage` VALUES ('4', 'Desert Formation', '<p>The deserts, which already occupy approximately a fourth of the Earth\'s land surface, have in recent decades been increasing at an alarming pace. The expansion of desertlike conditions into areas where they did not previously exist is called desertification. It has been estimated that an additional one-fourth of the Earth\'s land surface is threatened by this process.</p>\r\n<p>Desertification is accomplished primarily through the loss of stabilizing natural vegetation and the subsequent accelerated erosion of the soil by wind and water. In some cases the loose soil is blown completely away, leaving a stony surface. In other cases, the finer particles may be removed, while the sand-sized particles are accumulated to form mobile hills or ridges of sand.</p>\r\n<p>Even in the areas that retain a soil cover, the reduction of vegetation typically results in the loss of the soil\'s ability to absorb substantial quantities of water. The impact of raindrops on the loose soil tends to transfer fine clay particles into the tiniest soil spaces, sealing them and producing a surface that allows very little water penetration. Water absorption is greatly reduced; consequently runoff is increased, resulting in accelerated erosion rates. The gradual drying of the soil caused by its diminished ability to absorb water results in the further loss of vegetation, so that a cycle of progressive surface deterioration is established.</p>\r\n<p>In some regions, the increase in desert areas is occurring largely as the result of a trend toward drier climatic conditions. Continued gradual global warming has produced an increase in aridity for some areas over the past few thousand years. The process may be accelerated in subsequent decades if global warming resulting from air pollution seriously increases.</p>\r\n<p>There is little doubt, however, that desertification in most areas results primarily from human activities rather than natural processes. The semiarid lands bordering the deserts exist in a delicate ecological balance and are limited in their potential to adjust to increased environmental pressures. Expanding populations are subjecting the land to increasing pressures to provide them with food and fuel. In wet periods, the land may be able to respond to these stresses. During the dry periods that are common phenomena along the desert margins, though, the pressure on the land is often far in excess of its diminished capacity, and desertification results.</p>\r\n<p>Four specific activities have been identified as major contributors to the desertification processes: overcultivation, overgrazing, firewood gathering, and overirrigation. The cultivation of crops has expanded into progressively drier regions as population densities have grown. These regions are especially likely to have periods of severe dryness, so that crop failures are common. Since the raising of most crops necessitates the prior removal of the natural vegetation, crop failures leave extensive tracts of land devoid of a plant cover and susceptible to wind and water erosion.</p>\r\n<p>The raising of livestock is a major economic activity in semiarid lands, where grasses are generally the dominant type of natural vegetation. The consequences of an excessive number of livestock grazing in an area are the reduction of the vegetation cover and the trampling and pulverization of the soil. This is usually followed by the drying of the soil and accelerated erosion.</p>\r\n<p>Firewood is the chief fuel used for cooking and heating in many countries. The increased pressures of expanding populations have led to the removal of woody plants so that many cities and towns are surrounded by large areas completely lacking in trees and shrubs. The increasing use of dried animal waste as a substitute fuel has also hurt the soil because this valuable soil conditioner and source of plant nutrients is no longer being returned to the land.</p>\r\n<p>The final major human cause of desertification is soil salinization resulting from overirrigation. Excess water from irrigation sinks down into the water table. If no drainage system exists, the water table rises, bringing dissolved salts to the surface. The water evaporates and the salts are left behind, creating a white crustal layer that prevents air and water from reaching the underlying soil.</p>\r\n<p>The extreme seriousness of desertification results from the vast areas of land and the tremendous numbers of people affected, as well as from the great difficulty of reversing or even slowing the process. Once the soil has been removed by erosion, only the passage of centuries or millennia will enable new soil to form. In areas where considerable soil still remains, though, a rigorously enforced program of land protection and cover-crop planting may make it possible to reverse the present deterioration of the surface.</p>', '沙漠的形成', '');
INSERT INTO `q_reading_passage` VALUES ('5', 'The Origins of Cetaceans', '<p>In seeking to describe the origins of theater, one must rely primarily on speculation, since there is little concrete evidence on which to draw. The most widely accepted theory, championed by anthropologists in the late nineteenth and early twentieth centuries, envisions theater as emerging out of myth and ritual. The process perceived by these anthropologists may be summarized briefly. During the early stages of its development, a society becomes aware of forces that appear to influence or control its food supply and well-being. Having little understanding of natural causes, it attributes both desirable and undesirable occurrences to supernatural or magical forces, and it searches for means to win the favor of these forces. Perceiving an apparent connection between certain actions performed by the group and the result it desires, the group repeats, refines and formalizes those actions into fixed ceremonies, or rituals.</p>\r\n<p>Stories (myths) may then grow up around a ritual. Frequently the myths include representatives of those supernatural forces that the rites celebrate or hope to influence. Performers may wear costumes and masks to represent the mythical characters or supernatural forces in the rituals or in accompanying celebrations. As a person becomes more sophisticated, its conceptions of supernatural forces and causal relationships may change. As a result, it may abandon or modify some rites. But the myths that have grown up around the rites may continue as part of the group\'s oral tradition and may even come to be acted out under conditions divorced from these rites. When this occurs, the first step has been taken toward theater as an autonomous activity, and thereafter entertainment and aesthetic values may gradually replace the former mystical and socially efficacious concerns.</p>\r\n<p>Although origin in ritual has long been the most popular, it is by no means the only theory about how the theater came into being. Storytelling has been proposed as one alternative. Under this theory, relating and listening to stories are seen as fundamental human pleasures. Thus, the recalling of an event (a hunt, battle, or other feat) is elaborated through the narrator\'s pantomime and impersonation and eventually through each role being assumed by a different person.</p>\r\n<p>A closely related theory sees theater as evolving out of dances that are primarily pantomimic, rhythmical or gymnastic, or from imitations of animal noises and sounds. Admiration for the performer\'s skill, virtuosity, and grace are seen as motivation for elaborating the activities into fully realized theatrical performances.</p>\r\n<p>In addition to exploring the possible antecedents of theater, scholars have also theorized about the motives that led people to develop theater. Why did theater develop, and why was it valued after it ceased to fulfill the function of ritual? Most answers fall back on the theories about the human mind and basic human needs. One, set forth by Aristotle in the fourth century B.C., sees humans as naturally imitative—as taking pleasure in imitating persons, things, and actions and in seeing such imitations. Another, advanced in the twentieth century, suggests that humans have a gift for fantasy, through which they seek to reshape reality into more satisfying forms than those encountered in daily life. Thus, fantasy or fiction (of which drama is one form) permits people to objectify their anxieties and fears, confront them, and fulfill their hopes in fiction if not fact. The theater, then, is one tool whereby people define and understand their world or escape from unpleasant realities.</p>\r\n<p>But neither the human imitative instinct nor a penchant for fantasy by itself leads to an autonomous theater. Therefore, additional explanations are needed. One necessary condition seems to be a somewhat detached view of human problems. For example, one sign of this condition is the appearance of the comic vision, since comedy requires sufficient detachment to view some deviations from social norms as ridiculous rather than as serious threats to the welfare of the entire group. Another condition that contributes to the development of autonomous theater is the emergence of the aesthetic sense. For example, some early societies ceased to consider certain rites essential to their well-being and abandoned them, nevertheless, they retained as parts of their oral tradition the myths that had grown up around the rites and admired them for their artistic qualities rather than for their religious usefulness.</p>', '鲸类的起源', '');
INSERT INTO `q_reading_passage` VALUES ('6', 'Early Cinema', '<p>The cinema did not emerge as a form of mass consumption until its technology evolved from the initial \"peepshow\" format to the point where images were projected on a screen in a darkened theater. In the peepshow format, a film was viewed through a small opening in a machine that was created for that purpose. Thomas Edison\'s peepshow device, the Kinetoscope, was introduced to the public in 1894. It was designed for use in Kinetoscope parlors, or arcades, which contained only a few individual machines and permitted only one customer to view a short, 50-foot film at any one time. The first Kinetoscope parlors contained five machines. For the price of 25 cents (or 5 cents per machine), customers moved from machine to machine to watch five different films (or, in the case of famous prizefights, successive rounds of a single fight).</p>\r\n<p>These Kinetoscope arcades were modeled on phonograph parlors, which had proven successful for Edison several years earlier. In the phonograph parlors, customers listened to recordings through individual ear tubes, moving from one machine to the next to hear different recorded speeches or pieces of music. The Kinetoscope parlors functioned in a similar way. Edison was more interested in the sale of Kinetoscopes (for roughly $1,000 apiece) to these parlors than in the films that would be run in them (which cost approximately $10 to $15 each). He refused to develop projection technology, reasoning that if he made and sold projectors, then exhibitors would purchase only one machine-a projector-from him instead of several.</p>\r\n<p>Exhibitors, however, wanted to maximize their profits, which they could do more readily by projecting a handful of films to hundreds of customers at a time (rather than one at a time) and by charging 25 to 50 cents admission. About a year after the opening of the first Kinetoscope parlor in 1894, showmen such as Louis and Auguste Lumiere, Thomas Armat and Charles Francis Jenkins, and Orville and Woodville Latham (with the assistance of Edison\'s former assistant, William Dickson) perfected projection devices. These early projection devices were used in vaudeville theaters, legitimate theaters, local town halls, makeshift storefront theaters, fairgrounds, and amusement parks to show films to a mass audience.</p>\r\n<p>With the advent of projection in 1895-1896, motion pictures became the ultimate form of mass consumption. Previously, large audiences had viewed spectacles at the theater, where vaudeville, popular dramas, musical and minstrel shows, classical plays, lectures, and slide-and-lantern shows had been presented to several hundred spectators at a time. But the movies differed significantly from these other forms of entertainment, which depended on either live performance or (in the case of the slide-and-lantern shows) the active involvement of a master of ceremonies who assembled the final program.</p>\r\n<p>Although early exhibitors regularly accompanied movies with live acts, the substance of the movies themselves is mass-produced, prerecorded material that can easily be reproduced by theaters with little or no active participation by the exhibitor. Even though early exhibitors shaped their film programs by mixing films and other entertainments together in whichever way they thought would be most attractive to audiences or by accompanying them with lectures, their creative control remained limited. What audiences came to see was the technological marvel of the movies; the lifelike reproduction of the commonplace motion of trains, of waves striking the shore, and of people walking in the street; and the magic made possible by trick photography and the manipulation of the camera.</p>\r\n<p>With the advent of projection, the viewer\'s relationship with the image was no longer private, as it had been with earlier peepshow devices such as the Kinetoscope and the Mutoscope, which was a similar machine that reproduced motion by means of successive images on individual photographic cards instead of on strips of celluloid.It suddenly became public-an experience that the viewer shared with dozens, scores, and even hundreds of others. At the same time, the image that the spectator looked at expanded from the minuscule peepshow dimensions of 1 or 2 inches (in height) to the life-size proportions of 6 or 9 feet.</p>', '早期影院', '');
INSERT INTO `q_reading_passage` VALUES ('7', 'Petroleum Resources', '<p>Petroleum, consisting of crude oil and natural gas, seems to originate from organic matter in marine sediment. Microscopic organisms settle to the seafloor and accumulate in marine mud. The organic matter may partially decompose, using up the dissolved oxygen in the sediment. As soon as the oxygen is gone, decay stops and the remaining organic matter is preserved.</p>\r\n<p>Continued sedimentation—the process of deposits\' settling on the sea bottom—buries the organic matter and subjects it to higher temperatures and pressures, which convert the organic matter to oil and gas. As muddy sediments are pressed together, the gas and small droplets of oil may be squeezed out of the mud and may move into sandy layers nearby. Over long periods of time (millions of years), accumulations of gas and oil can collect in the sandy layers. Both oil and gas are less dense than water, so they generally tend to rise upward through water-saturated rock and sediment.</p>\r\n<p>Oil pools are valuable underground accumulations of oil, and oil fields are regions underlain by one or more oil pools. When an oil pool or field has been discovered, wells are drilled into the ground. Permanent towers, called derricks, used to be built to handle the long sections of drilling pipe. Now portable drilling machines are set up and are then dismantled and removed. When the well reaches a pool, oil usually rises up the well because of its density difference with water beneath it or because of the pressure of expanding gas trapped above it. Although this rise of oil is almost always carefully controlled today, spouts of oil, or gushers, were common in the past. Gas pressure gradually dies out, and oil is pumped from the well. Water or steam may be pumped down adjacent wells to help push the oil out. At a refinery, the crude oil from underground is separated into natural gas, gasoline, kerosene, and various oils. Petrochemicals such as dyes, fertilizer, and plastic are also manufactured from the petroleum.</p>\r\n<p>As oil becomes increasingly difficult to find, the search for it is extended into more-hostile environments. The development of the oil field on the North Slope of Alaska and the construction of the Alaska pipeline are examples of the great expense and difficulty involved in new oil discoveries. Offshore drilling platforms extend the search for oil to the ocean\'s continental shelves—those gently sloping submarine regions at the edges of the continents. More than one-quarter of the world\'s oil and almost one-fifth of the world\'s natural gas come from offshore, even though offshore drilling is six to seven times more expensive than drilling on land. A significant part of this oil and gas comes from under the North Sea between Great Britain and Norway.</p>\r\n<p>Of course, there is far more oil underground than can be recovered. It may be in a pool too small or too far from a potential market to justify the expense of drilling. Some oil lies under regions where drilling is forbidden, such as national parks or other public lands. Even given the best extraction techniques, only about 30 to 40 percent of the oil in a given pool can be brought to the surface. The rest is far too difficult to extract and has to remain underground.</p>\r\n<p>Moreover, getting petroleum out of the ground and from under the sea and to the consumer can create environmental problems anywhere along the line. Pipelines carrying oil can be broken by faults or landslides, causing serious oil spills. Spillage from huge oil-carrying cargo ships, called tankers, involved in collisions or accidental groundings (such as the one off Alaska in 1989) can create oil slicks at sea. Offshore platforms may also lose oil, creating oil slicks that drift ashore and foul the beaches, harming the environment. Sometimes, the ground at an oil field may subside as oil is removed. The Wilmington field near Long Beach, California, has subsided nine meters in 50 years; protective barriers have had to be built to prevent seawater from flooding the area. Finally, the refining and burning of petroleum and its products can cause air pollution. Advancing technology and strict laws, however, are helping control some of these adverse environmental effects.</p>', '石油资源', '');
INSERT INTO `q_reading_passage` VALUES ('8', 'Ancient Coastlines', '<p>Information on past climates is primary of relevance to archaeology because of what it tells us about the effects on the land and on the resources that people needed to survive. The most <span class=\"strong-line js-scrollto\">crucial</span> effect of climate was on the sheer quantity of land available in each period, measurable by studying ancient coastlines. These have changed constantly through time, even in relatively recent periods, as can be seen from the Neolithic stone circle of Er Lannic, in Brittany, France (once inland but now half submerged on an island) or medieval villages in east Yorkshire, England, that have tumbled into the sea in the last few centuries as the North Sea gnaws its way westward and erodes the cliffs. Conversely, silts deposited by rivers sometimes push the sea farther back, creating new land, as at Ephesus in western Turkey, a port on the coast in Roman times but today some five kilometers inland.</p>\r\n<p>Nevertheless, for archeologists concerned with the long periods of time of the Paleolithic period there are variations in coastlines of much greater magnitude to consider. The expansion and contraction of the continental glaciers caused huge and uneven rises and falls in sea levels worldwide. When the ice sheets grew, the sea level would drop as water became locked up in the glaciers; when the ice melted, the sea level would rise again. Falls in sea level often exposed a number of important land bridges, such as those linking Alaska to northeast Asia and Britain to northwest Europe, a phenomenon with far reaching effects not only on human colonization of the globe but also on the environment as a whole-the flora and fauna of isolated or insular areas were radically and often irreversibly affected. Between Alaska and Asia today lies the Bering Strait, which is so shallow that a fall in sea level of only four meters would turn it into a land bridge. When the ice sheets were at their greatest extent some 18,000 years ago (the glacier maximum), it is thought that the fall was about 120 meters, which therefore created not merely a bridge but a vast plain, 1,000 kilometers from the north to the south, which has been called Beringia. The existence of Beringia (and the extent to which it could have supported human life) is one of the crucial pieces of evidence in the continuing debate about the likely route and date of human colonization of the New World.</p>\r\n<p>The assessment of past rises and falls in sea level requires study of submerged land surfaces off the coast and of raised of elevated beaches on land. Raised beaches are remnants of former coastlines at higher levels relative to the present shoreline and visible, for instance, along the Californian coast north of San Francisco, the height of a raised beach above the present shoreline, however, does not generally give a straightforward indication of the height of a former sea level. In the majority of cases, the beaches lie at a higher level because the land has been raised up through isostatic uplift or tectonic movement. Isostatic uplift of the land occurs when the weight of ice is removed as temperatures rise, as at the end of an ice age; it has affected coastlines, for example, in Scandinavia, Scotland, Alaska, and Newfoundland during the postglacial period. Tectonic movements involve displacements in the plates that make up Earth\'s crust, Middle and Late Pleistocene raised beaches in the Mediterranean are one instance of such movements.</p>\r\n<p>Raised beaches often consist of areas of sand, pebbles, or dunes, sometimes containing seashells or piles of debris comprising shells and bones of marine animals used by humans. In Tokyo Bay, for example, shell mounds of the Jomon period (about 10,000 to 300 B.C.E.) mark the position of the shoreline at a time of maximum inundation by the sea (6,500-5,500 years ago), when, through tectonic movement, the sea was three to five meters higher in relation to the contemporary landmass of Japan than at present. Analysis of the shells themselves has confirmed the changes in marine topography, for it is only during the maximum phase that subtropical species of mollusc are present, indicating a higher water temperature.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('9', 'Ancient Rome and Greece', '<p>There is a quality of cohesiveness about the Roman world that applied neither to Greece nor perhaps to any other civilization, ancient or modern. Like the stone of Roman wall, which were held together both by the regularity of the design and by that peculiarly powerful Roman cement, so the various parts of the Roman realm were bonded into a massive, monolithic entity by physical, organizational, and psychological controls. The physical bonds included the network of military garrisons, which were stationed in every province, and the network of stone-built roads that linked the provinces with Rome. The organizational bonds were based on the common principles of law and administration and on the universal army of officials who enforced common standards of conduct. The psychological controls were built on fear and punishment—on the absolute certainty that anyone or anything that threatened the authority of Rome would be utterly destroyed.</p>\r\n<p>The source of Roman obsession with unity and cohesion may well have lain in the pattern of Rome\'s early development. Whereas Greece had grown from scores of scattered cities, Rome grew from one single organism. While the Greek world had expanded along the Mediterranean seas lanes, the Roman world was assembled by territorial conquest. Of course, the contrast is not quite so stark: in Alexander the Great the Greeks had found the greatest territorial conqueror of all time; and the Romans, once they moved outside Italy, did not fail to learn the lessons of sea power. Yet the essential difference is undeniable. The key to the Greek world lay in its high-powered ships; the key to Roman power lay in its marching legions. The Greeks were wedded to the sea; the Romans, to the land. The Greek was a sailor at heart; the Roman, a landsman.</p>\r\n<p>Certainly, in trying to explain the Roman phenomenon, one would have to place great emphasis on this almost instinct for the territorial imperative. Roman priorities lay in the organization, exploitation, and defense of their territory. In all probability it was the fertile plain of Latium, where the Latins who founded Rome originated, that created the habits and skills of landed settlement, landed property, landed economy, landed administration, and a land-based society. From this arose the Roman genius for military organization and orderly government. In turn, a deep attachment to the land, and to the stability which rural life engenders, fostered the Roman virtues: gravitas, a sense of responsibility, pietas, a sense of devotion to family and country, and iustitia, a sense of the natural order.</p>\r\n<p>Modern attitudes to Roman civilization range from the infinitely impressed to the thoroughly disgusted. As always, there are the power worshippers, especially among historians, who are predisposed to admire whatever is strong, who feel more attracted to the might of Rome than to the subtlety of Greece. At the same time, there is a solid body of opinion that dislikes Rome. For many, Rome is at best the imitator and the continuator of Greece on a larger scale. Greek civilization had quality; Rome, mere quantity. Greece was original; Rome, derivative. Greece had style; Rome had money. Greece was the inventor; Rome, the research and development division. Such indeed was the opinion of some of the more intellectual Romans. \"Had the Greeks held novelty in such disdain as we,\" asked Horace in his epistle, \"what work of ancient date would now exist?\"</p>\r\n<p>Rome\'s debt to Greece was enormous. The Romans adopted Greek religion and moral philosophy. In literature, Greek writers were consciously used as models by their Latin successors. It was absolutely accepted that an educated Roman should be fluent in Greek. In speculative philosophy and the sciences, the Romans made virtually no advance on early achievements.</p>\r\n<p>Yet it would be wrong to suggest that Rome was somehow a junior partner in Greco-Roman civilization. The Roman genius was projected into new spheres—especially into those of law, military organization, administration, and engineering. Moreover, the tensions that arose within the Roman state produced literary and artistic sensibilities of the highest order. It was no accident that many leading Roman soldiers and statesmen were writers of high caliber.</p>', '古罗马和希腊', '');
INSERT INTO `q_reading_passage` VALUES ('10', 'Bamboo', '<p>Bambuseae, more commonly known as bamboo, is a tribe of flowering perennial evergreen plants in the grass family Poaceae, subfamily Bambusoideae, tribe Bambuseae. Bamboo species are found in diverse climates, from cold mountains to hot tropical regions. They occur across East Asia, east through to Northern Australia and west to India and the Himalayas. They also occur in sub-Saharan Africa, and in the Americas from the mid-Atlantic United States south to Argentina and Chile. Bamboo is an integral part of local culture in many of the regions where it is found, particularly in South America and most of southern and eastern Asia; in these places, bamboo is used in construction, as a food source, and as a versatile raw product.</p>\r\n<p>High-quality bamboo is renowned for being stronger than steel, a property that has made it a choice building material. In South America, where bamboo is used extensively for house construction, the plant is colloquially referred to as \"vegetable steel.\"</p>\r\n<p>The unusual strength of bamboo comes from a combination of cellulose fibers and lignin, which are easily distinguished in a cross-sectional view of a bamboo stem. The cellulose fibers appear as small black spots, while the lighter-colored material is the lignin. Cellulose fibers run along the length of the plant and ferry nutrients between the leaves and roots, while lignin, a relatively weak and malleable complex polymer, acts as filler material and aids in conducting water throughout the plant. The composite formed by lignin and cellulose fiber is often likened to the combination of grey concrete and steel bars typically used in building construction. Lignin is the concrete—hard and sturdy, but cracking and crumbling under heavy tensile stress. Cellulose fibers are the steel bars—able to bend without cracking, but folding under significant loads. Together, however, cellulose and lignin form a structure that is both sturdy and flexible, allowing bamboo to withstand incredible forces. A short, straight column of bamboo with a top surface area of 10 square centimeters is strong enough to support an 11,000-pound elephant.</p>\r\n<p>On top of their remarkable strength, bamboos are also some of the fastest-growing plants in the world, with growth rates of 250 cm (98 in) in 24 hours in extreme cases. Their rapid growth hinges upon a unique rhizome-dependent system. Rhizomes are horizontal stems extending from the plant that travel underground with the objective of colonizing new territory. As rhizomes spread through the soil, they collect and store the primary nutrients for growth. The storage of energy is the primary reason we see bamboo exhibit rapid and extensive growth. This also gives bamboo plants the ability to utilize energy both created from photosynthesis and stored in the rhizomes.  Spreading rhizomes will eventually travel upwards to create a new bamboo stem called a culm. Over time, the rhizomes will create an interconnected system of culms, all of which draw on the rhizomes for nutrients.</p>\r\n<p>Unlike trees, individual bamboo culms emerge from the ground at their full diameter and grow to their full height in a single growing season of three to four months. During these several months, each new bamboo shoot grows vertically into a culm with no branching out until the majority of the mature height is reached. Then, the branches extend from the nodes and leafing out occurs. In the next two years, the pulpy wall of each culm gradually hardens, after which the shoot is considered a fully mature culm. Over the next 2–5 years (depending on species), fungus begins to form on the outside of the culm, which eventually penetrates and overcomes the culm. Around 5–8 years later (species and climate dependent), the fungal growths cause the culm to collapse and decay. This brief life means culms are ready for harvest and suitable for use in construction within about three to seven years. Individual bamboo culms do not get any taller or larger in diameter in subsequent years than they do in their first year, and they do not replace any growth lost from pruning or natural breakage.</p>\r\n<p>Most bamboo species flower infrequently, with many only flowering at intervals as long as 65 or 120 years. These taxa exhibit gregarious flowering, with all plants in a particular species flowering worldwide over a several-year period regardless of climatic conditions, after which the plants die. The lack of environmental influences attributable to the time of flowering indicates the presence of an \"alarm clock\" in each plant that signals the diversion of all energy to flower production and the cessation of vegetative growth.</p>\r\n<p>Mass flowering has direct economic and ecological consequences. The mass flowering and fruiting of Melocanna bambusoides every 30–35 years around the Bay of Bengal drastically affects local residents. The death of the bamboo plants following their fruiting means the local people lose their building material, and the large increase in bamboo fruit leads to a rapid increase in rodent populations. As rodents proliferate, they consume all available food, including grain fields and stored food, sometimes resulting in famine. These rats can also carry dangerous diseases, such as typhus, typhoid, and bubonic plague, which can reach epidemic proportions as the rodents increase in number. The mechanism of bamboo mass flowering, as well as the evolutionary cause behind it, is still largely a mystery.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('11', 'Chinese Pottery', '<p>China has one of the world\'s oldest continuous civilizations—despite invasions and occasional foreign rule. A country as vast as China with so long-lasting a civilization has a complex social and visual history, within which pottery and porcelain play a major role.</p>\r\n<p>The function and status of ceramics in China varied from dynasty to dynasty, so they may be utilitarian, burial, trade-collectors\', or even ritual objects, according to their quality and the era in which they were made. The ceramics fall into three broad types—earthenware, stoneware, and porcelain—for vessels, architectural items such as roof tiles, and modeled objects and figures. In addition, there was an important group of sculptures made for religious use, the majority of which were produced in earthenware.</p>\r\n<p>The earliest ceramics were fired to earthenware temperatures, but as early as the fifteenth century B.C., high-temperature stonewares were being made with glazed surfaces. During the Six Dynasties period (AD 265-589), kilns in north China were producing high-fired ceramics of good quality. Whitewares produced in Hebei and Henan provinces from the seventh to the tenth centuries evolved into the highly prized porcelains of the Song dynasty (AD. 960-1279), long regarded as one of the high points in the history of China\'s ceramic industry. The tradition of religious sculpture extends over most historical periods but is less clearly delineated than that of stonewares or porcelains, for it embraces the old custom of earthenware burial ceramics with later religious images and architectural ornament. Ceramic products also include lead-glazed tomb models of the Han dynasty, three-color lead-glazed vessels and figures of the Tang dynasty, and Ming three-color temple ornaments, in which the motifs were outlined in a raised trail of slip—as well as the many burial ceramics produced in imitation of vessels made in materials of higher intrinsic value.</p>\r\n<p>Trade between the West and the settled and prosperous Chinese dynasties introduced new forms and different technologies. One of the most far-reaching examples is the impact of the fine ninth-century AD. Chinese porcelain wares imported into the Arab world. So admired were these pieces that they encouraged the development of earthenware made in imitation of porcelain and instigated research into the method of their manufacture. From the Middle East the Chinese acquired a blue pigment—a purified form of cobalt oxide unobtainable at that time in China—that contained only a low level of manganese. Cobalt ores found in China have a high manganese content, which produces a more muted blue-gray color. In the seventeenth century, the trading activities of the Dutch East India Company resulted in vast quantities of decorated Chinese porcelain being brought to Europe, which stimulated and influenced the work of a wide variety of wares, notably Delft. The Chinese themselves adapted many specific vessel forms from the West, such as bottles with long spouts, and designed a range of decorative patterns especially for the European market.</p>\r\n<p>Just as painted designs on Greek pots may seem today to be purely decorative, whereas in fact they were carefully and precisely worked out so that at the time, their meaning was clear, so it is with Chinese pots. To twentieth-century eyes, Chinese pottery may appear merely decorative, yet to the Chinese the form of each object and its adornment had meaning and significance. The dragon represented the emperor, and the phoenix, the empress; the pomegranate indicated fertility, and a pair of fish, happiness; mandarin ducks stood for wedded bliss; the pine tree, peach, and crane are emblems of long life; and fish leaping from waves indicated success in the civil service examinations. Only when European decorative themes were introduced did these meanings become obscured or even lost.</p>\r\n<p>From early times pots were used in both religious and secular contexts. The imperial court commissioned work and in the Yuan dynasty (A.D. 1279-1368) an imperial ceramic factory was established at Jingdezhen. Pots played an important part in some religious ceremonies. Long and often lyrical descriptions of the different types of ware exist that assist in classifying pots, although these sometimes confuse an already large and complicated picture.</p>', '中国的陶瓷', '');
INSERT INTO `q_reading_passage` VALUES ('12', 'Competition', '<p>When several individuals of the same species or of several different species depend on the same limited resource, a situation may arise that is referred to as competition. The existence of competition has been long known to naturalists; its effects were described by Darwin in considerable detail. Competition among individuals of the same species (intraspecies competition), one of the major mechanisms of natural selection, is the concern of evolutionary biology. Competition among the individuals of different species (interspecies competition) is a major concern of ecology. It is one of the factors controlling the size of competing populations, and extreme cases it may lead to the extinction of one of the competing species. This was described by Darwin for indigenous New Zealand species of animals and plants, which died out when competing species from Europe were introduced.</p>\r\n<p>No serious competition exists when the major needed resource is in superabundant supply, as in most cases of the coexistence of herbivores (plant eaters). Furthermore, most species do not depend entirely on a single resource, if the major resource for a species becomes scarce, the species can usually shift to alternative resources. If more than one species is competing for a scarce resource, the competing species usually switch to different alternative resources. Competition is usually most severe among close relatives with similar demands on the environment. But it may also occur among totally unrelated forms that compete for the same resource, such as seed-eating rodents and ants. The effects of such competition are graphically demonstrated when all the animals or all the plants in an ecosystem come into competition, as happened 2 million years ago at the end of Pliocene, when North and South America became joined by the Isthmus of Panama. North and South American species migrating across the Isthmus now came into competition with each other. The result was the extermination of a large fraction of the South American mammals, which were apparently unable to withstand the competition from invading North American species----although added predation was also an important factor.</p>\r\n<p>To what extent competition determines the composition of a community and the density of particular species has been the source of considerable controversy. The problem is that competition ordinarily cannot be observed directly but must be inferred from the spread or increase of one species and the concurrent reduction or disappearance of another species. The Russian biologist G. F. Gause performed numerous tow-species experiments in the laboratory, in which one of the species became extinct when only a single kind of resource was available. On the basis of these experiments and of field observations, the so-called law of competitive exclusion was formulated, according to which no two species can occupy the same niche. Numerous seeming exceptions to this law have since been found, but they can usually be explained as cases in which the two species, even though competing for a major joint resource, did not really occupy exactly the same niche.</p>\r\n<p>Competition among species is of considerable evolutionary importance. The physical structure of species competing for resources in the same ecological niche tends to gradually evolve in ways that allow them to occupy different niches. Competing species also tend to change their ranges so that their territories no longer overlap. The evolutionary effect of competition on species has been referred to as \"species selection\"; however, this description is potentially misleading. Only the individuals of a species are subject to the pressures of natural selection. The effect on the well-being and existence of a species is just the result of the effects of selection on all the individuals of the species. Thus species selection is actually a result of individual selection.</p>\r\n<p>Competition may occur for any needed resource. In the case of animals it is usually food; in the case of forest plants it may be light; in the case of substrate inhabitants it may be space, as in many shallow-water bottom-dwelling marine organisms. Indeed, it may be for any of the factors, physical as well as biotic, that are essential for organisms. Competition is usually the more severe the denser the population. Together with predation, it is the most important density-dependent factor in regulating population growth.</p>', '竞争', '');
INSERT INTO `q_reading_passage` VALUES ('13', 'Create Student Committee to Decide Funding for Student Organizations', '<p>I think students should be in charge of deciding which student organizations (for example, the jazz band or the hiking club) receive money from the university.Students should also be in charge of how much money each organization receives. A special committee made up of students could be created to make these decisions.Currently, these funding decisions are made by university administrators, but a student committee would know better than the administrators which organizations are most important to students and most deserving of the university\'s financial support. I\'m sure a lot of students would be interested in serving on the committee, and those who do serve will gain valuable leadership experience.</p>\r\n<p>Sincerely,</p>\r\n<p>Bill Jones</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('14', 'Domestication', '<p>About 10,000 years ago, after nearly 4 million years of human evolution and over 100,000 years of successful foraging for food, human beings, although <span class=\"strong-line js-scrollto\">isolated</span>, nearly simultaneously developed a subsistence strategy that involved domesticated plants and animals. Why♦ Some scholars seek a single, universal explanation that would be valid for all cases of domestication. Thus, it has been argued that domestication is the outcome of population pressure, as the increasing hunting-and-gathering human population overwhelmed the existing food resources. Others point to climate change or famine, as the post-glacial climate got drier. Increasing archaeological research has made it clear, however, that the evidence in favor of any single-cause, universally applicable explanation is not strong.</p>\r\n<p>Some scholars have proposed universally applicable explanations that take several different phenomena into account. One such explanation, called the broad-spectrum foraging argument (the argument that humans employed a subsistence strategy based on obtaining a wide range of plants and animals), is based on a reconstruction of the environmental situation that followed the retreat of the most recent glaciers. The very large animals of the Ice Age began to die out and were replaced by increased numbers of smaller animals. As sea levels rose to cover the continental shelves, fish and shellfish became more plentiful in the warmer, shallower waters. The effects on plants were equally dramatic, as forests and woodlands expanded into new areas. Consequently, scholars argue, people had to change their diets from big-game hunting to broad-spectrum foraging for plants and animals by hunting, fishing, and gathering. This broadening of the economy is said to have led to a more secure subsistence base, the emergence of sedentary communities, and a growth in population. In turn, population growth pressured the resource base of the area, and people were forced to eat so-called third-choice foods, particularly wild grain, which was difficult to harvest and process but which responded to human efforts to increase yields.</p>\r\n<p>Although the broad-spectrum foraging argument seems to describe plant domestication in the New World, the most recent evidence from ancient southwestern Asia does not support it. There is also evidence for the development of broad-spectrum foraging in Europe, but domestication did not follow. Rather, domesticated crops were brought into Europe by people from southwestern Asia—where the broad-spectrum revolution had not occurred.</p>\r\n<p>A very different argument comes from Barbara Bender, who argues that before farming began, there was competition between local groups to achieve dominance over each other through feasting and the expenditure of resources on ritual and exchange, engaging in a kind of prehistoric arms race. To meet increasing demands for food and other resources, land use was intensified, and the development of food production followed.</p>\r\n<p>This argument clearly emphasizes social factors, rather than environmental or technical factors, and takes a localized, regional approach. It is supported by ethnography (direct and systematic observations of a human culture) concerning competitive exchange activities, such as the potlatch (traditional celebrations in which groups gather and give gifts) of the indigenous inhabitants of the northwest coast of North America. These people were foragers in a rich environment that enabled them to settle in relatively permanent villages without farming or herding. Competition among neighboring groups led to ever-more elaborate forms of competitive exchange, with increasingly large amounts of food and other goods being given away at each subsequent potlatch. As suggestive as Bender\'s argument is, however, it is difficult to find evidence for competitive feasting in archaeological remains.</p>\r\n<p>Recently, archaeologists have avoided grand theories claiming that a single, universal process was responsible for domestication wherever it occurred. Many prefer to take a regional approach, searching for causes particular to one area that may or may not apply to other areas. Currently, the most powerful explanations seem to be multiple-strand theories that consider the combined local effects of climate, environment, population, technology, social organization, and diet on the emergence of domestication.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('15', 'Early Childhood Education', '<p>Preschools – educational programs for children under the age of five – differ significantly from one country to another according to the views that different societies hold regarding the purpose of early childhood education. For instance, in a cross-country comparison of preschools in China, Japan, and the United States, researchers found that parents in the three countries view the purpose of preschools very differently. Whereas parents in China tend to see preschools primarily as a way of giving children a good start academically, Japanese parents view them primarily as a way of giving children the opportunity to be members of a group. In the United States, in comparison, parents regard the primary purpose of preschools as making children more independent and self-reliant, although obtaining a good academic start and having group experience are also important.</p>\r\n<p>While many programs designed for preschoolers focus primarily on social and emotional factors, some are geared mainly toward promoting cognitive gains and preparing preschoolers for the formal instruction they will experience when they start kindergarten. In the United States, the best-known program designed to promote future academic success is Head Start. Established in the 1960s when the United States declared the War on Poverty, the program has served over 13 million children and their families. The program, which stresses parental involvement, was designed to serve the \"whole child\", including children\'s physical health, self-confidence, social responsibility, and social and emotional development.</p>\r\n<p>Whether Head Start is seen as successful or not depends on the lens through which one is looking. If, for instance, the program is expected to provide long-term increases in IQ (intelligence quotient) scores, it is a disappointment. Although graduates of Head Start programs tend to show immediate IQ gains, these increases do not last. On the other hand, it is clear that Head Start is meeting its goal of getting preschoolers ready for school. Preschoolers who participate in Head Start are better prepared for future schooling than those who do not. Furthermore, graduates of Head Start programs have better future school grade. Finally, some research suggests that ultimately Head Start graduates show higher academic performance at the end of high school, although the gains are modest.</p>\r\n<p>In addition, results from other types of preschool readiness programs indicate that those who participate and graduate are less likely to repeat grades, and they are more likely to complete school than readiness program, for every dollar spent on the program, taxpayers saved seven dollars by the time the graduates reached the age of 27.</p>\r\n<p>The most recent comprehensive evaluation of early intervention programs suggests that, taken as a group, preschool programs can provide significant benefits, and that government funds invested early in life may ultimately lead to a reduction in future costs. For instance, compared with children who did not participate in early intervention programs, participants in various programs showed gains in emotional or cognitive development, better educational outcomes, increased economic self-sufficiency, reduced levels of criminal activity, and improved health-related behaviors. Of course, not every program produced all these benefits, and not every child benefited to the same extent. Furthermore, some researchers argue that less-expensive programs are just as good as relatively expensive ones, such as Head Start. Still, the results of the evaluation were promising, suggesting that the potential benefits of early intervention can be substantial.</p>\r\n<p>Not everyone agrees that programs that seek to enhance academic skills during the preschool years are a good thing. In fact, according to developmental psychologist David Elkind, United States society tends to push children so rapidly that they begin to feel stress and pressure at a young age. Elkind argues that academic success is largely dependent upon factors out of parents\' control, such as inherited abilities and a child\'s rate of maturation. Consequently, children of a particular age cannot be expected to master educational material without taking into account their current level of cognitive development. In short, children require development appropriate educational practice, which is education that is based on both typical development and the unique characteristics of a given child.</p>', '早期儿童教育', '');
INSERT INTO `q_reading_passage` VALUES ('16', 'Fall of the Western Roman Empire', '<p>By the end of the fourth century C.E., the Roman Empire had effectively split in two. One emperor ruled the Eastern half—Greece, Egypt, and the eastern Mediterranean provinces—from the new capital of Constantinople, while another ruled the western lands of North Africa and western Europe, which remained linked Rome. The East contained the bulk of the population, and its cities were larger, more numerous, and more commercially active. The Western cities, including Rome, were chiefly military, administrative, and cultural centers that lived off the labor and productivity of the surrounding agrarian regions. The Eastern Empire managed to survive while the Western provinces disintegrated. Rome itself was conquered by Germanic tribes in 476 C.E.</p>\r\n<p>The fall of the Western Roman Empire has fascinated across the centuries not only because it represented the collapse of one of humanity\'s most impressive and enduring states—it lasted for 500 years—but also because the demise of Greco-Roman civilization marked the beginning of the so-called Dark Ages of European history. Many reasons have been proposed the most likely causes were the failure of the Roman economy change or expand and the parasitical character of the Western cities. Then too, the fifth-century Western emperors tended to be less competent than their Eastern colleagues and more potentially hazardous policy of filling their armies with German troops under Germanic generals.</p>\r\n<p>When the empire was expanding, its economy was nourished by a constant influx of goods and resources from new territories. But once expansion ceased, the West did not compensate by developing its economy internally, even though the Romans were accomplished engineers and masters of efficient organization. There was no large-scale industry, no mass production. Instead of developing centers for the production and distribution of manufactured goods, each of the various regions of the Western Empire tended more and more to produce them locally, and therefore less efficiently. Industrial production was held in low esteem by the Roman aristocracy, who had always considered it unrefined to engage in commerce or industry. Indeed, the Roman economy remained agrarian to the end, and basic farming technology advanced very little during the imperial centuries. The Roman plow was adequate but rudimentary. There were some water mills, but windmills were unknown. Roman landowners seemed little interested in laborsaving devices.</p>\r\n<p>The economic exhaustion of the Western Empire was accompanied by population decline, runaway inflation, and deepening poverty. At a time when the labor shortage was becoming acute, the army and bureaucracy were growing ever larger. Higher and higher taxes on fewer and fewer taxpayers resulted in the impoverishment of the urban middle classes, and by the fifth century the Western cities were declining in wealth and population. Only the small aristocratic class of great landowners managed to avoid taxes and prosper. As early as the third century they were withdrawing from civic affairs, abandoning their town houses, and retiring to their country estates.</p>\r\n<p>The decline of the city was damaging to the urbanized administrative structure of the Western Empire, and it crippled the civic culture that had arisen from Greco-Roman antiquity. The civilization of Athens, Alexandria, and Rome could not survive in the fields. It is in the decay of urban society that we find the crucial connecting link between political collapse and cultural transformation of the Western Roman Empire. As the Roman elite moved to the countryside, the cities and the political culture they represented were changing. All through the fifth century the Roman army and civil government were becoming Germanized just as the Germanic peoples were becoming Romanized. Indeed, the two cultures had long been merging, and during the Western Empire\'s final century its desperate emperors, faced with a growing shortage of resources and indigenous manpower, were turning more and more to non-Romans to defend their frontiers and keep order in their realm. Germans abounded in the army, entire tribes were to hold positions of high authority in the Western Empire. Survival had come to depend on the success of Germanic defenders against Germanic invaders.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('17', 'Feeding Habits of East African Herbivores', '<p>Buffalo, zebras, wildebeests, topi, and Thomson\'s gazelles live in huge groups that together make up some 90 percent of the total weight of mammals living on the Serengeti Plain of East Africa. They are all herbivores (plant-eating animals), and they all appear to be living on the same diet of grasses, herbs, and small bushes. This appearance, however, is <span class=\"strong-line js-scrollto\">illusory</span>. When biologist Richard Bell and his colleagues analyzed the stomach contents of four of the five species (they did not study buffalo), they found that each species was living on a different part of the vegetation. The different vegetational parts differ in their food qualities: lower down, there are succulent, nutritious leaves; higher up are the harder stems. There are also sparsely distributed, highly nutritious fruits, and Bell found that only the Thomson\'s gazelles eat much of these. The other three species differ in the proportion of lower leaves and higher stems that they eat: zebras eat the most stem matter, wildebeests eat the most leaves, and topi are intermediate.</p>\r\n<p>How are we to understand their different feeding preferences♦ The answer lies in two associated differences among the species, in their digestive systems and body sizes. According to their digestive systems, these herbivores can be divided into two categories: the nonruminants (such as the zebra, which has a digestive system like a horse) and the ruminants (such as the wildebeest, topi, and gazelle, which are like the cow). Nonruminants cannot extract much energy from the hard parts of a plant; however, this is more than made up for by the fast speed at which food passes through their guts. Thus, when there is only a short supply of poor-quality food, the wildebeest, topi, and gazelle enjoy an advantage. They are ruminants and have a special structure (the rumen) in their stomachs, which contains microorganisms that can break down the hard parts of plants. Food passes only slowly through the ruminant\'s gut because ruminating—digesting the hard parts—takes time. The ruminant continually regurgitates food from its stomach back to its mouth to chew it up further (that is what a cow is doing when \"chewing cud\"). Only when it has been chewed up and digested almost to a liquid can the food pass through the rumen and on through the gut. Larger particles cannot pass through until they have been chewed down to size. Therefore, when food is in short supply, a ruminant can last longer than a nonruminant because it can derive more energy out of the same food. The difference can partially explain the eating habits of the Serengeti herbivores. The zebra chooses areas where there is more low-quality food. It migrates first to unexploited areas and chomps the abundant low-quality stems before moving on. It is a fast-in/fast-out feeder, relying on a high output of incompletely digested food. By the time the wildebeests (and other ruminants) arrive, the grazing and trampling of the zebras will have worn the vegetation down. As the ruminants then set to work, they eat down to the lower, leafier parts of the vegetation. All of this fits in with the differences in stomach contents with which we began.</p>\r\n<p>The other part of the explanation is body size. Larger animals require more food than smaller animals, but smaller animals have a higher metabolic rate. Smaller animals can therefore live where there is less food, provided that such food is of high energy content. That is why the smallest of the herbivores, Thomson\'s gazelle, lives on fruit that is very nutritious but too thin on the ground to support a larger animal. By contrast, the large zebra lives on the masses of low-quality stem material.</p>\r\n<p>The differences in feeding preferences lead, in turn, to differences in migratory habits. The wildebeests follow, in their migration, the pattern of local rainfall. The other species do likewise. But when a new area is fueled by rain, the mammals migrate toward it in a set order to exploit it. The larger, less fastidious feeders, the zebras, move in first; the choosier, smaller wildebeests come later; and the smallest species of all, Thomson\'s gazelle, arrives last. The later species all depend on the preparations of the earlier one, for the actions of the zebra alter the vegetation to suit the stomachs of the wildebeest, topi, and gazelle.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('18', 'Geographic Isolation of Species', '<p>Biologist Ernst Mayr defined a species as \"an actually or potentially interbreeding population that does not interbreed with other such populations when there is opportunity to do so.\" A key event in the origin of many species is the separation of a population with its gene pool (all of the genes in a population at any one time) from other populations of the same species, thereby preventing population interbreeding. With its gene pool isolated, a separate population can follow its own evolutionary course. In the formation of many species, the initial isolation of a population seems to have been a geographic barrier. This mode of evolving new species is called allopatric speciation.</p>\r\n<p>Many factors can isolate a population geographically. A mountain range may emerge and gradually split a population of organisms that can inhabit only lowland lakes, certain fish populations might become isolated in this way. Similarity, a creeping glacier may gradually divide a population, or a land bridge such as the Isthmus of Panama may form and separate the marine life in the ocean waters on either side.</p>\r\n<p>How formidable must a geographic barrier be to keep populations apart? It depends on the ability of the organisms to move across barriers. Birds and coyotes can easily cross mountains and rivers. The passage of wind-blown tree pollen is also not hindered by such barriers, and the seeds of many plants may be earned back and forth on animals. In contrast, small rodents may find a deep canyon or a wide river an effective barrier. For example, the Grand Canyon, in the southwestern United States, separate the range of the while-tailed antelope squirrel from that of the closely related Harris\' antelope squirrel. Smaller, with a shorter tail that is white underneath, the white-tailed antelope squirrel inhabits deserts north of the canyon and west of the Colorado River in southern California. Harris\' antelope squirrel has a more limited range in deserts south of the Grand Canyon.</p>\r\n<p>Geographic isolation creates opportunities for new species to develop, but it does not necessarily lead to new species because speciation occurs only when the gene pool undergoes enough changes to establish reproductive barriers between the isolated population and its parent population. The likelihood of allopatric speciation increases when a population is small as well as isolated, making it more likely than a large population to have its gene pool changed substantially. For example, in less than two million years, small populations of stray animals and plants from the South American mainland that managed to colonize the Galapagos Islands gave rise to all the species that now inhabit the islands.</p>\r\n<p>When oceanic islands are far enough apart to permit populations to evolve in isolation, but close enough to allow occasional dispersions to occur, they are effectively outdoor laboratories of evolution. The Galapagos island chain is one of the world\'s greatest showcases of evolution. Each island was born from underwater volcanoes and was gradually covered by organisms derived from strays that rode the ocean currents and winds from other islands and continents. Organisms can also be carried to islands by other organisms, such as sea birds that travel long distances with seeds clinging to their feathers.</p>\r\n<p>The species on the Galapagos Islands today, most of which occur nowhere else, descended from organisms that floated, flew, or were blown over the sea from the South American mainland. For instance, the Galapagos island chain has a total of thirteen species of closely related birds called Galapagos finches. These birds have many similarities but differ in their feeding habits and their beak type, which is correlated with what they eat. Accumulated evidence indicates that all thirteen finch species evolved from a single small population of ancestral birds that colonized one of the islands. Completely isolated on the island after migrating from the mainland, the founder population may have undergone significant changes in its gene pool and become a new species. Later, a few individuals of this new species may have been blown by storms to a neighboring island. Isolated on this second island, the second founder population could have evolved into a second new species, which could later recolonize the island from which its founding population emigrated. Today each Galapagos island has multiple species of finches, with as many as ten on some islands.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('19', 'History Seminars Should Be Shorter', '<p>Currently, all of the seminar classes in the history department are three hours long. I would like to propose that history seminars be shortened to two hours. I make this proposal for two reasons. First, most students just cannot concentrate for three hours straight. I myself have taken these three-hour seminars and found them tiring and sometimes boring. Also, when a seminar lasts that long, people stop concentrating and stop learning, so the third hour of a three-hour seminar is a waste of everyone\'s time. Two-hour seminars would be much more efficient.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('20', 'Industrialization in the Netherlands and Scandinavia', '<p>While some European countries, such as England and Germany, began to industrialize in the eighteenth century, the Netherlands and the Scandinavian countries of Denmark, Norway, and Sweden developed later. All four of these countries lagged considerably behind in the early nineteenth century. However, they industrialized rapidly in the second half of the century, especially in the last two or three decades. In view of their later start and their lack of coal—undoubtedly the main reason they were not among the early industrializers—it is important to understand the sources of their success.</p>\r\n<p>All had small populations. At the beginning of the nineteenth century, Denmark and Norway had fewer than 1 million people, while Sweden and the Netherlands had fewer than 2.5 million inhabitants. All exhibited moderate growth rates in the course of the century (Denmark the highest and Sweden the lowest), but all more than doubled in population by 1900. Density varied greatly. The Netherlands had one of the highest population densities in Europe, whereas Norway and Sweden had the lowest Denmark was in between but closer to the Netherlands.</p>\r\n<p>Considering human capital as a characteristic of the population, however, all four countries were advantaged by the large percentages of their populations who could read and write. In both 1850 and 1914, the Scandinavian countries had the highest literacy rates in Europe, or in the world, and the Netherlands was well above the European average. This fact was of enormous value in helping the national economies find their niches in the evolving currents of the international economy.</p>\r\n<p>Location was an important factor for all four countries. All had immediate access to the sea, and this had important implications for a significant international resource, fish, as well as for cheap transport, merchant marines, and the shipbuilding industry. Each took advantage of these opportunities in its own way. The people of the Netherlands, with a long tradition of fisheries and mercantile shipping, had difficulty in developing good harbors suitable for steamships: eventually they did so at Rotterdam and Amsterdam, with exceptional results for transit trade with Germany and central Europe and for the processing of overseas foodstuffs and raw materials (sugar, tobacco, chocolate, grain, and eventually oil). Denmark also had an admirable commercial history, particularly with respect to traffic through the Sound (the strait separating Denmark and Sweden). In 1857, in return for a payment of 63 million kronor from other commercial nations, Denmark abolished the Sound toll dues the fees it had collected since 1497 for the use of the Sound. This, along with other policy shifts toward free trade, resulted in a significant increase in traffic through the Sound and in the port of Copenhagen.</p>\r\n<p>The political institutions of the four countries posed no significant barriers to industrialization or economic growth. The nineteenth century passed relatively peacefully for these countries, with progressive democratization taking place in all of them. They were reasonably well governed, without notable corruption or grandiose state projects, although in all of them the government gave some aid to railways, and in Sweden the state built the main lines. As small countries dependent on foreign markets, they followed a liberal trade policy in the main, though a protectionist movement developed in Sweden. In Denmark and Sweden agricultural reforms took place gradually from the late eighteenth century through the first half of the nineteenth, resulting in a new class of peasant landowners with a definite market orientation.</p>\r\n<p>The key factor in the success of these countries (along with high literacy, which contributed to it) was their ability to adapt to the international division of labor determined by the early industrializers and to stake out areas of specialization in international markets for which they were especially well suited. This meant a great dependence on international commerce, which had notorious fluctuations; but it also meant high returns to those factors of production that were fortunate enough to be well placed in times of prosperity. In Sweden exports accounted for 18 percent of the national income in 1870, and in 1913, 22 percent of a much larger national income. In the early twentieth century, Denmark exported 63 percent of its agricultural production: butter, pork products, and eggs. It exported 80 percent of its butter, almost all to Great Britain, where it accounted for 40 percent of British butter imports.</p>', '荷兰和斯堪的纳维亚的工业化', '');
INSERT INTO `q_reading_passage` VALUES ('21', 'Lake Water', '<p>Where does the water in a lake come from, and how does water leave it? Water enters a lake from inflowing rivers, from underwater seeps and springs, from overland flow off the surrounding land, and from rain falling directly on the lake surface. Water leaves a lake via outflowing rivers, by soaking into the bed of the lake, and by evaporation. So much is obvious.</p>\r\n<p>The questions become more complicated when actual volumes of water are considered: how much water enters and leaves by each route? Discovering the inputs and outputs of rivers is a matter of measuring the discharges of every inflowing and outflowing stream and river. Then exchanges with the atmosphere are calculated by finding the difference between the gains from rain, as measured (rather roughly) by rain gauges and the losses by evaporation, measured with models that correct for the other sources of water loss. For the majority of lakes, certainly those surrounded by forests, input from overland flow is too small to have a noticeable effect. Changes in lake level not explained by river flows plus exchanges with the atmosphere must be due to the net difference between what seeps into the lake from the groundwater and what leaks into the groundwater. Note the word \"net\": measuring the actual amounts of groundwater seepage into the lake and out of the lake is a much more complicated matter than merely inferring their difference.</p>\r\n<p>Once all this information has been gathered, it becomes possible to judge whether a lake\'s flow is mainly due to its surface inputs and outputs or to its underground inputs and outputs. If the former are greater, the lake is a surface-water-dominated lake; if the latter, it is a seepage-dominated lake. Occasionally, common sense tells you which of these two possibilities applies. For example, a pond in hilly country that maintains a steady water level all through a dry summer in spite of having no streams flowing into it must obviously be seepage dominated. Conversely, a pond with a stream flowing in one end and out the other, which dries up when the stream dries up, is clearly surface water dominated.</p>\r\n<p>By whatever means, a lake is constantly gaining water and losing water: its water does not just sit there, or, anyway, not for long. This raises the matter of a lake\'s residence time. The residence time is the average length of time that any particular molecule of water remains in the lake, and it is calculated by dividing the volume of water in the lake by the rate at which water leaves the lake. The residence time is an average; the time spent in the lake by a given molecule (if we could follow its fate) would depend on the route it took: it might flow through as part of the fastest, most direct current, or it might circle in a backwater for an indefinitely long time.</p>\r\n<p>Residence times vary enormously. They range from a few days for small lakes up to several hundred years for large ones; Lake Tahoe, in California, has a residence time of 700 years. The residence times for the Great Lakes of North America, namely, Lakes Superior, Michigan, Huron, Erie, and Ontario, are, respectively, 190,100,22,2.5, and 6 years. Lake Erie\' s is the lowest: although its area is larger than Lake Ontario\'  s, its volume is less than one-third as great because it is so shallow-less than 20 meters on average.</p>\r\n<p>A given lake\'s residence time is by no means a fixed quantity. It depends on the rate at which water enters the lake, and that depends on the rainfall and the evaporation rate. Climatic change (the result of global warming?) is dramatically affecting the residence times of some lakes in northwestern Ontario, Canada. In the period 1970 to 1986, rainfall in the area decreased from 1,000 millimeters to 650 millimeters per annum, while above-average temperatures speeded up the evapotranspiration rate (the rate at which water is lost to the atmosphere through evaporation and the processes of plant life). The result has been that the residence time of one of the lakes increased from 5 to 18 years during the study period. The slowing down of water renewal leads to a chain of further consequences; it causes dissolved chemicals to become increasingly concentrated, and this, in turn, has a marked effect on all living things in the lake.</p>', '湖中的水', '');
INSERT INTO `q_reading_passage` VALUES ('22', 'Maya Water Problems', '<p>To understand the ancient Mayan people who lived in the area that is today southern Mexico and Central America and the ecological difficulties they faced, one must first consider their environment, which we think of as \"jungle\" or \"tropical rainforest.\" This view is inaccurate, and the reason proves to be important. Properly speaking, tropical rainforests grow in high-rainfall equatorial areas that remain wet or humid all year round. But the Maya homeland lies more than sixteen hundred kilometers from the equator, at latitudes 17 to 22 degrees north, in a habitat termed a \"seasonal tropical forest.\" That is, while there does tend to be a rainy season from May to October, there is also a dry season from January through April. If one focuses on the wet months, one calls the Maya homeland a \"seasonal tropical forest\"; if one focuses on the dry months, one could instead describe it as a \"seasonal desert.\"</p>\r\n<p>From north to south in the Yucatan Peninsula, where the Maya lived, rainfall ranges from 18 to 100 inches (457 to 2,540 millimeters) per year, and the soils become thicker, so that the southern peninsula was agriculturally more productive and supported denser populations. But rainfall in the Maya homeland is unpredictably variable between years; some recent years have had three or four times more rain than other years. As a result, modern farmers attempting to grow corn in the ancient Maya homelands have faced frequent crop failures, especially in the north. The ancient Maya were presumably more experienced and did better, but nevertheless they too must have faced risks of crop failures from droughts and hurricanes.</p>\r\n<p>Although southern Maya areas received more rainfall than northern areas, problems of water were paradoxically more severe in the wet south. While that made things hard for ancient Maya living in the south, it has also made things hard for modern archaeologists who have difficulty understanding why ancient droughts caused bigger problems in the wet south than in the dry north. The likely explanation is that an area of underground freshwater underlies the Yucatan Peninsula, but surface elevation increases from north to south, so that as one moves south the land surface lies increasingly higher above the water table. In the northern peninsula the elevation is sufficiently low that the ancient Maya were able to reach the water table at deep sinkholes called cenotes, or at deep caves. In low-elevation north coastal areas without sinkholes, the Maya would have been able to get down to the water table by digging wells up to 75 feet (22 meters) deep. But much of the south lies too high above the water table for cenotes or wells to reach down to it. Making matters worse, most of the Yucatan Peninsula consists of karst, a porous sponge-like limestone terrain where rain runs straight into the ground and where little or no surface water remains available.</p>\r\n<p>How did those dense southern Maya populations deal with the resulting water problem? It initially surprises us that many of their cities were not built next to the rivers but instead on high terrain in rolling uplands. The explanation is that the Maya excavated depressions, or modified natural depressions, and then plugged up leaks in the karst by plastering the bottoms of the depressions in order to create reservoirs, which collected rain from large plastered catchment basins and stored it for use in the dry season. For example, reservoirs at the Maya city of Tikal held enough water to meet the drinking water needs of about 10,000 people for a period of 18 months. At the city of Coba the Maya built dikes around a lake in order to raise its level and make their water supply more reliable. But the inhabitants of Tikal and other cities dependent on reservoirs for drinking water would still have been in deep trouble if 18 months passed without rain in a prolonged drought. A shorter drought in which they exhausted their stored food supplies might already have gotten them in deep trouble, because growing crops required rain rather than reservoirs.</p>', '玛雅的水源问题', '');
INSERT INTO `q_reading_passage` VALUES ('23', 'New Bicycle Policy', '<p>It has come to the administration\'s attention that sidewalks and building entrances are being blocked by improperly parked bicycles. A new policy has been proposed. Any bicycles that are not parked at a rack or in other designated areas will be removed by Public Safety. The new policy will help clear up traffic congestion along the sidewalks and in front of building entrances. Also, many students currently park their bikes too close to building exits, creating a fire hazard and violating campus fire security code. The new bicycle policy will ensure a safe exit path from buildings in case of emergency.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('24', 'Optimal Foraging ', '<p>Food provides animals with the energy they need to survive. However, animals also lose energy in the process of obtaining, or foraging, for food. Therefore, in order to conserve energy, many animals behave in ways that minimize the energy they expend in the foraging process while at the same time maximizing their nutritional benefits. This energy-efficient approach to obtaining food is known as optimal foraging. The practice of optimal foraging allows animals to expend the least possible amount of energy while at the same time obtaining prey with high food value that will provide them with necessary nutrients.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('25', 'Ancient Athens', '<p>One of the most important changes in Greece during the period from 800 B.C. to 500 B.C. was the rise of the polis, or city-state, and each polis developed a system of government that was appropriate to its circumstances. The problems that were faced and solved in Athens were the sharing of political power between the established aristocracy and the emerging other classes, and the adjustment of aristocratic ways of life to the ways of life of the new polis. It was the harmonious blending of all of these elements that was to produce the classical culture of Athens.</p>\r\n<p>Entering the polis age, Athens had the traditional institutions of other Greek proto-democratic states: an assembly of adult males, an aristocratic council, and annually elected officials. Within this traditional framework the Athenians, between 600 B.C. and 450 B.C., evolved what Greeks regarded as a fully fledged democratic constitution, though the right to vote was given to fewer groups of people than is seen in modern times.</p>\r\n<p>The first steps toward change were taken by Solon in 594 B.C., when he broke the aristocracy\'s stranglehold on elected offices by establishing wealth rather than birth as the basis of office holding, abolishing the economic obligations of ordinary Athenians to the aristocracy, and allowing the assembly (of which all citizens were equal members) to overrule the decisions of local courts in certain cases. The strength of the Athenian aristocracy was further weakened during the rest of the century by the rise of a type of government known as a tyranny, which is a form of interim rule by a popular strongman (not rule by a ruthless dictator as the modern use of the term suggests to us). The Peisistratids, as the succession of tyrants were called (after the founder of the dynasty, Peisistratos), strengthened Athenian central administration at the expense of the aristocracy by appointing judges throughout the region, producing Athens\' first national coinage, and adding and embellishing festivals that tended to focus attention on Athens rather than on local villages of the surrounding region. By the end of the century, the time was ripe for more change: the tyrants were driven out, and in 508 B.C. a new reformer, Cleisthenes, gave final form to the developments reducing aristocratic control already under way.</p>\r\n<p>Cleisthenes\' principal contribution to the creation of democracy at Athens was to complete the long process of weakening family and clan structures, especially among the aristocrats, and to set in their place locality-based corporations called demes, which became the point of entry for all civic and most religious life in Athens. Out of the demes were created 10 artificial tribes of roughly equal population. From the demes, by either election or selection, came 500 members of a new council, 6,000 jurors for the courts, 10 generals, and hundreds of commissioners. The assembly was sovereign in all matters but in practice delegated its power to subordinate bodies such as the council, which prepared the agenda for the meetings of the assembly, and me courts, which took care of most judicial matters. Various committees acted as an executive branch, implementing policies of the assembly and supervising, for instance, the food and water supplies and public buildings. This wide-scale participation by the citizenry in the government distinguished the democratic form of the Athenian polis from other, less liberal forms.</p>\r\n<p>The effect of Cleisthenes\' reforms was to establish the superiority of the Athenian community as a whole over local institutions without destroying them. National politics rather than local or deme politics became the focal point. At the same time, entry into national politics began at the deme level and gave local loyalty a new focus: Athens itself. Over the next two centuries the implications of Cleisthenes\' reforms were fully exploited.</p>\r\n<p>During the fifth century B.C. the council of 500 was extremely influential in shaping policy. In the next century, however, it was the mature assembly that took on decision-making responsibility. By any measure other than that of the aristocrats, who had been upstaged by the supposedly inferior \"people,\" the Athenian democracy was a stunning success. Never before, or since, have so many people been involved in the serious business of self-governance. It was precisely this opportunity to participate in public life that provided a stimulus for the brilliant unfolding of classical Greek culture.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('26', 'Predator Prey Cycles', '<p>How do predators affect populations of the prey animals♦ The answer is not as simple as might be thought. Moose reached Isle Royale in Lake Superior by crossing over winter ice and multiplied freely there in isolation without predators. When wolves later reached the island, naturalists widely assumed that the wolves would play a key role in controlling the moose population. Careful studies have demonstrated, however, that this is not the case. The wolves eat mostly old or diseased animals that would not survive long anyway. In general, the moose population is controlled by food availability, disease and other factors rather than by wolves.</p>\r\n<p>When experimental populations are set up under simple laboratory conditions, the predator often exterminates its prey and then becomes extinct itself, having nothing left to eat. However, if safe areas like those prey animals have in the wild are provided, the prey population drops to low level but not extinction. Low prey population levels then provide inadequate food for the predators, causing the predator population to decrease. When this occurs, the prey population can rebound. In this situation the predator and prey population may continue in this cyclical pattern for some time.</p>\r\n<p>Population cycles are characteristic of small mammals, and they sometimes appear to be brought about by predators. Ecologists studying hare populations have found that the North American snow shoe hare follows a <span class=\"strong-line js-scrollto\">roughly</span> ten-year cycle. Its numbers fall tenfold to thirty in a typical cycle, and a hundredfold change can occur. Two factors appear to be generating the cycle: food plants and predators.</p>\r\n<p>The preferred foods of snowshoe hares are willow and birch twigs. As hare density increases, the quantity of these twigs decreases, forcing the hares to feed on low-quality high-fiber food. Lower birth rates, low juvenile survivorship, and low growth rates follow, so there is a corresponding decline in hare abundance. Once the hare population has declined, it takes two to three year for the quantity of twigs to recover.</p>\r\n<p>A key predator of the snowshoe hare is the Canada lynx. The Canada lynx shows a ten-year cycle of abundance that parallels the abundance cycle of hares. As hare numbers fall, so do lynx numbers, as their food supply depleted.</p>\r\n<p>What causes the predator-prey oscillations♦ Do increasing number of hares lead to overharvesting of plants, which in turn results in reduced hare populations, or do increasing numbers of lynx lead to overharvesting hares♦ Field experiments carried out by Charles Krebs and coworkers in 1992 provide an answer. Krebs investigated experimental plots in Canada\'s Yukon territory that contained hare populations. When food was added to those plots (no food effect) and predators were excluded (no predator effect) from an experimental area, hare numbers increased tenfold and stayed there—the cycle was lost. However, the cycle was retained if either of the factors was allowed to operate alone: if predators were excluded but food was not added (food effect alone), or if food was added in the presence of predators (predator effect alone). Thus both factors can affect the cycle, which, in practice, seems to be generated by conjunction of the two factors.</p>\r\n<p>Predators are an essential factor in maintaining communities that are rich and diverse in species. Without predators, the species that is the best competitor for food, shelter, nesting sites, and other environmental resources tends to dominate and exclude the species with which it competes. This phenomenon is known as \"competitor exclusion\". However, if the community contains a predator of the strongest competitor species, then the population of that competitor is controlled. Thus even the less competitive species are able to survive. For example, sea stars prey on a variety of bivalve mollusks and prevent these bivalves from monopolizing habitats on the sea floor. This opens up space for many other organisms. When sea stars are removed, species diversity falls sharply. Therefore, from the stand point of diversity, it is usually a mistake to eliminate a major predator from a community.</p>', null, '');
INSERT INTO `q_reading_passage` VALUES ('27', 'Siam, 1851 – 1910', '<p>In the late nineteenth century, political and social changes were occurring rapidly in Siam (now Thailand). The old ruling families were being displaced by an evolving centralized government. These families were pensioned off (given a sum of money to live on) or simply had their revenues taken away or restricted; their sons were enticed away to schools for district officers, later to be posted in some faraway province; and the old patron-client relations that had bound together local societies simply disintegrated. Local rulers could no longer protect their relatives and attendants in legal cases, and with the ending in 1905 of the practice of forcing peasant farmers to work part-time for local rulers, the rulers no longer had a regular base for relations with rural populations. The old local ruling families, then, were severed from their traditional social context.</p>\r\n<p>The same situation viewed from the perspective of the rural population is even more complex. According to the government\'s first census of the rural population, taken in 1905, there were about thirty thousand villages in Siam. This was probably a large increase over the figure even two or three decades earlier, during the late 1800s. It is difficult to imagine it now, but Siam\'s Central Plain in the late 1800s was nowhere near as densely settled as it is today. There were still forests closely surrounding Bangkok into the last half of the nineteenth century, and even at century\'s end there were wild elephants and tigers roaming the countryside only twenty or thirty miles away.</p>\r\n<p>Much population movement involved the opening up of new lands for rice cultivation. Two things made this possible and encouraged it to happen. First, the opening of the kingdom to the full force of international trade by the Bowring Treaty (1855) rapidly encouraged economic specialization in the growing of rice, mainly to feed the rice-deficient portions of Asia (India and China in particular). The average annual volume of rice exported from Siam grew from under 60 million kilograms per year in the late 1850s to more than 660 million kilograms per year at the turn of the century; and over the same period the average price per kilogram doubled. During the same period, the area planted in rice increased from about 230,000 acres to more than350, 000 acres. This growth was achieve as the result of the collective decisions of thousands of peasants families to expand the amount of land they cultivated, clear and plant new land, or adopt more intensive methods of agriculture.</p>\r\n<p>They were able to do so because of our second consideration. They were relatively freer than they had been half a century earlier. Over the course of the Fifth Reign (1868–1910), the ties that bound rural people to the aristocracy and local ruling elites were greatly reduced. Peasants now paid a tax on individuals instead of being required to render labor service to the government. Under these conditions, it made good sense to thousands of peasant families to in effect work full-time at what they had been able to do only part-time previously because of the requirement to work for the government: grow rice for the marketplace.</p>\r\n<p>Numerous changes accompanied these developments. The rural population both dispersed and grew, and was probably less homogeneous and more mobile than it had been a generation earlier. The villages became more vulnerable to arbitrary treatment by government bureaucrats as local elites now had less control over them. By the early twentieth century, as government modernization in a sense caught up with what had been happening in the countryside since the 1870s, the government bureaucracy intruded more and more into village life. Provincial police began to appear, along with district officers and cattle registration and land deeds and registration for compulsory military service. Village handicrafts diminished or died out completely as people bought imported consumer goods, like cloth and tools, instead of making them themselves. More economic variation took shape in rural villages, as some grew prosperous from farming while others did not. As well as can be measured, rural standards of living improved in the Fifth Reign. But the statistical averages mean little when measured against the harsh realities of peasant life.</p>', '暹罗 1851–1910', '');
INSERT INTO `q_reading_passage` VALUES ('28', 'Water in the Desert', '<p>Rainfall is not completely absent in desert areas, but it is highly variable. An annual rainfall of four inches is often used to define the limits of a desert. The impact of rainfall upon the surface water and groundwater resources of the desert is greatly influenced by landforms. Flats and depressions where water can collect are common features, but they make up only a small part of the landscape.</p>\r\n<p>Arid lands, surprisingly, contain some of the world\'s largest river systems, such as the Murray-Darling in Australia, the Rio Grande in North America, the Indus in Asia, and the Nile in Africa. These rivers and river systems are known as \"exogenous\" because their sources lie outside the arid zone. They are vital for sustaining life in some of the driest parts of the world. For centuries, the annual floods of the Nile, Tigris, and Euphrates, for example, have brought fertile silts and water to the inhabitants of their lower valleys. Today, river discharges are increasingly controlled by human intervention, creating a need for international river-basin agreements. The filling of the Ataturk and other dams in Turkey has drastically reduced flows in the Euphrates, with potentially serious consequences for Syria and Iraq.</p>\r\n<p>The flow of exogenous rivers varies with the season. The desert sections of long rivers respond several months after rain has fallen outside the desert, so that peak flows may be in the dry season. This is useful for irrigation, but the high temperatures, low humidities, and different day lengths of the dry season, compared to the normal growing season, can present difficulties with some crops.</p>\r\n<p>Regularly flowing rivers and streams that originate within arid lands are known as \"endogenous.\" These are generally fed by groundwater springs, and many issue from limestone massifs, such as the Atlas Mountains in Morocco. Basaltic rocks also support springs, notably at the Jabal Al-Arab on the Jordan-Syria border. Endogenous rivers often do not reach the sea but drain into inland basins, where the water evaporates or is lost in the ground. Most desert streambeds are normally dry, but they occasionally receive large flows of water and sediment.</p>\r\n<p>Deserts contain large amounts of groundwater when compared to the amounts they hold in surface stores such as lakes and rivers. But only a small fraction of groundwater enters the hydrological cycle—feeding the flows of streams, maintaining lake levels, and being recharged (or refilled) through surface flows and rainwater. In recent years, groundwater has become an increasingly important source of freshwater for desert dwellers. The United Nations Environment Programme and the World Bank have funded attempts to survey the groundwater resources of arid lands and to develop appropriate extraction techniques. Such programs are much needed because in many arid lands there is only a vague idea of the extent of groundwater resources. It is known, however, that the distribution of groundwater is uneven, and that much of it lies at great depths.</p>\r\n<p>Groundwater is stored in the pore spaces and joints of rocks and unconsolidated (unsolidified) sediments or in the openings widened through fractures and weathering. The water-saturated rock or sediment is known as an \"aquifer\". Because they are porous, sedimentary rocks, such as sandstones and conglomerates, are important potential sources of groundwater. Large quantities of water may also be stored in limestones when joints and cracks have been enlarged to form cavities. Most limestone and sandstone aquifers are deep and extensive but may contain groundwaters that are not being recharged. Most shallow aquifers in sand and gravel deposits produce lower yields, but they can be rapidly recharged. Some deep aquifers are known as \"fossil waters. The term \"fossil\" describes water that has been present for several thousand years. These aquifers became saturated more than 10,000 years ago and are no longer being recharged.</p>\r\n<p>Water does not remain immobile in an aquifer but can seep out at springs or leak into other aquifers. The rate of movement may be very slow: in the Indus plain, the movement of saline (salty) groundwaters has still not reached equilibrium after 70 years of being tapped. The mineral content of groundwater normally increases with the depth, but even quite shallow aquifers can be highly saline.</p>', '沙漠中的水源', '');

-- ----------------------------
-- Table structure for q_reading_question
-- ----------------------------
DROP TABLE IF EXISTS `q_reading_question`;
CREATE TABLE `q_reading_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `question` text,
  `right_answer` varchar(255) DEFAULT NULL,
  `vtype` int(11) DEFAULT NULL COMMENT '1单选、2多选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_reading_question
-- ----------------------------
INSERT INTO `q_reading_question` VALUES ('1', '1', '1', 'Which of the following can be inferred from paragraph 1 about the ground that we walk on?\r\nThe word \"<span class=\"strong-line js-scrollto\">incredible</span>\"in the passage is closest in meaning to  \r\nThe word \"<span class=\"strong-line js-scrollto\">out of sight</span>\"in the passage is closest in meaning to\r\nAccording to paragraph 2, where is groundwater usually found?\r\nThe phrase \"<span class=\"strong-line js-scrollto\">glacial outwash</span>\"in the passage refers to\r\nAll of the following are mentioned in paragraph 3 as places that sediment-laden rivers can deposit their sediments EXCEPT\r\nThe word \"<span class=\"strong-line js-scrollto\">overlie</span>\"in the passage is closest in meaning to\r\nThe phrase \"<span class=\"strong-line js-scrollto\">So much for</span>\"in the passage is closest in meaning to\r\nThe word \"<span class=\"strong-line js-scrollto\">plugged</span>\"in the passage is closet in meaning to\r\nWhich of the following can be inferred from paragraph 1 about the ground that we walk on?', 'C', null);
INSERT INTO `q_reading_question` VALUES ('2', '1', '2', 'The word \"<span class=\"strong-line js-scrollto\">incredible</span>\"in the passage is closest in meaning to  ', 'C', null);
INSERT INTO `q_reading_question` VALUES ('3', '1', '3', 'The word \"<span class=\"strong-line js-scrollto\">out of sight</span>\"in the passage is closest in meaning to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('4', '1', '4', 'According to paragraph 2, where is groundwater usually found?', 'D', null);
INSERT INTO `q_reading_question` VALUES ('5', '1', '5', 'The phrase \"<span class=\"strong-line js-scrollto\">glacial outwash</span>\"in the passage refers to\r\nAll of the following are mentioned in paragraph 3 as places that sediment-laden rivers can deposit their sediments EXCEPT\r\nThe word \"<span class=\"strong-line js-scrollto\">overlie</span>\"in the passage is closest in meaning to\r\nThe phrase \"<span class=\"strong-line js-scrollto\">So much for</span>\"in the passage is closest in meaning to\r\nThe phrase \"<span class=\"strong-line js-scrollto\">glacial outwash</span>\"in the passage refers to', 'D', null);
INSERT INTO `q_reading_question` VALUES ('6', '1', '6', 'All of the following are mentioned in paragraph 3 as places that sediment-laden rivers can deposit their sediments EXCEPT', 'A', null);
INSERT INTO `q_reading_question` VALUES ('7', '1', '7', 'The word \"<span class=\"strong-line js-scrollto\">overlie</span>\"in the passage is closest in meaning to', 'A', null);
INSERT INTO `q_reading_question` VALUES ('8', '1', '8', 'The phrase \"<span class=\"strong-line js-scrollto\">So much for</span>\"in the passage is closest in meaning to', 'A', null);
INSERT INTO `q_reading_question` VALUES ('9', '1', '9', 'The word \"<span class=\"strong-line js-scrollto\">plugged</span>\"in the passage is closet in meaning to', 'C', null);
INSERT INTO `q_reading_question` VALUES ('10', '1', '10', 'According to paragraphs 6 and 7, why is basalt unlike most crystalline forms of rock?', 'B', null);
INSERT INTO `q_reading_question` VALUES ('11', '1', '1', 'The word \"<span class=\"strong-line js-scrollto\">championed</span>\"in the passage is closest in meaning to', 'D', null);
INSERT INTO `q_reading_question` VALUES ('12', '1', '2', 'The word \"<span class=\"strong-line js-scrollto\">attributes</span>\"in the passage is closest in meaning to', 'A', null);
INSERT INTO `q_reading_question` VALUES ('13', '1', '3', 'According to paragraph 1, theories of the origins of theater', 'A', null);
INSERT INTO `q_reading_question` VALUES ('14', '1', '4', 'According to paragraph 1, why did some societies develop and repeat ceremonial actions?', 'D', null);
INSERT INTO `q_reading_question` VALUES ('15', '1', '5', 'The word \"<span class=\"strong-line js-scrollto\">this</span>\"in the passage refers to', 'C', null);
INSERT INTO `q_reading_question` VALUES ('16', '1', '6', 'The word \"<span class=\"strong-line js-scrollto\">autonomous</span>\"in the passage is closest in meaning to', 'C', null);
INSERT INTO `q_reading_question` VALUES ('17', '1', '7', 'According to paragraph 2, what may cause societies to abandon certain rites?', 'B', null);
INSERT INTO `q_reading_question` VALUES ('18', '1', '8', 'All of following are mentioned in paragraph 5 as possible reasons that led societies to develop theater EXCEPT', 'D', null);
INSERT INTO `q_reading_question` VALUES ('19', '1', '9', 'Which of the following best describes the organization of paragraph 5?', 'A', null);
INSERT INTO `q_reading_question` VALUES ('20', '1', '10', 'The word \"<span class=\"strong-line js-scrollto\">penchant</span>\"in the passage is closest in meaning to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('21', '1', '1', 'The word \"<span class=\"strong-line js-scrollto\">dramatic</span>\"in the passage is closest in meaning to', 'D', null);
INSERT INTO `q_reading_question` VALUES ('22', '1', '2', 'Where is the lower timberline mentioned in paragraph 1 likely to be found?', 'A', null);
INSERT INTO `q_reading_question` VALUES ('23', '1', '3', 'Which of the following can be inferred from paragraph 1 about both the upper and lower timberlines?', 'B', null);
INSERT INTO `q_reading_question` VALUES ('24', '1', '4', 'Paragraph 2 supports which of the following statements about deciduous trees?', 'C', null);
INSERT INTO `q_reading_question` VALUES ('25', '1', '5', 'The word \"<span class=\"strong-line js-scrollto\">attain</span>\" in the passage is closest in meaning to', 'C', null);
INSERT INTO `q_reading_question` VALUES ('26', '1', '6', 'The word \"<span class=\"strong-line js-scrollto\">they</span>\" in the passage refers to ', 'B', null);
INSERT INTO `q_reading_question` VALUES ('27', '1', '7', 'The word \"<span class=\"strong-line js-scrollto\">prone</span>\" in the passage is closest in meaning to ', 'B', null);
INSERT INTO `q_reading_question` VALUES ('28', '1', '8', 'According to paragraph 3, which of the following is true of trees in the middle and upper latitudes?', 'A', null);
INSERT INTO `q_reading_question` VALUES ('29', '1', '9', 'Which of the sentences below best express the essential information in the highlighted sentence in the passage? In correct choices change the meaning in important ways or leave out essential information.', 'C', null);
INSERT INTO `q_reading_question` VALUES ('30', '1', '10', 'In paragraph 4, what is the author\'s main purpose in the discussion of the dramatic cessation of tree growth at the upper timberline?', 'D', null);
INSERT INTO `q_reading_question` VALUES ('31', '2', '1', 'The word <span class=\"strong-line js-scrollto\">threatened</span> in the passage is closest in meaning to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('32', '2', '2', 'According to paragraph 3, the loss of natural vegetation has which of the following consequences for soil?', 'B', null);
INSERT INTO `q_reading_question` VALUES ('33', '2', '3', 'The word <span class=\"strong-line js-scrollto\">delicate</span> in the passage is closest in meaning to', 'A', null);
INSERT INTO `q_reading_question` VALUES ('34', '2', '4', 'According to paragraph 5, in dry periods, border areas have difficulty', 'A', null);
INSERT INTO `q_reading_question` VALUES ('35', '2', '5', 'The word <span class=\"strong-line js-scrollto\">progressively</span> in the passage is closest in meaning to', 'D', null);
INSERT INTO `q_reading_question` VALUES ('36', '2', '6', 'According to paragraph 6, which of the following is often associated with raising crops?', 'C', null);
INSERT INTO `q_reading_question` VALUES ('37', '2', '7', 'The phrase <span class=\"strong-line js-scrollto\">devoid of</span> in the passage is closest in meaning to', 'D', null);
INSERT INTO `q_reading_question` VALUES ('38', '2', '8', 'According to paragraph 9, the ground\'s absorption of excess water is a factor in desertification because it can', 'D', null);
INSERT INTO `q_reading_question` VALUES ('39', '2', '9', 'All of the following are mentioned in the passage as contributing to desertification EXCEPT', 'C', null);
INSERT INTO `q_reading_question` VALUES ('40', '2', '10', 'Which of the sentences below best expresses the essential information in the <span class=\"strong-line js-scrollto\">highlighted sentence</span> in the passage?Incorrect choices change the meaning in important ways or leave out essential information.', 'A', null);
INSERT INTO `q_reading_question` VALUES ('41', '2', '1', 'In paragraph 1, what does the author say about the presence of a blowhole in cetaceans?', 'B', null);
INSERT INTO `q_reading_question` VALUES ('42', '2', '2', 'Which of the following can be inferred from paragraph 1 about early sea otters?', 'A', null);
INSERT INTO `q_reading_question` VALUES ('43', '2', '3', 'The word <span class=\"strong-line js-scrollto\">precious</span> in the passage is closest in meaning to', 'C', null);
INSERT INTO `q_reading_question` VALUES ('44', '2', '4', 'Pakicetus and modern cetaceans have similar', 'C', null);
INSERT INTO `q_reading_question` VALUES ('45', '2', '5', 'The word <span class=\"strong-line js-scrollto\">it</span> in the passage refers to', 'A', null);
INSERT INTO `q_reading_question` VALUES ('46', '2', '6', 'The word <span class=\"strong-line js-scrollto\">exposed</span> in the passage is closest in meaning to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('47', '2', '7', 'The hind leg of Basilosaurus was a significant find because it showed that Basilosaurus', 'D', null);
INSERT INTO `q_reading_question` VALUES ('48', '2', '8', 'It can be inferred that Basilosaurus bred and gave birth in which of the following locations', 'D', null);
INSERT INTO `q_reading_question` VALUES ('49', '2', '9', 'Why does the author use the word <span class=\"strong-line js-scrollto\">luckily</span> in mentioning that the Ambulocetus natans fossil included hind legs?', 'B', null);
INSERT INTO `q_reading_question` VALUES ('50', '2', '1', 'Which of the sentences below best expresses the essential information in the <span class=\"strong-line js-scrollto\">highlighted sentence</span> in the passage?Incorrect choices change the meaning in important ways or leave out essential information.', 'C', null);
INSERT INTO `q_reading_question` VALUES ('51', '2', '1', 'According to paragraph 1, all of the following were true of viewing films in Kinetoscope parlors EXCEPT:', 'C', null);
INSERT INTO `q_reading_question` VALUES ('52', '2', '2', 'The author discusses phonograph parlors in paragraph 2 in order to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('53', '2', '3', 'Which of the sentences below best expresses the essential information in the <span class=\"strong-line js-scrollto\">highlighted sentence</span> from the passage?Incorrect answer choices change the meaning in important ways or leave out essential information.', 'C', null);
INSERT INTO `q_reading_question` VALUES ('54', '2', '4', 'The word <span class=\"strong-line js-scrollto\">readily</span> in the passage is closest in meaning to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('55', '2', '5', 'The word <span class=\"strong-line js-scrollto\">assistance</span> in the passageis closest in meaning to', 'C', null);
INSERT INTO `q_reading_question` VALUES ('56', '2', '6', 'According to paragraph 4, how did the early movies differ from previous spectacles that were presented to large audiences?', 'D', null);
INSERT INTO `q_reading_question` VALUES ('57', '2', '7', 'According to paragraph 5, what role did early exhibitors play in the presentation of movies in theaters?', 'A', null);
INSERT INTO `q_reading_question` VALUES ('58', '2', '8', 'Which of the following is mentioned in paragraph 6 as one of the ways theMutoscope differed from the Kinetoscope?', 'D', null);
INSERT INTO `q_reading_question` VALUES ('59', '2', '9', 'The word <span class=\"strong-line js-scrollto\">it</span> in the passage refers to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('60', '2', '10', 'According to paragraph 6, the images seen by viewers in the earlier peepshows, compared to the images projected on the screen, were relatively', 'A', null);
INSERT INTO `q_reading_question` VALUES ('61', '3', '1', 'The word \"<span class=\"strong-line js-scrollto\">accumulate</span>\" in the passage is closest in meaning to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('62', '3', '2', 'According to paragraph 1, which of the following is true about petroleum formation?', 'D', null);
INSERT INTO `q_reading_question` VALUES ('63', '3', '3', 'In paragraphs 1 and 2, the author\'s primary purpose is to', 'A', null);
INSERT INTO `q_reading_question` VALUES ('64', '3', '4', 'Which of the sentences below best expresses the essential information in the <span class=\"strong-line js-scrollto\">highlighted sentence</span> in the passage? Incorrect choices change the meaning in important ways or leave out essential information.', 'C', null);
INSERT INTO `q_reading_question` VALUES ('65', '3', '5', 'The word \"<span class=\"strong-line js-scrollto\">adjacent</span>\" in the passage is closest in meaning to', 'A', null);
INSERT INTO `q_reading_question` VALUES ('66', '3', '6', 'Which of the following can be inferred from paragraph 3 about gushers?', 'D', null);
INSERT INTO `q_reading_question` VALUES ('67', '3', '7', 'Which of the following strategies for oil exploration is described in paragraph 4?', 'A', null);
INSERT INTO `q_reading_question` VALUES ('68', '3', '8', 'What does the development of the Alaskan oil field mentioned in paragraph 4 demonstrate?', 'B', null);
INSERT INTO `q_reading_question` VALUES ('69', '3', '9', 'The word \"<span class=\"strong-line js-scrollto\">sloping</span>\" in the passage is closest in meaning to', 'B', null);
INSERT INTO `q_reading_question` VALUES ('70', '3', '1', 'According to paragraph 5, the decision to drill for oil depends on all of the following factors EXCEPT', 'D', null);

-- ----------------------------
-- Table structure for q_reading_section
-- ----------------------------
DROP TABLE IF EXISTS `q_reading_section`;
CREATE TABLE `q_reading_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='reading 部分';

-- ----------------------------
-- Records of q_reading_section
-- ----------------------------

-- ----------------------------
-- Table structure for q_reading_subject
-- ----------------------------
DROP TABLE IF EXISTS `q_reading_subject`;
CREATE TABLE `q_reading_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `passage_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_reading_subject
-- ----------------------------
INSERT INTO `q_reading_subject` VALUES ('1', null, '1', '1', '1', null);
INSERT INTO `q_reading_subject` VALUES ('2', null, '2', '1', '2', null);
INSERT INTO `q_reading_subject` VALUES ('3', null, '3', '1', '3', null);
INSERT INTO `q_reading_subject` VALUES ('4', null, '4', '1', '4', null);
INSERT INTO `q_reading_subject` VALUES ('5', null, '5', '1', '5', null);
INSERT INTO `q_reading_subject` VALUES ('6', null, '6', '1', '6', null);
INSERT INTO `q_reading_subject` VALUES ('7', null, '7', '1', '7', null);
INSERT INTO `q_reading_subject` VALUES ('8', null, '8', '1', '8', null);
INSERT INTO `q_reading_subject` VALUES ('9', null, '9', '1', '9', null);
INSERT INTO `q_reading_subject` VALUES ('10', null, '10', '1', '10', null);
INSERT INTO `q_reading_subject` VALUES ('11', null, '1', '1', '11', null);
INSERT INTO `q_reading_subject` VALUES ('12', null, '2', '1', '12', null);
INSERT INTO `q_reading_subject` VALUES ('13', null, '3', '1', '13', null);
INSERT INTO `q_reading_subject` VALUES ('14', null, '4', '1', '14', null);
INSERT INTO `q_reading_subject` VALUES ('15', null, '5', '1', '15', null);
INSERT INTO `q_reading_subject` VALUES ('16', null, '6', '1', '16', null);
INSERT INTO `q_reading_subject` VALUES ('17', null, '7', '1', '17', null);
INSERT INTO `q_reading_subject` VALUES ('18', null, '8', '1', '18', null);
INSERT INTO `q_reading_subject` VALUES ('19', null, '9', '1', '19', null);
INSERT INTO `q_reading_subject` VALUES ('20', null, '10', '1', '20', null);
INSERT INTO `q_reading_subject` VALUES ('21', null, '1', '1', '21', null);
INSERT INTO `q_reading_subject` VALUES ('22', null, '2', '1', '22', null);
INSERT INTO `q_reading_subject` VALUES ('23', null, '3', '1', '23', null);
INSERT INTO `q_reading_subject` VALUES ('24', null, '4', '1', '24', null);
INSERT INTO `q_reading_subject` VALUES ('25', null, '5', '1', '25', null);
INSERT INTO `q_reading_subject` VALUES ('26', null, '6', '1', '26', null);
INSERT INTO `q_reading_subject` VALUES ('27', null, '7', '1', '27', null);
INSERT INTO `q_reading_subject` VALUES ('28', null, '8', '1', '28', null);
INSERT INTO `q_reading_subject` VALUES ('29', null, '9', '1', '29', null);
INSERT INTO `q_reading_subject` VALUES ('30', null, '10', '1', '30', null);
INSERT INTO `q_reading_subject` VALUES ('31', null, '1', '2', '31', null);
INSERT INTO `q_reading_subject` VALUES ('32', null, '2', '2', '32', null);
INSERT INTO `q_reading_subject` VALUES ('33', null, '3', '2', '33', null);
INSERT INTO `q_reading_subject` VALUES ('34', null, '4', '2', '34', null);
INSERT INTO `q_reading_subject` VALUES ('35', null, '5', '2', '35', null);
INSERT INTO `q_reading_subject` VALUES ('36', null, '6', '2', '36', null);
INSERT INTO `q_reading_subject` VALUES ('37', null, '7', '2', '37', null);
INSERT INTO `q_reading_subject` VALUES ('38', null, '8', '2', '38', null);
INSERT INTO `q_reading_subject` VALUES ('39', null, '9', '2', '39', null);
INSERT INTO `q_reading_subject` VALUES ('40', null, '10', '2', '40', null);
INSERT INTO `q_reading_subject` VALUES ('41', null, '1', '2', '41', null);
INSERT INTO `q_reading_subject` VALUES ('42', null, '2', '2', '42', null);
INSERT INTO `q_reading_subject` VALUES ('43', null, '3', '2', '43', null);
INSERT INTO `q_reading_subject` VALUES ('44', null, '4', '2', '44', null);
INSERT INTO `q_reading_subject` VALUES ('45', null, '5', '2', '45', null);
INSERT INTO `q_reading_subject` VALUES ('46', null, '6', '2', '46', null);
INSERT INTO `q_reading_subject` VALUES ('47', null, '7', '2', '47', null);
INSERT INTO `q_reading_subject` VALUES ('48', null, '8', '2', '48', null);
INSERT INTO `q_reading_subject` VALUES ('49', null, '9', '2', '49', null);
INSERT INTO `q_reading_subject` VALUES ('50', null, '10', '2', '50', null);
INSERT INTO `q_reading_subject` VALUES ('51', null, '1', '2', '51', null);
INSERT INTO `q_reading_subject` VALUES ('52', null, '2', '2', '52', null);
INSERT INTO `q_reading_subject` VALUES ('53', null, '3', '2', '53', null);
INSERT INTO `q_reading_subject` VALUES ('54', null, '4', '2', '54', null);
INSERT INTO `q_reading_subject` VALUES ('55', null, '5', '2', '55', null);
INSERT INTO `q_reading_subject` VALUES ('56', null, '6', '2', '56', null);
INSERT INTO `q_reading_subject` VALUES ('57', null, '7', '2', '57', null);
INSERT INTO `q_reading_subject` VALUES ('58', null, '8', '2', '58', null);
INSERT INTO `q_reading_subject` VALUES ('59', null, '9', '2', '59', null);
INSERT INTO `q_reading_subject` VALUES ('60', null, '10', '2', '60', null);
INSERT INTO `q_reading_subject` VALUES ('61', null, '1', '3', '61', null);
INSERT INTO `q_reading_subject` VALUES ('62', null, '2', '3', '62', null);
INSERT INTO `q_reading_subject` VALUES ('63', null, '3', '3', '63', null);
INSERT INTO `q_reading_subject` VALUES ('64', null, '4', '3', '64', null);
INSERT INTO `q_reading_subject` VALUES ('65', null, '5', '3', '65', null);
INSERT INTO `q_reading_subject` VALUES ('66', null, '6', '3', '66', null);
INSERT INTO `q_reading_subject` VALUES ('67', null, '7', '3', '67', null);
INSERT INTO `q_reading_subject` VALUES ('68', null, '8', '3', '68', null);
INSERT INTO `q_reading_subject` VALUES ('69', null, '9', '3', '69', null);
INSERT INTO `q_reading_subject` VALUES ('70', null, '10', '3', '70', null);

-- ----------------------------
-- Table structure for q_speaking_question
-- ----------------------------
DROP TABLE IF EXISTS `q_speaking_question`;
CREATE TABLE `q_speaking_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_description` text COMMENT '口语题目',
  `question_url` text COMMENT '口语题目对应音频资料',
  `name` varchar(255) DEFAULT NULL,
  `demo1` text,
  `demo2` text,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_speaking_question
-- ----------------------------
INSERT INTO `q_speaking_question` VALUES ('1', 'Some people believe that television has had a positive influence on society. Others believe it has had a negative influence on society. Which do you agree with and why? Use details and examples to explain your opinion.', '/static/toefl/speaking_mp3/question/tpo1/speaking_t1q2_62f9291544cdb76d451ed3c38ed48759.mp3', null, 'Of course television has a positive influence on our society. News tells us about big and influential events happening around the world; advertising introduces products that we may like or need in daily life; TV plays bring people good moods and also provide them with topics of conversation. I really cannot imagine a life without television. Some people may say that television has a negative influence on the behavior of children, but I think it is actually their parents’ or teachers’ faults, because it is their responsibility to tell children about what is right or wrong. Well, that’s all I think about the topic.', 'I believe that TV has had a positive influence on society for the following reasons. First of all, TV is more dynamic than other types of media. You get news coverage a lot faster from TV compare to radio or prints. The combination of image and sound is highly effective. Also, some programs have great educational value, such as the programs you get from Discovery Channel. TV allows us to broaden our knowledge base, and it’s making our generations smarter and smarter.', null);
INSERT INTO `q_speaking_question` VALUES ('2', 'Talk about a book you have read that was important to you for some reason. Explain why the book was important to you. Give specific details and examples to explain your answer.', '/static/toefl/speaking_mp3/question/tpo1/speaking_t1q1_3b52d9205add5cf59b981c8cec46f639.mp3', null, 'Well, I’d like to talk about the Official Guide of the TOEFL test. You know, for a TOEFL taker, OG might be the most important book I have to read. It introduces the testing format of the four sections of TOEFL, reading, listening, speaking and writing, and also gives examples and even strategies about how to get good scores. I have read the book for more than three times, not all of it, you know, but most of it. I guess that’s part of the reason why I can speak so fluently now. Good score favors the prepared. Well, that’s all about the book and why it is important to me.', 'Harry Potter is the book that’s pretty important to me. First of all, it’s the first book I’ve read in English. I had a great time learning English from it because the story is fun to read. I get bored easily reading my English text books, and usually fall asleep within half an hour. But when I read HP, I can go all day long. Second, the book taught me what true friendship is. For example, Ron never gives up on Harry or abandons him no matter how difficult the situation gets, and they can trust each other with their lives. I wish I have a friend like that in my life.', null);
INSERT INTO `q_speaking_question` VALUES ('3', 'Choose a place you go to often that is important to you and explain why it is important. Please include specific details in your explanation.', '/static/toefl/speaking_mp3/question/tpo2/speaking_q1_2007ac3051943dcb3a1f832926d6c998.mp3', null, 'The place where I go very often is the library in my school. You know, although I have a lot of choices of places to study, the library is always the best option, for students there don’t make noises and the reference books that I may need are always available for me to read. Another reason why it is important to me is that I can meet people of mutual interests there and even form study groups with them. That helps a lot when I have problems. If I study elsewhere, such chances are slim. Well, that’s all.', 'The zoo is a place I go to often that is important to me for a couple of reasons. First of all, I love to learn about animals and nature. I find all the animals fascinating to look at, and I get to learn something new about them each time I visit the zoo. There are these tags in front of all the display about the animal inside, I like the fact that I can study the animals while being able to look at them up close. It?s way better than reading about them from a text book. Second, I like to take pictures of the animals. If you pay attention you can find all kinds of expressions on their face. For example, monkeys are almost as expressive as we are. I took many good pictures of monkey and will never get tired of taking more.\r\nThe zoo is a place I go to often that is important to me for a couple of reasons. First of all, I love to learn about animals and nature. I find all the animals fascinating to look at, and I get to learn something new about them each time I visit the zoo. There are these tags in front of all the display about the animal inside, I like the fact that I can study the animals while being able to look at them up close. It?s way better than reading about them from a text book. Second, I like to take pictures of the animals. If you pay attention you can find all kinds of expressions on their face. For example, monkeys are almost as expressive as we are. I took many good pictures of monkey and will never get tired of taking more.\r\nThe zoo is a place I go to often that is important to me for a couple of reasons. First of all, I love to learn about animals and nature. I find all the animals fascinating to look at, and I get to learn something new about them each time I visit the zoo. There are these tags in front of all the display about the animal inside, I like the fact that I can study the animals while being able to look at them up close. It?s way better than reading about them from a text book. Second, I like to take pictures of the animals. If you pay attention you can find all kinds of expressions on their face. For example, monkeys are almost as expressive as we are. I took many good pictures of monkey and will never get tired of taking more.', null);
INSERT INTO `q_speaking_question` VALUES ('4', 'Some college students choose to take courses in a variety of subject areas in order to get a broad education. Others choose to focus on a single subject area in order to have a deeper understanding of that area. Which approach to course selection do you think is better for students and why?', '/static/toefl/speaking_mp3/question/tpo2/speaking_q2_a69a0327bce071ddfeb9ae1246ee912b.mp3', null, 'Well, I think I’ll take courses of a wider range. Some people take college education as the preparation for their jobs in the future, and that’s why they’d rather focus on a specific area. But I think that college education is just a start for us to explore who we are and what we are supposed to do in the future. At college or university, we have chances to take different trials to increase our self-knowledge, but if we make decisions too soon, I don’t think all people can be lucky enough to go to the right direction without trying for several times. That’s all I think about the topic.', 'I believe choosing subjects from different fields is the way to go. First of all, it will broaden a student’s horizon and knowledge base. Not only I get to learn different things from variety of courses, most importantly, I can gain other perspectives in doing so. I will be able to think differently and can use many approaches toward the same problem. Second, it’s interesting to take courses from other fields. I get to meet a lot of students from other majors and talk to them. It’s great when I can have many types of friends. It would be very boring if I’m surrounded only by the people in my major all the time.', null);
INSERT INTO `q_speaking_question` VALUES ('5', 'What characteristics do you think make someone a good parent? Explain why these characteristics are important to you.', '/static/toefl/speaking_mp3/question/tpo3/speaking_q1_ea2e4838cd6428cf42f8d8a8e855554a.mp3', null, 'The most important characteristics that a good parent should have are integrity and tolerance. Parents’ integrity will influence their children’s behavior and choices throughout their lives, and these children are less likely to be selfish so that they will be loved and respected by others. Another important characteristic that will benefit children’s lives is their parents’ tolerance. Tolerant parents usually have open-minded children, and being open-minded avoids a lot of unnecessary misunderstandings and conflicts. Therefore, these people are more likely to be welcomed and popular. If people have parents with these two qualities, then we can call them lucky ones. Well, that’s all.', 'My mom has many good characteristics that I think all parents should have, let me give you some of them. First, she is a good listener who always pays attention to what I have to say, that makes her the person who knows me the best in our family. And also, she has a good manner. I’ve learned from her how to treat others around me with dignity and respect since I was young, thanks to her I made many good friends in my life. Also, she’s very supportive of me. For example, she’s always wanted me to get in to Finance, but my passion is in Art. Although we had different views of what I should be studying in college, she was very supportive of me and my goals and decided to send me to the best Art school in the country.', null);
INSERT INTO `q_speaking_question` VALUES ('6', 'Some students prefer to work on class assignments by themselves. Others believe it is better to work in a group. Which do you prefer? Explain why.', '/static/toefl/speaking_mp3/question/tpo3/speaking_q2_a8f1509986c54a180476899057def046.mp3', null, 'Of course I’d like to work in a group, because group work just enjoys too many advantages. First off, working with a group brings me more confidence to perform well. Actually, not only myself but also the whole team can benefit from that. People in a group can do different parts that they are good at, and that improves the quality as well as the efficiency of our work. Also, working with others means that I’m very likely to be inspired by others so that I can see things from different perspectives. That’s pretty cool, ah-hum? Yeah, that’s why I like to work in a group.', 'I prefer to work on class assignments in a group. First of all, when having discussions with a study group, I get a better understanding of the subject matter. And people are usually more focused when participating in a discussion, I myself tend to put things off or get lazy when working alone. Second, I can gain other perspectives when studying with a group. For example, I think it’s amazing sometimes there are so many different ways to solve a single problem. When studying by myself, my thoughts are very limited. But when working with a group, I can learn how to think differently from listening to other group members.', null);
INSERT INTO `q_speaking_question` VALUES ('7', 'What do you miss most about your home when you are away? Use specific details in your explanation.', '/static/toefl/speaking_mp3/question/tpo4/speaking_q1_a3511462fd0fc0ac4e0b2d71ca8b4a51.mp3', null, 'What do I miss the most? My family of course, I mean, my parents. You know, I attend college in a big city which is far away from my hometown, so I don’t get to see my parents very often. I miss them so much when I don’t see them, because they are not only my guardians but also my good friends that I can trust and talk to. I think if I can make enough money some day, I will buy them a house so that we can live in the same place again. You know, you can’t call a house home unless your families are also there with you.', 'The things I miss the most about my home are my family and friends. When I first went to Canada 10 years ago, I felt very lonely in the first couple of months because I didn’t know anyone. I had no one to turn to or talk to about my troubles, that was pretty hard on me in the beginning. I also missed Chinese food a lot, such as Kung Pao Chicken, Peking Duck and Chinese Dumplings. Although I could find some of those dishes in Chinese restaurant in Canada, they tasted a lot different from home.', null);
INSERT INTO `q_speaking_question` VALUES ('8', 'Many universities now offer academic courses over the Internet. However, some people still prefer learning in traditional classrooms. Which do you think is better? Explain why.', '/static/toefl/speaking_mp3/question/tpo4/speaking_q2_d2ecd6961f6acf0429fbe8764e425fb0.mp3', null, 'Well, although learning in classrooms is a classic and popular practice, I still prefer on-line courses. You see, students today are getting used to doing everything via the Internet, and that is why on-line courses would be quite acceptable and welcomed. The most important part of on-line courses is that students are no longer limited by any schedules. If we are not available for taking one class in a traditional classroom, we have no choice but to skip it, but courses can be replayed or repeated on-line at any time. As a result, students will never miss anything important like they used to. That’s why I prefer the online courses.', 'I prefer taking courses in traditional classrooms for the following reasons. First of all, it’s very important that students get to work with an experienced professor in the learning process. It’s so much easier to engage in a discussion or ask questions directly in a traditional classroom. The presence of a professor plays a big role when you are trying to learn something new. Second, learning in a traditional classroom means that you can meet many other students. It’s great that students get to know each other and become friends in the classroom. Plus, learning in a study group can give students other perspectives which can’t be obtained when taking online courses.', null);
INSERT INTO `q_speaking_question` VALUES ('9', 'Talk about a place you enjoyed going to or visiting when you were a child. Describe the place. Explain why you enjoyed it.', '/static/toefl/speaking_mp3/question/tpo5/speaking_q1_ecf6a977d333ca18ba8e740329a0702b.mp3', null, 'The place where I enjoyed going to when I was little is my father’s office. The reason was simple. There was a computer there. I had shown great interesting in computer and the Internet when I was a kid, and it was in my father’ office that I learn how to type with a keyboard and how to send emails through the Internet. I also played video games like War Craft and Star Craft when my father was out. I really had pretty much good time there and I can still recall every exciting moment I had there. Well, that’ all about the place I enjoyed going to when I was a child.', 'The place I enjoyed going to or visiting when I was a child was the park near my house. First of all, it’s hard to find an open space in the city for me to run around where there’s no traffic. It’s quiet and safe for me to do many activities, such as boating, swimming, fishing, and flying a kite. Second, I made many friends in the park. Whenever I went, I could meet a lot of other kids who liked to spend time there. We would kick around a soccer ball and forget about school work, it was a very relaxing experience. I had so much fun during the years, the park remains one of my favorite places till today.', null);
INSERT INTO `q_speaking_question` VALUES ('10', 'Do you agree or disagree with the following statement? Why or why not? Use details and examples to explain your answer.It is more important to study math or science than it is to study art or literature.', '/static/toefl/speaking_mp3/question/tpo5/speaking_q2_bc5b74f396048b326fef88cab9f92281.mp3', null, 'Well, I don’t think that learning natural science is more important than learning art and literature. Education on math and science indeed brings technological developments to our society, but education on art and literature can also benefits our lives greatly by offering us beauty of different forms. The most important thing is that the benefits of learning art and literature cannot be provided by education on math and science. Our society can never be completed without visually tasty movies and advertising as well as extraordinary novels and plays created by people focusing on art and literature. That’s why I can’t agree with the statement.', 'I strongly disagree with the statement that studying math or science is more important than studying art or literature. First of all, studying art and literature can help children to express their feelings better. It’s very relaxing to paint a picture or to write a short story, I find it very calming to create some sort of art when I’m stressed out. Also, The Arts can be a wonderful career for those who have the talent to draw well. And for those without the talent, it can be a wonderful way to spend time with your family, or decorate your home.', null);

-- ----------------------------
-- Table structure for q_speaking_section
-- ----------------------------
DROP TABLE IF EXISTS `q_speaking_section`;
CREATE TABLE `q_speaking_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_speaking_section
-- ----------------------------

-- ----------------------------
-- Table structure for q_speaking_subject
-- ----------------------------
DROP TABLE IF EXISTS `q_speaking_subject`;
CREATE TABLE `q_speaking_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_speaking_subject
-- ----------------------------

-- ----------------------------
-- Table structure for q_writing_question
-- ----------------------------
DROP TABLE IF EXISTS `q_writing_question`;
CREATE TABLE `q_writing_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `remark1` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_writing_question
-- ----------------------------
INSERT INTO `q_writing_question` VALUES ('1', 'At universities and colleges, sports and social activities are just as important as classes and libraries and should receive equal financial support.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('2', 'Always telling the truth is the most important consideration in any relationship between people.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('3', 'It is more important to keep your old friends than it is to make new friends.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('4', 'In twenty years there will be fewer cars in use than there are today.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('5', 'People today spend too much time on personal enjoyment-doing things they like to do-rather than doing things they should do.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('6', 'Life today is easier and more comfortable than it was when your grandparents were children.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('7', 'It is more important for students to understand ideas and concepts than it is for them to learn facts.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('8', 'Television advertising directed towards young children (aged two to five) should not be allowed.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('9', 'Technology has made children less creative than they were in the past.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');
INSERT INTO `q_writing_question` VALUES ('10', 'Playing computer games is a waste of time. Children should not be allowed to play them.', 'Do you agree or disagree with the following statement?', 'Use specific reasons and examples to support your answer.');

-- ----------------------------
-- Table structure for q_writing_section
-- ----------------------------
DROP TABLE IF EXISTS `q_writing_section`;
CREATE TABLE `q_writing_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_writing_section
-- ----------------------------

-- ----------------------------
-- Table structure for q_writing_subject
-- ----------------------------
DROP TABLE IF EXISTS `q_writing_subject`;
CREATE TABLE `q_writing_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q_writing_subject
-- ----------------------------

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseid` int(100) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(255) DEFAULT NULL,
  `coursestate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('2', 'TOEFL', '0');
INSERT INTO `t_course` VALUES ('3', 'GRE', '0');
INSERT INTO `t_course` VALUES ('4', 'GMAT', '0');
INSERT INTO `t_course` VALUES ('5', 'TEST', '0');

-- ----------------------------
-- Table structure for t_errorbook
-- ----------------------------
DROP TABLE IF EXISTS `t_errorbook`;
CREATE TABLE `t_errorbook` (
  `bookid` int(100) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `courseid` varchar(255) DEFAULT NULL,
  `gradeid` varchar(255) DEFAULT NULL,
  `typeid` varchar(255) DEFAULT NULL,
  `uanswer` varchar(255) DEFAULT NULL,
  `questionid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_errorbook
-- ----------------------------
INSERT INTO `t_errorbook` VALUES ('1', 'wang', null, null, null, null, '1');
INSERT INTO `t_errorbook` VALUES ('2', 'wang', '2', '1', '1', 'C', '1');
INSERT INTO `t_errorbook` VALUES ('3', 'wang', '2', '2', '4', '1', '3');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `gradeid` int(100) NOT NULL AUTO_INCREMENT,
  `gradename` varchar(255) DEFAULT NULL,
  `courseid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gradeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', '新高一', '1,2,3,4');
INSERT INTO `t_grade` VALUES ('2', 'first', '1');

-- ----------------------------
-- Table structure for t_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper` (
  `paperid` varchar(255) NOT NULL DEFAULT '',
  `papername` varchar(255) DEFAULT NULL,
  `courseid` varchar(255) DEFAULT NULL,
  `gradeid` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `questionid` varchar(255) DEFAULT NULL,
  `begintime` varchar(255) DEFAULT NULL,
  `endtime` varchar(255) DEFAULT NULL,
  `allowtime` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `paperstate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paper
-- ----------------------------
INSERT INTO `t_paper` VALUES ('1', '1', '5', '2', 'wang', '1', '2016-05-11 10:06:13', '2018-03-22 10:31:23', '20', '0', '2');
INSERT INTO `t_paper` VALUES ('2', '2', '2', '2', 'wang', '3', '2016-05-11 10:06:13', '2022-05-11 10:06:13', '20', null, '0');
INSERT INTO `t_paper` VALUES ('3', '3', '2', '2', null, '3', '2016-05-11 10:06:13', '2022-05-11 10:06:13', '20', null, '0');
INSERT INTO `t_paper` VALUES ('3', '3', '2', '2', 'wang', '3', '2018-03-22 10:35:24', '2018-03-22 10:35:37', '20', '0', '2');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `questionid` int(100) NOT NULL AUTO_INCREMENT,
  `quesname` varchar(255) DEFAULT NULL,
  `optiona` varchar(255) DEFAULT NULL,
  `optionb` varchar(255) DEFAULT NULL,
  `optionc` varchar(255) DEFAULT NULL,
  `optiond` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `useranswer` varchar(255) DEFAULT NULL,
  `courseid` varchar(255) DEFAULT NULL,
  `typeid` varchar(255) DEFAULT NULL,
  `gradeid` varchar(255) DEFAULT NULL,
  `difficulty` int(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `answerdetail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '1+1=？', '1', '2', '3', '4', '2', null, '2', '1', '1', '0', '', '');
INSERT INTO `t_question` VALUES ('2', '3-2=?', '1', '2', '3', '4', 'A', null, '2', '2', '2', '1', '', '');
INSERT INTO `t_question` VALUES ('3', '1*1', '1', '2', '3', '4', 'a', null, '2', '4', '2', '0', '', '');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `typeid` int(100) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  `score` int(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '听力', '30', 'TOEFL');
INSERT INTO `t_type` VALUES ('2', '阅读', '30', 'TOEFL');
INSERT INTO `t_type` VALUES ('3', '写作', '30', 'TOEFL');
INSERT INTO `t_type` VALUES ('4', '口语', '30', 'TOEFL');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `usertype` int(100) DEFAULT NULL,
  `userstate` int(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'a', '0cc175b9c0f1b6a831c399e269772661', '2', '0', '1', null, null, null, null);
INSERT INTO `t_user` VALUES ('admin', 'admin', '96e79218965eb72c92a549dd5a330112', '2', '2', '1', null, null, null, null);
INSERT INTO `t_user` VALUES ('t1', 't1', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', 'teacher1@qq.com', '13512341234', '学校', '测试');
INSERT INTO `t_user` VALUES ('wang', 'wang', '96e79218965eb72c92a549dd5a330112', '2', '0', '1', '123@qq.com', null, '123', null);
