-- market DB 진입
USE market;

-- 가격이 낮은 하위 4개 상품의 누적 매출
SELECT name AS '상품명', price AS '가격', SUM(price * count) AS '누적 매출'
FROM products
JOIN order_details ON products.id = order_details.product_id
JOIN orders ON order_details.order_id = orders.id AND status = '배송 완료'
GROUP BY name, price
ORDER BY price ASC
LIMIT 4;