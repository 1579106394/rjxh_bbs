package com.rjsys.bbs.mapper;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.vo.CartUtils;
import com.rjsys.bbs.vo.CartVo;
import com.rjsys.bbs.vo.SearchVo;

import java.util.List;

public interface CartVoMapper {
  
    //根据排序类型查询
    List<CartVo> getCartVoListOrder(CartUtils search);

    //查找所有通知帖
	List<CartVo> getNoticeList();

	//查找热议帖子
	List<CartVo> getHotList();

	//根据id查看帖子
	CartVo getCartById(Long cartId);

	//查看帖子条数
	int getCartCount(Integer typeId);

	//查看数+1
	void addReadNum(Long cartId);

	//点赞
	int zan(Cart cart);

	//收藏
	int shoucang(Cart cart);

	//查找符合条件的数量
	int getSearchCartCount(String[] strings);

	//查找符合条件的cart
	List<CartVo> getCartListBySearch(SearchVo search);

	// 发帖
    void newCart(Cart cart);

    // 编辑帖子
    void editCart(Cart cart);

    // 举报帖子
	int jubao(CartVo cart);
}