package com.tech.ibara.oh.dao;

import java.util.ArrayList;

import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;

public interface OHInterfaceDao {
	
	// ---------- OHPhotoView.jsp ---------- 
	public ArrayList<OHPhotoBoard> ohPhotoView();
	// ---------- OHPhotoWriteExecute ----------
	public void ohPhotoWriteExecute(String pb_title, String pb_content, 
									String pb_category, String pb_residence,
									String pb_room, String pb_style, 
									String pb_skill);
	public int getRecentPb_no();
	public void setFileUpload(int pb_no, String changeFile);
	// ---------- OHPhotoDetailView.jsp ----------
	public OHPhotoBoard getDtoOHPhotoBoard(String pb_no);
	public ArrayList<OHPhotoAttach> getDtoOHPhotoAttach(String pa_no);
	
}
