package com.rjsys.bbs.service.impl;

import com.rjsys.bbs.mapper.CartMapper;
import com.rjsys.bbs.mapper.CartVoMapper;
import com.rjsys.bbs.mapper.CommentMapper;
import com.rjsys.bbs.mapper.UserMapper;
import com.rjsys.bbs.pojo.*;
import com.rjsys.bbs.pojo.CartExample.Criteria;
import com.rjsys.bbs.service.CartService;
import com.rjsys.bbs.utils.PageBean;
import com.rjsys.bbs.vo.CartUtils;
import com.rjsys.bbs.vo.CartVo;
import com.rjsys.bbs.vo.SearchVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private CartVoMapper cartVoMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CommentMapper comment1Mapper;
	
	@Override
	//发帖
	public void newCart(Cart cart) {
		//补全cart属性。。
		//发帖时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		String date = sdf.format(new Date());
		cart.setCreatetime(date);
		//最新回复时间
		cart.setHuifutime(date);
		cartVoMapper.newCart(cart);
		
	}

	@Override
	public void editCart(Cart cart) {
		//补全cart属性。。
		//发帖时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		String date = sdf.format(new Date());
		//最新回复时间
		cart.setHuifutime(date);
		cartVoMapper.editCart(cart);
	}

	@Override
	public Integer jubaoCartById(CartVo cart) {
		int i = cartVoMapper.jubao(cart);
		return i;
	}

	@Override
	public void deleteHuifu(Long id) {
		Comment comment = comment1Mapper.selectByPrimaryKey(id);

		deleteCommon(comment);
	}

	@Override
	public List<Cart> getCartList() {
		CartExample example = new CartExample();
        Criteria criteria = example.createCriteria();
        criteria.andFlagNotEqualTo(2);
        return cartMapper.selectByExample(example);
	}

    @Override
    public void top(Long id) {
        Cart cart = new Cart();
        cart.setCartId(id);
        cart.setTop(2);
        cartMapper.updateByPrimaryKeySelective(cart);
    }

    @Override
    public void great(Long id) {
        Cart cart = new Cart();
        cart.setCartId(id);
        cart.setGreat(2);
        cartMapper.updateByPrimaryKeySelective(cart);
    }

    public void deleteCommon(Comment comment) {
        Long cid = comment.getcId();
        comment1Mapper.deleteByPrimaryKey(cid);

        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andCommentIdEqualTo(cid);
        List<Comment> commentList = comment1Mapper.selectByExample(example);
        for (Comment comment1 : commentList) {
            deleteCommon(comment1);
        }

    }

	@Override
	//查看帖子列表
	public PageBean<CartVo> getCartList(String orderBy, Integer currentPage, Integer currentCount, Integer typeId) {
		//封装一个pageBean并返回
		PageBean<CartVo> pageBean = new PageBean<>();
		//当前页
		pageBean.setCurrentPage(currentPage);
		//每页显示条数
		pageBean.setCurrentCount(currentCount);
		//总条数
		int tatolCount;
		if(typeId == 0) {
			CartExample example = new CartExample(); 
			Criteria criteria = example.createCriteria();
			criteria.andFlagEqualTo(1);
			tatolCount = cartMapper.countByExample(example);
		}else {
			
			tatolCount = cartVoMapper.getCartCount(typeId);
		}
		pageBean.setTatolCount(tatolCount);
		//总页数
		int totalPage = (int)Math.ceil((1.0*tatolCount / currentCount));
		pageBean.setTotalPage(totalPage);
		//每页显示数据
		int index = (currentPage - 1) * currentCount;
		CartUtils search = new CartUtils(orderBy, index, currentCount, typeId);
		List<CartVo> list = cartVoMapper.getCartVoListOrder(search);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<CartVo> searchCartListByKeyWords(String keyWords, Integer currentPage, Integer currentCount) {
		//封装一个pageBean并返回
		PageBean<CartVo> pageBean = new PageBean<>();
		//当前页
		pageBean.setCurrentPage(currentPage);
		//每页显示条数
		pageBean.setCurrentCount(currentCount);
		//总条数
		int tatolCount;
		String[] strings = keyWords.split("");
		tatolCount = cartVoMapper.getSearchCartCount(strings);
		pageBean.setTatolCount(tatolCount);
		//总页数
		int totalPage = 1;
		pageBean.setTotalPage(totalPage);
		//每页显示数据
		int index = (currentPage - 1) * currentCount;
		SearchVo search = new SearchVo(strings, index, currentCount);
		List<CartVo> cartList = cartVoMapper.getCartListBySearch(search);
		pageBean.setList(cartList);
		return pageBean;
	}


	@Override
	public List<CartVo> getNoticeList() {
		return cartVoMapper.getNoticeList();
	}

	@Override
	public List<CartVo> getHotList() {
		
		return cartVoMapper.getHotList();
	}

	@Override
	public CartVo getCartById(Long cartId) {
		
		return cartVoMapper.getCartById(cartId);
	}

	@Override
	public List<CartVo> getShoucangList(User user) {
		List<CartVo> cartList = new ArrayList<>();
		UserWithBLOBs bs = userMapper.selectByPrimaryKey(user.getId());
		if(StringUtils.isNotBlank(bs.getShoucang())) {
			String[] strings = bs.getShoucang().split("-");
			for (String scId : strings) {
				Long id = Long.parseLong(scId);
				CartVo cart = cartVoMapper.getCartById(id);
				cartList.add(cart);
			}
		}
		List<CartVo> tempList = new ArrayList<>();
		tempList.add(null);
		cartList.removeAll(tempList);
		return cartList;
	}

	@Override
	public void addReadNum(Long cartId) {
		cartVoMapper.addReadNum(cartId);
	}

	@Override
	public Integer zanCartById(Cart cart) {
		//修改这个帖子的点赞数为之前的数量+1
		int i = cartVoMapper.zan(cart);
		
		return i;
		
	}

	@Override
	public Integer shoucangCartById(Cart cart) {
		int i = cartVoMapper.shoucang(cart);
		return i;
	}

	@Override
	public List<Cart> getMyCartList(User user) {
		CartExample example = new CartExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(user.getId());
		criteria.andFlagNotEqualTo(2);
		List<Cart> list = cartMapper.selectByExample(example);
		
		return list;
	}

	@Override
	public void deleteMyCart(Long id) {
		Cart cart = cartMapper.selectByPrimaryKey(id);
		cart.setFlag(2);
		cartMapper.updateByPrimaryKeySelective(cart);
	}

	@Override
	public void deleteShoucang(Long id, Long userId) {
		//获取到我的收藏id
		String newStr = "";
		UserWithBLOBs user = userMapper.selectByPrimaryKey(userId);
		String shoucangStr = user.getShoucang();
		String[] split = shoucangStr.split("-");
		for (String string : split) {
			long cartId = Long.parseLong(string);
			if(cartId != id) {
				newStr += cartId + "-";
			}
		}
		user.setShoucang(newStr);
		userMapper.updateByPrimaryKeySelective(user);
	}


}
