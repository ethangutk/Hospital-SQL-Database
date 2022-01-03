----------------------------------------
-- Copyright Ethan Gutknecht (C) 2022 --
----------------------------------------


-- Creates the Person table
CREATE TABLE Person (
phoneNumber varchar(255),
email varchar(255),
person_ID int NOT NULL,
PRIMARY KEY (person_ID)
);


-- Creates the Address table
CREATE TABLE Address (
number int NOT NULL,
street varchar(255) NOT NULL,
state varchar(255) NOT NULL,
city varchar(255) NOT NULL,
persID int NOT NULL,
PRIMARY KEY (number, street, state, city),
FOREIGN KEY (persID) REFERENCES Person(person_ID)
);


-- Create the Shift table
CREATE TABLE Shift (
startTime varchar(255) NOT NULL,
endTime varchar(255) NOT NULL,
sdate Date NOT NULL,
PRIMARY KEY (startTime, endTime, sdate)
);


-- Create the Receptionist table
CREATE TABLE Receptionist (
receptionist_ID int NOT NULL,
person_ID int NOT NULL,
PRIMARY KEY (receptionist_ID),
FOREIGN KEY (person_ID) REFERENCES Person(person_ID)
);


-- Create the Doctor table
CREATE TABLE Doctor(
doctor_ID int NOT NULL,
person_ID int NOT NULL,
PRIMARY KEY (doctor_ID),
FOREIGN KEY (person_ID) REFERENCES Person(person_ID)
);


-- Create the TriageDoctor table
CREATE TABLE TriageDoctor(
tdoctor_ID int NOT NULL,
doctor_ID int NOT NULL,
PRIMARY KEY (tdoctor_ID),
FOREIGN KEY (doctor_ID) REFERENCES Doctor(doctor_ID)
);


-- Create the Nurse table
CREATE TABLE Nurse(
nurse_ID int NOT NULL,
person_ID int NOT NULL,
PRIMARY KEY (nurse_ID),
FOREIGN KEY (person_ID) REFERENCES Person(person_ID)
);


-- Create the Bed table
CREATE TABLE Bed(
bed_ID int NOT NULL,
nurse_ID int NOT NULL,
PRIMARY KEY (bed_ID),
FOREIGN KEY (nurse_ID) REFERENCES Nurse(nurse_ID)
);


-- Create the Patient table
CREATE TABLE Patient(
patient_ID int NOT NULL,
bed_ID int NOT NULL,
person_ID int NOT NULL,
outcomeOfVisit varchar(255),
PRIMARY KEY (patient_ID),
FOREIGN KEY (person_ID) REFERENCES Person(person_ID),
FOREIGN KEY (bed_ID) REFERENCES Bed(bed_ID)
);


-- Create the Medication table
CREATE TABLE Medication(
name varchar(255) NOT NULL,
PRIMARY KEY (name)
);


-- Create the Assigned table
CREATE TABLE Assigned(
person_ID int NOT NULL,
startTime varchar(255) NOT NULL,
endTime varchar(255) NOT NULL,
sdate Date NOT NULL,
PRIMARY KEY (person_ID, startTime, endTime, sdate),
FOREIGN KEY (startTime) REFERENCES Shift(startTime),
FOREIGN KEY (endTime) REFERENCES Shift(endTime),
FOREIGN KEY (sdate) REFERENCES Shift(sdate)
);


-- Create the Administered table
CREATE TABLE Administered(
medication_name varchar(255) NOT NULL,
nurse_ID int NOT NULL, 
timesPerDay int, 
dosage varchar(255), 
timeAdministered varchar(255),
PRIMARY KEY (medication_name),
FOREIGN KEY (nurse_ID) REFERENCES Nurse(nurse_ID),
FOREIGN KEY (medication_name) REFERENCES Medication(name)
);


-- Create the Admitted table
CREATE TABLE Admitted(
admit_date Date,
admit_time varchar(255),
discharge_date Date,
discharge_time varchar(255),
primaryDiagnosis varchar(255),
person_ID int NOT NULL,
receptionist_ID int NOT NULL,
startTime varchar(255) NOT NULL,
endTime varchar(255) NOT NULL,
date Date NOT NULL,
PRIMARY KEY (person_ID, receptionist_ID, startTime, endTime, date),
FOREIGN KEY (person_ID) REFERENCES Person(person_ID),
FOREIGN KEY (startTime) REFERENCES Shift(startTime),
FOREIGN KEY (endTime) REFERENCES Shift(endTime),
FOREIGN KEY (date) REFERENCES Shift(date),
FOREIGN KEY (receptionist_ID) REFERENCES Receptionist(receptionist_ID)
);


-- Create the Prescribed table
CREATE TABLE Prescribed(
doctor_ID int NOT NULL,
patient_ID int NOT NULL,
medication_name varchar(255) NOT NULL,
PRIMARY KEY (doctor_ID, patient_ID, medication_name),
FOREIGN KEY (doctor_ID) REFERENCES Doctor(doctor_ID),
FOREIGN KEY (patient_ID) REFERENCES Patient(patient_ID),
FOREIGN KEY (medication_name) REFERENCES Medication(name)
);
