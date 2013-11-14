/**设置下拉框默认值
 *@param id
 *下拉框ID
 *@param str 
 *需匹配的字符串
 *@param equlsByText
 *是否通过匹配Text,默认为通过value
 **/
function setDefault(id, str, equlsByText) {
	var selobj = document.getElementById(id);
	str = str + "";
	if (typeof str == "object" && str instanceof Array) {
		for ( var i = 0; i < selobj.options.length; i++) {
			for ( var j = 0; j < str.length; j++) {
				if (equlsByText) {
					if (selobj.options[i].text == str[j]) {
						selobj.options[i].selected = "selected";
						return true;
					}
				} else {
					if (selobj.options[i].value == str[j]) {
						selobj.options[i].selected = "selected";
						return true;
					}
				}
			}
		}
		
	} else {
		for ( var i = 0; i < selobj.options.length; i++) {
			if (equlsByText) {
				if (selobj.options[i].text == str) {
					selobj.options[i].selected = "selected";
					return true;
				}
			} else {
				if (selobj.options[i].value == str) {
					selobj.options[i].selected = "selected";
					return true;
				}
			}
		}
	}
	return false;
}