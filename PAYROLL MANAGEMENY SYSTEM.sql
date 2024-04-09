CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Position VARCHAR(50),
    DateOfBirth DATE,
    HireDate DATE
);

CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL(10,2),
    HoursWorked DECIMAL(5,2),
    PayDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-----inserting employee data

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Position, DateOfBirth, HireDate)
VALUES (1, 'John', 'Doe', 'IT', 'Software Engineer', '1990-05-15', '2015-01-01');

------------inserting payroll data

INSERT INTO Payroll (PayrollID, EmployeeID, Salary, HoursWorked, PayDate)
VALUES (1, 1, 5000.00, 160, '2024-03-07');

-------calculating total salary of an employee

SELECT SUM(Salary) AS TotalSalary
FROM Payroll
WHERE EmployeeID = 1;

----updating employee information

UPDATE Employees
SET Department = 'HR'
WHERE EmployeeID = 1;

----------Generating Payroll Report for a Specific Month

SELECT e.FirstName, e.LastName, p.Salary, p.HoursWorked, p.PayDate
FROM Employees e
INNER JOIN Payroll p ON e.EmployeeID = p.EmployeeID
WHERE MONTH(p.PayDate) = 3 AND YEAR(p.PayDate) = 2024;

----------Deleting Employee Record

DELETE FROM Employees
WHERE EmployeeID = 1;


