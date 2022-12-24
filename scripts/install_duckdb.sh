#!/bin/bash
TEMP_DIR="../temp"

# check if temp directory exists
if [ ! -d "$TEMP_DIR" ]; then
    echo "$TEMP_DIR doesn't exist. Creating."
fi

# clone the repository
cd $TEMP_DIR
if [ ! -d "duckdb" ]; then
    echo "Cloning DuckDB."
    git clone https://github.com/duckdb/duckdb.git
fi

cd duckdb
if [ ! -d "build/release" ]; then
    echo "Building DuckDB"
    make
fi

# copy libraries to include and lib paths
cp build/release/src/libduckdb.so /usr/local/lib/
cp src/include/duckdb.h /usr/local/include/
cp src/include/duckdb.hpp /usr/local/include/
cp -R src/include/duckdb /usr/local/include/