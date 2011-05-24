
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') collate utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `default_to_current_user` enum('yes','no') collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_author` ***
INSERT INTO `tbl_fields_author` (`id`, `field_id`, `allow_author_change`, `allow_multiple_selection`, `default_to_current_user`) VALUES (16, 53, 'yes', 'no', 'yes');

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') collate utf8_unicode_ci NOT NULL default 'on',
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_checkbox` ***

-- *** STRUCTURE: `tbl_fields_colorchooser` ***
DROP TABLE IF EXISTS `tbl_fields_colorchooser`;
CREATE TABLE `tbl_fields_colorchooser` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_colorchooser` ***
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (268, 36);
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (267, 37);
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (271, 38);
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (269, 40);
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (270, 41);
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (272, 48);
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (273, 49);
INSERT INTO `tbl_fields_colorchooser` (`id`, `field_id`) VALUES (266, 50);

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_date` ***
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (28, 33, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (30, 57, 'yes');

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (146, 23, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (144, 28, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (138, 32, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (129, 47, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (130, 46, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (147, 54, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (148, 55, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (149, 56, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');

-- *** STRUCTURE: `tbl_fields_order_entries` ***
DROP TABLE IF EXISTS `tbl_fields_order_entries`;
CREATE TABLE `tbl_fields_order_entries` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') default 'no',
  `hide` enum('yes','no') default 'no',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_order_entries` ***
