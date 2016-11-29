# bi readme

**requriements**

  - docker
  - start the DB
```
docker run -p 3306:3306 --name bi-mysql -e MYSQL_ROOT_PASSWORD=bi -d mysql:8.0 
```

  - add mysql drivers as described
  - start workbench './data-integration/spoon.sh'
  - start integration './schema-workbench/workbench.sh'
  - connect to the database with localhost:3306, user=root, password=bi

  - create the schema (`CREATE SCHEMA BI_OLTP_4`) manually BEFORE executing any sql  

  - main Kettle folder holding ALL transformations & jobs is in task 1 folder!!