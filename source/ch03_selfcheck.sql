-- mapdonalds DB 진입
USE mapdonalds;

-- 1. price가 6000 이상~7000 미만인 버거 조회
SELECT *
FROM burgers
WHERE price >= 6000 AND price < 7000;

-- 2. kcal가 500 미만이거나 protein이 25 이상인 버거 조회
SELECT *
FROM burgers
WHERE kcal < 500 OR protein >= 25;

-- 3. 모든 버거의 100g당 price 조회
SELECT name AS '버거 이름',
       price / gram * 100 AS '100g당 가격'
FROM burgers;

-- 4. 100g당 price가 2500 미만인 버거 조회
SELECT name AS '버거 이름',
	   price AS 가격,
	   gram AS '무게(g)',
	   price / gram * 100 AS '100g당 가격'
FROM burgers
WHERE price / gram * 100 < 2500;

-- 5. 1000원당 들어 있는 protein 조회
SELECT name AS '버거 이름',
	   protein / price * 1000 AS '1000원당 단백질량'
FROM burgers;

-- 6. 1000원당 들어 있는 protein이 5 이상인 버거 조회
SELECT name AS '버거 이름',
	   protein / price * 1000 AS '1000원당 단백질량'
FROM burgers
WHERE protein / price * 1000 >= 5;