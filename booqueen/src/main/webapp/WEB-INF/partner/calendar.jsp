<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${contextPath}/resources/partner/css/calendar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<title>${hotel.hotelname}· 캘린더</title>
<script type="text/javascript">


 	var count =0;
 	var arr = new Array();
	function scheduleEvent(e) {		
		
		
		if($("#date"+e).hasClass('classColor')){
			$("#date"+e).removeClass('classColor')
			
			console.log("arr.length:" +arr.length)
			for(let i =0;i<arr.length;i++){
				console.log("e : "+e)
				console.log("arr[i] "+arr[i])
				if(arr[i] == e){
					arr.splice(i,1)
				}
			}
			
		}else{
			$("#date"+e).addClass('classColor')		
			arr.push(e)
			count+=1;
			
		}
		$("#scheduleArr").val(arr)
		console.log(" arr : "+ 	$("#scheduleArr").val())
		const firstNum = arr[0]
		const endNum = arr[arr.length-1]
		
		console.log("firstNum : "+firstNum)
		console.log("endNum : "+endNum)
		
		if(count == 2){
			alert("그만눌러!")
			console.log("(endNum-firstNum)- 1 :" + ((parseInt(endNum)-parseInt(firstNum))-1) )
			console.log("????????")
			const result =  ((parseInt(endNum)-parseInt(firstNum))-1)
			const real = parseInt(result)+parseInt(firstNum)
			for(let i=firstNum; i<real;i++){
				alert("firstNum+result :" +real)
				console.log("#date +i) :"+date+i)
				const please = parseInt(i)+1
				$("#date"+please).addClass('classColor')
				
				console.log("왜안들어가??"+"#date"+(i+1))
			}	
			
		}
		
	}
	
	$(function(){
		
		$( "input[name='open_date_start']" ).datepicker();
		$( "input[name='open_date_end']" ).datepicker();
	})
	
	
	
</script>
<style type="text/css">

.classColor{
		background-color: red!important;
}
table.scheduleTable {
	width: 100%;
	border-top: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

.scheduleTable th {
	border-left: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 5px;
}

body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-size: 9pt;
	color: #595959;
	cursor: pointer;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	width: 80%;
	margin: auto;
}

.navigation {
	margin-top: 100px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 1px solid white;
	height: 120px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}
li{
	list-style-type: none;
}
</style>

</head>

