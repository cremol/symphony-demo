
#Color Chooser Field

Version: 1.2.1 <br/>
Author: Josh Nichols (mrblank@gmail.com)<br/>
Build Date: 2010-07-19<br/>
Requirements: Symphony 2.0.5<br/>


####Installation

1. Upload the folder in this archive to your Symphony 'extensions' folder and rename it to `color_chooser_field`.

2. Enable it by selecting the "Field: Color Chooser", choose Enable from the with-selected menu, then click Apply.

3. You can now add a "Color Chooser" field to your sections.

4. On the entry edit screen, it uses the Farbtastic Color Picker [http://acko.net/dev/farbtastic](http://acko.net/dev/farbtastic) to visually select a color and place its hex value into the field. 

See a screencast of the field in action: [http://www.vimeo.com/6062027](http://www.vimeo.com/6062027)


####Change log

1.2.1

* Updated to display properly with Symphony 2.0.7

1.2

* Now uses the [jQuery Tools Tooltip](http://flowplayer.org/tools/demos/tooltip/index.html) plugin so the color picker will not extend outside the browser window.


1.1

* Updated to use Symphony core's jQuery file (no longer works with versions earlier than 2.0.5).

* Now uses compatibility mode so it will work with other frameworks.

* Color chooser is now hidden until field is in focus, taking up less screen real estate -- and looking cooler.



1.0.1

* Fixed duplicate links to JavaScript files.

* Fixed bug in Safari 4.