-- 1. starbuuks DB 생성 및 진입
CREATE DATABASE starbuuks;
USE starbuuks;

-- 2. coffees 테이블 생성
CREATE TABLE coffees (
	id INTEGER,
	name VARCHAR(20),
	price INTEGER,
	PRIMARY KEY (id)
);

-- 3. coffees 데이터 삽입
INSERT INTO coffees (id, name, price)
VALUES
	(1, '아메리카노', 3800),
	(2, '카페라떼', 4000),
	(3, '콜드브루', 3500),
	(4, '카페모카', 4500),
	(5, '카푸치노', 5000);

-- 4. 모든 커피 이름 조회
SELECT name
FROM coffees;

-- 5. 카푸치노 가격 200원 인상
UPDATE coffees
SET price = price + 200
WHERE id = 5;

-- 6. 콜드브루 삭제
DELETE FROM coffees
WHERE id = 3;

-- 7. 모든 커피 데이터 조회
SELECT *
FROM coffees;