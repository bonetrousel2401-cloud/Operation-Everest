//draw rope
//GRAPPLE ROPE

if Grappling && instance_exists(GrappleTarget)
{
    draw_set_color(c_aqua);
    draw_line(x, y, GrappleTarget.x, GrappleTarget.y);
}

//draw myself


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha );
