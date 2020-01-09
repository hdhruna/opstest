package com.example.r42;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

@RestController
public class SuchController {

    @Value("${suchname}") private String suchName;

    @RequestMapping("/hello")
    public String suchHello(){

        String timeUrl = "http://" + System.getenv("timeUrl") + "/date";
        RestTemplate restTemplate = new RestTemplate();

        String result = restTemplate.getForObject(timeUrl, String.class);
        String azName = System.getenv("AWS_AZ");
        String envName = System.getenv("getENV");

        return "Hello from " + azName + " az, the containers local time is " + result + " in " + envName + " environment";
    }
}
