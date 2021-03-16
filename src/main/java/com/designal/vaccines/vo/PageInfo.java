package com.designal.vaccines.vo;

import java.util.List;

public class PageInfo <T>{
    /**
     * 当前页
     */
    private Integer pageNow;
    /**
     * 每页行数
     */
    private Integer limit;
    /**
     * 数据总记录数
     */
    private Integer counts;
    /**
     * 总页数
     */
    private Integer myPage;
    /**
     * 分页数据
     */
    private List<T> data;

    public PageInfo() {
    }

    public PageInfo(Integer pageNow, Integer limit, Integer counts, Integer myPage, List<T> data) {
        this.pageNow = pageNow;
        this.limit = limit;
        this.counts = counts;
        this.myPage = myPage;
        this.data = data;
    }

    /**
     * 获取
     * @return pageNow
     */
    public Integer getPageNow() {
        return pageNow;
    }

    /**
     * 设置
     * @param pageNow
     */
    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    /**
     * 获取
     * @return limit
     */
    public Integer getLimit() {
        return limit;
    }

    /**
     * 设置
     * @param limit
     */
    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    /**
     * 获取
     * @return counts
     */
    public Integer getCounts() {
        return counts;
    }

    /**
     * 设置
     * @param counts
     */
    public void setCounts(Integer counts) {
        this.counts = counts;
    }

    /**
     * 获取
     * @return myPage
     */
    public Integer getMyPage() {
        return myPage;
    }

    /**
     * 设置
     * @param myPage
     */
    public void setMyPage(Integer myPage) {
        this.myPage = myPage;
    }

    /**
     * 获取
     * @return data
     */
    public List<T> getData() {
        return data;
    }

    /**
     * 设置
     * @param data
     */
    public void setData(List<T> data) {
        this.data = data;
    }

    public String toString() {
        return "PageInfo{pageNow = " + pageNow + ", limit = " + limit + ", counts = " + counts + ", myPage = " + myPage + ", data = " + data + "}";
    }
}
