//package com.tech.ibara.modal.dao.mapper;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.tech.ibara.modal.dto.ModalBoardDto;
//
//public class ModalBoardDao {
//	@Autowired
//    private SqlSession sqlSession;
//
//    public ModalBoardDto selectModalBoardByEmailAndPw(String email, String pw) {
//        Map<String, Object> paramMap = new HashMap<>();
//        paramMap.put("email", email);
//        paramMap.put("pw", pw);
//        return sqlSession.selectOne("modalBoard.selectModalBoardByEmailAndPw", paramMap);
//    }
//}
