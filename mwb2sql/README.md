## MySQL Workbench schema exporter to SQL (MWB to SQL)
This Docker image exports the database schema from a MWB file (MySQL Workbench file) to a SQL file, including all the SQL statements to create the database schema.

Just the necessary packages have been installed over the [Debian official image](https://hub.docker.com/_/debian/).

Usage:
```
docker run -it --rm -v $(pwd):/data gogaenrique/mwb2sql {MWB input file} {SQL output file}
```


*This image has been based on the work done by [tomoemon](https://github.com/tomoemon). ([tomoemon's repository](https://github.com/tomoemon/mwb2sql))*
