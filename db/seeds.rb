# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create Administrators
admin_1 = Administrator.create(number: '0555652356', name: 'Niger', email: 'good@email.com',
                               password: 'Ajaguraja@24@@', image: 'image')
admin_2 = Administrator.create(number: '0555651245', name: 'Koo', email: 'agya@email.com', password: 'Ajaguraja@24@@@',
                               image: 'image')

# Create Teachers
teacher_1 = Teacher.create(name: 'John Defoe', number: '0505651234', email: 'defoe@email.com', password: 'Pass@In1243',
                           image: 'image')
teacher_2 = Teacher.create(name: 'Obrempong Sikani', number: '0595651234', email: 'obremp@email.com',
                           password: 'Obemp4@m', image: 'image')
teacher_3 = Teacher.create(name: 'Kwame Nkrumah', number: '0277651234', email: 'kwamenkrumah@emai.com',
                           password: 'Kwame@Nkrumah', image: 'image')

# Create Parents
parent_1 = Parent.create(name: 'Parent', number: '0554651234', email: 'parents@email.com', password: 'Pass@@In13',
                         image: 'image', address: '27 Oxford St.')
parent_2 = Parent.create(name: 'Mr. Odei', number: '0254653234', email: 'response@email.com', password: 'Parass@@In13',
                         image: 'image', address: '100 Main St.')
parent_3 = Parent.create(name: 'Augustine B.', number: '0554651204', email: 'augustine@email.com',
                         password: 'Augustine@@In1', image: 'image', address: '27 Augustine St.')

# Create Administrators_parent_teachers
admin_parent_teacher_1 = AdministratorParentTeacher.create(administrator_id: admin_1.id, parent_id: parent_1.id,
                                                           teacher_id: teacher_1.id)
admin_parent_teacher_2 = AdministratorParentTeacher.create(administrator_id: admin_1.id, parent_id: parent_2.id,
                                                           teacher_id: teacher_2.id)
admin_parent_teacher_3 = AdministratorParentTeacher.create(administrator_id: admin_1.id, parent_id: parent_3.id,
                                                           teacher_id: teacher_3.id)

# Create Grades
grade_1 = Grade.create(grade_num: 1, teacher_id: teacher_1.id)
grade_2 = Grade.create(grade_num: 2, teacher_id: teacher_2.id)
grade_3 = Grade.create(grade_num: 3, teacher_id: teacher_3.id)

# Create Students
student_1 = Student.create(name: 'Mercy', image: 'https://', parent_id: parent_1.id, grade_id: grade_1.id)
student_2 = Student.create(name: 'Kwame', image: 'https://', parent_id: parent_2.id, grade_id: grade_2.id)
student_3 = Student.create(name: 'Kofi', image: 'https://', parent_id: parent_3.id, grade_id: grade_3.id)

# Create Attendance
attendance_1 = Attendance.create(date: Date.today, present: true, absent: false, student_id: student_1.id)
attendance_2 = Attendance.create(date: Date.today, present: true, absent: false, student_id: student_2.id)
attendance_3 = Attendance.create(date: Date.today, present: true, absent: false, student_id: student_3.id)

# Create events
event_1 = Event.create(date: Date.tomorrow, location: 'Datus', image: 'https://', title: 'School Reopening',
                       description: 'School reopening for the 2021/2022 academic year', semester: 1, administrator_id: admin_1.id)
event_2 = Event.create(date: Date.tomorrow, location: 'Datus', image: 'https://', title: 'School Reopening',
                       description: 'Parent teachers association meeting', semester: 1, administrator_id: admin_1.id)
event_3 = Event.create(date: Date.tomorrow, location: 'Datus', image: 'https://', title: 'School Reopening',
                       description: 'School reopening for the 2021/2022 academic year', semester: 1, administrator_id: admin_1.id)

# Create courses
english = Course.create(name: 'English', semester: 1, grade_id: grade_1.id)
maths = Course.create(name: 'Maths', semester: 1, grade_id: grade_1.id)
science = Course.create(name: 'Science', semester: 1, grade_id: grade_1.id)
social = Course.create(name: 'Social Studies', semester: 1, grade_id: grade_1.id)
ict = Course.create(name: 'ICT', semester: 1, grade_id: grade_1.id)
french = Course.create(name: 'French', semester: 1, grade_id: grade_1.id)
art = Course.create(name: 'Art', semester: 1, grade_id: grade_1.id)
music = Course.create(name: 'Music', semester: 1, grade_id: grade_1.id)
religious = Course.create(name: 'Religious Studies', semester: 1, grade_id: grade_1.id)
health = Course.create(name: 'Health', semester: 1, grade_id: grade_1.id)

# Teacher_courses
teacher_course_1 = TeacherCourse.create(teacher_id: teacher_1.id, course_id: english.id)
teacher_course_2 = TeacherCourse.create(teacher_id: teacher_1.id, course_id: maths.id)
teacher_course_3 = TeacherCourse.create(teacher_id: teacher_2.id, course_id: science.id)
teacher_course_4 = TeacherCourse.create(teacher_id: teacher_2.id, course_id: social.id)

# Homework questions
english_home = Homework.create(start_date: Date.today, end_date: Date.tomorrow,
                               question: 'Read and answer the questions in chapter 5', course_id: english.id)
maths_home = Homework.create(start_date: Date.today, end_date: Date.tomorrow,
                             question: 'Answer the questions in chapter 5 on indices', course_id: maths.id)

# English Grade 1 results
english_quiz = QuizResult.create(date: Date.tomorrow, score: 90, course_id: english.id, student_id: student_1.id)
english_homework = HomeworkResult.create(date: Date.tomorrow, score: 85, course_id: english.id,
                                         student_id: student_1.id)
english_exams = ExamsResult.create(date: Date.tomorrow, score: 80, course_id: english.id, student_id: student_1.id)

# Maths Grade 1 results
math_quiz = QuizResult.create(date: Date.tomorrow, score: 90, course_id: maths.id, student_id: student_1.id)
math_homework = HomeworkResult.create(date: Date.tomorrow, score: 85, course_id: maths.id, student_id: student_1.id)
math_exams = ExamsResult.create(date: Date.tomorrow, score: 100, course_id: maths.id, student_id: student_1.id)

# Science Grade 1 results
science_quiz = QuizResult.create(date: Date.tomorrow, score: 92, course_id: science.id, student_id: student_2.id)
science_homework = HomeworkResult.create(date: Date.tomorrow, score: 85, course_id: science.id,
                                         student_id: student_2.id)
science_exams = ExamsResult.create(date: Date.tomorrow, score: 80, course_id: science.id, student_id: student_2.id)

# Report Card
english_report = Report.create(date: Date.today, remark: 'More room for improvement', student_id: student_1.id)
maths_report = Report.create(date: Date.today, remark: 'Can do better', student_id: student_1.id)
science_report = Report.create(date: Date.today, remark: 'Can do better', student_id: student_1.id)

# Course_Report
english_course_report = CourseReport.create(course_id: english.id, report_id: english_report.id)
maths_course_report = CourseReport.create(course_id: maths.id, report_id: maths_report.id)
science_course_report = CourseReport.create(course_id: science.id, report_id: science_report.id)
