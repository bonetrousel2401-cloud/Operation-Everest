if instance_exists(GunOwner)
{
    x = GunOwner.x + (GunOwner.face * GunXOffset);
    y = GunOwner.y + GunYOffset;

    //Face the same direction as the player
    image_xscale = GunOwner.face * abs(image_xscale);
}
else
{
    instance_destroy();
}