# 💊 Pharmacy Management System

Система управления аптекой на основе PostgreSQL, предназначенная для управления лекарственными препаратами, складскими запасами, поставщиками, закупками, продажами, клиентами и платежами.

## 📌 Описание проекта

Pharmacy Management System — это проект реляционной базы данных, разработанный для автоматизации основных процессов работы аптеки.

Система позволяет хранить и обрабатывать информацию о лекарственных препаратах, контролировать складские остатки, отслеживать сроки годности, регистрировать продажи и анализировать деятельность аптечных филиалов.

## 🎯 Цели проекта

- Разработка и создание реляционной базы данных.
- Управление лекарственными препаратами, поставщиками и клиентами.
- Контроль количества товаров на складе.
- Отслеживание сроков годности лекарств.
- Регистрация закупок, продаж, возвратов и платежей.
- Анализ продаж и складских запасов.
- Реализация SQL-функций, процедур, представлений и индексов.

## 🛠 Используемые технологии

- PostgreSQL
- SQL
- pgAdmin 4
- Visual Studio Code
- Git
- GitHub

## 📂 Структура проекта

```text
pharmacy-management-system/
│
├── analytics/
│   ├── 01_expiring_medicines.sql
│   ├── 02_best_selling_medicines.sql
│   ├── 03_branch_shortages.sql
│   └── 04_sales_analysis.sql
│
├── business_logic/
│   ├── 01_expiration_control.sql
│   ├── 02_batch_tracking.sql
│   ├── 03_prescription_sales.sql
│   └── 04_inventory_control.sql
│
├── database/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_primary_foreign_keys.sql
│   ├── 04_constraints.sql
│   └── 05_indexes.sql
│
├── docs/
│   ├── business_requirements.md
│   ├── database_documentation.md
│   └── project_brief.md
│
├── queries/
│   ├── 01_basic_queries.sql
│   ├── 02_filtering.sql
│   ├── 03_aggregation.sql
│   ├── 04_joins.sql
│   ├── 05_subqueries.sql
│   ├── 06_case_update_delete.sql
│   ├── 07_views.sql
│   ├── 08_procedures_functions.sql
│   └── 09_business_analysis.sql
│
├── results/
│   ├── analysis_summary.md
│   ├── query_results/
│   └── screenshots/
│
└── README.md
```

## 🗄 Структура базы данных

База данных состоит из 16 основных таблиц:

1. categories — категории лекарств.
2. manufacturers — производители.
3. suppliers — поставщики.
4. branches — филиалы аптеки.
5. medicines — лекарственные препараты.
6. warehouses — склады.
7. medicine_batches — партии лекарств.
8. inventory — складские остатки.
9. purchases — закупки.
10. purchase_items — позиции закупок.
11. customers — клиенты.
12. sales — продажи.
13. sale_items — позиции продаж.
14. payments — платежи.
15. returns — возвраты.
16. return_items — позиции возвратов.

## ⚙️ Основные возможности системы

- Управление лекарственными препаратами.
- Контроль складских запасов.
- Мониторинг сроков годности.
- Контроль рецептурных препаратов.
- Управление закупками.
- Регистрация продаж.
- Управление информацией о клиентах.
- Учёт платежей.
- Обработка возвратов.
- Анализ бизнес-показателей.

## 📊 Реализованные возможности SQL

- CREATE, INSERT, UPDATE, DELETE.
- SELECT и фильтрация данных.
- JOIN-запросы.
- GROUP BY и HAVING.
- Агрегатные функции.
- Подзапросы.
- UNION, INTERSECT, EXCEPT.
- CASE-выражения.
- Представления (VIEW).
- Индексы (INDEX).
- Функции (FUNCTION).
- Хранимые процедуры (PROCEDURE).
- Транзакции.

## 📈 Аналитика

В проекте реализованы SQL-запросы для анализа:

- Лекарств с истекающим сроком годности.
- Самых продаваемых лекарственных препаратов.
- Дефицита товаров в филиалах.
- Продаж по филиалам.
- Способов оплаты.
- Покупок клиентов.

## 🚀 Установка и запуск базы данных

1. Установить PostgreSQL и pgAdmin 4.
2. Создать базу данных с названием `pharmacy_management`.
3. Открыть Query Tool в pgAdmin 4.
4. Выполнить SQL-файлы из папки `database` в следующем порядке:

```text
01_create_tables.sql
02_insert_data.sql
03_primary_foreign_keys.sql
04_constraints.sql
05_indexes.sql
```

5. Выполнить необходимые SQL-файлы из папок `queries`, `business_logic` и `analytics`.

## 👨‍💻 Автор проекта

**Yerassyl Semenbay**

Учебный проект по дисциплине «Базы данных SQL».

**Название проекта:** Pharmacy Management System