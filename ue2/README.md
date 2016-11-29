# bi readme

**requriements**

  - docker
  - start the DB
```
docker run -p 3306:3306 --name bi-mysql -e MYSQL_ROOT_PASSWORD=bi -d mysql:8.0 
```

  - add mysql drivers as described
  - start workbench './data-integration/spoon.sh'
  - start integration './TODO'