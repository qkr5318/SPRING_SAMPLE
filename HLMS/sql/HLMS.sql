-- 회원 시퀀스
DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ;

-- 3+1 시퀀스
DROP SEQUENCE THREE_SEQ;
CREATE SEQUENCE THREE_SEQ;

-- 과목 시퀀스
DROP SEQUENCE COURSE_SEQ;
CREATE SEQUENCE COURSE_SEQ;

-- 학생과목신청 시퀀스
DROP SEQUENCE STUDENT_REG_SEQ;
CREATE SEQUENCE STUDENT_REG_SEQ;

-- 교수과목신청 시퀀스
DROP SEQUENCE PROFESSOR_REG_SEQ;
CREATE SEQUENCE PROFESSOR_REG_SEQ;

-- 게시글 시퀀스
DROP SEQUENCE BOARD_SEQ;
CREATE SEQUENCE BOARD_SEQ;

-- 일정 시퀀스
DROP SEQUENCE SCHE_SEQ;
CREATE SEQUENCE SCHE_SEQ;


-- 과목 분류 코드 테이블
DROP TABLE TB_COM_CODE CASCADE CONSTRAINT;
CREATE TABLE TB_COM_CODE(
  COMM_TY_CD VARCHAR2(10),
  COMM_CD VARCHAR2(20),
  COMM_CD_NM VARCHAR2(30),
  CONSTRAINT TB_CODE_PK PRIMARY KEY(COMM_TY_CD, COMM_CD)
);

-- 전화번호
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '01', '010');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '02', '011');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '03', '016');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '04', '019');

-- 유저권한
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'S', '학생');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'P', '교수');

-- 과목분류코드
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0102', 'ME', '전공필수');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0102', 'MO', '전공선택');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0102', 'RE', '교양필수');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0102', 'RO', '교양선택');

--회원정보
DROP TABLE TB_COM_USER CASCADE CONSTRAINT;


CREATE TABLE TB_COM_USER(
  USER_CODE VARCHAR2(20),             -- 유저코드
  ID VARCHAR2(20),                  -- 아이디
  PW VARCHAR2(20),                   -- 패스워드
  EMAIL VARCHAR2(50),                      -- 이메일
  USER_IMAGE VARCHAR2(100),               -- 유저이미지
  NAME VARCHAR2(20),                       -- 이름
  BIRTH VARCHAR2(20),                      -- 생일
  POST_NUM VARCHAR2(20),                   -- 우편번호
  PHONE_CD VARCHAR2(2),                    -- 전화번호앞자리 코드
  PHONE_NUM VARCHAR2(20),                  -- 전화번호뒷자리
  ADDRESS VARCHAR2(100),                   -- 주소
  ENT_DATE VARCHAR2(30),                   -- 회원가입일
  GRADE VARCHAR2(1) DEFAULT 'S',         -- 회원등급
  CONNECT_DATE VARCHAR2(30),            -- 최근접속시간
  NICK_NAME VARCHAR2(100),            -- 닉네임
  CLASS2 VARCHAR2(100),                -- 클래스
  THREE_YN VARCHAR2(100) DEFAULT 'N',                -- 3+1개설여부
  CONSTRAINT TB_COM_USER_PK PRIMARY KEY(USER_CODE)
);


commit;


