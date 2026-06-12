# 🛒 JavaCart — E-Commerce Web Application (Version 1.0)

A backend-focused e-commerce platform built with **Java**, **Hibernate (JPA)**, **Servlets**, **JSP**, and **PostgreSQL**.

This project demonstrates enterprise-grade backend development concepts including ORM, MVC architecture, authentication, authorization, session management, shopping cart functionality, order processing, and role-based access control (RBAC).

---

# 📋 Table of Contents

* Tech Stack
* Features
* Authentication & Authorization Flow
* Project Structure
* Database Schema
* Application Workflow
* Hibernate Concepts Implemented
* Setup & Installation
* Future Enhancements
* Learning Outcomes

---

# 🛠️ Tech Stack

| Layer           | Technology                      |
| --------------- | ------------------------------- |
| Language        | Java 17+                        |
| ORM             | Hibernate 6.x (JPA)             |
| Web Layer       | Java Servlets + JSP             |
| View Technology | JSTL & Expression Language (EL) |
| Database        | PostgreSQL                      |
| Build Tool      | Maven                           |
| Server          | Apache Tomcat 10                |
| Security        | BCrypt Password Hashing         |
| Version Control | Git & GitHub                    |

---

# ✨ Features

## 🔐 Authentication Module

* User registration with server-side validation
* Secure login using BCrypt password hashing
* Session-based authentication
* Logout with session invalidation
* Form validation and error handling

---

## 🔑 Role-Based Authorization (RBAC)

* ADMIN and CUSTOMER roles
* Role-based login redirection
* Servlet Filter-based route protection
* Admin-only access to product and category management
* Customer-only access to cart, checkout and order history
* Access denied page for unauthorized access attempts
* Role-aware UI rendering using JSTL

---

## 📂 Category Management

* Add categories
* View categories
* Category validation
* Product-category association

---

## 📦 Product Management

* Add products
* Edit products
* Delete products
* View product details
* Product search by keyword
* Server-side pagination
* Category association
* Product validation

---

## 🛒 Shopping Cart

* Add products to cart
* Increase quantity
* Decrease quantity
* Remove products
* Dynamic total calculation
* Session-based cart persistence

---

## 📑 Order Management

### Checkout

* Converts active cart into a persisted order
* Creates OrderItems automatically
* Hibernate cascading persistence
* Clears cart after successful checkout

### Order History

* Displays all orders of the logged-in user
* Shows status, payment status and order amount
* Sorted by purchase date

### Order Details

* Product-level breakdown
* Quantity purchased
* Purchase-time pricing
* Item subtotals
* Grand total calculation
* Order ownership validation

---

## 🛡️ Security

* BCrypt password hashing
* Session-based authentication
* Servlet Filter route protection
* Role-based authorization (RBAC)
* Order ownership validation
* Access denied handling
* Server-side validation

---

# 🔐 Authentication & Authorization Flow

```text
Guest
│
├── Register
├── Login
│
▼
Authenticated User
│
├── ADMIN
│   ├── Home
│   ├── Add Product
│   ├── Edit Product
│   ├── Delete Product
│   └── Category Management
│
└── CUSTOMER
    ├── Dashboard
    ├── Product Details
    ├── Cart
    ├── Checkout
    ├── Orders
    └── Order Details
```

---

# 📁 Project Structure

```text
src/main/java/
│
├── controller/
│   ├── LoginServlet.java
│   ├── RegisterServlet.java
│   ├── DashboardServlet.java
│   ├── HomeServlet.java
│   ├── AddCategoryServlet.java
│   ├── AddProductServlet.java
│   ├── EditProductServlet.java
│   ├── UpdateProductServlet.java
│   ├── DeleteProductServlet.java
│   ├── CartServlet.java
│   ├── CheckoutServlet.java
│   ├── OrdersServlet.java
│   └── OrderDetailsServlet.java
│
├── dao/
│   ├── UserDao.java
│   ├── CategoryDao.java
│   ├── ProductDao.java
│   └── OrderDao.java
│
├── filter/
│   ├── AuthFilter.java
│   ├── AdminFilter.java
│   └── CustomerFilter.java
│
├── model/
│   ├── Users.java
│   ├── Role.java
│   ├── Category.java
│   ├── Product.java
│   ├── ShoppingCart.java
│   ├── CartItem.java
│   ├── Order.java
│   ├── OrderItem.java
│   ├── OrderStatus.java
│   └── PaymentStatus.java
│
└── util/
    └── HibernateUtil.java
```

