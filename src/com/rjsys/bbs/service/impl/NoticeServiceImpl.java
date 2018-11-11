package com.rjsys.bbs.service.impl;

import com.rjsys.bbs.mapper.NoticeMapper;
import com.rjsys.bbs.mapper.UserMapper;
import com.rjsys.bbs.pojo.Notice;
import com.rjsys.bbs.pojo.NoticeExample;
import com.rjsys.bbs.pojo.NoticeExample.Criteria;
import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.service.NoticeService;
import com.rjsys.bbs.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public PageBean<Notice> getNoticeList(Integer currentPage, Integer currentCount, Long id) {
		//封装一个pageBean并返回
		PageBean<Notice> pageBean = new PageBean<>();
		//当前页
		pageBean.setCurrentPage(currentPage);
		//每页显示条数
		pageBean.setCurrentCount(currentCount);
		//总条数
		int tatolCount;
		NoticeExample example = new NoticeExample();
		Criteria criteria = example.createCriteria();

        UserWithBLOBs user = userMapper.selectByPrimaryKey(id);

        List<Long> idList = new ArrayList<>();
        if(user.getFlag() == 1) {
            // 普通用户，只查询自己的和全部通知
            idList.add(0L);
            idList.add(id);
            criteria.andUserIdIn(idList);

        }
		criteria.andNotFlagNotEqualTo(3);

		tatolCount = noticeMapper.countByExample(example);

		pageBean.setTatolCount(tatolCount);
		//总页数
		int totalPage = (int)Math.ceil((1.0*tatolCount / currentCount));
		pageBean.setTotalPage(totalPage);
		//每页显示数据
		int index = (currentPage - 1) * currentCount;
		List<Notice> list = new ArrayList<>();
		if(user.getFlag() == 2) {
		    // 如果是管理员
			list = noticeMapper.getNoticeList2(index, currentCount);
        }else {
			list = noticeMapper.getNoticeList(index, currentCount, id);
		}


		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void alreadyReadNotice(Long noticeId) {
		Notice notice = new Notice();
		NoticeExample example = new NoticeExample();
		Criteria criteria = example.createCriteria();
		if(noticeId != null) {
			criteria.andNoticeIdEqualTo(noticeId);
		}
		notice.setNotFlag(2);
		noticeMapper.updateByExampleSelective(notice, example);
	}

	@Override
	public void deleteNotice(Long noticeId) {
		Notice notice = new Notice();
		NoticeExample example = new NoticeExample();
		Criteria criteria = example.createCriteria();
		if(noticeId != null) {
			criteria.andNoticeIdEqualTo(noticeId);
		}
		notice.setNotFlag(3);
		noticeMapper.updateByExampleSelective(notice, example);
		
	}

	@Override
	public void addNotice(Notice notice) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		String date = sdf.format(new Date());
		notice.setNotTime(date);
		notice.setNotFlag(1);

		noticeMapper.insert(notice);
	}

}
