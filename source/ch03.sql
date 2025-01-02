-- mapdonalds DB 진입
USE mapdonalds;

-- burgers 테이블 생성
CREATE TABLE burgers (
	id INTEGER, 		-- 아이디(정수형 숫자)
	name VARCHAR(50), 	-- 이름(문자형: 최대 50자)
	price INTEGER, 		-- 가격(정수형 숫자)
	gram INTEGER, 		-- 그램(정수형 숫자)
	kcal INTEGER, 		-- 열량(정수형 숫자)
	protein INTEGER, 	-- 단백질량(정수형 숫자)
	PRIMARY KEY (id) 	-- 기본키 지정: id
);

-- burgers 데이터 삽입
INSERT INTO burgers (id, name, price, gram, kcal, protein)
VALUES
	(1, '빅맨', 5300, 223, 583, 27),
	(2, '베이컨 틈메이러 디럭스', 6200, 242, 545, 27),
	(3, '맨스파이시 상해 버거', 5300, 235, 494, 20),
	(4, '슈비두밥 버거', 6200, 269, 563, 21),
	(5, '더블 쿼터파운드 치즈', 7700, 275, 770, 50);

-- 모든 버거 조회
SELECT *
FROM burgers;

-- price가 5500보다 작은 버거 조회
SELECT *
FROM burgers
WHERE price < 5500;

-- price가 5500보다 큰 버거 조회
SELECT *
FROM burgers
WHERE price > 5500;

-- protein이 25보다 작은 버거 조회
SELECT *
FROM burgers
WHERE protein < 25;

-- price가 5500보다 작고 protein이 25보다 큰 버거 조회
SELECT *
FROM burgers
WHERE price < 5500 AND protein > 25;

-- price가 5500보다 작거나 protein이 25보다 큰 버거 조회
SELECT *
FROM burgers
WHERE price < 5500 OR protein > 25;

-- protein이 25보다 크지 않은 버거 조회
SELECT *
FROM burgers
WHERE NOT protein > 25;

-- 두 수의 덧셈
SELECT 100 + 20;

-- 두 수의 뺄셈, 곱셈, 나눗셈, 나머지
SELECT 100 - 20; 
SELECT 100 * 20;
SELECT 100 / 20;
SELECT 100 % 20;

-- 연산자 우선순위
SELECT 3 + 5 * 2; 
SELECT (3 + 5) * 2; 
SELECT TRUE OR TRUE AND FALSE; 
SELECT (TRUE OR TRUE) AND FALSE; 

-- university DB 생성 및 진입
CREATE DATABASE university;
USE university;

-- students 테이블 생성
CREATE TABLE students (
	id INTEGER, 			-- 아이디
	nickname VARCHAR(50), 	-- 닉네임
	math INTEGER, 			-- 수학 성적
	english INTEGER, 		-- 영어 성적
	programming INTEGER, 	-- 프로그래밍 성적
	PRIMARY KEY (id) 		-- 기본키 지정: id
);

-- students 데이터 삽입
INSERT INTO students (id, nickname, math, english, programming)
VALUES
	(1, 'Sparkles', 98, 96, 93),
	(2, 'Soldier', 82, 66, 98),
	(3, 'Lapooheart', 84, 70, 82),
	(4, 'Slick', 87, 99, 98),
	(5, 'Smile', 75, 73, 70),
	(6, 'Jellyboo', 84, 82, 70),
	(7, 'Bagel', 97, 91, 87),
	(8, 'Queen', 99, 100, 88);

-- math, english, programming이 모두 90점 이상인 학생 찾기
SELECT *
FROM students
WHERE math >= 90 AND english >= 90 AND programming >= 90;

-- 75점 미만이 하나라도 있는 학생 찾기
SELECT *
FROM students
WHERE math < 75 OR english < 75 OR programming < 75;

-- 모든 학생의 총점 구하기
SELECT nickname, math, english, programming, math + english + programming
FROM students;

-- 모든 학생의 평균 구하기
SELECT nickname, math, english, programming, (math + english + programming) / 3
FROM students;

-- 총점이 270 이상인 학생의 닉네임, 총점, 평균 출력하기
SELECT
	nickname AS 닉네임,
	(math + english + programming) AS 총점,
	(math + english + programming) / 3 AS 평균
FROM students
WHERE (math + english + programming) >= 270;

