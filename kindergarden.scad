// Plate for the kindergarden
radius_led = 2.5;
radius_button = 6;
radius_contact= 3;
spacer = 3;
thickness = 4;
$fn=200;
module signature(x,y) {
     translate([x,y,-1]) 
                rotate(90){
                            linear_extrude(thickness+2)
                                text("oliver.r.staudt@gmail.com",2.5);
                }
 }

module contact(x,y,txt="") {
    echo ("contact",x,y);
    
    
    echo (offset_txt);
    translate([x,y,-1]){
            cylinder(10,radius_contact,radius_contact);
            if (txt == "-"){
             translate([-1,-radius_contact*2.5,0]) 
                    rotate(a=90,[1,0,0])
                            linear_extrude(thickness+2)
                                text(txt,5);
            }
            if (txt == "+"){
                translate([-2,-radius_contact*2.5,0]) 
                    rotate(a=90,[1,0,0])
                            linear_extrude(thickness+2)
                                text(txt,5);
            };
   }
}

module led(x,y) {
    echo ("LED ",x,y)
        contact(x,y,"+");
        
        translate([x+radius_contact*2+spacer+radius_led,y,-1])
            cylinder(10,radius_led,radius_led);
        contact(x+radius_contact*4+spacer+radius_led*2+spacer,y,"-");    
        }

module button(x,y) {
    echo ("Button", x,y);
        translate([x,y,-1])
            cylinder(10,radius_contact,radius_contact);
        translate([x+radius_contact*2+spacer+radius_button,y,-1])
            cylinder(10,radius_button,radius_button);
        translate([x+radius_contact*4+spacer+radius_button*2+spacer,y,-1])
            cylinder(10,radius_contact,radius_contact);        
}

module battery(x,y){
    width=32;
    depth=60;
    height=10;
    translate([x,y,thickness]){ 
        difference(){
            cube([width+4,depth+4,height]);
            translate([2,2])
                cube([width,depth,height+1]);
        }
    }
}

module stand(x,y,height){
    translate([x,y,-0.02]){
        cylinder($fn = 6, h=thickness+1, r = 5);
        
        translate([0,0,-height])
            cylinder(h=height, r = 8);
    }
}

module board(x,y){
difference()
    {   
        cube([x,y,4]);
        translate([30,40]){
                led(30,30);
                led(38,45);
                led(30,60);}
        translate([13,5,0]) {
            button(50,15);
            button(40,30);
            button(50,45);}
        
        contact(45,8,"-");
        contact(40,20,"+");
        translate([0,3,0]){
            contact(45,90,"-");
            contact(50,100,"+");}
        signature(45,35);
        stand(8,8,15);
        stand(x-8,8,15);
        stand(8,y-8,15);
        stand(x-8,y-8,15);
        
    };
    battery(5,25);
    

};

board(100,110);
/*translate([0,-20,15.02]){
stand(120,110,15);
stand(120,90,15);
stand(120,70,15);
stand(120,50,15);
    }*/
//signature(0,0);
//contact(0,0,"-");