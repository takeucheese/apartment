-- 部屋テーブルのシード値
insert into rooms
    (apartment_id, room_number, name, capacity)
values
    (1, 001, '001_全体', 100),
    (1, 010, '010_グループ1', null),
    (2, 001, '001_グループA', 10);
