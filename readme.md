This is an environment for django app development. Using this you can:
<ul>
    <li>Create django project</li>
    <li>Setup postgresql database (with postgis) and python environment</li> 
    <li>Manage project migrations</li>
</ul>

<h3>Create Django project</h3>
Set your project name in enviroment/base.env <br/>
Start your django project, with following command. 

```dockerfile
docker compose --env-file enviroment/base.env run --rm start-project
```




<h3>Configure Postgresql for Django</h3>

By default, Django uses a sqlite database wich is OK, but not great for professional development. So you may want to connect to postgres.

Because we will use env add this import to settings.py

```python
    from os import getenv
```
Replace database configuration with following:

```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql',
            'NAME': getenv('POSTGRES_DB'),
            'USER': getenv('POSTGRES_USER'),
            'PASSWORD': getenv('POSTGRES_PASSWORD'),
            'HOST': 'db',
            'PORT': '5432'
        }
    }
```
<h3>Django manage commands (also migrations)</h3>
Docker compose has special service to hande managment command.

```
docker compose --env-file enviroment/base.env run django-admin
```

makemigrations
```dockerfile
docker compose --env-file enviroment/base.env run django-admin makemigrations 
```
migrate
```dockerfile
docker compose --env-file enviroment/base.env run django-admin migrate
```

createsuperuser
```dockerfile
docker compose --env-file enviroment/base.env run django-admin createsuperuser
```


<h3>Run Django</h3>
Command bellow will allow you to run django. 

<code>
docker compose --env-file enviroment/base.env up django --build
</code>


