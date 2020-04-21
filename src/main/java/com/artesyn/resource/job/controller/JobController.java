package com.artesyn.resource.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artesyn.resource.job.entity.Job;
import com.artesyn.resource.job.service.JobService;
import com.artesyn.resource.utils.Msg;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@Autowired
	private JobService jobService;
	/**
	 * 跳转到job.jsp
	 * @return
	 */
	@RequestMapping("/tojob")
	public String toJob(){
		return "job/job";
	}
	
	/**
	 * 职位添加页面
	 * 
	 * @param job
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Msg add(Job job) {
		try {
			jobService.add(job);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Msg list() {
		try {
			List<Job> jobs = jobService.getAll();
			return Msg.success().add("jobs", jobs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 根据id删除职位
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value ="/delete/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delete(@PathVariable("id") Integer id) {
		try {
			jobService.delete(id);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 根据职位ID获取职位
	 * @param id
	 * @return
	 */
	@RequestMapping(value ="/getById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getById(@PathVariable("id") Integer id){
		try {
			Job job = jobService.getById(id);
			return Msg.success().add("job", job);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	
	@RequestMapping(value ="/edit/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg edit(@PathVariable("id") Integer jid,Job job){
		job.setJid(jid);
		try {
			jobService.update(job);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
}
