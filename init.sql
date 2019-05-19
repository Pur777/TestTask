USE test;

CREATE TABLE parts
(
    id int(10) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    need BIT DEFAULT false  NOT NULL,
    count int(10)
)
    COLLATE='utf8_general_ci';
CREATE UNIQUE INDEX parts_name_uindex ON parts (name);

INSERT INTO `parts` (`name`,`need`,`count`)
VALUES
("Материнская плата", 1, 10),
("Звуковая карта", 0, 23),
("Процессор", 1, 9),
("Подсветка корпуса", 0, 5),
("HDD диск", 0, 17),
("Корпус", 1, 12),
("Оперативная память", 1, 64),
("SSD диск", 1, 32),
("Видеокарта", 0, 51),
("Блок питания", 1, 18),
("DVD привод", 0, 89),
("Сетевая карта", 0, 6),
("Охлаждение процессора", 0, 37),
("Охлаждение видеокарты", 0, 18),
("Охлаждение корпуса", 0, 66),
("Контроллер", 0, 2),
("Сетевой адаптер", 0, 20),
("Плата видеозахвата", 0, 22),
("Blu-ray привод", 0, 40),
("Тв-тюнер", 0, 5),
("Клавиатура", 0, 88),
("Мышь", 0, 64);
