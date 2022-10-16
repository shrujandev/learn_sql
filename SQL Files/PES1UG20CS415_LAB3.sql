
CREATE DATABASE RailwayTicket_415;

USE RailwayTicket_415;

create table train_415(
	Train_No int not null,
    Name varchar(255) not null,
    Train_Type varchar(255) not null,
    Source varchar(255),
    Destination varchar(255),
    Availability varchar(255) DEFAULT "1" ,

    PRIMARY KEY(Train_No)
    
);




create TABLE User_415(
	User_ID varchar(255) not null,
    User_Type varchar(255) not null,
    FName varchar(255) not null,
    LName varchar(255) not null,
    Age varchar(255),
    DOB date ,
    Pincode int not null,
    Street_Number varchar(255),
    
    PRIMARY KEY(User_ID)
    


);


create table phone_415(
	User_ID varchar(255),
    Phone varchar(255) not null,
    
    FOREIGN KEY(User_ID) REFERENCES User_415(User_ID)
);




create table compartment_415(
    Compartment_No varchar(255) not null,
    Compartment_Type varchar(255) not null,
    Capacity int not null,
    Availabilty int DEFAULT "50",
    Train_No int not null,

    PRIMARY KEY(Compartment_No,Train_No),
    FOREIGN KEY (Train_No) REFERENCES train_415(Train_No)
);

create table ticket_415(
	PNR varchar(255) not null,
    Train_No int not null,
    Travel_Date date not null,
    Departure varchar(255) not null,
    Arrival varchar(255) not null,
    Departure_Time time not null,
    Arrival_Time time not null,
    User_ID varchar(255),
    Train_Type varchar(255) not null,
    Compartment_Type varchar(255) not null,
    Compartment_No varchar(255) not null,
    PRIMARY KEY(PNR),
    FOREIGN KEY(User_ID) references User_415(User_ID),
    FOREIGN KEY(Train_No) REFERENCES train_415(Train_No),
    FOREIGN KEY(Compartment_No) REFERENCES compartment_415(Compartment_No)
    
);




CREATE TABLE passenger_415(
    Seat_No varchar(255) not null,
    Name varchar(255) not null,
    Age int not null,
	PNR varchar(255) not null,
    
    FOREIGN KEY(PNR) REFERENCES ticket_415(PNR)

); 


create table Payment_415(
	Transaction_No varchar(255) not null UNIQUE,
    Bank varchar(255),
    Card_No varchar(255) not null,
    Price int,
    PNR varchar(255) not null,
    
    PRIMARY KEY(Transaction_No),
    FOREIGN KEY(PNR) REFERENCES ticket_415(PNR)
);


CREATE TABLE route_415(
    From_STN_No int not null,
    To_STN_No int not null,
    From_STN varchar(225) not null,
    To_STN varchar(225) not null,
    Distance int not null,
	Train_No int not null,
    
    FOREIGN KEY(Train_No) REFERENCES train_415(Train_No)
);

create table user_train_415(
    User_ID varchar(255) not null,
    Train_ID int not null,
    DateTimeStamp varchar(255),

    FOREIGN KEY(User_ID) REFERENCES User_415(User_ID)
);

create table FareTable_415(
    Train_Type varchar(255),
    Compartment_Type varchar(255),
    FareperKM double not null
);


