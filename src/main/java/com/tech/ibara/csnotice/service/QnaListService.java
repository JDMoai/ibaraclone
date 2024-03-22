package com.tech.ibara.csnotice.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.vo.SearchVO;

public class QnaListService implements QnaServiceInter{

	private SqlSession sqlSession;
	
	public QnaListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		QnaBoardIDao dao=sqlSession.getMapper(QnaBoardIDao.class);
		SearchVO searchVO= (SearchVO) map.get("searchVO");
		
		String nbtitle="";
		String nbcontent="";
		
		String[] brdtitle=request.getParameterValues("searchType");
		System.out.println("brdtitle : "+brdtitle);
		
		if (brdtitle!=null) {   //치크박스 아무것도 체크 안 하면 null 포인트 발생 그거 방지하는 if문
			for (String str : brdtitle) {
				System.out.println(str);
			}
		}

		if (brdtitle!=null) {   //위 변수의 체크상태 저장
			for (String var : brdtitle) {
				if (var.equals("nbtitle")) {
					nbtitle="nbtitle";
					model.addAttribute("nbtitle","true");
				}else if (var.equals("nbcontent")) {
					nbcontent="nbcontent";
					model.addAttribute("nbcontent","true");
				}
			}
		}
		
		//검색 결과 유지
		String bt=request.getParameter("nbtitle");
		String bc=request.getParameter("nbcontent");
		if (bt!=null) {
			if (bt.equals("nbtitle")) {
				nbtitle=bt;
				model.addAttribute("nbtitle","true");
			}
		}
		if (bc!=null) {
			if (bc.equals("nbcontent")) {
				nbcontent=bc;
				model.addAttribute("nbcontent","true");
			}
		}
		
		
		
		//sk값 가져오기
		String searchKeyword=request.getParameter("sk");
		if (searchKeyword==null) { //검색문자 null처리
			searchKeyword="";
		}
		model.addAttribute("searchKeyword",searchKeyword);
		System.out.println("searchKeyword : "+searchKeyword); //searchKeyword 확인하는 출력문
		
		
//		페이징
		String strPage=request.getParameter("page");
		//null처리
		if (strPage==null) {
			strPage="1";
		}
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		//토탈 글 갯수 
		//검색에 적용
		
		int total=0;
		if (nbtitle.equals("btitle") && nbcontent.equals("")) { //제목만 검색
			total=dao.selectBoardTotalCount1(searchKeyword);
		}else if (nbtitle.equals("") && nbcontent.equals("bcontent")) { //내용만 검색
			total=dao.selectBoardTotalCount2(searchKeyword);
		}else if (nbtitle.equals("btitle") && nbcontent.equals("bcontent")) { //둘 다 검색
			total=dao.selectBoardTotalCount3(searchKeyword);
		}else if (nbtitle.equals("") && nbcontent.equals("")) { //아무것도 체크 안 함
			total=dao.selectBoardTotalCount4(searchKeyword);
		}
		
		System.out.println("total : "+total);
		
//		total count 찍히게
		
		searchVO.pageCalculate(total);
		
		//계산된 값
		System.out.println("total"+total);
		System.out.println("clickpage"+strPage);
		System.out.println("pagestart"+searchVO.getPageStart());
		System.out.println("pageend"+searchVO.getPageEnd());
		System.out.println("rowstart"+searchVO.getRowStart());
		System.out.println("rowend"+searchVO.getRowEnd());
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		
		ArrayList<QnaDto> list = null;
		if (nbtitle.equals("btitle") && nbcontent.equals("")) { //제목만 검색
//			list = dao.list(rowStart,rowEnd,searchKeyword,"1");
			model.addAttribute("list",dao.Qnalist(rowStart,rowEnd,searchKeyword,"1"));
		}else if (nbtitle.equals("") && nbcontent.equals("bcontent")) { //내용만 검색
//			list = dao.list(rowStart,rowEnd,searchKeyword,"2");
			model.addAttribute("list",dao.Qnalist(rowStart,rowEnd,searchKeyword,"2"));
		}else if (nbtitle.equals("btitle") && nbcontent.equals("bcontent")) { //둘 다 검색
//			list = dao.list(rowStart,rowEnd,searchKeyword,"3");
			model.addAttribute("list",dao.Qnalist(rowStart,rowEnd,searchKeyword,"3"));
		}else if (nbtitle.equals("") && nbcontent.equals("")) { //아무것도 체크 안 함
			list = dao.Qnalist(rowStart,rowEnd,searchKeyword,"4");
			model.addAttribute("list",dao.Qnalist(rowStart,rowEnd,searchKeyword,"4"));
		}	
				
		
		System.out.println(list);
		model.addAttribute("totalRowcnt",total);
		model.addAttribute("searchVo",searchVO);
		
	}

}
