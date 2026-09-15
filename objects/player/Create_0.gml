//controlsetup
controlssetup();


//moving
MoveDir = 0;
MoveSpd = 6;
xspd = 0;
yspd= 0;
face = 1

//jump
grav = 1.2;
termvel = 15;
jspd = -9
JumpControlTimer = 0;
JumpHoldFrame = 10;
onGround = true;
Maxjumpheight = -1;
JumpAcceleration = 7;
movelock = 0


//sprites
Spridle = playeridle1;
Sprrun = playerrun;

//wall jump
WallSlideSpeed = 2;
WallSliding = false;
WallJumpCooldown = 0;
WallJumpLock = 0;
WallJumpHspd = 10
WallJumpVspd = -13
WallJumpPush = 3;
WallJumpControl = 10;
// Wall detection
WallJumpLeft = false;
WallJumpRight = false;
GroundWall = false;
WallJumped = false;
//addeptus mechanicus


//grapple hook
Grappling = false;
GrappleTarget = noone

GrappleRange = 250;
GrappleSpeed = 14;
GrappleFlingMultiplier = 1.2;
GrappleMomentumX = 0;
GrappleMomentumY = 0;

GrappleCooldown = 0;
//Grapple point hop
GrappleHopSpeed = -15;
WasTouchingGrapplePoint = false;
//FUCKING GUN
gun = instance_create_layer(x, y, "Instances", Ogun);
gun.owner = id;
