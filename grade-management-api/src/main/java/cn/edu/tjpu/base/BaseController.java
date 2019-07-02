package cn.edu.tjpu.base;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;


public class BaseController {
    private final static Log LOG = LogFactory.getLog(BaseController.class);
    private final static String SEPARATOR = ",";

    @ExceptionHandler({Exception.class})
    public ResponseData exceptionHandler(Exception e) {
        LOG.error(e.getMessage(), e);
        return ResponseData.fail("系统内部错误", ResponseCode.SERVER_ERROR_CODE.getCode());
    }

    @ExceptionHandler({MethodArgumentNotValidException.class})
    public ResponseData validExceptionHandler(MethodArgumentNotValidException e) {
        StringBuilder sb = new StringBuilder("参数验证异常：");
        for (FieldError fieldError : e.getBindingResult().getFieldErrors()) {
            sb.append(fieldError.getField())
                    .append(fieldError.getDefaultMessage()).append(SEPARATOR);
        }
        LOG.error(e.getMessage(), e);
        return ResponseData.fail(sb.toString(), ResponseCode.PARAM_ERROR_CODE.getCode());

    }
    @ExceptionHandler({BindException.class})
    public ResponseData validExceptionHandler(BindException e) {
        StringBuilder sb = new StringBuilder("参数验证异常：");
        for (FieldError fieldError : e.getBindingResult().getFieldErrors()) {
            sb.append(fieldError.getField())
                    .append(fieldError.getDefaultMessage()).append(SEPARATOR);
        }
        LOG.error(e.getMessage(), e);
        return ResponseData.fail(sb.toString(), ResponseCode.PARAM_ERROR_CODE.getCode());

    }


    /**
     * @return
     * @描述 : 获取request请求的IP地址
     * @创建者：cr-pmp
     * @创建时间： 2014-5-4上午11:47:46
     */
    protected String getRemoteIPs() {
        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
        String ip = request.getHeader("x-forwarded-for");
        if (StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (StringUtils.isNotBlank(ip) && ip.contains(",")) {
            ip = ip.substring(0, ip.indexOf(","));
        }
        if (ip != null) {
            return ip.split(":")[0];
        }
        return null;
    }
    /**
     * 功能描述: 通过token获取teacherId
     * @auther: zhuangy
     * @date: 2019/6/11 13:12
     */
    protected String getAuth(){
        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
        String auth = request.getHeader("Authorization");
        return auth;
    }

}
