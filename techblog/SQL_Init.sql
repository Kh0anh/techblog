-- Create Author Table
CREATE TABLE dbo.Author (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100),
    Role TINYINT NOT NULL,
    CreatedAt DATETIME NOT NULL
);

-- Create Entry Table
CREATE TABLE dbo.Entry (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AuthorID INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Slug NVARCHAR(200) NOT NULL UNIQUE,
    Content NVARCHAR(MAX) NOT NULL,
    Type TINYINT NOT NULL,
    Status TINYINT NOT NULL,
    CommentStatus BIT NOT NULL,
    UpdatedAt DATETIME NOT NULL,
    CreatedAt DATETIME NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES dbo.Author(ID) ON DELETE CASCADE
);

-- Create Category Table
CREATE TABLE dbo.Category (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ParentID INT,
    Name NVARCHAR(200) NOT NULL,
    Slug NVARCHAR(200) NOT NULL UNIQUE,
    CreatedAt DATETIME NOT NULL,
    FOREIGN KEY (ParentID) REFERENCES dbo.Category(ID)
);

-- Create Option Table
CREATE TABLE dbo.[Option] (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) UNIQUE,
    Value NVARCHAR(MAX),
    CreatedAt DATETIME NOT NULL
);

-- Create CategoryEntry Table (Junction Table)
CREATE TABLE dbo.CategoryEntry (
    EntryID INT NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (EntryID, CategoryID),
    FOREIGN KEY (EntryID) REFERENCES dbo.Entry(ID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES dbo.Category(ID) ON DELETE CASCADE
);

-- Create Indexes
CREATE INDEX IX_Entry_AuthorID ON dbo.Entry (AuthorID);
CREATE INDEX IX_Category_ParentID ON dbo.Category (ParentID);
CREATE INDEX IX_CategoryEntry_EntryID ON dbo.CategoryEntry (EntryID);
CREATE INDEX IX_CategoryEntry_CategoryID ON dbo.CategoryEntry (CategoryID);
