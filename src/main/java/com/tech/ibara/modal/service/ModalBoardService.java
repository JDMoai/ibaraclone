//package com.tech.ibara.modal.service;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.ui.Model;
//
//import com.tech.ibara.modal.dao.mapper.ModalDao;
//import com.tech.ibara.modal.dto.CompleteInfoDto;
//import com.tech.ibara.modal.dto.ModalBoardDto;
//import com.tech.ibara.modal.dto.ModalCheckDto;
//import com.tech.ibara.modal.dto.ModalCompleteDto;
//import com.tech.ibara.modal.dto.NonMemberDto;
//
//public class ModalBoardService implements ModalBoardInter{
//	
//	private SqlSession sqlSession;
//	public ModalBoardService(SqlSession sqlSession) {
//		this.sqlSession=sqlSession;
//	}
//	
//	
//	@Override
//	public String execute(Model model) {
//		System.out.println("ModalBoardService()");
//		Map<String, Object> map = model.asMap();
//		HttpServletRequest request= (HttpServletRequest) map.get("request");
//		String email=request.getParameter("email");
//		String pw=request.getParameter("pw");
//		ModalDao dao=sqlSession.getMapper(ModalDao.class);
//		ModalBoardDto dto=dao.getModalBoard(email);
//		model.addAttribute("dto",dto);
//		return email;
//				
//		
//		
//	}
//}
//
//
//	
