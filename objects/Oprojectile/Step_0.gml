//OTHER GUN 
//Move projectile
x += ProjectileDir * ProjectileSpd;

//Destroy when hitting a wall
if place_meeting(x, y, Owall)
{
    instance_destroy();
}

//Destroy when outside the room
if x < 0 || x > room_width
{
    instance_destroy();
}