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
chemistry = Tag.new(tag_title: "Chemistry")
chemistry.save