<body>
	<div class="main-container">
		<div class="content">
			<div class="home">
				<jsp:include page="/WEB-INF/partner/header.jsp" />
				<main class="main">
					<div class="bui-spacer">
						<div class="av-cal-header av-cal-header--fixed-max-width">
							<div class="av-cal-header-row">
								<div
									class="av-cal-header-row__section av-cal-header-row__section--primary">
									<div
										class="av-cal-header-row__element av-cal-header-row__element--flexible">
										<span class="bui-f-font-display_two"><span>캘린더</span></span>
									</div>
								</div>
								<div
									class="av-cal-header-row__section av-cal-header-row__section--secondary">
									<div
										class="av-cal-header-row__element av-cal-header-row__element--flexible">
										<div>
											<div class="bui-form__group">
												<label></label>
												<div class="bui-input-select">
													<select class="bui-form__control">
														<option value="MONTHLY">월별</option>
														<option value="MATRIX">객실 옵션별</option>
														<option value="YEARLY">연도별</option>
													</select>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
														class="bui-input-select__icon" style="user-select: auto;">
                                                        <path
															d="M12 20.09a1.24 1.24 0 0 1-.88-.36L6 14.61a.75.75 0 1 1 1.06-1.06L12 18.49l4.94-4.94A.75.75 0 0 1 18 14.61l-5.12 5.12a1.24 1.24 0 0 1-.88.36zm6-9.46a.75.75 0 0 0 0-1.06l-5.12-5.11a1.24 1.24 0 0 0-1.754-.006l-.006.006L6 9.57a.75.75 0 0 0 0 1.06.74.74 0 0 0 1.06 0L12 5.7l4.94 4.93a.73.73 0 0 0 .53.22c.2 0 .39-.078.53-.22z"
															style="user-select: auto;"></path>
                                                    </svg>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="av-monthly">
						<div class="av-monthly-layout">
							<div class="calendarWrap">
								<table class="calendarHeader">
								
									<tr>
										<td class="calendarHeaderLeft"></td>

										<td class="calendarHeaderYearAndMonth"><select
											class="calendarSelect" id="_calendarHeaderYear">
												<c:forEach begin="2020" end="2023" step="1" var="y">
													<option value="${y}">${y}</option>
												</c:forEach>
										</select>년 &nbsp;&nbsp;<select class="calendarSelect"
											id="_calendarHeaderMonth">
												<c:forEach begin="1" end="12" step="1" var="m">
													<option value="${m }">${m }</option>
												</c:forEach>
										</select>월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

										<td class="calendarHeaderRight"><a href="#none"
											title="이전 월" id="_showNextYear"
											onclick="changeYearAndMonth(2);">
												<button type="button"
													class="av-monthly__month-selector av-monthly-no-bui-button__text av-monthly-prev bui-button bui-button--secondary">
													<span class="bui-button__icon"> <svg
															fill="currentColor" focusable="false" viewbox="0 0 24 24"
															role="presentation" width="16" aria-hidden="true"
															height="16" class="bk-icon -streamline-arrow_nav_left"
															style="user-select: auto;">
                                                                    <path
																d="M14.55 18a.74.74 0 0 1-.53-.22l-5-5A1.08 1.08 0 0 1 8.7 12a1.1 1.1 0 0 1 .3-.78l5-5a.75.75 0 0 1 1.06 0 .74.74 0 0 1 0 1.06L10.36 12l4.72 4.72a.74.74 0 0 1 0 1.06.73.73 0 0 1-.53.22zm-4.47-5.72zm0-.57z"
																style="user-select: auto;"></path>
                                                                </svg>
													</span> <span class="bui-button__text"></span>
												</button>
										</a> <a href="#none" title="다음월" id="_showNextMonth"
											onclick="changeYearAndMonth(3);">
												<button type="button"
													class="av-monthly__month-selector av-monthly-no-bui-button__text av-monthly-next bui-button bui-button--secondary">
													<span class="bui-button__icon"> <svg
															fill="currentColor" viewbox="0 0 24 24" focusable="false"
															width="16" role="presentation" height="16"
															aria-hidden="true"
															class="bk-icon -streamline-arrow_nav_right"
															style="user-select: auto;">
                                                                    <path
																d="M9.45 6c.2 0 .39.078.53.22l5 5c.208.206.323.487.32.78a1.1 1.1 0 0 1-.32.78l-5 5a.75.75 0 0 1-1.06 0 .74.74 0 0 1 0-1.06L13.64 12 8.92 7.28a.74.74 0 0 1 0-1.06.73.73 0 0 1 .53-.22zm4.47 5.72zm0 .57z"
																style="user-select: auto;"></path>
                                                                </svg>
													</span> <span class="bui-button__text"></span>
												</button>
										</a> &nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="av-monthly-layout__main">
							<div class="av-monthly-layout">
								<span></span>
								<div class="av-monthly-container">
									<div class="av-monthly-container__grid">
										<form name="calendarFrm" id="calendarFrm" action="" method="GET">

		<div class="calendar">

			<!--날짜 네비게이션  -->
			<div class="navigation">
				<a class="before_after_year"
					href="calendar.pdo?year=${today_info.search_year-1}&month=${today_info.search_month}">
					&lt;&lt; <!-- 이전해 -->
				</a> <a class="before_after_month"
					href="calendar.pdo?year=${today_info.before_year}&month=${today_info.before_month}">
					&lt; <!-- 이전달 -->
				</a> 
				<span class="this_month" style="color: black;}"> &nbsp;${today_info.search_year}. 
					<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> 
				<a class="before_after_month"
					href="calendar.pdo?year=${today_info.after_year}&month=${today_info.after_month}">
					<!-- 다음달 --> &gt;
				</a> <a class="before_after_year"
					href="calendar.pdo?year=${today_info.search_year+1}&month=${today_info.search_month}">
					<!-- 다음해 --> &gt;&gt;
				</a>
			</div>

			<!-- <div class="today_button_div"> -->
			<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
			<!-- </div> -->
			<table class="calendar_body">

				<thead>
					<tr bgcolor="#CECECE">
						<td class="day sun">일</td>
						<td class="day">월</td>
						<td class="day">화</td>
						<td class="day">수</td>
						<td class="day">목</td>
						<td class="day">금</td>
						<td class="day sat">토</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<a href="#">
									<td class="today" id="date${dateList.date}" onmouseup="scheduleEvent('${dateList.date}')" >
										<ul class="date">
											<span>${dateList.date}</span>	
											<c:forEach var="available" items="${available}">	
 												<c:if test="${available.year eq dateList.year}"> 
													
													<c:if test="${available.month eq dateList.month+1}">
															<c:if test="${available.day eq dateList.date}">
																<li id="${available.sequence}">${available.type}</li>										
															</c:if>														
													</c:if>
												</c:if> 
											</c:forEach>	
										</ul>
										<div></div>
										</td>
										</a>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day" id="date${dateList.date}"  onclick="scheduleEvent('${dateList.date}')">
										<ul class="sat"><span>${dateList.date}</span>
									<c:forEach var="available" items="${available}">	
 												<c:if test="${available.year eq dateList.year}"> 													
													<c:if test="${available.month eq dateList.month+1}">
															<c:if test="${available.day eq dateList.date}">
																<li id="${available.sequence}">${available.type}</li>										
															</c:if>														
													</c:if>
												</c:if>
											</c:forEach>	
										</ul>
										<div></div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
					</tr>
					<tr>
									<td class="sun_day"  id="date${dateList.date}"  onclick="scheduleEvent('${dateList.date}')">
										<ul class="sun"><span>${dateList.date}</span>
											<c:forEach var="available" items="${available}">	
 												<c:if test="${available.year eq dateList.year}"> 
													
													<c:if test="${available.month eq dateList.month+1}">
															<c:if test="${available.day eq dateList.date}">
																<li id="${available.sequence}">${available.type}</li>										
															</c:if>														
													</c:if>
 												</c:if> 
											</c:forEach>	
										</ul>
										<div></div>
									</td>
								</c:when>
								<c:otherwise>
									<td class="normal_day"  id="date${dateList.date}"  onclick="scheduleEvent('${dateList.date}')">
										<ul class="date"><span>${dateList.date}</span>
												<c:forEach var="available" items="${available}">	
												<c:if test="${available.year eq dateList.year}"> 
													
													<c:if test="${available.month eq dateList.month+1}">
														
															<c:if test="${available.day eq dateList.date}">
																<li id="${available.sequence}">${available.type}</li>										
															</c:if>														
													</c:if>
												</c:if> 
											</c:forEach>	
										</ul>
										<div></div>
									</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</tbody>

			</table>
		</div>
	</form>
									</div>
									<div class="av-monthly-container__form">
										<form action="update-calendar.pdo" method="POST">
											<div
												class="av-monthly-container__block av-monthly__hide-medium">
												<div data-tour-onboarding="datepicker">
													<div class="bui-spacer--large">
														<div class="bui-spacer--small">
															<strong><span>7개 날짜 선택됨</span></strong>
														</div>
														<div class="ext-datepicker__wrap">
															<div class="ext-datepicker__text-input bui-form__group">
																<label><span>시작일</span></label>
																<div
																	class="input-group input-daterange bui-input__group bui-text-input__group bui-text-inpu__group--prepend">
																	<div class="bui-input__addon">
																		<svg focusable="false" width="16" aria-hidden="true"
																			role="presentation" fill="currentColor" height="16"
																			viewBox="0 0 128 128" slot="icon"
																			class="av-monthly__datepicker-icon bk-icon -streamline-calendar_check_in"
																			style="user-select: auto;">
                                                                        <path
																				d="M116 16H96V4a4 4 0 0 0-8 0v12H40V4a4 4 0 0 0-8 0v12H12C5.373 16 0 21.373 0 28v88c0 6.627 5.373 12 12 12h104c6.627 0 12-5.373 12-12V28c0-6.627-5.373-12-12-12zm4 100a4 4 0 0 1-4 4H12a4 4 0 0 1-4-4V28a4 4 0 0 1 4-4h20v8a4 4 0 0 0 8 0v-8h48v8a4 4 0 0 0 8 0v-8h20a4 4 0 0 1 4 4zm-20-68H52a4 4 0 0 0-4 4v20H28a4 4 0 0 0-4 4v24a4 4 0 0 0 4 4h72a4 4 0 0 0 4-4V52a4 4 0 0 0-4-4zm-4 24H80V56h16zm-64 8h16v16H32zm24 0h16v16H56zm24 16V80h16v16z"
																				style="user-select: auto;"></path>
                                                                    </svg>
																	</div>
																	<input class="form-control bui-form__control"
																		placeholder="2022년 3월 9일" name="open_date_start">
																</div>
															</div>
														</div>
													</div>
													<div class="bui-spacer--large"></div>
													<div class="av-monthly-expandable__wrap">
														<div class="ext-datepicker__wrap">
															<div class="ext-datepicker__text-input bui-form__group">
																<label><span>종료일</span></label>
																<div
																	class="input-group input-daterange bui-input__group bui-text-input__group bui-text-input__group--prepend">
																	<div class="bui-input__addon">
																		<svg viewBox="0 0 128 128" fill="currentColor"
																			height="16" role="presentation" aria-hidden="true"
																			width="16" focusable="false" slot="icon"
																			class="av-monthly__datepicker-icon bk-icon -streamline-calendar_check_out"
																			style="user-select: auto;">
                                                                        <path
																				d="M116 16H96V4a4 4 0 0 0-8 0v12H40V4a4 4 0 0 0-8 0v12H12C5.373 16 0 21.373 0 28v88c0 6.627 5.373 12 12 12h104c6.627 0 12-5.373 12-12V28c0-6.627-5.373-12-12-12zm4 100a4 4 0 0 1-4 4H12a4 4 0 0 1-4-4V28a4 4 0 0 1 4-4h20v8a4 4 0 0 0 8 0v-8h48v8a4 4 0 0 0 8 0v-8h20a4 4 0 0 1 4 4zm-20-68H52a4 4 0 0 0-4 4v20H28a4 4 0 0 0-4 4v24a4 4 0 0 0 4 4h72a4 4 0 0 0 4-4V52a4 4 0 0 0-4-4zm-4 24H80V56h16zM72 56v16H56V56zM32 80h16v16H32zm24 0h16v16H56z"
																				style="user-select: auto;"></path>
                                                                    </svg>
																	</div>
																	<input class="form-control bui-form__control"
																		placeholder="2022년 3월 1일" name="open_date_end">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="av-monthly-container__block">
												<div data-tour-onboarding="open-close">
													<div class="bui-spacer--medium">
														<span>객실 Open/Close</span>
													</div>
													<div class="bui-spacer--large">
														<div class="bui-group bui-group--inline bui-group--large">
															<div class="bui-form__group">
																<label class="bui-radio"> <input type="radio"
																	class="bui-radio__input" name="open"> <span
																	class="bui-radio__label"> <span>예약 가능</span>
																</span>
																</label>
															</div>
															<div class="bui-form__group">
																<label class="bui-radio"> <input type="radio"
																	class="bui-radio__input" name="open"> <span
																	class="bui-radio__label"> <span>예약 불가</span>
																</span>
																</label>
															</div>
														</div>
													</div>
												</div>
												<div class="bui-spacer--medium">
													<div class="bui-spacer--medium">
														<hr class="bui-divider">
													</div>
													<div>
														<div class="bui-spacer--medium">
															<div class="bui-spacer--medium bui-form__group">
																<label><span>판매 수량 선택</span></label>
																<div class="bui-input-select">
																	<select name="available" class="bui-form__control">
																		<option value=0>잔여 옵션 0개</option>
																		<option value=1>잔여 옵션 1개</option>
																	</select>
																	<svg xmlns="http://www.w3.org/2000/svg"
																		viewBox="0 0 24 24" class="bui-input-select__icon"
																		style="user-select: auto;">
                                                                        <path
																			d="M12 20.09a1.24 1.24 0 0 1-.88-.36L6 14.61a.75.75 0 1 1 1.06-1.06L12 18.49l4.94-4.94A.75.75 0 0 1 18 14.61l-5.12 5.12a1.24 1.24 0 0 1-.88.36zm6-9.46a.75.75 0 0 0 0-1.06l-5.12-5.11a1.24 1.24 0 0 0-1.754-.006l-.006.006L6 9.57a.75.75 0 0 0 0 1.06.74.74 0 0 0 1.06 0L12 5.7l4.94 4.93a.73.73 0 0 0 .53.22c.2 0 .39-.078.53-.22z"
																			style="user-select: auto;"></path>
                                                                    </svg>
																</div>
															</div>
														</div>
													</div>
													<div class="bui-spacer--medium">
														<hr class="bui-divider">
													</div>
												</div>
												<div>
													<span>요금</span>
													<div class="bui-spacer--largest">
														<div class="bui-spacer--small bui-f-color-grayscale">Standard
															Rate</div>
														<div
															class="bui-spacer--small bui-group bui-group bui-group--inline bui-group--large">
															<div class="bui-form__group">
																<label class="bui-radio"> <input type="radio"
																	class="bui-radio__input" name="standard"> <span
																	class="bui-radio__label"> <span>예약 가능</span>
																</span>
																</label>
															</div>
															<div class="bui-form__group">
																<label class="bui-radio"> <input type="radio"
																	class="bui-radio__input" name="standard"> <span
																	class="bui-radio__label"> <span>예약 불가</span>
																</span>
																</label>
															</div>
														</div>
														<div>
															<div class="bui-form__group">
																<div
																	class="bui-input__group bui-text-input__group bui-text-input__group--prepend">
																	<div class="bui-input__addon">KRW</div>
																	<input type="text" value="${room.price}"
																		name="standard_price"
																		class="bui-form__control av-monthly__segmented--middle">
																	<div
																		class="bui-input__addon av-monthly__right-bui-addon">
																		<button type="button"
																			class="bui-button bui-button--secondary">
																			<span class="bui-button__icon"> <svg
																					width="16" height="16" fill="currentColor"
																					viewBox="0 0 24 24" role="presentation"
																					aria-hidden="true" focusable="false"
																					class="bk-icon -streamline-person_half"
																					style="user-select: auto;">
                                                                                    <path
																						d="M16.5 6a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0zM18 6A6 6 0 1 0 6 6a6 6 0 0 0 12 0zM3 23.25a9 9 0 1 1 18 0 .75.75 0 0 0 1.5 0c0-5.799-4.701-10.5-10.5-10.5S1.5 17.451 1.5 23.25a.75.75 0 0 0 1.5 0z"
																						style="user-select: auto;">
                                                                                    </path>
                                                                                </svg>
																			</span> <span class="bui-button__text">4</span>
																		</button>
																	</div>
																</div>
															</div>
														</div>
														<a href="#" class="bui-link bui-link-primary"><span>제한사항</span></a>
													</div>
													<div class="bui-spacer--largest">
														<div class="bui-spacer--small bui-f-color-grayscale">
															Non-refundable Rate</div>
														<div
															class="bui-spacer--small bui-group bui-group--inline bui-group--large">
															<div class="bui-form__group">
																<label class="bui-radio"> <input type="radio"
																	class="bui-radio__input" name="non_refund"> <span
																	class="bui-radio__label"> <span>예약 가능</span>
																</span>
																</label>
															</div>
															<div class="bui-form__group">
																<label class="bui-radio"> <input type="radio"
																	class="bui-radio__input" name="non_refund"> <span
																	class="bui-radio__label"> <span>예약 불가</span>
																</span>
																</label>
															</div>
														</div>
														<div>
															<div class="bui-form__group">
																<div
																	class="bui-input__group bui-text-input__group bui-text-input__group--prepend">
																	<div class="bui-input__addon">KRW</div>
																	<input type="text" name="non_refundable_price"
																		class="bui-form__control av-monthly__segmented--middle">
																	<div
																		class="bui-input__addon av-monthly__right-bui-addon">
																		<button type="button"
																			class="bui-button bui-button--secondary">
																			<span class="bui-button__icon"> <svg
																					width="16" height="16" fill="currentColor"
																					viewBox="0 0 24 24" role="presentation"
																					aria-hidden="true" focusable="false"
																					class="bk-icon -streamline-person_half"
																					style="user-select: auto;">
                                                                                    <path
																						d="M16.5 6a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0zM18 6A6 6 0 1 0 6 6a6 6 0 0 0 12 0zM3 23.25a9 9 0 1 1 18 0 .75.75 0 0 0 1.5 0c0-5.799-4.701-10.5-10.5-10.5S1.5 17.451 1.5 23.25a.75.75 0 0 0 1.5 0z"
																						style="user-select: auto;">
                                                                                    </path>
                                                                                </svg>
																			</span> <span class="bui-button__text">4</span>
																		</button>
																	</div>
																</div>
															</div>
														</div>
														<a href="#" class="bui-link bui-link--primary"><span>제한사항</span></a>
													</div>
												</div>
												<div>
													<div class="bui-f-font-caption bui-spacer--medium">
														<div class="bui-spacer--medium">
															<hr class="bui-divider bui-divider--light">
														</div>
														<span>다음 날짜에 변경사항이 적용됩니다: 2022년 2월 6일</span>
													</div>
													<div
														class="av-monthly__form-btn-wrap av-monthly-flex-inline__wrap">
														<button type="button" disabled="disabled"
															class="av-monthly-flex-inline__item--equal bui-button bui-button--secondary bui-button--wide">
															<span class="bui-button__text"><span>취소</span></span>
														</button>
														<button type="submit"
															class="av-monthly-flex-inline__item--equal bui-button bui-button--primary bui-button--wide">
															<span class="bui-button__text"><span>저장</span></span>
														</button>
													</div>
												</div>
										</form>
									</div>
									<div class="av-monthly-container__block">
										<div class="bui-spacer--small">
											<span class="bui-f-font-strong">최종 업데이트</span>
										</div>
										<div class="bui-f-font-caption">
											<div class="bui-spacer--small"></div>
											<div class="bui-f-color-complement">
												<svg width="16" height="16" aria-hidden="true"
													fill="currentColor" focusable="false" role="presentation"
													viewBox="0 0 24 24" class="bk-icon -streamline-warning"
													style="user-select: auto;">
                                                        <path
														d="M12 15.75A1.125 1.125 0 1 0 12 18a1.125 1.125 0 0 0 0-2.25.75.75 0 0 0 0 1.5.375.375 0 1 1 0-.75.375.375 0 0 1 0 .75.75.75 0 0 0 0-1.5zm.75-2.25V5.25a.75.75 0 0 0-1.5 0v8.25a.75.75 0 0 0 1.5 0zM22.5 12c0 5.799-4.701 10.5-10.5 10.5S1.5 17.799 1.5 12 6.201 1.5 12 1.5 22.5 6.201 22.5 12zm1.5 0c0-6.627-5.373-12-12-12S0 5.373 0 12s5.373 12 12 12 12-5.373 12-12z"
														style="user-select: auto;"></path>
                                                    </svg>
												<span>캘린더 업데이트가 필요합니다.</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
			<input type="hidden" id="scheduleArr">
			<script>
              		//calendar에서 선택된 날짜 받아오기
                </script>
			<script>
                	//예약가능, 예약불가 버튼 동시 선택 제어하기
                	$("input:radio[name='open']:radio[value='yes']").prop('checked', true);
                	$("input:radio[name='open']:radio[value='no']").prop('checked', false);
                	$("input:radio[name='standard']:radio[value='yes']").prop('checked', true);
                	$("input:radio[name='standard']:radio[value='no']").prop('checked', false);
                	$("input:radio[name='non_refund']:radio[value='yes']").prop('checked', true);
                	$("input:radio[name='non_refund']:radio[value='no']").prop('checked', false);
                	
                	//(미완성) 예약 불가 선택시 textfield disabled 적용
//                 	if("input:radio[name='standard']:radio[value='no']").prop('checked', false) {
//                 		$('input[name="refundable"]').setAttribute('disabled', disabled);
//                 	}
                	
                	
                	
                </script>
			<jsp:include page="/WEB-INF/partner/footer.jsp" />
		</div>
	</div>
</body>

</html>