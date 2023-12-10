package io.hcmute.springbootstarter.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import io.hcmute.springbootstarter.services.UsersService;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private UsersService userService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(userService);
		auth.setPasswordEncoder(passwordEncoder());
		return auth;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().anyRequest().permitAll().and().csrf().disable();

//		http.authorizeRequests()
//				// Cho phép truy cập tất cả các tệp tĩnh từ các thư mục "css", "js", "images",
//				// và "fonts"
//				.antMatchers("/css/**", "/js/**", "/images/**", "/fonts/**","/img","/jsp").permitAll()
//				.antMatchers("/", "/giohang", "/api/payment/payment_infor").permitAll()
//				.antMatchers("/detail", "/detailp").permitAll().antMatchers("/api/payment/create_payment/**")
//				.permitAll().antMatchers(HttpMethod.POST, "/giohang", "/detail").permitAll().anyRequest()
//				.authenticated().and().formLogin().loginPage("/login").permitAll().and().logout()
//				.invalidateHttpSession(true).clearAuthentication(true)
//				.logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login?logout")
//				.permitAll();
	}
}
