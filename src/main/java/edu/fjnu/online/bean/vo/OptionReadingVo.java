package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;

@Data
public class OptionReadingVo {
    private Integer id;
    private String itemCode;//ABCD
    private  String itemName;
    private Integer orderNum;
}
