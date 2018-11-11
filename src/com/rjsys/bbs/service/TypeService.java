package com.rjsys.bbs.service;
//版块Service

import com.rjsys.bbs.pojo.Type;

import java.util.List;

public interface TypeService {

    //获取到所有版块
    public List<Type> getTypeList();

    //根据id获取版块
    public Type getTypeById(Long typeId);

    // 删除版块
    void deleteTypeById(Long typeId);

    // 新增版块
    void addType(Type type);

    // 编辑版块
    void editType(Type type);
}
