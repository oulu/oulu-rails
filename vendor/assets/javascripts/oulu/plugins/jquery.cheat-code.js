/*global window,document,jQuery */

/*!
* Cheat Code: a jQuery Plugin
* @author: Trevor Morris (trovster)
* @url: http://www.trovster.com/lab/code/plugins/jquery.cheat-code.js
* @documentation: http://www.trovster.com/lab/plugins/cheat-code/
* @published: 10/05/2009
* @updated: 10/05/2009
* @license Creative Commons Attribution Non-Commercial Share Alike 3.0 Licence
*      http://creativecommons.org/licenses/by-nc-sa/3.0/
*/
if (typeof jQuery !== 'undefined') {
  jQuery(function ($) {

    var complete = function (o) {
      var $overlay = $('<div class="overlay" />'),
        $message = $('<div class="modal" />');

      $overlay.add($message.text(o.message)).appendTo('body');
      window.setTimeout(function () {
        $message.fadeOut(500, function () {
          $(this).remove();
          $overlay.fadeOut(500, function () {
            $(this).remove();
          });
        });
      }, 1000);
    },
    unbind = function (o) {
      if (o.unbind === true) {
        $(this).unbind('keydown.cheatCode' + o.code.toString());
      }
    };

    $.fn.extend({
      cheatCode: function (options) {
        var $$  = $(this),
          s = $.extend({}, $.fn.cheatCode.defaults, options),
          o = $.metadata ? $.extend({}, s, $$.metadata()) : s,
          k = [];

        return this.each(function () {
          $$.bind('keydown.cheatCode' + o.code.toString(), function (event) {
            k.push(event.keyCode);
            if (k.toString().indexOf(o.code) >= 0) {
              k = [];
              o.activated.call(this, o);
              unbind.call(this, o);
            }
          });
        });
      }
    });

    $.fn.cheatCode.defaults = {
      code:   '38,38,40,40,37,39,37,39,66,65',
      unbind:   true,
      activated:  function (o) {complete(o)},
      message:  'Cheat Code Activated'
    };
  }(jQuery));
}