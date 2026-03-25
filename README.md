# SQL-Murder-Mystery-Solve
An interactive SQL investigation where raw data becomes clues. Follow the trail, analyze evidence, and uncover the culprit using powerful SQL queries and logical reasoning.



## 📌 Overview
This walkthrough follows a step-by-step investigation:
- Analyze crime scene reports
- Identify witnesses
- Extract clues from interviews
- Track suspects using database joins
- Narrow down to the final culprit

---

## 🗂️ Database Schema

<details>
<summary>Click to expand table structures</summary>

### crime_scene_report
```sql
(date INTEGER, type TEXT, description TEXT, city TEXT)
```

### drivers_license
```sql
(id INTEGER PRIMARY KEY, age INTEGER, height INTEGER, eye_color TEXT,
hair_color TEXT, gender TEXT, plate_number TEXT, car_make TEXT, car_model TEXT)
```

### facebook_event_checkin
```sql
(person_id INTEGER, event_id INTEGER, event_name TEXT, date INTEGER)
```

### interview
```sql
(person_id INTEGER, transcript TEXT)
```

### get_fit_now_member
```sql
(id TEXT PRIMARY KEY, person_id INTEGER, name TEXT,
membership_start_date INTEGER, membership_status TEXT)
```

### get_fit_now_check_in
```sql
(membership_id TEXT, check_in_date INTEGER, check_in_time INTEGER, check_out_time INTEGER)
```

### person
```sql
(id INTEGER PRIMARY KEY, name TEXT, license_id INTEGER,
address_number INTEGER, address_street_name TEXT)
```

</details>

---

## 🔍 Investigation Process

### 🧩 Step 1: Crime Scene
```sql
SELECT *
FROM crime_scene_report
WHERE type = 'murder'
  AND date = 20180115
  AND city = 'SQL City';
```

---

### 👀 Step 2: Witnesses

**Annabel (Franklin Ave)**
```sql
SELECT *
FROM person
WHERE name LIKE '%Annabel%'
  AND address_street_name = 'Franklin Ave';
```

**Last house on Northwestern Dr**
```sql
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;
```

---

### 🗣️ Step 3: Interviews
```sql
SELECT p.name, i.transcript
FROM person p
JOIN interview i ON p.id = i.person_id;
```

---

### 🏋️ Step 4: Gym Clue
```sql
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%'
  AND membership_status = 'gold';
```

---

### 🚗 Step 5: License Plate
```sql
SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';
```

---

### 📅 Step 6: Gym Check-in
```sql
SELECT g.name, c.check_in_date
FROM get_fit_now_member g
JOIN get_fit_now_check_in c ON g.id = c.membership_id
WHERE c.check_in_date = 20180109;
```

---

### ⚠️ Step 7: Suspect Identified
```sql
SELECT g.name
FROM get_fit_now_member g
JOIN person p ON g.person_id = p.id
JOIN drivers_license d ON d.id = p.license_id
WHERE d.plate_number LIKE '%H42W%';
```

---

## 🎯 Mastermind Discovery

### 🔴 Step 8: Tesla Owner Clue
```sql
SELECT *
FROM drivers_license
WHERE gender = 'female'
  AND hair_color = 'red'
  AND car_make = 'Tesla'
  AND car_model = 'Model S'
  AND height BETWEEN 65 AND 67;
```

---

### 🎼 Step 9: Event Attendance
```sql
SELECT person_id
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
GROUP BY person_id
HAVING COUNT(*) >= 3;
```

---

## ✅ Final Answer

```sql
INSERT INTO solution VALUES (1, 'Miranda Priestly');
```

🎉 **Culprit: Miranda Priestly**

---

## 💡 Key SQL Concepts Used
- `JOIN` (INNER JOIN)
- `LIKE` for pattern matching
- `GROUP BY` & `HAVING`
- Subqueries
- Filtering with multiple conditions

---

## 🚀 Improvements Made
- Clean GitHub-friendly formatting
- Logical step-by-step structure
- Collapsible schema section
- Minimal but clear explanations
- Reduced redundancy

---

## 📄 Usage
1. Run queries step-by-step in your SQL environment  
2. Follow the investigation logic  
3. Try alternative query approaches  

---

## ⭐ If you like this project
Give it a ⭐ on GitHub and share it!
