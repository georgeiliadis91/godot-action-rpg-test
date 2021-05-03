extends KinematicBody2D

const MAX_SPEED = 120
const ACCELERATION = 500
const FRICTION = 750

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO

#instead of using on ready func
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

#Movement handling func
#delta 1sec/ 60 frames depending on machine

func _ready():
	animationTree.active =true


func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		ATTACK:
			attack_state(delta)


func move_state(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		#animation handling the first parameters is the name from the animation tree params 
		animationTree.set("parameters/Idle/blend_position",input_vector)
		animationTree.set("parameters/Run/blend_position",input_vector)
		animationTree.set("parameters/Attack/blend_position",input_vector)
		animationState.travel("Run")
		
		#actuall movement handling
		velocity = velocity.move_toward( input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward( Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("attack"):
		state=ATTACK


func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

 
func roll_state(delta):
	pass
	
func set_state_move():
	state=MOVE
