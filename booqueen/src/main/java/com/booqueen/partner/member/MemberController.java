package com.booqueen.partner.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/password.pdo", method = RequestMethod.GET)
	public String password(HttpSession session) {
		return "change-password";
	}
	
	@RequestMapping(value = "/change-password.pdo", method = RequestMethod.POST)
	public String changePasswd(MemberVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		if(vo.getPassword() == "" && vo.getConfirmpass() == "") {
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('비밀번호를 입력해야 함');");
	        writer.println("history.back();");
	        writer.println("</script>");
	        writer.flush();
		} else if(vo.getPassword().equals(vo.getConfirmpass())) {
			 response.setCharacterEncoding("UTF-8");
	         PrintWriter writer = response.getWriter();
	         writer.println("<script type='text/javascript'>");
	         writer.println("alert('현재비번 바꿀비번 일치');");
	         writer.println("history.back();");
	         writer.println("</script>");
	         writer.flush();
		} else if(vo.getPassword() != vo.getConfirmpass()) {
			MemberVO member = memberService.getPassword(vo);
			member.setConfirmpass(vo.getConfirmpass());
			System.out.println(member.toString());
			if(member != null) {
				memberService.changePassword(vo);
				response.setCharacterEncoding("UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비밀번호가 변경되었습니다.');");
				writer.println("</script>");
				writer.flush();
			}
		}
		return "home";
	}

}
