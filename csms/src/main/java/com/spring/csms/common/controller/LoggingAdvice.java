package com.spring.csms.common.controller;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggingAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);
	
//	@Around("execution(* com.spring.csms..*.*(..))")
//	public void timeLog(ProceedingJoinPoint pjp) throws Throwable {
//		
//		long startTime = System.currentTimeMillis();
//		
//		pjp.proceed();
//		
//		long endTime = System.currentTimeMillis();
//	
//		logger.info("[메서드 실행속도] " + pjp.getSignature().getName() + " : " + (endTime - startTime) + "초");
//	}
}
