//imput
getcontrols();
//xmoving

MoveDir = RightKey - LeftKey;

//get face
if MoveDir !=0 {face = MoveDir;};


//get Xspd

if !Grappling
{
    var _accel = 0.8;
    var _decel = 0.6;

    //Normal movement
    if WallJumpLock <= 0
    {
        if MoveDir != 0
        {
            xspd += MoveDir * _accel;
            xspd = clamp(xspd, -MoveSpd, MoveSpd);
        }
        else
        {
            if xspd > 0
            {
                xspd = max(0, xspd - _decel);
            }
            else if xspd < 0
            {
                xspd = min(0, xspd + _decel);
            }
        }
    }

    //Wall jump momentum
    else
    {
        xspd += MoveDir * 0.15;
    }
}

//X.collision

var _subpixel = .5;
if place_meeting(x + xspd, y, Owall)
{
    
    //scoot up to walle precisely
    var _pixelcheck = _subpixel * sign(xspd);
    while !place_meeting(x +_pixelcheck, y, Owall)
    {
        x +=_pixelcheck; 
    }
    //set xspd to zero to "collide"
    xspd = 0;
}

//move

x += xspd







//YMOVE

if yspd > termvel {yspd = termvel;};
//gravity
if !Grappling
{
    yspd += grav;
}
//Jump

if JumpKeyBuffered && onGround

{
 JumpControlTimer = JumpHoldFrame;
}
//cut off jump
if !JumpKey
{ JumpControlTimer = 0}
//jump based on holding button 

if JumpControlTimer > 0 
{yspd = jspd;
    JumpControlTimer--
}
    if jspd >= Maxjumpheight
    {yspd = Maxjumpheight}
//WALL CHECK

var _wallLeft = place_meeting(x - 2, y, Owall);
var _wallRight = place_meeting(x + 2, y, Owall);

var _facingWall = false;

if face == -1 && _wallLeft && LeftKey
{
    _facingWall = true;
}

if face == 1 && _wallRight && RightKey
{
    _facingWall = true;
}
//WALL JUMP

if !onGround && !GroundWall && JumpKeyPressed && WallJumpCooldown <= 0
{
    //Left wall
    if face == -1 && _wallLeft && LeftKey
    {
        xspd = xspd * WallJumpPush + WallJumpHspd;
        yspd = WallJumpVspd;

        WallJumpLock = WallJumpControl;
  

        WallJumped = true;
    }

    //Right wall
    else if face == 1 && _wallRight && RightKey
    {
        xspd = xspd * WallJumpPush - WallJumpHspd;
        yspd = WallJumpVspd;

        WallJumpLock = WallJumpControl;
     

        WallJumped = true;
    }
}

	
	

//WALL SLIDE

if !onGround && _facingWall
{
    WallSliding = true;
}
else
{
    WallSliding = false;
}

if WallSliding && yspd > WallSlideSpeed
{
    yspd = WallSlideSpeed;
}



	
	
	
	
	
	

//Ycollision
var _subpixel = .5; 
if place_meeting (x, y + yspd, Owall)
{
    //Scoot up to the wall precisely
    
   var _pixelcheck = _subpixel * sign(yspd);
       while !place_meeting(x,y + _pixelcheck, Owall)
       {
           
          y += _pixelcheck
       }
       
       //set yspd to 0 to collide
       yspd = 0;
       
}

//set if on ground
var _wasOnGround = onGround;

if yspd >= 0 && place_meeting(x, y + 1, Owall)
{
    onGround = true;
}
else
{
    onGround = false;
}


//Check if we're grounded AND pressing against a wall
var _wallLeft = place_meeting(x - 2, y, Owall);
var _wallRight = place_meeting(x + 2, y, Owall);

if onGround && (_wallLeft || _wallRight)
{
    GroundWall = true;
}
else
{
    GroundWall = false;
}


//LANDING AFTER WALL JUMP
if onGround && !_wasOnGround && WallJumped
{
    //Reset momentum
    xspd = MoveDir;

    //Reset wall jump state
    WallJumpCooldown = 0;
    WallJumpLock = 0;
    WallSliding = false;

    //We have landed, so the next jump can reset momentum again
    WallJumped = false;
}



//move

y += yspd

//spritecontrol
if abs(xspd) > 0 {sprite_index = Sprrun;};
if xspd == 0 {sprite_index = Spridle;};




//GRAPPLE HOOK

//Cooldown
if GrappleCooldown > 0
{
    GrappleCooldown--;
}

//Press X to start grappling
if XKey && !Grappling && GrappleCooldown <= 0
{
    var _target = instance_nearest(x, y, OgrapplePoint);

    //Check if a grapple point exists and is within range
    if _target != noone
    {
        var _dist = point_distance(x, y, _target.x, _target.y);

        if _dist <= GrappleRange
        {
            GrappleTarget = _target;
            Grappling = true;

            //Reset stored momentum
            GrappleMomentumX = 0;
            GrappleMomentumY = 0;
        }
    }
}

//While grappling
if Grappling
{
    //Make sure the target still exists
    if !instance_exists(GrappleTarget)
    {
        Grappling = false;
        GrappleTarget = noone;
    }
    else
    {
        //Distance to grapple point
        var _dist = point_distance(x, y, GrappleTarget.x, GrappleTarget.y);

        //Stop this far away from the grapple point
        var _stopDistance = 8;
		
		//If we reach the stopping distance, disconnect normally
if _dist <= _stopDistance
{
    Grappling = false;
    GrappleTarget = noone;

    //Hop upward after reaching the grapple point
    yspd = GrappleHopSpeed;
	xspd = 0;

    //No fling, no saved momentum
    GrappleMomentumX = 0;
    GrappleMomentumY = 0;
}
        else
        {
            //Direction toward grapple point
            var _dir = point_direction(x, y, GrappleTarget.x, GrappleTarget.y);

            //Move toward the grapple point
            var _grappleX = lengthdir_x(GrappleSpeed, _dir);
            var _grappleY = lengthdir_y(GrappleSpeed, _dir);

            x += _grappleX;
            y += _grappleY;

            //Store the momentum gained from grappling
            GrappleMomentumX = _grappleX;
            GrappleMomentumY = _grappleY;

            //Jump disconnects and flings the player
            if JumpKeyBuffered
            {
                Grappling = false;





               //Distance-based fling

var _minDistance = 8;
var _maxDistance = GrappleRange;

//How far away we are when releasing
var _distancePercent = (_dist - _minDistance) / (_maxDistance - _minDistance);

//Keep the value between 0 and 1
_distancePercent = clamp(_distancePercent, 0, 1);

//Invert it so closer = stronger
var _closePercent = 1 - _distancePercent;

//Calculate fling multiplier
var _flingMultiplier = GrappleFlingMultiplier + (_closePercent * GrappleFlingMultiplier);

//Launch using grapple momentum
xspd = GrappleMomentumX * _flingMultiplier;
yspd = GrappleMomentumY * _flingMultiplier;
            }
        }
    }
}