INSERT INTO `tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`) VALUES (23, 24, 'yes', 'yes');

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `show_association` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'yes',
  `static_options` text collate utf8_unicode_ci,
  `dynamic_options` int(11) unsigned default NULL,
  `sort_options` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_select` ***
INSERT INTO `tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `static_options`, `dynamic_options`, `sort_options`) VALUES (32, 51, 'no', 'no', 'Play, Judson, Megrim, Rokkitt, MedievalSharp, Homemade Apple, Permanent Marker, Wallpoet, Aclonica, Damion, Francois One, Holtwood One SC, Didact Gothic, Carter One, Sigmar One, Paytone One, Monofett, Swanky and Moo Moo, Over the Rainbow, Waiting for the Sunrise, Special Elite, Miltonian, Miltonian Tattoo, uattrocento Sans, Kristi, The Girl Next Door, Pacifico, Smythe, Irish Grover, Bangers, Maiden Orange, Expletus Sans, Annie Use Your Telescope, Quattrocento, Michroma, Astloch, Oswald, Indie Flower, Sniglet, League Script, Candal, Slackey, Walter Turncoat, Architects Daughter, Allan, Anton, Kenia, Bevan, Crimson Text, Rock Salt, UnifrakturMaguntia, Calligraffitti, Lekton, Crafty Girls, Vollkorn, Corben, Dawning of a New Day, Cabin, Tangerine, Amaranth, Lato, Droid Sans Mono, Cuprum, Cabin Sketch, Raleway, Luckiest Guy, Unkempt, Dancing Script, Gruppo, Syncopate, Schoolbell, Allerta, Cherry Cream Soda, Neucha, Coda, Kranky, Fontdiner Swanky, Kreon, Yanone Kaffeesatz, VT323, Josefin Sans, PT Sans, Covered By Your Grace, Vibur, Droid Sans, Neuton, Arvo, Bentham, Goudy Bookletter 1911, Molengo, Six Caps, Inconsolata, Tinos, Ubuntu, Aclonica, Bigshot One, Chewy, Cousine, EB Garamond, Geo, Judson, Mountains of Christmas, News Cycle, Nova, Orbitron, Philosopher, Reenie Beanie, Sue Ellen Francisco, Terminal Dosis Light, Coming Soon, Puritan, PT Serif, Cardo, Crushed, Droid Serif, Just Another Hand, Cantarell, Radley, Lobster, Copse, Buda, Josefin Slab, OFL Sorts Mill Goudy TT, Nobile, Allerta Stencil, Merriweather, UnifrakturCook, Arimo, Old Standard TT, IM Fell, Just Me Again Down Here, Meddon, Sunshiney, Anonymous Pro', NULL, 'yes');
INSERT INTO `tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `static_options`, `dynamic_options`, `sort_options`) VALUES (33, 52, 'no', 'no', '10px, 11px, 12px, 13px, 14px, 15px, 16px, 17px, 18px, 19px, 20px, 21px, 22px, 23px, 24px, 25px, 26px, 27px, 28px, 29px, 30px, 31px, 32px, 33px, 34px, 35px, 36px, 37px, 38px, 39px, 40px, 41px, 42px, 43px, 44px, 45px, 46px, 47px, 48px, 49px, 50px, 51px, 52px, 53px, 54px, 55px, 56px, 57px, 58px, 59px, 60px, 61px, 62px, 63px, 64px, 65px, 66px, 67px, 68px, 69px, 70px, 71px, 72px, 73px, 74px, 75px', NULL, 'no');

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `show_association` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'yes',
  `related_field_id` varchar(255) collate utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL default '20',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (26, 26, 'yes', 'no', 23, 99);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (27, 58, 'no', 'no', 32, 20);

-- *** STRUCTURE: `tbl_fields_stage` ***
DROP TABLE IF EXISTS `tbl_fields_stage`;
CREATE TABLE `tbl_fields_stage` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL default '0',
  `constructable` smallint(1) default '0',
  `destructable` smallint(1) default '0',
  `draggable` smallint(1) default '0',
  `droppable` smallint(1) default '0',
  `searchable` smallint(1) default '0',
  `context` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_stage` ***
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (43, 30, 1, 1, 1, 0, 1, 'subsectionmanager');
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (44, 31, 1, 1, 1, 0, 1, 'subsectionmanager');
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (37, 35, 1, 1, 1, 0, 1, 'subsectionmanager');
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (17, 45, 1, 0, 0, 0, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (38, 61, 1, 1, 1, 0, 1, 'subsectionmanager');

-- *** STRUCTURE: `tbl_fields_stage_sorting` ***
DROP TABLE IF EXISTS `tbl_fields_stage_sorting`;
CREATE TABLE `tbl_fields_stage_sorting` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  `context` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=408 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_stage_sorting` ***
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (16, 31, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (17, 16, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (15, 19, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (30, 20, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (32, 9, 30, '44,45,46,47,48,49,50,51,52,53', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (31, 20, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (33, 9, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (43, 55, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (42, 55, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (44, 54, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (45, 54, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (65, 62, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (64, 62, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (50, 66, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (51, 66, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (52, 67, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (53, 67, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (103, 63, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (102, 63, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (87, 78, 31, '45,44,46,47,79,80', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (73, 64, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (72, 64, 30, '44,45,46,47,48,49,50,51,52,53', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (107, 65, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (106, 65, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (86, 78, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (128, 81, 35, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (97, 85, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (98, 85, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (99, 86, 45, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (100, 88, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (101, 88, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (124, 95, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (123, 95, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (341, 122, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (121, 123, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (122, 123, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (129, 125, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (130, 125, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (134, 94, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (133, 94, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (135, 82, 35, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (193, 89, 35, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (335, 104, 31, '105,106,107,108', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (170, 118, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (171, 118, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (185, 119, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (184, 119, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (215, 116, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (214, 116, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (226, 124, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (227, 124, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (228, 128, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (229, 128, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (230, 127, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (231, 127, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (336, 120, 30, '137,123,138,139,132,126,129,130,131,133,134,135,136,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (337, 120, 31, '129,123,131,132,133,134,154,140,141,142,144,147,148,151,153', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (340, 122, 30, '153,155,133,154,129,140,141,144,145,146,147', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (300, 121, 30, '137,123,138,139,132,126,130,131,134,135,136,142,143,149,150,151,152', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (301, 121, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (334, 104, 30, '156,139,132,126,131,133,136,142,144,148', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (328, 158, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (329, 158, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (363, 163, 30, '106,107,108,162', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (364, 163, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (392, 175, 61, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (407, 160, 61, 187, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (386, 181, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (385, 181, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (387, 180, 30, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (388, 180, 31, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (395, 182, 30, '162,165,166,167,168,169,170,171,172,173,174,176,177,178', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (394, 183, 61, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (396, 182, 31, 0, NULL);

-- *** STRUCTURE: `tbl_fields_subsectionmanager` ***
DROP TABLE IF EXISTS `tbl_fields_subsectionmanager`;
CREATE TABLE `tbl_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `filter_tags` text,
  `caption` text,
  `droptext` text,
  `included_fields` text,
  `allow_multiple` tinyint(1) default '0',
  `show_preview` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_subsectionmanager` ***
INSERT INTO `tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`) VALUES (43, 30, 8, NULL, '{$image} ({$title})', NULL, '28,27,29:formatted', 1, 1);
INSERT INTO `tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`) VALUES (44, 31, 8, NULL, '{$image} ({$title})', NULL, '28,27,29:formatted', 1, 1);
INSERT INTO `tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`) VALUES (38, 61, 8, NULL, '{$image} / {$title}', NULL, '28,27,29:formatted', 1, 1);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) collate utf8_unicode_ci default NULL,
  `pre_populate_source` varchar(15) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_taglist` ***

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) collate utf8_unicode_ci default NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (55, 25, 'ckeditor', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (53, 29, 'markdown_extra_with_smartypants', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (56, 59, 'ckeditor', 8);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (49, 34, 'ckeditor', 15);

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) collate utf8_unicode_ci NOT NULL,
  `validator` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_upload` ***
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (11, 27, '/workspace/images', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- *** STRUCTURE: `tbl_entries_data_23` ***
DROP TABLE IF EXISTS `tbl_entries_data_23`;
CREATE TABLE `tbl_entries_data_23` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=323 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_23` ***

-- *** STRUCTURE: `tbl_entries_data_24` ***
DROP TABLE IF EXISTS `tbl_entries_data_24`;
CREATE TABLE `tbl_entries_data_24` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=322 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_24` ***

-- *** STRUCTURE: `tbl_entries_data_25` ***
DROP TABLE IF EXISTS `tbl_entries_data_25`;
CREATE TABLE `tbl_entries_data_25` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_25` ***

-- *** STRUCTURE: `tbl_entries_data_26` ***
DROP TABLE IF EXISTS `tbl_entries_data_26`;
CREATE TABLE `tbl_entries_data_26` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_26` ***

-- *** STRUCTURE: `tbl_entries_data_27` ***
DROP TABLE IF EXISTS `tbl_entries_data_27`;
CREATE TABLE `tbl_entries_data_27` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) default NULL,
  `size` int(11) unsigned default NULL,
  `mimetype` varchar(50) default NULL,
  `meta` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_27` ***

-- *** STRUCTURE: `tbl_entries_data_28` ***
DROP TABLE IF EXISTS `tbl_entries_data_28`;
CREATE TABLE `tbl_entries_data_28` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_28` ***

-- *** STRUCTURE: `tbl_entries_data_29` ***
DROP TABLE IF EXISTS `tbl_entries_data_29`;
CREATE TABLE `tbl_entries_data_29` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_29` ***

-- *** STRUCTURE: `tbl_entries_data_30` ***
DROP TABLE IF EXISTS `tbl_entries_data_30`;
CREATE TABLE `tbl_entries_data_30` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1064 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_30` ***

-- *** STRUCTURE: `tbl_entries_data_31` ***
DROP TABLE IF EXISTS `tbl_entries_data_31`;
CREATE TABLE `tbl_entries_data_31` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=536 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_31` ***

-- *** STRUCTURE: `tbl_entries_data_32` ***
DROP TABLE IF EXISTS `tbl_entries_data_32`;
CREATE TABLE `tbl_entries_data_32` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_32` ***
INSERT INTO `tbl_entries_data_32` (`id`, `entry_id`, `handle`, `value`) VALUES (84, 160, 'a-highly-customizable-ensemble', 'A highly customizable ensemble');

-- *** STRUCTURE: `tbl_entries_data_33` ***
DROP TABLE IF EXISTS `tbl_entries_data_33`;
CREATE TABLE `tbl_entries_data_33` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) default NULL,
  `local` int(11) default NULL,
  `gmt` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_33` ***
INSERT INTO `tbl_entries_data_33` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (84, 160, '2011-05-24T14:16:00+02:00', 1306239360, 1306239360);

-- *** STRUCTURE: `tbl_entries_data_34` ***
DROP TABLE IF EXISTS `tbl_entries_data_34`;
CREATE TABLE `tbl_entries_data_34` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_34` ***
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (84, 160, '<p>This ensemble is the result of a <a href=\"http://www.xpresszo.com/symphony-demo/\" target=\"_blank\">demo-site</a>, that i made to explore some of Symphony&#39;s features and it&#39;s user friendly back-end.</p>\r\n<p>&#160;</p>\r\n<p>The design is insprired by symphony&#39;s back-end, but fully customizable.<br />\r\nYou can experiment with body, header, menu and caption colors in the &#39;preferences&#39; section.&#160;Also included a complete reference to the <a href=\"http://www.google.com/webfonts\" target=\"_blank\">google webfont directory</a>, so you can choose from over a hundred webfonts for website title and captions.&#160;Entering your favourite twitter username will display it&#39;s tweets on the homepage!</p>\r\n<p>&#160;</p>\r\n<p>Pages and a recursive navigation can be created through entries in the &#39;pages&#39; section.&#160;Choosing a parent page will create a multilevel menu. <a href=\"http://symphony-cms.com/discuss/thread/63022/1/#position-15\" target=\"_blank\">(credits)</a><br />\r\nThe pages are built out of a single template, with optional sidebar and / or slideshow.</p>\r\n<p>&#160;</p>\r\n<p>The homepage consists of a blog, showing text, an optional gallery and comments.</p>\r\n<p><br />\r\n<br />\r\nEnjoy and show your creativity!</p>\r\n', '<p>This ensemble is the result of a <a href=\"http://www.xpresszo.com/symphony-demo/\" target=\"_blank\">demo-site</a>, that i made to explore some of Symphony&#39;s features and it&#39;s user friendly back-end.</p>\r\n<p>&#160;</p>\r\n<p>The design is insprired by symphony&#39;s back-end, but fully customizable.<br />\r\nYou can experiment with body, header, menu and caption colors in the &#39;preferences&#39; section.&#160;Also included a complete reference to the <a href=\"http://www.google.com/webfonts\" target=\"_blank\">google webfont directory</a>, so you can choose from over a hundred webfonts for website title and captions.&#160;Entering your favourite twitter username will display it&#39;s tweets on the homepage!</p>\r\n<p>&#160;</p>\r\n<p>Pages and a recursive navigation can be created through entries in the &#39;pages&#39; section.&#160;Choosing a parent page will create a multilevel menu. <a href=\"http://symphony-cms.com/discuss/thread/63022/1/#position-15\" target=\"_blank\">(credits)</a><br />\r\nThe pages are built out of a single template, with optional sidebar and / or slideshow.</p>\r\n<p>&#160;</p>\r\n<p>The homepage consists of a blog, showing text, an optional gallery and comments.</p>\r\n<p><br />\r\n<br />\r\nEnjoy and show your creativity!</p>\r\n');

-- *** STRUCTURE: `tbl_entries_data_36` ***
DROP TABLE IF EXISTS `tbl_entries_data_36`;
CREATE TABLE `tbl_entries_data_36` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=754 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_36` ***
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `value`) VALUES (753, 87, '#');

