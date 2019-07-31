#!/bin/bash
# This source script was written by my friend, FTK
#Configuration
BASE_DIR="../"
INPUT_FILE_INFIX="data_file"
INPUT_FILE_ARR=( $(ls -1 ${BASE_DIR}${INPUT_FILE_INFIX}*) )
OUTPUT_FILE="merged_data.csv"

#convert
for FILE in ${INPUT_FILE_ARR[*]}; do
  CONV_OUTFILE=$(basename "${FILE}")
  CONV_OUTFILE=${CONV_OUTFILE}.tmp
  tr -d '\r' < "$FILE" > "${CONV_OUTFILE}"
done

#paste
CONV_FILE_ARR=( $(ls -1 ${INPUT_FILE_INFIX}*.tmp) )
paste -d"," ${CONV_FILE_ARR[*]} > ${OUTPUT_FILE}

#remove tmp file
rm *.tmp
