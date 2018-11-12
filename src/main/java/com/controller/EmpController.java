package com.controller;

import com.entity.Emp;
import com.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Emp")
public class EmpController {
    @Autowired
    private EmpService empService;
    /*增加员工*/
    @RequestMapping("save")
    public @ResponseBody Map<String, Object> save(Emp emp){
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            empService.insert(emp);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
          return results;
    }
    /*分页查询*/
    @RequestMapping("queryAll")
    public  @ResponseBody Map<String, Object> queryAll(int page,int rows){
        HashMap<String, Object> results = new HashMap<String,Object>();
        List<Emp> emps = empService.queryByPage(page, rows);
        Long totals = empService.queryTotal();
        results.put("total",totals);
        results.put("rows",emps);
        return  results;
    }
    /*删除一个*/
    @RequestMapping("delete")
    public @ResponseBody Map<String,Object> delete(String id){
        HashMap<String, Object> results = new HashMap<String, Object>();
        try {
            empService.delete(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    /*修改一个*/
    @RequestMapping("update")
    public @ResponseBody Map<String,Object> update(Emp emp){
        HashMap<String, Object> results = new HashMap<String, Object>();
        try {
            empService.update(emp);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    /*删除多个*/
    @RequestMapping("deletes")
    public @ResponseBody  HashMap<String, Object> detetes(String[] id){
        HashMap<String, Object> results = new HashMap<String, Object>();
        try {
            empService.deleteAll(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;

    }
    /*根据id查询一个用户*/
    @RequestMapping("queryById")
    public  @ResponseBody Emp queryById(String id){
        return  empService.queryById(id);
    }

}
