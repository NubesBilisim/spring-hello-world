package com.nubes.springhelloworld;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldService {

    @RequestMapping("/hello")
    public String hello() {
        return "Hello World";
    }
}
