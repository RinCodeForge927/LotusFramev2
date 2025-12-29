# LotusFrame - Savory Whisper 🌸

A robust e-commerce platform built with Java Jakarta EE, following the DAO pattern and clean architectural principles.

## 🚀 Key Features
- **User Management**: Secure flow for registration, login, and profile management.
- **Product Catalog**: Dynamic filtering by category and real-time product search.
- **Shopping Cart**: Fully functional cart with checkout and order tracking.
- **Admin Dashboard**: Centralized management for users, orders, and products.
- **Responsive Design**: Polished UI built with Bootstrap 5 and Feather Icons.

## 🛠️ Tech Stack
- **Backend**: Java Jakarta EE (Servlets, JSP)
- **Database**: MySQL 8.x
- **Frontend**: Bootstrap 5, Vanilla JS, Feather Icons
- **Server**: Apache Tomcat 10.1+
- **DevOps**: Docker & Docker Compose support

## 🐳 Quick Start with Docker
The fastest way to get LotusFrame up and running.

1. **Clone the repository**:
   ```bash
   git clone https://github.com/RinCodeForge927/LotusFrame.git
   cd LotusFrame
   ```

2. **Build and Run**:
   Ensure you have built the project and the `.war` file is located in the `dist/` directory, then run:
   ```bash
   docker-compose up --build
   ```
   Access the store at: `http://localhost:8080`

## 💻 Manual Setup
- JDK 17+ and Apache Tomcat 10.1+ are required.
- The database schema is located in `sql/schema.sql`.
- Configure environment variables for Database connection if not using Docker (see `Constants.java`).

## 🤝 Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

## 📄 License
Distributed under the MIT License. See `LICENSE` for more information.
