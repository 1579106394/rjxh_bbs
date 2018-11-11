package com.rjsys.bbs.service;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.utils.PageBean;
import com.rjsys.bbs.vo.CartVo;

import java.util.List;

//帖子相关
public interface CartService {

	//发帖
	public void newCart(Cart cart);
	
	//查看帖子列表
	public PageBean<CartVo> getCartList(String orderBy, Integer currentPage, Integer currentCount, Integer typeId);

	//查找所有通知帖子
	public List<CartVo> getNoticeList();

	//查找热议帖子
	public List<CartVo> getHotList();

	//根据id查看帖子
	public CartVo getCartById(Long cartId);

	//获取收藏帖子
	public List<CartVo> getShoucangList(User user);

	//修改帖子，查看数+1
	public void addReadNum(Long cartId);

	//帖子点赞
	public Integer zanCartById(Cart cart);

	//帖子收藏
	public Integer shoucangCartById(Cart cart);

	//搜索帖子
	public PageBean<CartVo> searchCartListByKeyWords(String keyWords, Integer currentPage, Integer currentCount);

	//查找我的帖子
	public List<Cart> getMyCartList(User user);

	//删除我的帖子
	public void deleteMyCart(Long id);

	//取消收藏
	public void deleteShoucang(Long id, Long userId);

	// 编辑帖子
	void editCart(Cart cart);

	// 举报帖子
	Integer jubaoCartById(CartVo cart);

	// 删除回复
    void deleteHuifu(Long id);

    // 查询所哟帖子
	List<Cart> getCartList();

	void top(Long id);

	void great(Long id);
}
