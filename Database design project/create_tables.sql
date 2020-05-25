create table user (
    user_id int primary key,
    email varchar(30) not null unique,
    password varchar(30) not null,
    account varchar(10) not null check (account in ('Student', 'Professor', 'Staff')),
    display_name varchar(30) unique,
    gender char(1) not null check (gender in ('M', 'F')),
    date_of_birth date not null
);

create table department (
    dept_no int primary key,
    dept_name varchar(30)
);

create table student (
    student_id int primary key,
    student_name nvarchar(30),
    user_id int,
    major_dept int not null,
    foreign key (user_id) references user(user_id),
    foreign key (major_dept) references department(dept_no) 
);

create table professor (
    professor_id int primary key,
    professor_name nvarchar(30), 
    user_id int, 
    designation varchar(30),
    hired_by_dept int not null,
    foreign key (user_id) references user(user_id),
    foreign key (hired_by_dept) references department(dept_no)
);

create table staff (
    staff_id int primary key, 
    staff_name nvarchar(30),
    user_id int,
    designation varchar(30),
    hired_by_dept int not null,
    foreign key (user_id) references user(user_id),
    foreign key (hired_by_dept) references department(dept_no)
);

create table majored_department (
     student_id int not null,
     dept_no int not null,
     foreign key (student_id) references student(student_id),
     foreign key (dept_no) references department(dept_no)
);

create table program (
    program_id int primary key,
    program_name nvarchar(30),
    dept_no int not null,
    foreign key (dept_no) references department(dept_no)
);

create table pursued_program (   
    student_id int not null,
    program_id int not null,
    dept_no int not null,
    foreign key (student_id) references student(student_id),
    foreign key (program_id) references program(program_id),
    foreign key (dept_no) references department(dept_no)
);

create table semester (
    semester_id int primary key,
    year int not null,
    season varchar(10) not null
);

create table course (
    course_id int primary key,
    course_title varchar(30),
    dept_no int not null,
    semester_id int, 
    foreign key (dept_no) references department(dept_no),
    foreign key (semester_id) references semester(semester_id)
);

create table opened_course (
    is_opened boolean,
    course_id int not null,
    semester_id int not null,
    course_capacity int,
    foreign key (course_id) references course(course_id),
    foreign key (semester_id) references semester (semester_id)
);

create table pre_requisite_course (
    course_id int not null,
    pre_requisite_course_id int,
    foreign key (course_id) references course(course_id),
    foreign key (pre_requisite_course_id) references course(course_id) 
);

create table registered_semester (
    registration_id int primary key,
    student_id int,
    semester_id int,
    foreign key (student_id) references student (student_id),
    foreign key (semester_id) references semester (semester_id)
);

create table enrolled_course (
    enrolled_course_id int primary key,
    student_id int,
    course_id int,
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

create table exam (
    exam_id int unique,
    exam_name nvarchar(30),
    course_id int not null,
    grade char(1) check (grade in ('A', 'B', 'C', 'D', 'F')),
    foreign key (course_id) references course(course_id)
);

create table problem (
    problem_id int primary key,
    problem_score int,
    exam_id int,
    foreign key (exam_id) references exam(exam_id)
);

create table instructor (
    instructor_id int primary key,
    professor_id int,
    course_id int,
    foreign key (course_id) references course(course_id),
    foreign key (professor_id) references professor(professor_id)
);
create table course_feedback (
    comments nvarchar(50),
    instructor_id int,
    enrolled_course_id int,
    foreign key (instructor_id) references instructor(instructor_id),
    foreign key (enrolled_course_id) references enrolled_course(enrolled_course_id)
);

create table teaching_assistant (
    ta_id int primary key,
    student_id int,
    course_id int,
    foreign key (student_id) references student (student_id),
    foreign key (course_id) references course (course_id)
);

create table finished_course (
    finished_course_id int primary key,
    course_grade char(1) check (course_grade in ('A', 'B', 'C', 'D', 'F')),
    student_id int,
    course_id int,
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

create table score (
    score_id int primary key,
    problem_id int,
    enrolled_course_id int,
    exam_id int,
    foreign key (exam_id) references exam(exam_id),
    foreign key (problem_id) references problem(problem_id),
    foreign key (enrolled_course_id) references enrolled_course(enrolled_course_id)
);
