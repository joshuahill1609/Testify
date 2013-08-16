#Grades
one = GradeLevel.new(grade_level: 1)
one.save
two = GradeLevel.new(grade_level: 2)
two.save
three = GradeLevel.new(grade_level: 3)
three.save
four = GradeLevel.new(grade_level: 4)
four.save

#Tags
science = Tag.new(tag_title: "Science")
science.save
math = Tag.new(tag_title: "Math")
math.save
history = Tag.new(tag_title: "History")
history.save
business = Tag.new(tag_title: "Business")
business.save
english = Tag.new(tag_title: "English")
english.save
health = Tag.new(tag_title: "Health")
health.save
music = Tag.new(tag_title: "Music")
music.save
art = Tag.new(tag_title: "Art")
art.save
language = Tag.new(tag_title: "Language")
language.save