# laravel-installer

A simple script for creating a new Laravel application with Sail using Docker.

It uses a Docker container that comes with Composer and the `laravel/installer` package pre-installed.

**You don't need to install PHP, Composer, or the Laravel installer on your local machine.**

In other words, you can run `laravel new` without installing PHP or Composer locally.

## Usage

To create a new Laravel application, run the following commands:

```bash
cd DIRECTORY_WHERE_THE_PROJECT_WILL_BE_CREATED
/path/to/laravel-installer/install.sh PROJECT_NAME LARAVEL_NEW_OPTIONS
```

For example:

```bash
cd ~/projects
/path/to/laravel-installer/install.sh sample-app --react --phpunit --no-boost
```

## Next steps

When the installation is complete, you can start the Sail services and run migrations:

```bash
cd PROJECT_NAME
./vendor/bin/sail up -d
./vendor/bin/sail artisan migrate
```

And then access `http://localhost` and confirm the your application is running.