---

# 🗄️ Database Schema

## Entity Relationships

```text
Users
 │
 │ 1 : N
 ▼
Orders
 │
 │ 1 : N
 ▼
OrderItems
 │
 │ N : 1
 ▼
Products

Category
 │
 │ 1 : N
 ▼
Products
```

## Key Constraints

* Users can place multiple orders
* Orders can contain multiple OrderItems
* Each OrderItem references a Product
* Product belongs to a Category
* Order ownership validation enforced
* Purchase-time price stored in OrderItem

---

# 🔄 Application Workflow

```text
Register / Login
        │
        ▼
Browse Products
        │
        ▼
View Product Details
        │
        ▼
Add To Cart
        │
        ▼
Manage Cart
        │
        ▼
Checkout
        │
        ├── Create Order
        ├── Create OrderItems
        └── Clear Cart
        │
        ▼
Order History
        │
        ▼
Order Details
```

---

# 🧩 Hibernate Concepts Implemented

| Concept                  | Usage                            |
| ------------------------ | -------------------------------- |
| @OneToMany               | User → Orders                    |
| @OneToMany               | Order → OrderItems               |
| @ManyToOne               | Product → Category               |
| @ManyToOne               | OrderItem → Product              |
| @ManyToOne               | OrderItem → Order                |
| CascadeType.ALL          | Order → OrderItems               |
| FetchType.LAZY           | Collection loading               |
| JPQL Queries             | Search and order retrieval       |
| Transaction Management   | Begin / Commit / Rollback        |
| SessionFactory Singleton | HibernateUtil                    |
| Enum Mapping             | Role, OrderStatus, PaymentStatus |

---

# ⚙️ Setup & Installation

## Prerequisites

* Java 17+
* PostgreSQL 14+
* Apache Tomcat 10
* Maven 3.8+

## Clone Repository

```bash
git clone https://github.com/kartik19230/JavaCart.git
cd JavaCart
```

## Configure Database

Update:

```text
src/main/resources/hibernate.cfg.xml
```

with your PostgreSQL credentials.

## Build Project

```bash
mvn clean package
```

## Deploy

Copy generated WAR file into Tomcat webapps directory.

Start Tomcat:

```bash
startup.bat
```

or

```bash
startup.sh
```

## Run Application

```text
http://localhost:8080/JavaCart
```

---

# 🚀 Future Enhancements

* Admin Order Management
* Order Status Tracking
* Customer Profile Management
* Product Image Upload
* Email Verification
* Wishlist Functionality
* Payment Gateway Integration
* Spring Boot Migration
* REST API Version

---

# 📚 Learning Outcomes

This project provided hands-on experience with:

* Core Java
* Object-Oriented Programming
* Collections Framework
* Servlets & JSP
* MVC Architecture
* Hibernate ORM
* PostgreSQL
* Session Management
* Authentication
* Authorization
* Role-Based Access Control (RBAC)
* Servlet Filters
* BCrypt Password Hashing
* Search & Pagination
* Shopping Cart Design
* Order Processing Systems
* DAO Pattern
* Singleton Pattern
* Database Design
* Git & GitHub Workflow

---

# 👨‍💻 Author

**Kartik Shinde**

Backend-Focused Java Developer

GitHub:
https://github.com/kartik19230

---

⭐ Version 1.0 Release — Completed as a backend-focused Java E-Commerce application before transitioning to Spring Framework and Spring Boot development.
