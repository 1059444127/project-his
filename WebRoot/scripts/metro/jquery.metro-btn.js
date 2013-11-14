/*
 * Interação - Metro Button 1.1.0 - jQuery Plugin
 * http://www.interacaosistemas.com.br
 * Copyright (c) 2012 Roger Medeiros
 * Microsoft Reciprocal License (Ms-RL)
 * Revision: $Id: jquery.metro-btn.min.js 2 2012-06-27
 */
(function ($) {
    $.fn.AddMetroSimpleButton = function (id, theme, imagem, texto, link) {
        var el = $(this);
        var html_code = "<div";
        if (id != '') {
            html_code += " id='" + id + "'";
        }
        if (link != '') {
            html_code += " onclick='" + link + "'";
        }
        html_code += " class='metro-btn metro metrosingle " + theme + "'>\r\n";
        html_code += "\t<div class='imgsimple'><img src='" + imagem + "' alt='" + texto + "' /></div>\r\n";
        html_code += "\t<span>" + texto + "</span>\r\n";
        html_code += "</div>\r\n";

        el.append(html_code);
    };

    $.fn.AddMetroDoubleButton = function (id, theme, imagem, texto, link) {
        var el = $(this);
        var html_code = "<div";
        if (id != '') {
            html_code += " id='" + id + "'";
        }
        if (link != '') {
            html_code += " onclick='" + link + "'";
        }
        html_code += " class='metro metrodouble " + theme + "'>\r\n";
        html_code += "\t<div class='imgdouble'><img src='" + imagem + "' alt='" + texto + "' /></div>\r\n";
        html_code += "\t<span>" + texto + "</span>\r\n";
        html_code += "</div>\r\n";

        el.append(html_code);
    };
    $.fn.AddMetroDoubleTextButton = function (id, theme, imagem, list, link) {
        var el = $(this);
        var html_code = "<div";
        if (id != '') {
            html_code += " id='" + id + "'";
        }
        if (link != '') {
            html_code += " onclick='" + link + "'";
        }
        var ul = "<table style='margin:10px;text-align:left'>";
        for(var x in list) {
        	ul += "<tr style='height:18px'><td style='width:100px'>"+x+"</td><td>"+list[x]+"</td></tr>";
        }
        ul += "</table>";
        html_code += " class='metro metrodouble " + theme + "'>\r\n";
        html_code += "\t<span style='margin-top:15px'>" + ul + "</span>\r\n";
        html_code += "</div>\r\n";

        el.append(html_code);
    };

    $.fn.AddMetroSingleLabeledButton = function(id, theme, imagem, texto, link) {
        var el = $(this);
        var html_code = "<div";
        if (id != '') {
            html_code += " id='" + id + "'";
        }
        if (link != '') {
            html_code += " onclick='" + link + "'";
        }
        html_code += " class='metro metrosingle " + theme + "'>\r\n";
        html_code += "\t<div class='imglabeled'><img src='" + imagem + "' alt='" + texto + "' /></div>\r\n";
        html_code += "\t<div class='metrolabel'>" + texto + "</div>\r\n";
        html_code += "</div>\r\n";

        el.append(html_code);
    };
    
	
	$.fn.AddMetroDoubleWithTrailer = function(id, theme, imagem, texto, link, theme_trailer) {
		var el = $(this);
        var html_code = "<div";
        if (id != '') {
            html_code += " id='" + id + "'";
        }
        if (link != '') {
            html_code += " onclick='" + link + "'";
        }
        html_code += " class='metro metrodouble " + theme + "'>\r\n";
        html_code += "\t<div class='imgdouble'><img src='" + imagem + "' alt='" + texto + "' /></div>\r\n";
        html_code += "\t<div class='metro-destaque-rodape " + theme_trailer + "'><span>" + texto + "</span></div>\r\n";
        html_code += "</div>\r\n";

        el.append(html_code);	
	};
	
	$.fn.AddMetroDoubleWithTrailerWithBG = function(id, bg_image, texto, link, theme_trailer) {
		var el = $(this);
        var html_code = "<div";
        if (id != '') {
            html_code += " id='" + id + "'";
        }
        if (link != '') {
            html_code += " onclick='" + link + "'";
        }
        html_code += " class='metro metrodouble' style='background:url(" + bg_image + ");'>\r\n";
        html_code += "\t<div class='metro-destaque-rodape " + theme_trailer + "'><span>" + texto + "</span></div>\r\n";
        html_code += "</div>\r\n";

        el.append(html_code);	
	};	
})(jQuery);