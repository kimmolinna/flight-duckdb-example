#!/bin/bash
TEMP_DIR="../temp"

# check if temp directory exists
if [ ! -d "$TEMP_DIR" ]; then
    echo "$TEMP_DIR doesn't exist. Creating."
fi

# clone the repository
cd $TEMP_DIR
if [ ! -d "arrow" ]; then
    echo "Cloning Arrow."
    git clone https://github.com/apache/arrow.git
fi

cd arrow
cd cpp && mkdir -p build && cd build && rm -rf *
cmake .. -GNinja \
    -DARROW_FLIGHT=ON \
    -DARROW_FLIGHT_SQL=ON \
    -DARROW_JSON=ON \
    -DARROW_PARQUET=ON \
    -DARROW_CSV=ON \
    -DARROW_WITH_SNAPPY=ON
ninja install # Will install into your local folder