-- *** STRUCTURE: `tbl_entries_data_37` ***
DROP TABLE IF EXISTS `tbl_entries_data_37`;
CREATE TABLE `tbl_entries_data_37` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=748 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_37` ***
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `value`) VALUES (747, 87, '#');

-- *** STRUCTURE: `tbl_entries_data_38` ***
DROP TABLE IF EXISTS `tbl_entries_data_38`;
CREATE TABLE `tbl_entries_data_38` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_38` ***
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `value`) VALUES (745, 87, '#4b6251');

-- *** STRUCTURE: `tbl_entries_data_40` ***
DROP TABLE IF EXISTS `tbl_entries_data_40`;
CREATE TABLE `tbl_entries_data_40` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=683 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_40` ***
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (682, 87, '#');

-- *** STRUCTURE: `tbl_entries_data_41` ***
DROP TABLE IF EXISTS `tbl_entries_data_41`;
CREATE TABLE `tbl_entries_data_41` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=676 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_41` ***
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (675, 87, '#');

-- *** STRUCTURE: `tbl_entries_data_46` ***
DROP TABLE IF EXISTS `tbl_entries_data_46`;
CREATE TABLE `tbl_entries_data_46` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=542 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_46` ***
INSERT INTO `tbl_entries_data_46` (`id`, `entry_id`, `handle`, `value`) VALUES (541, 87, 'symphonycms', 'symphonycms');

-- *** STRUCTURE: `tbl_entries_data_47` ***
DROP TABLE IF EXISTS `tbl_entries_data_47`;
CREATE TABLE `tbl_entries_data_47` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_47` ***

