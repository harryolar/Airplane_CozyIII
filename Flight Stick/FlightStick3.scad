//2022_05_14
//improvements from previous version 
//home for base should be 16 mm diameter it is 15.7 increased the radius to 9mm
//stick too short

module base()
{
   difference() 
    {
         cylinder(r = 20, h = 30, center = true, $fn=100);
         cylinder(r = 9, h = 40, center = true, $fn=100);
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
    45V(h=25, w=30 ,l=40);
    translate([1, 0, 1])45V(h=25, w=25 ,l=35);

   
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
base();
//translate([0, 0, 13])hand_guard();
 difference() 
    { 
    rotate([0, 5, 0])translate([-1, 0, 48])body();
    rotate([-40, 0, 90])translate([-12,-80, 70])45V(h=25, w=30 ,l=40);
    }
//rotate([0, 110, 0])translate([-100,-25, -20])button_holder();
    rotate([-40, 0, 90])translate([-12,-80, 70])top();
}


flight_stick();
//top();

 