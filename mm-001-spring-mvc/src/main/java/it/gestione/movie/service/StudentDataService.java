package it.gestione.movie.service;

import it.gestione.common.dto.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentDataService {
	 
	 public static List<Student> getStudentList() {
	 
	  List<Student> listOfStudent = new ArrayList<Student>();
	 
	  Student aStudent = new Student();
	 
	  for (int i = 1; i <= 200; i++) {
	 
	   aStudent = new Student();
	 
	   aStudent.setName("Sandeep" + i);
	 
	   aStudent.setMark("20" + i);
	 
	   listOfStudent.add(aStudent);
	  }
	 
	  return listOfStudent;
	 
	 }
	}
