package com.email;
import org.apache.commons.mail.HtmlEmail;
import java.util.Random;

public class MailUtil {
	public static void sendMail(String email, String subject, String msg) throws Exception {
		// google에 naver SMTP 사용설정이라고 검색하시면 됩니다.
		String charSet = "UTF-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "ahn_114"; 		// host 아이디(각자 NAVER 아이디로 바꾸시면 됩니다.)
		String hostSMTPpwd = "ghxpftmzjaqkdls!"; // 비밀번호(일단 제 비밀번호를 영어로 '호텔스컴바인!' 으로 바꿔놓았습니다.)
		
		// 보내는사람
		String fromEmail = "ahn_114@naver.com"; // 각자 NAVER 이메일로 바꾸시면 됩니다.
		String fromName = "호텔스컴바인";			// 보내는 사람의 이메일입니다.
		
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static String createKey() throws Exception{
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for(int i = 0; i < 10; i++) {
			int index = rnd.nextInt(3);
			
			switch (index) {
			case 0:
				key.append((char)((int)(rnd.nextInt(26) + 97)));
				break;
			case 1:
				key.append((char)((int)(rnd.nextInt(26) + 97)));
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				break;
			}
		}
		return key.toString();
	}
}
