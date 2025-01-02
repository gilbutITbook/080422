-- relation DB 생성 및 진입
CREATE DATABASE relation;
USE relation;

-- countries 테이블 생성
CREATE TABLE countries (
	id INTEGER, 		-- 아이디
	name VARCHAR(255), 	-- 국가명
	PRIMARY KEY (id)	-- 기본키 지정: id
);

-- capitals 테이블 생성
CREATE TABLE capitals (
	id INTEGER, 				-- 아이디
	name VARCHAR(255), 			-- 수도명
	country_id INTEGER UNIQUE, 	-- 국가 아이디(고유한 값만 허용)
	PRIMARY KEY (id), 			-- 기본키 지정: id
	FOREIGN KEY (country_id) REFERENCES countries(id) -- 외래키 지정: country_id
);

-- countries 데이터 삽입
INSERT INTO countries (id, name)
VALUES
	(1, 'South Korea'),
	(2, 'United States'),
	(3, 'Japan');

-- capitals 데이터 삽입
INSERT INTO capitals (id, name, country_id)
VALUES
	(101, 'Seoul', 1),
	(102, 'Washington D.C.', 2),
	(103, 'Tokyo', 3);
    
-- teams 테이블 생성
CREATE TABLE teams (
	id INTEGER, 		-- 아이디
	name VARCHAR(255), 	-- 팀명
	PRIMARY KEY (id) 	-- 기본키 지정: id
);

-- players 테이블 생성
CREATE TABLE players (
	id INTEGER, 		-- 아이디
	name VARCHAR(255), 	-- 선수명
	team_id INTEGER, 	-- 소속팀 아이디
	PRIMARY KEY (id),	-- 기본키 지정: id
	FOREIGN KEY (team_id) REFERENCES teams(id) -- 외래키 지정: team_id
);

-- teams 데이터 등록
INSERT INTO teams (id, name)
VALUES
	(1, 'FC Awesome'),
	(2, 'Winners United');

-- players 데이터 등록
INSERT INTO players (id, name, team_id)
VALUES
	(1, 'John Doe', 1),
	(2, 'Jane Smith', 1),
	(3, 'Max Payne', 2),
	(4, 'Alex Johnson', 2),
	(5, 'Sara Connor', 2);

-- doctors 테이블 생성
CREATE TABLE doctors (
	id INTEGER, 		-- 아이디
	name VARCHAR(255), 	-- 의사명
	PRIMARY KEY (id) 	-- 기본키 지정: id
);

-- patients 테이블 생성
CREATE TABLE patients (
	id INTEGER, 		-- 아이디
	name VARCHAR(255), 	-- 환자명
	PRIMARY KEY (id) 	-- 기본키 지정: id
);

-- appointments 테이블 생성
CREATE TABLE appointments (
	id INTEGER, 			-- 아이디
	doctor_id INTEGER, 		-- 의사 아이디
	patient_id INTEGER,		-- 환자 아이디
	date DATE, 				-- 진료 일자
	PRIMARY KEY (id), 		-- 기본키 지정: id
	FOREIGN KEY (doctor_id) REFERENCES doctors(id),  -- 외래키 지정: doctor_id
	FOREIGN KEY (patient_id) REFERENCES patients(id) -- 외래키 지정: patient_id
);

-- doctors 데이터 삽입
INSERT INTO doctors (id, name)
VALUES
	(1, '김 닥터'),
	(2, '이 닥터'),
	(3, '최 닥터');

-- patients 데이터 삽입
INSERT INTO patients (id, name)
VALUES
	(1, '환자 A'),
	(2, '환자 B'),
	(3, '환자 C');

-- appointments 데이터 삽입
INSERT INTO appointments (id, doctor_id, patient_id, date)
VALUES
	(1, 1, 1, '2025-01-01'),
	(2, 1, 2, '2025-01-02'),
	(3, 2, 2, '2025-01-03'),
	(4, 2, 3, '2025-01-04'),
	(5, 3, 3, '2025-01-05'),
	(6, 3, 1, '2025-01-06');
    
-- stargram DB 생성 및 진입
CREATE DATABASE stargram;
USE stargram;

-- users 테이블 생성
CREATE TABLE users (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	nickname VARCHAR(30), 		-- 닉네임
	email VARCHAR(255), 		-- 이메일
	PRIMARY KEY (id) 			-- 기본키 지정: id
);

-- users 데이터 삽입(id는 자동 증가값으로 입력되므로 생략)
INSERT INTO users (nickname, email)
VALUES
	('홍팍', 'sehongpark@cloudstudying.kr'),
	('길벗', 'gilbut@cloudstudying.kr'),
	('해삼', 'haesamq@cloudstudying.kr');

-- 데이터 조회
SELECT *
FROM users;

