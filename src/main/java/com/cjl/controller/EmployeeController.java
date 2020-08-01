package com.cjl.controller;

import com.cjl.model.Department;
import com.cjl.model.Employee;
import com.cjl.model.Msg;
import com.cjl.service.DepartmentService;
import com.cjl.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        //引入pagehelper实现分页
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        PageInfo<Employee> page = new PageInfo<>(emps,5);//连续现实的页数
        return  Msg.success().add("pageInfo",page);
    }

    /**
     * 支持jsr303校验
     * @param employee
     * @param result 校验返回的结果
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        System.out.println(employee);
        Map<String,Object> map = new HashMap<>();
        if (result.hasErrors()){
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error:errors
                 ) {
                map.put(error.getField(),error.getDefaultMessage()) ;//错误字段名,错误字段信息
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.saveEmps(employee);
            return Msg.success();
        }
    }

    /**
     * 删除(单个或多个)
     * @param ids
     * @return
     */
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids")String ids){
        System.out.println(ids);
        if (ids.contains("-")){
            String[] strIds = ids.split("-");
            List<Integer> del_ids = new ArrayList<Integer>();
            for (String str:strIds
                 ) {
                del_ids.add(Integer.parseInt(str));
            }
            employeeService.deleteBatchEmp(del_ids);
        }else {
            employeeService.delEmp(Integer.parseInt(ids));
        }
        return Msg.success();
    }

    /**
     * 查询单个员工信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("id")Integer id){
        System.out.println(id);
        Employee emp = employeeService.getEmp(id);
        Department department = departmentService.getDeptById(emp.getdId());
        emp.setDept(department);
        return Msg.success().add("emp",emp);
    }

    /**
     * 修改员工信息
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.POST)
    @ResponseBody
    public Msg updateEmp(Employee employee){
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }
}
