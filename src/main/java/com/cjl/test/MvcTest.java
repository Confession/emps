package com.cjl.test;

import com.cjl.model.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class MvcTest {
    @Autowired
    WebApplicationContext context;
    //模拟mvc请求
    MockMvc mvc;
    @Before//每次
    public void initMockMvc(){
        mvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求并拿到返回值
        MvcResult result = mvc.perform(MockMvcRequestBuilders.get("/emps")
                .param("pn","201")).andReturn();
        //请求成功，请求域中有pageinfo
        MockHttpServletRequest request = result.getRequest();
        PageInfo attribute = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码"+attribute.getPageNum());
        System.out.println("总页数"+attribute.getPages());
        System.out.println("总条数"+attribute.getTotal());
        System.out.println("需要连续显示的页码");
        int[] nums = attribute.getNavigatepageNums();
        for (int i:nums
             ) {
            System.out.print(" "+i);
        }
        List<Employee> list = attribute.getList();
        for (Employee e:list
             ) {
            System.out.println(e);
        }
    }
    @Test
    public void testDepts() throws Exception {

    }
}
