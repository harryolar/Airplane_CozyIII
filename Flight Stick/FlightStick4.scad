//2022_05_14
//--version3
//improvements from previous version 
//home for base should be 16 mm diameter it is 15.7 increased the radius to 9mm
//stick too short
//--version 4
//hole for the pipe too large changed from r=9 to r=8.2
//changed the angle to the top
//added holes for screws



//this has to be substarcted from the stick so it fits on the support
module aluminum_stick_support()
{
   
       translate([0,0, 12])rotate([90, 0, 90])cylinder(r =3, h = 41, center = true, $fn=100);
       translate([18,0, 12])rotate([90, 0, 90])cylinder(r =5, h = 5, center = true, $fn=100);
       translate([-18,0, 12])rotate([90, 0, 90])cylinder(r =5, h = 5, center = true, $fn=6);
       cylinder(r = 8.2, h = 43, center = true, $fn=100);
      
}

module base()
{
   //difference() 
   // {
         cylinder(r = 20, h = 30, center = true, $fn=100);
        // cylinder(r = 8.2, h = 40, center = true, $fn=100);
   // }   
}
module body()
{
   //linear_extrude(height = 120, center = true, convexity = 100, scale=3, $fn=100)
   //translate([10, 0, 0])
   //circle(r = 20); 
    difference() 
    {
        cylinder(r1 = 20, r2 = 17, h = 70, center = true, $fn=100);
        cylinder(r = 8, h = 130, center = true, $fn=100);
    }
    
    translate([0, 0, 50])difference() 
    {
        cylinder(r1 = 17, r2 = 20, h = 30, center = true, $fn=100);
        cylinder(r = 8, h = 40, center = true, $fn=100);
    }
}

module hand_guard()
{
    difference() 
    {
         cylinder(r = 35, h = 5, center = true, $fn=100);
         cylinder(r = 8, h = 10, center = true, $fn=100);
    }   
}
module top()
{
 difference() 
 {
    45V(h=30, w=40 ,l=40);
    translate([2, 0, 1])45V(h=30, w=32 ,l=33);
    translate([-1, 0, 28])45V(h=3, w=37 ,l=40); 
    translate([10,15 , 10])rotate([90, 0, 0])cylinder(r = 8, h = 20, center = true, $fn=100);
   
 } 
 

}

module 45V(h=25, w=30 ,l=40)
{




minkowski()
{
 cube([l-w/2,0.1,h/2]);
 cylinder(r=w/2,h=h/2);
}

}

module button_holder()
{
   difference() 
    {
         cylinder(r = 9.5, h = 25, center = true, $fn=100);
         cylinder(r = 5.8, h = 40, center = true, $fn=100);
    }   
}


module flight_stick()
{
    difference() 
    { 
        base();
        translate([0,0, 6])rotate([180, 0, 90])aluminum_stick_support();
    }

    difference() 
    { 
     rotate([0, 5, 0])translate([-1, 0, 48])body();
     translate([24,-10, 117])rotate([-60, 0, 90]) 45V(h=50, w=40 ,l=40);
     translate([0,0, 6])rotate([180, 0, 90])aluminum_stick_support();
    }
//rotate([0, 110, 0])translate([-100,-25, -20])button_holder();
    translate([24,-10, 117])rotate([-60, 0, 90])top();
}


flight_stick();

//aluminum_stick_support();
//top();

 