-- photos 테이블 생성
CREATE TABLE photos (
	id INTEGER AUTO_INCREMENT, 		-- 아이디(자동으로 1씩 증가)
	filename VARCHAR(255) NOT NULL,	-- 파일명(NULL을 허용하지 않음)
	user_id INTEGER, 				-- 게시자 아이디
	PRIMARY KEY (id), 				-- 기본키 지정: id
	FOREIGN KEY (user_id) REFERENCES users(id) -- 외래키 지정: user_id
);

-- photos 데이터 삽입
INSERT INTO photos (filename, user_id)
VALUES
	-- 1번 사용자가 게시한 사진
	('길고양이.jpg', 1),
	('일몰.jpg', 1),
	('은하계.jpg', 1),
	-- 2번 사용자가 게시한 사진
	('백호.jpg', 2),
	('검은 고양이 네로.jpg', 2),
	-- 사용자가 등록되지 않은 사진
	('삭제된 이미지.jpg', NULL),
	('제한된 이미지.jpg', NULL);

-- 데이터 조회
SELECT *
FROM photos;

-- comments 테이블 생성
CREATE TABLE comments (
	id INTEGER AUTO_INCREMENT, 	-- 아이디(자동으로 1씩 증가)
	body VARCHAR(1000), 		-- 댓글 본문
	user_id INTEGER, 			-- 작성자 아이디
	photo_id INTEGER, 			-- 댓글이 달린 사진 아이디
	PRIMARY KEY (id), 			-- 기본키 지정: id
	FOREIGN KEY (user_id) REFERENCES users(id),  -- 외래키 지정: user_id
	FOREIGN KEY (photo_id) REFERENCES photos(id) -- 외래키 지정: photo_id
);

-- comments 데이터 삽입
INSERT INTO comments (body, user_id, photo_id)
VALUES
	-- 1번 사진에 달린 댓글
	('미야옹~', 1, 1),
	('냐옹!', 2, 1),
	('냥냥~', 3, 1),
	-- 2번 사진에 달린 댓글
	('일몰이 멋지네요', 1, 2),
	('해가 바다로 스윽~', 2, 2),
	-- 3번 사진에 달린 댓글
	('안드로메다 성운인가?', 1, 3),
	('성운이 아니라 은하임', 3, 3),
	-- 대상 사진이 없는 댓글
	('와우~', 3, NULL),
	('오우야~', 3, NULL);

-- 데이터 조회
SELECT *
FROM comments;

-- settings 테이블 생성
CREATE TABLE settings (
	id INTEGER AUTO_INCREMENT, 				-- 아이디(자동으로 1씩 증가)
	private BOOLEAN NOT NULL, 				-- 계정 공개 여부(NULL 허용하지 않음)
	account_suggestions BOOLEAN NOT NULL, 	-- 계정 추천 여부(NULL 허용하지 않음)
	user_id INTEGER UNIQUE, 				-- 사용자 아이디(고유한 값만 허용)
	PRIMARY KEY (id), 						-- 기본키 지정: id
	FOREIGN KEY (user_id) REFERENCES users(id) 		-- 외래키 지정: user_id
);

-- settings 데이터 삽입
INSERT INTO settings (private, account_suggestions, user_id)
VALUES
	(FALSE, FALSE, 1), 	-- 1번 사용자(비공개 계정, 계정 추천 불가)
	(FALSE, TRUE, 2), 	-- 2번 사용자(비공개 계정, 계정 추천 허용)
	(TRUE, TRUE, 3); 	-- 3번 사용자(공개 계정, 계정 추천 허용)

-- 데이터 조회
SELECT *
FROM settings;

-- likes 테이블 생성
CREATE TABLE likes (
	id INTEGER AUTO_INCREMENT, 		-- 아이디(자동으로 1씩 증가)
	user_id INTEGER, 				-- 좋아요를 누른 사용자 아이디
	photo_id INTEGER, 				-- 좋아요가 달린 사진 아이디
	PRIMARY KEY (id), 				-- 기본키 지정: id
	FOREIGN KEY (user_id) REFERENCES users(id),  	-- 외래키 지정: user_id
	FOREIGN KEY (photo_id) REFERENCES photos(id) 	-- 외래키 지정: photo_id
);

-- likes 데이터 삽입
INSERT INTO likes (user_id, photo_id)
VALUES
	-- 1번 사진에 달린 좋아요: 1, 2번 사용자가 누름
	(1, 1),
	(2, 1),
	-- 2번 사진에 달린 좋아요: 1, 2, 3번 사용자가 누름
	(1, 2),
	(2, 2),
	(3, 2),
	-- 3번 사진에 달린 좋아요: 1, 3번 사용자가 누름
	(1, 3),
	(3, 3),
	-- 6번 사진에 달린 좋아요, 사용자 미등록
	(NULL, 6),
	-- 7번 사진에 달린 좋아요: 사용자 미등록
	(NULL, 7);

-- 데이터 조회
SELECT *
FROM likes;