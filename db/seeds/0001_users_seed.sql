-- ユーザーテーブルのシード値
insert into users
    (username, email, password, last_name, first_name, last_name_en, first_name_en, sex, birth, phone)
values
    ('test1', 'test_001@test.test', 'todo', '試験', '一', 'shiken', 'ichi', 'MALE', '2020-04-01', '09012345678'),
    ('test2', 'test_002@test.test', 'todo', '試験', '二', 'shiken', 'ni', null, null, null);
