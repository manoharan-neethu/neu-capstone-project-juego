# Walkthrough document

This website is vulnerable to various attacks. However, only one attack will yield the necessary CTFd flag. Use `?debug=true` to see the actual query being executed.

## Registration

Use the `register.php` to create users

## Login bypass attack

Bypassing login using boolean expressions

**Page:** `login1.php`

**Page:** `login2.php`

## Verbose SQL Error based Injection

Forcing error conditions to reveal and extract data

**Page:** `login1.php` 

## Extracting data using UNION queries

Using a pre existing SQL select query to fetch additional data from the DB

**Page:** `searchproducts.php` 

## Second order SQL injection

User input is stored and reused as is in a different function that has no protection

**Page:** `secondorder_register.php`

## Blind SQL injection

**Page:** `blindsqli.php`

## OS interaction

**Page:** `os_sqli.php`
