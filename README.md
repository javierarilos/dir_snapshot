# Directories Snapshots

Utilities for creating and comparing directory snapshots. A directory `snapshot`
is a CSV file that for each `file` and `directory` lists the following fields:
* File path
* File modification (epoch)
* File change (epoch)
* File size (bytes)

File modification vs File change: modification implies a modification in the *file content*
while file change is a change in the *file metadata*, see Linux `stat` reference
for more information.

## How to use it
First, create a snapshot of a directory.
```bash
$ ./dir_snapshot.sh /home/jarias/dir_snapshot/a
```

Second, wait (or do) some modifications to your directory.

Third, create a second snapshot. Snapshots are created as zip `(.gz)` files in
the form `(epochtimestamp)-snapsht.csv.gz`.

Fourth, get changes between snapshots:
```bash
$ ./snapshot_changes.sh 1454662159-snapshot.csv.gz 1454662238-snapshot.csv.gz
rm>  ;/home/jarias/dir_snapshot/a/b/1.xml;1454662120;1454662120;13
add> ;/home/jarias/dir_snapshot/a/b/1.xml;1454662224;1454662224;31
rm>  ;/home/jarias/dir_snapshot/a/c/3.xml;1454662120;1454662120;13
add> ;/home/jarias/dir_snapshot/a/d/6.xml;1454662224;1454662224;0
add> ;/home/jarias/dir_snapshot/a/d/6.wav;1454662224;1454662224;0
add> ;/home/jarias/dir_snapshot/a/c/5.xml;1454662224;1454662224;0
add> ;/home/jarias/dir_snapshot/a/c/5.wav;1454662224;1454662224;0
```

Alternatively, you can check what directories changed between snapshots.
```bash
$ ./dirs_changed_snapshots.sh 1454662159-snapshot.csv.gz 1454662238-snapshot.csv.gz
/home/jarias/dir_snapshot/a/b
/home/jarias/dir_snapshot/a/c
/home/jarias/dir_snapshot/a/d
```
