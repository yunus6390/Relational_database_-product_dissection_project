-- Create User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    ProfilePicture VARCHAR(255),
    Resume VARCHAR(255)
);

-- Create Company table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Industry VARCHAR(255),
    Headquarters VARCHAR(255),
    Size VARCHAR(50),
    Description TEXT,
    Logo VARCHAR(255)
);

-- Create JobPosting table
CREATE TABLE JobPosting (
    JobID INT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    Requirements TEXT,
    Location VARCHAR(255),
    Salary DECIMAL(10, 2),
    CompanyID INT,
    PostedByUserID INT,
    PostedDate DATE,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
    FOREIGN KEY (PostedByUserID) REFERENCES User(UserID)
);

-- Create Application table
CREATE TABLE Application (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    UserID INT,
    ApplicationDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (JobID) REFERENCES JobPosting(JobID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create SavedJob table
CREATE TABLE SavedJob (
    SavedJobID INT PRIMARY KEY,
    JobID INT,
    UserID INT,
    SavedDate DATE,
    FOREIGN KEY (JobID) REFERENCES JobPosting(JobID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Skill table
CREATE TABLE Skill (
    SkillID INT PRIMARY KEY,
    SkillName VARCHAR(255)
);

-- Create UserSkill table (Many-to-Many Relationship between User and Skill)
CREATE TABLE UserSkill (
    UserID INT,
    SkillID INT,
    ProficiencyLevel INT,
    PRIMARY KEY (UserID, SkillID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);
