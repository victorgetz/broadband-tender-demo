create sequence hibernate_sequence start with 1 increment by 1;
create table contact_person (id bigint not null, name varchar(255) not null, primary key (id));
create table local_authority_district (id bigint not null, district varchar(255), district_key varchar(255), government_district varchar(255), name varchar(255), type varchar(255), contact_person_id bigint, primary key (id));
create table pricing_detail (id bigint not null, pricing_detail_type varchar(255), primary key (id));
create table pricing_detail_pricing_items (pricing_detail_id bigint not null, pricing_items_id bigint not null);
create table pricing_item (id bigint not null, price decimal(19,2), pricing_item_type varchar(255), primary key (id));
create table pricing_master_data (id bigint not null, sum_value decimal(19,2), primary key (id));
create table pricing_master_data_pricing_details (pricing_master_data_id bigint not null, pricing_details_id bigint not null);
create table project (id bigint not null, local_authority_district_id bigint, pricing_master_data_id bigint, project_master_data_id bigint, primary key (id));
create table project_master_data (id bigint not null, development_area_name varchar(255), network_operator varchar(255), primary key (id));
alter table pricing_detail_pricing_items add constraint UK_3xtw6geuokewdb9xqatkym14s unique (pricing_items_id);
alter table pricing_master_data_pricing_details add constraint UK_f5blurhux6snwoc0a27hln5ap unique (pricing_details_id);
alter table local_authority_district add constraint FKm68yhu9o2ohbt9fseoej6fhlw foreign key (contact_person_id) references contact_person;
alter table pricing_detail_pricing_items add constraint FKnrs9iksm1h2rqdswxflujg8up foreign key (pricing_items_id) references pricing_item;
alter table pricing_detail_pricing_items add constraint FK8vr81d6mhx2r9eokm7he9q1bf foreign key (pricing_detail_id) references pricing_detail;
alter table pricing_master_data_pricing_details add constraint FKfbp0ooiatt6hoj7slndb4j5rj foreign key (pricing_details_id) references pricing_detail;
alter table pricing_master_data_pricing_details add constraint FK4crt4mlqs3sg8tskviib7i59v foreign key (pricing_master_data_id) references pricing_master_data;
alter table project add constraint FKgnh98aneiu9q4plijbtx76x3i foreign key (local_authority_district_id) references local_authority_district;
alter table project add constraint FK9exyyvs4rg9ga1rl2s9oblc84 foreign key (pricing_master_data_id) references pricing_master_data;
alter table project add constraint FKroo6mnht0w05g2ydnfl8s85gr foreign key (project_master_data_id) references project_master_data;