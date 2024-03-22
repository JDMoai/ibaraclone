package com.tech.ibara.csnotice;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.ibara.csnotice.service.QnaListService;
import com.tech.ibara.csnotice.service.QnaServiceInter;


@Controller
public class CsNoticeController {
	
	//서비스 선언
	QnaServiceInter qnaServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/noticelist")
	public String noticelist() {
		
		return "csnotice/noticelist";
	}
	
}
