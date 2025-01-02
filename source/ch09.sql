-- sub_query DB 생성 및 진입
CREATE DATABASE sub_query;
USE sub_query;

-- students 테이블 생성
CREATE TABLE students (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	name VARCHAR(30), 			-- 이름
	score INTEGER, 				-- 성적
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- students 데이터 삽입
INSERT INTO students (name, score)
VALUES
	('엘리스', 85),
	('밥', 78),
	('찰리', 92),
	('데이브', 65),
	('이브', 88);

-- 평균 점수보다 더 높은 점수를 받은 학생 조회
SELECT *
FROM students
WHERE score > (
	-- 평균 점수 계산
	SELECT AVG(score)
	FROM students
);

-- market DB 진입
USE market;

-- SELECT 절에서의 서브쿼리 실습
SELECT payment_type AS '결제 유형',
	   amount AS '결제 금액',
	   amount - (SELECT AVG(amount) FROM payments) AS '평균 결제 금액과의 차이'
FROM payments;

-- FROM 절에서의 서브쿼리 실습
-- 메인쿼리: 1회 주문 시 평균 상품 개수 집계
SELECT AVG(sub.total_count) AS '1회 주문 시 평균 상품 개수'
FROM (
	-- 서브쿼리: 주문 아이디별 총 상품 개수 집계
	SELECT order_id, SUM(count) AS total_count
	FROM order_details
	GROUP BY order_id
) AS sub; 

-- JOIN 절에서의 서브쿼리 실습
-- 메인쿼리: 상품별 주문 개수 집계
SELECT name AS '상품명', total_count AS '주문 개수'
FROM products
JOIN (
	-- 서브쿼리: 상품 아이디별 주문 개수 집계
	SELECT product_id, SUM(count) AS total_count
	FROM order_details
	GROUP BY product_id
) AS sub ON products.id = sub.product_id; 

-- WHERE 절에서의 서브쿼리 실습
-- 메인쿼리: 평균 가격보다 비싼 상품 조회
SELECT name AS '상품명', price AS '가격'
FROM products
WHERE price > (
	-- 서브쿼리: 상품의 평균 가격 집계
	SELECT AVG(price) AS avg_price
	FROM products
);

-- HAVING 절에서의 서브쿼리 실습
-- 메인쿼리: 크림 치즈보다 매출이 높은 상품 조회
SELECT name AS '상품명', SUM(price * count) AS '매출'
FROM products
JOIN order_details ON products.id = order_details.product_id
GROUP BY name
HAVING SUM(price * count) > (
	-- 서브쿼리: 크림 치즈의 매출 합계 집계
	SELECT SUM(price * count) AS cream_cheese_sales
	FROM products
	JOIN order_details ON products.id = order_details.product_id
	   			       AND name = '크림 치즈'
);

-- IN 연산자 사용 예 1
SELECT id
FROM products
WHERE name IN ('우유 식빵', '크림 치즈');

-- IN 연산자 사용 예 2
-- 메인쿼리: 우유 식빵과 크림 치즈를 포함하는 모든 주문의 상세 내역 조회
SELECT *
FROM order_details
WHERE product_id IN (
	-- 서브쿼리: 우유 식빵 또는 크림 치즈를 포함하는 상품의 id 조회
	SELECT id
	FROM products
	WHERE name IN ('우유 식빵', '크림 치즈')
);

-- 조인과 IN 연산자 실습
SELECT DISTINCT u.id, nickname 
FROM users u 
JOIN orders o ON u.id = o.user_id
JOIN order_details od ON o.id = od.order_id
JOIN products p ON od.product_id = p.id
WHERE name IN ('우유 식빵', '크림 치즈');

-- ANY 연산자 실습
-- 메인쿼리: 우유 식빵이나 플레인 베이글보다 저렴한 상품이 있는지 조회
SELECT name 이름, price 가격
FROM products
WHERE price < ANY (
	-- 서브쿼리: 우유 식빵과 플레인 베이글의 가격 조회
	SELECT price
	FROM products
	WHERE name IN ('우유 식빵', '플레인 베이글')
);

-- ALL 연산자 실습
-- 메인쿼리: 우유 식빵과 플레인 베이글 2가지 보다 가격이 더 높은 상품 조회
SELECT name 이름, price 가격
FROM products
WHERE price > ALL (
	-- 서브쿼리: 우유 식빵과 플레인 베이글의 가격 조회
	SELECT price
	FROM products
	WHERE name IN ('우유 식빵', '플레인 베이글')
);

-- EXISTS 연산자 실습
-- 메인쿼리: 적어도 한 번은 주문한 사용자 조회
SELECT *
FROM users u
WHERE EXISTS (
	-- 서브쿼리: 주문자 아이디가 사용자 테이블에 있다면 1 반환
	SELECT 1
	FROM orders o
	WHERE o.user_id = u.id
);

-- NOT EXISTS 연산자 실습
-- 메인쿼리: COCOA PAY로 결제하지 않은 사용자 조회
SELECT *
FROM users u
WHERE NOT EXISTS (
	-- 서브쿼리: COCOA PAY를 사용한 사용자가 있다면 1 반환
	SELECT 1
	FROM orders o
	JOIN payments p ON o.id = p.order_id
	WHERE o.user_id = u.id AND payment_type = 'COCOA PAY'
);