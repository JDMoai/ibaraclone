package com.tech.ibara.csnotice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.service.QnaContentService;
import com.tech.ibara.csnotice.service.QnaDeleteService;
import com.tech.ibara.csnotice.service.QnaEditService;
import com.tech.ibara.csnotice.service.QnaListService;
import com.tech.ibara.csnotice.service.QnaServiceInter;
import com.tech.ibara.csnotice.service.QnaWriteService;
import com.tech.ibara.csnotice.vo.SearchVO;


@Controller
public class CsQnaController {
	
	//서비스 선언
	QnaServiceInter qnaServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	//리스트 컨트롤러 
	@RequestMapping("/qnalist") 
	public String qnalist(HttpServletRequest request,SearchVO searchVO,Model model) {
		System.out.println("qnaList()controller");	
		
		model.addAttribute("request",request);
		model.addAttribute("searchVo",searchVO);
		
		qnaServiceInter=new QnaListService(sqlSession);
		qnaServiceInter.execute(model);
		
		return "csnotice/qnalist";
	}
	
	@RequestMapping("/qnawriteview")
	public String qnawriteview() {
		
		return "csnotice/qnawriteview";
	}

	@RequestMapping("/qnawrite")
	public String qnawrite(MultipartHttpServletRequest mftrequest, Model model){
		System.out.println("qnawrite()controller");
		
		model.addAttribute("mftrequest",mftrequest);
		qnaServiceInter=new QnaWriteService(sqlSession);
		qnaServiceInter.execute(model);
		
		return "redirect:qnalist";
	}

	//리스트 컨트롤러 
	@RequestMapping("/qnacontent") 
	public String qnacontent(HttpServletRequest request,Model model) {
		System.out.println("qnacontent()controller");	
		
		model.addAttribute("request",request);

		qnaServiceInter=new QnaContentService(sqlSession);
		qnaServiceInter.execute(model);
		
		return "csnotice/qnacontent";
	}

	//게시판 글 수정 폼 컨트롤러
	@RequestMapping("/qnaeditview") 
	public String qnaeditview(HttpServletRequest request,Model model) {
		System.out.println("qnaeditview()controller");	
		
		model.addAttribute("request",request);
		
		qnaServiceInter=new QnaContentService(sqlSession);
		qnaServiceInter.execute(model);
		
		return "csnotice/qnaeditview";
	}

	//게시판 글 수정 컨트롤러
	@RequestMapping(method = RequestMethod.POST,value = "/qnaeditproc") 
	public String qnaeditproc(HttpServletRequest request,Model model) {
		System.out.println("qnaeditproc()controller");	
		
		model.addAttribute("request",request);
		
		qnaServiceInter=new QnaEditService(sqlSession);
		qnaServiceInter.execute(model);
		
		return "redirect:qnalist";
	}
	
	//게시판 글 수정 폼 컨트롤러
	@RequestMapping("/qnadelete") 
	public String qnadelete(HttpServletRequest request,Model model) {
		System.out.println("qnadelete()controller");	
		
		model.addAttribute("request",request);
		
		qnaServiceInter=new QnaDeleteService(sqlSession);
		qnaServiceInter.execute(model);
		
		return "redirect:qnalist";
	}
}
