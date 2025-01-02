-- store DB 진입
USE store;

-- 1. name이 '국내산'으로 시작하는 주문의 개수
SELECT COUNT(*)
FROM orders
WHERE name LIKE '국내산%';

-- 2. quantity가 2~4개인 상품의 평균 가격
SELECT AVG(price)
FROM orders
WHERE quantity BETWEEN 2 AND 4;

-- 3. created_at의 '월'이 11이면서 '일'이 20일 이후인 주문의 개수
SELECT COUNT(*)
FROM orders
WHERE MONTH(created_at) = 11 AND DAY(created_at) > 20;

-- 4. name에 부피 단위인 'ml' 또는 'l'가 포함된 주문
SELECT *
FROM orders
WHERE name LIKE '%ml%' OR name LIKE '%l%';

-- 5. created_at의 '월'이 10과 12인 주문의 개수
SELECT COUNT(*)
FROM orders
WHERE MONTH(created_at) IN (10, 12);