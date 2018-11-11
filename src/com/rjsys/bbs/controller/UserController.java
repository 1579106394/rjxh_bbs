package com.rjsys.bbs.controller;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.Comment;
import com.rjsys.bbs.pojo.Notice;
import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.service.CartService;
import com.rjsys.bbs.service.CommentService;
import com.rjsys.bbs.service.NoticeService;
import com.rjsys.bbs.service.UserService;
import com.rjsys.bbs.utils.PageBean;
import com.rjsys.bbs.vo.CartVo;
import com.rjsys.bbs.vo.CommentVo;
import com.rjsys.bbs.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.*;

//用户相关Controller
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/user/updateBase.html")
	public String updateBase(UserVo user, HttpSession session) {
		
		UserVo u = userService.updateBase(user);
		
		session.setAttribute("user", u);
		
		return "redirect:/base.html";
		
	}
	
	@RequestMapping("/user/updatePass.html")
	public String updatePass(UserVo user, HttpSession session) {
		
		UserVo u = userService.updateBase(user);
		
		session.removeAttribute("user");
		
		return "redirect:/login.jsp";
		
	}
	
	//查找我的帖子
	@RequestMapping("/user/getMyCartList.action")
	@ResponseBody
	public List<Cart> getMyCartList(@RequestBody User user) {
		
		List<Cart> cartList = cartService.getMyCartList(user);
		
		return cartList;
	}
	
	//删除我的帖子
	@RequestMapping("/user/delete{id}.html")
	public String deleteMyCart(@PathVariable Long id) {
		
		
		cartService.deleteMyCart(id);
		
		return "redirect:/mycart.html";
	}
	

	//删除我的回复
	@RequestMapping("/user/deleteHuifu{id}.html")
	public String deleteHuifu(@PathVariable Long id) {


		cartService.deleteHuifu(id);

		return "redirect:/myhuifu.html";
	}

	//ajax加载我的收藏
	@RequestMapping("/user/getMyShoucangList.action")
	@ResponseBody
	public List<CartVo> getMyShoucangList(@RequestBody User user) {
		
		List<CartVo> list = cartService.getShoucangList(user);
		
		return list;
	}
	
	//取消收藏
	@RequestMapping("/user{userId}/deleteShoucang{id}.html")
	public String deleteMyShoucang(@PathVariable Long id, @PathVariable Long userId) {
		
		
		cartService.deleteShoucang(id, userId);
		
		return "redirect:/mycart.html#collection";
	}
	
	//我的消息
	@RequestMapping("/myinfo.html")
	public String myInfo(Model model, 
			@RequestParam(defaultValue = "1")Integer currentPage,
			HttpSession session) {
		//查找指定的通知
		//添加分页
		//当前页为1
		//每页显示5条
		User user = (User) session.getAttribute("user");
		Integer currentCount = 5;
		PageBean<Notice> pageBean = noticeService.getNoticeList(currentPage, currentCount, user.getId());
		Integer end = pageBean.getTotalPage();
		if(end > 10) {
			end = pageBean.getCurrentPage() + 9;
		}
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("end", end);
		
		return "myinfo";
	}


    //跳转到通知管理
    @RequestMapping("/info.html")
    public String info(Model model,
                       @RequestParam(defaultValue = "1")Integer currentPage,
                       HttpSession session) {
        //查找指定的通知
        //添加分页
        //当前页为1
        //每页显示5条
        User user = (User) session.getAttribute("user");
        Integer currentCount = 5;
        PageBean<Notice> pageBean = noticeService.getNoticeList(currentPage, currentCount, user.getId());
        Integer end = pageBean.getTotalPage();
        if(end > 10) {
            end = pageBean.getCurrentPage() + 9;
        }
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("end", end);

        return "info";
    }


    //已读通知
	@RequestMapping("/user/alreadyReadNotice{noticeId}.html")
	public String readed(@PathVariable Long noticeId) {
		
		noticeService.alreadyReadNotice(noticeId);
		
		return "redirect:/myinfo.html";
	}
	
	//删除通知
	@RequestMapping("/user/deleteNotice{noticeId}.html")
	public String deleteNotice(@PathVariable Long noticeId) {
		
		noticeService.deleteNotice(noticeId);
		
		return "redirect:/myinfo.html";
	}
	
	
	//ajax加载我的回复
	@RequestMapping("/user/getMyHuifuList.action")
	@ResponseBody
	public List<CommentVo> getMyHuifuList(@RequestBody User u) {

        Long id = u.getId();

        List<Comment> list = commentService.getMyCommentById(id);
		List<CommentVo> voList = new ArrayList<>();
		for (Comment comment : list) {
			CommentVo vo = new CommentVo(comment);
			// vo取出cart
			Long cartId = vo.getComment().getCartId();
            CartVo cart = cartService.getCartById(cartId);
            vo.setCart(cart);
            voList.add(vo);
		}

		return voList;
	}
	
	@RequestMapping("user/getUserList.action")
	@ResponseBody
	public List<User> userList() {

		List<User> userList = userService.getUserList();

		return userList;
	}

	@RequestMapping("user/deleteUser{id}.html")
	public String deleteUser(Model model, @PathVariable Long id) {

		userService.deleteUser(id);

		return "user";
	}

	@RequestMapping("user/vip{id}.html")
	public String vip(Model model, @PathVariable Long id) {

		userService.vip(id);

		return "user";
	}

	@RequestMapping("notice/newNotice.html")
	public String newNotice(Notice notice, Model model) {

		noticeService.addNotice(notice);

		return "redirect:/info.html";
	}

}
