package com.tech.ibara.modal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.ModalCompleteDto;
import com.tech.ibara.modal.dto.NonMemberDto;
import com.tech.ibara.modal.service.ModalService;

@Controller
public class ModalController {
	
	
	private ModalService modalService;
	
	
	
	@RequestMapping("/modal/mMain")
	public String mMain(Model model) {

		return "/modal/mMain";
	}

	@RequestMapping("/modal/mSize")
	public String mSize(Model model) {

		return "/modal/mSize";
	}

	@RequestMapping("/modal/mServiceCheck")
    public String mServiceCheck(HttpServletRequest request, Model model) {
	
   
        return "/modal/mServiceCheck";
    }
	@RequestMapping("/modal/mAsk")
	public String mAsk(HttpServletRequest request, Model model) {
		
		
		return "/modal/mAsk";
	}
	@RequestMapping("/modal/mInfo")
	public String mInfo(HttpServletRequest request, Model model) {
		
		
		return "/modal/mInfo";
	}
	
	@Autowired
    public ModalController(ModalService modalService) {
        this.modalService = modalService;
    }

	@GetMapping("/modal/getServiceItems")
	@ResponseBody
	public List<ModalCheckDto> getServiceItems(@RequestParam("m_type") String m_type) {
		System.out.println("getServiceItems");
	    return modalService.getServiceItems(m_type);
	}
	@PostMapping("/modal/insertNonMember")
	@ResponseBody
	public void insertNonMember(NonMemberDto nonMemberDto) {
		
		System.out.println("insertNonMember컨트롤러");
		
	    modalService.insertNonMember(nonMemberDto);

	    
	    
	    // 리다이렉트 또는 다른 처리 로직 추가
	}
	@PostMapping("/modal/updateModalComplete")
	@ResponseBody
	public void updateModalComplete(@RequestBody ModalCompleteDto modalCompleteDto) {
	    System.out.println("updateModalComplete컨트롤러");
	    
	   // System.out.println("컨트롤러m_addr: " + modalCompleteDto.getM_addr());
	   // System.out.println("컨트롤러m_tel: " + modalCompleteDto.getM_tel());
	    try {
	        modalService.updateModalComplete(modalCompleteDto);
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("modalCompleteDto컨트롤러 오류");
	    }
	}
	
	@RequestMapping("/modal/mComplete")
	public String mComplete(Model model, HttpSession session) {
	    // 세션에서 estino 값을 가져옵니다.
	    String estino = (String) session.getAttribute("estino");
	    
	    // estino를 사용하여 modal_complete 테이블에서 데이터를 조회합니다.
	    ModalCompleteDto modalCompleteDto = modalService.getModalCompleteByEstino(estino);
	    
	    // name, email, phone 정보를 조회하기 위해 modalCompleteDto에서 m_tel 값을 가져옵니다.
	    String mTel = modalCompleteDto.getM_tel();
	    
	    // m_tel을 사용하여 my_nonmember 테이블에서 데이터를 조회합니다.
	    NonMemberDto nonMemberDto = modalService.getNonMemberByPhone(mTel);
	    
	    // 조회한 데이터를 모델에 추가합니다.
	    model.addAttribute("modalComplete", modalCompleteDto);
	    model.addAttribute("nonMember", nonMemberDto);
	    
	    return "/modal/mComplete";
	}
	
}