-- *** STRUCTURE: `tbl_entries_data_48` ***
DROP TABLE IF EXISTS `tbl_entries_data_48`;
CREATE TABLE `tbl_entries_data_48` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=648 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_48` ***
INSERT INTO `tbl_entries_data_48` (`id`, `entry_id`, `value`) VALUES (647, 87, '#');

-- *** STRUCTURE: `tbl_entries_data_49` ***
DROP TABLE IF EXISTS `tbl_entries_data_49`;
CREATE TABLE `tbl_entries_data_49` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=648 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_49` ***
INSERT INTO `tbl_entries_data_49` (`id`, `entry_id`, `value`) VALUES (647, 87, '#f1f3f2');

-- *** STRUCTURE: `tbl_entries_data_50` ***
DROP TABLE IF EXISTS `tbl_entries_data_50`;
CREATE TABLE `tbl_entries_data_50` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=645 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_50` ***
INSERT INTO `tbl_entries_data_50` (`id`, `entry_id`, `value`) VALUES (644, 87, '#');

-- *** STRUCTURE: `tbl_entries_data_51` ***
DROP TABLE IF EXISTS `tbl_entries_data_51`;
CREATE TABLE `tbl_entries_data_51` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=608 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_51` ***
INSERT INTO `tbl_entries_data_51` (`id`, `entry_id`, `handle`, `value`) VALUES (607, 87, 'radley', 'Radley');

