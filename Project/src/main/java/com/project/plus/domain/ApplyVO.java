package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApplyVO {
	private int applyNum;
	private int memberNum;
	private int clubNum;
	private Date applyDate;
}
