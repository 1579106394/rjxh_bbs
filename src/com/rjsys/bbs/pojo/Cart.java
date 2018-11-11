package com.rjsys.bbs.pojo;

import java.io.Serializable;

public class Cart implements Serializable {
    private Long cartId;

    private Long typeId;

    private String mold;

    private Long userId;

    private Integer top;

    private Integer great;

    private Integer flag;

    private Integer zan;

    private Integer shoucang;

    private Integer readnum;

    private String title;

    private String huifutime;

    private String createtime;

    private Integer huifunum;

    private String article;

    public Long getCartId() {
        return cartId;
    }

    public void setCartId(Long cartId) {
        this.cartId = cartId;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getTop() {
        return top;
    }

    public void setTop(Integer top) {
        this.top = top;
    }

    public Integer getGreat() {
        return great;
    }

    public void setGreat(Integer great) {
        this.great = great;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getZan() {
        return zan;
    }

    public void setZan(Integer zan) {
        this.zan = zan;
    }

    public Integer getShoucang() {
        return shoucang;
    }

    public void setShoucang(Integer shoucang) {
        this.shoucang = shoucang;
    }

    public Integer getReadnum() {
        return readnum;
    }

    public void setReadnum(Integer readnum) {
        this.readnum = readnum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getHuifutime() {
        return huifutime;
    }

    public void setHuifutime(String huifutime) {
        this.huifutime = huifutime == null ? null : huifutime.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public Integer getHuifunum() {
        return huifunum;
    }

    public void setHuifunum(Integer huifunum) {
        this.huifunum = huifunum;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article == null ? null : article.trim();
    }

    public String getMold() {
        return mold;
    }

    public void setMold(String mold) {
        this.mold = mold;
    }
}