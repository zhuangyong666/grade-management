package cn.edu.tjpu.base;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: Page
 * @Description: TODO
 * @Author: zhuangy
 * @Date: 2019-06-08 09:54
 **/
public class Page<T> implements Serializable {
    @NotNull(message = "参数不能为空")
    private Integer pageNum;
    @NotNull(message = "参数不能为空")
    private Integer pageSize;
    private T params;
    private Long total;
    private List<T> result;

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public T getParams() {
        return params;
    }

    public void setParams(T params) {
        this.params = params;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }
}
