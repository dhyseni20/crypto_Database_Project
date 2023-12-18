CREATE TABLE Users
(
  user_id INT NOT NULL,
  FName VARCHAR(20) NOT NULL,
  LName VARCHAR(20) NOT NULL,
  role VARCHAR(20),
  email VARCHAR(30),
  date_started DATE NOT NULL,
  password VARCHAR(20) NOT NULL,
  phone_nr INT,
  PRIMARY KEY (user_id)
);


CREATE TABLE Wallet
(
  wallet_id INT NOT NULL,
  blance INT NOT NULL,
  date_created DATE NOT NULL,
  user_id INT,
  PRIMARY KEY (wallet_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Cryptos
(
  crypto_id INT NOT NULL,
  cyptoname VARCHAR(20) NOT NULL,
  date DATE NOT NULL,
  value INT NOT NULL,
  amountavailable INT NOT NULL,
  PRIMARY KEY (crypto_id)
);


CREATE TABLE Bank
(
  IBAN INT NOT NULL,
  name VARCHAR NOT NULL,
  value INT NOT NULL,
  wallet_id INT NOT NULL,
  PRIMARY KEY (IBAN),
  FOREIGN KEY (wallet_id) REFERENCES Wallet(wallet_id)
);


CREATE TABLE Transfer
(
  user_id INT NOT NULL,
  client_id INT NOT NULL,
  crypto_id INT NOT NULL, 
  amount FLOAT  NOT NULL, 
  commission FLOAT  NOT NULL,
  date DATE NOT NULL,
  transaction_id INT NOT NULL,
  PRIMARY KEY (user_id, client_id, transaction_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (client_id) REFERENCES Users(user_id),
  FOREIGN KEY (crypto_id) REFERENCES Cryptos(crypto_id),
);

CREATE TABLE Buy_Sell
(
wallet_id INT NOT NULL,
crypto_id INT NOT NULL,  
amount FLOAT NOT NULL,
date DATE NOT NULL,
action VARCHAR(4) NOT NULL,
buy_sell INT NOT NULL,
PRIMARY KEY (wallet_id, crypto_id,buy_sell),
FOREIGN KEY (wallet_id) REFERENCES
Wallet(wallet_id),
FOREIGN KEY (crypto_id) REFERENCES
Cryptos(crypto_id)
);


CREATE TABLE Currency
(
  currency_id INT NOT NULL,
  name VARCHAR(10) NOT NULL,
  buy_value FLOAT NOT NULL,
  sell_value FLOAT NOT NULL,
  PRIMARY KEY (currency_id)
);


CREATE TABLE buy_transaction
(
  value FLOAT NOT NULL,
  date DATE NOT NULL,
  currency_id INT NOT NULL,
  user_id INT NOT NULL,
  transaction_id int not null,
  PRIMARY KEY (currency_id, user_id, transaction_id),
  FOREIGN KEY (currency_id) REFERENCES Currency(currency_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE sell_transaction
(
  value FLOAT NOT NULL,
  date DATE NOT NULL,
  currency_id INT NOT NULL,
  user_id INT NOT NULL,
  transaction_id int not null,
  PRIMARY KEY (currency_id, user_id, transaction_id),
  FOREIGN KEY (currency_id) REFERENCES Currency(currency_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);



/*Insert Into:
       Table Users*/
INSERT INTO Users VALUES   (' 0001 ' , 'Drilon ' , 'Hyseni ' , 'student ' , 'dhyseni20epoka.edu.al ' , ' 2021/10/16 ' , ' gsd689rer324542-' , '0683481570 ' )
INSERT INTO Users VALUES   (' 0002 ' , 'Fitim ' , 'Maguire ' , 'businessman ' , 'fmag@epoka.edu.al ' , '2022/01/02 ' , ' gsd689rer324542-' , '0683481570 ' )
INSERT INTO Users VALUES   (' 0003 ' , 'John ' , 'Varane ' , 'entrepreneur ' , 'javr@epoka.edu.al ' , ' 2021/11/18 ' , ' argdfdgz352-' , '0684567854 ' )
INSERT INTO Users VALUES   (' 0004 ' , 'Ender ' , 'Rashford ' , ' ' , 'erash@epoka.edu.al ' , '2021/12/26 ' , ' sdfg565465-' , '0684548954 ' )
INSERT INTO Users VALUES   (' 0005 ' , 'Mark ' , 'Sancho ' , 'student ' , 'msan@epoka.edu.al ' , '2021/10/30 ' , ' 5347tsfgsf-' , '0687836526 ' )
INSERT INTO Users VALUES   (' 0006 ' , 'Ger ' , 'Koka ' , 'employee ' , 'gk@epoka.edu.al ' , '2021/11/06 ' , ' 54635sgfdg-' , '0684532156 ' )
INSERT INTO Users VALUES   (' 0007 ' , 'Klajd ' , 'Marshal ' , ' ' , 'km@epoka.edu.al ' , '2022/01/05 ' , ' bxgshtt564-' , '0688786783 ' )
INSERT INTO Users VALUES   (' 0008 ' , 'Drita ' , 'Rock ' , 'married ' , 'drock@epoka.edu.al ' , '2021/11/08 ' , ' sfdhjdk345346-' , '0681237861 ' )

 
/*Table Wallet*/
  
INSERT into Wallet VALUES ('0100','600','2021/10/16','0001');
INSERT into Wallet VALUES ('0101','4000','2021/10/17','0001');
INSERT into Wallet VALUES ('0102','250','2021/10/16','0001');
INSERT into Wallet VALUES ('0103','343','2021/10/17','0001');
INSERT into Wallet VALUES ('0104','50','2021/10/20','0001');
INSERT into Wallet VALUES ('0105','6785','2021/10/25','0001');

INSERT into Wallet VALUES ('0200','4057','2022/01/02 ','0002');
INSERT into Wallet VALUES ('0201','100','2022/01/02 ','0002');
INSERT into Wallet VALUES ('0202','89','2022/01/02 ','0002');

INSERT into Wallet VALUES ('0300','530','2021/11/18 ','0003');
INSERT into Wallet VALUES ('0301','896','2021/11/18 ','0003');
INSERT into Wallet VALUES ('0302','67000','2021/11/18 ','0003');
INSERT into Wallet VALUES ('0303','5','2021/11/18 ','0003');

INSERT into Wallet VALUES ('0400','4200','2021/12/26 ','0004');

INSERT into Wallet VALUES ('0500','56000','2021/10/30 ','0005');

INSERT into Wallet VALUES ('0600','976','2021/11/06 ','0006');

INSERT into Wallet VALUES ('0700','5','2022/01/05 ','0007');
INSERT into Wallet VALUES ('0701','5','2022/01/07 ','0007');

INSERT into Wallet VALUES ('0800','4057','2021/11/08 ','0008');
INSERT into Wallet VALUES ('0801','100','2021/11/08 ','0008');
INSERT into Wallet VALUES ('0802','89','2021/12/02 ','0008');

/*Table Bank*/
SET ANSI_WARNINGS OFF;
INSERT into Bank values ( ' 10000' , 'BKT ' , '5000 ' , ' 0100 ')
INSERT into Bank values ( ' 10001' , 'BKT ' , '10000 ' , ' 0101 ')
INSERT into Bank values ( ' 10002' , 'Raiffeisen Bank ' , '8000 ' , ' 0102 ')
INSERT into Bank values ( ' 10003' , 'Raiffeisen Bank ' , '5000 ' , ' 0103 ')
INSERT into Bank VALUES ( ' 10004' , 'Tirana Bank ' , '4000 ' , ' 0104 ')
INSERT into Bank values ( ' 10005' , 'Tirana Bank ' , '6000 ' , ' 0105 ')

INSERT into Bank VALUES ( ' 20000' , 'Tirana Bank ' , '5000 ' , ' 0200 ')
INSERT into Bank VALUES ( ' 20001' , 'Tirana Bank ' , '9000 ' , ' 0201 ')
INSERT into Bank values ( ' 20002' , 'Tirana Bank ' , '650 ' , ' 0202 ')

INSERT into Bank VALUES ( ' 30000' , 'BKT ' , '7000 ' , ' 0300 ')
INSERT into Bank VALUES ( ' 30001' , 'BKT' , '6050 ' , ' 0301')
INSERT into Bank VALUES ( ' 30002' , 'Tirana Bank ' , '100 ' , ' 0302 ')
INSERT into Bank values ( ' 30003' , 'Reiffeisen Bank ' , '230 ' , ' 0303 ')

INSERT into Bank values ( ' 40000' , 'Tirana Bank ' , '45000 ' , ' 0400 ')

INSERT into Bank values ( ' 50000' , 'BKT ' , '3000 ' , ' 0500 ')

INSERT into Bank values ( ' 60000' , 'BKT' , '24000 ' , ' 0600 ')

INSERT into Bank VALUES ( ' 70001' , 'Reiffeisen Bank ' , '40500 ' , ' 0700 ')
INSERT into Bank values ( ' 70002' , 'Reiffeisen Bank ' , '600 ' , ' 0701 ')

INSERT into Bank VALUES ( ' 80000' , 'Reiffeisen Bank ' , '5500 ' , ' 0800 ')
INSERT into Bank VALUES ( ' 80001' , 'BKT ' , '6500 ' , ' 0801 ')
INSERT into Bank values ( ' 80002' , 'Reiffeisen Bank ' , '8230 ' , ' 0802 ')

/*Table Cryptos*/
INSERT INTO Cryptos VALUES('1' , 'BitCoin' , '2022/01/30' , '34800' , '400');
INSERT INTO Cryptos VALUES('2' , 'Etherum' , '2022/01/30' , '2584' , '1250');
INSERT INTO Cryptos VALUES('3' , 'Cardano' , '2022/01/30' , '3' , '5000');
INSERT INTO Cryptos VALUES('4' , 'Dogecoin' , '2022/01/30' , '1' , '10000');
INSERT INTO Cryptos VALUES('5' , 'Polkadot' , '2022/01/30' , '18' , '4500');

/*Table Currency*/
INSERT INTO Currency VALUES('1','USD','108','108.7');
INSERT INTO Currency VALUES('2','EUR','120.6','121.2');
INSERT INTO Currency VALUES('3','CHF','115.7','116.6');
INSERT INTO Currency VALUES('4','GBP','144.2','145.3');
INSERT INTO Currency VALUES('5','CAD','83.6','85');

/*Table buy_transaction*/
INSERT into buy_transaction VALUES ('80.3' , '2021/11/24' , '1' , '0001' , '1');
INSERT into buy_transaction VALUES ('1050' , '2022/01/25' , '2' , '0001', '2');
INSERT into buy_transaction VALUES ('652' ,  '2021/12/26' , '3' , '0001' , '3');
INSERT into buy_transaction VALUES ('75.4' , '2021/12/26' , '4' , '0001' , '4');
INSERT into buy_transaction VALUES ('20.8' , '2022/01/04' , '5' , '0001', '5');

INSERT into buy_transaction VALUES ('79.6' , '2021/11/24' , '1' , '0002', '6');
INSERT into buy_transaction VALUES ('2000' , '2022/01/25' , '1' , '0002', '7');
INSERT into buy_transaction VALUES ('678' ,  '2021/12/26' , '1' , '0002' , '8');
INSERT into buy_transaction VALUES ('40' , '2021/12/26' , '4' , '0002' , '9');
INSERT into buy_transaction VALUES ('5' , '2022/01/04' , '5' , '0002' , '10');

INSERT into buy_transaction VALUES ('89' , '2021/11/24' , '1' , '0006' , '11');
INSERT into buy_transaction VALUES ('10050' , '2022/01/25' , '2' , '0006' , '12');
INSERT into buy_transaction VALUES ('689' ,  '2021/12/26' , '4' , '0006' , '13');
INSERT into buy_transaction VALUES ('453' , '2021/12/26' , '4' , '0006' , '14');
INSERT into buy_transaction VALUES ('2' , '2022/01/04' , '5' , '0006' , '15');

INSERT into buy_transaction VALUES ('80.3' , '2021/11/24' , '5' , '0004' , '16');
INSERT into buy_transaction VALUES ('100' , '2022/01/25' , '5' , '0004' , '17');
INSERT into buy_transaction VALUES ('200' ,  '2021/12/26' , '5' , '0004' , '18');
INSERT into buy_transaction VALUES ('20450' , '2021/12/26' , '4' , '0004' , '19');
INSERT into buy_transaction VALUES ('22' , '2022/01/04' , '2' , '0004' , '20');

INSERT into buy_transaction VALUES ('503' , '2021/11/24' , '4' , '0007' , '21');
INSERT into buy_transaction VALUES ('1050' , '2022/01/25' , '4' , '0007' , '22');
INSERT into buy_transaction VALUES ('612' ,  '2021/12/26' , '3' , '0007' , '23');
INSERT into buy_transaction VALUES ('1500' , '2021/12/26' , '4' , '0007' , '24');
INSERT into buy_transaction VALUES ('289' , '2022/01/04' , '5' , '0001' , '25');

/*Table sell_transaction*/
INSERT into sell_transaction VALUES ('50' , '2021/11/25' , '1' , '0001' , '1');
INSERT into sell_transaction VALUES ('550' , '2022/01/26' , '2' , '0001', '2');
INSERT into sell_transaction VALUES ('40' ,  '2021/12/27' , '3' , '0001' , '3');
INSERT into sell_transaction VALUES ('1000' , '2021/12/27' , '4' , '0001' , '4');
INSERT into sell_transaction VALUES ('46' , '2022/01/05' , '5' , '0001', '5');

INSERT into sell_transaction VALUES ('4000' , '2021/11/25' , '1' , '0002', '6');
INSERT into sell_transaction VALUES ('20' , '2022/01/26' , '1' , '0002', '7');
INSERT into sell_transaction VALUES ('6' ,  '2021/12/29' , '1' , '0002' , '8');
INSERT into sell_transaction VALUES ('40' , '2021/12/29' , '4' , '0002' , '9');
INSERT into sell_transaction VALUES ('5' , '2022/01/08' , '5' , '0002' , '10');

INSERT into sell_transaction VALUES ('89' , '2021/11/29' , '1' , '0006' , '11');
INSERT into sell_transaction VALUES ('10050' , '2022/01/28' , '2' , '0006' , '12');
INSERT into sell_transaction VALUES ('6890' ,  '2021/12/30' , '4' , '0006' , '13');
INSERT into sell_transaction VALUES ('4053' , '2021/12/31' , '4' , '0006' , '14');
INSERT into sell_transaction VALUES ('202' , '2022/01/04' , '5' , '0006' , '15');

INSERT into sell_transaction VALUES ('803' , '2021/11/24' , '5' , '0004' , '16');
INSERT into sell_transaction VALUES ('1050' , '2022/01/25' , '5' , '0004' , '17');
INSERT into sell_transaction VALUES ('2040' ,  '2021/12/26' , '5' , '0004' , '18');
INSERT into sell_transaction VALUES ('650' , '2021/12/26' , '4' , '0004' , '19');
INSERT into sell_transaction VALUES ('202' , '2022/01/04' , '2' , '0004' , '20');

INSERT into sell_transaction VALUES ('5030' , '2021/11/30' , '4' , '0007' , '21');
INSERT into sell_transaction VALUES ('50' , '2022/01/30' , '4' , '0007' , '22');
INSERT into sell_transaction VALUES ('62' ,  '2021/12/27' , '3' , '0007' , '23');
INSERT into sell_transaction VALUES ('10' , '2021/12/28' , '4' , '0007' , '24');
INSERT into sell_transaction VALUES ('389' , '2022/01/08' , '5' , '0001' , '25');

/*Tabel Buy_Sell*/
INSERT INTO Buy_Sell VALUES ( '0100' , '1' , '0.17', '2021/11/23', 'buy' , '1');
INSERT INTO Buy_Sell VALUES ( '0101' , '2' , '8', '2021/11/23', 'buy' , '2');
INSERT INTO Buy_Sell VALUES ( '0102' , '3' , '3.4', '2021/10/28', 'buy' , '3');
INSERT INTO Buy_Sell VALUES ( '0103' , '4' , '40', '2021/11/29', 'buy' , '4');
INSERT INTO Buy_Sell VALUES ( '0104' , '5' , '2', '2021/11/13', 'buy' , '5');
INSERT INTO Buy_Sell VALUES ( '0100' , '1' , '4', '2021/12/23', 'buy' , '6');
INSERT INTO Buy_Sell VALUES ( '0102' , '2' , '16', '2021/10/26', 'buy' , '7');
INSERT INTO Buy_Sell VALUES ( '0103' , '4' , '2.4', '2022/01/23', 'buy' , '8');
INSERT INTO Buy_Sell VALUES ( '0104' , '4' , '80', '2021/11/11', 'buy' , '9');



INSERT INTO Buy_Sell VALUES ( '0200' , '4' , '80', '2022/01/23', 'buy' , '10');
INSERT INTO Buy_Sell VALUES ( '0201' , '2' , '0.57', '2021/10/29', 'buy' , '11');
INSERT INTO Buy_Sell VALUES ( '0202' , '5' , '9.15', '2021/11/12', 'buy' , '12');
INSERT INTO Buy_Sell VALUES ( '0200' , '1' , '3.4', '2021/11/25', 'buy' , '13');
INSERT INTO Buy_Sell VALUES ( '0201' , '1' , '0.02', '2021/11/26', 'buy' , '14');



INSERT INTO Buy_Sell VALUES ( '0300' , '2' , '5.2', '2021/12/31', 'buy' , '15');
INSERT INTO Buy_Sell VALUES ( '0301' , '2' , '2.1', '2021/11/30', 'buy' , '16');
INSERT INTO Buy_Sell VALUES ( '0302' , '4' , '200', '2021/12/23', 'buy' , '17');
INSERT INTO Buy_Sell VALUES ( '0303' , '5' , '18.4', '2021/11/13', 'buy' , '18');
INSERT INTO Buy_Sell VALUES ( '0302' , '3' , '1000', '2021/11/03', 'buy' , '19');
INSERT INTO Buy_Sell VALUES ( '0300' , '1' , '1.1', '2021/01/02', 'buy' , '20');
INSERT INTO Buy_Sell VALUES ( '0302' , '2' , '0.01', '2021/11/23', 'buy' , '21');
INSERT INTO Buy_Sell VALUES ( '0303' , '5' , '2.4', '2021/10/24', 'buy' , '22');




INSERT INTO Buy_Sell VALUES ( '0400' , '1' , '1.15', '2021/12/31', 'buy' , '23');
INSERT INTO Buy_Sell VALUES ( '0400' , '1' , '0.4', '2021/01/03', 'buy' , '24');
INSERT INTO Buy_Sell VALUES ( '0400' , '1' , '0.23', '2021/01/10', 'buy' , '25');




INSERT INTO Buy_Sell VALUES ( '0500' , '2' , '4.2', '2021/10/31', 'buy' , '26');
INSERT INTO Buy_Sell VALUES ( '0500' , '4' , '40', '2021/11/15', 'buy' , '27');




INSERT INTO Buy_Sell VALUES ( '0600' , '1' , '4.23', '2021/11/07', 'buy' , '28');




INSERT INTO Buy_Sell VALUES ( '0700' , '4' , '42', '2021/12/23', 'buy' , '29');
INSERT INTO Buy_Sell VALUES ( '0701' , '2' , '1.15', '2021/01/16', 'buy' , '30');
INSERT INTO Buy_Sell VALUES ( '0701' , '2' , '2.23', '2021/10/30', 'buy' , '31');
INSERT INTO Buy_Sell VALUES ( '0701' , '5' , '200', '2021/11/03', 'buy' , '32');




INSERT INTO Buy_Sell VALUES ( '0800' , '1' , '0.27', '2021/10/29', 'buy' , '33');
INSERT INTO Buy_Sell VALUES ( '0801' , '1' , '0.02', '2021/11/24', 'buy' , '34');
INSERT INTO Buy_Sell VALUES ( '0802' , '5' , '30', '2021/01/17', 'buy' , '35');
INSERT INTO Buy_Sell VALUES ( '0800' , '3' , '56.2', '2021/01/26', 'buy' , '36');
INSERT INTO Buy_Sell VALUES ( '0800' , '3' , '23.4', '2021/11/20', 'buy' , '37');
INSERT INTO Buy_Sell VALUES ( '0802' , '3' , '800', '2021/12/31', 'buy' , '38');


INSERT INTO Buy_Sell VALUES ( '0100' , '1' , '0.05', '2021/11/23', 'sell' , '40');
INSERT INTO Buy_Sell VALUES ( '0101' , '2' , '6', '2021/11/23', 'sell' , '41');
INSERT INTO Buy_Sell VALUES ( '0102' , '3' , '1.4', '2021/10/28', 'sell' , '42');
INSERT INTO Buy_Sell VALUES ( '0103' , '4' , '20', '2021/11/29', 'sell' , '43');
INSERT INTO Buy_Sell VALUES ( '0104' , '5' , '1', '2021/11/13', 'sell' , '44');
INSERT INTO Buy_Sell VALUES ( '0100' , '1' , '2.3', '2021/12/23', 'sell' , '45');
INSERT INTO Buy_Sell VALUES ( '0102' , '2' , '12', '2021/10/26', 'sell' , '46');
INSERT INTO Buy_Sell VALUES ( '0103' , '4' , '2.0', '2022/01/23', 'sell' , '47');
INSERT INTO Buy_Sell VALUES ( '0104' , '4' , '40', '2021/11/11', 'sell' , '48');



INSERT INTO Buy_Sell VALUES ( '0200' , '4' , '40', '2022/01/23', 'sell' , '49');
INSERT INTO Buy_Sell VALUES ( '0201' , '2' , '0.27', '2021/10/29', 'sell' , '50');
INSERT INTO Buy_Sell VALUES ( '0202' , '5' , '5.05', '2021/11/12', 'sell' , '51');
INSERT INTO Buy_Sell VALUES ( '0200' , '1' , '1.4', '2021/11/25', 'sell' , '52');
INSERT INTO Buy_Sell VALUES ( '0201' , '1' , '0.01', '2021/11/26', 'sell' , '53');



INSERT INTO Buy_Sell VALUES ( '0300' , '2' , '5.2', '2021/12/31', 'sell' , '54');
INSERT INTO Buy_Sell VALUES ( '0301' , '2' , '2.1', '2021/11/30', 'sell' , '55');
INSERT INTO Buy_Sell VALUES ( '0302' , '4' , '200', '2021/12/23', 'sell' , '56');
INSERT INTO Buy_Sell VALUES ( '0303' , '5' , '08.4', '2021/11/13', 'sell' , '57');
INSERT INTO Buy_Sell VALUES ( '0302' , '3' , '100', '2021/11/03', 'sell' , '58');
INSERT INTO Buy_Sell VALUES ( '0300' , '1' , '0.1', '2021/01/02', 'sell' , '59');
INSERT INTO Buy_Sell VALUES ( '0302' , '2' , '0.01', '2021/11/23', 'sell' , '60');
INSERT INTO Buy_Sell VALUES ( '0303' , '5' , '1.4', '2021/10/24', 'sell' , '61');




INSERT INTO Buy_Sell VALUES ( '0400' , '1' , '0.15', '2021/12/31', 'sell' , '62');
INSERT INTO Buy_Sell VALUES ( '0400' , '1' , '0.4', '2021/01/03', 'sell' , '63');
INSERT INTO Buy_Sell VALUES ( '0400' , '1' , '0.23', '2021/01/10', 'sell' , '64');




INSERT INTO Buy_Sell VALUES ( '0500' , '2' , '2.2', '2021/10/31', 'sell' , '65');
INSERT INTO Buy_Sell VALUES ( '0500' , '4' , '27', '2021/11/15', 'sell' , '67');




INSERT INTO Buy_Sell VALUES ( '0600' , '1' , '2.23', '2021/11/07', 'sell' , '68');




INSERT INTO Buy_Sell VALUES ( '0700' , '4' , '12', '2021/12/23', 'sell' , '69');
INSERT INTO Buy_Sell VALUES ( '0701' , '2' , '0.15', '2021/01/16', 'sell' , '70');
INSERT INTO Buy_Sell VALUES ( '0701' , '2' , '1.23', '2021/10/30', 'sell' , '71');
INSERT INTO Buy_Sell VALUES ( '0701' , '5' , '100', '2021/11/03', 'sell' , '72');




INSERT INTO Buy_Sell VALUES ( '0800' , '1' , '0.27', '2021/10/29', 'sell' , '73');
INSERT INTO Buy_Sell VALUES ( '0801' , '1' , '0.02', '2021/11/24', 'sell' , '74');
INSERT INTO Buy_Sell VALUES ( '0802' , '5' , '14', '2021/01/17', 'sell' , '75');
INSERT INTO Buy_Sell VALUES ( '0800' , '3' , '26.2', '2021/01/26', 'sell' , '76');
INSERT INTO Buy_Sell VALUES ( '0800' , '3' , '13.4', '2021/11/20', 'sell' , '77');
INSERT INTO Buy_Sell VALUES ( '0802' , '3' , '600', '2021/12/31', 'sell' , '78');




/* Table Transfer*/

INSERT into Transfer VALUES ('1' , '2', '2', '2.4', '0.01', '2021/11/29', '1');
INSERT into Transfer VALUES ('2' , '4', '2', '2.1', '0.05', '2021/11/28', '2');
INSERT into Transfer VALUES ('2' , '5', '5', '80', '0.01', '2021/11/24', '3');
INSERT into Transfer VALUES ('1' , '8', '1', '1.2', '0.01', '2022/01/24', '4');
INSERT into Transfer VALUES ('1' , '8', '3', '100', '0.02', '2022/01/24', '5');
INSERT into Transfer VALUES ('4' , '6', '4', '4', '0.015', '2021/12/24', '6');
INSERT into Transfer VALUES ('1' , '6', '4', '56', '0.1', '2021/12/26', '7');
INSERT into Transfer VALUES ('7' , '6', '4', '12', '0.02', '2021/12/30', '8');
INSERT into Transfer VALUES ('8' , '3', '3', '2', '0.04', '2021/10/24', '9');
INSERT into Transfer VALUES ('5' , '2', '2', '1.15', '0.02', '2021/10/30', '10');
INSERT into Transfer VALUES ('6' , '2', '1', '12.4', '0.01', '2021/11/24', '11');
INSERT into Transfer VALUES ('6' , '1', '1', '0.16', '0.01', '2021/10/29', '12');
INSERT into Transfer VALUES ('1' , '4', '3', '15', '0.02', '2021/11/12', '13');
INSERT into Transfer VALUES ('5' , '3', '2', '32', '0.03', '2021/11/04', '14');
INSERT into Transfer VALUES ('2' , '4', '4', '123', '0.04', '2022/01/04', '15');
INSERT into Transfer VALUES ('3' , '8', '5', '2.2', '0.05', '2021/01/14', '16');
INSERT into Transfer VALUES ('3' , '8', '1', '5.6', '0.11', '2021/11/10', '17');
INSERT into Transfer VALUES ('4' , '8', '3', '0.15', '0.02', '2021/11/11', '18');
INSERT into Transfer VALUES ('8' , '1', '2', '4', '0.2', '2021/12/18', '19');
INSERT into Transfer VALUES ('4' , '6', '3', '6', '0.03', '2021/11/01', '20');










/* Queries */

SELECT c.cyptoname, c.value, t.date, t.transaction_id
FROM Cryptos as c, Transfer as t
WHERE c.crypto_id = t.crypto_id AND t.date >= Convert(datetime, '2022-01-01')
ORDER by t.transaction_id


select name , buy_value
from Currency 
WHERE buy_value = ( 
                    select Max(buy_value)
                    from Currency)


select name , sell_value
from Currency 
WHERE sell_value = ( 
                    select Min(sell_value)
                    from Currency)


select cyptoname, value 
from Cryptos
where amountavailable < 500





select DISTINCT u.fname, u.email, u.phone_nr  
from Users as u, Buy_Sell as b, Cryptos as c, Wallet as w
WHERE u.user_id = w.user_id And w.wallet_id = b.wallet_id and b.crypto_id = c.crypto_id and b.action='buy'
and c.cyptoname = 'bitcoin'


select DISTINCT u.fname, u.role, u.phone_nr  
from Users as u, Currency as c, sell_transaction as s
WHERE u.user_id = s.user_id and s.currency_id = c.currency_id and c.name='GBP' and s.value < 50


select  u.fname, c.cyptoname 
from Users as u, Cryptos as c, Transfer as t
WHERE u.user_id = t.user_id and t.crypto_id = c.crypto_id and t.commission <0.03


select  cyptoname, value, amountavailable
from Cryptos
ORDER BY value DESC


select  c.cyptoname, t.amount, t.date
from Cryptos as c, Users as u, Transfer as t
where u.user_id = t.user_id and t.crypto_id= c.crypto_id and u.fname='Drilon'


select c.cyptoname, b.amount, b.date
from Buy_Sell as b, Cryptos as c 
WHERE c.crypto_id = b.crypto_id and b.action='sell' and b.amount>50

select * 
from Bank











/*Drop statements:

Drop Table sell_transaction;
Drop Table buy_transaction;
Drop Table Currency;
Drop Table Buy_Sell;
Drop Table Transfer;
Drop Table Bank;
Drop Table Cryptos;
Drop Table Wallet;
Drop Table Users;
*/ 

