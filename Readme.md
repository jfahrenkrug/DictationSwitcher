# Dictation Switcher

I love the new dictation feature in Mac OS X Mountain Lion. But I was disappointed that it didn't include an easy way to switch the dictation language.

This tiny app solves this problem. I put it together in about 2 hours, so it's not polished and doesn't have bells and whistles, but it gets the job done.

You define the two languages you want to toggle between in `SPWKMenubarController.m` (default is English and German). When you start the app, the current language appears in the Mac OS status bar. When you click on it, it switches to the other language. That's it.

(If you are aware of a more elegant method to make the dictation process pick up the new language settings besides killing the process, please let me know!)

The status bar code is heavily based on https://github.com/shpakovski/Popup by shpakovski! Thanks!