<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!doctype html>
<html lang="en">
<head>
<title>loading Knockx2</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
#slide-container {
 
  width: 100%;
  height: 100vh; /* 뷰포트 높이에 맞게 조절 */
}

#slide-content {
  transform: translateY(0);
  transition: transform 0.5s ease-in-out;
}


body {
  font-family: 'Alatsi', sans-serif;
  margin: 0;
  overflow: hidden;
  background: radial-gradient(#2647ff,#07b9ff);

}

.container {
 z-index: 99999;
  display: flex;
  justify-content: center;
  align-items: center;
  
  position: absolute;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  transform: translateY(0);
 transition: transform 0.5s ease-in-out;
}

.title {
  font-size: 100px;
  font-weight: bold;
  color: white;
}

canvas {
  width: 100%;
}
canvas {
 transform: translateY(0);
 transition: transform 0.5s ease-in-out;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53148/jquery.easing.1.3.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53148/jquery.velocity.min.new.js"></script>
<script src="https://cdn.jsdelivr.net/npm/three@0.121.1/build/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/three@0.121.1/examples/js/controls/OrbitControls.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplex-noise/2.4.0/simplex-noise.min.js"></script>
</head>
<body>
  <head>
    <title>FlexBox Exercise #3 - Image carousel / Responsive </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  
  <body>
    <canvas id="canvas"></canvas>
    <div class="container">
    <span id="result" class="title"></span>
  </div>

<script>
 document.addEventListener("DOMContentLoaded", function() {
  var slideContent = document.getElementById("canvas");

  setTimeout(function() {
    slideContent.style.transform = "translateY(-100%)"; // canvas 왼쪽으로 슬라이딩
  }, 3000);
  
  var slideContent1 = document.getElementsByClassName("container")[0]; // 첫 번째 container 요소 선택

  setTimeout(function() {
    slideContent1.style.transform = "translateY(-100%)"; // container 왼쪽으로 슬라이딩
    setTimeout(function() {
      smoothPageTransition("main.do"); // 부드러운 페이지 이동 처리
    }, 100); // 1초 후에 페이지 이동
  }, 4000);
});

function smoothPageTransition(url) {
  var container = document.getElementsByClassName("container")[0];
  container.style.transition = "transform 0.5s ease-in-out";
  container.style.transform = "translateY(-200%)"; // container 더 왼쪽으로 이동
  setTimeout(function() {
    location.href = url; // 페이지 이동
  }, 100); // 0.5초 후에 페이지 이동
}


</script>

<script>
    $(document).ready(function() {
      showResult();
  function showResult() {
            var text = "KnockX2 Loading.    .    .";
            var resultDiv = document.getElementById("result");
            resultDiv.innerHTML = "";

            for (var i = 0; i < text.length; i++) {
                setTimeout(function(index) {
                    resultDiv.innerHTML += text[index];
                }, i * 100, i);
            }
        }
    });
var canvas = document.getElementById("canvas");
var width = canvas.width = window.innerWidth * 0.75;
var height = canvas.height = window.innerHeight * 0.75;
document.body.appendChild(canvas);
var gl = canvas.getContext('webgl');

var mouse = {x: 0, y: 0};

var numMetaballs = 30;
var metaballs = [];

for (var i = 0; i < numMetaballs; i++) {
  var radius = Math.random() * 60 + 10;
  metaballs.push({
    x: Math.random() * (width - 2 * radius) + radius,
    y: Math.random() * (height - 2 * radius) + radius,
    vx: (Math.random() - 0.5) * 3,
    vy: (Math.random() - 0.5) * 3,
    r: radius * 0.75
  });
}

var vertexShaderSrc = `
attribute vec2 position;

void main() {
// position specifies only x and y.
// We set z to be 0.0, and w to be 1.0
gl_Position = vec4(position, 0.0, 1.0);
}
`;

var fragmentShaderSrc = `
precision highp float;

const float WIDTH = ` + (width >> 0) + `.0;
const float HEIGHT = ` + (height >> 0) + `.0;

uniform vec3 metaballs[` + numMetaballs + `];

void main(){
float x = gl_FragCoord.x;
float y = gl_FragCoord.y;

float sum = 0.0;
for (int i = 0; i < ` + numMetaballs + `; i++) {
vec3 metaball = metaballs[i];
float dx = metaball.x - x;
float dy = metaball.y - y;
float radius = metaball.z;

sum += (radius * radius) / (dx * dx + dy * dy);
}

if (sum >= 0.99) {
gl_FragColor = vec4(mix(vec3(x / WIDTH, y / HEIGHT, 1.0), vec3(0, 0, 0), max(0.0, 1.0 - (sum - 0.99) * 100.0)), 1.0);
return;
}

gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
}

`;

var vertexShader = compileShader(vertexShaderSrc, gl.VERTEX_SHADER);
var fragmentShader = compileShader(fragmentShaderSrc, gl.FRAGMENT_SHADER);

var program = gl.createProgram();
gl.attachShader(program, vertexShader);
gl.attachShader(program, fragmentShader);
gl.linkProgram(program);
gl.useProgram(program);

var vertexData = new Float32Array([
  -1.0,  1.0, // top left
  -1.0, -1.0, // bottom left
  1.0,  1.0, // top right
  1.0, -1.0, // bottom right
]);
var vertexDataBuffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, vertexDataBuffer);
gl.bufferData(gl.ARRAY_BUFFER, vertexData, gl.STATIC_DRAW);

var positionHandle = getAttribLocation(program, 'position');
gl.enableVertexAttribArray(positionHandle);
gl.vertexAttribPointer(positionHandle,
                       2, // position is a vec2
                       gl.FLOAT, // each component is a float
                       gl.FALSE, // don't normalize values
                       2 * 4, // two 4 byte float components per vertex
                       0 // offset into each span of vertex data
                      );

var metaballsHandle = getUniformLocation(program, 'metaballs');

loop();
function loop() {
  for (var i = 0; i < numMetaballs; i++) {
    var metaball = metaballs[i];
    metaball.x += metaball.vx;
    metaball.y += metaball.vy;

    if (metaball.x < metaball.r || metaball.x > width - metaball.r) metaball.vx *= -1;
    if (metaball.y < metaball.r || metaball.y > height - metaball.r) metaball.vy *= -1;
  }

  var dataToSendToGPU = new Float32Array(3 * numMetaballs);
  for (var i = 0; i < numMetaballs; i++) {
    var baseIndex = 3 * i;
    var mb = metaballs[i];
    dataToSendToGPU[baseIndex + 0] = mb.x;
    dataToSendToGPU[baseIndex + 1] = mb.y;
    dataToSendToGPU[baseIndex + 2] = mb.r;
  }
  gl.uniform3fv(metaballsHandle, dataToSendToGPU);
  
  //Draw
  gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);

  requestAnimationFrame(loop);
}

function compileShader(shaderSource, shaderType) {
  var shader = gl.createShader(shaderType);
  gl.shaderSource(shader, shaderSource);
  gl.compileShader(shader);

  if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    throw "Shader compile failed with: " + gl.getShaderInfoLog(shader);
  }

  return shader;
}

function getUniformLocation(program, name) {
  var uniformLocation = gl.getUniformLocation(program, name);
  if (uniformLocation === -1) {
    throw 'Can not find uniform ' + name + '.';
  }
  return uniformLocation;
}

function getAttribLocation(program, name) {
  var attributeLocation = gl.getAttribLocation(program, name);
  if (attributeLocation === -1) {
    throw 'Can not find attribute ' + name + '.';
  }
  return attributeLocation;
}

canvas.onmousemove = function(e) {
  mouse.x = e.clientX;
  mouse.y = e.clientY;
}
</script>
</body>
</html>

