package app.controller.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.accountRepository;

@Controller
public class MemberController {
	
	@Autowired
	accountRepository ar;
	
	@Autowired
	Gson gson;
	
	@GetMapping("/login.do")
	public ModelAndView getloginHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}//end getloginHandle
	
	@GetMapping("/signup.do")
	public ModelAndView getsignupHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signup");
		mav.addObject("main", "/WEB-INF/views/signup/main.jsp");	
		return mav;
	}// end getsignupHandle
	
	@PostMapping("/signup.do")
	public ModelAndView postsignupHandle(@RequestParam Map param) {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("signup");
		mav.addObject("main", "/WEB-INF/views/signup/main.jsp");
		return mav;
	}//end postsignupHandle
	
	@GetMapping(path="/idcheck.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String requsetIdCheckHandle(@RequestParam Map param) {
		System.out.println("param>>"+param);
		String mode = (String)param.get("mode");
		
		switch (mode) {
		case "checkid":
			String id=(String)param.get("id");
			System.out.println("id >"+id);
			if (ar.checkId(id)==null) {
				return gson.toJson(true);
			}else {
				return gson.toJson(false);
			}		
		}
	return "";
	
	}
}
