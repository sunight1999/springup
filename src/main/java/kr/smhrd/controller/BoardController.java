package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.RedirectAttributesMethodArgumentResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Criteria;
import kr.smhrd.entity.PageMaker;
import kr.smhrd.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;

@Controller // 역할이름(어노테이션)
@RequiredArgsConstructor
public class BoardController { // new BoardController()
	
	//@Autowired // DI(의존성주입)
	private final BoardMapper boardMapper;
//	public BoardController(BoardMapper boardMapper) {
//		this.boardMapper=boardMapper;
//	} 이걸 만들 필요없음  위에 @RequiredArgsConstructor 이거 쓰면 됨
	// final 넣어줘야함    final : 한번세팅하면 수정 못함 
	

	@RequestMapping("/list.do")
	public String list(@ModelAttribute("cri") Criteria cri,Model model) { // 컨트롤러에서 메서드이름은 내맘대로 ex)list()
		List<Board> list = boardMapper.getList(cri);
		
		// 페이징처리에 필요한 객체 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardMapper.totalCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		
		
		// 객체바인딩(View로 전달할 객체를 특정메모리에 연결시키는 기술)
		model.addAttribute("list", list);
		return "board/list"; // (forward) --> ViewResolver /WEB-INF/views/board/list.jsp
	}       
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register() {
		return "board/register";
	}
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register(Board vo) { // request.getparameter("title"), content, writer 이걸 받아야함
		boardMapper.register(vo); //등록성공
		// 등록성공후에는 -> 다시 리스트페이지로(list.do)이동 : redirect 
		return "redirect:/list.do";
	}
	@GetMapping("/get.do")  //  5
	public String get(int idx,@ModelAttribute("cri") Criteria cri, Model model) {
		Board vo = boardMapper.get(idx);
		// 조회수 누적
		boardMapper.countUpdate(idx);
		model.addAttribute("vo", vo);
		//model.addAttribute("cri",cri);
		return "board/get";
	}
	@GetMapping("/remove.do")
	public String remove(int idx,Criteria cri,RedirectAttributes rttr) {
		boardMapper.remove(idx);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/list.do";
	}
	@GetMapping("/modify.do")
	public String modify(int idx, Model model,@ModelAttribute("cri") Criteria cri) {
		Board vo = boardMapper.get(idx);
		model.addAttribute("vo", vo);
		
		return "board/modify"; // modify.jsp
	}
	@PostMapping("/modify.do")
	public  String modify(Board vo, Criteria cri, RedirectAttributes rttr) {
		boardMapper.modify(vo);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());

		return "redirect:/list.do";
	}
	
	 @GetMapping("/reply.do")
	 public String reply(int idx, Model model, @ModelAttribute("cri") Criteria cri) {
	     Board vo=boardMapper.get(idx);
	     model.addAttribute("vo",vo);
	     return "board/reply";
	 }
	
	
	
	@PostMapping("/reply.do")
	public String reply(Board vo,Criteria cri,RedirectAttributes rttr) {
		//1.부모글의 정보를 가져오기
		Board parent = boardMapper.get(vo.getIdx());
		//2.답글의 Broup을 저장
		vo.setBoardGroup(parent.getBoardGroup());
		//3.답글의 bSEQ+1저장
		vo.setBoardSequence(parent.getBoardSequence()+1);
		//4.답글의 blevel+1 저장
		vo.setBoardLevel(parent.getBoardLevel()+1);
		//5.같은 그룹의 게시글중에서 부모의 bseq보다 큰 값들을 모두 1씩 증가
		boardMapper.replySeqUpdate(parent);
		
		boardMapper.replyInsert(vo);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/list.do";

	}
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public String test1() {
		return "board/main";
	}

	
	
	
}
