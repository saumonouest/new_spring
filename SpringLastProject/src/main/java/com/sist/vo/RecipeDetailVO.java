package com.sist.vo;

import lombok.Data;

/*
 *  NO                                        NOT NULL NUMBER
 TITLE                                     NOT NULL VARCHAR2(1000)
 POSTER                                    NOT NULL VARCHAR2(500)
 CHEF                                      NOT NULL VARCHAR2(100)
 LINK                                               VARCHAR2(500)
 HIT                                                NUMBER
 */
@Data
public class RecipeDetailVO {
   private int no;
   private String title,poster,chef, chef_poster, chef_profile, info1, info2, info3, content, foodmake, data;
}