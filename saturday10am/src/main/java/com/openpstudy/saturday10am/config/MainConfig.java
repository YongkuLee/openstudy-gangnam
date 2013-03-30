package com.openpstudy.saturday10am.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ComponentScan(basePackages = "com.openpstudy.saturday10am", excludeFilters = { @Filter(Configuration.class) })
@PropertySource("classpath:com/openpstudy/saturday10am/config/application.properties")
public class MainConfig {

}
