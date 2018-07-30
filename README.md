# SharinPix Move Album

#### Installation
```sh
$ npm install -g sharinpix-move
```

#### Usage

##### Unix

```sh
$ env SHARINPIX_URL=sharinpix://secret_url_you_can_find_in_your_admin_dashboard sharinpix-move sample.csv > success.csv 2> error.csv
```
##### Windows

```sh
C:\foo>set SHARINPIX_URL=sharinpix://secret_url_you_can_find_in_your_admin_dashboard
```

```sh
C:\foo>sharinpix-move sample.csv > success.csv 2> error.csv
```

- ``` sample.csv ``` refers to the  path of the file containing the albums to be moved.
-  ``` success.csv ``` refers to the path of the log file containing only successfully-moved albums.
-  ``` error.csv ``` refers to the path of the error log file containing only albums that failed to be moved.

The structure of the ``` sample.csv ``` file should be in the following form:
```
source_id,destination_id
foo,bar
```
License
----

MIT
