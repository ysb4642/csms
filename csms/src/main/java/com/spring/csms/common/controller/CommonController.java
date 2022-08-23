package com.spring.csms.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.goods.service.GoodsService;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class CommonController {
	
//	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
//	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = "/",  method = RequestMethod.GET)
	public ModelAndView index() throws Exception{
		Map<String, String> goodsListMap = new HashedMap<>();
		goodsListMap.put("sort", "all");
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		return mv;
	}
	
	
	private static final String CURR_IMAGE_REPO_PATH = "/Users/ysb/file_repo";
	private static final String SEPERATOR = "/";	// mac
	
//	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
//	private static final String SEPERATOR = "\\";	// window

//	private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat8/file_repo";
//	private static final String SEPERATOR = "/";		// linux
	
	@RequestMapping(value = "/thumbnails", method = RequestMethod.GET)
	public void thumbnails(@RequestParam("goodsFileName") String goodsFileName, HttpServletResponse response) throws IOException {
			
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + SEPERATOR + goodsFileName;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
}


















