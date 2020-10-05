-- -----------------------------------------------------
-- Populate Patient Table
-- -----------------------------------------------------
INSERT INTO patient (patientId, firstName, lastName, dob, townOrCity, county, phoneNumber, email, picture, picture_path) VALUES
(11111, 'Franklin', 'Roosevelt', '1882-01-30', 'Hyde Park', 'New York', '0811111111', 'fdr@usa.com', load_file('c:/dentist/roosevelt.jpg'), '/roosevelt.jpg'),
(22222, 'Adolf', 'Hitler', '1889-04-20', 'Braunau am Inn', 'Upper Austria', '082222222', 'ah@germany.de', load_file('c:/dentist/hitler.jpg'), '/hitler.jpg'),
(33333, 'Winston', 'Churchill', '1874-11-30', 'Blenheim', 'Oxfordshire', '08333333', 'wc@uk.uk', load_file('c:/dentist/churchill.jpg'), '/churchill.jpg'),
(44444, 'Benito', 'Mussolini', '1883-07-29', 'Predappio', 'Emilia-Romagna', '0844444444', 'bm@it.it', load_file('c:/dentist/mussolini.jpg'), '/mussolini.jpg'),
(55555, 'Michinomiya', 'Hirohito', '1901-04-29', 'Tokyo', 'Tokyo', '0855555555', 'mh@jp.jp', load_file('c:/dentist/hirohito.jpg'), '/hirohito.jpg'),
(66666, 'Joseph', 'Stalin', '1878-12-18', 'Gori', 'Shida Kartli', '0866666', 'js@ussr.su', load_file('c:/dentist/stalin.jpg'), '/stalin.jpg');

-- -----------------------------------------------------
-- Populate Appointment Table
-- -----------------------------------------------------
INSERT INTO appointment (appointmentId, appointmentDate, appointmentTime, patientId) VALUES
(00001, '2020-01-01', '01:00:00', 11111),
(00002, '2020-02-02', '02:00:00', 22222),
(00003, '2020-03-03', '03:00:00', 33333),
(00004, '2020-04-04', '04:00:00', 44444),
(00005, '2020-05-05', '05:00:00', 55555),
(00006, '2020-06-06', '06:00:00', 66666);

update appointment set appointmentDate='2020-11-11' where appointmentDate='2020-04-04';

-- -----------------------------------------------------
-- Populate Payment Table
-- -----------------------------------------------------
INSERT INTO payment (paymentId, method, fee, paymentCode, hasPaid, patientId) VALUES
(00001, 'Online', 1111.11, null, false, 11111),
(00002, 'Cheque', 2222.22, AES_ENCRYPT('B2B2', 'password'), true,  22222),
(00003, 'Credit Card', 3333.33, null, false, 33333),
(00004, 'Cash', 4444.44, null, false, 44444),
(00005, 'Credit Card', 5555.55, AES_ENCRYPT('E5E5', 'password'), true, 55555),
(00006, 'Credit Card', 6666.66, null, false, 66666);

update payment set fee='1234.56' where fee='1111.11';
update payment set haspaid=true, fee=1116.66, paymentCode=AES_ENCRYPT('F6F6', 'password') where paymentId=00006;
delete from payment where hasPaid = true;

-- -----------------------------------------------------
-- Populate Bill Table
-- -----------------------------------------------------
INSERT INTO bill (billId, fee, patientId) VALUES
(00001, 1111.11, 11111),
(00002, 2222.22, 22222),
(00003, 3333.33, 33333),
(00004, 4444.44, 44444),
(00005, 5555.55, 55555),
(00006, 6666.66, 66666);

-- -----------------------------------------------------
-- Populate Specialist Table
-- -----------------------------------------------------
INSERT INTO specialist (specialistId, patientId) VALUES
(00001, 11111),
(00002, 22222),
(00003, 33333),
(00004, 44444),
(00005, 55555),
(00006, 66666);

-- -----------------------------------------------------
-- Populate Treatment Table
-- -----------------------------------------------------
INSERT INTO treatment (treatmentId, patientId) VALUES
(00001, 11111),
(00002, 22222),
(00003, 33333),
(00004, 44444),
(00005, 55555),
(00006, 66666);

select a.appointmentid, a.appointmentdate, a.appointmenttime, p.lastname, p.patientid from patient p inner join appointment a where a.patientid=p.patientid;

select pay.paymentid, pay.method, pay.haspaid, pay.paymentcode, p.patientid from patient p inner join payment pay where pay.patientid=p.patientid;

select s.specialistid, p.patientid, p.lastname from patient p inner join specialist s where s.patientid=p.patientid;

select b.billid, b.fee, p.patientid, p.lastname from patient p inner join bill b where b.patientid=p.patientid;

select t.treatmentid, p.patientid, p.lastname from patient p inner join treatment t where t.patientid=p.patientid;
