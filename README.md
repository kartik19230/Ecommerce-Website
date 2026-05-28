# E-Commerce Backend Application

## Overview

A backend-focused E-Commerce web application built using Java Servlet, JSP, Hibernate ORM, and PostgreSQL following the MVC architecture pattern.

The project focuses on mastering backend development concepts including authentication, session management, ORM relationships, pagination, validation architecture, and scalable query handling.

Frontend is intentionally lightweight to prioritize backend engineering concepts.

---

# Tech Stack

* Java
* Servlet
* JSP
* JSTL + EL
* Hibernate ORM (JPA)
* PostgreSQL
* Maven
* Apache Tomcat
* Git & GitHub
* BCrypt Password Hashing

---

# Features

## Authentication & Authorization

* User Registration
* Secure Login System
* BCrypt Password Hashing
* Session Management
* Logout Functionality
* Authentication Filter
* Protected Routes
* Cache Prevention After Logout

---

## Product Management

* Add Product
* Update Product
* Delete Product
* Product Listing
* Product Search
* Product Pagination
* Product Validation

---

## Category Module

* One-to-Many Relationship Mapping
* Many-to-One Relationship Mapping
* Category Assignment for Products
* Dynamic Category Dropdown

---

## Validation Layer

### User Validation

* Empty field checks
* Email format validation
* Password length validation
* Duplicate email prevention

### Product Validation

* Product name validation
* Description validation
* Positive price validation
* Non-negative stock validation
* Safe numeric parsing

---

## Pagination & Search

* Dynamic Pagination
* Search with Pagination
* Total Page Calculation
* Invalid Page Handling
* JPQL LIKE Queries
* Offset-based Pagination

---

# Architecture

```text
Browser
   ↓
Servlet Controller
   ↓
DAO Layer
   ↓
Hibernate ORM
   ↓
PostgreSQL
   ↓
Servlet
   ↓
JSP View (WEB-INF protected)
```

---

# Hibernate Concepts Practiced

* Entity Lifecycle
* Persistence Context
* Dirty Checking
* JPQL
* One-to-Many Mapping
* Many-to-One Mapping
* Foreign Keys
* Owning Side vs Inverse Side
* Transactions
* Rollback Handling
* Pagination using setFirstResult() and setMaxResults()

---

# Authentication Flow

```text
login.jsp
   ↓
LoginServlet
   ↓
UserDao.login()
   ↓
BCrypt.checkpw()
   ↓
Session Creation
   ↓
DashboardServlet
```

---

# Current Learning Focus

* Backend Architecture
* Hibernate Internals
* ORM Relationships
* Validation Design
* Request Lifecycle
* Defensive Programming
* Scalable Query Design
* Debugging & Troubleshooting

---

# Future Improvements

* Admin Role Authorization
* Product Details Page
* Hibernate Second-Level Cache
* Order Management
* Shopping Cart
* REST API Integration
* Spring Framework Migration

---

# Setup Instructions

## Clone Repository

```bash
git clone <https://github.com/kartik19230/Ecommerce-Website>
```

---

## Configure Database

Create PostgreSQL database and update:

```properties
persistence.xml
```

with your database credentials.

---

## Build Project

```bash
mvn clean install
```

---

## Deploy

Deploy generated WAR file to Apache Tomcat server.

---

# Git Workflow

Practiced:

* Feature branch workflow
* Rebase handling
* Push conflict resolution
* Git hygiene practices
* .gitignore management

---

# Author

Kartik Shinde

