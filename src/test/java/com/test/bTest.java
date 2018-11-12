package com.test;

import com.dao.EmpDao;
import com.entity.Emp;
import com.service.EmpService;
import org.junit.Test;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class bTest extends  Basic{
@Autowired
    private EmpService empService;
     @Test
    public  void test1(){
        Emp emp = new Emp();
        emp.setName("小牛");
        emp.setSex("男");
        emp.setAge(22);
        emp.setBir(new Date());
        emp.setAddress("湖北省武汉市");
         empService.insert(emp);
    }
    @Test
    public void delete(){

         empService.delete("8869bd9e-7712-4919-bc49-92317be6c640");
    }
    @Test
    public  void queryAll(){
        List<Emp> emps = empService.queryByPage(1, 5);
        for(Emp emp:emps){
            System.out.println(emp);
        }
    }
    @Test
    public  void total(){
        Long total = empService.queryTotal();
        System.out.println(total);
    }
    @Test
    public  void up(){
         String[] id={"ae57d48c-ccae-4277-9504-bffcbaf86d26","f400ad1e-cb9f-43ea-aac9-3289b10e394b"};

            empService.deleteAll(id);


    }
    @Test
    public void uodate(){


    }
}
