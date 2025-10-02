<h1 name="content" align="center"><a href=""><img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/></a> MSSQL</h1>

<p align="center">
  <a href="#-lab1"><img alt="lab1" src="https://img.shields.io/badge/Lab1-blue"></a> 
  <a href="#-lab2"><img alt="lab2" src="https://img.shields.io/badge/Lab2-red"></a>
  <a href="#-lab3"><img alt="lab3" src="https://img.shields.io/badge/Lab3-green"></a>
  <a href="#-lab4"><img alt="lab4" src="https://img.shields.io/badge/Lab4-yellow"></a>
  <a href="#-lab5"><img alt="lab5" src="https://img.shields.io/badge/Lab5-gray"></a>
  <a href="#-lab6"><img alt="lab6" src="https://img.shields.io/badge/Lab6-orange"></a> 
  <a href="#-lab7"><img alt="lab7" src="https://img.shields.io/badge/Lab7-brown"></a>
  <a href="#-lab8"><img alt="lab8" src="https://img.shields.io/badge/Lab8-purple"></a>
  <a href="#-lab9"><img alt="lab9" src="https://img.shields.io/badge/Lab9-violet"></a> 
</p>

# <img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/> Ювелирная мастерская (Вариант №23)
<h3 align="center">
<h3">
  <a href="#client"></a>
  
Каталог ювелирных изделий: название изделия, вид изделия (серьги, кольца, браслеты, броши), список материалов (платина, золото, серебро, различные драгоценные камни и т.д.), вес каждого материала в изделии.
Клиенты: ФИО, адрес, телефон.

Реализовать:
- Подбор изделия клиенту и расчет стоимости с учетом скидок постоянным клиентам.
- Заключение договора на производство 1 или нескольких изделий для клиента
- Подсчет выручки мастерской за заданный период
- Поиск изделий по заданным характеристикам
</h3>
</p>
<img src="https://github.com/user-attachments/assets/e080adec-6af7-4bd2-b232-d43cb37024ac" width="20" height="20"/> Лабораторная работа №1


<p aligh="justify>
<h3>
  <a href="#client"></a>
  Разработать ER-модель данной предметной области: выделить сущности, их атрибуты,
связи между сущностями.
Для каждой сущности указать ее имя, атрибут (или набор атрибутов), являющийся
первичным ключом, список остальных атрибутов.
Для каждого атрибута указать его тип, ограничения, может ли он быть пустым, является ли
он первичным ключом.
Для каждой связи между сущностями указать:
- тип связи (1:1, 1:M, M:N)
- обязательность
ER-модель д.б. представлена в виде ER-диаграммы (картинка)
По имеющейся ER-модели создать реляционную модель данных и отобразить ее в виде
списка сущностей с их атрибутами и типами атрибутов, для атрибутов указать, явл. ли он
первичным или внешним ключом
</h3>
</p3>

#### ER-модель
![image](/lab1/popit4.png)

#### Реляционная модель
![image](/lab1/bd1.png)

# Лабораторная работа №2

<p aligh="justify>
<h3>
  <a href="#client"></a>
В соответствии с реляционной моделью данных, разработанной в Лаб.№1, создать реляционную БД на учебном сервере БД :
- создать таблицы, определить первичные ключи и иные ограничения
- определить связи между таблицами
- создать диаграмму
- заполнить все таблицы адекватной информацией (не меньше 10 записей в таблицах, наличие примеров для связей типа 1:M )

</h3>
</p3>

[SQL-код создания таблиц](https://github.com/S1l1c1um/Bd_labss/blob/main/JeweleryStore-database/SQLQuery1.sql)

[SQL-код заполнения таблиц](https://github.com/S1l1c1um/Bd_labss/blob/main/JeweleryStore-database/SQLQuery4.sql)

#### Диаграмма базы данных
![image](/lab1/bd.JPG)
