package com.tech.ibara.csnotice.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;

public class QnaEditService implements QnaServiceInter{

	private SqlSession sqlSession;
	
	public QnaEditService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		System.out.println("qnaEditService");
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		QnaBoardIDao dao=sqlSession.getMapper(QnaBoardIDao.class);
		
		String nbno=request.getParameter("nbno");
		String nbtitle=request.getParameter("nbtitle");
		String nbcontent=request.getParameter("nbcontent");

		System.out.println(nbno);
		
		dao.qnaEdit(nbno,nbtitle,nbcontent);
		
	}

}
