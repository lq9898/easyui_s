package com.dao;

import com.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BasicDao <T>{
    void insert(T t);
    void delete(String id);
    void update(T t);
    List<Emp> queryByPage(@Param("start") Integer start, @Param("rows") Integer rows);
    Long queryTotal();
    void deleteAll(String[] id);
    Emp queryById(String id);

}
