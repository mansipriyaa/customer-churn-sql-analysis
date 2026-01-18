CREATE TABLE customers (
    customer_id TEXT,
    tenure INTEGER,
    monthly_charges REAL,
    total_charges REAL,
    churn TEXT
);

CREATE TABLE contracts (
    customer_id TEXT,
    contract TEXT,
    payment_method TEXT,
    paperless_billing TEXT
);
