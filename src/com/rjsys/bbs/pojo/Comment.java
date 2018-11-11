package com.rjsys.bbs.pojo;

import java.io.Serializable;

public class Comment implements Serializable{
    private Long cId;

    private Long commentId;

    private Long userId1;

    private Long userId2;

    private String artTime;

    private Integer comZan;

    private Long cartId;

    private String article;

    public Long getcId() {
        return cId;
    }

    public void setcId(Long cId) {
        this.cId = cId;
    }

    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getUserId1() {
        return userId1;
    }

    public void setUserId1(Long userId1) {
        this.userId1 = userId1;
    }

    public Long getUserId2() {
        return userId2;
    }

    public void setUserId2(Long userId2) {
        this.userId2 = userId2;
    }

    public String getArtTime() {
        return artTime;
    }

    public void setArtTime(String artTime) {
        this.artTime = artTime == null ? null : artTime.trim();
    }

    public Integer getComZan() {
        return comZan;
    }

    public void setComZan(Integer comZan) {
        this.comZan = comZan;
    }

    public Long getCartId() {
        return cartId;
    }

    public void setCartId(Long cartId) {
        this.cartId = cartId;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article == null ? null : article.trim();
    }
}