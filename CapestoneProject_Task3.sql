/*Create a database named "EventsManagement."*/
CREATE DATABASE EventsManagement;

/*Create tables for Events, Attendees, and Registrations.*/
CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name VARCHAR(100) NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Location VARCHAR(100),
    Event_Description TEXT
);

CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name VARCHAR(100) NOT NULL,
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(50)
);

CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INT REFERENCES Events(Event_Id),
    Attendee_Id INT REFERENCES Attendees(Attendee_Id),
    Registration_Date DATE NOT NULL,
    Registration_Amount DECIMAL(10, 2)
);

Select * From Events;
Select * From Attendees;
Select * From Registrations;

/*Insert some sample data for Events, Attendees, and Registrations tables with respective fields.*/

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Tech Conference 2024', '2024-08-15', 'New York', 'A conference on the latest in technology.'),
('Music Fest', '2024-09-10', 'Los Angeles', 'A festival featuring various music artists.'),
('Art Expo', '2024-10-05', 'San Francisco', 'An exhibition showcasing contemporary art.');

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
('John Doe', '123-456-7890', 'john.doe@example.com', 'New York'),
('Jane Smith', '987-654-3210', 'jane.smith@example.com', 'Los Angeles'),
('Alice Johnson', '555-666-7777', 'alice.johnson@example.com', 'San Francisco');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 1, '2024-07-01', 50.00),
(2, 2, '2024-07-02', 75.00),
(3, 3, '2024-07-03', 60.00);

Select * From Events;
Select * From Attendees;
Select * From Registrations;

/*Inserting a new event.*/

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Health & Wellness Seminar', '2024-11-20', 'Chicago', 'A seminar focused on health and wellness.');

/*Updating an event's information.*/
SELECT * FROM Events;

UPDATE Events
SET Event_Location = 'Japan',
Event_Date = '2024-09-12'
WHERE Event_Id = 2;

SELECT * FROM Events;

/*Deleting an event.*/
Delete From Registrations
Where Event_Id=2;
DELETE FROM Events
WHERE Event_Id =2;
SELECT * FROM Events;

/*Inserting a new attendee.*/
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
('Robert Brown', '444-555-6666', 'robert.brown@example.com', 'Miami');

Select * From Attendees;

/*Registering an attendee for an event*/
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 4, '2024-07-04', 55.00);

Select * From Registrations;

/*Develop queries to retrieve event information, generate attendee lists, and calculate event
attendance statistics.*/

/*Retrieve All Events*/
SELECT * FROM Events;

/*Generate Attendee List for a Specific Event*/
SELECT A.Attendee_Name, A.Attendee_Email, A.Attendee_Phone, A.Attendee_City
FROM Attendees A
JOIN Registrations R ON A.Attendee_Id = R.Attendee_Id
WHERE R.Event_Id = 1;

/*Calculate Event Attendance Statistics*/
SELECT E.Event_Name, COUNT(R.Registration_Id) AS Total_Attendees, SUM(R.Registration_Amount) AS Total_Amount
FROM Events E
JOIN Registrations R ON E.Event_Id = R.Event_Id
GROUP BY E.Event_Name;