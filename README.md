# 🗃️ LevelUp - Product Catalog API
In this project, I have built a normalized database and a RESTful API for the LevelUp e-shop that manages products and categories, where products can belong to one or multiple categories, with full CRUD operations, search and sort functionality by product title and price, proper validation of mandatory fields, and comprehensive error handling with correct HTTP status codes.

<details>
<summary><strong>🧾 Assigment Requirements</strong></summary>

- **1**: ER-diagram
- **2**: Products & categories relationship
- **3**: CRUD for both tables
- **4**: Search + Sort
- **5**: Validation
- **6**: Error handling
</details>

<details>
<summary><strong>📐 ER-diagram</strong></summary>

| 📐 |
| --- |
| ![diagram](sql/ER-diagram.png) |
</details>

## 📦 API Examples
| Method | Endpoint | Description |
| ------ | -------- | ----------- |
| GET | `/products` | Get all products (with optional search/sort) |
| GET | `/products/:id` | Get a single product |
| POST | `/products` | Create a new product |
| PATCH | `/products/:id` | Update a product |
| DELETE | `/products/:id` | Delete a product |

| Method | Endpoint | Description |
| ------ | -------- | ----------- |
| GET | `/categories` | Get all categories |
| GET | `/categories/:id/products` | Get all products that belong to a category |
| POST | `/categories` | Create a new category |
| PATCH | `/categories/:id` | Update a category |
| DELETE | `/categories/:id` | Delete a category |

## 🛠️ Tech Stack
![NodeJS](https://img.shields.io/badge/Node.js-6DA55F?style=flat&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/Express.js-%23404d59.svg?logo=express&logoColor=%2361DAFB)
![TypeScript](https://img.shields.io/badge/TypeScript-%23007ACC.svg?style=flat&logo=typescript&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=fff)

<hr>

## 🔧 Setup Guide
<details>
<summary>1️⃣ Clone Project</summary>
  
```bash
git clone https://github.com/username/repo-name.git
cd repo-name
```
</details>

<details>
<summary>2️⃣ Install Dependencies</summary>
  
```bash
npm install
```
- 3️⃣ Import `levelup.sql` file into MySQL server
- 4️⃣ Configure the database connection inside `src/db.ts`
- 5️⃣ Start the dev server with: `npm run dev`
</details>
  
## ✍️ Author/s
🧑‍💻 [@tgvie](https://github.com/tgvie)

</div>