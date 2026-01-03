# LotusFrame - Savory Whisper 🌸

A robust e-commerce platform built with Java Jakarta EE, following the DAO pattern and clean architectural principles. This project showcases a modern approach to legacy Java Web technologies by integrating Maven and Docker for seamless deployment.

## 🚀 Key Features
- **User Management**: Secure flow for registration, login, and profile management.
- **Product Catalog**: Dynamic filtering by category and real-time product search with 30+ pre-configured items.
- **Shopping Cart**: Fully functional cart with checkout and order tracking.
- **Admin Dashboard**: Centralized management for users, orders, and products.
- **Responsive Design**: Polished UI built with Bootstrap 5 and Feather Icons.
- **Auto-Seeded Data**: Comes with a rich set of demo data for products, categories, and blog posts.

## 🛠️ Tech Stack
- **Backend**: Java Jakarta EE 10 (Servlets, JSP)
- **Build Tool**: Apache Maven
- **Database**: MySQL 8.x
- **Frontend**: Bootstrap 5, Vanilla JS, Feather Icons
- **Server**: Apache Tomcat 10.1+
- **DevOps**: Docker & Docker Compose (Multi-stage builds)

## 🐳 Quick Start with Docker
The fastest way to get LotusFrame up and running without installing Java or Tomcat.

1. **Clone the repository**:
   ```bash
   git clone https://github.com/RinCodeForge927/LotusFramev2.git
   cd LotusFramev2
   ```

2. **Launch the Application**:
   Simply run the following command:
   ```bash
   docker-compose up -d --build
   ```

3. **Explore**:
   - Storefront: [http://localhost:8080](http://localhost:8080)
   - **Admin Account**: 
     - Email: `admin@lotus.com`
     - Password: `123`
   - **User Account**:
     - Email: `user@lotus.com`
     - Password: `123`

## 💻 Manual Setup (For Development)
- **JDK 17+** and **Apache Maven 3.8+** are required.
- Build the project using Maven: `mvn clean package`.
- Deploy the generated `ROOT.war` from the `target/` directory to an **Apache Tomcat 10.1+** server.
- The database schema and demo data are located in `sql/schema.sql`.

## 🤝 Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

## 📄 License
Distributed under the MIT License. See `LICENSE` for more information.