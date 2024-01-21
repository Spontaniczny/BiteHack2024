extends PopupPanel

const Collection = preload("res://scripts/achievements/Collection.gd")

const timeout := 2.5

func display(ach: Collection.Achievement):
	var properties = Collection.information[ach]
	
	$"ColorRect/VerticalMargin/Container/TitleMargin/Title".text = properties["title"]
	$"ColorRect/VerticalMargin/Container/DescriptionMargin/Description".text = properties["description"]
	
	show()
	
	await get_tree()\
		.create_timer(timeout)\
		.timeout
	
	hide()
