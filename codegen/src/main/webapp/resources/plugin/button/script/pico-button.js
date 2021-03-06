/*
 * Title:
 * Description:
 * Aucthor:
 * Email: zengxianbin@gmail.com
 * Create Date:2009-06-18
 * Copyright 2009
 */
(function($) {
	$.fn.btn = function() {
		var btn = this.data("_self");
		;
		if (btn) {
			return btn;
		}
		;
		this.init = function() {
			var obj = $(this);
			var id = $(this).attr('id') || "gen" + Math.random();
			var icon = $(this).attr('icon') || 'icon-btncom';
			// var width = $(this).width();
			// alert(this.width()*0.8);
			var bntStr = [
					'<table id="',
					id,
					'" class="z-btn" cellSpacing=0 cellPadding=0 border=0><tbody><tr>',
					'<TD class=z-btn-left><i>&nbsp;</i></TD>',
					'<TD class=z-btn-center><EM unselectable="on">',
					'<INPUT type="button" class="z-button z-btn-text ', icon,
					'"  value="', $(this).attr('value'),
					'"  ud="bnt" ></INPUT></EM></TD>',
					'<TD class=z-btn-right><i>&nbsp;</i></TD></tr></tbody></table>' ];
			var bnt = $(bntStr.join('')).btn();
			bnt._click = function() {
				eval(obj.attr("onclick"));
			};
			if (obj.attr("disabled"))
				bnt.disable();
			else
				bnt.enable();
			$(this).replaceWith(bnt);
			bnt.data("_self", bnt);
			return bnt;
		};
		this.enable = function() {
			this.removeClass("z-btn-dsb");
			this.click(this._click);
			this.hover(function() {
				$(this).addClass("z-btn-over");
			}, function() {
				$(this).removeClass("z-btn-over");
			});
		};
		this.disable = function() {
			this.addClass("z-btn-dsb");
			this.unbind("hover");
			this.unbind("click");
		};
		return this;
	};

	$(function() {
		$("input[type='button']").each(function() {
			if ($(this).attr("ud") != "bnt")
				$(this).btn().init();

		});
	});
})(jQuery);