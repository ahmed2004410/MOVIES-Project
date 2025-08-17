
-- إنشاء قاعدة البيانات
CREATE DATABASE MoviePlatformDB;
GO

USE MoviePlatformDB;
GO

-- جدول المستخدمين
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    SignupDate DATE,
    Country NVARCHAR(50)
);

-- جدول التصنيفات (Categories)
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50)
);

-- جدول الأفلام
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200),
    ReleaseDate DATE,
    Duration INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- جدول المشاهدات
CREATE TABLE Views (
    ViewID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    MovieID INT,
    ViewDate DATETIME,
    WatchTime INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- جدول التقييمات
CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    MovieID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    RatingDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- جدول الاشتراكات
CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    StartDate DATE,
    EndDate DATE,
    PlanType NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


