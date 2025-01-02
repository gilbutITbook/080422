-- mapdonalds DB 진입
USE mapdonalds;

-- 가장 비싼 버거와 가장 싼 버거의 price 조회
SELECT MAX(price), MIN(price)
FROM burgers;

-- 무게가 240을 초과하는 버거의 개수 세기
SELECT COUNT(*) 
FROM burgers 
WHERE gram > 240; 

-- employees 테이블 생성
CREATE TABLE employees (
	id INTEGER, 				-- 아이디
	name VARCHAR(50), 			-- 직원명
	department VARCHAR(200), 	-- 소속 부서
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- employees 데이터 삽입
INSERT INTO employees (id, name, department)
VALUES
	(1, 'Alice', 'Sales'),
	(2, 'Bob', 'Marketing'),
	(3, 'Carol', NULL),
	(4, 'Dave', 'Marketing'),
	(5, 'Joseph', 'Sales');

-- 모든 직원 수 세기
SELECT COUNT(*)
FROM employees;

-- 부서에 소속된 직원 수 세기
SELECT COUNT(department)
FROM employees;

-- 합계 구하기
SELECT SUM(price) 
FROM burgers;

-- 평균 구하기
SELECT AVG(price) 
FROM burgers;

-- 1분 퀴즈 1번
SELECT MAX(kcal), MIN(protein), SUM(price)
FROM burgers
WHERE price < 6000;

-- bank DB 생성 및 진입
CREATE DATABASE bank;
USE bank;

-- transactions 테이블 생성
CREATE TABLE transactions (
	id INTEGER, 			-- 아이디
	amount DECIMAL(12, 2), 	-- 거래 금액
	msg VARCHAR(15), 		-- 거래처
	created_at DATETIME, 	-- 거래 일시
	PRIMARY KEY (id) 		-- 기본키 지정: id
);

-- transactions 데이터 삽입
INSERT INTO transactions (id, amount, msg, created_at)
VALUES
	(1, -24.20, 'Google', '2024-11-01 10:02:48'),
	(2, -36.30, 'Amazon', '2024-11-02 10:01:05'),
	(3, 557.13, 'Udemy', '2024-11-10 11:00:09'),
	(4, -684.04, 'Bank of America', '2024-11-15 17:30:16'),
	(5, 495.71, 'PayPal', '2024-11-26 10:30:20'),
	(6, 726.87, 'Google', '2024-11-26 10:31:04'),
	(7, 124.71, 'Amazon', '2024-11-26 10:32:02'),
	(8, -24.20, 'Google', '2024-12-01 10:00:21'),
	(9, -36.30, 'Amazon', '2024-12-02 10:03:43'),
	(10, 821.63, 'Udemy', '2024-12-10 11:01:19'),
	(11, -837.25, 'Bank of America', '2024-12-14 17:32:54'),
	(12, 695.96, 'PayPal', '2024-12-27 10:32:02'),
	(13, 947.20, 'Google', '2024-12-28 10:33:40'),
	(14, 231.97, 'Amazon', '2024-12-28 10:35:12'),
	(15, -24.20, 'Google', '2025-01-03 10:01:20'),
	(16, -36.30, 'Amazon', '2025-01-03 10:02:35'),
	(17, 1270.87, 'Udemy', '2025-01-10 11:03:55'),
	(18, -540.64, 'Bank of America', '2025-01-14 17:33:01'),
	(19, 732.33, 'PayPal', '2025-01-25 10:31:21'),
	(20, 1328.72, 'Google', '2025-01-26 10:32:45'),
	(21, 824.71, 'Amazon', '2025-01-27 10:33:01'),
	(22, 182.55, 'Coupang', '2025-01-27 10:33:25'),
	(23, -24.20, 'Google', '2025-02-03 10:02:23'),
	(24, -36.30, 'Amazon', '2025-02-03 10:02:34'),
	(25, -36.30, 'Notion', '2025-02-03 10:04:51'),
	(26, 1549.27, 'Udemy', '2025-02-14 11:00:01'),
	(27, -480.78, 'Bank of America', '2025-02-14 17:30:12');
    
-- Google과 거래한 금액의 합계 구하기
SELECT SUM(amount)
FROM transactions 
WHERE msg = 'Google';

-- PayPal과 거래한 금액의 최댓값/최솟값 구하기
SELECT MAX(amount), MIN(amount) 
FROM transactions
WHERE msg = 'PayPal';

-- Coupang 및 Amazon과 거래한 횟수 세기
SELECT COUNT(*) 
FROM transactions 
WHERE msg = 'Coupang'OR msg = 'Amazon';

-- Coupang 및 Amazon과 거래한 횟수 세기: IN 연산자 사용
SELECT COUNT(*)
FROM transactions
WHERE msg IN ('Coupang', 'Amazon');

-- Google 및 Amazon에서 입금받은 금액의 평균 구하기
SELECT AVG(amount) 
FROM transactions 
WHERE msg IN ('Google', 'Amazon') AND amount > 0;

-- msg 목록 조회
SELECT msg
FROM transactions;

-- 중복을 제거한 msg 목록 조회
SELECT DISTINCT msg 
FROM transactions; 

-- 중복을 제거한 msg 수 세기
SELECT COUNT(DISTINCT msg) 
FROM transactions; 