package com.booqueen.user.member;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booqueen.user.member.service.MemberProfileService;
import com.booqueen.user.member.vo.MemberProfileVO;
import com.booqueen.user.member.vo.ReasonVO;

@Controller
public class MemberController{
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberProfileService memberProfileService;
	
	KakaoAPI kakaoApi = new KakaoAPI();

	@RequestMapping(value = "/member/loginForm.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO user = memberService.getMember(vo);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(user != null && user.getUserid() != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", user);
			session.setAttribute("isLogOn", true);
			
			MemberProfileVO profile = getProfile(user.getUserid());
						
			session.setAttribute("user_profile", profile);
			
			return "member/index";
		} else {
			out.println("<script>alert('잘못된 정보입니다.')</script>");
            out.flush();
			return "member/loginForm";
		}
	}
	
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		if (user.getType() != null) {
			String kakaologout = kakaoLogout(session);
		} else {
			session.setAttribute("isLogOn", false);
			session.removeAttribute("member");
			session.invalidate();
		}
		System.out.println("logout.do");
		return "member/index";
		
	}
	
	@RequestMapping(value = "/member/registerForm.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String register() {
		return "member/registerForm";
	}
	
	// 이메일 체크
	@RequestMapping(value = "/member/useridCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String useridCheck(MemberVO vo) {
		
		String userid = vo.getUserid();
		MemberVO user = memberService.getMemberByUserid(userid);
		
		boolean err = false;
		String regex = 	"^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; // (?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(userid);
		if (m.matches()) {
			err = true;
		}
		
		String message = null;
		
		if (user == null && !userid.isEmpty()) {
			if (!err) {
				message = "err";
			} else {
				message = "success";
			}
		} else {
			message = "fail";
		}
		
		return message;
	}
	
	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String test(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int result = 0;
		
		if (vo.getUserid() == null || vo.getUserid().isEmpty()) {
			out.println("<script>alert('아이디를 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getPasswd() == null || vo.getPasswd().isEmpty()) {
			out.println("<script>alert('비밀번호를 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getName() == null || vo.getName().isEmpty()) {
			out.println("<script>alert('이름을 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getGender() == null || vo.getGender().isEmpty()) {
			out.println("<script>alert('성별을 선택해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getPhone2() == null || vo.getPhone2().isEmpty()) {
			out.println("<script>alert('휴대폰 번호를 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getPhone3() == null || vo.getPhone3().isEmpty()) {
			out.println("<script>alert('휴대폰 번호를 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getBirth_year() == null || vo.getBirth_year().isEmpty()) {
			out.println("<script>alert('생년월일을 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getBirth_month() == null || vo.getBirth_month().isEmpty()) {
			out.println("<script>alert('생년월일을 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getBirth_day() == null || vo.getBirth_day().isEmpty()) {
			out.println("<script>alert('생년월일을 입력해 주세요');");
			out.println("history.back();</script>");
		} else if (vo.getBirth_year().length() < 4) {
			out.println("<script>alert('생년월일을 잘못 입력하셨습니다. ex. 1900/01/01');");
			out.println("history.back();</script>");
		} else {
			
			result = memberService.insertMember(vo);
			
			if(result > 0) {
				
				BufferedImage bufferimage = ImageIO.read(new File("C:/myProject/teamEx-2/booqueen/src/main/webapp/resources/user/images/default_profile.jpg")); // s3에 올릴 것
				ByteArrayOutputStream output = new ByteArrayOutputStream();
				ImageIO.write(bufferimage, "jpg", output);
				byte[] data = output.toByteArray();
				
				String imgStr = memberProfileService.encodeProfile(data);
				
				MemberProfileVO profileVO = new MemberProfileVO();
				profileVO.setUserid(vo.getUserid());
				profileVO.setProfile_data(imgStr);
				profileVO.setProfile_type("image/jpg");
				profileVO.setProfile_name("default_profile");
				profileVO.setProfile_size(102130);
				
				memberProfileService.registerProfile(profileVO);
				
				out.println("<script>alert('회원가입에 성공했습니다. 로그인하세요!')</script>");
			}
		}
		
		out.flush();
		
		return "member/index";
	}
	
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping(value="/mypageUpdate.do", method = RequestMethod.POST)
	public String mypageUpdate(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		
		int result = 0;
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberVO user = (MemberVO)session.getAttribute("member");

		if(vo.getPasswd().equals(user.getPasswd())) {
			result = memberService.updateMember(vo);
			session.setAttribute("member", vo);
			out.println("<script>alert('수정이 완료되었습니다.')</script>");
			out.flush();
		} else {
			out.println("<script>alert('비밀번호가 일치하지 않습니다.')</script>");
			out.flush();
		}
		return "member/mypage";
	}
	
	@RequestMapping(value="/deleteMember.do", method=RequestMethod.POST)
	public String deleteMember(MemberVO vo, ReasonVO rvo, HttpSession session, HttpServletResponse response) throws Exception {
		
		int result = 0;
		int result_reason = 0;
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
//		MemberVO user = (MemberVO)session.getAttribute("member");
		
		String userid = vo.getUserid();
		
		if (rvo.getReason() == null || rvo.getReason().isEmpty()) {
			out.println("<script>alert('탈퇴 사유를 선택해 주세요');");
			out.println("history.back();</script>");
			out.flush();
			return "member/mypage";
		} else {
			if (vo.getType() != null) {
				kakaoApi.kakaoDelete((String)session.getAttribute("accessToken"));
			}
			
			MemberProfileVO profile = getProfile(vo.getUserid());
			
			if (vo.getPasswd().equals(vo.getPasswd())) {
				
				memberProfileService.deleteProfile(profile);
				result = memberService.deleteMember(vo);
				result_reason = memberService.insertReason(rvo);
				
				session.setAttribute("isLogOn", false);
				
				out.println("<script>alert('회원탈퇴가 정상적으로 진행되었습니다.')</script>");
				out.flush();
				return "member/index";
			} else {
				out.println("<script>alert('비밀번호가 일치하지 않습니다.')</script>");
				out.flush();
				return "member/mypage";
			}
		}
	}
	
	@RequestMapping(value="/index.do")
	public String index() {
		return "member/index";
	}
	
	public MemberProfileVO getProfile(String userid) throws Exception {
		MemberProfileVO profile = memberProfileService.getProfileByUserid(userid);
		return profile;
	}
	
	@RequestMapping(value="/changePasswd.do", method = RequestMethod.POST)
	public String updatePasswd(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
      
		int result = 0;
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		      
		MemberVO user = (MemberVO)session.getAttribute("member");
		      
		if(vo.getNewPasswd().equals(vo.getRePasswd())) {
			if(vo.getPasswd().equals(user.getPasswd())) {
				result = memberService.changePasswd(vo);
				MemberVO newVO = memberService.getMemberByUserid(vo.getUserid());
				session.setAttribute("member", newVO);
				out.println("<script>alert('비밀번호 변경이 완료되었습니다.')</script>");
				out.flush();
			} else {
				out.println("<script>alert('비밀번호가 일치하지 않습니다.')</script>");
				out.flush();
			}
		} else {
			out.println("<script>alert('새비밀번호와 비밀번호 확인이 일치하지 않습니다.')</script>");
			out.flush();
		}
		      
		return "member/mypage";
	}
	
	@RequestMapping(value="/member/klogin.do")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, HttpServletResponse response) throws Exception {
		
		MemberVO vo = new MemberVO();
		MemberVO user = new MemberVO();
		MemberProfileVO profileVO = new MemberProfileVO();
		MemberProfileVO profile = new MemberProfileVO();
		
		String email, nickname, gender;
		
		int result = 0;
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 1번 인증코드 요청 전달
		String accessToken = kakaoApi.getAccessToken(code);
		
		// 2번 인증코드로 토큰 전달
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);
		
		System.out.println("login info : " + userInfo.toString());
		
		if (userInfo.get("email") != null) {
			
			email = (String)userInfo.get("email");
			nickname = (String)userInfo.get("nickname");
			gender = (String)userInfo.get("gender");
			
			vo.setUserid(email);
			vo.setName(nickname);
			vo.setGender(gender);
			vo.setType("kakao");
			profileVO.setUserid(email);
			
			user = memberService.selectMemberByKakao(vo);
			profile = memberProfileService.getProfile(profileVO);
			
			if (user == null) {
				result = memberService.insertMemberByKakao(vo);
				
				BufferedImage bufferimage = ImageIO.read(new File("C:/myProject/teamEx-2/booqueen/src/main/webapp/resources/user/images/default_profile.jpg")); // s3에 올릴 것
				ByteArrayOutputStream output = new ByteArrayOutputStream();
				ImageIO.write(bufferimage, "jpg", output);
				byte[] data = output.toByteArray();
				
				String imgStr = memberProfileService.encodeProfile(data);
				
				profileVO.setUserid(vo.getUserid());
				profileVO.setProfile_data(imgStr);
				profileVO.setProfile_type("image/jpg");
				profileVO.setProfile_name("default_profile");
				profileVO.setProfile_size(102130);
				
				memberProfileService.registerProfile(profileVO);
				
				out.println("<script>alert('카카오 회원가입 성공! 로그인해 주세요.')</script>");
	            out.flush();
			}
		}
		
		session.setAttribute("user_profile", profile);
		session.setAttribute("accessToken", accessToken);
		session.setAttribute("member", user);
		session.setAttribute("isLogOn", true);
		
		return "member/index";
	}
	
	
	@RequestMapping(value="klogout.do", method = RequestMethod.GET)
	public String kakaoLogout(HttpSession session) throws Exception {
		
		kakaoApi.kakaoLogout((String)session.getAttribute("accessToken"));
		session.setAttribute("isLogOn", false);
		session.removeAttribute("accessToken");
		session.removeAttribute("member");
		session.invalidate();
		
		System.out.println("klogout.do");
		
		return "member/index";
		
	}
	
}
