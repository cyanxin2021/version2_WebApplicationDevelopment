package test01.util;

public class htmlText {
//  返回页面Html携带的6位随机码
		public static String html(String code) {
			
			String html = "Email地址验证<br/>"+ 
			"账号激活声明<br/>"+
			"请将下面的验证码输入到提示框即可：<h3 style='color:red;'>" + code + "</h3><br/>";
			return html;
		}
}
