extends Timer

var day=1
var month=0
var funds=0

func _ready():
	$".".start()

func _add_funds(bonusFunds):
	funds+=bonusFunds
	return funds
	
func _on_timeout():
	if day<=30:
		$VBoxContainer/timeLabel.text=str("Month ", month, ", Day ",day)
		$VBoxContainer/fundsLabel.text=str("Funds: ", funds)
		day+=1
	elif month<12:
		month+=1
		_add_funds(10000)
		$VBoxContainer/fundsLabel.text=str("Funds: ", funds)
		if month==12:
			$VBoxContainer/timeLabel.text="Game over"
		else:
			day=1
			$VBoxContainer/timeLabel.text=str("Month ", month, ", Day ",day)
	else:
		pass
