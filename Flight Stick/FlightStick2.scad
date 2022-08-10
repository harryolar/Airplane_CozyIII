
module base()
{
   difference() 
    {
         cylinder(r = 25, h = 30, center = true, $fn=100);
         cylinder(r = 8, h = 40, center = true, $fn=100);
    }   
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
 linear_extrude(height = 15, center = true, convexity = 10, scale=[1,1.7], $fn=100)
 translate([2, 0, 0])
 circle(r = 20);
  
    //translate([15,25, -5])cylinder(r = 8, h = 50, center = true, $fn=100);
    //translate([-10,25, -5])cylinder(r = 8, h = 50, center = true, $fn=100);
    //translate([-10,-25, -5])cylinder(r = 8, h = 50, center = true, $fn=100);
    //translate([15,-25, -5])cylinder(r = 8, h = 50, center = true, $fn=100);
   
 } 
 
 //translate([15,25, -5])button_holder();
 //translate([-10,25, -5])button_holder();
 //translate([-10,-25, -5])button_holder();
 //translate([15,-25, -5])button_holder();
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
base();
translate([0, 0, 13])hand_guard();
rotate([0, 5, 0])translate([0, 0, 50])body();
//rotate([0, 110, 0])translate([-100,-25, -20])button_holder();
rotate([0, 30, 0])translate([-50,0, 104])top();
}


flight_stick();
//top();

 