# 🏥 Hospital SQL Database
## 🎓 About The Class
#### CSE385 - Database Systems
I took this during my junior year of college in the fall of 2021. This class explored all of the ideas that created a well-formed database. First, we dabbled and explored ideas in Database Management Systems and what makes one better than another. Next, we applied database architecture and modeling knowledge, creating entity relationship diagrams (ERD) as the first topics we learned. Following up on this topic, we practiced making relational models of our database from our ERD and making them in the highest normal form possible. These topics that I learned are in this final classes project, which was designing a database in a consultant-client scenario.


<br><br><br>
## ℹ About The Project
This final project’s design is to simulate a customer-consultant project. When I took CSE385, this project was two different sub-projects, but I combined it into one Github page to keep it concise. The hospital described how they stored data about their patients. The student’s job was to create an actual functioning database, but many requirements and tasks between the starting explanation and the final database. One of those requirements was to create an ERD and then make that ERD well-formed. Another necessity was to use Google Cloud Servies and SQL to host and create a database for us. Finally, the student had to maintain a log of our hours throughout this project, keeping it as up-to-date as possible. Overall, there should have been a final, well-formed database where, hypothetically, other software engineers could implement it into a company’s website.

<br><br><br>
## 📃 The Steps To This Project
### 🚑 Understanding How The "Hospital" Functions
One of the initial tasks of the project was to understand how this hypothetical hospital operates. We had to know how everything worked to store the essential data. To do this, this “hospital” gave us a description (listed below) of how they stored files of patients and more. As I read this repeatedly, I would write down objects they mentioned and their descriptions, sometimes highlighting stuff on the page in different colors. For example, green for action words, like “put away” or “prescribe,” blue for objects, like “medicine” and “patients,” and yellow for descriptions, like “dosage” or “hours.” Highlighting these things allowed me to have an excellent understanding of creating an entity-relationship diagram.

| General Description
| :---:
| The Mid-City Hospital has requested a new database design and implementation for their Emergency Room shift management system.  As the database designer tasked with creating the conceptual design, you should read the requirements prepared below and develop a baseline ER diagram, a well-formed ER diagram, and a list of assumptions/questions to discuss with the client.

<br>

| Basic Operations
| :---:
| The Mid-City Emergency Room (MC-ER) has three distinct types of workers: receptionists, nurses, and doctors. Any of the workers can in fact be a patient. Each person in the proposed system, whether a patient or a worker, has a last, a first, possibly a middle name, and one or more addresses. An address consists of a city, state, street, and number. Each person can have zero or more email addresses and zero or more telephone numbers. <br><br> The workers work in the MC-ER in shifts. A shift consists of start and end time (using 2400 as midnight and 1200 as noon; the minute before midnight is 2359, and the minute after is 0001.) The shifts do not overlap, but they are consecutive, i.e., there is a shift on at any given time and day. The database will cover some extended period of time. Each worker will thus be assigned to many shifts in that period. At least one or more receptionists are assigned to each shift, one or more nurses are assigned to each shift, and one or more doctors are assigned to each shift. One of the doctors assigned to a shift is the shift’s triage doctor.  <br><br> When a patient is admitted to the MC-ER, it happens during a particular shift. The patient is admitted by a particular receptionist and is seen by the triage doctor of the shift. The patient may be sent home, be prescribed some medication by the triage doctor and sent home, or maybe assigned to stay in the MC-ER. <br><br> If a patient stays in the MC-ER, a bed and a case doctor is assigned for the patient. Each bed is supervised by a nurse during a shift. The case doctor may prescribe a medication that is administered to the patient by a nurse in each shift during the patient’s stay. Each medication has a unique name, and for each patient, there may be a different dosage and a different number of times per day prescribed by the case doctor.  The time and the dosage administered to a patient by a nurse should be recorded.

<br><br>


### 🗺 Creating a Baseline Entity-Relationship Diagram (ERD)
An Entity-Relationship Diagram (ERD), also known as an Entity-Relationship model (ERM), is an efficient way to map a database visually. It allows us to see what is stored within a database and how each entity relates and interacts. It is a truly remarkable first step to creating an efficient database. We first created an ERD based on the description from the hospital, even if some of the stuff didn’t make sense. Below is the first baseline ERD that I made. It is much easier to make a draft of the ERD and refine it rather than refine it as you go.
<p align="center">
  <img src="https://github.com/ethangutknecht/Hospital-SQL-Database/blob/main/Project%20Files/Baseline_ERD.png?raw=true">
</p>
<br><br>


### ✨ Making the ERD Well-Formed
To make an ERD well-formed is almost like a puzzle. First, you have to look for things to fix and make sure the overall diagram makes sense. Next, I had to fix some of the redundancies, primary keys for objects, some objects needed to relate to other entities, and a few smaller items. Overall, this was my final well-formed ERD.
<p align="center">
  <img src="https://github.com/ethangutknecht/Hospital-SQL-Database/blob/main/Project%20Files/WellFormed_ERD.png?raw=true">
