//    https://dbdiagram.io

Table users {
user_id serial [pk]
person_id integer [ref: > person.id]
username varchar(25) [unique, not null]
password varchar(255) [not null]
created_at date [default: `GETDATE()`]
updated_at date [default: `GETDATE()`]
}

Table person {
  id serial [pk]
  first_name varchar(25) [not null]
  last_name varchar(25) [not null]
  email varchar(50) [unique, not null]
  phone varchar(20)
  address_line varchar(100)
  city varchar(50)
  created_at date [default: `GETDATE()`]
  updated_at date [default: `GETDATE()`]
}


Table employee {
  id serial [pk]
  person_id integer [ref: > person.id, unique, not null] 
  employee_number varchar(20) [unique]
  hire_date date [not null]
}

Table owner {
  id serial [pk]
  employee_id integer [ref: > employee.id, unique, not null]
}

Table hr_employee {
  id serial [pk]
  employee_id integer [ref: > employee.id, unique, not null]
}

Table accounting_employee {
  id serial [pk]
  employee_id integer [ref: > employee.id, unique, not null]
}



Table warehouse_employee {
  id serial [pk]
  employee_id integer [ref: > employee.id, unique, not null]
}

Table logistics_employee {
  id serial [pk]
  employee_id integer [ref: > employee.id, unique, not null]
}


Table category {
  id serial [pk]
  name varchar(50) [not null]
  description text
}

Table item {
  id serial [pk]
  sku varchar(25) [unique, not null]
  category_id integer [ref: > category.id, not null]
  name varchar(100) [not null]
  description text
  weight decimal(10,2)
  weight_unit varchar(5) [default: 'kg']
  dimensions varchar(20)
  color varchar(20)
  min_stock_level integer
  max_stock_level integer
  created_at timestamp [default: "CURRENT_TIMESTAMP"]
  updated_at timestamp [default: "CURRENT_TIMESTAMP"]
}

Table warehouse {
  id serial [pk]
  name varchar(50) [not null]
  type varchar(20)
  address text
}

Table location {
  id serial [pk]
  warehouse_id integer [ref: > warehouse.id, not null]
  name varchar(50)
}

Table inventory {
  id serial [pk]
  item_id integer [ref: > item.id, not null]
  location_id integer [ref: > location.id, not null]
  quantity integer [not null, default: 0]
}

Table supplier {
  id serial [pk]
  name varchar(100) [not null]
  contact_person varchar(50)
  email varchar(50)
  phone varchar(20)
  address text
  tax_id varchar(20)
  payment_terms integer [default: 30] // days
}

Table client {
  id serial [pk]
  name varchar(100) [not null]
  contact_person varchar(50)
  email varchar(50)
  phone varchar(20)
  mobile varchar(20)
  billing_address text
  shipping_address text
  payment_terms integer [default: 30] // days
}

Table purchase_order {
  id serial [pk]
  po_number varchar(20) [unique, not null]
  supplier_id integer [ref: > supplier.id, not null]
  order_date date [not null, default: "CURRENT_TIMESTAMP"]
  expected_delivery_date date
  status varchar(20) [not null, default: 'draft'] // draft, approved, sent, received, cancelled
  payment_terms varchar(50)
  shipping_method varchar(50)
  notes text
  created_by integer [ref: > employee.id, not null]
  approved_by integer [ref: > employee.id]
  created_at timestamp [default: "CURRENT_TIMESTAMP"]
  updated_at timestamp [default: "CURRENT_TIMESTAMP"]
}



Table invoice {
  id serial [pk]
  invoice_number varchar(20) [unique, not null]
  po_id integer [ref: > purchase_order.id]
  supplier_id integer [ref: > supplier.id, not null]
  invoice_date date [not null]
  due_date date [not null]
  status varchar(20) [not null, default: 'pending'] // pending, paid, overdue, cancelled
  total_amount decimal(12,2) [not null]
  tax_amount decimal(12,2) [default: 0]
  discount_amount decimal(12,2) [default: 0]
  notes text
  created_at timestamp [default: "CURRENT_TIMESTAMP"]
  updated_at timestamp [default: "CURRENT_TIMESTAMP"]
}
