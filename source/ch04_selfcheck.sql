-- 1. company DB 생성 및 진입, employees 테이블 생성
CREATE DATABASE company;
USE company;

CREATE TABLE employees (
	id INTEGER, 			-- 아이디
	name VARCHAR(50), 		-- 직원명
	department VARCHAR(50),	-- 소속 부서
	salary INTEGER, 		-- 연봉
	PRIMARY KEY (id) 		-- 기본키 지정: id
);

-- 2. 직원 10명의 데이터 삽입
INSERT INTO employees (id, name, department, salary)
VALUES
	(101, 'John', 'Sales', 7000),
	(102, 'Aria', 'IT', 5500),
	(103, 'Mike', 'Sales', 8000),
	(104, 'Lily', 'HR', 6500),
	(105, 'David', 'IT', 7200),
	(106, 'Emma', 'Sales', 6500),
	(107, 'Oliver', 'IT', 5900),
	(108, 'Sophia', 'HR', 6300),
	(109, 'Lucas', 'Sales', 5500),
	(110, 'Charlotte', 'HR', 6800);
    
-- 3. 모든 직원의 연봉 합계
SELECT SUM(salary)
FROM employees;

-- 4. Sales 부서의 평균 연봉
SELECT AVG(salary)
FROM employees
WHERE department = 'Sales';

-- 5. 모든 부서 수 조회
SELECT COUNT(DISTINCT department)
FROM employees;

-- 6. Sales 부서의 최대 연봉과 최소 연봉 차이
SELECT MAX(salary) - MIN(salary)
FROM employees
WHERE department = 'Sales';

-- 7. 최대 연봉 수령자의 연봉과 평균 연봉과의 차이
SELECT MAX(salary) - AVG(salary)
FROM employees;