--게시판정보
DROP TABLE TB_BOARD CASCADE CONSTRAINT;
CREATE TABLE TB_BOARD(
  BOARD_NO VARCHAR2(30),             -- 게시글번호
  USER_CODE VARCHAR2(20),            -- 유저코드
  BOARD_TITLE VARCHAR2(1000),        -- 게시글제목
  BOARD_CONTENTS VARCHAR2(4000),     -- 게시글내용
  BOARD_DATE VARCHAR2(30),           -- 게시글작성날짜
  BOARD_HITS NUMBER DEFAULT 0,     -- 조회수
  BOARD_RATING NUMBER DEFAULT 0,   -- 좋아요
  CONSTRAINT TB_BOARD_PK PRIMARY KEY(BOARD_NO),
  CONSTRAINT TB_BOARD_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

insert into TB_BOARD (BOARD_NO, USER_CODE, BOARD_TITLE, BOARD_CONTENTS, BOARD_DATE, BOARD_HITS, BOARD_RATING)
values ('B' || LPAD(BOARD_SEQ.NEXTVAL, 4, 0), 'USER000002', '기네스 등재 세계 최약 클럽, “모리뉴, 패배 수당 줄테니 오라”', '스페인 <스포르트>는 브라질 하부리그 클럽인 이비스 스포르트 클루브가 모리뉴 감독에게 영입 제안을 했다고 밝혔다. 브라질 파울리스타주에 근거지를 두고 페르남부쿠주 하부리그에 속한 이 팀은 기네스북에 상당히 좋지 못한 기록으로 전 세계에 이름을 알린 팀이다.<br/><br/>이비스는 1970년대말부터 1980년대까지 세계 최약체 클럽이라는 오명을 뒤집어 쓴 바 있는 팀이다. 1980년부터 7월부터 1984년 6월까지 무려 3년 11개월 동안 단 한 차례도 이기지 못해 기네스북에 등재됐다. 이후 팀을 재건해 나름 경쟁력을 갖추는 데 성공했으나, 3년 11개월동안 무승이라는 기록은 이후에 어떠한 팀도 깨지 못했다. 이 때문에 이비스는 지금도 기록상으로는 세계 최약 클럽 팀이라는 오명을 씻지 못하고 있다.<br/><br/>그러나 지금은 그 오명이 팀을 대표하는 하나의 정체성이 된 듯하다. 이비스는 지난 28일 당시 브라질에 머물고 있었던 것으로 알려진 모리뉴 감독에게 영입 제안하겠다고 나서 주목을 받았다. 걸린 옵션 조항도 독특하다. 팀이 졌을 경우 받을 수 있는 이른바 ‘패배 수당’이 걸려 있으며, 대량 실점으로 질 경우 주급이 더욱 높아진다. 더군다나 2연승 혹은 리그 우승을 달성하면 즉시 계약 해지라는 조항까지 달려 있다. 이는 자신들이 세계 최약 팀으로 공인받았던 과거를 들먹이고, 모리뉴 감독이 최근 프리미어리그에서 심각한 부진에 시달렸던 것을 풍자하기 위함인 것으로 보인다.<br/><br/>당연한 얘기지만, 이비스의 제안은 공식적 제스처라기보다는 농담에 가깝다. 브라질에서는 12월 28일을 ‘아기 순교자의 날’이라는 이름으로 보내고 있다. 우리로 치면 4월 1일 만우절과 똑같은 날이라, 서로 가벼운 거짓말을 통한 농담을 즐기는 풍습이 있는 것으로 알려졌다. 즉 이비스는 전 세계적으로 관심을 몰고 다니는 모리뉴 감독의 브라질 방문과 맞물려 아기 순교자의 날이 오자 팬들을 대상으로 장난을 친 것이라 할 수 있다.<br/>', '2015-12-31 14:13', 0, 0);
insert into TB_BOARD (BOARD_NO, USER_CODE, BOARD_TITLE, BOARD_CONTENTS, BOARD_DATE, BOARD_HITS, BOARD_RATING)
values ('B' || LPAD(BOARD_SEQ.NEXTVAL, 4, 0), 'USER000002', '지상파-케이블TV, VOD 협상 결국 결렬…소비자 불편 불보듯', '새해부터 디지털 케이블TV에서 주문형비디오(VOD)를 볼 수 없게 됐다. 지상파 방송사와 케이블TV VOD(옛 홈초이스) 간 협상이 결국 결렬됐다. 이에 따라 758만명의 디지털 케이블TV 가입자가 불편을 겪게 됐다. <br/><br/>31일 최정우 케이블TV VOD 대표는 서울 서대문구 케이블TV방송협회에서 기자회견을 열고 그간의 협상 과정을 설명하며 "지상파로부터 협상 종료를 통보받았다"며 "오늘 내로 지상파가 입장을 번복하지 않으면, 자정을 기해 신규 지상파 VOD 공급이 중단될 것"이라고 말했다. ', '2015-12-31 14:13', 0, 0);
insert into TB_BOARD (BOARD_NO, USER_CODE, BOARD_TITLE, BOARD_CONTENTS, BOARD_DATE, BOARD_HITS, BOARD_RATING)
values ('B' || LPAD(BOARD_SEQ.NEXTVAL, 4, 0), 'USER000002', '''벌금형'' 오승환-임창용, 은퇴 위기 넘겼다', '30일 검찰에 따르면 오승환과 임창용은 2014년 11월 말 마카오 카지노에서 각각 4000만원 상당의 바카라 도박을 한 혐의로 벌금 700만원 약식 명령을 청구했다. 검찰은 두 사람 도박 액수가 비교적 적은데다 상습성을 입증하기가 어렵다는 점을 고려한 것으로 전해졌다. 따라서 법원이 그대로 약식 청구를 받아들인다면 벌금형으로 끝이 난다. 이후 두 선수의 거취에 관심이 쏠릴 수밖에 없다.<br/><br/>올 시즌까지 한신 타이거스에서 뛰었던 오승환은 메이저리그 진출을 노리고 있다. 사실상 해외 원정 도박에 대한 처분이 끝난 만큼 오승환에게 관심을 보이고 있는 팀들과 협상이 가능하다. 메이저리그는 KBO 리그에 비해 경기 외적인 측면의 생활에 대해 관대한 편이다. 따라서 오승환이 실력만 인정받는다면 그대로 메이저리그 진출을 타진할 수 있다. 국내 리그 복귀 시에는 상황이 복잡해지지만, 일단 해외 진출에 있어선 큰 영향을 받지 않을 가능성이 높다.<br/><br/>임창용의 경우에도 새 소속팀을 찾는다면 선수 생활을 이어갈 수는 있다. 삼성 라이온즈는 이미 임창용을 보류 선수 명단에서 제외했지만 마무리가 부족했던 팀들은 탐낼 만한 자원이다. 문제가 되는 것은 KBO의 징계다. KBO는 “임창용이 프로야구의 이미지를 훼손한 만큼 징계를 검토 중”이라고 밝혔다. 아직 확실한 징계 수위는 정해지지 않았지만 조만간 상벌위원회를 개최해 임창용의 징계를 확정할 예정.<br/>', '2015-12-31 14:14', 0, 0);
insert into TB_BOARD (BOARD_NO, USER_CODE, BOARD_TITLE, BOARD_CONTENTS, BOARD_DATE, BOARD_HITS, BOARD_RATING)
values ('B' || LPAD(BOARD_SEQ.NEXTVAL, 4, 0), 'USER000002', '국립중앙도서관 올해의 책 ‘미움받을 용기’ 선정', '국립중앙도서관이 31일 발표한 2015년 분야별 이용도서 톱10에 따르면 올해의 경우 심리학과 인문학 분야 책들이 많은 사랑을 받았다 아울러 기존 베스트셀러의 인기도 계속됐다. <br/><br/>미움받을 용기에 이어 이용도서 종합 2위는 2012년에 출간돼 현재까지도 꾸준한 사랑을 받고 있는 ‘나미야 잡화점의 기적’이 선정됐다. 이어 다양한 분야의 지식들을 이해하고 소통하기 쉽게 풀어 쓴 △채사장의 ‘지적 대화를 위한 넓고 얕은 지식’△국내에 아들러 심리학의 열풍을 가져온 기시마 이치로의 ‘아들러 심리학을 읽는 밤’△2014년 스크린셀러였던 요나스 요나손의 ‘창문 넘어 도망친 100세 노인’이 각각 종합 순위 3, 4, 5위를 기록하였다. 이는 인문학에 대한 대중의 지속적인 관심을 보여준다. <br/><br/>가장 큰 특징은 소설보다 인문학, 심리학, 자기계발 관련 도서가 인기를 끌었다는 점이다. 국내 최장기 베스트셀러로 선정된 ‘미움받을 용기’를 비롯해 지적 대화를 위한 넓고 얕은 지식’‘하버드 새벽 4시 반’7번 읽기 공부법’ 등이 상위권에 이름을 올렸다. 소설의 경우 신간 소설보다는 ‘나미야 잡화점의 기적’‘창문 넘어 도망친 100세 노인’‘정글만리’ 등 기존 베스트셀러의 인기가 계속되었다. <br/>', '2015-12-31 14:14', 1, 1);
insert into TB_BOARD (BOARD_NO, USER_CODE, BOARD_TITLE, BOARD_CONTENTS, BOARD_DATE, BOARD_HITS, BOARD_RATING)
values ('B' || LPAD(BOARD_SEQ.NEXTVAL, 4, 0), 'USER000003', '지성♥이보영,''연기대상 부부'' 계보를 잇다', '지성은 30일 열린 MBC연기대상에서 ''킬미 힐미''로 생애 첫 대상을 품에 안았다. 이번 대상은 100% 실시간 시청자 문자 투표로 결정된 것. 지성은 극중 숨겨진 어릴 적 상처로 인해 인격이 7개로 분리된 다중인격 재벌 3세 차도현을 연기했다. 주 인격체인 차도현 부터 신세기, 페리박, 안요섭, 안요나 등 전혀 다른 색깔의 7가지 캐릭터를 모두 완벽히 소화해 시청자로부터 극찬을 받았다. <br/><br/>이에 시상식 직후 시청자와 네티즌들은 "대상 부부의 탄생이다"며 축하의 인사를 건네고 있다. 지난 2013년에는 지성의 아내인 이보영이 SBS연기대상 뿐 아니라 제6회 코리아 드라마 어워즈 대상을 손에 쥔 바 있기 때문. 이보영은 당시 ''너의 목소리가 들려''에서 속물 국선전담변호사 장해성 역을 맞춤옷을 입은 것 처럼 연기해 호평을 받았다. <br/><br/>이로서 지성과 이보영 부부는 ''대상 부부'' 대열에 합류하게 돼 눈길을 끈다. 이들 이전에 부부가 모두 연기대상을 수상한 배우들은 유동근, 전인화 부부와 하희라 최수종 부부 뿐.<br/>', '2015-12-31 14:15', 1, 0);
insert into TB_BOARD (BOARD_NO, USER_CODE, BOARD_TITLE, BOARD_CONTENTS, BOARD_DATE, BOARD_HITS, BOARD_RATING)
values ('B' || LPAD(BOARD_SEQ.NEXTVAL, 4, 0), 'USER000003', '윤정수♥김숙 "우린 외모부터 따지는 스타일"', '"정말 시청률이 7%를 넘으면 어쩌죠? 진짜 결혼해야 하는 건가. 슬슬 현실이 될까 걱정 되네요."<br/><br/>코미디언 윤정수(43)와 김숙(40)이 JTBC ''님과 함께 시즌2-최고의 사랑''에서 ''쇼윈도 부부''라는 콘셉트 하에 가상 부부로 활약 중이다. 부부의 연을 맺은 지 이제 4개월 차에 접어든다. 프로그램 투입 당시 두 사람을 향한 기대감은 그다지 크지 않았다. ''한물간'' 코미디언 커플이 얼마나 활약하겠느냐는 것. 하지만 윤정수와 김숙은 찰떡궁합 호흡을 자랑하며 최고의 가상 커플로 떠올랐다. 특히 그간 볼 수 없었던 독특한 콘셉트의 가상 커플로 지지를 받고 있다. 가장인 김숙, 살림하는 주부 윤정수로 그려진다. 가부장제가 아닌 가모장제를 추구하고 있다. 이 모습은 중년 여성 시청자들에게 대리 만족을 주는 요소로 작용하며, 신선함을 선사한다. 여기에 손발이 오그라드는 닭살스런 애정행각을 하지 않아 억지스럽지 않다. 연신 티격태격하는 모습이 진정성 있게 다가오면서 호감 지수를 높이고 있다. 이에 힘입어 두 사람의 가상 결혼이 실제로 이어지길 바라는 움직임까지 일고 있다.<br/>', '2015-12-31 14:16', 0, 0);

insert into TB_MARK (BOARD_NO, USER_CODE, MARK_RATING)
values ('B0004', 'USER000003', 1);
insert into TB_REPLY (BOARD_NO, USER_CODE, USER_REPLY_NO, USER_REPLY, REPLY_DATE)
values ('B0005', 'USER000003', 1, '부부 대상 대박...', '2015-12-31 14:15');
insert into TB_REPLY (BOARD_NO, USER_CODE, USER_REPLY_NO, USER_REPLY, REPLY_DATE)
values ('B0006', 'USER000003', 1, '외모가 중요하긴 하지..', '2015-12-31 14:17');

--일정정보
DROP TABLE TB_SCHE CASCADE CONSTRAINT;
CREATE TABLE TB_SCHE(
  SCHE_NO VARCHAR2(30),             -- 일정번호
  USER_CODE VARCHAR2(20),            -- 유저코드
  SCHE_TITLE VARCHAR2(1000),        -- 일정제목
  SCHE_CONTENTS VARCHAR2(4000),     -- 일정내용
  SCHE_DATE VARCHAR2(30),           -- 일정작성날짜
  SCHE_START_DATE VARCHAR2(30),     -- 기한(시작)
  SCHE_END_DATE VARCHAR2(30),		-- 기한(끝)
  SCHE_HITS NUMBER DEFAULT 0,     -- 조회수
  CONSTRAINT TB_SCHE_PK PRIMARY KEY(SCHE_NO),
  CONSTRAINT TB_SCHE_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

--댓글정보
DROP TABLE TB_REPLY CASCADE CONSTRAINT;
CREATE TABLE TB_REPLY(
  BOARD_NO VARCHAR2(30),             -- 게시글번호
  USER_CODE VARCHAR2(20),            -- 유저코드
  USER_REPLY_NO NUMBER(3),           -- 댓글일련번호
  USER_REPLY VARCHAR2(1000),         -- 댓글내용
  REPLY_DATE VARCHAR2(30),           -- 댓글날짜
  CONSTRAINT TB_REPLY_PK PRIMARY KEY(BOARD_NO, USER_CODE, USER_REPLY_NO),
  CONSTRAINT TB_REPLY_FK_BOARD FOREIGN KEY(BOARD_NO) REFERENCES TB_BOARD(BOARD_NO)
);

-- 공감도정보
DROP TABLE TB_MARK CASCADE CONSTRAINT;
CREATE TABLE TB_MARK(
  BOARD_NO VARCHAR2(30),             -- 게시판_넘버
  USER_CODE VARCHAR2(20),            -- 유저코드
  MARK_RATING NUMBER,                -- 좋아요
  CONSTRAINT TB_MARK_PK PRIMARY KEY(BOARD_NO, USER_CODE),
  CONSTRAINT TB_MARK_FK_BOARD FOREIGN KEY(BOARD_NO) REFERENCES TB_BOARD(BOARD_NO),
  CONSTRAINT TB_MARK_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

DROP TABLE TB_POST CASCADE CONSTRAINT;
CREATE TABLE TB_POST(
ZIPCODE VARCHAR2(10)
,SIDO VARCHAR2(50)
,GUGUN VARCHAR2(100)
,DONG VARCHAR2(100)
,BUNJI VARCHAR2(50)
,SEQ NUMBER PRIMARY KEY
);

--3+1정보
DROP TABLE TB_THREE CASCADE CONSTRAINT;
CREATE TABLE TB_THREE(
  APP_CODE VARCHAR2(30),             -- 지원서코드
  P_USER_CODE VARCHAR2(20),            -- 교수코드
  S_USER_CODE VARCHAR2(20),            -- 학생코드
  MOTIVE VARCHAR2(4000),          -- 지원이유
  TUITION VARCHAR2(30),             -- 수강료
  VIR_ACC VARCHAR2(30),         -- 가상계좌
  APP_STATUS VARCHAR2(1) DEFAULT 0,     -- 지원상태
  MAJOR VARCHAR2(50),     -- 전공
  CONSTRAINT TB_THREE_PK PRIMARY KEY(APP_CODE),
  CONSTRAINT TB_THREE_FK_P_USER FOREIGN KEY(P_USER_CODE) REFERENCES TB_COM_USER(USER_CODE),
  CONSTRAINT TB_THREE_FK_S_USER FOREIGN KEY(S_USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

--과목정보
DROP TABLE TB_COURSE CASCADE CONSTRAINT;
CREATE TABLE TB_COURSE(
  COURSE_CODE VARCHAR2(20),                        -- 과목코드
  COURSE_NAME VARCHAR2(200),                       -- 과목명
  COURSE_SCORE NUMBER,			  		            -- 과목학점
  COURSE_CATEGORY_CD VARCHAR2(20),		            -- 과목분류
  COURSE_ASSIGN_YN VARCHAR2(20) DEFAULT 'N',       -- 과목 담당유무
  COURSE_MAX_NUMBER VARCHAR2(20),                  -- 과목정원
  COURSE_CUR_NUMBER VARCHAR2(20) DEFAULT 0,        -- 과목신청인원
  COURSE_CLASSROOM VARCHAR2(20),                   -- 교실
  COURSE_DAY VARCHAR2(20),                         -- 요일
  COURSE_PERIOD NUMBER, 							-- 교시
  COURSE_REG_DATE VARCHAR2(20),                     -- 과목개설일
  CONSTRAINT TB_COURSE_PK PRIMARY KEY(COURSE_CODE)
);

INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '영화의이해', 3, 'RO', 50, 'B101', '월', 1, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '프로그래밍언어', 3, 'RO', 40, 'B103', '화', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, 'C프로그래밍실습', 2, 'RO', 35, 'B102', '수', 2, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '시스템소프트웨어', 4, 'RE', 50, 'B104', '목', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '운영체제', 5, 'RE', 50, 'B105', '금', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '대학수학1', 6, 'RE', 40, 'B106', '월', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '대학수학2', 7, 'RE', 40, 'B107', '월', 2, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '공업수학1', 1, 'ME', 30, 'F201', '월', 1, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '공업수학2', 5, 'ME', 30, 'F301', '화', 2, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '법과사회', 5, 'ME', 40, 'F301', '월', 2, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '자연의이해', 2, 'ME', 50, 'F201', '수', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '대학영어1', 3, 'ME', 50, 'F201', '금', 1, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '대학영어2', 6, 'ME', 50, 'F202', '목', 2, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '자료구조', 7, 'ME', 30, 'F203', '목', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '알고리즘', 3, 'MO', 45, 'F204', '금', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '일본어기초', 3, 'MO', 35, 'F304', '금', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '웹프로그래밍실습', 3, 'MO', 55, 'F305', '금', 3, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '데이터베이스실습', 3, 'MO', 35, 'F501', '수', 2, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));
INSERT INTO TB_COURSE(COURSE_CODE, COURSE_NAME, COURSE_PERIOD, COURSE_CATEGORY_CD, COURSE_MAX_NUMBER, COURSE_CLASSROOM, COURSE_DAY, COURSE_SCORE, COURSE_REG_DATE)VALUES('C00' || COURSE_SEQ.NEXTVAL, '인터넷프로그래밍', 3, 'MO', 40, 'F401', '월', 2, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'));


--학생수강신청정보
DROP TABLE TB_STUDENT_REG CASCADE CONSTRAINT;
CREATE TABLE TB_STUDENT_REG(
  STUDENT_REG_CODE VARCHAR2(20),   -- 학생수강신청 등록코드
  COURSE_CODE VARCHAR2(20),       -- 과목코드
  USER_CODE VARCHAR2(20),          -- 유저코드
  SCORE VARCHAR2(20), --성적
  CONSTRAINT TB_STUDENT_REG_PK PRIMARY KEY(STUDENT_REG_CODE),
  CONSTRAINT TB_STUDENT_REG_FK_COURSE FOREIGN KEY(COURSE_CODE) REFERENCES TB_COURSE(COURSE_CODE),
  CONSTRAINT TB_STUDENT_REG_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

--교수담당과목정보
DROP TABLE TB_PROFESSOR_REG CASCADE CONSTRAINT;
CREATE TABLE TB_PROFESSOR_REG(
  PROFESSOR_REG_CODE VARCHAR2(20),     -- 교수담당과목 정보코드
  COURSE_CODE VARCHAR2(20),       -- 과목코드
  USER_CODE VARCHAR2(20),          -- 유저코드
  CONSTRAINT TB_PROFESSOR_REG_PK PRIMARY KEY(PROFESSOR_REG_CODE),
  CONSTRAINT TB_PROFESSOR_REG_FK_COURSE FOREIGN KEY(COURSE_CODE) REFERENCES TB_COURSE(COURSE_CODE),
  CONSTRAINT TB_PROFESSOR_REG_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

commit;

