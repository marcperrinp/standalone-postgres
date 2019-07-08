### Introduction

This is a standalone postgres container with populated data.

### Browse your data

Execute the following commands:
```
docker exec -it standalone_postgres psql forest_postgres forest
```

OR

```
psql postgres://forest:secret@localhost:5417/forest_postgres
```