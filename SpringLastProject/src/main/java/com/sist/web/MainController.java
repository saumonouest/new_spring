package com.sist.web;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.NaverDAO;
import com.sist.manager.NaverNewsManager;
import com.sist.service.FoodService;
import com.sist.service.RecipeService;

import java.net.URLEncoder;
/*
 *   정리 
 *   스프링 
 *     = DI => 스프링은 클래스를 관리하는 영역 
 *                    ==========
 *                    1) 클래스 한개 : Component
 *                    2) 클래스 여러개 관리 : Container 
 *                       스프링은 컨테이너다(클래스로 제작됨 : 경량 컨테이너)
 *                     
 *       == 클래스를 관리하기 위해서는 객체생성 / 객체소멸 (객체의 생명주기 관리)
 *       == 객체생성시에 멤버변수의 초기화가 필요시에 사용 
 *       == 변수의 초기화 
 *          ========== setterDI  => p:name => setName()
 *          ========== 생성자 DI   => c:
 *     = AOP : 공통모듈 : 실행시마다 호출하는 기능이 있는 경우에 자동호출이 가능 
 *             => 사용자 정의보다는 트랜잭션 / 보안 / 로그
 *     = MVC : 웹 => 라이브러리 
 *       ===================
 *     = 라이브러리 : 있는 그대로 사용 => 사용법 / 어떤 기능 / 찾기
 *       ======== 수정하지 않고 사용 (ORM => 마이바티스)
 *     ===========================================================
 *     프레임워크 : 기본 동작을 위한 틀이 만들어져 있다 
 *               => 형식에 맞게 셋팅해서 사용
 *                  === xml / 어노테이션  
 *               1) 라이브러리 추가 : pom.xml / gradle   
 *     ============================================================
 *     MVC 
 *       Model  : => @Controller / @RestController
 *                   => 사용자의 요청받아서 처리 결과를 JSP로 전송하는 역할 
 *                                              ==== @Controller
 *                                              ==== 자바스크립트 => @RestController
 *       => 관리 : HandleMapping => 해당 메소드를 찾기                     
 *       View  : JSP (HTML) 
 *       => ViewResolver => JSP를 찾아서 request를 전송 
 *       Controller : 사용자 요청을 받는 클래스 : 이미 스프링에서 제공 
 *                    => DispatcherServlet : 메뉴얼만 제작 
 *                    => web.xml 
 *       WebApplicationContext : 사용자 정의 클래스를 관리 
 *                => 클래스를 등록
 *                   application-context.xml
 *                   application-datasource.xml
 *                   application-security.xml 
 *                => 넘겨주는 방법 
 *                   <init-param>
						<param-name>contextConfigLocation</param-name>
						<param-value>/WEB-INF/config/application-*.xml</param-value>
					</init-param>  
					                        요청처리하는 메소드 찾기
					                            => @GetMapping(URI)
					                            => @PostMapping(URI)
					                            => @RequestMapping(URI)
	     사용자 요청  ==> DispatcherServlet => HandleMapping => Model처리
	                                                            | request
	                                                       ViewResolver 
	                                                         = p:prefix => 경로명
	                                                         = p:suffix => 확장자
	                                                            | request
	                                                           JSP 
	       .do
	       
	       요청에 대한 처리 
	       =============
	        1) 데이터베이스 (마이바티스)  =====> DAO / Service
	                                    테이블 1개  관련된 DAO여러개를 묶어서 처리
	        2) 외부 API (날씨,뉴스 , 메일)
	        3) 전송 
	           redirect : 기존에 있는 메소드를 재호출   _ok (DML=>insert/update/delete)
	            => return "redirect:list.do"
	           forward : 해당 데이터 전송 (select)
	            => return "경로/파일명"
	       화면 출력 
	       ========
	        1) JSP => EL/JSTL 
	        2) 자바스크립트 : Ajax / VueJS / ReactJS
	           | 
	           List => []
	           VO   => {}
	           ============ JSON (jackson) => spring-boot에서는 자동 처리
	           일반데이터형 : 정수/실수/논리/문자
	           
	       => 기본동작 
	       => 설정 : xml파일 
	       => Model / DAO / Service / JSP
	       => 기본 이론 : 면접 ==> 실무는 구현 
 *     
 */
// jsp연동 
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.sist.vo.*;
@Controller

public class MainController {
   // 필요한 클래스 => 스프링에서 가지고 온다 (객체 주소)
   @Autowired
   private RecipeService rService;
   @Autowired
   private FoodService fService;
   
   @Autowired
   private NaverNewsManager mgr;
   
   @Autowired
   private NaverDAO nDao;
   // 사용자에 요청 따라 => 처리 
   @GetMapping("main/main.do")
   public String main_main(String fd,Model model)
   {
	   if(fd==null)
		   fd="맛집";
	   
	   List<NewsVO> nList=mgr.newsFind(fd);
	   RecipeVO rvo=rService.recipeMaxHitData();
	   List<RecipeVO> rList=rService.recipeHitTop8();
	   List<FoodVO> fList=fService.foodHitTop5();
	   ChefVO cvo=rService.chefToday();
	   model.addAttribute("cvo", cvo);
	   model.addAttribute("rvo", rvo);
	   model.addAttribute("rList", rList);
	   model.addAttribute("fList", fList);
	   model.addAttribute("nList", nList);
	   
	   /*String data=nDao.naverSelectData();
	   String key=youtubeGetKey(data);
	   System.out.println(key);
	   model.addAttribute("key", key);*/
	   return "main";
   }
   @GetMapping("chat/chat.do")
   public String chat_chat()
   {
	   return "site/chat/chat";
   }
   public String youtubeGetKey(String word)
   {
	   String key="";
	   try
	   {
		   Document doc=Jsoup.connect("https://www.youtube.com/results?search_query="+
	                                  URLEncoder.encode(word,"UTF-8")).get();
		   Pattern p=Pattern.compile("/watch\\?v=[^가-힣]+");
		   Matcher m=p.matcher(doc.toString());
		   while(m.find())
		   {
			   String s=m.group();
			   System.out.println(s);
			   key=s.substring(s.indexOf("=")+1,s.indexOf("\""));
			   break;
		   }
		   
	   }catch(Exception ex){}
	   return key;
   }
}