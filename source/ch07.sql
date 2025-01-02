-- stargram DB 진입
USE stargram;

-- 1번 사진 댓글 정보 조회
SELECT *
FROM comments
WHERE photo_id = 1;

-- comments 테이블과 users 테이블 조인
SELECT nickname, body
FROM comments
JOIN users ON comments.user_id = users.id
WHERE photo_id = 1;

-- 연속 조인 연습
SELECT nickname, body, filename 
FROM comments 
JOIN users ON comments.user_id = users.id
JOIN photos ON comments.photo_id = photos.id;

-- 중복 칼럼 id에 테이블명 명시
SELECT comments.id, body, users.id, nickname
FROM comments
JOIN users ON comments.user_id = users.id
WHERE photo_id = 2;

-- comments 테이블과 users 테이블에 별칭 붙이기
SELECT nickname, body
FROM comments AS c
JOIN users AS u ON c.user_id = u.id;

-- photos 테이블과 users 테이블 INNER 조인
SELECT *
FROM photos
JOIN users ON photos.user_id = users.id;

-- photos 테이블과 users 테이블 LEFT 조인
SELECT *
FROM photos
LEFT JOIN users ON photos.user_id = users.id;

-- photos 테이블과 users 테이블 RIGHT 조인
SELECT *
FROM photos
RIGHT JOIN users ON photos.user_id = users.id;

-- photos 테이블과 users 테이블을 FULL 조인한 결과와 같게 만들기
(
	SELECT *
	FROM photos
	LEFT JOIN users ON photos.user_id = users.id
)
UNION -- 두 쿼리의 결과 테이블을 하나로 합치기(중복 데이터는 제거)
(
	SELECT *
	FROM photos
	RIGHT JOIN users ON photos.user_id = users.id
);

-- users 테이블과 photos 테이블 조인
SELECT nickname AS '게시자', filename AS '파일명'
FROM users
JOIN photos ON users.id = photos.user_id
WHERE nickname = '홍팍';

-- users, photos, likes 테이블 조인
SELECT COUNT(*) AS '홍팍이 올린 사진의 좋아요 수'
FROM users
JOIN photos ON users.id = photos.user_id AND nickname = '홍팍'
JOIN likes ON likes.photo_id = photos.id;

-- comments 테이블과 users 테이블 조인
SELECT COUNT(*) AS '해삼이 작성한 모든 댓글의 수'
FROM comments
JOIN users ON comments.user_id = users.id AND nickname = '해삼';

-- comments 테이블과 photos 테이블 조인
SELECT body AS '댓글 내용', filename AS '파일명'
FROM comments
LEFT JOIN photos ON comments.photo_id = photos.id;