
/*HOTEL MANAGEMENT SYSTEM*/

/* Removing the below tables from the system if there are any tables with the same names*/

Drop Table Userinfo CASCADE CONSTRAINTS;
Drop Table Booking CASCADE CONSTRAINTS;
Drop Table Invoice CASCADE CONSTRAINTS;
Drop Table Hotel CASCADE CONSTRAINTS;
Drop Table Rooms CASCADE CONSTRAINTS;
Drop Table RoomType CASCADE CONSTRAINTS;
Drop Table Reservation CASCADE CONSTRAINTS;
Drop Table RoomsReserved CASCADE CONSTRAINTS;
Drop Table ReservationStatus CASCADE CONSTRAINTS;
Drop Table Signup CASCADE CONSTRAINTS;
Drop Table Login CASCADE CONSTRAINTS;
Drop Table Cities CASCADE CONSTRAINTS;
Drop Table Payments CASCADE CONSTRAINTS;
Drop Table Service CASCADE CONSTRAINTS;


/*USER TABLES*/

CREATE TABLE Userinfo
  (User_ID                     INT            NOT NULL,
   SSN                         INT            NOT NULL,  
   User_Name                   CHAR(30),
   E_Mail                      VARCHAR(50),   
   First_Name                  CHAR(30),
   Last_Name                   CHAR(30),   
   Phone_Number                NUMBER(10), 
   CONSTRAINT Userinfo_PK PRIMARY KEY (User_ID));   
  
     
CREATE TABLE Invoice
  (Invoice_ID                  INT            NOT NULL,  
   User_ID                     INT            NOT NULL,
   Amount                      INT,   
   Dates                       DATE, 
   Invoice_details             VARCHAR(50),
   CONSTRAINT Invoice_PK PRIMARY KEY (Invoice_ID),
   CONSTRAINT Invoice_FK1 FOREIGN KEY (User_ID) REFERENCES Userinfo(User_ID));
   
/*HOTEL TABLES*/   
   
CREATE TABLE Hotel
  (Hotel_ID                    INT            NOT NULL,  
   Hotel_Name                  CHAR(50),
   Address                     CHAR(250),
   States                      VARCHAR(50),
   City                        VARCHAR(50),
   Ratings                     INT,
   Status                      VARCHAR(30),
   CONSTRAINT Hotel_PK PRIMARY KEY (Hotel_ID));

CREATE TABLE Rooms
  (Room_ID                   INT            NOT NULL,  
   Hotel_Id                  INT,
   Room_Suites               CHAR(30),
   Price                     Number,
   CONSTRAINT Rooms_PK PRIMARY KEY (Room_ID),
   CONSTRAINT Rooms_FK FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID));

CREATE TABLE RoomType
  (Type_ID                     INT            NOT NULL,  
   Room_ID                     INT            NOT NULL,
   Room_View                   CHAR(50),   
   CONSTRAINT RoomType_PK PRIMARY KEY (Type_ID),
   CONSTRAINT RoomType_FK1 FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID));

/*RESERVATION TABLES*/
   
CREATE TABLE Reservation
  (Reservation_ID                 INT            NOT NULL,  
   User_ID                        INT            NOT NULL,
   Hotel_ID                       INT            NOT NULL,
   StartDate                      DATE, 
   EndDate                        DATE,
   ReservationDate                DATE,
   PromoCode                      VARCHAR(10),
   FinalPrice                     Number,
   CONSTRAINT Reservation_PK PRIMARY KEY (Reservation_ID),
   CONSTRAINT Reservation_FK1 FOREIGN KEY (User_ID) REFERENCES Userinfo(User_ID),
   CONSTRAINT Reservation_FK2 FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID));  
   

CREATE TABLE RoomsReserved
  (Reservation_ID                 INT            NOT NULL,  
   Room_ID                        INT            NOT NULL,
   NoOf_Rooms                    INT            NOT NULL,
   CONSTRAINT RoomsReserved_PK PRIMARY KEY (Reservation_ID),
   CONSTRAINT RoomsReserved_FK1 FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID),
   CONSTRAINT RoomsReserved_FK2 FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)); 
   
CREATE TABLE ReservationStatus
  (Reservation_ID                 INT            NOT NULL,  
   Room_ID                        INT            NOT NULL,
   Status                         CHAR(10)       NOT NULL,
   CONSTRAINT ReservationStatus_PK PRIMARY KEY (Reservation_ID,Room_ID,Status),
   CONSTRAINT ReservationStatus_FK1 FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID),
   CONSTRAINT ReservationStatus_FK2 FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)); 
   
