package nitice;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.artesyn.resource.notice.entity.Notice;
import com.artesyn.resource.notice.service.NoticeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class NoticeTest {
	@Autowired
	private NoticeService noticeService;
	@Test
	public void testAdd(){
		Notice t=new Notice();
		t.setContent("今天放假");
		t.setTitle("放假事宜");
		t.setPublishDate(new Date());
		t.setStatus(1);
		t.setUid(1);
		noticeService.add(t);
	}
}
