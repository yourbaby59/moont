<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/c96178233f.js" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <style>
    body {
      margin:0px;
    }
    #message { /* 메세지 부분 */
       width:100%;
       height:45px;
       background:black;
       margin:auto;
       color:white;
    }
    #message #left {
       text-align:center;
       padding-top: 14px;
       font-size: 13px;
    }
    
    /* 1층 마감  */
    
    header {
       width:100%;
       height:60px;
       margin:auto;
       background-color: white;
    }
    header #left {
       float:left;
       padding-top: px;
    }
    header #right { /* 아이콘 위치  */
       float:right;
       padding-right:30px;
       position:relative;
       font-size: 12px;
       word-spacing: 17px; /* 글자 간격 */
    }
    
     header a {
       text-decoration:none;
       color:black;
       display:inline-block;
       height:30px;
    }
        
    
    header #right #cu ul {
       position:absolute;
       left:73px;
       top:18px;
       border:1px solid #cccccc;
       padding-left:0px;
       padding:5px;
       display:none;
       color: white
    }
    
     #search { /* 검색창 만들기 */
     width: 300px;
     height: 30px;
}
    
    header #right #cu ul li {
       list-style-type:none;
       height:24px;
    }
    
    header #myinfo {
       position:absolute;
       top:20px;
       left:-10px;
       padding-left:0px;
       border:1px solid #cccccc;
       background:white;
       padding:5px;
       display:none;
    }
    header #myinfo li {
       list-style-type:none;
       width:110px;
       height:25px;
       text-align:center;
    }
    
    nav { /* 메뉴 네비게이션  */
       width:100%;
       height:70px;
       background-color: black;
       color: white;
       font-size: 8px;
       text-align: center;
    }
    nav .menu {
    
    }
    nav .menu > li {     /* 메뉴의 li */
      list-style-type:none;
      display:inline-block;
      width:130px;
      height:30px;
      font-size:17px;
      text-align:center;
    }
    nav .menu > li:first-child {   /* 메뉴의 li중에 첫번째 */
      position:relative;
 
    }
    nav .dae {    /* 대분류 메뉴 */
      position:absolute;
      left:17px;
      top:26px;
      padding-left:0px;
      border:1px solid #cccccc;
      background:white;
      display:none;
      color: black;
    }
    nav .dae > li {  /* 대분류 메뉴내의 li */
      list-style-type:none;
      width:82px;
      height:28px;
      text-align:center;
    /*   background:red; */
      padding:5px;
    }
    /* 중분류 관련 */
    nav .dae > li {     /* 대분류 메뉴 */ 
      position:relative;
    }
    nav .dae .jung {     /* 중분류 ul태그 */
      position:absolute;
      top:-1px;
      left:92px;
      padding-left:0px;
      background:white;
      border:1px solid #cccccc;
      
      display:none;
    }
    nav .dae .jung > li {  /* 중분류 메뉴 */
      list-style-type:none;
      width:82px;
      height:28px;
      padding:5px;
    }
    /*소분류 관련 */
    nav .dae .jung > li {
      position:relative;
    }
    nav .dae .jung .so {  /* 소분류 ul 태그 */
      position:absolute;
      left:92px;
      top:-1px;
      padding-left:0px;
      background:white;
      border:1px solid #cccccc;
      display:none;
    }
    nav .dae .jung .so li {  /* 소분류 메뉴 */
      list-style-type:none;
      width:82px;
      height:28px;
      padding:5px;
    }
    
    /* 검색창 만들기 
    nav .menu #outer {
      width:220px;
      border:1px solid #cccccc;
      padding:5px;
      border-radius:20px;
    }*/
    
    nav .menu > li:last-child {
      width:220px;
    }
    nav .menu > li input[type=text] {
      width:150px;
      border:none;
      outline:none;
      font-size:16px;
      
    }
    
   
    footer {
       width:1000px;
       height:100px;
       background:#D941C5;
       margin:auto;
    }
    
    /* 말풍선 */
    .wrap {text-align: center; margin-top: 1px;}
.chatbox {animation: motion 0.5s linear 0s infinite alternate; margin-top: 0;}
        
@keyframes motion {
	0% {margin-top: 0px;}
	100% {margin-top: 10px;}
}

  </style>

  
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script>
   $(function()
   {
 
	    $("nav #cate").mouseover(function()
	    {
	    	$("nav .dae").show();
	    });
	    $("nav #cate").mouseout(function()
   	    {
   	    	$("nav .dae").hide();
   	    });
	    
	    // 중분류메뉴 보이기
	    $("nav .dae > li").mouseover(function()  // 농산물, 수산물, 축산물, 가공품에 마우스가 올라오면
	    {
	    	//alert($(this).index());
	    	var n=$(this).index();
	    	$("nav .jung").eq(n).show();
	    });
	    $("nav .dae > li").mouseout(function()  // 농산물, 수산물, 축산물, 가공품에 마우스가 올라오면
   	    {
   	    	var n=$(this).index();
   	    	$("nav .jung").eq(n).hide();
   	    });	    
	    
	    // 소분류메뉴 보이기
	    $("nav .jung > li").mouseover(function()
	    {
	    	//alert($(this).index());
	    	var n=$(this).index();
	    	$("nav .so").eq(n).show();
	    });
	    $("nav .jung > li").mouseout(function()
   	    {
   	    	//alert($(this).index());
 	    	var n=$(this).index();
 	    	$("nav .so").eq(n).hide();
   	    });
	    
	   
	    $("header #my").mouseover(function()
	    {
	    	$("header #myinfo").show();
	    });
	    
	    $("header #my").mouseout(function()
   	    {
   	    	$("header #myinfo").hide();
   	    });
	    
   });

   
  </script>
  
  <decorator:head/>
  
