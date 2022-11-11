drop database twitter;
create database twitter;
use twitter;
create table login_signup(
	id varchar(20) not null primary key,
    pwd varchar(30) not null
);
create table user(
	user_id int auto_increment not null primary key,
    id varchar(20) not null references login_setup(id),
    pwd varchar(30) not null references login_setup(pwd),
    name varchar(15) not null,
    age int not null,
    interest_id varchar(15) not null references interest(interest_id),
    region_id varchar(15) not null references region(region_id)
);
create table post(
	post_id int auto_increment not null primary key,
    content text,
    writer_id int not null references user(user_id),
    num_of_likes int,
    written_date datetime
);
create table comment(
	comment_id int auto_increment not null primary key,
    content text,
    writer_id int not null references user(user_id),
    post_id int not null references post(post_id),
    num_of_likes int
);
create table child_comment(
	child_id int auto_increment primary key,
	comment_id int not null references comment(comment_id),
    user_id int not null references user(user_id),
    content text
);
create table interest(
	interest_id varchar(15) not null primary key
);
create table region(
	region_id varchar(15) not null primary key
);
create table follower(
	user_id int not null references user(user_id),
    follower_id int not null references user(user_id)
);
create table following(
    user_id int not null references user(user_id),
    follower_id int not null references user(user_id)
);
create table recommend(
	recommend_id int not null references user(user_id),
    post_id int not null references post(post_id),
    written_date datetime not null references post(written_date)
);
show tables;