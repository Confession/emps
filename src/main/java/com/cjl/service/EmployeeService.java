package com.cjl.service;

import com.cjl.dao.EmployeeMapper;
import com.cjl.model.Employee;
import com.cjl.model.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有包括部门
     * @return
     */
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 校验用户名是否被占用
     * @param empName
     * @return
     */
    public boolean checkuser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        return employeeMapper.countByExample(example) == 0;
    }

    /**
     * 员工保存
     * @param employee
     */
    public void saveEmps(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /**
     * 删除单个员工
     * @param ids
     */
    public void delEmp(int ids) {
        employeeMapper.deleteByPrimaryKey(ids);
    }

    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKeyWithDept(id);
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
    /**
     * 批量删除员工
     * @param ids
     */
    public void deleteBatchEmp(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
