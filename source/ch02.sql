/*******************
* 2.2 첫 데이터베이스 만들기 *
*******************/
SHOW DATABASES;				-- 모든 DB 목록 조회
CREATE DATABASE mapdonalds;	-- mapdonalds DB 생성
USE mapdonalds;				-- mapdonalds DB 진입
SELECT DATABASE();			-- 현재 사용 중인 DB 조회
DROP DATABASE mapdonalds;	-- mapdonalds DB 삭제

CREATE DATABASE mapdonalds; -- mapdonalds DB 생성
USE mapdonalds; 			-- mapdonalds DB 진입

-- burgers 테이블 생성
CREATE TABLE burgers (
	id INTEGER, 		-- 아이디(정수형 숫자)
	name VARCHAR(50), 	-- 이름(문자형: 최대 50자)
	price INTEGER,		-- 가격(정수형 숫자)
	gram INTEGER, 		-- 그램(정수형 숫자)
	kcal INTEGER, 		-- 열량(정수형 숫자)
	protein INTEGER, 	-- 단백질량(정수형 숫자)
	PRIMARY KEY (id) 	-- 기본키 지정: id
);

-- burgers 테이블의 구조 조회
DESC burgers;

-- 단일 데이터 삽입
INSERT INTO burgers (id, name, price, gram, kcal, protein)
VALUES (1, '빅맨', 5300, 223, 583, 27);

-- burgers 테이블의 모든 칼럼 조회
SELECT *
FROM burgers;

-- 다중 데이터 삽입
INSERT INTO burgers (id, name, price, gram, kcal, protein)
VALUES
	(2, '베이컨 틈메이러 디럭스', 6200, 242, 545, 27),
	(3, '맨스파이시 상하이 버거', 5300, 235, 494, 20),
	(4, '슈비두밥 버거', 6200, 269, 563, 21),
	(5, '더블 쿼터파운드 치즈', 7700, 275, 770, 50);

-- name, price 칼럼 조회
SELECT name, price
FROM burgers;

-- 안전모드 해제
SET SQL_SAFE_UPDATES = 0;

-- 모든 버거의 가격을 1000으로 수정
UPDATE burgers
SET price = 1000;

-- 안전모드 재설정
SET SQL_SAFE_UPDATES = 1;

-- burgers 테이블의 모든 칼럼 조회
SELECT *
FROM burgers;

-- 빅맨 가격을 500으로 수정
UPDATE burgers 
SET price = 500 
WHERE id = 1;

-- burgers 테이블 조회
SELECT *
FROM burgers;

-- 슈비두밥 버거 삭제
DELETE FROM burgers 
WHERE id = 4;

-- burgers 테이블 조회
SELECT *
FROM burgers;

-- burgers 테이블 삭제
DROP TABLE burgers;

-- burgers 테이블의 구조 조회
DESC burgers;

-- burgers 테이블 조회
SELECT *
FROM burgers;