/*AUTHENTICATION TABLES*/   
   
CREATE TABLE SignUp
  (E_Mail                   VARCHAR(30)         NOT NULL,  
   Username                VARCHAR(20)            NOT NULL,
   FirstName               CHAR(20)            NOT NULL,
   LastName                CHAR(20)            NOT NULL,
   Passwords               VARCHAR(20)         NOT NULL,
   CONSTRAINT SignUp_PK PRIMARY KEY (Username)); 
      

CREATE TABLE Cities
  (City_ID                   INT                 NOT NULL,  
   Country                   CHAR(20)            NOT NULL,
   States                    CHAR(20)            NOT NULL,
   City                      CHAR(20)            NOT NULL,
   PostalCode                INT                 NOT NULL,
   CONSTRAINT Cities_PK PRIMARY KEY (City_ID));
   
   
CREATE TABLE Payments
  (Payment_ID                   INT            NOT NULL,  
   Invoice_ID                   INT            NOT NULL,
   CardType                     CHAR(20)       NOT NULL,
   CardNumber                   Number(16)     NOT NULL,
   Payment_Amount              INT            NOT NULL,
   PaymentDate                  DATE,
   CONSTRAINT Payments_PK PRIMARY KEY (Payment_ID),
   CONSTRAINT Payments_FK1 FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID)); 
  
CREATE TABLE Service
  (Service_ID                INT                 NOT NULL,  
   User_ID                   INT                 NOT NULL,
   Descriptions              VARCHAR(300)        NOT NULL,
   Dates                     DATE                NOT NULL,
   CONSTRAINT RoomService_PK PRIMARY KEY (Service_ID),
   CONSTRAINT RoomService_FK1 FOREIGN KEY (User_ID) REFERENCES Userinfo(User_ID));
   
CREATE TABLE Booking
  (Booking_ID                  INT            NOT NULL,
   Hotel_ID                    INT            NOT NULL,  
   User_ID                     INT            NOT NULL,
   Amount                      INT,   
   Dates                       DATE, 
 CONSTRAINT Booking_PK PRIMARY KEY (Booking_ID),
 CONSTRAINT Booking_FK1 FOREIGN KEY (User_ID) REFERENCES Userinfo(User_ID),
 CONSTRAINT Booking_FK2 FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID));
   
   
   /*USERINFO TABLE DATA*/
   
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1310,234523452, 'ScottSimpson','scottsimpson@gmail.com','Scott', 'Simpson', 3128847522);
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1311,456723456, 'BenjaminWells','benjaminwells@yahoo.com','Benjamin', 'Wells', 2346576633);
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1312,875644563, 'ThomasCarter','thomascarter@gmail.com','Thomas', 'Carter', 3125498765);
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1313,784562345, 'JonasDaniel','jonasdaniel@gmail.com','Jonas', 'Daniel', 3120987654);
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1314,876546453, 'MadeleineAnderson','madeleineanderson@gmail.com','Madeleine', 'Anderson', 3122356452);
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1315,845626546, 'AmyClark','amyclark@gmail.com','Amy', 'Clark', 2347547345);
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1316,457456735, 'MadilynnRowe','madilynnrowe@gmail.com','Madilynn', 'Rowe', 4574562365);
INSERT INTO Userinfo(User_ID,SSN,User_Name,E_Mail,First_Name,Last_Name,Phone_Number)   VALUES (1317,235764532, 'ElizabethGordon','elizabethgordon@gmail.com','Elizabeth', 'Gordon', 3127653445);


    /*INVOICE TABLE DATA*/

INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5000, 1310 , 100,'01-Jan-2022', '1 Night');
INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5001, 1311 , 200,'01-Feb-2022', '2 Night');
INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5002, 1312 , 300,'01-March-2022', '3 Night');
INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5003, 1313 , 400,'01-April-2022', '4 Night');
INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5004, 1314 , 500,'01-May-2022', '5 Night');
INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5005, 1315 , 600,'01-June-2022', '6 Night');
INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5006, 1316 , 700,'01-July-2022', '7 Night');
INSERT INTO Invoice(Invoice_ID,User_ID,Amount,Dates,Invoice_details) VALUES (5007, 1317 , 800,'01-August-2022', '8 Night');


    /*HOTEL TABLE DATA*/

INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0001, 'PolicyHotel1' , '456N trail' ,'Illinois','Chicago','5', 'Active');
INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0002, 'PolicyHotel2' , '156S bean' ,'Texas','Dallas','5', 'Active');
INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0003, 'PolicyHotel3' , '756E freedom' ,'Nevada','LasVegas','5', 'Active');
INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0004, 'PolicyHotel4' , '8456W queen' ,'Washington','seattle','5', 'Active');
INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0005, 'PolicyHotel5' , '563 longbeach' ,'Florida','Miami','5', 'Active');
INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0006, 'PolicyHotel6' , '556N Downtown' ,'California','LosAngeles','5', 'Active');
INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0007, 'PolicyHotel7' , '6436 Devon' ,'Ohio','Columbus','5', 'Active');
INSERT INTO Hotel(Hotel_ID,Hotel_Name,Address,States,City,Ratings,Status) VALUES (0008, 'PolicyHotel8' , '3000s king' ,'Arizona','Phoenix','5', 'Active');


    /*BOOKING TABLE DATA*/

INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4000,0001, 1310 , 100,'01-Jan-2022');
INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4001,0002, 1311 , 200,'01-Feb-2022');
INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4002,0003, 1312 , 300,'01-March-2022');
INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4003,0004, 1313 , 400,'01-April-2022');
INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4004,0005, 1314 , 500,'01-May-2022');
INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4005,0006, 1315 , 600,'01-June-2022');
INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4006,0007, 1316 , 700,'01-July-2022');
INSERT INTO Booking(Booking_ID,Hotel_ID,User_ID,Amount,Dates) VALUES (4007,0008, 1317 , 800,'01-August-2022');


    /*ROOMS TABLE DATA*/
                        
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6001,0001, 'Standard Suites', 100);
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6002,0002, 'Junior Suites', 200);
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6003,0003, 'Studio', 300);
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6004,0004, 'Normal', 400);
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6005,0005, 'Normal', 500);
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6006,0006, 'Deluxe', 600);
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6007,0007, 'Pent House', 700);
INSERT INTO Rooms(Room_ID,Hotel_Id,Room_Suites,Price) VALUES (6008,0008, 'Presidential Suite', 800);
  

  /*ROOMTYPE TABLE DATA*/
                        
INSERT INTO RoomType(Type_ID, Room_ID, Room_View) VALUES (7000 ,6008, 'Bay View');
INSERT INTO RoomType(Type_ID, Room_ID, Room_View) VALUES (7002 ,6008, 'City View');
INSERT INTO RoomType(Type_ID, Room_ID, Room_View) VALUES (7003 ,6008, 'Mountain View');
INSERT INTO RoomType(Type_ID, Room_ID, Room_View) VALUES (7004 ,6008, 'Lake View');


    /*RESERVATION TABLE DATA*/

INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8001 ,1310,0001, '01-Jan-2022','2-Jan-2022','01-Jan-2022',100);
INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8002 ,1311,0002, '01-Feb-2022','2-Feb-2022','01-Feb-2022',200);
INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8003 ,1312,0003, '01-March-2022','2-March-2022','01-March-2022',300);
INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8004 ,1313,0004, '01-April-2022','2-April-2022','01-April-2022',400);
INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8005 ,1314,0005, '01-May-2022','2-May-2022','01-May-2022',500);
INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8006 ,1315,0006, '01-June-2022','2-June-2022','01-June-2022',600);
INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8007 ,1316,0007, '01-July-2022','2-July-2022','01-July-2022',700);
INSERT INTO Reservation(Reservation_ID, User_ID,Hotel_ID,StartDate,EndDate,ReservationDate,FinalPrice) VALUES (8008 ,1317,0008, '01-August-2022','2-August-2022','01-August-2022',800);


 /*ROOMSRESERVED TABLE DATA*/

INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8001,6001,1);
INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8002,6002,1);
INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8003,6003,1);
INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8004,6004,1);
INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8005,6005,1);
INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8006,6006,1);
INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8007,6007,1);
INSERT INTO RoomsReserved(Reservation_ID, Room_ID, NoOf_Rooms) VALUES (8008,6008,1);

   
 /*RESERVATIONSTATUS TABLE DATA*/

INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8001,6001,'Active');
INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8002,6002,'Active');
INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8003,6003,'Active');
INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8004,6004,'Active');
INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8005,6005,'Active');
INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8006,6006,'Active');
INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8007,6007,'Active');
INSERT INTO ReservationStatus(Reservation_ID,Room_ID,Status) VALUES (8008,6008,'Active');


    /*SIGNUP TABLE DATA*/   
   
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('scottsimpson@gmail.com','ScottSimpson','Scott', 'Simpson', 123456789);  
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('benjaminwells@yahoo.com','BenjaminWells','Benjamin', 'Wells', 234567891);
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('thomascarter@gmail.com','ThomasCarter','Thomas', 'Carter', 345678912);
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('jonasdaniel@gmail.com','JonasDaniel','Jonas', 'Daniel', 456789123);  
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('madeleineanderson@gmail.com','MadeleineAnderson','Madeleine', 'Anderson', 567891234);
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('amyclark@gmail.com','AmyClark','Amy', 'Clark',678912345);
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('madilynnrowe@gmail.com','MadilynnRowe','Madilynn', 'Rowe', 789123456);  
INSERT INTO SignUp(E_Mail,Username,FirstName,LastName,Passwords) VALUES ('elizabethgordon@gmail.com','ElizabethGordon','Elizabeth', 'Gordon', 891234567);

    /*CITIES TABLE DATA*/ 
    
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9001,'USA','Illinois', 'Chicago', 60616);
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9002,'USA','California', 'LosAngeles', 23642);
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9003,'USA','Ohio', 'Columbus', 456342);
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9004,'USA','Nevada', 'LasVegas', 89123);
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9005,'USA','Texas', 'Dallas', 891237);
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9006,'USA','Washington', 'Seattle', 359123);
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9007,'USA','Arizona', 'Pheonix', 891235);
INSERT INTO Cities(City_ID,Country,States,City,PostalCode) VALUES (9008,'USA','Florida', 'Miami', 685647);


    /*PAYMENTS TABLE DATA*/

INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3001,5000,'CREDIT',1234876598763456  ,100, '1-Jan-2022');
INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3002,5001,'CREDIT',1876723546576956  ,200, '1-Feb-2022');
INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3003,5002,'CREDIT',7653521292451523  ,300, '1-March-2022');
INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3004,5003,'DEBIT' ,7683456234515612  ,400, '1-April-2022');
INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3005,5004,'CREDIT',8345143654658235  ,500, '1-May-2022');
INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3006,5005,'CREDIT',8354534573241343  ,600, '1-June-2022');
INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3007,5006,'CREDIT',1113462541234124  ,700, '1-July-2022');
INSERT INTO Payments(Payment_ID,Invoice_ID,CardType,CardNumber,Payment_Amount,PaymentDate) VALUES (3008,5007,'DEBIT' ,3546512345152467  ,800, '1-August-2022');


   /*SERVICE TABLE DATA*/

INSERT INTO Service(Service_ID,User_ID,Descriptions,Dates) VALUES ( 2001,1310, 'Cleaning','1-Jan-2022');
INSERT INTO Service(Service_ID,User_ID,Descriptions,Dates) VALUES ( 2002,1311, 'Dinner','1-Feb-2022');
INSERT INTO Service(Service_ID,User_ID,Descriptions,Dates) VALUES ( 2003,1312, 'Lunch','1-March-2022');
INSERT INTO Service(Service_ID,User_ID,Descriptions,Dates) VALUES ( 2004,1313, 'Breakfast','1-April-2022');
INSERT INTO Service(Service_ID,User_ID,Descriptions,Dates) VALUES ( 2005,1314, 'Cleaning','1-May-2022');
INSERT INTO Service(Service_ID,User_ID,Descriptions,Dates) VALUES ( 2006,1315, 'Dinner','1-June-2022');





SELECT * FROM Userinfo;
SELECT * FROM Invoice;
SELECT * FROM Hotel;
SELECT * FROM Booking;
SELECT * FROM Rooms;
SELECT * FROM RoomType;
SELECT * FROM Reservation;
SELECT * FROM RoomsReserved;
SELECT * FROM ReservationStatus;
SELECT * FROM SignUp;
SELECT * FROM Cities;
SELECT * FROM Payments;
SELECT * FROM Service;