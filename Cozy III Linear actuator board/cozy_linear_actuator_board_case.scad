


module pcb_board()
{
    color( "LimeGreen", 1.0 ) 
           cube(size = [70 , 55 , 1.65] , center = true);
    
}
module screw_hole()
{
   difference() 
    {
         cylinder(9,2.75,2.75, true );
         cylinder(12.5,1.75,1.75, true); 
    }   
}


module strap_hole()
{
   difference() 
    {
         cylinder(r = 26.25, h = 10, center = false);
         cylinder(r = 24.25, h = 12, center = false);
    }   
}
module cozy_linear_actuator_board_case(wall_thickness=1, inside_size_x=20,inside_size_y=20,height=26,side=10)
{
    
    difference() 
    {
       cube([inside_size_x+wall_thickness, inside_size_y+wall_thickness, height], center = true);
       cube([inside_size_x, inside_size_y, height+2], center = true);
        
        //dsub connector
       //translate([inside_size_x/2+2, 0, -3])rotate([0,270,0])dsub(1.1,17.04,1);
        
        //cut the hole for the connector 
       translate([-inside_size_x/2-5.5, -25, -3])cube([7,50,5]);
        
        //cut the hole for the connector 
       translate([inside_size_x/2-5.5, -25, -3])cube([7,50,5]);
      
       //cut a hole for the lid  
       translate([3, 0, -height/2+1.5])cube([inside_size_x+wall_thickness+5, inside_size_y+wall_thickness-1.5, 1.5], center = true);
        
       //cut the lip of the hole for the lid
        
      translate([3, 0, -height/2])cube([inside_size_x+wall_thickness, inside_size_y+wall_thickness-3, 2.5], center = true); 
    }
     
    
    difference() 
    {
     translate([0, 0, height/2+5])
        
     //base of the case   
     cube([inside_size_x+wall_thickness, inside_size_y+wall_thickness, wall_thickness+7], center = true);
     //cut holes for screws
     //translate([inside_size_x/2+side/2+1, inside_size_y/2-5, 0])cylinder(15,2.75,2.75, false);
     //translate([inside_size_x/2+side/2+1, -inside_size_y/2+5, 0])cylinder(15,2.75,2.75, false);
     //translate([-inside_size_x/2-side/2-1,inside_size_y/2-5, 0])cylinder(15,2.75,2.75, false);
     //translate([-inside_size_x/2-side/2-1,-inside_size_y/2+5, 0])cylinder(15,2.75,2.75, false);
        
     translate([-35, 0, height+12])rotate(a=[0,90,0])strap_hole();
     translate([25, 0, height+12])rotate(a=[0,90,0])strap_hole();
     translate([-60, 0, height+12])rotate(a=[0,90,0])cylinder(r = 22.25, h = 150, center = false);
    }
    
    
    
    //pcb standoff and hole 
    translate([-inside_size_x/2+side/2+1, -inside_size_y/2+5, height/2-3])screw_hole();
    translate([inside_size_x/2-side/2+1, -inside_size_y/2+5, height/2-3])screw_hole();
    
   translate([-inside_size_x/2+side/2+1, inside_size_y/2-5, height/2-3])screw_hole();
     translate([inside_size_x/2-side/2+1, inside_size_y/2-5, height/2-3])screw_hole();
   
}


cozy_linear_actuator_board_case(3,70,55);

//pcb size is 57.46 X35.84
 //pcb_board();

//strap_hole();
