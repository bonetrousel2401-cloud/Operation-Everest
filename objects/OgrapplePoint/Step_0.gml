//GRAPPLE POINT COLOR

var _player = instance_find(player, 0);

if _player != noone
{
    var _dist = point_distance(x, y, _player.x, _player.y);

    if _dist <= _player.GrappleRange
    {
        image_blend = c_lime;
    }
    else
    {
        image_blend = c_red;
    }
}