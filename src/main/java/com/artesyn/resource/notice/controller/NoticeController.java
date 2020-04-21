package com.artesyn.resource.notice.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artesyn.resource.notice.entity.Notice;
import com.artesyn.resource.notice.service.NoticeService;
import com.artesyn.resource.utils.Msg;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	/**
	 * 跳转到notice
	 * 
	 * @return
	 */
	@RequestMapping("/tonotice")
	public String tonotice() {
		return "notice/notice";
	}
	/**
	 * 根据ID查询
	 * @param nid
	 * @return
	 */
	@RequestMapping("/getById/{nid}")
	@ResponseBody
	public Msg getById(@PathVariable("nid")Integer nid){
		try {
			Notice notice = noticeService.getById(nid);
			return Msg.success().add("notice", notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 查询分页
	 * 
	 * @param pageNum
	 * @param notice
	 * @return
	 */
	@RequestMapping("/list/{pageNum}")
	@ResponseBody
	public Msg notice(@PathVariable("pageNum") Integer pageNum, Notice notice) {
		try {
			PageInfo<Notice> pageInfo = noticeService.getByCondition(pageNum, notice);
			return Msg.success().add("pageInfo", pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 查询分页
	 * @param notice
	 * @return
	 */
	@RequestMapping("/getNoticeByCondition")
	@ResponseBody
	public Msg getNoticeByCondition(Notice notice) {
		try {
			PageInfo<Notice> pageInfo = noticeService.getByCondition(1, notice);
			return Msg.success().add("pageInfo", pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 新增
	 * @param notice
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Msg add(Notice notice) {
		try {
			noticeService.add(notice);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 修改
	 * @param notice
	 * @return
	 */
	@RequestMapping(value="/edit/{nid}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg edit(@PathVariable("nid")Integer nid,Notice notice){
		notice.setNid(nid);
		try {
			noticeService.update(notice);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	
	/**
	 * 发布
	 * @param notice
	 * @return
	 */
	@RequestMapping(value="/publish",method=RequestMethod.PUT)
	@ResponseBody
	public Msg publish(Notice notice){
		notice.setPublishDate(new Date());
		try {
			noticeService.publish(notice);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 删除
	 * @param nid
	 * @return
	 */
	@RequestMapping(value="/delete/{nid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg delete(@PathVariable("nid")Integer nid){
		try {
			noticeService.delete(nid);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/batchDelete/{ids}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg batchDelete(@PathVariable("ids")String ids){
		if(ids==null||ids==""){
			return Msg.fail();
		}
		String[] nids = ids.split(",");
		try {
			noticeService.batchDelete(nids);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
}
