# Setup

This repo is designed to be used in conjunction with [Next.js repo](https://github.com/Rees1993/verse-frontend).

## Credentials

Username: admin\
Password: password123

## Steps

1. Clone Repo
2. Create database using the provided seed.sql
3. Run `composer install` to install
4. Copy .env.example in terminal `cp .env.example .env`
5. Run `./craft setup/security-key && ./craft setup/app-id`
6. Make sure `DB_DATABASE` and other credentials in .env matches the database setup of your Craft installation
7. If using Laravel Valet, the URL for the admin should be http://verse-craft.test/admin.
8. Login using credentials displayed above
9. Copy the Bearer Token and replace it in the frontend repo .env (Omit the 'Authorization: Bearer' as this isn't required)
