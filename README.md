# Setup

This repo is designed to be used in conjunction with [Next.js repo](https://github.com/Rees1993/verse-frontend).

## Credentials

Username: admin\
Password: password123

## Steps

1. Clone Repo
2. Create database using the provided seed.sql
3. Run `composer install` to install
4. Copy .env.example in terminal `cp .env.example`
5. Make sure `DB_DATABASE` in .env matches the database name of your Craft installation
6. If using Laravel Valet, the URL for the admin should be http://verse-craft.test/admin.
7. Login using credentials displayed above
