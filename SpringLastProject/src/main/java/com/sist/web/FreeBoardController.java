package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/*
 * 화면 변경 : request 전송 => forward => "경로/파일명"
 * 			request를 초기화 후 화면 변경 => redirect => .do
 */
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class FreeBoardController {
	@GetMapping("freeboard/list.do")
	public String freeboard_list() {
		return "freeboard/list";
	}
	@GetMapping("freeboard/insert.do")
	public String freeboard_insert(){
		return "freeboard/insert";
	}
	
	@GetMapping("freeboard/detail.do")
	public String freeboard_detail(int no, Model model, HttpSession session) {
		String sessionId=(String)session.getAttribute("userId");
		model.addAttribute("no", no);
		model.addAttribute("sessionId", sessionId);
		return "freeboard/detail";
	}
	
	
	@GetMapping("freeboard/update.do")
	public String freeboard_update(int no, Model model) {
		model.addAttribute("no", no);
		return "freeboard/update";
	}
}
