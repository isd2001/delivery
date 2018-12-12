package app.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@GetMapping("/index.do")
	public ModelAndView indexHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("main", "/WEB-INF/views/index/main.jsp");
		return mav;
	}
	
}
