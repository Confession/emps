package com.cjl.model;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用返回对象
 */
public class Msg {

    private Integer code;
    private String msg;
    //返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String, Object>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMsg("处理成功");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMsg("处理失败");
        return msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public Msg add(String key, Object value) {
        this.getExtend().put(key,value);
        return this;
    }
}
