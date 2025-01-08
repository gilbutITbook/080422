-- data_type DB 생성 및 진입
CREATE DATABASE data_type;
USE data_type;

-- student_records 테이블 생성
CREATE TABLE student_records (
	id INTEGER, 				-- 아이디(표준 정수)
	grade TINYINT UNSIGNED, 	-- 학년(부호가 없는 매우 작은 정수)
	average_score FLOAT, 		-- 평균 점수(부동 소수점 방식의 실수)
	tuition_fee DECIMAL(10, 2), -- 수업료(고정 소수점 방식의 실수)
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- student_records 데이터 삽입
INSERT INTO student_records (id, grade, average_score, tuition_fee)
VALUES
	(1, 3, 88.75, 50000.00),
	(2, 6, 92.5, 100000.00);
    
-- 데이터 조회
SELECT *
FROM student_records;

-- user_profiles 테이블 생성
CREATE TABLE user_profiles (
	id INTEGER, 				-- 아이디(표준 정수)
	email VARCHAR(255), 		-- 이메일(가변 길이 문자: 최대 255자)
	phone_number CHAR(13), 		-- 전화번호(고정 길이 문자: 13자)
	self_introduction TEXT, 	-- 자기소개(긴 문자열: 최대 64KB)
	profile_picture MEDIUMBLOB, -- 프로필 사진(파일: 최대 16MB)
	gender ENUM('남', '여'), 		-- 성별(선택 목록 중 택 1)
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- user_profiles 데이터 삽입
INSERT INTO user_profiles (id, email, phone_number, self_introduction, profile_picture, gender)
VALUES
	(1, 'hongpark@example.com', '012-3456-7890', '안녕하십니까!', NULL, '남'),
	(2, 'hongsoon@example.com', '987-6543-2109', '반갑습니다!', NULL, '여');
    
-- 데이터 조회
SELECT *
FROM user_profiles;

-- events 테이블 생성
CREATE TABLE events (
	id INTEGER, 				-- 아이디(표준 정수)
	event_name VARCHAR(100), 	-- 이벤트명(가변 길이 문자: 최대 100자)
	event_date DATE, 			-- 이벤트 일자(YYYY-MM-DD)
	start_time TIME, 			-- 이벤트 시간(hh:mm:ss)
	created_at DATETIME, 		-- 이벤트 등록 일시(YYYY-MM-DD hh:mm:ss)
	event_year YEAR, 			-- 이벤트 연도(YYYY)
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- events 데이터 삽입
INSERT INTO events (id, event_name, event_date, start_time, created_at, event_year)
VALUES
	(111, 'Music Festival', '2024-10-04', '17:55:00', '2024-09-04 10:25:30', '2024'),
	(222, 'Art Exhibition', '2024-11-15', '12:00:00', '2024-09-05 11:30:00', '2024');
    
-- 데이터 조회
SELECT *
FROM events;

-- store DB 생성 및 진입
CREATE DATABASE store;
USE store;

-- orders 테이블 생성
CREATE TABLE orders (
	id INTEGER, 			-- 아이디(표준 정수)
	name VARCHAR(255), 		-- 상품명(가변 길이 문자: 최대 255자)
	price DECIMAL(10, 2), 	-- 가격(고정 소수점 방식 실수)
	quantity INTEGER, 		-- 주문 수량(표준 정수)
	created_at DATETIME, 	-- 주문 일시(날짜 및 시간형)
	PRIMARY KEY (id) 		-- 기본키 지정: id
);

-- orders 데이터 삽입
INSERT INTO orders (id, name, price, quantity, created_at)
VALUES
	(1, '생돌김 50매', 5387.75, 1, '2024-10-24 01:19:44'),
	(2, '그릭 요거트 400g, 2개', 7182.25, 2, '2024-10-24 01:19:44'),
	(3, '냉장 닭다리살 500g', 6174.50, 1, '2024-10-24 01:19:44'),
	(4, '냉장 고추장 제육 1kg', 9765.00, 1, '2024-10-24 01:19:44'),
	(5, '결명자차 8g * 18티백', 4092.25, 1, '2024-10-24 01:19:44'),
	(6, '올리브 오일 1l', 17990.00, 1, '2024-11-06 22:52:33'),
	(7, '두유 950ml, 20개', 35900.12, 1, '2024-11-06 22:52:33'),
	(8, '카카오 닙스 1kg', 12674.50, 1, '2024-11-06 22:52:33'),
	(9, '손질 삼치살 600g', 9324.75, 1, '2024-11-16 14:55:23'),
	(10, '자숙 바지락 260g', 6282.00, 1, '2024-11-16 14:55:23'),
	(11, '크리스피 핫도그 400g', 7787.50, 2, '2024-11-16 14:55:23'),
	(12, '우유 900ml', 4360.00, 2, '2024-11-16 14:55:23'),
	(13, '모둠 해물 800g', 4770.15, 1, '2024-11-28 11:12:09'),
	(14, '토마토 케첩 800g', 3120.33, 3, '2024-11-28 11:12:09'),
	(15, '계란 30구', 8490.00, 2, '2024-12-11 12:34:56'),
	(16, '해물 모듬 5팩 묶음 400g', 9800.50, 4, '2024-12-11 12:34:56'),
	(17, '칵테일 새우 900g', 22240.20, 1, '2024-12-11 12:34:56'),
	(18, '토마토 케첩 1.43kg', 7680.25, 1, '2024-12-11 12:34:56'),
	(19, '국내산 양파 3kg', 5192.00, 1, '2024-12-11 12:34:56'),
	(20, '국내산 깐마늘 1kg', 9520.25, 1, '2024-12-11 12:34:56');
    
-- name이 '케첩'인 주문 조회
SELECT *
FROM orders
WHERE name LIKE '케첩';

-- name에 '케첩'이 포함된 주문 조회
SELECT *
FROM orders
WHERE name LIKE '%케첩%';

-- 11월에 주문받은 상품 개수의 합계
SELECT SUM(quantity)
FROM orders
WHERE MONTH(created_at) = 11; 

-- 오전에 주문받은 매출의 합계
SELECT SUM(price * quantity)
FROM orders 
WHERE HOUR(created_at) < 12;

-- price가 10000~20000 사이의 주문 조회
SELECT * 
FROM orders 
WHERE price BETWEEN 10000 AND 20000;

-- 2024-11-15~2024-12-15 사이의 주문 개수의 합계
SELECT COUNT(*) 
FROM orders 
WHERE created_at BETWEEN '2024-11-15' AND '2024-12-15';

-- 상품명의 첫 글자가 'ㄱ'으로 시작하는 주문 조회
SELECT * 
FROM orders 
WHERE name BETWEEN 'ㄱ' AND '깋';
