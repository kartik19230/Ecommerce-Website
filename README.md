# 🛒 JavaCart — E-Commerce Web Application

A backend-focused e-commerce platform built with **Java**, **Hibernate (JPA)**, **Servlets**, **JSP**, and **PostgreSQL**. This project demonstrates enterprise-grade backend development patterns including ORM, MVC architecture, session management, authentication, and role-based access control.

---

## 📋 Table of Contents

- [Tech Stack](#tech-stack)
- [Features](#features)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Application Workflow](#application-workflow)
- [Hibernate Concepts](#hibernate-concepts)
- [Setup & Installation](#setup--installation)
- [Upcoming Features](#upcoming-features)
- [Learning Outcomes](#learning-outcomes)

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Java 17+ |
| ORM | Hibernate 6.x (JPA) |
| Web Layer | Java Servlets + JSP |
| Templating | JSTL & Expression Language (EL) |
| Database | PostgreSQL |
| Build Tool | Maven |
| Server | Apache Tomcat 10 |
| Version Control | Git & GitHub |

---

## ✨ Features

### 🔐 Authentication Module
- User registration with server-side form validation
- Secure login with session-based authentication
- Logout with session invalidation
- Input sanitization and error feedback

### 📂 Category Management
- Add and view product categories
- Category-level validation (duplicate prevention planned)
- Category-to-product mapping

### 📦 Product Management
- Add products with category association
- View all products with category display
- Server-side product validation

### 🛒 Shopping Cart
- Add products to cart
- Increase / decrease item quantity
- Remove individual items
- Dynamic cart total calculation
- Fully session-based (no DB persistence required)

### 📑 Order Management

**Checkout**
- Converts active cart into a persisted order
- Auto-generates `OrderItem` records via Hibernate cascading
- Clears the cart after successful checkout

**Order History**
- Lists all past orders for the logged-in user
- Displays order date, status, payment status, and total amount

**Order Details**
- Breakdown of all purchased products per order
- Shows quantity, price at purchase time, subtotal per item, and grand total
- Order ownership validation — users can only view their own orders

---

## 📁 Project Structure

```
src/main/java/
│
├── controller/                  # Servlet controllers (request handling)
│   ├── LoginServlet.java
│   ├── RegisterServlet.java
│   ├── AddCategoryServlet.java
│   ├── AddProductServlet.java
│   ├── CartServlet.java
│   ├── CheckoutServlet.java
│   ├── OrdersServlet.java
│   └── OrderDetailsServlet.java
│
├── dao/                         # Data Access Objects (DB operations)
│   ├── UserDao.java
│   ├── CategoryDao.java
│   ├── ProductDao.java
│   └── OrderDao.java
│
├── model/                       # Hibernate entity classes
│   ├── Users.java
│   ├── Category.java
│   ├── Product.java
│   ├── ShoppingCart.java
│   ├── CartItem.java
│   ├── Order.java
│   ├── OrderItem.java
│   ├── OrderStatus.java         # Enum: PENDING, PROCESSING, SHIPPED, DELIVERED
│   └── PaymentStatus.java       # Enum: PENDING, PAID, FAILED
│
└── util/
    └── HibernateUtil.java       # SessionFactory singleton

src/main/webapp/
├── WEB-INF/
│   └── web.xml
├── views/                       # JSP pages
│   ├── login.jsp
│   ├── register.jsp
│   ├── products.jsp
│   ├── cart.jsp
│   ├── orders.jsp
│   └── orderDetails.jsp
└── css/
```

---

## 🗄️ Database Schema

### Entity Relationships

```
Users ──────────────────── Orders ──────────────────── OrderItems
  │                          │                              │
  │  1 : N                   │  1 : N                       │  N : 1
  │                          │                              │
  └─ One user places         └─ One order contains          └─ Each item
     many orders                many order items               references
                                                               one product
                                                                    │
                                                               Products
```

### Key Constraints
- `Order.user_id` → FK to `Users`
- `OrderItem.order_id` → FK to `Orders` (cascade delete)
- `OrderItem.product_id` → FK to `Products`
- Price is captured at purchase time in `OrderItem.price` (independent of current `Product.price`)

---

## 🔄 Application Workflow

```
[Register / Login]
        │
        ▼
[Browse Products]
        │
        ▼
[Add to Cart] ──► [Update Quantity] ──► [Remove Item]
        │
        ▼
[View Cart & Review Total]
        │
        ▼
[Checkout]
        │
        ├─ Create Order (persisted)
        ├─ Create OrderItems (cascade)
        └─ Clear Session Cart
        │
        ▼
[Order History] ──► [Order Details]
```

---

## 🧩 Hibernate Concepts Implemented

| Concept | Usage |
|---|---|
| `@OneToMany` | `User → Orders`, `Order → OrderItems` |
| `@ManyToOne` | `OrderItem → Product`, `OrderItem → Order` |
| `CascadeType.ALL` | Persisting `OrderItems` through `Order` |
| `FetchType.LAZY` | Default lazy loading on collections |
| JPQL Queries | Fetching orders by user, order details by ID |
| Transaction Management | Manual begin/commit/rollback in DAOs |
| Entity Lifecycle | Managed, detached, and removed states |
| `SessionFactory` Singleton | Centralized via `HibernateUtil` |

---

## ⚙️ Setup & Installation

### Prerequisites
- Java 17+
- Apache Tomcat 10
- PostgreSQL 14+
- Maven 3.8+

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/kartikshinde/javacart.git
   cd javacart
   ```

2. **Configure the database**

   Create a PostgreSQL database and update `src/main/resources/hibernate.cfg.xml`:
   ```xml
   <property name="hibernate.connection.url">
       jdbc:postgresql://localhost:5432/javacart_db
   </property>
   <property name="hibernate.connection.username">your_username</property>
   <property name="hibernate.connection.password">your_password</property>
   <property name="hibernate.hbm2ddl.auto">update</property>
   ```

3. **Build the project**
   ```bash
   mvn clean package
   ```

4. **Deploy to Tomcat**

   Copy the generated `.war` from `target/` into Tomcat's `webapps/` directory, then start Tomcat:
   ```bash
   $CATALINA_HOME/bin/startup.sh
   ```

5. **Access the application**

   Open `http://localhost:8080/javacart` in your browser.

---

## 🚧 Upcoming Features

### Authorization & Filters
- 1. `Filter` implementation for route protection
- 2. Role-based access control (`ADMIN` / `CUSTOMER`)
- 3. Admin-only route guards
- 4. Customer-only route guards

### Admin Panel
- 1. View and manage all orders
- 2. Update order status (`PENDING → PROCESSING → SHIPPED → DELIVERED`)
- 3. Order processing workflow dashboard

### Product Enhancements
- 1. Duplicate product name validation
- 2. Keyword-based product search
- 3. Filter products by category
- 4.  Product image upload

---

## 📚 Learning Outcomes

This project provides hands-on practice with:

- **Java Backend Development** — Servlet lifecycle, request/response handling
- **Hibernate ORM** — Mappings, transactions, JPQL, cascading
- **MVC Architecture** — Clean separation of Servlets (C), JSP (V), and entities/DAOs (M)
- **Session Management** — Cart persistence across requests without a database
- **Authentication** — Password handling, session creation, and invalidation
- **Security** — Server-side ownership validation to prevent unauthorized data access
- **Relational Database Design** — Normalized schema with FK constraints
- **Enterprise Patterns** — DAO pattern, Singleton (`HibernateUtil`), layered architecture

---

## 👨‍💻 Author

**Kartik Shinde**  
Backend-Focused Java Developer  

![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white) &nbsp; **[Visit GitHub Profile](https://github.com/kartik19230)**

---

> ⭐ If you found this project useful or learned something from it, consider giving it a star on GitHub!
