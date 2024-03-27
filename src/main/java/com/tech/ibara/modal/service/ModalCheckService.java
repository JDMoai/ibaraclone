package com.tech.ibara.modal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.modal.dao.mapper.ModalDao;
import com.tech.ibara.modal.dto.ModalCheckDto;

@Service
public class ModalCheckService implements ModalService{
			
private SqlSession sqlSession;
	
	public ModalCheckService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
    public void execute(Model model) {
		System.out.println("ModalCheckService.execute()");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		ModalDao dao = sqlSession.getMapper(ModalDao.class);

		String type = request.getParameter("type");
        
        List<ModalCheckDto> serviceItems = dao.selectServiceItems(type);
        model.addAttribute("serviceItems", serviceItems);
        
        
    }
}
