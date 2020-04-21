package job.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.artesyn.resource.job.entity.Job;
import com.artesyn.resource.job.service.JobService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class UserTest {
	@Autowired
	private JobService jobService;
	@Test
	public void testUserAdd(){
		
		Job t=new Job();
		t.setJname("开发工程师");
		jobService.add(t);
	}
}
