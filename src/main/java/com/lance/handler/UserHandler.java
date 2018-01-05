package com.lance.handler;


import com.lance.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by lance on 2018/1/3.
 */
@Controller
@RequestMapping("/user")
public class UserHandler {

    @Autowired
    UserService userService;

    @RequestMapping("/test")
    public String test(){
        System.out.println("test");
        System.out.println(userService.findUser(1));
        return "success";
    }

    @RequestMapping("loginPage")
    public String returnLoginPage(){
        return "login";
    }


    @RequestMapping(value = "login")
    public String login(@RequestParam(required = false) String error){
        if(error!=null)
            System.out.println(error);
            return "login";
    }


    @RequestMapping("/service")
    public String service(){
        return "service";
    }


    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }
    //权限不够跳转页面
    @RequestMapping(value = "/403",method = RequestMethod.GET)
    public ModelAndView accessDenied(@RequestParam(value = "error", required = false) String error){
        if(error!=null){
            System.out.println(error);
        }
        ModelAndView model = new ModelAndView( );
        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("403");
        return model;
    }
}
