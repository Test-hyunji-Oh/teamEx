package com.booqueen.partner.room;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RoomAvailableVO {
	
	private int sequence;
	private int room_id;
	private Date open_date;
	private int standard_price;
	private int non_refundable_price;
	private int available;
	
	///
	private String type;
	private String day;
	private Integer month;
	private Integer year;
}
