@scores.each{ |score|

	score = score.attributes
	score["name"] = User.find(score["user_id"])["name"] 
	puts score
}
