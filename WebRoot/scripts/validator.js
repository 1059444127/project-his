(function(window, document, vir){
	var defaults = {
        messages: {
            required: '%s 为必填项.',
            matches: '%s 与 %s 不相同.',
            valid_email: '%s 的email地址有误.',
            min_length: '%s 的内容长度最小为 %s .',
            max_length: '%s 的内容长度最大为 %s .',
            exact_length: '%s 的内容长度必须为 %s .',
            greater_than: '%s 的数值必须大于 %s.',
            less_than: '%s 的数值必须小于 %s.',
            alpha: '%s 只能包含字母.',
            alpha_numeric: '%s 只能包含字母、数字.',
            alpha_dash: '%s 只能包含字母、数字、下划线和减号.',
            numeric: '%s 只能包含数字.',
            integer: '%s 只能是整数.',
            decimal: '%s 只能是整数、小数.',
            is_natural: '%s 必须是自然数.',
            is_natural_no_zero: '%s 必须是正整数.',
            valid_ip: '%s 的IP地址有误.',
            valid_base64: '%s 必须是base64的字符串.',
			chinese: '%s 只包含中文字符.'
        },
        callback: function(success) {
        	//此方法用于成功后调用
        },
        error: function(error){
        	//此方法用于失败时调用
        }
    };

    /*
     * Define the regular expressions that will be used
     */

    var ruleRegex = /^(.+)\[(.+)\]$/,
		chineseRegex = /^[\u4e00-\u9fa5]+$/,
        numericRegex = /^[0-9]+$/,
        integerRegex = /^-?([1-9]\d*|0)$/,
        decimalRegex = /(^-?[1-9]\d*)|(^-?([1-9]\d*|0(?!\.0+$))\.\d+?$)/,
        emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,6}$/i,
        alphaRegex = /^[a-z]+$/i,
        alphaNumericRegex = /^[a-z0-9]+$/i,
        alphaDashRegex = /^[a-z0-9_-]+$/i,
        naturalRegex = /^[1-9]\d*|0$/,
        naturalNoZeroRegex = /^[1-9]\d*$/,
        ipRegex = /^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})$/i,
        base64Regex = /[^a-zA-Z0-9\/\+=]/i;
	
	//{fieldId: '', fieldName: '', matchFieldId: '', rules: '', messages: ''}
	function FormValidator(){
		if(arguments.length == 0 )return;
		var argLength = arguments.length, that = this, callback = argLength > 1 ? arguments[argLength - 1] : null, error = argLength > 2 ? arguments[argLength - 2] : null;
		if(typeof callback != "function")
			callback = null;
		if(typeof error != "function")
			error = null;
		this.errorBox = arguments[0],
		this.callback =  callback || defaults.callback;
		this.error = error || defaults.error;
        this.fields = {};
        this.messages = {};
		this.errors = [];

		for(var i = 0; i < argLength; i++){
			var _obj = arguments[i];
			if(typeof _obj == "object"){
				if(_obj instanceof Array){
					for(var j = 0; j < _obj.length; j++){
						setField(_obj[j]);
					}
				}else{
					setField(_obj);
				}
			}
		}
		
		function setField(obj){
			if (!obj.fieldId || !obj.rules) {
                return;
            }
			that.fields[obj.fieldId] = {
				id: obj.fieldId,
				name: obj.fieldName || obj.fieldId,
				rules: obj.rules,
				param: obj.matchFieldId
			};
			that.messages[obj.rules] = obj.message;
		}
		
	}
	
	FormValidator.prototype.validator = function(){
		for(var fieldId in this.fields){
			var fieldDom = document.getElementById(fieldId),
				field = this.fields[fieldId],
				rules = field.rules.split('|'),
				param = field.param;
				
			if (!(field.rules.indexOf('required') === -1 && (!fieldDom.value || fieldDom.value === '' || fieldDom.value === undefined))) {			
				for (var i = 0, ruleLength = rules.length; i < ruleLength; i++) {
					if(!this._hooks[rules[i]](fieldDom, param)){	
						var	source = this.messages[rules[i]] || defaults.messages[rules[i]],
							message = field.name + '字段检验未通过.';
							
						if (source) {
							message = source.replace('%s', field.name);
							if (param) {
								message = message.replace('%s', param);
							}
						}
						this.errors.push(message);
						break;
					}
				}
			}
		}
		this._errors();
		if(this.errors.length == 0)
			this.callback();
		else
			this.error();
		this.errors = [];
	};
	
	FormValidator.prototype._errors = function(){
		var _o = document.getElementById(this.errorBox),
			doc = document.createDocumentFragment();
		for(var i = 0; i < this.errors.length; i++){
			var _p = document.createElement("p");
			_p.innerText = this.errors[i];
			doc.appendChild(_p);
		}
		_o.innerHTML = "";
		_o.appendChild(doc);		
	};
		
	FormValidator.prototype._hooks = {
        required: function(field) {
            var value = field.value;

            if (field.type === 'checkbox') {
                return (field.checked === true);
            }
            return (value !== null && value !== '');
        },

        matches: function(field, matchId) {
            if (el = document.getElementById(matchId)) {
                return field.value === el.value;
            }
            return false;
        },

        valid_email: function(field) {
            return emailRegex.test(field.value);
        },

        valid_emails: function(field) {
            var result = field.value.split(",");        
            for (var i = 0; i < result.length; i++) {
                if (!emailRegex.test(result[i])) {
                    return false;
                }
            }
            
            return true;
        },

        min_length: function(field, length) {
            if (!numericRegex.test(length)) {
                return false;
            }
            return (field.value.length >= parseInt(length, 10));
        },

        max_length: function(field, length) {
            if (!numericRegex.test(length)) {
                return false;
            }
            return (field.value.length <= parseInt(length, 10));
        },

        exact_length: function(field, length) {
            if (!numericRegex.test(length)) {
                return false;
            }      
            return (field.value.length === parseInt(length, 10));
        },

        greater_than: function(field, param) {
            if (!decimalRegex.test(field.value)) {
                return false;
            }
            return (parseFloat(field.value) > parseFloat(param));
        },

        less_than: function(field, param) {
            if (!decimalRegex.test(field.value)) {
                return false;
            }
            return (parseFloat(field.value) < parseFloat(param));
        },

        alpha: function(field) {
            return (alphaRegex.test(field.value));
        },

        alpha_numeric: function(field) {
            return (alphaNumericRegex.test(field.value));
        },

        alpha_dash: function(field) {
            return (alphaDashRegex.test(field.value));
        },

        numeric: function(field) {
            return (decimalRegex.test(field.value));
        },

        integer: function(field) {
            return (integerRegex.test(field.value));
        },

        decimal: function(field) {
            return (decimalRegex.test(field.value));
        },

        is_natural: function(field) {
            return (naturalRegex.test(field.value));
        },

        is_natural_no_zero: function(field) {
            return (naturalNoZeroRegex.test(field.value));
        },

        valid_ip: function(field) {
            return (ipRegex.test(field.value));
        },

        valid_base64: function(field) {
            return (base64Regex.test(field.value));
        },
		
		chinese: function(field) {
			return (chineseRegex.text(field.value));
		}
    };
	
	window.FormValidator = FormValidator;

})(window, document);