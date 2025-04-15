package com.example.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthInterceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        // 模擬檢查 session
        Object user = invocation.getInvocationContext().getSession().get("user");
        if (user == null) {
            return "login";
        }
        return invocation.invoke();
    }
}
