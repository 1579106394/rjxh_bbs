package com.rjsys.bbs.controller;

import com.rjsys.bbs.pojo.Type;
import com.rjsys.bbs.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

//分类相关
@Controller
public class TypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping("/type/ajaxGetTypeList.action")
    @ResponseBody
    public List<Type> getTypeList() {
        List<Type> list = typeService.getTypeList();
        return list;
    }


    @RequestMapping("/type/deleteType{typeId}.html")
    public String deleteType(@PathVariable Long typeId) {
        typeService.deleteTypeById(typeId);
        return "redirect:/mokuai.html";
    }

    @RequestMapping("type/addType.html")
    public String addType(Type type) {
        typeService.addType(type);
        return "redirect:/mokuai.html";
    }

    @RequestMapping("type/toEdit{typeId}.html")
    public String toEdit(Model model, @PathVariable Long typeId) {

        Type type = typeService.getTypeById(typeId);

        model.addAttribute("type", type);

        return "editMokuai";
    }

    @RequestMapping("type/editType.html")
    public String edit(Type type) {

        typeService.editType(type);

        return "redirect:/mokuai.html";
    }

}
