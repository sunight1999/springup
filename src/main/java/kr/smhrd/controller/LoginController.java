package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Member;
import kr.smhrd.mapper.BoardMapper;

@Controller
//@RequestMapping("/login/*")
public class LoginController {
	
	@Autowired
	private BoardMapper boardMapper;

	@RequestMapping("/login.do")
	public String login(Member vo, HttpSession session) {
		Member m = boardMapper.login(vo);
		if(m != null) {
			// 회원인증에 성공~
			session.setAttribute("m", m); //${m.memName}
			
		}
		return "redirect:/list.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/list.do";
	}


}














