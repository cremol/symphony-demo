
-- *** STRUCTURE:`tbl_fields_author` ***
DROP TABLE IF EXISTS`tbl_fields_author`;
CREATE TABLE`tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  `author_types` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_author` ***
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (19, 53, 'no', 'yes', 'author');

-- *** STRUCTURE:`tbl_fields_checkbox` ***
DROP TABLE IF EXISTS`tbl_fields_checkbox`;
CREATE TABLE`tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_checkbox` ***

-- *** STRUCTURE:`tbl_fields_colorchooser` ***
DROP TABLE IF EXISTS`tbl_fields_colorchooser`;
CREATE TABLE`tbl_fields_colorchooser` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=282 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_colorchooser` ***
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (276, 36);
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (275, 37);
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (279, 38);
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (277, 40);
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (278, 41);
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (280, 48);
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (281, 49);
INSERT INTO`tbl_fields_colorchooser` (`id`, `field_id`) VALUES (274, 50);

-- *** STRUCTURE:`tbl_fields_date` ***
DROP TABLE IF EXISTS`tbl_fields_date`;
CREATE TABLE`tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_date` ***
INSERT INTO`tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (34, 33, 'yes');
INSERT INTO`tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (35, 57, 'yes');

-- *** STRUCTURE:`tbl_fields_input` ***
DROP TABLE IF EXISTS`tbl_fields_input`;
CREATE TABLE`tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_input` ***
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (159, 23, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (164, 28, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (160, 32, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (151, 47, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (152, 46, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (161, 54, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (162, 55, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (163, 56, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');

-- *** STRUCTURE:`tbl_fields_order_entries` ***
DROP TABLE IF EXISTS`tbl_fields_order_entries`;
CREATE TABLE`tbl_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_order_entries` ***
INSERT INTO`tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`) VALUES (25, 24, 'yes', 'yes');

-- *** STRUCTURE:`tbl_fields_select` ***
DROP TABLE IF EXISTS`tbl_fields_select`;
CREATE TABLE`tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `static_options` text,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  `sort_options` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_select` ***
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `static_options`, `dynamic_options`, `sort_options`) VALUES (34, 51, 'no', 'no', 'Play, Judson, Megrim, Rokkitt, MedievalSharp, Homemade Apple, Permanent Marker, Wallpoet, Aclonica, Damion, Francois One, Holtwood One SC, Didact Gothic, Carter One, Sigmar One, Paytone One, Monofett, Swanky and Moo Moo, Over the Rainbow, Waiting for the Sunrise, Special Elite, Miltonian, Miltonian Tattoo, uattrocento Sans, Kristi, The Girl Next Door, Pacifico, Smythe, Irish Grover, Bangers, Maiden Orange, Expletus Sans, Annie Use Your Telescope, Quattrocento, Michroma, Astloch, Oswald, Indie Flower, Sniglet, League Script, Candal, Slackey, Walter Turncoat, Architects Daughter, Allan, Anton, Kenia, Bevan, Crimson Text, Rock Salt, UnifrakturMaguntia, Calligraffitti, Lekton, Crafty Girls, Vollkorn, Corben, Dawning of a New Day, Cabin, Tangerine, Amaranth, Lato, Droid Sans Mono, Cuprum, Cabin Sketch, Raleway, Luckiest Guy, Unkempt, Dancing Script, Gruppo, Syncopate, Schoolbell, Allerta, Cherry Cream Soda, Neucha, Coda, Kranky, Fontdiner Swanky, Kreon, Yanone Kaffeesatz, VT323, Josefin Sans, PT Sans, Covered By Your Grace, Vibur, Droid Sans, Neuton, Arvo, Bentham, Goudy Bookletter 1911, Molengo, Six Caps, Inconsolata, Tinos, Ubuntu, Aclonica, Bigshot One, Chewy, Cousine, EB Garamond, Geo, Judson, Mountains of Christmas, News Cycle, Nova, Orbitron, Philosopher, Reenie Beanie, Sue Ellen Francisco, Terminal Dosis Light, Coming Soon, Puritan, PT Serif, Cardo, Crushed, Droid Serif, Just Another Hand, Cantarell, Radley, Lobster, Copse, Buda, Josefin Slab, OFL Sorts Mill Goudy TT, Nobile, Allerta Stencil, Merriweather, UnifrakturCook, Arimo, Old Standard TT, IM Fell, Just Me Again Down Here, Meddon, Sunshiney, Anonymous Pro', NULL, 'yes');
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `static_options`, `dynamic_options`, `sort_options`) VALUES (35, 52, 'no', 'no', '10px, 11px, 12px, 13px, 14px, 15px, 16px, 17px, 18px, 19px, 20px, 21px, 22px, 23px, 24px, 25px, 26px, 27px, 28px, 29px, 30px, 31px, 32px, 33px, 34px, 35px, 36px, 37px, 38px, 39px, 40px, 41px, 42px, 43px, 44px, 45px, 46px, 47px, 48px, 49px, 50px, 51px, 52px, 53px, 54px, 55px, 56px, 57px, 58px, 59px, 60px, 61px, 62px, 63px, 64px, 65px, 66px, 67px, 68px, 69px, 70px, 71px, 72px, 73px, 74px, 75px', NULL, 'no');

-- *** STRUCTURE:`tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS`tbl_fields_selectbox_link`;
CREATE TABLE`tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  `hide_when_prepopulated` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_selectbox_link` ***
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`, `hide_when_prepopulated`) VALUES (30, 26, 'yes', 'no', 23, 99, 'no');
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`, `hide_when_prepopulated`) VALUES (31, 58, 'no', 'no', 32, 20, 'no');

