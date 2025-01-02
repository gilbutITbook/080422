-- market DB 진입
USE market;

-- 1. 전체 사용자의 1인당 평균 결제 금액
SELECT SUM(amount) / (SELECT COUNT(*) FROM users) '1인당 평균 결제 금액'
FROM payments;

-- 2. 전체 사용자의 1인당 평균 결제 금액
SELECT AVG(sub.total_amount) AS '1인당 평균 결제 금액'
FROM (
	SELECT u.id AS user_id, SUM(amount) AS total_amount
	FROM users u
	JOIN orders o ON u.id = o.user_id
	JOIN payments p ON o.id = p.order_id
	GROUP BY u.id
) AS sub;

-- 4. 최근에 배송받은 사용자의 총 결제 금액
SELECT SUM(amount)
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN payments p ON o.id = p.order_id
WHERE u.id = (
	SELECT user_id
	FROM orders
	WHERE status = '배송 완료'
	ORDER BY created_at DESC
	LIMIT 1
);