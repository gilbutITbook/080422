-- data_modeling DB 생성 및 진입
CREATE DATABASE data_modeling;
USE data_modeling;

-- users 테이블 생성
CREATE TABLE users (
	id INTEGER AUTO_INCREMENT, 			-- 아이디(자동으로 1씩 증가)
	email VARCHAR(100) NOT NULL UNIQUE, -- 이메일(필수 입력, 고유키 지정)
	name VARCHAR(50) NOT NULL, 			-- 이름(필수 입력)
	PRIMARY KEY (id) 					-- 기본키 지정: id
);

-- orders 테이블 생성
CREATE TABLE orders (
	id INTEGER AUTO_INCREMENT, 			-- 아이디(자동으로 1씩 증가)
	status VARCHAR(50), 				-- 주문 상태
	created_at DATETIME, 				-- 주문 일시
	user_id INTEGER NOT NULL, 			-- 사용자 아이디(필수 입력)
	PRIMARY KEY (id), 					-- 기본키 지정: id
	FOREIGN KEY (user_id) REFERENCES users(id) 	-- 외래키 지정: user_id
);

-- payments 테이블 생성
CREATE TABLE payments (
	id INTEGER AUTO_INCREMENT, 			-- 아이디(자동으로 1씩 증가)
	amount INTEGER NOT NULL, 			-- 결제 금액(필수 입력)
	payment_type VARCHAR(50) NOT NULL, 	-- 결제 유형(필수 입력)
	order_id INTEGER NOT NULL, 			-- 주문 아이디(필수 입력)
	PRIMARY KEY (id), 					-- 기본키 지정: id
	FOREIGN KEY (order_id) REFERENCES orders(id) -- 외래키 지정: order_id
);

-- products 테이블 생성
CREATE TABLE products (
	id INTEGER AUTO_INCREMENT, 					-- 아이디(자동으로 1씩 증가)
	name VARCHAR(50) NOT NULL UNIQUE, 			-- 상품명(필수 입력, 고유키 지정)
	price INTEGER NOT NULL CHECK(price > 0), 	-- 가격(필수 입력, 양수만 허용)
	product_type VARCHAR(50) DEFAULT 'NONE', 	-- 상품 유형(기본 값 NONE)
	PRIMARY KEY (id), 							-- 기본키 지정: id
	INDEX idx_product_name (name) 				-- 인덱스 생성: name
);

-- order_details 테이블 생성
CREATE TABLE order_details (
	id INTEGER AUTO_INCREMENT, 					-- 아이디(자동으로 1씩 증가)
	order_id INTEGER NOT NULL, 					-- 주문 아이디(필수 입력)
	product_id INTEGER NOT NULL, 				-- 상품 아이디(필수 입력)
	count INTEGER NOT NULL CHECK(count > 0), 	-- 수량(필수 입력, 양수만 허용)
	PRIMARY KEY (id), 							-- 기본키 지정: id
	FOREIGN KEY (order_id) REFERENCES orders(id), 		-- 외래키 지정: order_id
	FOREIGN KEY (product_id) REFERENCES products(id), 	-- 외래키 지정: product_id
	UNIQUE (order_id, product_id) 				-- 고유키 지정: order_id, product_id
);