
/*HOTEL MANAGEMENT SYSTEM*/

/*
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
Drop Table Login;
Drop Table Cities;
Drop Table Payment;
Drop Table Service;
*/

/*USER TABLES*/

CREATE TABLE Userinfo
  (User_ID                     INT            NOT NULL,
   SSN                         INT            NOT NULL,  
   User_Name                   CHAR(30),
   E_Mail                      VARCHAR(20),   
   First_Name                  CHAR(30),
   Last_Name                   CHAR(30),   
   Phone_Number                NUMBER(10,0), 
   CONSTRAINT Userinfo_PK PRIMARY KEY (User_ID));   
   
CREATE TABLE Booking
  (Booking_ID                  INT            NOT NULL,
   Hotel_ID                    INT            NOT NULL,  
   User_ID                     INT            NOT NULL,
   Amount                      INT,   
   Dates                       DATE, 
 CONSTRAINT Booking_PK PRIMARY KEY (Booking_ID),
 CONSTRAINT Booking_FK1 FOREIGN KEY (User_ID) REFERENCES Userinfo(User_ID),
 CONSTRAINT Booking_FK2 FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID));
   
     
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
  (Email                   VARCHAR(30)         NOT NULL,  
   Username                VARCHAR(20)            NOT NULL,
   FirstName               CHAR(20)            NOT NULL,
   LastName                CHAR(20)            NOT NULL,
   Passwords               VARCHAR(20)         NOT NULL,
   CONSTRAINT SignUp_PK PRIMARY KEY (Username)); 
   
CREATE TABLE LogIn
  (Username                   VARCHAR(30)         NOT NULL,  
   Passwords                  CHAR(20)            NOT NULL,
   CONSTRAINT LogIn_PK PRIMARY KEY (Username),
   CONSTRAINT LogIn_FK FOREIGN KEY (Username) REFERENCES SignUp(Username));
   

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