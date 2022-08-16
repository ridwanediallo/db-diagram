CREATE TABLE patients (
  id            int generated always as identity,
  name          varchar(100),
  date_of_birth date,
  primary key(id)
);

CREATE TABLE medical_histories (
  id            int generated always as identity,
  admitted_at   timestamp,
  patient_id    int,
  status        varchar(100),
  primary key(id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE invoices (
  id                   int generated always as identity,
  total_amount         decimal,
  generated_at         timestamp,
  payed_at             timestamp,
  medical_history_id   int,
  primary key(id),
  foreign key (medical_history_id) references medical_histories(id)
);

CREATE TABLE treatments (
  id   int generated always as identity,
  type varchar(100),
  name varchar(100),
  primary key(id)
);

CREATE TABLE medical_histories_treatments (
  treatment_id       int,
  medical_history_id int,
  primary key (treatment_id, medical_history_id),
  foreign key (treatment_id) references treatments (id),
  foreign key (medical_history_id) references medical_histories (id)
);

CREATE TABLE invoice_items (
  id             int generated always as identity,
  unit_price     decimal,
  quantity       int,
  total_price    decimal,
  invoice_id     int,
  treatment_id   int,
  primary key(id),
  FOREIGN KEY (invoice_id) REFERENCES invoices (id),
  FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

