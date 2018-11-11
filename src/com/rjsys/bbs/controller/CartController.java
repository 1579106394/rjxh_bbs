package com.rjsys.bbs.controller;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.service.CartService;
import com.rjsys.bbs.service.CommentService;
import com.rjsys.bbs.service.TypeService;
import com.rjsys.bbs.service.UserService;
import com.rjsys.bbs.utils.PageBean;
import com.rjsys.bbs.vo.CartVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

//帖子相关Controller
@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private CommentService commentService;
	
	//发帖
	@RequestMapping("/cart/newCart.html")
	public String newCart(Cart cart) {
		cartService.newCart(cart);
		//获取到对应的版块id，跳转到新帖页面
		return "redirect:/cart/cartList.html";
	}

	// 编辑
	@RequestMapping("/cart/editCart.html")
	public String editCart(Cart cart) {
		cartService.editCart(cart);
		//获取到对应的版块id，跳转到新帖页面
		return "redirect:/cart/cartList.html";
	}

	// 跳转到编辑
	@RequestMapping("/cart/toEdit{cartId}.html")
	public String toEdit(@PathVariable Long cartId, Model model) {
		CartVo cartVo = cartService.getCartById(cartId);
		model.addAttribute("cart", cartVo);
		return "editCart";
	}
	
	//查看帖子列表
	@RequestMapping("/cart/cartList.html")
	public String cartList(@RequestParam(defaultValue = "createtime")String orderBy, Model model, 
			@RequestParam(defaultValue = "1")Integer currentPage, 
			@RequestParam(defaultValue="0")Integer typeId) {
		//查找指定的帖子
		//添加分页
		//当前页为1
		//每页显示20条
		Integer currentCount = 15;
		PageBean<CartVo> pageBean = cartService.getCartList(orderBy, currentPage, currentCount, typeId);
		Integer end = pageBean.getTotalPage();
		if(end > 10) {
			end = pageBean.getCurrentPage() + 9;
		}
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("orderBy", orderBy);
		model.addAttribute("end", end);
		model.addAttribute("typeId", typeId);
		
		
		//查看通知帖
		List<CartVo> noticeList = cartService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		if(typeId==0) {
			return "forward:/index.html";
		}
		return "cartList";
	}
	
	//帖子搜索
	@RequestMapping("/cart/searchCart.html")
	public String searchCart(String keyWords, Model model, 
			@RequestParam(defaultValue = "1")Integer currentPage) {
		Integer currentCount = 100;
		PageBean<CartVo> pageBean = cartService.searchCartListByKeyWords(keyWords, currentPage, currentCount);
		
		Integer end = pageBean.getTotalPage();
		if(end > 10) {
			end = pageBean.getCurrentPage() + 9;
		}
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("end", end);
		return "cartList";
	}

	//查看帖子
	@RequestMapping("/cart/{cartId}.html")
	public String readCart(@PathVariable Long cartId, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			UserWithBLOBs user2 = userService.getUserById(user.getId());
			String zanStr = user2.getZan();
			if(StringUtils.isNotBlank(zanStr)) {
				String[] zans = zanStr.split("-");
				for (String string : zans) {
					long id = Long.parseLong(string);
					if(id == cartId) {
						//用户已经赞了这个帖子
						model.addAttribute("zanFlag", 1);
					}
				}
			}
			String shoucangStr = user2.getShoucang();
			if(StringUtils.isNotBlank(shoucangStr)) {
				String[] shoucangs = shoucangStr.split("-");
				for (String string : shoucangs) {
					long id = Long.parseLong(string);
					if(id == cartId) {
						//用户已经收藏了这个帖子
						model.addAttribute("shoucangFlag", 1);
					}
				}
			}
		}
		//根据id修改帖子，查看数+1，
		cartService.addReadNum(cartId);
		CartVo cartVo = cartService.getCartById(cartId);
		UserWithBLOBs userV = userService.getUserById(cartVo.getUser().getId());
		model.addAttribute("cart", cartVo);
		model.addAttribute("userV", userV);
		return "read";
	}
	
	//ajax加载热议帖子
	@RequestMapping("/cart/ajaxHotCartList.action")
	@ResponseBody
	public List<CartVo> hotCartList() {
		//查找热议贴
		List<CartVo> hotList = cartService.getHotList();
		return hotList;
	}
	
	//ajax加载收藏帖子
	@RequestMapping("/cart/ajaxShoucangCartList.action")
	@ResponseBody
	public List<CartVo> shoucangCartList(HttpSession session) {
		//查找热议贴
		User user = (User) session.getAttribute("user");
		List<CartVo> shoucangList = new ArrayList<CartVo>();
		if(user != null) {
			shoucangList = cartService.getShoucangList(user);
		}
		return shoucangList;
	}
	
	//ajax点赞
	@RequestMapping("/cart/ajaxZan.action")
	@ResponseBody
	public Cart zan(@RequestBody Cart cart, HttpSession session) {
		//查询修改前的cart，用于判断
		CartVo cartBefore = cartService.getCartById(cart.getCartId());
		
		Integer ok = cartService.zanCartById(cart);
		//查询修改后的Cart，将其返回
		CartVo cartAfter = cartService.getCartById(cart.getCartId());
		
		User user = (User) session.getAttribute("user");
		if(user != null) {
			//给这个用户添加这个帖子被赞的id
			userService.addZanId(user, cart, cartBefore);
		}
		
		return cartAfter;
	}
	
	//ajax收藏
	@RequestMapping("/cart/ajaxShoucang.action")
	@ResponseBody
	public Cart shoucang(@RequestBody Cart cart, HttpSession session) {
		//查询修改前的cart，用于判断
		CartVo cartBefore = cartService.getCartById(cart.getCartId());
		
		Integer ok = cartService.shoucangCartById(cart);
		//查询修改后的Cart，将其返回
		CartVo cartAfter = cartService.getCartById(cart.getCartId());
		
		User user = (User) session.getAttribute("user");
		//给这个用户添加这个帖子被收藏的id
		userService.addShoucangId(user, cart, cartBefore);
		
		return cartAfter;
	}

	//ajax举报
	@RequestMapping("/cart/ajaxJubao.action")
	@ResponseBody
	public Cart jubao(@RequestBody CartVo cart, HttpSession session) {
		//查询修改前的cart，用于判断
		CartVo cartBefore = cartService.getCartById(cart.getCartId());

		Integer ok = cartService.jubaoCartById(cart);
		//查询修改后的Cart，将其返回
		CartVo cartAfter = cartService.getCartById(cart.getCartId());

		return cartAfter;
	}

	@RequestMapping("cart/getAllCartList.action")
	@ResponseBody
	public List<Cart> allCartList(@RequestParam(defaultValue = "createtime")String orderBy,
								  @RequestParam(defaultValue = "1")Integer currentPage,
								  @RequestParam(defaultValue="0")Integer typeId) {

        List<Cart> cartList = cartService.getCartList();

        return cartList;

    }

    @RequestMapping("cart/delete{id}.html")
    public String deleteMyCart(@PathVariable Long id) {


        cartService.deleteMyCart(id);

        return "redirect:/cart.html";
    }

    @RequestMapping("cart/top{id}.html")
    public String top(@PathVariable Long id) {


        cartService.top(id);

        return "redirect:/cart.html";
    }

    @RequestMapping("cart/great{id}.html")
    public String great(@PathVariable Long id) {


        cartService.great(id);

        return "redirect:/cart.html";
    }

}
