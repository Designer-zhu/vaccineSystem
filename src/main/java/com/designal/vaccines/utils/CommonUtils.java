package com.designal.vaccines.utils;

import java.util.UUID;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/2/25 13:36
 */
public class CommonUtils {

    //产生随机字符串
    public static String getUUID(){
        return UUID.randomUUID().toString();
    }
}
