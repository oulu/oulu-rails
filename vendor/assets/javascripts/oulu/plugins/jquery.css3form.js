/* ======================================================
 Script information

 file name   :jquery.css3form.js
 book info   :CSS3デザインプロフェッショナルガイド
 author      :秋葉秀樹、秋葉ちひろ、宮澤了祐
 created     :2011.05.28
 update      :-
 script info :
   ・チェックボックスの場合div.customCheckBoxが生成されます。
	 ・ラジオボタンの場合div.customRadioBoxが生成されます。
	 ・セレクトの場合div.customSelectorが生成されます。
====================================================== */
$(function(){

	$.fn.css3form = function(){
		var form = $(this).addClass("css3form");
		
		var checkRadioButton = function() {
			var more = $(this).parents(".customRadioButton").parent();
			if($(this).hasClass("more") && $(this).hasClass("checked")){
				more.find(".moreQuestion").show(300);
			}else{
				more.find(".moreQuestion").hide(300);
			}
		}
		
		var update_radio = function(radio){
			if(radio.hasClass("css3form-radio"))return;
			wrap = $("<ul></ul>").appendTo($("<div></div>").addClass("customRadioButton").insertBefore(radio));
			
			$("input[name="+ radio.attr("name") + "]").each(function(){
				ele = $(this).addClass("css3form-radio");
				label = $("label[for="+ele.attr("id")+"]");
				toggle_btn = $("<a></a>").attr("href","#").html(label.html());
				wrap.append(toggle_btn);
				toggle_btn.wrap("<li></li>");
				
				func = function(_ele,_btn,_wrap){
					return function(){
						_ele.trigger("click");
						_wrap.find(".checked").removeClass("checked");
						_btn.addClass("checked");
						checkRadioButton.apply(_btn);
						return false;
					}
				}(ele,toggle_btn,wrap);
				
				toggle_btn.click(func);
				ele.hide();
				label.hide();
				
				if(ele.attr("checked")){
					toggle_btn.addClass("checked");
				}
				if(ele.hasClass("more")){
					toggle_btn.addClass("more");
				}
			});
			
		};
		
		var update_checkbox = function(check){
			if(check.hasClass("css3form-checkbox"))return;
			wrap = check.parent().find(".customCheckBox ul");
			if(wrap.size() < 1)wrap = $("<ul></ul>").appendTo($("<div></div>").addClass("customCheckBox").insertBefore(check));

			
			(function(){
				ele = $(this).addClass("css3form-checkbox");
				label = $("label[for="+ele.attr("id")+"]");
				toggle_btn = $("<a></a>").attr("href","#").html(label.html());
				wrap.append(toggle_btn);
				toggle_btn.wrap("<li></li>");
				func = function(_ele,_btn,_wrap){
					return function(){
						_ele.trigger("click");
						_btn.toggleClass("checked");
						return false;
					}
				}(ele,toggle_btn,wrap);
				
				toggle_btn.click(func);
				ele.hide();
				label.hide();
				
				if(ele.attr("checked")){
					toggle_btn.addClass("checked");
				}
			}).apply(check);
			
			
		};
		
		var update_select = function(select){
			wrap = $("<div><dl><dd><ul></ul></dd></dl></div>").addClass("customSelector").insertBefore(select);
			dd = wrap.find("dd");
			dd.css({"height": 0,"overflow":"hidden"}); // added
			select.find("option").each(function(){
				//blank
				if($(this).val().length < 1){
					var btn = $("<a></a>").addClass("customSelector-label")
							.attr("href","javascript:void(0);")
							.html($(this).html())
							.click((function(_wrap){
								return function(e){
									_dd = _wrap.find("dd").toggleClass("open");
									_dd.height(_dd.find("ul").height() * _dd.hasClass("open") );
									return false;
								}
							}(wrap)
					));
					wrap.find("dl").append($("<dt></dt>").append(btn));
					$(window).bind("click",function(){
						if(wrap.find("dd").hasClass("open")){
							btn.trigger("click");
						}
					});
					return;
				}
				
				toggle_btn = $("<a></a>").attr("href","javascript:void(0);").html($(this).html());
				wrap.find("ul").append(toggle_btn);
				toggle_btn.wrap("<li></li>");
				
				func = function(_opt,_select,_wrap,_dd){
					return function(){
						_select.val(_opt.val());
						_wrap.find(".customSelector-label").html(_opt.html());
						_dd = _wrap.find("dd.open").removeClass("open").height(0);
						return false;
					}
				}($(this),select,wrap,dd);
				
				toggle_btn.click(func);
				
			});
			
			select.hide();
		};
		
		
		
		$(this).find("input[type=radio]").each(function(){
			update_radio($(this));
		});
		$(this).find("input[type=checkbox]").each(function(){
			update_checkbox($(this));
		});
		$(this).find("select").each(function(){
			update_select($(this));
		});
		$(this).find("input[type=email]").each(function(){
			$(this).bind("blur",function(){
				var check_valid_email = function(value){
					if(value.match(/^[A-Za-z0-9]+[\w-]+@[\w\.-]+\.\w{2,}$/)){
						$(this).removeClass("mail_error");
						form.unbind("submit",function(){ return false; });
						return true;
					}
					$(this).addClass("mail_error");
					form.bind("submit",function(){ return false; });
					return false;
				};
				
				if(check_valid_email($(this).val())){
					return true;
				}
				
				$(this).addClass("mail_error");
				$(this).focus();
				
				return false;
			}).bind("keydown",function(){
				$(this).removeClass("mail_error");
				form.unbind("submit",function(){ return false; });
			});
			$(this).get(0).setAttribute("type","text");
		});
		
		//zipcode
		$(".css3form_zipcode").bind("blur",function(){
			val = $(this).val().replace(/(\d{3})-(\d{4})/,"$1$2");
			if(val.length < 3)return;
			target = $(".css3form_address");
			//@see http://groovetechnology.co.jp/webservice/zipsearch/index.html
			$.getJSON("http://groovetechnology.co.jp/ZipSearchService/v1/zipsearch?zipcode="+val+"&callback=?",function(data){
				target.val(data.zipcode.a1.prefecture + data.zipcode.a1.city + data.zipcode.a1.town);
			});
		});
		
		
		return $(this);
	};
});