</p><br>
Along with making an ERD well-formed, you sometimes have to assume stuff relating to your ERD to make sense. In a real-world example, you would take these assumptions to the “Hospital” and make sure they are correct or fix them if they are not. Some of these assumptions include cardinality, weak entities, and relationships. Below are my assumptions for my well-formed ERD above. <br>

<h4 align="center">Well Formed ERD Assumptions</h4>
<table> 
<tbody> 
<tr><th align="center">Related To Primary Keys</th></tr> 
<tr><td>
<ul>
<li>The Address entity was given four attributes: number, street, state, and city. Since all of those are needed to make the key unique, they are all primary composite keys.</li>
<li>Medication was described as having a unique name, thus we made the name attribute a primary key for the medication entity.</li>
<li>A person was given a person_ID since no unique description of a person was given.</li>
<li>A nurse was given a nurse_ID since no unique description of a nurse was given.</li>
<li>A doctor was given a doctor_ID since no unique description of a doctor was given.</li>
<li>A receptionist was given a receptionist_ID since no unique description of a receptionist was given.</li>
<li>A patient was given a patient_ID since no unique description of a patient was given.</li>
<li>A triage doctor has a tdoctor_ID with an identifying relationship since it is a weak entity.</li>
<li>A bed was given a bed_Id since no unique identifier was described for a bed.</li>
<li>A shift’s start time, end time, and date is a composite primary key since shifts can’t overlap on a day.</li>
</ul>
</td></tr> 
</tbody>
</table>

<table> 
<tbody> 
<tr><th align="center">Cardinality/Participation Constraints For Relationships</th></tr> 
<tr><td>
<ul>
<li><b>hasA - n:1 (address:person)</b> - A person can have many or zero addresses. For an address to exist it must belong to a person, hence why we have total participation on the right.</li>
<li><b>assigned - n:n (person:shift)</b> - A person, if they are a doctor, nurse, or receptionist, will be assigned multiple shifts over a given schedule. A shift must have multiple workers for the hospital to function.</li>
<li><b>isA - 1:1 (person:nurse)</b> - A single nurse can be only a single person. A single person can be only a single nurse. For a nurse to exist, there must be total participation from the person entity.</li>
<li><b>isA - 1:1 (person:doctor)</b> - A single doctor can be only a single person. A single person can be only a single doctor. For a doctor to exist, there must be total participation from the person entity.</li>
<li><b>isA - 1:1 (person:patient)</b> - A single patient can be only a single person. A single person can be only a single patient. For a patient to exist, there must be total participation from the person entity.</li>
<li><b>isA - 1:1 (person:receptionist)</b> - A single receptionist can be only a single person. A single person can be only a single receptionist. For a receptionist to exist, there must be total participation from the person entity.</li>
<li><b>isA - 1:1 (doctor:triageDoctor)</b> - A single doctor can be only a single triage doctor. A single triage doctor can be only a single doctor. Total participation is on the left since a doctor needs to exist for a triage doctor to exist.</li>
<li><b>administered - n:n (medication:nurse)</b> - Many different nurses can administer a patient many different types of medication.</li>
<li><b>supervised - 1:n (nurse:bed)</b> - One nurse may supervise many different beds depending on how many nurses are on a shift.</li>
<li><b>assigned - 1:1 (bed:patient)</b> - One patient can only be given a single bed at a time. A single bed has an occupancy of one.</li>
<li><b>admitted (shift, person, receptionist)</b> - A person is admitted by a certain receptionist during a certain shift.</li>
<li><b>prescribed (doctor, medication, patient)</b> - A doctor prescribes medication to a patient.</li>
</ul>
</td></tr> 
</tbody>
</table>

<table> 
<tbody> 
<tr><th align="center">Miscellaneous</th></tr> 
<tr><td>
<ul>
<li>A triage doctor is a weak entity since it can’t exist unless a doctor exists.</li>
<li>The relationship admitted’s attributes: admit_date, admit_time, discharge_date, primaryDiagnosis, and discharge_time could all be different per person, shift, and receptionist. For example, if a single person was admitted twice on different days, the date would be different hence why it belongs to the relationship rather than an entity.</li>
<li>The relationship administered’s attributes timeAdministered, dosage, and timesPerDay belong to the relationship rather than an entity because these attributes can vary from patient to patient.</li>
</ul>
</td></tr> 
</tbody>
</table>

<br><br>


### 💽 Turning The ERD Into Relational Form
There is a simple formula to turn entity-relationship form into relational form. This step is needed to start creating a schema that a user can interact with. Or in other words, we are taking a diagram and turning it into something that can be imputed into a computer. We turn every entity to its own table in the schema most of the time. Here is a link to the full translation guide of transforming the ERD to a relational form. We got this relational form after applying the translation to our own well-formed ERD.<br>
<table> 
<tbody>
<tr><th align="center">Tables And Their Foreign Keys Within The “Hospital” Schema</th></tr> 
<tr><td>
	<b>Address(<u>number, street, state, city,</u> person_ID)</b><br>
