package com.onegene.code.generate.config;

import com.onegene.code.generate.filter.BaseUrlInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new BaseUrlInterceptor()).addPathPatterns("/**").addPathPatterns("/**");
	}

}
