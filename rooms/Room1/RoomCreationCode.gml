/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 5B82D677
/// @DnDArgument : "objectid" "Owall"
/// @DnDSaveInfo : "objectid" "Owall"
instance_create_layer(0, 0, "Instances", Owall);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 30F95A50
/// @DnDArgument : "objectid" "player"
/// @DnDSaveInfo : "objectid" "player"
instance_create_layer(0, 0, "Instances", player);

/// @DnDAction : YoYo Games.Instances.Sprite_Scale
/// @DnDVersion : 1
/// @DnDHash : 73967842
/// @DnDApplyTo : {player}
/// @DnDArgument : "xscale" "4"
/// @DnDArgument : "yscale" "4"
with(player) {
image_xscale = 4;image_yscale = 4;
}