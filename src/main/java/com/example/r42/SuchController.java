package com.example.r42;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

@RestController
public class SuchController {

//     @Value("${suchname}") private String suchName;
//     // @Value("${date_api_host}") private String date_api_host;
//     // @Value("${date_api_port}") private String date_api_port;
//     // 	@RequestMapping("/hello")
//     // 	public String suchHello(){
//     // 		return "hello " + suchName;
//     // 	}
//     // }

//     RestTemplate restTemplate = new RestTemplate();

//     String azUrl = "http://169.254.169.254/latest/meta-data/placement/availability-zone";
//     String azName = restTemplate.getForObject(azUrl, String.class);
    
//     String dateUrl = "http://" + System.getenv("date_api_host") + ":" + System.getenv("date_api_port") + "/date";

//     // ResponseEntity < String > response = restTemplate.getForEntity("http://" + date_api_host + ":" + date_api_port + "/date", String.class);
    
//     ResponseEntity < String > response = restTemplate.getForEntity(dateUrl, String.class);
//     String date = response.getBody();

//     @RequestMapping("/hello")
//     public String suchHello() {
//         return "hello from " + azName + " az, the server local time is " + date;
//     }
// }


    @Value("${suchname}") private String suchName;

    @RequestMapping("/hello")
    public String suchHello(){

        String azUrl = "http://169.254.169.254/latest/meta-data/placement/availability-zone";
        String timeUrl = "http://" + System.getenv("date_api_host") + ":" + System.getenv("date_api_port") + "/date";
        RestTemplate restTemplate = new RestTemplate();

        String result = restTemplate.getForObject(timeUrl, String.class);
        String azName = restTemplate.getForObject(azUrl, String.class);

        return "Hello from " + azName + " az, the server local time is " + result;
    }
}