-- *** STRUCTURE: `tbl_entries_data_52` ***
DROP TABLE IF EXISTS `tbl_entries_data_52`;
CREATE TABLE `tbl_entries_data_52` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=593 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_52` ***
INSERT INTO `tbl_entries_data_52` (`id`, `entry_id`, `handle`, `value`) VALUES (592, 87, '55px', '55px');

-- *** STRUCTURE: `tbl_entries_data_53` ***
DROP TABLE IF EXISTS `tbl_entries_data_53`;
CREATE TABLE `tbl_entries_data_53` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_53` ***
INSERT INTO `tbl_entries_data_53` (`id`, `entry_id`, `author_id`) VALUES (78, 160, 1);

-- *** STRUCTURE: `tbl_entries_data_54` ***
DROP TABLE IF EXISTS `tbl_entries_data_54`;
CREATE TABLE `tbl_entries_data_54` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_54` ***

-- *** STRUCTURE: `tbl_entries_data_55` ***
DROP TABLE IF EXISTS `tbl_entries_data_55`;
CREATE TABLE `tbl_entries_data_55` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_55` ***

-- *** STRUCTURE: `tbl_entries_data_56` ***
DROP TABLE IF EXISTS `tbl_entries_data_56`;
CREATE TABLE `tbl_entries_data_56` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_56` ***

-- *** STRUCTURE: `tbl_entries_data_57` ***
DROP TABLE IF EXISTS `tbl_entries_data_57`;
CREATE TABLE `tbl_entries_data_57` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) default NULL,
  `local` int(11) default NULL,
  `gmt` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_57` ***

