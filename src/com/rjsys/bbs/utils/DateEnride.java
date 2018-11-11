package com.rjsys.bbs.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

public class DateEnride implements WebBindingInitializer {

public void initBinder(WebDataBinder binder, WebRequest request) {
//日期转换器
DateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
}

}