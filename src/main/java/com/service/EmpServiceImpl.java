package com.service;

import com.dao.EmpDao;
import com.entity.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class EmpServiceImpl implements  EmpService {
    @Autowired
    private EmpDao empDao;
    @Override
    public void insert(Emp emp) {
        emp.setId(UUID.randomUUID().toString());
        empDao.insert(emp);
    }

    @Override
    public void delete(String id) {
        empDao.delete(id);
    }

    @Override
    public void update(Emp emp) {
        empDao.update(emp);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> queryByPage(int page, int rows) {
        int start=(page-1)*rows;
        return empDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long queryTotal() {
        return empDao.queryTotal();
    }

    @Override
    public void deleteAll(String[] id) {
        empDao.deleteAll(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Emp queryById(String id) {
        return empDao.queryById(id);
    }
}
