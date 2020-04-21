package com.artesyn.resource.file.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.artesyn.resource.file.entity.Document;
import com.artesyn.resource.file.service.DocumentService;
import com.artesyn.resource.utils.Msg;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/document")
public class DocumentController {

	@Autowired
	private DocumentService documentService;

	/**
	 * list页面
	 * 
	 * @return
	 */
	@RequestMapping("/tolist")
	public String tolist() {
		return "file/list";
	}

	/**
	 * add页面
	 * 
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd() {
		return "file/add";
	}

	/**
	 * 新增
	 * 
	 * @param document
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Msg add(Document document, MultipartFile file, HttpServletRequest request) {
		try {
			if (!file.isEmpty()) {
				// String
				// path=request.getServletContext().getRealPath("/images/");
				String path = "C:/images/";
				String filename = file.getOriginalFilename();
				// 得到上传文件的扩展名
				String suffix = filename.substring(filename.lastIndexOf("."));
				// 为了防止上传同名文件，需要给上传文件重新命名
				String tempFileName = UUID.randomUUID().toString().replaceAll("-", "") + suffix;
				File filepath = new File(path, tempFileName);
				if (!filepath.getParentFile().exists()) {
					filepath.getParentFile().mkdirs();
				}
				file.transferTo(new File(path + File.separator + tempFileName));
				document.setFilename(tempFileName);
				documentService.add(document);
				return Msg.success();
			}
		} catch (Exception e) {
			return Msg.fail();
		}
		return Msg.fail();
	}

	/**
	 * 查询分页
	 * 
	 * @param pageNum
	 * @param document
	 * @return
	 */
	@RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
	@ResponseBody
	public Msg list(@PathVariable("pageNum") Integer pageNum, Document document) {
		try {
			PageInfo<Document> pageInfo = documentService.getAllByCondition(pageNum, document);
			return Msg.success().add("pageInfo", pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 根据id查询
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getById(@PathVariable("id") Integer id) {
		try {
			Document document = documentService.getById(id);
			return Msg.success().add("document", document);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 修改
	 * 
	 * @param id
	 * @param document
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg edit(@PathVariable("id") Integer id, Document document) {
		try {
			document.setDid(id);
			documentService.updateByCondition(document);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delete(@PathVariable("id") Integer id) {
		try {
			// 首先删除文件
			Document document = documentService.getById(id);
			String filename = document.getFilename();
			String path = "C:/images/";
			File file = new File(path, filename);
			if (file.exists()) {
				file.delete();
			}
			documentService.delete(id);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 文件下载
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
	@ResponseBody
	public void download(@PathVariable("id") Integer id, HttpServletRequest request, HttpServletResponse response) {
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			Document document = documentService.getById(id);
			String filename = document.getFilename();
			//下载的时候重命名文件名 为title加后缀
			String title = document.getTitle();
			String suffix = filename.substring(filename.lastIndexOf("."));
			String tempFileName = title + suffix;
			String path = "C:/images/";
			// String filepath = path+filename;
			// 获取输入流
			bis = new BufferedInputStream(new FileInputStream(new File(path, filename)));
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/octet-stream");
			response.reset();
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String(tempFileName.getBytes("utf-8"), "ISO8859-1"));

			bos = new BufferedOutputStream(response.getOutputStream());
			// 定义缓冲池大小，开始读写
			byte[] buff = new byte[1024];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			// 刷新缓冲，写出
			bos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭流
			if (bis != null) {
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (bis != null) {
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
