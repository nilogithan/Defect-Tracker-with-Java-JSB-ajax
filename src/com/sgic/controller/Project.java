package com.sgic.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgic.config.DbConnection;



public class Project extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String projectName=request.getParameter("projectName");
		String projectDescription=request.getParameter("projectDescription");
	
		if(projectName.length()==0 || projectDescription.length()==0) {
			response.sendRedirect("project.jsp?msg=notvalid"); 
		}else {
		
		Connection conn=DbConnection.getDbConnection();
		 
		try {
			Statement stmt=conn.createStatement(); 
			int result=stmt.executeUpdate("INSERT INTO projects (`project_name`, `project_description`) VALUES ('"+projectName+"', '"+projectDescription+"');");  
			System.out.println(result+" records affected");  
			response.sendRedirect("project.jsp?msg=success");  
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("project.jsp?msg=error");  
		}  
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DbConnection.getDbConnection();
		 
		try {
			Statement stmt=conn.createStatement(); 
			ResultSet result=stmt.executeQuery("SELECT `id`,`project_name`, `project_description` from projects");  
			
			String jsonStr="[";
			while(result.next()) {
				jsonStr=jsonStr+"{";
				jsonStr=jsonStr+"\"id\":"+result.getInt("id")+",";
				jsonStr=jsonStr+"\"name\":\""+result.getString("project_name")+"\",";
				jsonStr=jsonStr+"\"description\":\""+result.getString("project_description");
				jsonStr=jsonStr+"\"}";
				if(!result.isLast()) {
					jsonStr=jsonStr+",";
				}
			}
			
			jsonStr=jsonStr+ "]";
			PrintWriter out=response.getWriter();
			response.setContentType("application/json");
			//response.setContentType("text/html");
			out.println(jsonStr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("project.jsp?msg=error");  
		}  
		
	}
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		String msgStr = null;
		Connection conn = DbConnection.getDbConnection();
		
		try {
			Statement stmt = conn.createStatement();
			if(request.getParameter("id") != null) {
				int result = stmt.executeUpdate("DELETE FROM projects WHERE id="+request.getParameter("id"));
				msgStr = "{\"response\":\"success\"}";
			}else {
				msgStr = "{\"response\":\"error\",\"message\":\"please fill the Id\"}";
			}
			out.println(msgStr);
			}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	

}
