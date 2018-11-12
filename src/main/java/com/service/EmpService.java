package com.service;

import com.entity.Emp;

import java.util.List;

public interface EmpService
{
    void insert(Emp emp);
    void delete(String id);
    void update(Emp emp);
    List<Emp> queryByPage(int page,int rows);
    Long queryTotal();
    void deleteAll(String[] id);
    Emp queryById(String id);
}