</head>
<body>  <!-- index.jsp -->  
    <div id="message"> 
      <div id="left"> <a href=# style="text-decoration: none;">  <span style="color: white;"> 새로워진 회원혜택,</span> <span style="color: red;"> 최대 2만원 쿠폰팩 </span> <span style="color: white"> 지급  </span></a> </div>  
    </div>  <!-- 간단메시지 -->
    
    
    <header> 
      <div id="left"><a href="../main/index"> 
      <img src="../resources/simg/logo.png" width="140" > </a></div>
          
          <!-- 검색창
                      <div class="search" style="text-align: center">
                 <input type="text" id="search" placeholder="모두가 인정한 슬렉스 맛집 moont" style="font-size: 12px; border-bottom: 2px solid black; padding-bottom:30px;">
               <img src="../resources/simg/ss.png" width="24" valign="middle">
            </div>-->
          
          
      <div id="right" style="font-size: 12; padding-top: 5px"> 
      <img src="../resources/simg/pic.png" width="130"> <br> <!-- 아이콘  -->
        <a href="../member/memberinput">
        JOIN </a>
        <c:if test="${userid == null}">
        <a href="../login/login">
        LOGIN </a> 
        
       </c:if>
       <c:if test="${userid != null}">
          <span id="my" style="display:inline-block;height:34px;">${name}님!
          <ul id="myinfo">
            <li> <a href="../mypage/myinfo"> 회원정보 수정 </a></li>
            <li> 주문 조회 </li>
            <li> 적립금 조회 </li>
            <li> 나의 글확인 </li>
          </ul>
         </span>
        <a href="../login/logout"> logout </a>
       </c:if> 
        <a href="#" id="cu">     CART
          <ul>
            <li> 자주하는 질문 </li>
            <li> 1:1 상담 </li>
            <li> 긴급 상담 </li>
          </ul>
        </a>
     <!-- 말풍선 -->
	<div class="wrap">
		<img src="../resources/simg/bo.png" width="150px" class="chatbox">
	</div>        
                
        
      </div> <!-- div right 마감  -->
      
    </header>  <!-- 로고, 로그인,회원가입 -->
    
    
    <nav> 
      <ul class="menu">
        <li id="cate"> MADE 
          <ul class="dae">
             <li> <a href="../product/pro_list?pcode=p01"> 농산물 </a> 
               <ul class="jung">
                 <li> <a href="../product/pro_list?pcode=p0101"> 야채류 </a> 
                   <ul class="so">
                     <li> <a href="../product/pro_list?pcode=p010101"> 쌈채소 </a> </li>
                     <li> <a href="../product/pro_list?pcode=p010102"> 뿌리채소 </a> </li>
                     <li> <a href="../product/pro_list?pcode=p010103"> 열매채소 </a> </li>
                   </ul>
                 </li>
                 <li> 과일류 
                   <ul class="so">
                     <li> 수입과일 </li>
                     <li> 국산과일 </li>
                     <li> 통조림 </li>
                   </ul>
                 </li>
                 <li> 쌀잡곡 
                   <ul class="so">
                     <li> 햅 쌀 </li>
                     <li> 잡 곡 </li>
                     <li> 수 입 </li>
                   </ul>
                 </li>
               </ul>
             </li>
             <li> 수산물 
               <ul class="jung">
                 <li> 생 선 </li>
                 <li> 해조류 </li>
                 <li> 횟 감 </li>
               </ul>
             </li>
             <li> 축산물 
               <ul class="jung">
                 <li> 소고기 </li>
                 <li> 돼지고기 </li>
                 <li> 닭.오리 </li>
               </ul>
             </li>
             <li> 가공품 
               <ul class="jung">
                 <li> 건조식품 </li>
                 <li> 통 조 림 </li>
                 <li> 절임식품 </li>
               </ul>
             </li>
          </ul>
        </li>   
        <li> NEW </li>
        <li> BEST </li>
        <li> OUTLET </li>
        <li> EVENT </li>
        <li> | </li>
        <li> COMMUNITY </li>
        <li>  
        </li>
      </ul>
    </nav>        <!-- 메뉴및 링크 -->
    
    <decorator:body/>
    
    
      <footer> 쇼핑몰 관련 정보  </footer>  <!-- 사이트 관련 정보 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>