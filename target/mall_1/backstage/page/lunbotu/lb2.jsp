<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>2</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" href="css/common.css">
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="js/jquery.cloud9carousel.js"></script>
	<style>
	body {
      background: url(images/species/疫苗1.jpg) no-repeat center top fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
    }
    a {
      color: #e5e616;
    }
    a:hover {
      color: #88a7f7;
    }
    .wrap{padding-bottom: 50px;}
    .wrap > h1 {
      color: rgb(221, 142, 22);
      margin: 14px auto 0;
    }
    #showcase {
      height: 570px;
      overflow: visible !important;
    }
    .card {
      width: 260px;
      padding: 12px;
      text-align: center;
      background-color: rgba(61, 9, 9, 0.8);
      border: 2px white dotted;
      border-radius: 12px;
    }
    .card h2 {
      margin: 0 0 7px 0;
    }
    .card a {
      font-size: 18px;
      display: block;
    }
    .card p {
      font-size: 15px;
    }
    .nav {
      width: 64px;
      height: 134px;
      color: #ccc;
      font: bold 3em "Lucida Grande";
      text-align: center;
      text-shadow: 0px 1px 0px #f5f5f5;
      background: rgba(150, 150, 150, 0.5);
      border: solid 2px rgba(0, 0, 0, 0.4);
      -webkit-box-shadow: 0 0 9px 1px rgba(0, 0, 0, 0.45);
      -moz-box-shadow: 0 0 9px 1px rgba(0, 0, 0, 0.45);
      box-shadow: 0 0 9px 1px rgba(0, 0, 0, 0.45);
      cursor: pointer;
      position: absolute;
      top: 33%;
    }
    .nav:active,
    .nav.down {
      background: rgba(120, 120, 120, 0.5);
      border: solid 2px rgba(0, 0, 0, 0.55);
    }
    .nav.left {
      left: -43px;
      -webkit-border-radius: 12px 5px 5px 12px;
      -moz-border-radius: 12px 5px 5px 12px;
      border-radius: 12px 5px 5px 12px;
    }
    .nav.right {
      right: -43px;
      -webkit-border-radius: 5px 12px 12px 5px;
      -moz-border-radius: 5px 12px 12px 5px;
      border-radius: 5px 12px 12px 5px;
    }
    footer hr {
      width: 6px;
    }
    #share {
      top: -84px;
    }
    #credits {
      top: -78px;
    }
    #photo-credits {
      text-align: center;
    }
    #photo-credits h1 {
      font-size: 1em;
      margin-top: 0;
      margin-bottom: 6px;
    }
    #photo-credits > ul {
      list-style: none;
      padding: 0;
      margin-top: 0;
    }
  </style>
