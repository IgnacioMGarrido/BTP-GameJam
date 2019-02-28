extends Bullet

export (PackedScene) var bullet_to_spawn

func _on_ExplosionTimer_timeout():
	shoot_projectile()

func shoot_projectile():

	for i in [-1, 0, 1]:
		var b = bullet_to_spawn.instance()
		b.start(global_position, global_rotation * Vector2(i,i).angle())

		get_node("/root/MainScene").add_child(b)
	queue_free()
