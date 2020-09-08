package com.covely.mybatis;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MySQLConnectionTests {

	@Inject
    private DataSource ds;
 
    @Test
    public void testConnection() throws Exception {
 
        try (Connection con = ds.getConnection()) {
 
            System.out.println("\n >>>>>>>>>> Connection 출력 : " + con + "\n");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
