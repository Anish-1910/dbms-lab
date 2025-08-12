
-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE,
    HeadOfDept VARCHAR(100)
);

-- Create Doctor Table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Patient Table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    DOB DATE,
    BloodGroup VARCHAR(3)
);

-- Create Treatment Table
CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(100) NOT NULL,
    Cost DECIMAL(10,2) CHECK (Cost > 0),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Appointment Table
CREATE TABLE Appointment (
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Slot VARCHAR(20),
    Status VARCHAR(20),
    PRIMARY KEY (PatientID, DoctorID, AppointmentDate),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Create Prescription Table
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    DateIssued DATE,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Create PatientTreatment Table
CREATE TABLE PatientTreatment (
    PatientID INT,
    TreatmentID INT,
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY (PatientID, TreatmentID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);

-- Insert into Department
INSERT INTO Department (DepartmentID, DeptName, HeadOfDept) VALUES (101, 'Cardiology', 'Doctor1');
INSERT INTO Department (DepartmentID, DeptName, HeadOfDept) VALUES (102, 'Neurology', 'Doctor2');
INSERT INTO Department (DepartmentID, DeptName, HeadOfDept) VALUES (103, 'Orthopedics', 'Doctor3');
INSERT INTO Department (DepartmentID, DeptName, HeadOfDept) VALUES (104, 'Pediatrics', 'Doctor4');
INSERT INTO Department (DepartmentID, DeptName, HeadOfDept) VALUES (105, 'Dermatology', 'Doctor5');
INSERT INTO Department (DepartmentID, DeptName, HeadOfDept) VALUES (106, 'Oncology', 'Doctor6');

-- Insert into Doctor
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (301, 'Ram', 'Heart', 'doctor1@hms.com', 101);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (302, 'Janu', 'Brain', 'doctor2@hms.com', 102);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (303, 'Raman', 'Bones', 'doctor3@hms.com', 103);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (304, 'Shenba', 'Children', 'doctor4@hms.com', 104);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (305, 'Laya', 'Skin', 'doctor5@hms.com', 105);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (306, 'Rakshan', 'Cancer', 'doctor6@hms.com', 106);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (307, 'Anish', 'Heart', 'doctor7@hms.com', 101);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (308, 'Pragadeesh', 'Brain', 'doctor8@hms.com', 102);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (309, 'Suman', 'Bones', 'doctor9@hms.com', 103);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (310, 'Himanshu', 'Children', 'doctor10@hms.com', 104);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (311, 'Pradeepan', 'Skin', 'doctor11@hms.com', 105);
INSERT INTO Doctor (DoctorID, Name, Specialization, Email, DepartmentID) VALUES (312, 'Alice', 'Cancer', 'doctor12@hms.com', 106);

-- Insert into Patient
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (501, 'Liam', 'M', TO_DATE('1995-04-12', 'YYYY-MM-DD'), 'A+');
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (502, 'Ava', 'F', TO_DATE('1998-11-25', 'YYYY-MM-DD'), 'B+');
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (503, 'Marcus', 'M', TO_DATE('1992-07-08', 'YYYY-MM-DD'), 'O+');
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (504, 'Noah', 'F', TO_DATE('1997-03-30', 'YYYY-MM-DD'), 'AB+');
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (505, 'Mia', 'M', TO_DATE('1994-12-15', 'YYYY-MM-DD'), 'A-');
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (506, 'Luca', 'F', TO_DATE('1996-01-10', 'YYYY-MM-DD'), 'B-');
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (507, 'Ivy', 'M', TO_DATE('1993-09-18', 'YYYY-MM-DD'), 'O-');
INSERT INTO Patient (PatientID, Name, Gender, DOB, BloodGroup) VALUES (508, 'Elaine', 'F', TO_DATE('1999-06-05', 'YYYY-MM-DD'), 'AB-');

-- Insert into Treatment
INSERT INTO Treatment (TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (801, 'Angioplasty', 15000.00, 101);
INSERT INTO Treatment (TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (802, 'EEG Scan', 7000.00, 102);
INSERT INTO Treatment (TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (803, 'Fracture Fixation', 12000.00, 103);
INSERT INTO Treatment (TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (804, 'Child Vaccination', 3000.00, 104);
INSERT INTO Treatment (TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (805, 'Skin Biopsy', 5000.00, 105);
INSERT INTO Treatment (TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (806, 'Chemotherapy', 20000.00, 106);

-- Insert into Appointment
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (501, 301, TO_DATE('2025-08-01', 'YYYY-MM-DD'), '9AM-10AM', 'Completed');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (502, 303, TO_DATE('2025-08-02', 'YYYY-MM-DD'), '10AM-11AM', 'Scheduled');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (503, 304, TO_DATE('2025-08-03', 'YYYY-MM-DD'), '11AM-12PM', 'Cancelled');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (504, 305, TO_DATE('2025-08-01', 'YYYY-MM-DD'), '12PM-1PM', 'Completed');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (505, 306, TO_DATE('2025-08-04', 'YYYY-MM-DD'), '9AM-10AM', 'Scheduled');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (506, 307, TO_DATE('2025-08-02', 'YYYY-MM-DD'), '10AM-11AM', 'Completed');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (507, 308, TO_DATE('2025-08-03', 'YYYY-MM-DD'), '11AM-12PM', 'Scheduled');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (508, 309, TO_DATE('2025-08-04', 'YYYY-MM-DD'), '12PM-1PM', 'Cancelled');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (501, 310, TO_DATE('2025-08-05', 'YYYY-MM-DD'), '9AM-10AM', 'Completed');
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Slot, Status) VALUES (502, 311, TO_DATE('2025-08-05', 'YYYY-MM-DD'), '10AM-11AM', 'Scheduled');

-- Insert into Prescription
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1001, 501, 301, TO_DATE('2025-08-01', 'YYYY-MM-DD'), 'Prescribed medication for chest pain. Follow up in 7 days.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1002, 502, 303, TO_DATE('2025-08-02', 'YYYY-MM-DD'), 'Advised rest and painkillers for mild concussion.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1003, 503, 304, TO_DATE('2025-08-03', 'YYYY-MM-DD'), 'Routine checkup. All vitals normal.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1004, 504, 305, TO_DATE('2025-08-03', 'YYYY-MM-DD'), 'Applied ointment for rash. Avoid allergens.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1005, 505, 306, TO_DATE('2025-08-04', 'YYYY-MM-DD'), 'Started first cycle of chemotherapy.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1006, 506, 307, TO_DATE('2025-08-04', 'YYYY-MM-DD'), 'Prescribed antibiotics for throat infection.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1007, 507, 308, TO_DATE('2025-08-05', 'YYYY-MM-DD'), 'Scheduled MRI for further evaluation.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1008, 508, 309, TO_DATE('2025-08-05', 'YYYY-MM-DD'), 'Suggested vitamin supplements and hydration.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1009, 501, 310, TO_DATE('2025-08-06', 'YYYY-MM-DD'), 'Referred to specialist for cardiac scan.');
INSERT INTO Prescription (PrescriptionID, PatientID, DoctorID, DateIssued, Notes) VALUES (1010, 502, 311, TO_DATE('2025-08-06', 'YYYY-MM-DD'), 'Prescribed allergy medication. Avoid exposure.');

-- Insert into PatientTreatment
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (501, 801, TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-10', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (502, 802, TO_DATE('2025-08-03', 'YYYY-MM-DD'), TO_DATE('2025-08-05', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (503, 803, TO_DATE('2025-08-02', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (504, 804, TO_DATE('2025-08-04', 'YYYY-MM-DD'), TO_DATE('2025-08-04', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (505, 805, TO_DATE('2025-08-05', 'YYYY-MM-DD'), TO_DATE('2025-08-08', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (506, 806, TO_DATE('2025-08-06', 'YYYY-MM-DD'), TO_DATE('2025-08-20', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (507, 801, TO_DATE('2025-08-07', 'YYYY-MM-DD'), TO_DATE('2025-08-14', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (508, 802, TO_DATE('2025-08-08', 'YYYY-MM-DD'), TO_DATE('2025-08-12', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (501, 803, TO_DATE('2025-08-10', 'YYYY-MM-DD'), TO_DATE('2025-08-25', 'YYYY-MM-DD'));
INSERT INTO PatientTreatment (PatientID, TreatmentID, StartDate, EndDate) VALUES (502, 804, TO_DATE('2025-08-11', 'YYYY-MM-DD'), TO_DATE('2025-08-11', 'YYYY-MM-DD'));
