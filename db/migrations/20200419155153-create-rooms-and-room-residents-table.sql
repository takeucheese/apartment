-- 部屋テーブルと部屋住居者テーブルを作成
-- +migrate Up
create table rooms
(
	id bigint unsigned auto_increment comment '部屋ID',
	apartment_id bigint unsigned not null comment 'アパートメントID',
	room_number int(3) unsigned zerofill not null comment '部屋番号(0埋め3桁:000~999)',
	name varchar(100) not null comment '部屋の名称',
	capacity int unsigned null comment '最大人数(nullの場合は最大値なし)',
	created_at datetime default current_timestamp not null comment '作成日時',
	updated_at datetime default current_timestamp on update current_timestamp not null comment '最終更新日時',
	constraint rooms_pk
		primary key (id),
	constraint rooms_apartments_id_fk
		foreign key (apartment_id) references apartments (id)
			on update cascade on delete cascade
)
comment '部屋(ユーザーのまとまり)';

create unique index rooms_apartment_id_room_number_uindex
	on rooms (apartment_id, room_number);

create table room_residents
(
	room_id bigint unsigned not null comment '部屋ID',
	user_id bigint unsigned not null comment 'ユーザーID',
	moved_in_at datetime default current_timestamp not null comment '入室日時',
	moved_out_at datetime null comment '退出日時',
	constraint room_residents_rooms_id_fk
		foreign key (room_id) references rooms (id)
			on update cascade on delete cascade,
	constraint room_residents_users_id_fk
		foreign key (user_id) references users (id)
			on update cascade on delete cascade
)
comment '部屋住居者テーブル';

create index room_residents_room_id_index
	on room_residents (room_id);

create unique index room_residents_room_id_user_id_uindex
	on room_residents (room_id, user_id);

create index room_residents_user_id_index
	on room_residents (user_id);

-- +migrate Down
alter table room_residents drop foreign key room_residents_rooms_id_fk;
alter table room_residents drop foreign key room_residents_users_id_fk;
drop table room_residents;
alter table rooms drop foreign key rooms_apartments_id_fk;
drop table rooms;
