size(500, 500);
background(255);
strokeWeight(0);
//緑の縞模様
fill(#055504);
rectMode(CENTER);
for (int i=0; i<5; i++) {
    rect( 130+i*60, 250, 30, 430);
 }
//オレンジの縞模様
fill(#BC6026);
for (int i=0; i<6; i++) {
    rect( 100+i*60, 250, 30, 430);
}
 
//外側の黒い楕円
stroke(0);
strokeWeight(25);
noFill();
ellipse(250, 250, 407, 475);
//内側の白い楕円
noFill();
strokeWeight(10);
stroke(#F9FAEB);
ellipse(250, 250, 372, 440);
//一番内側の黒い楕円
noFill();
strokeWeight(10);
stroke(0);
ellipse(250, 250, 362, 430);


//黒い長方形
strokeWeight(0);
fill(0);
rectMode(CENTER);
 rect( 250, 250, 400, 180);
//白い細い線(上側)
strokeWeight(0);
fill(255);
 rect( 250, 180, 500, 3);
 //白い細い線
strokeWeight(0);
fill(255);
 rect( 250, 300, 500, 3);
 //白い細い線
strokeWeight(0);
fill(255);
 rect( 250, 310, 500, 3);
//黒い長方形(COFFEE)の下地
strokeWeight(0);
fill(0);
 rect( 250, 290, 190, 60);

stroke(255);
strokeWeight(60);
noFill();
ellipse(250, 250, 472, 540);  



PFont font = loadFont("Arvo-Italic-48.vlw");
textFont(font);


textAlign(CENTER);
String str = "T    Y'";
fill(255);
textSize(100);
text(str,232,275);
textAlign(CENTER);
String str1= "ULL   ";
textSize(70);
text(str1,264,275);
String str2= "S";
textSize(70);
text(str2,390,275);

String str3 = "COFFEE";
textSize(40);
text(str3,250,320);

save("sketch_15723070_05_01.png"); 
