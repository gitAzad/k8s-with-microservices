package com.serv2.demo2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class Hello {

    @Autowired
    public RestTemplate restTemplate;

    @GetMapping("/")
    public String hello() {
        return "hello, microservice 2";
    }

    @GetMapping("/serv")
    public ResponseEntity<?> Serv1(@RequestParam String name) {
        String serviceUrl = String.format("http://serv%s-service:808%s/", name, name);
        ResponseEntity<String> response = restTemplate.getForEntity(serviceUrl, String.class);

        return response;
    }
}
