package com.tech.ibara.oh.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;

@Controller
public class OHController {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ---------- OHMainView.jsp ---------- 
	@RequestMapping("oh/OHMainView")
	public String OHMainView(Model model) {
		// Console 출력
		System.out.println("OHMainView Controller");
		return "oh/OHMainView";
	}
	// ---------- OHPhotoView.jsp ---------- 
	@RequestMapping("oh/OHPhotoView")
	public String OHPhotoView(Model model) {
		// Console 출력
		System.out.println("OHPhotoView Controller");
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		// ohPhotoView() 함수 실행
		ArrayList<OHPhotoBoard> dtoList = dao.ohPhotoView();
		// model 값 전달
		model.addAttribute("ohPhotoView", dtoList);
		return "oh/OHPhotoView";
	}
	// ---------- OHPhotoWriteView.jsp ---------- 
	@RequestMapping("oh/OHPhotoWriteView")
	public String OHPhotoWriteView(Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteView Controller");
		return "oh/OHPhotoWriteView";
	}
	// ---------- OHPhotoWriteExecute ---------- 
	@RequestMapping("oh/OHPhotoWriteExecute")
	public String OHPhotoWriteExecute(MultipartHttpServletRequest mftRequest, Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteExecute Controller");
		// 변수 선언, 값 저장
		String pb_title = mftRequest.getParameter("pb_title");
		String pb_content = mftRequest.getParameter("pb_content");
		String pb_category = mftRequest.getParameter("pb_category");
		String pb_residence = mftRequest.getParameter("pb_residence");
		String pb_room = mftRequest.getParameter("pb_room");
		String pb_style = mftRequest.getParameter("pb_style");
		String pb_skill = mftRequest.getParameter("pb_skill");		
		// 변수 값 출력
		System.out.println("pb_title: " + pb_title);
		System.out.println("pb_content: " + pb_content);
		System.out.println("pb_category: " + pb_category);
		System.out.println("pb_residence: " + pb_residence);
		System.out.println("pb_room: " + pb_room);
		System.out.println("pb_style: " + pb_style);
		System.out.println("pb_skill: " + pb_skill);
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		// ohPhotoWriteExecute() 함수 실행
		dao.ohPhotoWriteExecute(pb_title, pb_content, pb_category,
								pb_residence, pb_room, pb_style, pb_skill);
		// getRecentPb_no() 함수 실행 -> 가장 최근 작성된 게시글 번호 
		int pb_no = dao.getRecentPb_no();
		System.out.println("가장 최근 작성된 게시글 번호: " + pb_no);
		// 업로드 파일 - 저장할 폴더 경로, path 변수에 저장
		// 스프링 STS - upload 폴더 경로
		// 글쓰기 후 이미지가 바로 출력되지 않는 문제가 있다.
		String path = "C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\upload\\oh";
		// 톰캣 server - upload 폴더 경로
		// String path = "C:\\23setspring\\springwork23\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\interiorbara\\resources\\upload\\oh";		
		// 업로드 파일, List 저장
		List<MultipartFile> pa_attachList = mftRequest.getFiles("pa_attach");
		// 파일 저장
		for(MultipartFile mf : pa_attachList) {
			// 원본 파일명
			String originFile = mf.getOriginalFilename();
			System.out.println("원본 파일명: " + originFile);
			// 수정 파일명
			long longtime = System.currentTimeMillis();
			String changeFile = longtime + "_" + mf.getOriginalFilename();
			System.out.println("수정 파일명: " + changeFile);
			// 경로 변수 + 수정 파일명
			String pathfile = path + "\\" + changeFile;
			try {
				if(!originFile.equals("")) {
					mf.transferTo(new File(pathfile));
					System.out.println("다중 파일 업로드 성공");
					// setFileUpload() 함수 실행 -> DB에 파일명 INSERT
					dao.setFileUpload(pb_no, changeFile);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return "redirect:OHPhotoView";
	}
	// ---------- OHPhotoDetailView.jsp ---------- 
	@RequestMapping("oh/OHPhotoDetailView")
	public String OHPhotoDetailView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoDetailView Controller");
		// 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);		
		// getDtoOHPhotoBoard() 함수 실행
		OHPhotoBoard pb_dto = dao.getDtoOHPhotoBoard(pb_no);
		// model 값 전달
		model.addAttribute("pb_dto", pb_dto);
		// getDtoOHPhotoBoard() 함수 실행
		ArrayList<OHPhotoAttach> pa_dto = dao.getDtoOHPhotoAttach(pb_no);
		// model 값 전달
		model.addAttribute("pa_dto", pa_dto);
		return "oh/OHPhotoDetailView";
	}
	// ---------- OHPhotoEditView.jsp ----------
	@RequestMapping("oh/OHPhotoEditView")
	public String OHPhotoEditView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoEditView Controller");
		
		// 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		
		// getDtoOHPhotoBoard() 함수 실행
		OHPhotoBoard pb_dto = dao.getDtoOHPhotoBoard(pb_no);
		// model 값 전달
		model.addAttribute("pb_dto", pb_dto);
		// getDtoOHPhotoBoard() 함수 실행

		// model 값 전달

		return "oh/OHPhotoEditView";
	}	
}
