function controlssetup()
{
	BufferTime = 4;
	
	JumpKeyBuffered = 0; 
	JumpKeyBufferTimmer = 3;
	

}
function getcontrols()
{
  //moveimput
RightKey = keyboard_check( vk_right );
LeftKey = keyboard_check( vk_left )

//ACTimput
JumpKeyPressed = keyboard_check_pressed(ord("C"));
JumpKeyPressed = clamp(JumpKeyPressed, 0, 1);

JumpKey = keyboard_check(ord("C"));
JumpKey = clamp(JumpKey, 0, 1);
 XKey = keyboard_check(ord("X"));

ZKey = keyboard_check_pressed(ord("Z"));
owner = noone;

//Position relative to player
gun_x_offset = 50;
gun_y_offset = -8;


//Fire projectile
if owner != noone && owner.ZKey
{
    var _projectile = instance_create_layer(
        x + (owner.face * 16),
        y,
        "Instances",
        Oprojectile
    );

    _projectile.ProjectileDir = owner.face;
}


//jump buffering
if JumpKeyPressed
{
	JumpKeyBufferTimmer = BufferTime;
}
if JumpKeyBufferTimmer > 0 
{
	JumpKeyBuffered = 2;
	JumpKeyBufferTimmer--;
} else { JumpKeyBuffered = 0;}
} 

