extends Node

#File System Paths
const bullet_res = "res://Scenes/Planets/Defenses/Bullet.tscn"
const explosive_bullet_res = "res://Scenes/Planets/Defenses/ExplosiveBullet.tscn"
const planet_main = "res://Scenes/MainScene.tscn"
const minion_res = "res://Scenes/minions/minion.tscn"
const turret_res = "res://Scenes/Planets/Defenses/Turret.tscn"
const laser_turret_res = "res://Scenes/Planets/Defenses/LaserTurret.tscn"
const quad_laser_turret_res = "res://Scenes/Planets/Defenses/QuadLaserTurret.tscn"

#Nodes
var ResourceManager_path = "/root/MainScene/Planet/ResourceManagement"

var basic_turret_upgraded : bool = false