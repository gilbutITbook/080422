-- stargram DB 진입
USE stargram;

-- 1. 사용자 닉네임과 계정 공개 여부 조회
SELECT nickname AS '닉네임', private AS '계정 공개 여부'
FROM users
JOIN settings ON users.id = settings.user_id;

-- 2. 사진 파일명과 올린 사람 닉네임 조회
SELECT filename AS '파일명', nickname AS '게시자'
FROM photos
JOIN users ON photos.user_id = users.id;

-- 3. 모든 사진 파일명과 올린 사람 닉네임 조회
SELECT filename AS '파일명', nickname AS '게시자'
FROM photos
LEFT JOIN users ON photos.user_id = users.id;