# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

headTeacher_1 = HeadTeacher.create(number:'0555652356', name:'Niger', email:'good@email.com', password:'Ajaguraja@24@@', password_confirmation:'Ajaguraja@24@@', image: 'image')
headTeacher_2 = HeadTeacher.create(number:'0555651245', name:'Koo', email:'agya@email.com', password:'Ajaguraja@24@@@', password_confirmation:'Ajaguraja@24@@@', image:'image')
head_teacher_3 = HeadTeacher.create(name:'Nancy Doe', number:'0522651234', email:'nancy@email.com', password:'Nancy@In123', password_confirmation:'Nancy@In123', image:'image')


head_academic_1 = HeadAcademic.create(number:'0555651245', name:'Kojo', email:'kojo@email.com', password:'Aggaguraja@24@@@', password_confirmation:'Aggaguraja@24@@@', image:'image')
head_academic_2 = HeadAcademic.create(name:'John Doe', number:'0555651234', email:'johndoe@email.com', password:'Pass@In123', password_confirmation:'Pass@In123', image:'image')
head_academic_3 = HeadAcademic.create(name:'Jane Doe', number:'0265651234', email:'janedoe@email,com', password:'jANE@In123', password_confirmation:'jANE@In123', image:'image')

teacher_1 = Teacher.create(name:'John Defoe', number:'0505651234', email:'defoe@email.com', password:'Pass@In1243', password_confirmation:'Pass@In1243', image:'image')
teacher_2 = Teacher.create(name:'Obrempong Sikani', number:'0595651234', email:'obremp@email.com', password:'Obemp4@m', password_confirmation:'Obemp4@m', image:'image')
teacher_3 = Teacher.create(name:'Kwame Nkrumah', number:'0277651234', email:'kwamenkrumah@emai.com', password:'Kwame@Nkrumah', password_confirmation:'Kwame@Nkrumah', image:'image')

parent_1 = Parent.create(name:'Parent', number:'0554651234', email:'parents@email.com', password:'Pass@@In13', password_confirmation:'Pass@@In13', image:'image', address:'27 Oxford St.')
parent_2 = Parent.create(name:'Mr. Odei', number:'0254653234', email:'response@email.com', password:'Parass@@In13', password_confirmation:'Parass@@In13', image:'image', address:'100 Main St.')