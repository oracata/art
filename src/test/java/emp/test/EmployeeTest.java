package emp.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.artesyn.resource.employee.entity.Employee;
import com.artesyn.resource.employee.service.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class EmployeeTest {
	@Autowired
	private EmployeeService employeeService;
/*	@Test
	public void testUserAdd(){
		for (int i = 0; i <100; i++) {
			Employee t=new Employee();
			t.setAddress("2222222");
			t.setBirthday("2017-1-1");
			t.setCardId("11111");
			t.setDid(1);
			t.setEducation("1");
			t.setEmail("1");
			t.setEname("1");
			t.setHobby("1");
			t.setJid(1);
			t.setParty("1");
			t.setPhone("11");
			t.setPostCode("11");
			t.setQqNum("1");
			t.setSpeciality("1");
			t.setTel("1");
			t.setRemark("1");
			t.setRace("1");
			t.setSex(1);
			employeeService.add(t);
		}
	}*/
	
	@Test
	public void testUserget(){
		employeeService.getAll();
		//employeeService.getById(1);
		//employeeService.delete(3);
	}
}
