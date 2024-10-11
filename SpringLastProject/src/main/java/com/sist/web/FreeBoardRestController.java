package com.sist.web;
// 화면 변경 => FreeBoardController
// 데이터 관리 (사용자 요청 / 서버 응답) => Front와 매칭 (FreeBoardRestController)
// FreeBoardRestController는 화면 변경이 불가능 : 데이터만 처리

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;

@RestController
public class FreeBoardRestController {
	@Autowired
	private FreeBoardService fService;
	
	@GetMapping(value = "freeboard/list_vue.do", produces = "text/plain;charset=UTF-8")
	// => text/plain(JSON),  text/html, text/xml
	public String freeboard_list(int page)throws Exception {
		int rowSize=20;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		
		List<FreeBoardVO> list = fService.freeboardListData(start, end);
		int count=fService.freeboardRowCount();
		int totalpage=(int)(Math.ceil(count/(double)rowSize));
		count=count-((page*rowSize)-rowSize);
		
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("count", count);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("today", today);
		
		
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		
		return json; // 위 데이터를 전부 json으로 묶어준 거임 한 번에 넘어가게
	}
	
	@PostMapping(value = "freeboard/insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String freeboard_insert(FreeBoardVO vo, HttpSession session) {
		String result="";
		// id, name => HttpSession을 이용한다
		String id=(String)session.getAttribute("userId");
		String name=(String)session.getAttribute("userName");
		try {
			vo.setId(id);
			vo.setName(name);
			
			fService.freeboardInsert(vo);
			
			result="yes";
		}catch(Exception ex) {
			result=ex.getMessage();
		}
		return result;
	}
	
	// 상세보기
	@GetMapping(value = "freeboard/detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String freeboard_detail(int no) throws Exception	{
		// 조회수 증가
		
		// 데이터 전송
		FreeBoardVO vo = fService.freeboardDetailData(no);
		
		// JSON 변경
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		// 전송
		return json;
	}
	
	@GetMapping(value = "freeboard/delete_vue.do", produces = "text/plain;charset=UTF-8")
	public String freeboard_delete(int no) throws Exception	{
		String result="";
		try {
			// DB 연동
			result="yes";
		}catch(Exception ex) {
			result=ex.getMessage();
		}
		return result;
	}
	
	
	 @GetMapping(value = "freeboard/update_vue.do",produces = "text/plain;charset=UTF-8")
	   public String freeboard_update(int no) throws Exception
	   {
		   FreeBoardVO vo=fService.freeboardUpdateData(no);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
	   @PostMapping(value="freeboard/update_ok_vue.do",produces = "text/plain;charset=UTF-8")
	   public String freeboard_update_ok(FreeBoardVO vo)
	   {
		   String result="";
		   try
		   {
			   
			   fService.freeboardUpdate(vo);
			   result="yes";
		   }catch(Exception ex)
		   {
			   result=ex.getMessage();   
		   }
		   return result;
	   }
}





















