-- *** STRUCTURE: `tbl_entries_data_58` ***
DROP TABLE IF EXISTS `tbl_entries_data_58`;
CREATE TABLE `tbl_entries_data_58` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_58` ***

-- *** STRUCTURE: `tbl_entries_data_59` ***
DROP TABLE IF EXISTS `tbl_entries_data_59`;
CREATE TABLE `tbl_entries_data_59` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_59` ***

-- *** STRUCTURE: `tbl_entries_data_61` ***
DROP TABLE IF EXISTS `tbl_entries_data_61`;
CREATE TABLE `tbl_entries_data_61` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_61` ***

-- *** DATA: `tbl_entries` ***
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (87, 10, 1, '2011-05-05 23:07:40', '2011-05-05 21:07:40');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (160, 9, 1, '2011-05-16 14:20:01', '2011-05-16 12:20:01');

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (129, 'debugdevkit', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (130, 'export_ensemble', 'enabled', 1.14);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (131, 'selectbox_link_field', 'enabled', 1.19);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (146, 'jit_image_manipulation', 'enabled', 1.10);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (133, 'maintenance_mode', 'enabled', 1.4);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (134, 'profiledevkit', 'enabled', '1.0.4');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (135, 'markdown', 'enabled', 1.13);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (136, 'xssfilter', 'enabled', 1.0);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (137, 'order_entries', 'enabled', '1.9.6');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (138, 'ckeditor', 'enabled', '1.2.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (139, 'subsectionmanager', 'enabled', '1.1.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (140, 'color_chooser_field', 'enabled', '1.2.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (145, 'static_section', 'enabled', '1.6.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (144, 'dont_drop', 'enabled', 1.3);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (169, 129, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (170, 129, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (207, 130, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (174, 133, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (175, 133, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (176, 133, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (177, 133, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (178, 133, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (179, 133, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (180, 134, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (181, 134, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (182, 136, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (183, 136, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (184, 136, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (185, 137, '/backend/', 'InitaliseAdminPageHead', 'appendScriptToHead');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (186, 138, '/backend/', 'ModifyTextareaFieldPublishWidget', 'applyCKEditor');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (187, 138, '/backend/', 'ModifyTextBoxFullFieldPublishWidget', 'applyCKEditor');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (188, 138, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPresets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (189, 138, '/system/preferences/', 'Save', 'savePresets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (190, 139, '/administration/', 'AdminPagePreGenerate', '__appendAssets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (191, 139, '/publish/new/', 'EntryPostNew', '__saveSortOrder');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (192, 139, '/publish/edit/', 'EntryPostEdit', '__saveSortOrder');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (193, 139, '/publish/', 'Delete', '__deleteSortOrder');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (194, 139, '/backend/', 'AppendPageAlert', '__upgradeMediathek');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (195, 140, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (216, 146, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (212, 145, '/blueprints/sections/', 'AddSectionElements', 'add_section_settings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (210, 144, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (211, 145, '/backend/', 'InitaliseAdminPageHead', 'redirectRules');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (213, 145, '/blueprints/sections/', 'SectionPreCreate', 'save_section_settings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (214, 145, '/blueprints/sections/', 'SectionPreEdit', 'save_section_settings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (215, 145, '/backend/', 'AppendElementBelowView', 'append_element_below_view');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (217, 146, '/system/preferences/', 'Save', '__SavePreferences');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (23, 'title', 'title', 'input', 7, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (24, 'sort', 'sort', 'order_entries', 7, 'no', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (25, 'content', 'content', 'textarea', 7, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (26, 'parent page', 'parent-page', 'selectbox_link', 7, 'no', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (27, 'image', 'image', 'upload', 8, 'no', 1, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (28, 'title', 'title', 'input', 8, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (29, 'description', 'description', 'textarea', 8, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (30, 'slideshow', 'slideshow', 'subsectionmanager', 7, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (31, 'sidebar', 'sidebar', 'subsectionmanager', 7, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (32, 'title', 'title', 'input', 9, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (33, 'date', 'date', 'date', 9, 'no', 1, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (34, 'description', 'description', 'textarea', 9, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (61, 'gallery', 'gallery', 'subsectionmanager', 9, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (36, 'menu background color', 'menu-background-color', 'colorchooser', 10, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (37, 'header background color', 'header-background-color', 'colorchooser', 10, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (38, 'body background color', 'body-background-color', 'colorchooser', 10, 'no', 9, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (48, 'captions color', 'captions-color', 'colorchooser', 10, 'no', 10, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (47, 'Website title', 'website-title', 'input', 10, 'no', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (40, 'menu text color', 'menu-text-color', 'colorchooser', 10, 'no', 7, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (41, 'menu text hover color', 'menu-text-hover-color', 'colorchooser', 10, 'no', 8, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (49, 'paragraph color', 'paragraph-color', 'colorchooser', 10, 'no', 11, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (46, 'Twitter username for displaying tweets on homepage:', 'twitter-username-for-displaying-tweets-on-homepage', 'input', 10, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (50, 'Website title color', 'website-title-color', 'colorchooser', 10, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (51, 'Website title webfont', 'website-title-webfont', 'select', 10, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (52, 'Website title fontsize', 'website-title-fontsize', 'select', 10, 'no', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (53, 'Author', 'author', 'author', 9, 'no', 3, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (54, 'Name', 'name', 'input', 12, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (55, 'Email', 'email', 'input', 12, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (56, 'Website', 'website', 'input', 12, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (57, 'Date', 'date', 'date', 12, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (58, 'Article', 'article', 'selectbox_link', 12, 'yes', 4, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (59, 'Comment', 'comment', 'textarea', 12, 'yes', 5, 'main', 'no');

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (77, NULL, 'page', 'page', NULL, 'page', 'baseds,generalsettingsds,navds', 'login', 20);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (78, NULL, 'blog', 'blog', NULL, 'page', 'blogds,generalsettingsds,navds,tweetsds', 'login', 21);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (79, NULL, 'article', 'article', NULL, 'page/article', 'articleds,baseds,generalsettingsds,navds', 'login', 22);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (80, NULL, 'blog entry', 'blog-entry', NULL, 'blogtitle', 'blogentryds,commentsds,generalsettingsds,navds,tweetsds', 'login,save_comment', 23);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (81, NULL, 'Error', 'error', NULL, 'page', 'generalsettingsds,navds', 'login', 24);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (699, 78, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (707, 81, 404);

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (7, 'Pages', 'pages', 2, 24, 'asc', 'no', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (8, 'images', 'images', 3, NULL, 'asc', 'yes', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (9, 'Blog', 'blog', 4, 32, 'asc', 'no', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (10, 'Preferences', 'preferences', 1, NULL, 'asc', 'no', 'yes', 'Preferences');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `static`, `navigation_group`) VALUES (12, 'Comments', 'comments', 5, NULL, 'asc', 'yes', 'no', 'Content');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (64, 7, 23, 7, 26, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (65, 7, 30, 8, 30, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (66, 7, 31, 8, 31, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (56, 9, 61, 8, 61, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (67, 9, 32, 12, 58, 'yes');
