#!/bin/bash

mkdir -p terras-indigenas

cd terras-indigenas

curl 'http://overpass-api.de/api/interpreter' --data 'data=%5Bout%3Ajson%5D%5Btimeout%3A25%5D%3B%0Aarea(3600059470)-%3E.searchArea%3B%0A(%0A++way%5Bprotect_class%3D%2224%22%5D(area.searchArea)%3B%0A++relation%5Bprotect_class%3D%2224%22%5D(area.searchArea)%3B%0A)%3B%0A%2F%2F+print+results%0Aout+body%3B%0A%3E%3B%0Aout+skel+qt%3B' --compressed > terras-indigenas.json
osmtogeojson terras-indigenas.json > terras-indigenas.geojson
ogr2ogr -f csv terras-indigenas.csv terras-indigenas.geojson
ogr2ogr -f ods terras-indigenas.ods terras-indigenas.geojson
ogr2ogr -f xlsx terras-indigenas.xlsx terras-indigenas.geojson
ogr2ogr -f kml terras-indigenas.kml terras-indigenas.geojson
geo2topo terras-indigenas.geojson > terras-indigenas.topojson

cd ..

zip -r terras-indigenas.zip . -i "terras-indigenas/*"

cp terras-indigenas/terras-indigenas.csv .

rm -rf ./terras-indigenas