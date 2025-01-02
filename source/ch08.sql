-- group_analysis DB 생성 및 진입
CREATE DATABASE group_analysis;
USE group_analysis;

-- students 테이블 생성
CREATE TABLE students (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	gender VARCHAR(10), 		-- 성별
	height DECIMAL(4, 1), 		-- 키
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- students 데이터 삽입
INSERT INTO students (gender, height)
VALUES
	('male', 176.6),
	('female', 165.5),
	('female', 159.3),
	('male', 172.8),
	('female', 160.7),
	('female', 170.2),
	('male', 182.1);
    
-- 전체 학생의 평균 키 구하기
SELECT AVG(height)
FROM students;

-- 성별 평균 키 구하기
SELECT gender, AVG(height) 
FROM students 
GROUP BY gender; 

-- sales 테이블 생성
CREATE TABLE sales (
	id INTEGER AUTO_INCREMENT,  	-- 아이디(자동으로 1씩 증가)
	city VARCHAR(50) NOT NULL,   	-- 도시명
	sale_date DATE NOT NULL,      	-- 판매 날짜
	amount INTEGER NOT NULL,     	-- 판매 금액
	PRIMARY KEY (id)				-- 기본키 지정: id
);

-- sales 데이터 삽입
INSERT INTO sales (city, sale_date, amount) 
VALUES
	('Seoul', '2023-01-15', 1000),
	('Seoul', '2023-05-10', 2000),
	('Seoul', '2023-08-29', 2500),
	('Seoul', '2024-02-14', 4000),
	('Busan', '2023-03-05', 1500),
	('Busan', '2024-05-10', 1800),
	('Busan', '2024-07-20', 3000),
	('Incheon', '2023-11-25', 1200),
	('Incheon', '2024-03-19', 2200),
	('Incheon', '2024-09-12', 3300);  

-- 특정 도시의 연도별 총 매출 집계
SELECT city AS '도시', YEAR(sale_date) AS '판매 연도', SUM(amount) AS '총 매출'
FROM sales
GROUP BY city, YEAR(sale_date);

-- payments 테이블 생성
CREATE TABLE payments (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	amount INTEGER, 			-- 결제 금액
	ptype VARCHAR(50), 			-- 결제 유형
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- payments 데이터 삽입
INSERT INTO payments (amount, ptype)
VALUES
	(33640, 'SAMSONG CARD'),
	(33110, 'SAMSONG CARD'),
	(31200, 'LOTTI CARD'),
	(69870, 'COCOA PAY'),
	(32800, 'COCOA PAY'),
	(42210, 'LOTTI CARD'),
	(46060, 'LOTTI CARD'),
	(42520, 'SAMSONG CARD'),
	(23070, 'COCOA PAY');

-- 그룹화 필터링 실습
SELECT ptype AS '결제 유형', AVG(amount) AS '평균 결제 금액'
FROM payments
GROUP BY ptype 
HAVING AVG(amount) > 40000; 

-- 단일 칼럼으로 정렬하기
SELECT ptype AS '결제 유형', amount AS '결제 금액'
FROM payments
ORDER BY amount DESC;

-- 다중 칼럼으로 정렬하기
SELECT ptype AS '결제 유형', amount AS '결제 금액'
FROM payments
ORDER BY ptype ASC, amount DESC;

-- 조회 개수 제한
SELECT ptype AS '결제 유형', amount AS '결제 금액'
FROM payments
ORDER BY amount DESC
LIMIT 3;

-- 조회 개수 제한(OFFSET 이용)
SELECT ptype AS '결제 유형', amount AS '결제 금액'
FROM payments 
ORDER BY amount DESC 
LIMIT 3 OFFSET 3;

-- 1분 퀴즈 2번
SELECT ptype AS '결제 유형', COUNT(*) AS '결제 횟수', AVG(amount) AS '평균 결제 금액'
FROM payments
GROUP BY ptype
ORDER BY COUNT(*) DESC, AVG(amount) DESC;

-- market DB 생성 및 진입
CREATE DATABASE market;
USE market;

-- users 테이블 생성
CREATE TABLE users (
	id INTEGER AUTO_INCREMENT, 		-- 아이디(자동으로 1씩 증가)
	email VARCHAR(255) UNIQUE, 		-- 이메일(고유한 값만 허용)
	nickname VARCHAR(255) UNIQUE, 	-- 닉네임(고유한 값만 허용)
	PRIMARY KEY (id) 				-- 기본키 지정: id
);

-- users 데이터 삽입
INSERT INTO users (email, nickname)
VALUES
	('sehongpark@cloudstudying.kr', '홍팍'),
	('kuma@cloudstudying.kr', '쿠마'),
	('hawk@cloudstudying.kr', '호크');
    
-- orders 테이블 생성
CREATE TABLE orders (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	status VARCHAR(50), 		-- 주문 상태
	created_at DATETIME, 		-- 주문 생성 시각
	user_id INTEGER, 			-- 사용자 아이디
	PRIMARY KEY (id), 			-- 기본키 지정: id
	FOREIGN KEY (user_id) REFERENCES users(id) -- 외래키 지정: user_id
);

-- orders 데이터 삽입
INSERT INTO orders (status, created_at, user_id)
VALUES
	('배송 완료', '2024-11-12 11:07:12', 1),
	('배송 완료', '2024-11-17 22:14:54', 1),
	('배송 완료', '2024-11-24 19:13:46', 2),
	('배송 완료', '2024-11-29 23:57:29', 3),
	('배송 완료', '2024-12-06 22:25:13', 3),
	('배송 완료', '2025-01-02 13:04:25', 2),
	('배송 완료', '2025-01-06 15:45:51', 2),
	('장바구니', '2025-03-06 14:54:23', 1);
    
-- payments 테이블 생성
CREATE TABLE payments (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	amount INTEGER, 			-- 결제 금액
	payment_type VARCHAR(50), 	-- 결제 유형
	order_id INTEGER, 			-- 주문 아이디
	PRIMARY KEY (id), 			-- 기본키 지정: id
	FOREIGN KEY (order_id) REFERENCES orders(id) -- 외래키 지정: order_id
);

-- payments 데이터 삽입
INSERT INTO payments (amount, payment_type, order_id)
VALUES
	(9740, 'SAMSONG CARD', 1),
	(13800, 'SAMSONG CARD', 2),
	(32200, 'LOTTI CARD', 3),
	(28420, 'COCOA PAY', 4),
	(18000, 'COCOA PAY', 5),
	(5910, 'LOTTI CARD', 6),
	(17300, 'LOTTI CARD', 7);

-- products 테이블 생성
CREATE TABLE products (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	name VARCHAR(100), 			-- 상품명
	price INTEGER, 				-- 가격
	product_type VARCHAR(50), 	-- 상품 유형
	PRIMARY KEY(id) 			-- 기본키 지정: id
);

-- products 데이터 삽입
INSERT INTO products (name, price, product_type)
VALUES
	('우유 900ml', 1970, '냉장 식품'),
	('참치 마요 120g', 4400, '냉장 식품'),
	('달걀 감자 샐러드 500g', 6900, '냉장 식품'),
	('달걀 듬뿍 샐러드 500g', 6900, '냉장 식품'),
	('크림 치즈', 2180, '냉장 식품'),
	('우유 식빵', 2900, '상온 식품'),
	('샐러드 키트 6봉', 8900, '냉장 식품'),
	('무항생제 특란 20구', 7200, '냉장 식품'),
	('수제 크림 치즈 200g', 9000, '냉장 식품'),
	('플레인 베이글', 1300, '냉장 식품');
    
-- order_details 테이블 생성
CREATE TABLE order_details (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	order_id INTEGER, 			-- 주문 아이디
	product_id INTEGER, 		-- 상품 아이디
	count INTEGER, 				-- 주문 수량
	PRIMARY KEY (id), 			-- 기본키 지정: id
	FOREIGN KEY (order_id) REFERENCES orders(id), 	 -- 외래키 지정: order_id
	FOREIGN KEY (product_id) REFERENCES products(id) -- 외래키 지정: product_id
);

-- order_details 데이터 삽입
INSERT INTO order_details (order_id, product_id, count)
VALUES
	(1, 1, 2),
	(1, 6, 2),
	(2, 3, 1),
	(2, 4, 1),
	(3, 7, 2),
	(3, 8, 2),
	(4, 2, 3),
	(4, 5, 4),
	(4, 10, 5),
	(5, 9, 2),
	(6, 1, 3),
	(7, 8, 2),
	(7, 6, 1),
	(8, 6, 3);
    
-- 상품 유형별 집계
SELECT product_type AS '상품 유형', COUNT(*) AS '상품 개수', MAX(price) AS '최고 가격', MIN(price) AS '최저 가격'
FROM products
GROUP BY product_type;

-- 사용자별 주문 총액 필터링
SELECT nickname AS '주문자명', SUM(amount) AS '주문 총액'
FROM users 
JOIN orders ON users.id = orders.user_id
JOIN payments ON orders.id = payments.order_id
GROUP BY nickname
HAVING SUM(amount) >= 30000;

-- 가장 많이 팔린 상품 TOP 3 찾기
SELECT name AS '상품명', SUM(count) AS '판매 수량'
FROM products
JOIN order_details ON products.id = order_details.product_id
JOIN orders ON order_details.order_id = orders.id AND status = '배송 완료'
GROUP BY name
ORDER BY SUM(count) DESC, name ASC
LIMIT 3;

-- 1분 퀴즈 3번
SELECT name AS '상품명', SUM(price * count) AS '누적 매출'
FROM products
JOIN order_details ON products.id = order_details.product_id
JOIN orders ON order_details.order_id = orders.id AND status = '배송 완료'
GROUP BY name
ORDER BY SUM(price * count) DESC
LIMIT 3;
