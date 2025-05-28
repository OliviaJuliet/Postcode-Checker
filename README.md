# README

## How to run

In order to set up this project, first run "bin/rails db:migrate" to initialise the database, then "bin/rake db:seed" to populate it with its default values. "bin/rails server" to launch the server.

## How to test

Use "bin/rails test" to run unit and integration tests. If you wish to run system tests, "bin/rails test:system" runs only them, or "bin/rails test:all" runs all tests.

## How to alter allowed postcodes

Allowed LSOA prefixes are stored in the Lsoa model, while exceptionally allowed postcodes are stored in the ServedPostcode model. The initial db seeds allow "Southwark" and "Lambeth" as LSOA prefixes and "SH24 1AA" and "SH24 1AB" as exceptionally allowed postcodes. Entries may be added or removed from these tables as needed.