</head>
<body>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<div class="htmleaf-demo center">
                <h1 style="color: #2ECC40;">山西省疾控中心疫苗管理系统</h1>
			</div>
		</header>
	</div>
  <div class="wrap">
      <div id="showcase" class="noselect">
        <div class="card">
          <h2>卡介苗</h2>
          <img src="images/species/卡介苗.jpg">
          <p>
            卡介苗（BCG Vaccine）是由减毒牛型结核杆菌悬浮液制成的活菌苗，具有增强巨噬细胞活性，加强巨噬细胞杀灭肿瘤细胞的能力，活化T淋巴细胞，增强机体细胞免疫的功能。
          <a href="https://baike.baidu.com/item/%E5%8D%A1%E4%BB%8B%E8%8B%97">Learn more...</a>
        </div>
        <div class="card">
          <h2>乙肝疫苗</h2>
          <img src="images/species/乙肝疫苗.jpg">
          <p>
              乙肝疫苗（Hepatitis B vaccin）是提纯的乙肝表面抗原，为是死疫苗。是用于预防乙肝的特殊药物。疫苗接种后，可刺激免疫系统产生保护性抗体，这种抗体存在于人的体液中，乙肝病毒一旦出现，抗体会立即作用，将其清除，阻止感染，并且不会伤害到肝脏，从而使人体具有预防乙肝的免疫力，以达到预防乙肝感染的目的。
          </p>
          <a href="https://baike.baidu.com/item/%E4%B9%99%E8%82%9D%E7%96%AB%E8%8B%97">Learn more...</a>
        </div>
        <div class="card">
          <h2>脊灰疫苗</h2>
          <img src="images/species/脊灰疫苗.jpg">
          <p>
              脊髓灰质炎疫苗是预防和消灭脊髓灰质炎的有效手段。脊髓灰质炎是由脊髓灰质炎病毒引起的一种急性传染病。临床表现主要以发热、上呼吸道症状、肢体疼痛为主。病毒主要侵犯人体脊髓灰质前角的灰、白质部分，对灰质造成永久性损害，出现肢体弛缓性麻痹。部分患者可发生迟缓性神经麻痹并留下瘫痪后遗症，一般多见于5岁以下小儿，故俗称“小儿麻痹症”。
          </p>
          <a href="https://baike.baidu.com/item/%E8%84%8A%E9%AB%93%E7%81%B0%E8%B4%A8%E7%82%8E%E7%96%AB%E8%8B%97/10929983?fromtitle=%E8%84%8A%E7%81%B0%E7%96%AB%E8%8B%97&fromid=8723085">Learn more...</a>
        </div>
        <div class="card">
          <h2>百白破疫苗</h2>
          <img src="images/species/百白破疫苗.jpg">
          <p>
            百白破疫苗是由百日咳菌苗、白喉类毒素及破伤风类毒素混合制成，可以同时预防百日咳、白喉和破伤风。婴幼儿接种百白破疫苗后，免疫效果好，尤其对破伤风和白喉的效果更好，可维持免疫力5～1O年。同时可以降低百日咳发病率。
          </p>
          <a href="https://baike.baidu.com/item/%E7%99%BE%E7%99%BD%E7%A0%B4%E7%96%AB%E8%8B%97/6275239">Learn more...</a>
        </div>
        <div class="card">
          <h2>HIB疫苗</h2>
          <img src="images/species/HIB疫苗.jpg">
          <p>
              Hib的意思是侵袭性b型流感嗜血杆菌。使用Hib疫苗是控制Hib侵袭性疾病的有效措施。Hib疫苗具有较好的免疫原性，接种后可产生良好的免疫应答，可诱发机体产生有效的保护性杀菌抗体。
          </p>
          <a href="https://baike.baidu.com/item/HIB/2301709">Learn more...</a>
        </div>
        <div class="card">
          <h2>狂犬病疫苗</h2>
          <img src="images/species/狂犬病疫苗.jpg">
          <p>
              狂犬病疫苗是人被动物咬伤后接种的狂犬疫苗和抗狂犬病血清，预防感染狂犬病。狂犬病是狂犬病毒所致的自然疫源性或动物源性人畜共患急性传染病，流行性广，病死率极高，对人民生命健康造成严重威胁。
          </p>
          <a href="https://baike.baidu.com/item/%E7%8B%82%E7%8A%AC%E7%97%85%E7%96%AB%E8%8B%97/7144810">Learn more...</a>
        </div>
      </div>
      <button class="nav noselect left">
        &lt;
      </button>
      <button class="nav noselect right">
        &gt;
      </button>
    </div>
  <script>
    $(function() {
      var showcase = $("#showcase")

      showcase.Cloud9Carousel( {
        yOrigin: 42,
        yRadius: 40,
        itemClass: "card",
        buttonLeft: $(".nav.left"),
        buttonRight: $(".nav.right"),
        bringToFront: true,
        onLoaded: function() {
          showcase.css( 'visibility', 'visible' )
          showcase.css( 'display', 'none' )
          showcase.fadeIn( 1500 )
        }
      } )

      //
      // Simulate physical button click effect
      //
      $('.nav').click( function( e ) {
        var b = $(e.target).addClass( 'down' )
        setTimeout( function() { b.removeClass( 'down' ) }, 80 )
      } )

      $(document).keydown( function( e ) {

        switch( e.keyCode ) {
          /* left arrow */
          case 37:
            $('.nav.left').click()
            break;

          /* right arrow */
          case 39:
            $('.nav.right').click()
        }
      } )
    })
  </script>
</body>
</html>