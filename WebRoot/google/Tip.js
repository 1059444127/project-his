//**********************  显示隐藏Tip层  *******************************//
var _key;
function ShowTip(obj)
{
	document.onkeyup=function(e){
		if(e == null)/////////IE
		{
			_key=event.keyCode;
		}
		else//FireFox
		{
			_key=e.which;
		}
		
		if(_key!=39 && _key!=40 && _key!=37 && _key!=38 && _key!=13 && _key!=17 && obj.value != "")
		{   
			obj.nextSibling.style.display="";
			obj.nextSibling.innerHTML="<img src='google/ajax-loader.gif'>&nbsp;正在获取提示...";
			VCreateAjax(obj, "google/Tip.jsp", "KeyWord="+ obj.value);
		}
	}
}

function HideTTip(obj)
{
	obj.nextSibling.style.display="none";
}
//**********************   显示隐藏Tip层   ************************************* //

//**********************   Ajax初始化函数 IE7.0  **********************//
function VCreateAjax(obj, VUrl, VVar) {
	http_request_name = false;
	if (window.XMLHttpRequest) {// Mozilla, Safari,...
		http_request_name = new XMLHttpRequest();
	} 
	if (window.ActiveXObject) { // IE
		try {
			http_request_name = new ActiveXObject("Msxml3.XMLHTTP");
		} catch (e) {
			try {
				http_request_name = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request_name = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (http_request_name.overrideMimeType) {
			http_request_name.overrideMimeType('text/html');
		}

	}

	if (!http_request_name) {
		obj.nextSibling.innerHTML="<img src='google/Icon_warning_01.gif' border='0'>&nbsp;不能创建XMLHTTP对象,请升级您的浏览器或操作系统！";
		return false;
	}
	http_request_name.onreadystatechange = function BackArray()
	{
		if (http_request_name.readyState == 4)
		{
			if (http_request_name.status == 200)
			{
				var resSource = http_request_name.responseText;
				//alert(resSource);
				if (resSource!="")
				{
					obj.nextSibling.innerHTML="";
					var strSplits = resSource.split('|');
					var DIVStr="";
					var FormatStr="";
					var sum = strSplits.length - 1;
					var elementText = obj.value;
					//alert(sum);
					//搜索有内容
					if (sum > 1) {
						for(i = 1; i < sum; i++)//cut 0, and the end element
						{	
							FormatStr = strSplits[i].replace(elementText,"<b><font color='red'>"+elementText+"</font></b>")
							DIVStr+="<div id='"+i+"' hideFocus style='cursor:pointer;line-height:20px;' onmousemove='FocusOP("+obj+ ","+i+","+sum+");' onmouseout='UFocusOP("+obj+","+i+");' onclick='ClickInner("+obj+",'"+strSplits[i]+"')'>"+FormatStr+"</div>";
						}
						
						obj.nextSibling.innerHTML = DIVStr;
						
						var i = 1; maxid = strSplits.length - 2;
						
						FocusOP(obj, i, maxid);
						document.onkeydown = function(e) {
							if(e == null)//For IE
							{
								_key = event.keyCode;
							}
							else//For FireFox and other
							{
								_key=e.which;
							}
							
							/////////////向下
							if (_key==39 || _key==40) {
							    UFocusOP(obj, i);
								i = i + 1;
								if (i > maxid) {
									i = 1;
								}
								FocusOP(obj, i, maxid);
							}
							
							/////////////向上
							else if (_key==37 || _key==38) {
								UFocusOP(obj, i);
								i = i - 1;
								if (i < 1) {
									i = maxid;
								}
								FocusOP(obj, i, maxid);
							}
							//回车且弹出框显示有内容
							if(_key == 13 && obj.nextSibling.style.display != "none")
							{   
								if (window.XMLHttpRequest) { 
									obj.value=$(obj).parent().find("#"+i).textContent;
								} else {
									obj.value=$(obj).parent().find("#"+i).innerText;
								}
								obj.nextSibling.style.display == "none";
							} 
							//回车且弹出框不显示-->开始搜索
							else if (_key == 13 && obj.nextSibling.style.display == "none") {
								alert("search")
							}
						}//end key down
					}//
				}
				else
				{
					alert("the context is empty...");
					obj.nextSibling.style.display="none";
				}
			}
			else
			{
				//alert("6");
				obj.nextSibling.innerHTML="<img src='Icon_warning_01.gif'>&nbsp;数据返回错误！！";
			}
		}
	};
	http_request_name.open('POST', VUrl, true); //这里用GET方法传递参数，不然会出现完成该操作所需的数据还不可使用的页面错误
	http_request_name.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	http_request_name.send(VVar);
	
}


//********************************回调函数************************************
//获取焦点
function FocusOP(obj, OPP, VNum)
{
	var obj = $(obj)
	//清除其它焦点
	for(M = 1; M < VNum; M++)
	{   
		obj.parent().find("#"+M).focus=false;
		obj.parent().find("#"+M).css("background","#FFFFFF");
	}
	obj.parent().find("#"+OPP).focus=true;
	obj.parent().find("#"+OPP).css("background","#DEEDFE");// change to green
	
}
//失去焦点
function UFocusOP(obj,EID)
{
	var obj = $(obj)
	//alert(EID + " UFocusOP ");
	obj.parent().find("#"+EID).focus=false;
	obj.parent().find("#"+EID).css("background","#FFFFFF");
}

//单击注入值
function ClickInner(obj,strValue)
{
	alert(obj+""+strValue)
	obj.nextSibling.value=strValue;
	obj.nextSibling.style.display="none";
}