-- *** STRUCTURE:`tbl_fields_stage` ***
DROP TABLE IF EXISTS`tbl_fields_stage`;
CREATE TABLE`tbl_fields_stage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `constructable` smallint(1) DEFAULT '0',
  `destructable` smallint(1) DEFAULT '0',
  `draggable` smallint(1) DEFAULT '0',
  `droppable` smallint(1) DEFAULT '0',
  `searchable` smallint(1) DEFAULT '0',
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_stage` ***

-- *** STRUCTURE:`tbl_fields_stage_sorting` ***
DROP TABLE IF EXISTS`tbl_fields_stage_sorting`;
CREATE TABLE`tbl_fields_stage_sorting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=409 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_stage_sorting` ***
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (16, 31, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (17, 16, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (15, 19, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (30, 20, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (32, 9, 30, '44,45,46,47,48,49,50,51,52,53', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (31, 20, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (33, 9, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (43, 55, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (42, 55, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (44, 54, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (45, 54, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (65, 62, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (64, 62, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (50, 66, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (51, 66, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (52, 67, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (53, 67, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (103, 63, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (102, 63, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (87, 78, 31, '45,44,46,47,79,80', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (73, 64, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (72, 64, 30, '44,45,46,47,48,49,50,51,52,53', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (107, 65, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (106, 65, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (86, 78, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (128, 81, 35, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (97, 85, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (98, 85, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (99, 86, 45, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (100, 88, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (101, 88, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (124, 95, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (123, 95, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (341, 122, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (121, 123, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (122, 123, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (129, 125, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (130, 125, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (134, 94, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (133, 94, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (135, 82, 35, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (193, 89, 35, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (335, 104, 31, '105,106,107,108', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (170, 118, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (171, 118, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (185, 119, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (184, 119, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (215, 116, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (214, 116, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (226, 124, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (227, 124, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (228, 128, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (229, 128, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (230, 127, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (231, 127, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (336, 120, 30, '137,123,138,139,132,126,129,130,131,133,134,135,136,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (337, 120, 31, '129,123,131,132,133,134,154,140,141,142,144,147,148,151,153', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (340, 122, 30, '153,155,133,154,129,140,141,144,145,146,147', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (300, 121, 30, '137,123,138,139,132,126,130,131,134,135,136,142,143,149,150,151,152', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (301, 121, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (334, 104, 30, '156,139,132,126,131,133,136,142,144,148', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (328, 158, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (329, 158, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (363, 163, 30, '106,107,108,162', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (364, 163, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (392, 175, 61, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (408, 160, 61, 187, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (386, 181, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (385, 181, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (387, 180, 30, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (388, 180, 31, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (395, 182, 30, '162,165,166,167,168,169,170,171,172,173,174,176,177,178', NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (394, 183, 61, 0, NULL);
INSERT INTO`tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (396, 182, 31, 0, NULL);

-- *** STRUCTURE:`tbl_fields_subsectionmanager` ***
DROP TABLE IF EXISTS`tbl_fields_subsectionmanager`;
CREATE TABLE`tbl_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `filter_tags` text,
  `caption` text,
  `droptext` text,
  `included_fields` text,
  `allow_multiple` tinyint(1) DEFAULT '0',
  `show_preview` tinyint(1) DEFAULT '0',
  `recursion_levels` tinyint(4) DEFAULT '0',
  `create` tinyint(4) DEFAULT '1',
  `remove` tinyint(4) DEFAULT '1',
  `edit` tinyint(4) DEFAULT '1',
  `sort` tinyint(4) DEFAULT '1',
  `drop` tinyint(4) DEFAULT '1',
  `show_search` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_subsectionmanager` ***
INSERT INTO`tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`, `recursion_levels`, `create`, `remove`, `edit`, `sort`, `drop`, `show_search`) VALUES (49, 30, 8, NULL, '{$image} ({$title})', NULL, NULL, 1, 1, 0, 1, 1, 1, 1, 0, 1);
INSERT INTO`tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`, `recursion_levels`, `create`, `remove`, `edit`, `sort`, `drop`, `show_search`) VALUES (50, 31, 8, NULL, '{$image} ({$title})', NULL, NULL, 1, 1, 0, 1, 1, 1, 1, 0, 1);
INSERT INTO`tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`, `recursion_levels`, `create`, `remove`, `edit`, `sort`, `drop`, `show_search`) VALUES (51, 61, 8, NULL, '{$image} / {$title}', NULL, NULL, 1, 1, 0, 1, 1, 1, 1, 0, 1);

-- *** STRUCTURE:`tbl_fields_subsectiontabs` ***
DROP TABLE IF EXISTS`tbl_fields_subsectiontabs`;
CREATE TABLE`tbl_fields_subsectiontabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `static_tabs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_subsectiontabs` ***

-- *** STRUCTURE:`tbl_fields_taglist` ***
DROP TABLE IF EXISTS`tbl_fields_taglist`;
CREATE TABLE`tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  `pre_populate_source` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_taglist` ***

-- *** STRUCTURE:`tbl_fields_textarea` ***
DROP TABLE IF EXISTS`tbl_fields_textarea`;
CREATE TABLE`tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_textarea` ***
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (65, 29, 'markdown_extra_with_smartypants', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (63, 34, 'redactor', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (62, 25, 'redactor', 15);
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (64, 59, 'redactor', 8);

-- *** STRUCTURE:`tbl_fields_upload` ***
DROP TABLE IF EXISTS`tbl_fields_upload`;
CREATE TABLE`tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_upload` ***
INSERT INTO`tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (13, 27, '/workspace/images', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- *** STRUCTURE:`tbl_entries_data_23` ***
DROP TABLE IF EXISTS`tbl_entries_data_23`;
CREATE TABLE`tbl_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=331 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_23` ***

-- *** STRUCTURE:`tbl_entries_data_24` ***
DROP TABLE IF EXISTS`tbl_entries_data_24`;
CREATE TABLE`tbl_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=330 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_24` ***

-- *** STRUCTURE:`tbl_entries_data_25` ***
DROP TABLE IF EXISTS`tbl_entries_data_25`;
CREATE TABLE`tbl_entries_data_25` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=325 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_25` ***

-- *** STRUCTURE:`tbl_entries_data_26` ***
DROP TABLE IF EXISTS`tbl_entries_data_26`;
CREATE TABLE`tbl_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=328 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_26` ***

-- *** STRUCTURE:`tbl_entries_data_27` ***
DROP TABLE IF EXISTS`tbl_entries_data_27`;
CREATE TABLE`tbl_entries_data_27` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_27` ***

-- *** STRUCTURE:`tbl_entries_data_28` ***
DROP TABLE IF EXISTS`tbl_entries_data_28`;
CREATE TABLE`tbl_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_28` ***

-- *** STRUCTURE:`tbl_entries_data_29` ***
DROP TABLE IF EXISTS`tbl_entries_data_29`;
CREATE TABLE`tbl_entries_data_29` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_29` ***

-- *** STRUCTURE:`tbl_entries_data_30` ***
DROP TABLE IF EXISTS`tbl_entries_data_30`;
CREATE TABLE`tbl_entries_data_30` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1083 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_30` ***

-- *** STRUCTURE:`tbl_entries_data_31` ***
DROP TABLE IF EXISTS`tbl_entries_data_31`;
CREATE TABLE`tbl_entries_data_31` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=550 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_31` ***

-- *** STRUCTURE:`tbl_entries_data_32` ***
DROP TABLE IF EXISTS`tbl_entries_data_32`;
CREATE TABLE`tbl_entries_data_32` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_32` ***

-- *** STRUCTURE:`tbl_entries_data_33` ***
DROP TABLE IF EXISTS`tbl_entries_data_33`;
CREATE TABLE`tbl_entries_data_33` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_33` ***

-- *** STRUCTURE:`tbl_entries_data_34` ***
DROP TABLE IF EXISTS`tbl_entries_data_34`;
CREATE TABLE`tbl_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_34` ***

-- *** STRUCTURE:`tbl_entries_data_36` ***
DROP TABLE IF EXISTS`tbl_entries_data_36`;
CREATE TABLE`tbl_entries_data_36` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=756 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_36` ***
INSERT INTO`tbl_entries_data_36` (`id`, `entry_id`, `value`) VALUES (755, 87, '#');

-- *** STRUCTURE:`tbl_entries_data_37` ***
DROP TABLE IF EXISTS`tbl_entries_data_37`;
CREATE TABLE`tbl_entries_data_37` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=750 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_37` ***
INSERT INTO`tbl_entries_data_37` (`id`, `entry_id`, `value`) VALUES (749, 87, '#');

-- *** STRUCTURE:`tbl_entries_data_38` ***
DROP TABLE IF EXISTS`tbl_entries_data_38`;
CREATE TABLE`tbl_entries_data_38` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=748 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_38` ***
INSERT INTO`tbl_entries_data_38` (`id`, `entry_id`, `value`) VALUES (747, 87, '#4b6251');

-- *** STRUCTURE:`tbl_entries_data_40` ***
DROP TABLE IF EXISTS`tbl_entries_data_40`;
CREATE TABLE`tbl_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=685 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_40` ***
INSERT INTO`tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (684, 87, '#');

-- *** STRUCTURE:`tbl_entries_data_41` ***
DROP TABLE IF EXISTS`tbl_entries_data_41`;
CREATE TABLE`tbl_entries_data_41` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=678 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_41` ***
INSERT INTO`tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (677, 87, '#');

-- *** STRUCTURE:`tbl_entries_data_46` ***
DROP TABLE IF EXISTS`tbl_entries_data_46`;
CREATE TABLE`tbl_entries_data_46` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=544 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_46` ***
INSERT INTO`tbl_entries_data_46` (`id`, `entry_id`, `handle`, `value`) VALUES (543, 87, 'symphonycms', 'symphonycms');

-- *** STRUCTURE:`tbl_entries_data_47` ***
DROP TABLE IF EXISTS`tbl_entries_data_47`;
CREATE TABLE`tbl_entries_data_47` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=234 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_47` ***
INSERT INTO`tbl_entries_data_47` (`id`, `entry_id`, `handle`, `value`) VALUES (233, 87, 'website-title', 'Website Title');

-- *** STRUCTURE:`tbl_entries_data_48` ***
DROP TABLE IF EXISTS`tbl_entries_data_48`;
CREATE TABLE`tbl_entries_data_48` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=650 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_48` ***
INSERT INTO`tbl_entries_data_48` (`id`, `entry_id`, `value`) VALUES (649, 87, '#');

-- *** STRUCTURE:`tbl_entries_data_49` ***
DROP TABLE IF EXISTS`tbl_entries_data_49`;
CREATE TABLE`tbl_entries_data_49` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=650 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_49` ***
INSERT INTO`tbl_entries_data_49` (`id`, `entry_id`, `value`) VALUES (649, 87, '#f1f3f2');

-- *** STRUCTURE:`tbl_entries_data_50` ***
DROP TABLE IF EXISTS`tbl_entries_data_50`;
CREATE TABLE`tbl_entries_data_50` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=647 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_50` ***
INSERT INTO`tbl_entries_data_50` (`id`, `entry_id`, `value`) VALUES (646, 87, '#');

-- *** STRUCTURE:`tbl_entries_data_51` ***
DROP TABLE IF EXISTS`tbl_entries_data_51`;
CREATE TABLE`tbl_entries_data_51` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=610 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_51` ***
INSERT INTO`tbl_entries_data_51` (`id`, `entry_id`, `handle`, `value`) VALUES (609, 87, 'radley', 'Radley');

-- *** STRUCTURE:`tbl_entries_data_52` ***
DROP TABLE IF EXISTS`tbl_entries_data_52`;
CREATE TABLE`tbl_entries_data_52` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=595 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_52` ***
INSERT INTO`tbl_entries_data_52` (`id`, `entry_id`, `handle`, `value`) VALUES (594, 87, '69px', '69px');

-- *** STRUCTURE:`tbl_entries_data_53` ***
DROP TABLE IF EXISTS`tbl_entries_data_53`;
CREATE TABLE`tbl_entries_data_53` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_53` ***

-- *** STRUCTURE:`tbl_entries_data_54` ***
DROP TABLE IF EXISTS`tbl_entries_data_54`;
CREATE TABLE`tbl_entries_data_54` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_54` ***
INSERT INTO`tbl_entries_data_54` (`id`, `entry_id`, `handle`, `value`) VALUES (54, 173, 'martijn', 'Martijn');

-- *** STRUCTURE:`tbl_entries_data_55` ***
DROP TABLE IF EXISTS`tbl_entries_data_55`;
CREATE TABLE`tbl_entries_data_55` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_55` ***
INSERT INTO`tbl_entries_data_55` (`id`, `entry_id`, `handle`, `value`) VALUES (51, 173, 'info-xpresszocom', 'info@xpresszo.com');

-- *** STRUCTURE:`tbl_entries_data_56` ***
DROP TABLE IF EXISTS`tbl_entries_data_56`;
CREATE TABLE`tbl_entries_data_56` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_56` ***
INSERT INTO`tbl_entries_data_56` (`id`, `entry_id`, `handle`, `value`) VALUES (52, 173, 'http-wwwxpresszoco', 'http://www.xpresszo.co,');

-- *** STRUCTURE:`tbl_entries_data_57` ***
DROP TABLE IF EXISTS`tbl_entries_data_57`;
CREATE TABLE`tbl_entries_data_57` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_57` ***
INSERT INTO`tbl_entries_data_57` (`id`, `entry_id`, `value`, `date`) VALUES (54, 173, '2013-08-26T22:45:26+02:00', '2013-08-26 20:45:26');

-- *** STRUCTURE:`tbl_entries_data_58` ***
DROP TABLE IF EXISTS`tbl_entries_data_58`;
CREATE TABLE`tbl_entries_data_58` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_58` ***
INSERT INTO`tbl_entries_data_58` (`id`, `entry_id`, `relation_id`) VALUES (54, 173, 160);

-- *** STRUCTURE:`tbl_entries_data_59` ***
DROP TABLE IF EXISTS`tbl_entries_data_59`;
CREATE TABLE`tbl_entries_data_59` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_59` ***
INSERT INTO`tbl_entries_data_59` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (54, 173, 'Wow', 'Wow');

-- *** STRUCTURE:`tbl_entries_data_61` ***
DROP TABLE IF EXISTS`tbl_entries_data_61`;
CREATE TABLE`tbl_entries_data_61` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_61` ***

-- *** DATA:`tbl_entries` ***
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (87, 10, 1, '2011-05-05 23:07:40', '2011-05-05 21:07:40', '2013-08-26 22:30:46', '2013-08-26 20:30:46');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (173, 12, 1, '2013-08-26 22:45:26', '2013-08-26 20:45:26', '2013-08-26 22:45:26', '2013-08-26 20:45:26');

-- *** DATA:`tbl_extensions` ***
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (129, 'debugdevkit', 'enabled', '1.2.4');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (130, 'export_ensemble', 'enabled', '2.0.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (131, 'selectbox_link_field', 'enabled', 1.28);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (146, 'jit_image_manipulation', 'enabled', 1.19);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (133, 'maintenance_mode', 'enabled', 1.7);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (134, 'profiledevkit', 'enabled', 1.3);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (135, 'markdown', 'enabled', 1.17);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (136, 'xssfilter', 'enabled', 1.2);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (137, 'order_entries', 'enabled', '1.10.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (139, 'subsectionmanager', 'enabled', '3.5.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (140, 'color_chooser_field', 'enabled', '1.3.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (144, 'dont_drop', 'enabled', 1.4);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (147, 'image_index_preview', 'enabled', 1.3);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (148, 'limit_section_entries', 'enabled', '1.0.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (149, 'massuploadutility', 'enabled', '1.0.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (150, 'richtext_redactor', 'enabled', '1.1.1');

-- *** DATA:`tbl_extensions_delegates` ***
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (304, 129, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (303, 129, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (306, 130, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (319, 133, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (318, 133, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (317, 133, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (328, 134, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (327, 134, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (326, 137, '/backend/', 'InitaliseAdminPageHead', 'appendScriptToHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (335, 139, '/blueprints/datasources/', 'DatasourcePreDelete', '__clearSubsectionCache');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (307, 147, '/backend/', 'InitaliseAdminPageHead', 'InitaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (305, 144, '/backend/', 'InitaliseAdminPageHead', 'appendScriptToHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (338, 136, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (316, 133, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (337, 136, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (308, 146, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (314, 148, '/blueprints/sections/', 'SectionPreEdit', 'dSaveSectionSettings');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (313, 148, '/blueprints/sections/', 'SectionPreCreate', 'dSaveSectionSettings');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (312, 148, '/blueprints/sections/', 'AddSectionElements', 'dAddSectionElements');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (311, 148, '/backend/', 'AdminPagePreGenerate', 'dAdminPagePreGenerate');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (310, 148, '/backend/', 'InitaliseAdminPageHead', 'dInitaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (315, 133, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (324, 149, '/backend/', 'AdminPagePreGenerate', 'initaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (323, 149, '/system/preferences/', 'CustomActions', 'savePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (322, 149, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (334, 139, '/blueprints/datasources/', 'DatasourcePostEdit', '__clearSubsectionCache');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (333, 139, '/blueprints/datasources/', 'DatasourcePostCreate', '__clearSubsectionCache');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (332, 139, '/backend/', 'AdminPagePreGenerate', '__appendAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (330, 150, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (329, 150, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (309, 146, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (320, 133, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (321, 133, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (325, 149, '/publish/new/', 'EntryPostCreate', 'returnJSON');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (331, 150, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (336, 139, '/frontend/', 'DataSourceEntriesBuilt', '__prepareSubsection');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (339, 136, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');

-- *** DATA:`tbl_fields` ***
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (23, 'title', 'title', 'input', 7, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (24, 'sort', 'sort', 'order_entries', 7, 'no', 1, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (25, 'content', 'content', 'textarea', 7, 'no', 2, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (26, 'parent page', 'parent-page', 'selectbox_link', 7, 'no', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (27, 'image', 'image', 'upload', 8, 'no', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (28, 'title', 'title', 'input', 8, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (29, 'description', 'description', 'textarea', 8, 'no', 2, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (30, 'slideshow', 'slideshow', 'subsectionmanager', 7, 'no', 4, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (31, 'sidebar', 'sidebar', 'subsectionmanager', 7, 'no', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (32, 'title', 'title', 'input', 9, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (33, 'date', 'date', 'date', 9, 'no', 1, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (34, 'description', 'description', 'textarea', 9, 'no', 2, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (61, 'gallery', 'gallery', 'subsectionmanager', 9, 'no', 4, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (36, 'menu background color', 'menu-background-color', 'colorchooser', 10, 'no', 6, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (37, 'header background color', 'header-background-color', 'colorchooser', 10, 'no', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (38, 'body background color', 'body-background-color', 'colorchooser', 10, 'no', 9, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (48, 'captions color', 'captions-color', 'colorchooser', 10, 'no', 10, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (47, 'Website title', 'website-title', 'input', 10, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (40, 'menu text color', 'menu-text-color', 'colorchooser', 10, 'no', 7, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (41, 'menu text hover color', 'menu-text-hover-color', 'colorchooser', 10, 'no', 8, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (49, 'paragraph color', 'paragraph-color', 'colorchooser', 10, 'no', 11, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (46, 'Twitter username for displaying tweets on homepage:', 'twitter-username-for-displaying-tweets-on-homepage', 'input', 10, 'no', 4, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (50, 'Website title color', 'website-title-color', 'colorchooser', 10, 'no', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (51, 'Website title webfont', 'website-title-webfont', 'select', 10, 'no', 2, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (52, 'Website title fontsize', 'website-title-fontsize', 'select', 10, 'no', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (53, 'Author', 'author', 'author', 9, 'no', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (54, 'Name', 'name', 'input', 12, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (55, 'Email', 'email', 'input', 12, 'no', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (56, 'Website', 'website', 'input', 12, 'no', 2, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (57, 'Date', 'date', 'date', 12, 'no', 3, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (58, 'Article', 'article', 'selectbox_link', 12, 'yes', 4, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (59, 'Comment', 'comment', 'textarea', 12, 'yes', 5, 'main', 'no');

-- *** DATA:`tbl_pages` ***
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (77, NULL, 'page', 'page', NULL, 'page', 'baseds,generalsettingsds,logged_in_author,navds', 'login', 20);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (78, NULL, 'blog', 'blog', NULL, 'page', 'blogds,generalsettingsds,logged_in_author,navds,tweetsds', 'login', 21);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (79, NULL, 'article', 'article', NULL, 'page/article', 'articleds,baseds,generalsettingsds,logged_in_author,navds', 'login', 22);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (80, NULL, 'blog entry', 'blog-entry', NULL, 'blogtitle', 'blogentryds,commentsds,generalsettingsds,logged_in_author,navds,tweetsds', 'login,save_comment', 23);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (81, NULL, 'Error', 'error', NULL, 'page', 'generalsettingsds,navds', 'login', 24);

-- *** DATA:`tbl_pages_types` ***
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (708, 78, 'index');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (707, 81, 404);

-- *** DATA:`tbl_sections` ***
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `static`, `navigation_group`) VALUES (7, 'Pages', 'pages', 2, 'no', 0, 'no', 'Content');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `static`, `navigation_group`) VALUES (8, 'images', 'images', 3, 'yes', 0, 'no', 'Content');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `static`, `navigation_group`) VALUES (9, 'Blog', 'blog', 4, 'no', 0, 'no', 'Content');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `static`, `navigation_group`) VALUES (10, 'Preferences', 'preferences', 1, 'no', 1, 'yes', 'Preferences');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `static`, `navigation_group`) VALUES (12, 'Comments', 'comments', 5, 'yes', 0, 'no', 'Content');

-- *** DATA:`tbl_sections_association` ***
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (74, 7, 23, 7, 26, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (75, 7, 30, 8, 30, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (76, 7, 31, 8, 31, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (77, 9, 61, 8, 61, 'yes');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (78, 9, 32, 12, 58, 'yes');
