// module.exports = async function () {
(async function(){
    const request = require('request-promise');
    const osmtogeojson = require('osmtogeojson');
    const fs = require('fs-extra');

    const query = `
      [out:json]
      [timeout:60];
      area(3600059470)->.searchArea;
      (
        way[protect_class="24"](area.searchArea);
        relation[protect_class="24"](area.searchArea);
      );
      out;
      >;
      out skel qt;
    `;

    var options = {
      method: 'GET',
      uri: 'https://lz4.overpass-api.de/api/interpreter',
      qs: {
        data: query
      },
      json: true
    };

    try {
      const osm = await request(options);
      const geojson = osmtogeojson(osm);
      await fs.outputJSON('./data/sources/osm.geojson', geojson);
    } catch (error) {
      console.log(error.message);
    }

})();
