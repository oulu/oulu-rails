/*
  - jQuery LinkScrubber Plugin 1.0.0.0 -
  For documentation please visit:
  http://www.crismanich.de/jquery/linkscubber/
*/

$(document).ready(function(){$("a").bind("focus",function(){if(this.blur)this.blur();});});