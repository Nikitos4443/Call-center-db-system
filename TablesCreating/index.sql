CREATE TABLE Mail
(
    id    SERIAL PRIMARY KEY,
    Topic VARCHAR(100),
    Text  VARCHAR(1000)
);

CREATE TABLE Clients
(
    id      SERIAL PRIMARY KEY,
    Name    VARCHAR(50),
    Surname VARCHAR(50),
    Email   VARCHAR(50) UNIQUE,
    Phone   VARCHAR(50) UNIQUE NOT NULL,
    Address VARCHAR(100)
);

CREATE TABLE Mail_Client
(
    id        SERIAL PRIMARY KEY,
    Client_id INT NOT NULL,
    Mail_id   INT NOT NULL,
    Date      DATE,
    FOREIGN KEY (Client_id) REFERENCES Clients (id) ON DELETE CASCADE,
    FOREIGN KEY (Mail_id) REFERENCES Mail (id) ON DELETE CASCADE
);

CREATE TABLE Operators
(
    id          SERIAL PRIMARY KEY,
    Name        VARCHAR(50),
    Surname     VARCHAR(50),
    Email       VARCHAR(50) UNIQUE,
    Hire_date   DATE DEFAULT CURRENT_DATE,
    Hourly_rate DECIMAL
);

CREATE TABLE Operator_Schedule
(
    id           SERIAL PRIMARY KEY,
    Operator_id  INT NOT NULL UNIQUE,
    Days_of_week VARCHAR,
    Shift_start  TIME,
    Shift_end    TIME,
    FOREIGN KEY (Operator_id) REFERENCES Operators (id) ON DELETE CASCADE,
    CHECK (Shift_start < Shift_end AND (Shift_end - Shift_start) <= INTERVAL '9 hours')
);

CREATE TABLE Operators_Phones
(
    id          SERIAL PRIMARY KEY,
    Operator_id INT UNIQUE,
    Phone       VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (Operator_id) REFERENCES Operators (id) ON DELETE SET NULL
);

CREATE TABLE Calls
(
    id             SERIAL PRIMARY KEY,
    Operator_id    INT,
    Client_id      INT,
    Date           DATE DEFAULT CURRENT_DATE,
    Duration       TIME,
    FOREIGN KEY (Operator_id) REFERENCES Operators (id) ON DELETE SET NULL,
    FOREIGN KEY (Client_id) REFERENCES Clients (id) ON DELETE SET NULL
);

CREATE TABLE Issue_Categories
(
    id   SERIAL PRIMARY KEY,
    Name VARCHAR(30)
);

CREATE TABLE Issue_Solutions
(
    id                SERIAL PRIMARY KEY,
    Issue_Category_Id INT NOT NULL,
    Solution          VARCHAR(1000),
    FOREIGN KEY (Issue_Category_Id) REFERENCES Issue_Categories (id) ON DELETE CASCADE
);

CREATE TABLE Issues
(
    id                SERIAL PRIMARY KEY,
    Issue_Category_Id INT,
    Description       VARCHAR(100),
    Status            VARCHAR(30),
    Call_id           INT,
    FOREIGN KEY (Issue_Category_Id) REFERENCES Issue_Categories (id) ON DELETE SET NULL,
    FOREIGN KEY (Call_id) REFERENCES Calls (id) ON DELETE SET NULL
);

CREATE TABLE Operators_Report
(
    id             SERIAL PRIMARY KEY,
    Operator_id    INT,
    Calls_duration INTERVAL,
    Total_salary   DECIMAL,
    Date           DATE,
    FOREIGN KEY (Operator_id) REFERENCES Operators (id) ON DELETE SET NULL
);


