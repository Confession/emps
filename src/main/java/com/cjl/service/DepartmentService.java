package com.cjl.service;

import com.cjl.dao.DepartmentMapper;
import com.cjl.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }

    public Department getDeptById(Integer deptId) {
        return departmentMapper.selectByPrimaryKey(deptId);
    }
}
