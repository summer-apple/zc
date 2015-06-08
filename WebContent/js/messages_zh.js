/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese, 中文 (Zhōngwén), 汉语, 漢語)
 */
$.extend($.validator.messages, {
	required: 	"必填项目！",
	remote: 	"已被注册！",
	email: 		"邮箱格式不正确！",
	url: 		"网址格式！",
	date: 		"日期格式！",
	dateISO: 	"日期格式：YYYY-MM-DD",
	number: 	"数字错误！",
	digits: 	"仅限整数！",
	creditcard: "请输入有效的信用卡号码",
	equalTo: 	"两次密码不一致",
	extension:	"请输入有效的后缀",
	maxlength: $.validator.format("最多输入 {0} 个字！"),
	minlength: $.validator.format("最少输入 {0} 字符!"),
	rangelength: $.validator.format("长度在 {0} 至{1}个字符之间！"),
	range: $.validator.format("大小在 {0} 至 {1} 之间！"),
	max: $.validator.format("长度不得大于 {0} 个字符！"),
	min: $.validator.format("长度不得小于 {0} 个字符！")
});
