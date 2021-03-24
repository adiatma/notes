#!/bin/sh

DATE=$(date +%Y-%m-%d)

echo "current date: ${DATE}"

read -p "title: " TITLE
FINAL_TITLE=$(echo "${TITLE// /-}" | tr '[:upper:]' '[:lower:]')
FILE_NAME=$(echo "${FINAL_TITLE}.markdown")
echo "filename: ${FILE_NAME}"

read -p "category: " CATEGORY
FINAL_CATEGORY=$(echo "${CATEGORY// /-}" | tr '[:upper:]' '[:lower:]')
PARENT_CATEGORY=$(echo "${FINAL_CATEGORY}/${FINAL_CATEGORY}.markdown")
if [[ ! -e "${PARENT_CATEGORY}" ]]; then
  command mkdir -p "${CATEGORY// /-}"
  echo "category location: ${PARENT_CATEGORY}"
fi

LOCATION=$(echo "${FINAL_CATEGORY}/${FILE_NAME}")
echo "post location: ${LOCATION}"

if [[ -e "${LOCATION}" ]]; then
  echo "Oops, filename: ${LOCATION} exists!"
else
  command touch $LOCATION
  if [[ ! -e "${PARENT_CATEGORY}" ]]; then
    command touch $PARENT_CATEGORY
    echo "---
layout: default
title:  "${CATEGORY}"
has_children: true
---

# ${TITLE}
" > ${PARENT_CATEGORY}
  fi

  echo "---
layout: default
title:  "${TITLE}"
date:   ${DATE}
parent: ${CATEGORY}
---

## Kasus

## Implementasi

" > ${LOCATION}
  echo "Create new post success!"
fi
