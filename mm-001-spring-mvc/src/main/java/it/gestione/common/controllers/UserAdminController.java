package it.gestione.common.controllers;

import it.gestione.movie.entity.Movie;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/useradm")
public class UserAdminController {
     
    
     
    /**
    * Fetch a the user list from the service, and package up into a Map that is 
    * compatible with datatables.net
    */
     
    @RequestMapping(method={RequestMethod.POST,RequestMethod.GET} ,value="/fetchtableall")
    public @ResponseBody Map<String, Object[]> findAllForTableView(){

//            Collection<Movie> users = iamService.listMovie();  
//
//            return Collections.singletonMap("aaData", getJSONForUser(users));
         return null;
    }
     
    /**
    * I only want certain user info..
    */
    public Object[] getJSONForUser(Collection<Movie> movies){
        Object[] rdArray = new Object[movies.size()];
        int i = 0;
//        for(Movie u : movies){
//            // [ name, id,arn,groups ]
//            Object[] us = 
//            		new String[]{u.getUser().getUserName(),u.getUser().getArn(),groupList(u.getGroups()),u.getUser().getUserId()}; 
//            rdArray[i] = us;
//            i++;            
//        }
        return rdArray;
    }   

}