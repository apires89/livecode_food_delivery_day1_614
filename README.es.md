##### LIVE CODE ######

- [x] As a manager I can list all meals
- [x] As a manager I can add a meal
- [x] As a manager I can list all customers
- [x] As a manager I can add a customer
- [ ] As a manager I can list undelivered orders
- [ ] As a manager I can add an order

- [ ] As a rider I can list my undelivered orders
- [ ] As a rider I can mark an order as delivered


What i want my order to look like...


+--------------------+
|       Order        |
+--------------------+
| @id                |
| @customer -> instance of customer        |
| @meal       -> instance of meal
| @employee    -> instance of employee
| @delivered         |
+--------------------+
| mark_as_delivered! |
+--------------------+
