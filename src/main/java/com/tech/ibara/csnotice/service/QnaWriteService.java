package com.tech.ibara.csnotice.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;

public class QnaWriteService implements QnaServiceInter{

	private SqlSession sqlSession;
	
	public QnaWriteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model)  {
		
		System.out.println("QnaWriteService");
		Map<String, Object> map=model.asMap();
		MultipartHttpServletRequest mftrequest=(MultipartHttpServletRequest) map.get("mftrequest");
		
		String nbwriter=mftrequest.getParameter("nwriter");
		String nbtitle=mftrequest.getParameter("nbtitle");
		String nbcontent=mftrequest.getParameter("nbcontent");
		
		String path="C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\img\\csimg";
		
		List<MultipartFile> fileList=mftrequest.getFiles("nbfile");

		
		
		
		System.out.println("nbtitle :"+nbtitle);
		System.out.println("nbcontent :"+nbcontent);
		System.out.println("nbwriter :"+nbwriter);
		System.out.println("fileList :"+fileList);
		
		
//		QnaBoardIDao dao=sqlSession.getMapper(QnaBoardIDao.class);
//		dao.qnaWrite(nbtitle,nbcontent,nbwriter,nbfile);
		
	}

}
