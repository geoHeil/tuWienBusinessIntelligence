# bi readme

**requriements**

  - docker
  - start the DB
  	- WARNING using mariadb 10.2 (this is not production ready yet) but has nice rank functions
```
docker run -p 3306:3306 --name bi-mysql3 -e MARIADB_PASS=bi -d million12/mariadb
```

  - add mysql drivers as described
  - start workbench './data-integration/spoon.sh'
  - start integration './schema-workbench/workbench.sh'
  - connect to the database with localhost:3306, user=admin, password=bi

  - create the schema (`CREATE SCHEMA BI_OLTP_4`) manually BEFORE executing any sql  

  - main Kettle folder holding ALL transformations & jobs is in task 1 folder!!


 ## Notes

 **OLTP --> OLAP**
 Transformations
   - cast as timestamp is ambigous. We chose not to use an UNIX-timestamp which is not well defined pre 1970, but rather a mysql TIMESTAMP which works fine