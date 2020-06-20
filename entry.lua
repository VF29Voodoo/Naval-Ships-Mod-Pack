declare_plugin("Naval Ships Mod",
{
installed 	 = true, 
dirName	  	 = current_mod_path,
developerName = _("Kleeman"), 
fileMenuName = _("Naval Ships Mod"),
version		 = "2.5",		 
state		 = "installed",
info		 = ("Naval Ships Mod"),

})
----------------------------------------------------------------------------------------
mount_vfs_liveries_path (current_mod_path.."/Liveries")

mount_vfs_model_path (current_mod_path .. '/Shapes/Navy')
mount_vfs_model_path (current_mod_path .. '/Shapes/Weapons')

mount_vfs_texture_path (current_mod_path .. '/Textures/Navy/A69.zip')
mount_vfs_texture_path (current_mod_path .. '/Textures/Navy/balzam.zip')
mount_vfs_texture_path (current_mod_path .. '/Textures/Navy/bh-7.zip')
mount_vfs_texture_path (current_mod_path .. '/Textures/Navy/ghadir.zip')
mount_vfs_texture_path (current_mod_path .. '/Textures/Navy/tnc45.zip')
mount_vfs_texture_path (current_mod_path .. '/Textures/Navy/yukon.zip')
mount_vfs_texture_path (current_mod_path .. '/Textures/Weapons/MM38.zip')
mount_vfs_texture_path (current_mod_path .. '/Textures/Weapons/MM40.zip')

dofile(current_mod_path .. '/Entries/Weapons.lua')
dofile(current_mod_path .. '/Entries/Units.lua')

plugin_done()