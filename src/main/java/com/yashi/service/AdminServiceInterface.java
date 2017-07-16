package com.yashi.service;

import java.util.List;

/**
 * Created by yashi on 16-07-2017.
 */
public interface AdminServiceInterface {

    default List<Object> fetchList(String... a)
    {
        return null;
    }
}
