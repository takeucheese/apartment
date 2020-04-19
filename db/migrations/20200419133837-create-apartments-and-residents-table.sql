-- アパートメントテーブルと居住者テーブルの作成
-- +migrate Up
create table apartments
(
	id bigint unsigned auto_increment comment 'アパートメントID',
	apartment_name varchar(100) not null comment 'アパートメントの名称',
	created_at datetime default current_timestamp not null comment '作成日時',
	updated_at datetime default current_timestamp on update current_timestamp not null comment '最終更新日時',
	constraint apartments_pk
		primary key (id)
)
comment 'アパートメントテーブル(組織や団体を管理する)';

create unique index apartments_apartment_name_uindex
	on apartments (apartment_name);

create table residents
(
	apartment_id bigint unsigned not null comment 'アパートメントID',
	user_id bigint unsigned not null comment 'ユーザーID',
	moved_in_at datetime default current_timestamp not null comment '入居日時',
	moved_out_at datetime null comment '退去日',
	constraint residents_pk
		primary key (user_id, apartment_id),
	constraint residents_apartments_id_fk
		foreign key (apartment_id) references apartments (id)
			on update cascade on delete cascade,
	constraint residents_users_id_fk
		foreign key (user_id) references users (id)
			on update cascade on delete cascade
)
comment '居住者テーブル(アパートメントとユーザーの中間テーブル)';

create index residents_apartment_id_index
	on residents (apartment_id);

create index residents_user_id_index
	on residents (user_id);

-- +migrate Down
alter table residents drop foreign key residents_apartments_id_fk;
alter table residents drop foreign key residents_users_id_fk;
drop table residents;
drop table apartments;
