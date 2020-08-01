package com.cjl.test;

import com.cjl.dao.DepartmentMapper;
import com.cjl.dao.EmployeeMapper;
import com.cjl.model.Department;
import com.cjl.model.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * 引入spring test包进行测试
 * 使用ContextConfiguration注解指定配置文件路径
 * autowired需要使用的组件
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MybatisTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    public static void main(String[] args) {
        /*原生测试方式
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        DepartmentMapper departmentMapper = ioc.getBean(DepartmentMapper.class);
        System.out.println(departmentMapper);*/
    }
    @Test
    public void test(){
        //批量添加
        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        long t1 = System.currentTimeMillis();
        for (int i=0;i<1000;i++){
            String name = UUID.randomUUID().toString().substring(0,5);
            employeeMapper.insertSelective(new Employee(null,name,name+"@qq.com","男",1));
        }
        System.out.println(System.currentTimeMillis()-t1);
    }
    @Test
    public void testSelect(){
        //Department department = new Department(8,"laji","sasigei");
        //List<Department> lists = departmentMapper.selectByExample(null);
        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(1001);
        String name = departmentMapper.selectByPrimaryKey(employee.getdId()).getDeptName();
        System.out.println(name);
    }
    @Test
    public void testSave(){
        employeeMapper.insertSelective(new Employee(null,"西蒙斯","西蒙斯@qq.com","男",1));
    }

    @Test
    public void testDel(){
        employeeMapper.deleteByPrimaryKey(2217);
    }

    @Test
    public void testUpdate(){
        Employee e = employeeMapper.selectByPrimaryKeyWithDept(2236);
        e.setEmpName("hahaha");
        employeeMapper.updateByPrimaryKey(e);
    }
}
