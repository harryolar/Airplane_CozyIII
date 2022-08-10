//2022_05_20

//--version 4



module flight_stick_cap()
{
 difference() 
 {
    
   45V(h=3, w=36.5 ,l=39.5); 
  
   //button holes  
   translate([21, , 0])cylinder(r = 6, h = 25, center = true, $fn=100);
   translate([0, , 0]) cylinder(r = 6, h = 25, center = true, $fn=100);
     
   //screw holes
   translate([-16, , 0])cylinder(r = 1, h = 25, center = true, $fn=100);
   translate([37, , 0]) cylinder(r = 1, h = 25, center = true, $fn=100);  
     
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
         
         cylinder(r = 5.8, h = 40, center = true, $fn=100);
    }   
}





flight_stick_cap();

 