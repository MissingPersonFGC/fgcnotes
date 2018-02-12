SET DATABASE COLLATION "Latin1_General"
CREATE SCHEMA PUBLIC AUTHORIZATION DBA
CREATE CACHED TABLE "accounts"("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 0) NOT NULL PRIMARY KEY,"username" VARCHAR(100) NOT NULL,"password" VARCHAR(100) NOT NULL,"email" VARCHAR(100),"create_date" DATE,"first_name" VARCHAR(100),"last_name" VARCHAR(100))
CREATE CACHED TABLE "gamenames"("game_id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 0) NOT NULL PRIMARY KEY,"game_name" VARCHAR(100),"game_shorthand" VARCHAR(100),"game_jp" VARCHAR(100),"game_kr" VARCHAR(100),"game_zh-Hans" VARCHAR(100),"game_zh-Hant" VARCHAR(100),"game_he" VARCHAR(100),"game_ar" VARCHAR(100),"game_th" VARCHAR(100))
ALTER TABLE "accounts" ALTER COLUMN "id" RESTART WITH 2
ALTER TABLE "gamenames" ALTER COLUMN "game_id" RESTART WITH 59
CREATE USER SA PASSWORD ""
GRANT DBA TO SA
SET WRITE_DELAY 60
SET SCHEMA PUBLIC
INSERT INTO "accounts" VALUES(1,'Missing Person','packy147','iam@coreylanier.com','2018-02-11','Corey','Lanier')
INSERT INTO "gamenames" VALUES(0,'Street Fighter V','sfv','\u30b9\u30c8\u30ea\u30fc\u30c8\u30d5\u30a1\u30a4\u30bf\u30fcV','\uc2a4\ud2b8\ub9ac\ud2b8 \ud30c\uc774\ud130 5','\u8857\u5934\u9738\u738bV','\u8857\u982d\u9738\u738bV','\u05dc\u05d5\u05d7\u05dd \u05e8\u05d7\u05d5\u05d1 5','\u0633\u062a\u0631\u064a\u062a \u0641\u0627\u064a\u062a\u0631 5','\u0e2a\u0e15\u0e23\u0e35\u0e17\u0e44\u0e1f\u0e17\u0e4c\u0e40\u0e15\u0e2d\u0e23\u0e4c V')
INSERT INTO "gamenames" VALUES(1,'Super Street Fighter II Turbo','st','\u30b9\u30fc\u30d1\u30fc\u30b9\u30c8\u30ea\u30fc\u30c8\u30d5\u30a1\u30a4\u30bf\u30fcII X','\uc288\ud37c \uc2a4\ud2b8\ub9ac\ud2b8 \ud30c\uc774\ud130 2 \ud130\ubcf4','\u8d85\u7ea7\u8857\u5934\u9738\u738bII X','\u8d85\u7d1a\u8857\u982d\u9738\u738bII X','\u05dc\u05d5\u05d7\u05dd \u05e8\u05d7\u05d5\u05d1 \u05e1\u05d5\u05e4\u05e8 2 \u05d8\u05d5\u05e8\u05d1\u05d5','\u0633\u0648\u0628\u0631 \u0633\u062a\u0631\u064a\u062a \u0641\u0627\u064a\u062a\u0631 2 \u062a\u0648\u0631\u0628\u0648','\u0e0b\u0e38\u0e1b\u0e40\u0e1b\u0e2d\u0e23\u0e4c\u0e2a\u0e15\u0e23\u0e35\u0e17\u0e44\u0e1f\u0e17\u0e4c\u0e40\u0e15\u0e2d\u0e23\u0e4c II \u0e01\u0e31\u0e07\u0e2b\u0e31\u0e19')
INSERT INTO "gamenames" VALUES(2,'Ultra Street Fighter IV','sfiv','\u30a6\u30eb\u30c8\u30e9\u30b9\u30c8\u30ea\u30fc\u30c8\u30d5\u30a1\u30a4\u30bf\u30fcIV','\uc6b8\ud2b8\ub77c \uc2a4\ud2b8\ub9ac\ud2b8 \ud30c\uc774\ud130 4','\u8d85\u8857\u5934\u9738\u738bIV','\u8d85\u8857\u982d\u9738\u738bIV','\u05dc\u05d5\u05d7\u05dd \u05e8\u05d7\u05d5\u05d1 \u05d0\u05d5\u05dc\u05d8\u05e8\u05d4 4','\u0623\u0648\u0644\u062a\u0631\u0627 \u0633\u062a\u0631\u064a\u062a \u0641\u0627\u064a\u062a\u0631 4','\u0e2d\u0e38\u0e25\u0e15\u0e23\u0e32\u0e2a\u0e15\u0e23\u0e35\u0e17\u0e44\u0e1f\u0e17\u0e4c\u0e40\u0e15\u0e2d\u0e23\u0e4c IV')
INSERT INTO "gamenames" VALUES(3,'Tekken 7','t7','\u9244\u62f37','\ucca0\uad8c 7','\u94c1\u62f37','\u9435\u62f37','\u05d8\u05e7\u05df 7','\u062a\u064a\u0643\u064a\u0646 7','\u0e40\u0e17\u0e04\u0e40\u0e04\u0e19 7')
INSERT INTO "gamenames" VALUES(4,'Street Fighter III: 3rd Strike','sf3','\u30b9\u30c8\u30ea\u30fc\u30c8\u30d5\u30a1\u30a4\u30bf\u30fc\u2162 \u30b5\u30fc\u30c9\u30b9\u30c8\u30e9\u30a4\u30af','\uc2a4\ud2b8\ub9ac\ud2b8 \ud30c\uc774\ud130 3 : \uc138 \ubc88\uc9f8 \uc2a4\ud2b8\ub77c\uc774\ud06c','\u8857\u5934\u9738\u738bIII\uff1a\u7b2c\u4e09\u6b21\u6253\u51fb','\u8857\u982d\u9738\u738bIII\uff1a\u7b2c\u4e09\u6b21\u6253\u64ca','\u05e1\u05d8\u05e8\u05d9\u05d8 \u05e4\u05d9\u05d9\u05d8\u05e8 3: \u05e9\u05d1\u05d9\u05ea\u05d4 \u05e9\u05dc\u05d9\u05e9\u05d9\u05ea /','\u0633\u062a\u0631\u064a\u062a \u0641\u0627\u064a\u062a\u0631 3: \u0633\u062a\u0631\u0627\u064a\u0643 \u0627\u0644\u062b\u0627\u0644\u062b','\u0e2a\u0e15\u0e23\u0e35\u0e17\u0e44\u0e1f\u0e17\u0e4c\u0e40\u0e15\u0e2d\u0e23\u0e4c III \u0e01\u0e32\u0e23\u0e1b\u0e23\u0e30\u0e17\u0e49\u0e27\u0e07\u0e04\u0e23\u0e31\u0e49\u0e07\u0e17\u0e35\u0e48\u0e2a\u0e32\u0e21')
INSERT INTO "gamenames" VALUES(5,'The King of Fighters XIV','kof14','\u30b6\u30fb\u30ad\u30f3\u30b0\u30fb\u30aa\u30d6\u30fb\u30d5\u30a1\u30a4\u30bf\u30fc\u30baXIV','\ub354 \ud0b9 \uc624\ube0c \ud30c\uc774\ud130\uc988 14','\u62f3\u7687\u7cfb\u5217XIV','\u62f3\u7687\u7cfb\u5217XIV','\u05de\u05dc\u05da \u05d4\u05dc\u05d5\u05d7\u05de\u05d9\u05dd / 14','\u0630\u0627 \u0643\u064a\u0646\u063a \u0623\u0648\u0641 \u0641\u0627\u064a\u062a\u0631\u0632 14','\u0e01\u0e29\u0e31\u0e15\u0e23\u0e34\u0e22\u0e4c\u0e41\u0e2b\u0e48\u0e07\u0e19\u0e31\u0e01\u0e2a\u0e39\u0e49 XIV')
INSERT INTO "gamenames" VALUES(6,'The King of Fighters XIII','kof13','\u30b6\u30fb\u30ad\u30f3\u30b0\u30fb\u30aa\u30d6\u30fb\u30d5\u30a1\u30a4\u30bf\u30fc\u30baXIII','\ub354 \ud0b9 \uc624\ube0c \ud30c\uc774\ud130\uc988 13','\u62f3\u7687\u7cfb\u5217XIII','\u62f3\u7687\u7cfb\u5217XIII','\u05de\u05dc\u05da \u05d4\u05dc\u05d5\u05d7\u05de\u05d9\u05dd / 13','\u0630\u0627 \u0643\u064a\u0646\u063a \u0623\u0648\u0641 \u0641\u0627\u064a\u062a\u0631\u0632 13','\u0e01\u0e29\u0e31\u0e15\u0e23\u0e34\u0e22\u0e4c\u0e41\u0e2b\u0e48\u0e07\u0e19\u0e31\u0e01\u0e2a\u0e39\u0e49 XIII')
INSERT INTO "gamenames" VALUES(7,'The King of Fighters 2002','kof2002','\u30b6\u30fb\u30ad\u30f3\u30b0\u30fb\u30aa\u30d6\u30fb\u30d5\u30a1\u30a4\u30bf\u30fc\u30ba2002','\ub354 \ud0b9 \uc624\ube0c \ud30c\uc774\ud130\uc988 2002','\u62f3\u7687\u7cfb\u52172002','\u62f3\u7687\u7cfb\u52172002','\u05de\u05dc\u05da \u05d4\u05dc\u05d5\u05d7\u05de\u05d9\u05dd / 2002','\u0630\u0627 \u0643\u064a\u0646\u063a \u0623\u0648\u0641 \u0641\u0627\u064a\u062a\u0631\u0632 2002','\u0e01\u0e29\u0e31\u0e15\u0e23\u0e34\u0e22\u0e4c\u0e41\u0e2b\u0e48\u0e07\u0e19\u0e31\u0e01\u0e2a\u0e39\u0e49 2002')
INSERT INTO "gamenames" VALUES(8,'The King of Fighters ''98','kof98um','\u30b6\u30fb\u30ad\u30f3\u30b0\u30fb\u30aa\u30d6\u30fb\u30d5\u30a1\u30a4\u30bf\u30fc\u30ba98','\ub354 \ud0b9 \uc624\ube0c \ud30c\uc774\ud130\uc988 98','\u62f3\u7687\u7cfb\u521798','\u62f3\u7687\u7cfb\u521798','\u05de\u05dc\u05da \u05d4\u05dc\u05d5\u05d7\u05de\u05d9\u05dd / 98','\u0630\u0627 \u0643\u064a\u0646\u063a \u0623\u0648\u0641 \u0641\u0627\u064a\u062a\u0631\u0632 98','\u0e01\u0e29\u0e31\u0e15\u0e23\u0e34\u0e22\u0e4c\u0e41\u0e2b\u0e48\u0e07\u0e19\u0e31\u0e01\u0e2a\u0e39\u0e49 98')
INSERT INTO "gamenames" VALUES(9,'Capcom Vs. SNK 2','cvs2','\u30ab\u30d7\u30b3\u30f3 \u30d0\u30fc\u30b5\u30b9 \u30a8\u30b9\u30fb\u30a8\u30cc\u30fb\u30b1\u30a4 2 ','\ucea1\ucf64 \ubc84\uc11c\uc2a4 SNK 2','Capcom VS. SNK 2','Capcom VS. SNK 2','Capcom VS. SNK 2','\u0643\u0627\u0628\u0643\u0648\u0645 \u0645\u0642\u0627\u0628\u0644 \u0633\u0646\u0643 2','\u0e41\u0e04\u0e1b\u0e04\u0e2d\u0e21 vs. \u0e40\u0e2d\u0e2a\u0e40\u0e2d\u0e47\u0e19\u0e40\u0e04 2')
INSERT INTO "gamenames" VALUES(10,'Bishoujo Senshi Sailor Moon S','sms','\u7f8e\u5c11\u5973\u6226\u58eb\u30bb\u30fc\u30e9\u30fc\u30e0\u30fc\u30f3S \u5834\u5916\u4e71\u95d8!? \u4e3b\u5f79\u4e89\u596a\u6226','\uc138\uc77c\ub7ec\ubb38 S','\u7f8e\u5c11\u5973\u6218\u58ebS','\u7f8e\u5c11\u5973\u6218\u58ebS','\u05e1\u05d9\u05d9\u05dc\u05d5\u05e8 \u05de\u05d5\u05df S','\u0633\u064a\u0644\u0648\u0631 \u0645\u0648\u0646 S','\u0e40\u0e0b\u0e40\u0e25\u0e2d\u0e23\u0e4c\u0e21\u0e39\u0e19 S')
INSERT INTO "gamenames" VALUES(11,'Teenage Mutant Ninja Turtles: Tournament Fighters','tmnttf','\u30c6\u30a3\u30fc\u30f3\u30a8\u30a4\u30b8\u30fb\u30df\u30e5\u30fc\u30bf\u30f3\u30c8\u30fb\u30cb\u30f3\u30b8\u30e3\u30fb\u30bf\u30fc\u30c8\u30eb\u30ba','\ub2cc\uc790 \uac70\ubd81\uc774','\u5fcd\u8005\u795e\u9f9f','\u5fcd\u8005\u795e\u9f9c','\u05e6\u05d1\u05d9\u05dd \u05e0\u05d9\u05e0\u05d2 ''\u05d4: \u05d8\u05d5\u05e8\u05e0\u05d9\u05e8 \u05d5\u05d8\u05e8\u05e1','\u0633\u0644\u0627\u062d\u0641 \u0627\u0644\u0646\u064a\u0646\u062c\u0627: \u062a\u0648\u0631\u0646\u0627\u0645\u0646\u062a \u0641\u0627\u064a\u062a\u0631\u0632','\u0e40\u0e15\u0e48\u0e32\u0e19\u0e34\u0e19\u0e08\u0e32')
INSERT INTO "gamenames" VALUES(12,'Karnov''s Revenge','kr','\u30d5\u30a1\u30a4\u30bf\u30fc\u30ba\u30d2\u30b9\u30c8\u30ea\u30fc\u30c0\u30a4\u30ca\u30de\u30a4\u30c8','\uc804\ud22c \ud788\uc2a4\ud1a0\ub9ac \ub2e4\uc774\ub108\ub9c8\uc774\ud2b8','\u6218\u58eb\u5386\u53f2\u70b8\u836f','\u6230\u58eb\u6b77\u53f2\u70b8\u85e5','\u05dc\u05d5\u05d7\u05dd \u05d4\u05d4\u05d9\u05e1\u05d8\u05d5\u05e8\u05d9\u05d4 \u05e9\u05dc \u05d4\u05d3\u05d9\u05e0\u05de\u05d9\u05d8','\u0645\u0642\u0627\u062a\u0644\u0629 \u062a\u0627\u0631\u064a\u062e \u0627\u0644\u062f\u064a\u0646\u0627\u0645\u064a\u062a','\u0e19\u0e31\u0e01\u0e21\u0e27\u0e22\u0e02\u0e2d\u0e07\u0e1b\u0e23\u0e30\u0e27\u0e31\u0e15\u0e34\u0e28\u0e32\u0e2a\u0e15\u0e23\u0e4c\u0e19\u0e31\u0e01\u0e21\u0e27\u0e22')
INSERT INTO "gamenames" VALUES(13,'Killer Instinct','ki','\u30ad\u30e9\u30fc\u30a4\u30f3\u30b9\u30c6\u30a3\u30f3\u30af\u30c8','\ud0ac\ub7ec \uc778\uc2a4\ud305\ud2b8','\u6740\u624b\u672c\u80fd','\u6bba\u624b\u672c\u80fd','\u05e8\u05d5\u05e6\u05d7 \u05d0\u05d9\u05e0\u05e1\u05d8\u05d9\u05e0\u05e7\u05d8','\u063a\u0631\u064a\u0632\u0629 \u0627\u0644\u0642\u0627\u062a\u0644','\u0e2a\u0e31\u0e0d\u0e0a\u0e32\u0e15\u0e0d\u0e32\u0e13\u0e19\u0e31\u0e01\u0e06\u0e48\u0e32')
INSERT INTO "gamenames" VALUES(14,'Guilty Gear Xrd Rev. 2','ggxrd','\u30ae\u30eb\u30c6\u30a3\u30ae\u30a2 \u30a4\u30b0\u30b6\u30fc\u30c9REV 2','\uae38\ud2f0 \uae30\uc5b4 Xrd Rev. 2','\u7f6a\u6076\u88c5\u5907 Xrd Rev. 2','\u7f6a\u60e1\u88dd\u5099 Xrd Rev. 2','\u05e6\u05d9\u05d5\u05d3 \u05d2\u05d9\u05dc\u05d8\u05d9 Xrd Rev. 2','\u063a\u064a\u0644\u062a\u064a \u062c\u064a\u0631 Xrd Rev. 2','Guilty Gear Xrd Rev. 2')
INSERT INTO "gamenames" VALUES(15,'Blazblue Central Fiction','bb','\u30d6\u30ec\u30a4\u30d6\u30eb\u30fc \u30bb\u30f3\u30c8\u30e9\u30eb\u30d5\u30a3\u30af\u30b7\u30e7\u30f3','\ube14\ub808\uc774 \ube14\ub8e8 \uc13c\ud2b8\ub7f4 \uc18c\uc124','\u5e03\u96f7\u84dd\u4e2d\u592e\u5c0f\u8bf4','\u5e03\u96f7\u85cd\u4e2d\u592e\u5c0f\u8aaa','\u05d1\u05e8\u05d9\u05d9 \u05db\u05d7\u05d5\u05dc \u05d1\u05d3\u05d9\u05d5\u05e0\u05d9 \u05de\u05e8\u05db\u05d6\u05d9','\u0628\u0631\u0627\u064a \u0628\u0644\u0648 \u0627\u0644\u062e\u064a\u0627\u0644 \u0627\u0644\u0645\u0631\u0643\u0632\u064a','Blazblue Central Fiction')
INSERT INTO "gamenames" VALUES(16,'Skullgirls','sg','\u30b9\u30ab\u30eb\u30ac\u30fc\u30eb\u30ba','\uc2a4\uceec \uac78\uc988','\u9ab7\u9ac5\u5973\u5b69','\u9ab7\u9acf\u5973\u5b69','\u05d1\u05e0\u05d5\u05ea \u05d4\u05d2\u05d5\u05dc\u05d2\u05d5\u05dc\u05ea','\u0627\u0644\u062c\u0645\u062c\u0645\u0629 \u0627\u0644\u0641\u062a\u064a\u0627\u062a','\u0e2a\u0e32\u0e27\u0e01\u0e30\u0e42\u0e2b\u0e25\u0e01')
INSERT INTO "gamenames" VALUES(17,'Under Night In-Birth Exe:Late[st]','unist','\u30a2\u30f3\u30c0\u30fc\u30ca\u30a4\u30c8\u30a4\u30f3\u30f4\u30a1\u30fc\u30b9\u30a8\u30af\u30bb\u30ec\u30a4\u30c8\u30a8\u30b9\u30c8','\uc5b8\ub354 \ub098\uc774\ud2b8 \uc778 \ubc14\uc2a4 \uc5d1\uc140 \ub808\uc774\ud2b8 \uc5d0\uc2a4\ud2b8','\u5728\u591c\u95f4\u51fa\u751f','\u5728\u591c\u9593\u51fa\u751f','\u05de\u05ea\u05d7\u05ea \u05dc\u05dc\u05d9\u05d3\u05d4','\u062a\u062d\u062a \u0644\u064a\u0644\u0629 \u0641\u064a \u0627\u0644\u0648\u0644\u0627\u062f\u0629','Under Night In-Birth Exe:Late[st]')
INSERT INTO "gamenames" VALUES(18,'Super Smash Bros. Melee','ssbm','\u5927\u4e71\u95d8\u30b9\u30de\u30c3\u30b7\u30e5\u30d6\u30e9\u30b6\u30fc\u30baDX','\ub300\ub09c\ud22c \uc2a4\ub9e4\uc2dc\ube0c\ub77c\ub354\uc2a4 DX','\u4efb\u5929\u5802\u660e\u661f\u5927\u4e71\u6597DX','\u4efb\u5929\u5802\u660e\u661f\u5927\u4e82\u9b25DX','\u05d4\u05d0\u05d7\u05d9\u05dd \u05e1\u05d5\u05e4\u05e8 \u05dc\u05e8\u05e1\u05e7 \u05ea\u05d2\u05e8\u05d4','\u0633\u0648\u0628\u0631 \u0633\u0645\u0627\u0634 \u0627\u0644\u0625\u062e\u0648\u0629 \u0627\u0644\u0645\u0634\u0627\u062c\u0631\u0629','Super Smash Bros. Melee')
INSERT INTO "gamenames" VALUES(19,'Super Smash Bros. for Wii U','ssb4','\u5927\u4e71\u95d8\u30b9\u30de\u30c3\u30b7\u30e5\u30d6\u30e9\u30b6\u30fc\u30ba for Wii U','\uc288\ud37c \uc2a4\ub9e4\uc2dc\ube0c\ub77c\ub354\uc2a4 for \ub2cc\ud150\ub3c4 Wii U','\u4efb\u5929\u5802\u660e\u661f\u5927\u4e71\u6597Wii U','\u4efb\u5929\u5802\u660e\u661f\u5927\u4e82\u9b25Wii U','\u05d4\u05d0\u05d7\u05d9\u05dd \u05dc\u05e8\u05e1\u05e7 \u05e1\u05d5\u05e4\u05e8 \u05e2\u05d1\u05d5\u05e8 Wii U','\u0633\u0648\u0628\u0631 \u0633\u0645\u0627\u0634 \u0627\u0644\u0625\u062e\u0648\u0629 \u0644\u0648\u064a U','Super Smash Bros. for Wii U')
INSERT INTO "gamenames" VALUES(20,'Injustice 2','ij2','\u30a4\u30f3\u30b8\u30e3\u30b9\u30c6\u30a3\u30b9 2','\uc778\uc800\uc2a4\ud2f0\uc2a4 2','\u4e0d\u4e49\u8054\u76df\uff1a\u4eba\u95f4\u4e4b\u795e2','\u4e0d\u4e49\u8054\u76df\uff1a\u4eba\u95f4\u4e4b\u795e2','\u05e2\u05d5\u05d5\u05dc 2','\u0625\u0646\u062c\u0627\u0633\u062a\u0633 2','Injustice 2')
INSERT INTO "gamenames" VALUES(21,'Mortal Kombat XL','mkx','\u30e2\u30fc\u30bf\u30eb\u30b3\u30f3\u30d0\u30c3\u30c8XL','\ubaa8\ud0c8 \ucef4\ubc43 XL','\u771f\u4eba\u5feb\u6253XL','\u771f\u4eba\u5feb\u6253XL','\u05de\u05d5\u05e8\u05d8\u05dc \u05e7\u05d5\u05de\u05d1\u05d8 XL','\u0643\u0648\u0645\u0628\u0627\u062a \u0628\u0634\u0631\u064a XL','Mortal Kombat XL')
INSERT INTO "gamenames" VALUES(22,'Persona 4 Arena Ultimax','p4a','\u30da\u30eb\u30bd\u30ca4 \u30b8\u30fb\u30a2\u30eb\u30c6\u30a3\u30de\u30c3\u30af\u30b9\u30a6\u30eb\u30c8\u30e9\u30b9\u30fc\u30d7\u30ec\u30c3\u30af\u30b9\u30db\u30fc\u30eb\u30c9','\ud398\ub974\uc18c\ub098 4 \uc544\ub808\ub098 \uc5bc\ud2f0\ub9e5\uc2a4','\u5973\u795e\u5f02\u95fb\u5f554 \u7ec8\u6781\u6df1\u591c\u6597\u6280\u573a','\u5973\u795e\u7570\u805e\u93044 \u7d42\u6975\u6df1\u591c\u9b25\u6280\u5834','\u05e4\u05d9\u05e8\u05e1\u05d9\u05d5\u05e0\u05d4 4','\u0628\u064a\u0631\u0633\u0648\u0646\u0627 4 \u0623\u0631\u064a\u0646\u0627 \u0623\u0648\u0644\u062a\u064a\u0645\u0627\u0643\u0633','Persona 4 Arena Ultimax')
INSERT INTO "gamenames" VALUES(23,'Arcana Heart 3 Love Max Six Stars!!!!!!','ah3','\u30a2\u30eb\u30ab\u30ca\u30cf\u30fc\u30c83 LOVE MAX!!!!!','\uc544\ub974\uce74\ub098 \ud558\ud2b8 3 LOVE MAX!!!!!','Arcana Heart 3 Love Max Six Stars!!!!!!','Arcana Heart 3 Love Max Six Stars!!!!!!','Arcana Heart 3 Love Max Six Stars!!!!!!','Arcana Heart 3 Love Max Six Stars!!!!!!','Arcana Heart 3 Love Max Six Stars!!!!!!')
INSERT INTO "gamenames" VALUES(24,'Jackie Chan in Fists of Fire','jcfof','\u30b8\u30e3\u30c3\u30ad\u30fc\u30fb\u30c1\u30a7\u30f3 FISTS OF FIRE \u6210\u9f8d\u4f1d\u8aacl','\uc7ac\ud0a4 \ucc2c FISTS OF FIRE','\u6210\u9f99\u706b\u7130\u4e4b\u62f3','\u6210\u9f8d\u706b\u7130\u4e4b\u62f3','\u05d2 ''\u05e7\u05d9 \u05e6'' \u05d0\u05df \u05d0\u05d2\u05e8\u05d5\u05e4\u05d9 \u05d0\u05e9','\u062c\u0627\u0643\u064a \u0634\u0627\u0646 \u0627\u0644\u0642\u0628\u0636\u0627\u062a \u0627\u0644\u0646\u0627\u0631','\u0e41\u0e08\u0e47\u0e01\u0e01\u0e35\u0e49\u0e0a\u0e32\u0e19\u0e2b\u0e21\u0e31\u0e14\u0e44\u0e1f')
INSERT INTO "gamenames" VALUES(25,'Dengeki Bunko: Fighting Climax Ignition','dbfc','\u96fb\u6483\u6587\u5eab FIGHTING CLIMAX IGNITION','\uc804\uae30 \uc8fc\uc785','\u7535\u51fb\u6587\u5e93 \u683c\u6597\u5dc5\u5cf0','\u96fb\u64ca\u6587\u5eab \u683c\u9b25\u5dd4\u5cf0','Dengeki Bunko: Fighting Climax Ignition','Dengeki Bunko: Fighting Climax Ignition','Dengeki Bunko: Fighting Climax Ignition')
INSERT INTO "gamenames" VALUES(26,'Virtua Fighter 5 Final Showdown','vf5','\u30d0\u30fc\u30c1\u30e3\u30d5\u30a1\u30a4\u30bf\u30fc5\u30d5\u30a1\u30a4\u30ca\u30eb\u30b7\u30e7\u30fc\u30c0\u30a6\u30f3','\ubc84\ucd94\uc5b4 \ud30c\uc774\ud130 5 \ud30c\uc774\ub110 \uc1fc\ub2e4\uc6b4','VR\u6218\u58eb5','VR\u6230\u58eb5','Virtua Fighter 5 Final Showdown','\u0641\u064a\u0631\u062a\u0648\u0627 \u0645\u0642\u0627\u062a\u0644\u0629 5','Virtua Fighter 5 Final Showdown')
INSERT INTO "gamenames" VALUES(27,'Dead or Alive 5 Last Round','doa5','\u30c7\u30c3\u30c9 \u30aa\u30a2 \u30a2\u30e9\u30a4\u30d65','\ub370\ub4dc \uc624\uc5b4 \uc5bc\ub77c\uc774\ube0c 5','\u6b7b\u6216\u6d3b5','\u6b7b\u6216\u6d3b5','\u05de\u05ea \u05d0\u05d5 \u05d7\u05d9\u05d9\u05dd 5','\u062f\u064a\u062f \u0623\u0648\u0631 \u0623\u0644\u0627\u064a\u0641 5','\u0e15\u0e32\u0e22\u0e2b\u0e23\u0e37\u0e2d\u0e21\u0e35\u0e0a\u0e35\u0e27\u0e34\u0e15\u0e2d\u0e22\u0e39\u0e48 5')
INSERT INTO "gamenames" VALUES(28,'Soul Calibur II','sc2',' \u30bd\u30a6\u30eb\u30ad\u30e3\u30ea\u30d0\u30fcII','\uc18c\uc6b8\uce7c\ub9ac\ubc84 2','\u7075\u9b42\u80fd\u529bII','\u9748\u9b42\u80fd\u529bII','\u05e1\u05d5\u05dc\u05d9\u05d1\u05e8 \u05e7\u05dc\u05d9\u05d1\u05e8 2','\u0633\u0648\u0644 \u0643\u0627\u0644\u064a\u0628\u0631 2','Soul Calibur 2')
INSERT INTO "gamenames" VALUES(29,'Soul Calibur V','scv',' \u30bd\u30a6\u30eb\u30ad\u30e3\u30ea\u30d0\u30fcV','\uc18c\uc6b8\uce7c\ub9ac\ubc84 5','\u7075\u9b42\u80fd\u529bV','\u9748\u9b42\u80fd\u529bV','\u05e1\u05d5\u05dc\u05d9\u05d1\u05e8 \u05e7\u05dc\u05d9\u05d1\u05e8 5','\u0633\u0648\u0644 \u0643\u0627\u0644\u064a\u0628\u0631 5','Soul Calibur 5')
INSERT INTO "gamenames" VALUES(30,'Akatsuki Blitzkampf','ab','\u30a2\u30ab\u30c4\u30ad\u96fb\u5149\u6226\u8a18','\uc544\uce74\uce20\ud0a4 \uc804\uad11 \uc804\uae30','\u6653\u6708\u7535\u5149\u6218','\u66c9\u6708\u96fb\u5149\u6230','\u05dc\u05d5\u05d7 \u05d7\u05e9\u05de\u05dc \u05d0\u05e7\u05d0\u05e6\u05d5\u05e7\u05d9 \u05dc\u05d5\u05d7\u05de\u05d4','\u0623\u0643\u0627\u062a\u0633\u0648\u0643\u064a \u0627\u0644\u0643\u0647\u0631\u0628\u0627\u0626\u064a\u0629 \u0627\u0644\u062e\u0641\u064a\u0641\u0629 \u0627\u0644\u062d\u0631\u0628','Akatsuki Blitzkampf')
INSERT INTO "gamenames" VALUES(31,'Koihime Enbu','ke','\u604b\u59eb\u2020\u6f14\u6b66','\uc5f0\ud76c \uc5f0\ubb34','\u604b\u59eb\u6f14\u6b66','\u604b\u59eb\u6f14\u6b66','\u05e7\u05d5\u05d4\u05d9\u05de\u05d9\u05d4 \u05d0\u05e0\u05d1\u05d5','\u0643\u0648\u0647\u064a\u0645\u064a \u0625\u0646\u0628\u0648','Koihime Enbu')
INSERT INTO "gamenames" VALUES(32,'Nitroplus Blasterz -Heroines Infinite Duel-','npb','\u30cb\u30c8\u30ed\u30d7\u30e9\u30b9 \u30d6\u30e9\u30b9\u30bf\u30fc\u30ba -\u30d2\u30ed\u30a4\u30f3\u30ba \u30a4\u30f3\u30d5\u30a3\u30cb\u30c3\u30c8 \u30c7\u30e5\u30a8\u30eb-','\ub2c8\ud2b8\ub85c \ud50c\ub7ec\uc2a4 \ubc1c\ud30c\uacf5 \ud788\ub85c\uc778\uc988 \uc778\ud53c\ub2c8\ud2b8 \ub4c0\uc5bc','Nitroplus\u7206\u88c2\u8005\u5973\u82f1\u96c4\u65e0\u9650\u51b3\u6597','Nitroplus\u7206\u88c2\u8005\u5973\u82f1\u96c4\u7121\u9650\u6c7a\u9b25','Nitroplus Blasterz Heroines Infinite Duel','\u0646\u064a\u062a\u0631\u0648\u0628\u0644\u0648\u0633 \u0628\u0644\u0627\u0633\u062a\u0631\u0633 \u0628\u0637\u0644\u0627\u062a \u0625\u0646\u0641\u064a\u0646\u064a\u062a \u0645\u0628\u0627\u0631\u0632\u0629 ','Nitroplus Blasterz Heroines Infinite Duel')
INSERT INTO "gamenames" VALUES(33,'Divekick Addition Edition','dk','\u30c0\u30a4\u30d6\u30ad\u30c3\u30af','\ub2e4\uc774\ube0c\ud0a5','\u6f5c\u6c34\u8e22','\u6f5b\u6c34\u8e22','\u05dc\u05e6\u05dc\u05d5\u05dc \u05dc\u05d1\u05e2\u05d5\u05d8','\u0631\u0643\u0644\u0629 \u0627\u0644\u063a\u0648\u0635','\u0e14\u0e33\u0e19\u0e49\u0e33')
INSERT INTO "gamenames" VALUES(34,'Rising Thunder','rt','\u30e9\u30a4\u30b8\u30f3\u30b0\u30b5\u30f3\u30c0\u30fc','\ub77c\uc774\uc9d5 \uc36c\ub354','\u5d1b\u8d77\u7684\u96f7\u9706','\u5d1b\u8d77\u7684\u96f7\u9706','\u05e8\u05e2\u05dd \u05e2\u05d5\u05dc\u05d4','\u0627\u0631\u062a\u0641\u0627\u0639 \u0627\u0644\u0631\u0639\u062f','Rising Thunder')
INSERT INTO "gamenames" VALUES(35,'Eternal Champions','ec','\u6c38\u9060\u306e\u30c1\u30e3\u30f3\u30d4\u30aa\u30f3','\uc601\uc6d0\ud55c \ucc54\ud53c\uc5b8','\u6c38\u6052\u7684\u51a0\u519b','\u6c38\u6046\u7684\u51a0\u8ecd','\u05d0\u05dc\u05d5\u05e4\u05d9\u05dd \u05e0\u05e6\u05d7\u05d9\u05dd','\u0627\u0644\u0627\u0628\u0637\u0627\u0644 \u0627\u0644\u062e\u0627\u0644\u062f\u0629','\u0e41\u0e0a\u0e21\u0e40\u0e1b\u0e35\u0e22\u0e19\u0e19\u0e34\u0e23\u0e31\u0e19\u0e14\u0e23\u0e4c')
INSERT INTO "gamenames" VALUES(36,'Pokk\u00e9n Tournament','pt','\u30dd\u30c3\u62f3','\ud31d \uc8fc\uba39','\u53e3\u888b\u94c1\u62f3','\u53e3\u888b\u9435\u62f3','Pokken Tournament','\u0628\u0648\u0643\u064a\u0646 \u062a\u0648\u0631\u0646\u0627\u0645\u0646\u062a','\u0e42\u0e1b\u0e40\u0e01\u0e47\u0e19 \u0e17\u0e31\u0e27\u0e23\u0e4c\u0e19\u0e32\u0e40\u0e21\u0e47\u0e19\u0e17\u0e4c')
INSERT INTO "gamenames" VALUES(37,'Dragon Ball FighterZ','dbfz','\u30c9\u30e9\u30b4\u30f3\u30dc\u30fc\u30eb \u30d5\u30a1\u30a4\u30bf\u30fc\u30ba','\ub4dc\ub798\uace4 \ud30c\uc774\ud130','\u9f99\u73e0\u6218\u58eb','\u9f8d\u73e0\u6230\u58eb','\u05d3\u05e8\u05d2\u05d5\u05df \u05d1\u05d5\u05dc \u05dc\u05d5\u05d7\u05de\u05d9\u05dd','\u062f\u0631\u0627\u063a\u0648\u0646 \u0628\u0648\u0644 \u0641\u0627\u064a\u062a\u0631\u0632','\u0e19\u0e31\u0e01\u0e2a\u0e39\u0e49\u0e40\u0e23\u0e37\u0e2d\u0e14\u0e23\u0e32\u0e01\u0e49\u0e2d\u0e19\u0e1a\u0e2d\u0e25')
INSERT INTO "gamenames" VALUES(38,'Vanguard Princess','vp','\u30f4\u30a1\u30f3\u30ac\u30fc\u30c9\u30d7\u30ea\u30f3\u30bb\u30b9','\ubc45\uac00\ub4dc \ud504\ub9b0\uc138\uc2a4','\u5148\u950b\u516c\u4e3b','\u5148\u92d2\u516c\u4e3b','\u05d4\u05e0\u05e1\u05d9\u05db\u05d4 \u05d5\u05d0\u05e0\u05d2\u05d0\u05e8\u05d3','\u0637\u0644\u064a\u0639\u0629 \u0627\u0644\u0623\u0645\u064a\u0631\u0629','Vanguard Princess')
INSERT INTO "gamenames" VALUES(39,'Project M','pm','\u30d7\u30ed\u30b8\u30a7\u30af\u30c8M','\ud504\ub85c\uc81d\ud2b8 M','\u9879\u76eeM','\u9805\u76eeM','\u05e4\u05e8\u05d5\u05d9\u05e7\u05d8 M','\u0627\u0644\u0645\u0634\u0631\u0648\u0639 M','Project M')
INSERT INTO "gamenames" VALUES(40,'Brawlhalla','bh','\u30d6\u30e9\u30c3\u30e9\u30cf\u30e9','\ube0c\ub77c\uc6b8\ud560\ub77c','Brawlhalla','Brawlhalla','Brawlhalla','Brawlhalla','Brawlhalla')
INSERT INTO "gamenames" VALUES(41,'Rivals of Aether','roa','Rivals of Aether','Rivals of Aether','Rivals of Aether','Rivals of Aether','Rivals of Aether','Rivals of Aether','Rivals of Aether')
INSERT INTO "gamenames" VALUES(42,'Them''s Fightin'' Herds','tfh','Them''s Fightin'' Herds','Them''s Fightin'' Herds','\u5f69\u8679\u5c0f\u9a6c\uff1a\u683c\u6597\u5c31\u662f\u9b54\u6cd5','\u5f69\u8679\u5c0f\u99ac\uff1a\u683c\u9b25\u5c31\u662f\u9b54\u6cd5','Them''s Fightin'' Herds','Them''s Fightin'' Herds','Them''s Fightin'' Herds')
INSERT INTO "gamenames" VALUES(43,'Samurai Showdown V Special','ssv','\u30b5\u30e0\u30e9\u30a4\u30b9\u30d4\u30ea\u30c3\u30c4\u96f6 SPECIAL','\uc0ac\ubb34\ub77c\uc774 \uc2a4\ud53c\ub9ac\uce20 \uc81c\ub85c SPECIAL','\u6b66\u58eb\u7cbe\u795e\u96f6\u7279\u522b','\u6b66\u58eb\u7cbe\u795e\u96f6\u7279\u5225','\u05e1\u05de\u05d5\u05e8\u05d0\u05d9 \u05e8\u05d5\u05d7\u05d5\u05ea \u05d0\u05e4\u05e1 \u05de\u05d9\u05d5\u05d7\u05d3','\u0627\u0644\u0633\u0627\u0645\u0631\u0627\u0626\u064a \u0627\u0644\u0623\u0631\u0648\u0627\u062d \u0635\u0641\u0631 \u062e\u0627\u0635','Samurai Showdown V Special')
INSERT INTO "gamenames" VALUES(44,'Dissidia Final Fantasy NT','ffd','\u30c7\u30a3\u30b7\u30c7\u30a3\u30a2 \u30d5\u30a1\u30a4\u30ca\u30eb\u30d5\u30a1\u30f3\u30bf\u30b8\u30fc','\ub514\uc2dc\ub514\uc544 \ud30c\uc774\ub110 \ud310\ud0c0\uc9c0','\u6700\u7ec8\u5e7b\u60f3 \u7eb7\u4e89','\u6700\u7d42\u5e7b\u60f3 \u7d1b\u722d','Dissidia Final Fantasy NT','\u062f\u064a\u0633\u064a\u062f\u064a\u0627 \u0641\u0627\u064a\u0646\u0644 \u0641\u0627\u0646\u062a\u0633\u064a \u0625\u0646 \u062a\u064a','Dissidia Final Fantasy NT')
INSERT INTO "gamenames" VALUES(45,'Garou: Mark of the Wolves','motw','\u9913\u72fc MARK OF THE WOLVES','\uac00\ub85c\uc6b0: \ub9c8\ud06c \uc624\ube0c \ub354 \uc6b8\ube0c\uc2a4','\u997f\u72fc \u7fa4\u72fc\u4e4b\u8bc1','\u9913\u72fc \u7fa4\u72fc\u4e4b\u8b49','Garou: Mark of the Wolves','Garou: Mark of the Wolves','\u0e01\u0e32\u0e42\u0e23\u0e48 \u0e21\u0e32\u0e23\u0e4c\u0e04\u0e2d\u0e2d\u0e1f\u0e40\u0e14\u0e2d\u0e30\u0e27\u0e39\u0e25\u0e4c\u0e1f')
INSERT INTO "gamenames" VALUES(46,'Vampire Savior','vs','\u30f4\u30a1\u30f3\u30d1\u30a4\u30a2 \u30bb\u30a4\u30f4\u30a1\u30fc','\ubc40\ud30c\uc774\uc5b4 \uc138\uc774\ubc84','\u5438\u8840\u9b3c\u6551\u4e16\u4e3b','\u5438\u8840\u9b3c\u6551\u4e16\u4e3b','Vampire Savior','Vampire Savior','Vampire Savior')
INSERT INTO "gamenames" VALUES(47,'Waku Waku 7','ww7','\u308f\u304f\u308f\u304f7','\uc640\ucfe0\uc640\ucfe0 7','\u7cbe\u5f697','\u7cbe\u5f697','Waku Waku 7','Waku Waku 7','Waku Waku 7')
INSERT INTO "gamenames" VALUES(48,'Rival Schools','rs','\u79c1\u7acb\u30b8\u30e3\u30b9\u30c6\u30a3\u30b9\u5b66\u5712 LEGION OF HEROES','\uc0ac\ub9bd \uc800\uc2a4\ud2f0\uc2a4 \ud559\uc6d0 LEGION OF HEROES','\u79c1\u7acb\u6b63\u4e49\u5b66\u56ed','\u79c1\u7acb\u6b63\u7fa9\u5b78\u5712','\u05dc\u05d7\u05e9\u05d5\u05e3 \u05e9\u05d5\u05dc\u05e1: \u05e2\u05dc \u05d9\u05d3\u05d9 \u05e4\u05d9\u05d9\u05d8','\u0631\u064a\u0641\u064a\u0644 \u0633\u0643\u0648\u0644\u0632: \u064a\u0648\u0646\u0627\u064a\u062a\u062f \u0628\u0627\u064a \u0641\u0627\u064a\u062a','Rival Schools')
INSERT INTO "gamenames" VALUES(49,'Tatsunoko Vs. Capcom','tvc','\u30bf\u30c4\u30ce\u30b3 VS. CAPCOM','\ud0c0\ucbd4\ub178\ucf54 VS. CAPCOM','Tatsunoko Vs. Capcom','Tatsunoko Vs. Capcom','Tatsunoko Vs. Capcom','Tatsunoko Vs. Capcom','Tatsunoko Vs. Capcom')
INSERT INTO "gamenames" VALUES(50,'Ultimate Marvel Vs. Capcom 3','mvc3','\u30a2\u30eb\u30c6\u30a3\u30e1\u30c3\u30c8 \u30de\u30fc\u30f4\u30eb VS. \u30ab\u30d7\u30b3\u30f33','\uad81\uadf9 \ub9c8\ube14 VS. \ucea1\ucf64 3','Ultimate Marvel Vs. Capcom 3','Ultimate Marvel Vs. Capcom 3','Ultimate Marvel Vs. Capcom 3','Ultimate Marvel Vs. Capcom 3','\u0e2d\u0e31\u0e25\u0e15\u0e34\u0e40\u0e21\u0e15\u0e21\u0e32\u0e23\u0e4c\u0e40\u0e27\u0e25 vs. \u0e41\u0e04\u0e1b\u0e04\u0e2d\u0e21 3')
INSERT INTO "gamenames" VALUES(51,'Marvel Vs. Capcom 2','mvc2','\u30de\u30fc\u30f4\u30eb VS. \u30ab\u30d7\u30b3\u30f3 2 \u30cb\u30e5\u30fc \u30a8\u30a4\u30b8 \u30aa\u30d6 \u30d2\u30fc\u30ed\u30fc\u30ba','\ub9c8\ube14 VS. \ucea1\ucf64 2 \ub274 \uc5d0\uc774\uc9c0 \uc624\ube0c \ud788\uc5b4\ub85c\uc988','Marvel Vs. Capcom 2','Marvel Vs. Capcom 2','Marvel Vs. Capcom 2','Marvel Vs. Capcom 2','Marvel Vs. Capcom 2')
INSERT INTO "gamenames" VALUES(52,'Marvel Vs. Capcom Infinite','mvci','\u30de\u30fc\u30d9\u30eb VS. \u30ab\u30d7\u30b3\u30f3:\u30a4\u30f3\u30d5\u30a3\u30cb\u30c3\u30c8','\ub9c8\ube14 VS. \ucea1\ucf64 : \uc778\ud53c\ub2c8\ud2b8','Marvel Vs. Capcom Infinite','Marvel Vs. Capcom Infinite','\u05de\u05d0\u05e8\u05e7\u05d5\u05dc \u05d5\u05e8\u05e1\u05d0\u05e6''\u05d4 \u05e7\u05e4\u05e7\u05d5\u05dd: \u05d0\u05d9\u05e0\u05e1\u05d5\u05e4\u05d9','\u0645\u0627\u0631\u0641\u0644 \u0641\u064a\u0631\u0633\u0632 \u0643\u0627\u0628\u0643\u0648\u0645: \u0625\u0646\u0641\u0646\u064a\u062a','Marvel Vs. Capcom Infinite')
INSERT INTO "gamenames" VALUES(53,'Fight of Gods','fog','Fight of Gods','Fight of Gods','Fight of Gods','Fight of Gods','Fight of Gods','Fight of Gods','Fight of Gods')
INSERT INTO "gamenames" VALUES(54,'Blazblue: Cross Tag Battle','bbctb','Blazblue: Cross Tag Battle','Blazblue: Cross Tag Battle','Blazblue: Cross Tag Battle','Blazblue: Cross Tag Battle','Blazblue: Cross Tag Battle','Blazblue: Cross Tag Battle','Blazblue: Cross Tag Battle')
INSERT INTO "gamenames" VALUES(55,'Heroes of the Storm','hots','\u30d2\u30fc\u30ed\u30fc\u30ba\u30fb\u30aa\u30d6\u30fb\u30b6\u30fb\u30b9\u30c8\u30fc\u30e0','\ud788\uc5b4\ub85c\uc988 \uc624\ube0c \ub354 \uc2a4\ud1b0','\u98ce\u66b4\u82f1\u96c4','\u98a8\u66b4\u82f1\u96c4','\u05d2\u05d9\u05d1\u05d5\u05e8\u05d9 \u05d4\u05e1\u05d5\u05e4\u05d4','\u0623\u0628\u0637\u0627\u0644 \u0627\u0644\u0639\u0627\u0635\u0641\u0629','\u0e27\u0e35\u0e23\u0e1a\u0e38\u0e23\u0e38\u0e29\u0e41\u0e2b\u0e48\u0e07\u0e1e\u0e32\u0e22\u0e38')
INSERT INTO "gamenames" VALUES(56,'League of Legends','lol','\u30ea\u30fc\u30b0\u30fb\u30aa\u30d6\u30fb\u30ec\u30b8\u30a7\u30f3\u30c9','\ub9ac\uadf8 \uc624\ube0c \ub808\uc804\ub4dc','\u82f1\u96c4\u8054\u76df','\u82f1\u96c4\u806f\u76df','\u05dc\u05d9\u05d2\u05ea \u05d4\u05d0\u05d2\u05d3\u05d5\u05ea','\u0644\u064a\u062c \u0623\u0648\u0641 \u0644\u064a\u062c\u064a\u0646\u062f\u0632','\u0e25\u0e35\u0e01\u0e2d\u0e2d\u0e1f\u0e40\u0e25\u0e40\u0e08\u0e19\u0e14\u0e4c')
INSERT INTO "gamenames" VALUES(57,'Dota 2','dota2','Dota 2','Dota 2','Dota 2','Dota 2','Dota 2','Dota 2','Dota 2')
INSERT INTO "gamenames" VALUES(58,'Overwatch','ow','\u30aa\u30fc\u30d0\u30fc\u30a6\u30a9\u30c3\u30c1','\uc624\ubc84\uc6cc\uce58','\u5b88\u671b\u5148\u950b','\u5b88\u671b\u5148\u92d2','Overwatch','\u0623\u0648\u0641\u0631\u0648\u0627\u062a\u0634','\u0e42\u0e2d\u0e40\u0e27\u0e2d\u0e23\u0e4c\u0e27\u0e2d\u0e15\u0e0a\u0e4c')
