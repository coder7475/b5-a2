
## **📂 Bonus Section (Answer Any 5 Questions on readme.md in Bangla) → 10 Marks**


1. What is PostgreSQL?

উত্তরঃ পোস্টগ্রেসকিউএল হলো একটি রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম, যেখানে ডেটা টেবিল আকারে সংরক্ষণ করা হয় এবং কীভাবে টেবিলগুলোর মধ্যে সম্পর্ক থাকে তা রিলেশন দ্বারা নির্ধারণ করা হয়। এটি SQL ল্যাঙ্গুয়েজ অনুসরণ করে তৈরি এবং অপ্টিমাইজড একটি ডেটাবেস ম্যানেজমেন্ট সিস্টেম, যার ফলে এটি খুবই জনপ্রিয়। এতে অনেক অ্যাডভান্সড ফিচার বিল্ট-ইন আছে, যেমন JSON সাপোর্ট, ফুল-টেক্সট সার্চ, টেবিল ইনহেরিট্যান্স, এবং ইন্ডেক্সিং। এটি একসাথে অনেক কনকারেন্ট ইউজারের সংযোগ হ্যান্ডেল করতে পারে। এটি ACID কমপ্লায়েন্ট, ওপেন সোর্স এবং শক্তিশালী সিকিউরিটি প্রদান করে।

2. What is the purpose of a database schema in PostgreSQL?

উত্তরঃ পোস্টগ্রেসকিউএল এ একটি স্কিমা হলো ডেটাবেসের ভেতরে একটি লজিক্যাল স্ট্রাকচার বা নেমস্পেস বা ডেটাবেসের ভেতরে একটি আলাদা ভাগ বা অংশ, যেখানে টেবিল, ভিউ, ফাংশন ইত্যাদি আলাদাভাবে গুছিয়ে রাখা যায়। 
এটি ডেটাবেসকে আরও সংগঠিত, সুরক্ষিত এবং কার্যকরভাবে পরিচালনাযোগ্য করে তোলে।

উদাহরণঃ

```sql
-- Create a new schema
CREATE SCHEMA sales;

-- Create a table within the schema
CREATE TABLE sales.customers (
  id SERIAL PRIMARY KEY,
  name TEXT
);

-- Accessing the table
SELECT * FROM sales.customers;
```

3. Explain the **Primary Key** and **Foreign Key** concepts in PostgreSQL.
4. What is the difference between the `VARCHAR` and `CHAR` data types?
5. Explain the purpose of the `WHERE` clause in a `SELECT` statement.
6. What are the `LIMIT` and `OFFSET` clauses used for?
7. How can you modify data using `UPDATE` statements?
8. What is the significance of the `JOIN` operation, and how does it work in PostgreSQL?
9. Explain the `GROUP BY` clause and its role in aggregation operations.
10. How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in PostgreSQL?

💡 Pro Tip: Don't be short and concise in your answers; explain the idea behind each question and provide in-depth analysis with relevant examples.
---
