package iuh.edu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ElectricShopApplication {

    public static void main(String[] args) {
        SpringApplication.run(ElectricShopApplication.class, args);
    }

}
