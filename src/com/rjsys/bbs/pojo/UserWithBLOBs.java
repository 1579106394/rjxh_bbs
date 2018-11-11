package com.rjsys.bbs.pojo;

import java.io.Serializable;

public class UserWithBLOBs extends User implements Serializable{
    private String autograph;

    private String mycard;

    private String shoucang;

    private String zan;

    public String getAutograph() {
        return autograph;
    }

    public void setAutograph(String autograph) {
        this.autograph = autograph == null ? null : autograph.trim();
    }

    public String getMycard() {
        return mycard;
    }

    public void setMycard(String mycard) {
        this.mycard = mycard == null ? null : mycard.trim();
    }

    public String getShoucang() {
        return shoucang;
    }

    public void setShoucang(String shoucang) {
        this.shoucang = shoucang == null ? null : shoucang.trim();
    }

    public String getZan() {
        return zan;
    }

    public void setZan(String zan) {
        this.zan = zan == null ? null : zan.trim();
    }
}