extends Sprite

signal finished_op

var acc = 0.0
var steps = 25
var beg = Vector2(0,0)
var end = Vector2(0, 0)

var fmoving = funcref(self, 'moving')
var functor = null
var runner
var proc :Semaphore
var proc_running :bool

func _ready():
	proc = Semaphore.new()
	proc_running = false
	runner = Thread.new()
	runner .start (self, "processor")
	

func _process(delta):
	if functor:
		proc_running = true
		functor .call_func (delta)
	else:
		if proc_running:
			proc_running = false
			proc.post()

func _exit_tree():
	runner.wait_to_finish()
	
func moving (dist):
	if acc >= 1.0:
		functor = null
	else:
		acc += 1.0/25.0
		position = beg.linear_interpolate(end, acc)
	
func moveto (aplace):
	beg = position
	end = aplace
	acc = 0.0
	functor = fmoving
	proc.wait()
	
func processor (userdata):
	moveto(Vector2(10, 10))	
	moveto(Vector2(10,100))