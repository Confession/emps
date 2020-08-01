package com.cjl.model;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    @Pattern(regexp = "(^[A-Za-z0-9]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)",
            message =  "名字必须是2-5个中文或者6-16位英文数字组合")
    private String empName;

    //@Email
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message = "邮箱格式输入错误")
    private String empEmail;

    private String gender;

    private Integer dId;

    public Employee(){
        super();
    }

    public Employee(Integer empId, String empName, String empEmail, String gender, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.empEmail = empEmail;
        this.gender = gender;
        this.dId = dId;
    }

    //查询员工时查出部门信息
    private Department dept;

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail == null ? null : empEmail.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", empEmail='" + empEmail + '\'' +
                ", gender='" + gender + '\'' +
                ", dId=" + dId +
                '}';
    }
}