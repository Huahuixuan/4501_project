CREATE TABLE zipcodes (
zipcode VARCHAR,
shape_area VARCHAR,
shape_len VARCHAR,
geometry geometry(POLYGON,4326),
);

CREATE TABLE complaints (
complaint_id VARCHAR,
complaint_created_date DATETIME,
complaint_type VARCHAR,
latitude FLOAT,
longitude FLOAT,
geometry geometry(POINT,4326),
zipcode VARCHAR,
);

CREATE TABLE trees (
id VARCHAR,
nta_name VARCHAR,
status VARCHAR,
health VARCHAR,
species VARCHAR,
geometry geometry(POINT,4326),
latitude FLOAT,
longitude FLOAT,
zipcode VARCHAR,
);

CREATE TABLE average_rent (
date DATE,
average_rent FLOAT,
zipcode VARCHAR,
);