<ul>
<li>person_ID is a FK to Person</li>
</ul>
</td></tr> 
<tr><td>
	<b>Person(phoneNumber, person_ID, email)</b><br>
</td></tr> 
<tr><td>
	<b>Shift(startTime, endTime, date)</b><br>
</td></tr> 
<tr><td>
	<b>Receptionist(receptionist_ID, person_ID)</b><br>
<ul>
<li>person_ID is a FK to Person</li>
</ul>
</td></tr> 
<tr><td>
	<b>Nurse(nurse_ID, person_ID)</b><br>
<ul>
<li>person_ID is a FK to Person</li>
</ul>
</td></tr>
<tr><td>
	<b>Patient(patient_ID, outcomeOfVisit, person_ID, bed_ID)</b><br>
<ul>
<li>person_ID is a FK to Person</li>
<li>bed_ID is a FK to Bed</li>
</ul>
</td></tr>
<tr><td>
	<b>Medication (name)</b><br>
</td></tr>
<tr><td>
	<b>Bed(bed_ID, nurse_ID)</b><br>
<ul>
<li>nurse_ID is a FK to Nurse</li>
</ul>
</td></tr>
<tr><td>
	<b>Doctor(doctor_ID, personID)</b><br>
<ul>
<li>person_ID is a FK to Person</li>
</ul>
</td></tr>
<tr><td>
	<b>TriageDoctor(tdoctor_ID, doctor_ID)</b><br>
<ul>
<li>doctor_ID is a FK to Doctor</li>
</ul>
</td></tr>
<tr><td>
	<b>Assigned(person_ID, startTime, endTime, date)</b><br>
<ul>
<li>person_ID is a FK to Person</li>
<li>startTime, endTime, date are FKs to Shift</li>
</ul>
</td></tr>
<tr><td>
	<b>Administered(medication_name, nurse_ID, timesPerDay, dosage, timeAdministered)</b><br>
<ul>
<li>nurse_ID is a FK to Nurse</li>
<li>medication_name is a FK to Medication</li>
</ul>
</td></tr>
<tr><td>
	<b>Admitted(admit_date, admit_time, discharge_date, discharge_time, primaryDiagnosis, person_ID, receptionist_ID, startTime, endTime, date)</b><br>
<ul>
<li>person_ID is a FK to person</li>
<li>startTime, endTime, date are FKs to Shift</li>
<li>receptionist_ID is a FK to Receptionist</li>
</ul>
</td></tr>
<tr><td>
	<b>Prescribed(doctor_ID, patient_ID, medication_name</b><br>
<ul>
<li>doctor_ID is a FK to Doctor</li>
<li>patient_ID is a FK to Patient</li>
<li>medication_name is a FK to Medication</li>
</ul>
</td></tr>
</tbody>
</table>
<br><br>


### ☁ Using Google Cloud Platform and Creating SQL Statements
Unfortunately, I do not have access to the original Google Cloud Platform account with which I used to implement this database. Furthermore, I am writing this after I took the class, and thus the premium features expired. Nevertheless, I have the SQL queries used within google to create the tables in the schema. If you have a service provider that allows you to host databases using SQL, you can input the SQL queries below for yourself. I know AWS and google are great providers, but Microsoft and Meta have services that will do the job.

<p align="center">
  <img src="https://github.com/ethangutknecht/Hospital-SQL-Database/blob/main/Project%20Files/GoogleCloudScreenshot.png?raw=true">
</p><br>



<br><br><br><br>


- - - -

<br>

<p align="center">
  ... 🗄 Get rid of those filing cabinets because we’re going digital 🖥 ...
</p>

<br>

- - - -


<br><br><br><br>

## 💽 The Final Database (SQL Queries)

```sql
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


-- Create the Prescribed table
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

CREATE TABLE Prescribed(
doctor_ID int NOT NULL,
patient_ID int NOT NULL,
medication_name varchar(255) NOT NULL,
PRIMARY KEY (doctor_ID, patient_ID, medication_name),
FOREIGN KEY (doctor_ID) REFERENCES Doctor(doctor_ID),
FOREIGN KEY (patient_ID) REFERENCES Patient(patient_ID),
FOREIGN KEY (medication_name) REFERENCES Medication(name)
);


```

<br><br><br>

## ✏ What I Would've Done Differently
I added this section because I thought it was important. When we did this project, it was before we learned about how to store data extremely efficiently. For example, much of my data has redundancies. If you look at the admitted table, I store the entire shift table over and over because the date, start time, and end time is the entire primary key. If I would’ve made a “shift_ID” attribute for the Shift table, it would’ve avoided using all of that excess data.<br><br>

If I were to do this project over with the knowledge I have now, I would get the tables into the highest normal form. I would remove excess data that is stored across tables. Furthermore, I would check for insertion and deletion anomalies among my tables. There is so much more that I could do to this schema to make it more efficient with the knowledge I have now, but since this project was so early in the semester, I couldn’t do so, unfortunately.


<br><br><br>

- - - -

<p align="center">
  Copyright © Ethan Gutknecht 2021
</p>
