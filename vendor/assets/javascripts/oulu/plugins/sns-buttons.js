/*
 *  Social Info 0.2 - jQuery plugin
 *  written by cyokodog
 *
 *  Copyright (c) 2014 cyokodog
 *    http://www.cyokodog.net/
 *    http://d.hatena.ne.jp/cyokodog/)
 *    http://cyokodog.tumblr.com/
 *  MIT LICENCE
 *
 *  Built for jQuery library
 *  http://jquery.com
 *
 */

;(function($){

  $.social = $.social || {};
  $.si = $.social.info = {
    jsonp : function( p ){
      return $.ajax({
        url:p.url,
        dataType:'jsonp',
        data:p.data,
        success:function( r ){
          p.callback(r);
        }
      });
    },
    reArg : function(url , callback){
      if(typeof url == 'object') return url;
      if(typeof url == 'function'){
        callback = url;
        url = '';
      }
      url = url || location.href;
      return {
        url : url,
        callback : callback
      };
    },
    cache : {
      twitter : {
        entryCount : {}
      }
    },
    version : '0.2',
    id : 'social-info',
    name : 'Social Info'
  }


  $.si.twitter = {
    getEntryCount : function(url, callback){
      var arg = $.extend({
        url : location.href,
        useCache : true,
        callback : function( count ){}
      }, $.si.reArg(url, callback))
      var cache = $.si.cache.twitter.entryCount;
      var eurl = encodeURIComponent(url);
      if(arg.useCache && cache[eurl] != undefined){
        arg.callback(cache[eurl]);
        return;
      }
      $.si.jsonp({
        url : 'http://urls.api.twitter.com/1/urls/count.json',
        data : {
          url : arg.url
        },
        callback : function(r){
          var count = r = !r ? 0 : r.count;
          cache[eurl] = count;
          arg.callback(count);
        }
      });
    },
    getEntryUrl : function(url, title ){
      url = url || location.href;
      if(title) title = '&text=' + encodeURIComponent(title);
      else{
        if(url == location.href) title = '&text=' + encodeURIComponent(document.title);
      }
      return 'https://twitter.com/intent/tweet?url=' + encodeURIComponent(url) + (title || '');
    },
    getSearchUrl : function( url ){
      url = url || location.href;
      return 'https://twitter.com/search?q=' + encodeURIComponent( url );
    }
  }

  $.si.facebook = {
    getEntryCount : function( url , callback){
      var arg = $.si.reArg(url, callback)
      $.si.jsonp({
        url : 'https://graph.facebook.com/',
        data : {
          id : arg.url
        },
        callback : function(r){
          arg.callback(r.shares || 0);
        }
      });
    },
    getEntryUrl : function( url ){
      url = url || location.href;
      return 'http://www.facebook.com/sharer.php?u=' + encodeURIComponent(url);
    },
    getSearchUrl : function( url ){
      url = url || location.href;
      return 'https://www.facebook.com/#!/search/results.php?q=' + encodeURIComponent( url );
    }
  }

  $.si.googleplus = {
    getEntryCount : function( url , callback){
      var arg = $.si.reArg(url, callback)
      $.ajax({
        type: "get",
        dataType: "xml",
        url: "http://query.yahooapis.com/v1/public/yql",
        data: {
          q: "SELECT content FROM data.headers WHERE url='https://plusone.google.com/_/+1/fastbutton?hl=ja&url=" + arg.url + "' and ua='#Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36'",
          format: "xml",
          env: "http://datatables.org/alltables.env"
        },
        success: function (data) {
          var content = $(data).find("content").text();
          var match = content.match(/window\.__SSR[\s*]=[\s*]{c:[\s*](\d+)/i);
          var count = (match != null) ? match[1] : 0;
          arg.callback(count);
        }
      });
    },
    getEntryUrl : function( url ){
      url = url || location.href;
      return 'https://plus.google.com/share?url=' + encodeURIComponent(url);
    },
    getSearchUrl : function( url ){
      url = url || location.href;
      return 'https://plus.google.com/u/0/?tab=mX#s/' + encodeURIComponent( url );
    }
  }


  $.si.hatebu = {
    getEntryCount : function( url , callback){
      var arg = $.si.reArg(url, callback)
      $.si.jsonp({
        url : 'http://api.b.st-hatena.com/entry.count',
        data : {
          url : arg.url
        },
        callback : arg.callback
      });
    },
    getEntryUrl : function(url){
      url = url || location.href;
      return 'http://b.hatena.ne.jp/entry/' + url.replace(/^http:\/\//,'').replace(/^https:\/\//,'s/');
    },
    getSearchUrl : function( url ){
      url = url || location.href;
      return 'http://b.hatena.ne.jp/entrylist?url=' + encodeURIComponent( url );
    },
    getEntryList : function( url, sort, callback){
      if(typeof sort == 'function'){
        callback = sort;
        sort = 'count';
      }
      if(typeof url == 'function'){
        callback = url;
        sort = 'count';
        url = '';
      }
      url = url || location.href;
      $.si.jsonp({
        url : 'http://b.hatena.ne.jp/entrylist/json',
        data : {
          sort : sort,
          url : url
        },
        callback : callback
      });
    },
    getEntry : function( url , callback){
      var arg = $.si.reArg(url, callback)
      $.si.jsonp({
        url : 'http://b.hatena.ne.jp/entry/jsonlite/',
        data : {
          url : arg.url
        },
        callback : arg.callback
      });
    },
    getProfileImgUrl : function(id, size){
      size = size ? '_'+size : '';
      return 'http://cdn.www.st-hatena.com/users/mo/'+id+'/profile'+size+'.gif';
    },
    getEntryImgUrl : function(url){
      return 'http://b.hatena.ne.jp/entry/image/' + url;
    }
  };


})(jQuery);

/*
 *  Easy Social Buttons 0.2 - jQuery plugin
 *  written by cyokodog
 *
 *  Copyright (c) 2014 cyokodog
 *    http://www.cyokodog.net/
 *    http://d.hatena.ne.jp/cyokodog/)
 *    http://cyokodog.tumblr.com/
 *  MIT LICENCE
 *
 *  Built for jQuery library
 *  http://jquery.com
 *
 */


;(function($){

  var plugin = $.esb = $.easySocialButtons = function(option ){
    var callee = arguments.callee;
    if(!(this instanceof callee)) return new callee(option );
    var o = this, c = o.config = $.extend(true, {}, callee.defaults, option);
    c.orders = option.orders || c.orders;
    c.buttons = $('<ul class="easy-social-buttons-container sns-buttons__items"/>');
    if(c.inverseColor) c.buttons.addClass('esb-inverse');
    $.each(c.orders, function(){
      var sname = this.toString();
      var api = c[sname] = $.esb[sname](option );
      api.getButton().appendTo(c.buttons);
    });
  }
  $.extend(plugin.prototype, {
    getButtons : function(){ // ボタンの取得
      var o = this, c = o.config;
      return c.buttons;
    },
    getButtonAPI : function(name ){ // API の取得
      var o = this, c = o.config;
      return c[name];
    }
  });
  $.extend(plugin, {
    defaults : {
      autoAdd : true, // true でボタンの自動挿入を行う
      addMethod : 'insertAfter', // ボタンの挿入メソッドを指定
      callback : function(api ){}, // プラグイン実行後のコールバック処理
      orders : ['hatebu','twitter', 'facebook', 'googleplus'], // ボタンの表示順
      labels : { // サービスの表示名
        'hatebu' : '<i class="fa fa-hatena"></i>',
        'twitter' : '<i class="fa fa-twitter"></i>',
        'facebook' : '<i class="fa fa-facebook"></i>',
        'googleplus' : '<i class="fa fa-google-plus"></i>'
      }
    },
    version : '0.2',
    id : 'easy-social-buttons',
    name : 'Easy Social Buttons'
  });

  $.fn.easySocialButtons = function(option ){
    var c = $.extend(true, {}, plugin.defaults, option);
    if(option) c.orders = option.orders || c.orders;
    return this.each(function(){
      var t = $(this);
      c.url = t.prop('href') || t.data('href') || t.data('url') || c.url;
      if(!c.url){
        c.url = location.href;
        c.addMethod = 'appendTo';
      }
      var api = $.easySocialButtons(c);
      if(c.autoAdd){
        api.getButtons(c)[c.addMethod](t);
      }
      c.callback.apply(t[0], [api]);
    });
  }

  var DF = plugin.defaults;
  $.each(DF.orders, function(idx){
    var sname = this.toString();
    var f = $.esb[sname] = function(option ){
      var callee = arguments.callee;
      if(!(this instanceof callee)) return new callee(option );
      var o = this, c = o.config = $.extend(true, {}, callee.defaults, callee.overwrite[sname] || {}, option, option[sname]);
      c.url = c.url || location.href;
      c.button = $(c.tempalte);
      c.wrapper = c.button.hasClass('esb') ? c.button : c.button.find('.esb');
      c.label = c.wrapper.find('.esb-label').html(c.label);
      c.counter = c.wrapper.find('.esb-counter').html(c.waitCounter);
      c.entryLink = c.wrapper.find('a.esb-entry');
      c.searchLink = c.wrapper.find('a.esb-search');
      if(c.useBrandColor) c.wrapper.addClass('esb-' + sname);
      if($.si){
        var SI = $.si[sname];
        if(c.counter.size() && SI.getEntryCount){
          SI.getEntryCount(c.url, function(count ){
            c.counter.text(count);
          });
        }
        !SI.getEntryUrl || c.entryLink.prop('href', SI.getEntryUrl(c.url )).prop('title', c.entryTitle);
        !SI.getSearchUrl || c.searchLink.prop('href', SI.getSearchUrl(c.url )).prop('title', c.searchTitle);
      }
    }
    $.extend(f.prototype, {
      getButton : function(){
        var o = this, c = o.config;
        return c.button;
      }
    });
    $.extend(f, {
      id : sname,
      defaults : {
        url : '',
        label : DF.labels[sname],
        entryTitle : '投稿する', // esb-entry クラスを持つ要素に割り当てる title 属性値
        searchTitle : '検索する', // esb-search クラスを持つ要素に割り当てる title 属性値
        waitCounter : '<span>&nbsp;</span>', // Web API の取得結果待ち時に表示するマークアップ
        tempalte : '<li class="esb sns-buttons__item"><a class="esb-label esb-entry sns-buttons__entry-link" target="_blank"></a><a class="esb-counter esb-search sns-buttons__search-link" target="_blank"></a></li>', // ボタンのテンプレート
        useBrandColor : false, // ブランドカラーの使用
        inverseColor : false // ブランドカラー未使用時の配色の反転
      },
      overwrite : {
        hatebu : {
          entryTitle : 'ブックマークする'
        }
      }
    });
  });
})(jQuery);

$(function(){
  $('.sns-buttons').easySocialButtons();
});
