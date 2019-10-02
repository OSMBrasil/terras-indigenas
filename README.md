# Terras Indígenas no OpenStreetMap

Em construção...

## Extração de dados

Pré-requisitos:

* git
* nvm
* osm2geojson
* [tippecanoe](https://github.com/mapbox/tippecanoe)

## Consulta Overpass

```
[out:json][timeout:25];
{{geocodeArea:São Paulo}}->.searchArea;
(
  // query part for: “reservoir”
  way[protect_class="24"](area.searchArea);
  relation[protect_class="24"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
```

## Referências

* [Arquivos shape georeferenciados pela FUNAI](http://www.funai.gov.br/index.php/shape)
