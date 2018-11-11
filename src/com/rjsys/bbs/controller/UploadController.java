package com.rjsys.bbs.controller;

import com.rjsys.bbs.service.UserService;
import com.rjsys.bbs.vo.UserVo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;


@Controller
public class UploadController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/upload/uploadImage.action", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
		
		//保存图片到F盘photo
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		
		String path = "F:\\rjxh\\photo\\" + name + "." + ext;
		
		file.transferTo(new File(path));
		
		String imagePath = request.getContextPath() + "/photo/" + name + "." + ext;
		
		UserVo user = (UserVo) request.getSession().getAttribute("user");
		
		user.setImage(imagePath);
		
		UserVo vo = userService.updateImage(user);
		
		request.getSession().setAttribute("user", vo);
		
		String str = "{\"data\": {\"src\":\"" + imagePath + "\"}}";
		
		return str;
	}
	
}
