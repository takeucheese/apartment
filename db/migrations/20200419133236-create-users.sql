-- ユーザーテーブルの作成

-- +migrate Up
create table users
(
    id            bigint unsigned auto_increment comment 'ユーザーID'
        primary key,
    username      varchar(100)                       not null comment 'ユーザーネーム',
    email         varchar(511)                       not null comment 'メールアドレス',
    password      varchar(255)                       not null comment 'パスワード',
    last_name     varchar(50)                        not null comment '性',
    first_name    varchar(50)                        not null comment '名',
    last_name_en  varchar(100)                       not null comment '性(英語表記)',
    first_name_en varchar(100)                       not null comment '名(英語表記)',
    sex           enum ('MALE', 'FEMALE')            null comment '生物学的な性別',
    birth         date                               null comment '生年月日',
    phone         varchar(11)                        null comment '電話番号(ハイフン無し)',
    created_at    datetime default CURRENT_TIMESTAMP not null comment '作成日時',
    updated_at    datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '最終更新日時',
    constraint users_email_uindex
        unique (email),
    constraint users_username_uindex
        unique (username)
)
    comment 'ユーザーテーブル';

-- +migrate Down
drop table users;
