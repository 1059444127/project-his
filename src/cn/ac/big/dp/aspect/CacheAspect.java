package cn.ac.big.dp.aspect;

import java.util.List;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.aspectj.lang.ProceedingJoinPoint;

import cn.ac.big.dp.bean.Condition;


public class CacheAspect {
	
	private Cache cache;
	public Cache getCache() {
		return cache;
	}
	public void setCache(Cache cache) {
		this.cache = cache;
	}

	public Object selectFromCache(ProceedingJoinPoint pjp) throws Throwable {
		String str = pjp.toLongString();
		System.out.println(str+":"+pjp.getSignature());
		@SuppressWarnings("unchecked")
		List<Condition> condList = (List<Condition>) pjp.getArgs()[0];
		String key = Integer.toString((Integer)pjp.getArgs()[1]);
		for(Condition condition:condList) {
			key += condition.toString();
		}
		Object result = null;
		if(cache.get(key)!=null) {
			System.out.println("命中缓存目标:"+key);
			result = cache.get(key).getObjectValue();
			return result;
		} else {
			System.out.println("数据库第一次读取,存入缓存中:"+key);
			result = pjp.proceed();
			Element e = new Element(key, result);
			cache.put(e);
			return result;
		}
	}
	
}
