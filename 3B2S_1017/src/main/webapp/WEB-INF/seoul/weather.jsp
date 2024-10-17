<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.board-container {
    width: 100%;
    max-width: 1200px; /* 적당한 최대 너비 */
    margin: 0 auto; /* 가운데 정렬 */
    padding: 20px; /* 내부 여백 */
    border: 2px solid #003366; /* 칠판처럼 테두리 추가 */
    border-radius: 50px; /* 모서리 둥글게 */
    background-color: #fff; /* 배경색 */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    margin-bottom: 20px;
    display : flex;
    justify-content: space-between;
}
</* 헤더를 전체 페이지 너비로 확장 */
body {
    font-family: "KBO";
}

/*공통규격*/
.centers {
    justify-content: center;
    align-items: center;
}
.slowAction {
    transition: all 0.5s;
}


/*내용CSS*/
section{
    margin-top: 50px;
    height:100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.content-box{
    font-weight: bold;
}

.buttonBox{
    max-width: 700px;
    color:#fff;
}

.weather_text{
    width: 45%;
    max-width: 600px;
    max-height: 200px;
    background-color: #fff;
}

.weather {
    width: 50%;
    height: auto;
    max-height:600px;
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3열로 설정 */
    grid-template-rows: repeat(3, 1fr); /* 3행으로 설정 */
}

.weather_item {
    width: 100%;
    max-width: 600px;
    min-width: 300px;
    max-height: 200px;
    margin:0 auto;
    position: relative;
}

.closeBtn{
    position: absolute;
    cursor: pointer;
    width:25px;
    height: 25px;
    font-weight: bold;
    background-color: #fff;
    border-radius: 50%;
    z-index: 5;
    right: 10px;
    top: 10px;
    border: 1px solid #eaeaea;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}



.cool {
    background:linear-gradient(45deg, rgb(0, 51, 102),rgb(6, 124, 214));
}
.hot{
    background:linear-gradient(45deg, #f5cc53, #fedd3a);
}
.soso{
    background:linear-gradient(45deg, rgb(29, 179, 104), rgb(0, 102, 51));
}


.main_info {
    width: 100%;
    height: 70%;
    color: #fff;
    align-items: center;
}

.main_info .weather_icon {
    font-size: 5rem;
    width: 50%;
}

.weather_info {
    width: 50%;
    flex-direction: column;
}

.weather_info div {
    width: 100%;
}

.weather_info div i {
    font-size: 35px;
}

.weather_info p {
    width: 100%;
}

.sub_info {
    width: 100%;
    height: 30%;
}

.sub_info li {
    width: 100%;
}

.sub_info li:nth-child(1) span{
    color:red;
}


.sub_info li:nth-child(2) span{
    color:#6366f1;
}

.sub_info li span {
    margin-left:10px;
}
.pagination{
    color:#fff;
    display: flex;
    justify-content: center;
}

.pagination li{
    width:100%;
    max-width: 50px;
    height: 100%;
    cursor: pointer;
}

.pagination li.active{
    background-color: #fff;
    color: #003366;
}

/*font-action*/

.font-action{
    background-image: -webkit-linear-gradient(92deg, #f35626 , rgb(21 128 61));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-animation: hue 10s infinite linear;
}

@-webkit-keyframes hue {
    from {
      -webkit-filter: hue-rotate(0deg);
    }
    to {
      -webkit-filter: hue-rotate(-360deg);
    }
  }


  /*error*/

  .alert{
      width:100%;
      max-width: 1000px;
      max-height: 200px;
      height: 100vh;
      background-color: #FF4500;
      color:#fff;
      line-height: 200px;
      text-align: center;
      font-weight: bold;
      font-size: 2rem;
  }

  /*copy*/
  .copy{
      font-size: 15px;
      margin-top: 20px;
      color: #6366f1;
  }


  @media (max-width:690px) {
    section{
        width: 93%;
        margin: 50px auto 0;
    }
  }

</style>
 <link rel="stylesheet" href="https://erikflowers.github.io/weather-icons/ ">
 <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<section id="top">
    <div class="inner-information-text">
        <div class="container">
            <h3>Blog</h3>
            <ul class="breadcrumb">
                <li><a href="../main/main.do">Home</a></li>
                <li class="active">Hotel</li>
            </ul>
        </div>
    </div>
</section>
  <!-- ****** Breadcumb Area Start ****** -->

    <section>
    <div class="board-container">
    <div class="breadcumb-area" >
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h3>${today }<br>지역별 날씨</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="content-box ">
            
            <div class="col-sm-6 buttonBox mt-5 grid gap-3 grid-cols-5	">
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 서울 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 경기도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 강원도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 충청북도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 충청남도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 전라북도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 전라남도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 경상북도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 경상남도 </button>
                <button class="btn buttonAction  shadow-lg py-1 px-4 shadow-indigo-500/50 p-2 rounded hover:bg-white hover:text-indigo-500 slowAction"> 제주도 </button>
            </div>
            
        </div>
        <div class="weather_text shadow-lg shadow-indigo-500/50 rounded mt-10 p-5">오늘의 온도는 ? </div>

        <div class="col-sm-6 weather mx-auto mb-10 container mx-auto mt-10 drop-shadow-xl rounded
            grid grid-flow-row-dense  gap-5">
      
            <article class="weather_item rounded drop-shadow opacity-0 overflow-hidden">
                <div class="main_info flex">
                    <div class="weather_icon"><i class="fa-solid fa-sun"></i></div>
                    <div class="weather_info flex gap-2">
                        <div class="flex centers gap-2"><i class="fa-solid fa-temperature-half"></i> <span>00 ℃</span>
                        </div>
                        <p>상태 </p>
                        <p class="weatherCity">Seoul , 한국</p>
                    </div>
                </div>
                <ul class="sub_info centers flex mx-auto p-5 bg-white">
                    <li><i class="fa-solid fa-temperature-arrow-up"><span> 00℃</span></i></li>
                    <li><i class="fa-solid fa-temperature-arrow-down"><span> 00℃</span></i></li>
                </ul>

            </article>
        <nav class="pageWrap pb-10">
            <ul class="pagination gap-2">
                <li class="btn shadow-lg py-1 px-4  p-2 py-2 rounded hover:bg-white hover:text-indigo-500"><a href="#">1</a></li>
                <li class="btn shadow-lg py-1 px-4  p-2 py-2 rounded hover:bg-white hover:text-indigo-500"><a href="#">2</a></li>
                <li class="btn shadow-lg py-1 px-4  p-2 py-2 rounded hover:bg-white hover:text-indigo-500"><a href="#">3</a></li>
            </ul>
        </nav>
        </div>
        </div>
    </section>
    <!--weather-->


    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://kit.fontawesome.com/75e43ff16b.js" crossorigin="anonymous"></script>
    <script src="https://bottlesun.github.io/study/06-Weather/js/app.js"></script>
</body>
</html>