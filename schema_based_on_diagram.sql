CREATE TABLE "patients" (
  "id"      int,
  "name"    varchat(100),
  "date_of_birth" date
);

CREATE TABLE "invoices" (
  "id"                   int,
  "total_amont"          decimal,
  "generated_at"         timestamp,
  "paid_at"              timestamp,
  "medicall_history_id"  int
);

CREATE TABLE "medicale_histories" (
  "id"            int,
  "admitted_at "  timestamp,
  "patient_id "   int,
  "status" varchat(100),
  CONSTRAINT "FK_medicale_histories.patient_id"
    FOREIGN KEY ("patient_id")
      REFERENCES "patients"("id")
);

CREATE TABLE "treatments" (
  "id"   int,
  "type" varchat(100),
  "name" varchat(100)
);

CREATE TABLE "invoice_items" (
  "id"             int,
  "unit_price"     decimal,
  "quantity "      int,
  "total_price "   decimal,
  "invoice_id  "   int,
  "treatment_id "  int,
  CONSTRAINT "FK_invoice_items.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoices"("id"),
  CONSTRAINT "FK_invoice_items.treatment_id"
    FOREIGN KEY ("treatment_id")
      REFERENCES "treatments"("id")
);

