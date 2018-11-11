package com.rjsys.bbs.pojo;

import java.io.Serializable;

public class Notice implements Serializable{
    private Long noticeId;

    private Long userId;

    private String notTime;

    private Integer notFlag;

    private String article;

    public Long getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Long noticeId) {
        this.noticeId = noticeId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNotTime() {
        return notTime;
    }

    public void setNotTime(String notTime) {
        this.notTime = notTime == null ? null : notTime.trim();
    }

    public Integer getNotFlag() {
        return notFlag;
    }

    public void setNotFlag(Integer notFlag) {
        this.notFlag = notFlag;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article == null ? null : article.trim();
    }
}