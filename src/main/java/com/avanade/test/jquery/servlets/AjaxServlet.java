package com.avanade.test.jquery.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

// http://javabelazy.blogspot.it/2012/08/jquery-ajax-call-to-servlet-example.html

public class AjaxServlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 int []sampleData=null;
         //sampleData= here you can get data from database

         //writing data to json
         response.setContentType("application/json;charset=utf-8");

         JSONObject json = new JSONObject();
         JSONArray array = new JSONArray();
         JSONObject member =  new JSONObject();

         member.put("arrayData", sampleData);
         member.put("site","avanade.com");
         member.put("content","Company");
         member.put("TotalLinks",927);
         array.add(member);

         json.put("jsonArray", array);

         PrintWriter pw = response.getWriter(); 
         pw.print(json.toString());
         pw.close();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(" inside do post "+request.getParameter("message"));
    }

}

