<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>파트너 상세정보</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <style type="text/css">
            table.type02 {
              border-collapse: separate;
              border-spacing: 0;
              text-align: left;
              line-height: 1.5;
              border-top: 1px solid #ccc;
              border-left: 1px solid #ccc;
              margin : 20px 10px;
            }
            table.type02 th {
              width: 250px;
              padding: 10px;
              font-weight: bold;
              vertical-align: top;
              border-right: 1px solid #ccc;
              border-bottom: 1px solid #ccc;
              border-top: 1px solid #fff;
              border-left: 1px solid #fff;
              background: #eee;
            }
            table.type02 td {
              width: 90%;
              padding: 10px;
              vertical-align: top;
              border-right: 1px solid #ccc;
              border-bottom: 1px solid #ccc;
            }
            table.type02 td >input{
                width: 100%;
                height: 100%;
                border: none;
                resize: none;
            }
            textarea {
                width: 100%;
                height: 100%;
                border: none;
                resize: none;
            }
            textarea:focus, input:focus{
                outline: none;
            } 
            </style>
    </head>
    <body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${contextPath }/userMember.mdo">Start Bootstrap</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout.mdo">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
       	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						
						
						<div class="sb-sidenav-menu-heading">Interface</div>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts2" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts2"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath }/userMember.mdo">회원 목록</a> <a
									class="nav-link" href="${contextPath }/reportedUser.mdo">신고 및 이용이 제한된 회원
									관리</a> 
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts5" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 호텔 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts5"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath }/hotelList.mdo">호텔 목록</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts3" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 파트너 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts3"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath }/PartnerMember.mdo">파트너 목록</a> <a
									class="nav-link" href="${contextPath }/blockPartnerList.mdo">파트너 계정 차단</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts4" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 사이트 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts4"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath }/faq.mdo">문의 게시판</a> <a
									class="nav-link" href="${contextPath }/banner.mdo">추천 여행지(배너)</a> <a
									class="nav-link" href="${contextPath }/terms.mdo">이용 약관 관리</a>
							</nav>
						</div>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 재무
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath }/reservationStatus.mdo">예약 현황 관리</a> <a
									class="nav-link" href="${contextPath }/transactionHistory.mdo">거래 내역 리스트</a> <a
									class="nav-link" href="${contextPath }/payment.mdo">대금 지급 관리</a>
							</nav>
						</div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
                    </div>
            <div id="layoutSidenav_content">   
                <main>
                    <div class="container-fluid px-4">
        
                        <!-- 여기만 수정해서 사용하세요!! -->
                        <h1 class="mt-4">파트너 정보</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <div class="col three">
                                    <div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
                                        파트너 정보
                                    </div>							
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="" name="goodsForm" method="POST" enctype="multipart/form-data">
                                    <table class="type02">
                                        <tr>
                                            <th>이름</th>
                                            <td><input type="text" name="partner_name" style="width: 100%; height: 100%" readonly value="장진아"></td>
                                        </tr>
                                        <tr>    
                                            <th scope="row">이메일</th>
                                            <td><input type="text" name="partner_email" readonly value="abc@def.com"></td>
                                        </tr>                              
                                        <tr>
                                            <th>전화번호</th>
                                            <td><input type="text" name="partner_Phone"  readonly value="010-1234-1234"></td>
                                        </tr>
                                        <tr>    
                                            <th scope="row">생년월일</th>
                                            <td><input type="text" name="partner_email" readonly value="1991-01-01"></td>
                                        </tr>           
                                        <tr>
                                            <th>활성화</th>
                                            <td>
                                                <input type="text" readonly value="비활성화">
                                            </td>
                                        </tr>                                  
                                    </table>
                                        
                                </form>
                                
                            </div>
                        </div>
                        <!-- -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                파트너님의 호텔
                            </div>
                            <div class="card-body">
                            <form action="" name="goodsForm" method="POST" enctype="multipart/form-data">
                                <table id="datatablesSimple">
                                    <!--#   시리얼넘버      호텔이름      담당자      연락처       주소      활성화 여부-->
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>시리얼넘버</th>
                                            <th>호텔이름</th>
                                            <th>담당자</th>                                              
                                            <th>연락처</th>
                                            <th>주소</th>
                                            <th>활성화</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" readonly value="1"></td>
                                            <td><input type="text" readonly value="111"></td>
                                            <td><input type="text" readonly value="abc호텔"></td>
                                            <td><input type="text" readonly value="장진아"></td>
                                            <td><input type="text" readonly value="02-111-111"></td>
                                            <td><input type="text" readonly value="서울특별시 강남구"></td>
                                            <td><input type="text" readonly value="비활성화"></td>    
                                        </tr>
                                        <tr>
                                            <td><input type="text" readonly value="2"></td>
                                            <td><input type="text" readonly value="112"></td>
                                            <td><input type="text" readonly value="bbc호텔"></td>
                                            <td><input type="text" readonly value="최태원"></td>
                                            <td><input type="text" readonly value="02-222-222"></td>
                                            <td><input type="text" readonly value="서울특별시 마포구"></td>
                                            <td><input type="text" readonly value="비활성화"></td>    
                                        </tr>
                                        <tr>
                                            <td><input type="text" readonly value="3"></td>
                                            <td><input type="text" readonly value="113"></td>
                                            <td><input type="text" readonly value="cbc호텔"></td>
                                            <td><input type="text" readonly value="김상민"></td>
                                            <td><input type="text" readonly value="02-333-333"></td>
                                            <td><input type="text" readonly value="서울특별시 종로구"></td>
                                            <td><input type="text" readonly value="비활성화"></td>
                                        </tr>
                                    </tbody>
                                </table>
                               </form> 
                            </div>
                        </div>
                        <!-- 여기만 수정해서 사용하세요!! -->
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/admin/javascript/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/admin/javascript/datatables-simple-demo.js"></script>
    </body> 
</html>
