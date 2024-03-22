package com.tech.ibara.csnotice.dao;

import java.util.ArrayList;

import com.tech.ibara.csnotice.dto.QnaDto;

public interface QnaBoardIDao {

	public ArrayList<QnaDto> Qnalist(int rowStart, int rowEnd, String searchKeyword, String string);

	public QnaDto qnacontentView(String nbno);

	public void qnauphit(String nbno);

	public void qnaEdit(String nbno, String nbtitle, String nbcontent);

	public void qnaDelete(String nbno);

	public void qnaWrite(String nbtitle, String nbcontent, String nbwriter, String nbfile);

	public int selectBoardTotalCount1(String searchKeyword);

	public int selectBoardTotalCount2(String searchKeyword);

	public int selectBoardTotalCount3(String searchKeyword);

	public int selectBoardTotalCount4(String searchKeyword);
	
	
}
