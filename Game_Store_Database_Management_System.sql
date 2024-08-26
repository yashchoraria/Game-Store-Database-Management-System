Create Database Game_Store;

create table Game_Info(
    Store_Id varchar(20) Primary Key,
    Name varchar(20) not null,
    Platform_Id int not null,
    Price float not null,
    Age_Rating int not null,
    Release_Date date not null,
    MinSpec_Id varchar(20) not null Foreign Key references Specsheet(Spec_Id),
    RecSpec_Id varchar(20) not null Foreign Key references Specsheet(Spec_Id),
    Publisher_Id varchar(20) not null Foreign Key references Publisher(Publisher_Id),
    Developer_Id varchar(20) not null Foreign Key references Developer(Developer_Id),
);

create table Player_Info(
    Friend_Id varchar(20) Primary Key,
    Name varchar(20) not null,
    DOB date not null,
    PCSpec_Id varchar(20) not null Foreign Key references Specsheet(Spec_Id),
);

create table Developer(
    Developer_Id varchar(20) Primary Key,
    Name varchar(20) not null,
);

create table Publisher(
    Publisher_Id varchar(20) Primary Key,
    Name varchar(20) not null,
);

create table Specsheet(
    Spec_Id varchar(20) Primary Key,
    Graphics varchar(20) not null,
    Processor varchar(20) not null,
    SoundCard varchar(20) not null,
    WindowsVersion varchar(20) not null,
    RAM int not null,
);

create table Genres(
    Genre_Id varchar(20) not null,
    Genre_Name varchar(20) not null,
    Store_Id varchar(20) not null Foreign Key references Game_Info(Store_Id),
    CONSTRAINT Game_Genre Primary Key (Store_Id,Genre_Id)
);

create table Achievements(
    Achievement_Id varchar(20) Primary Key,
    Store_Id varchar(20) not null Foreign Key references Game_Info(Store_Id),
    CONSTRAINT Achievement Primary Key (Store_Id,Achievement_Id)
);

create table OwnerList(
    Store_Id varchar(20) not null Foreign Key references Game_Info(Store_Id),
    Friend_Id varchar(20) not null Foreign Key references Player_Info(Friend_Id),
    CONSTRAINT Owner Primary Key (Store_Id,Friend_Id)
);

create table FriendList(
    To_Id varchar(20) not null Foreign Key references Player_Info(Friend_Id),
    From_Id varchar(20) not null Foreign Key references Player_Info(Friend_Id),
    CONSTRAINT Friend Primary Key (To_Id,From_Id)
);
