//https://medium.com/@tariibaba/javascript-convert-json-to-csv-312e7503ce5d
function jsonToCsv(items) {
    const header = Object.keys(items[0]);  const headerString = header.join(';');  // handle null or undefined values here
    const replacer = (key, value) => value ?? '';  const rowItems = items.map((row) =>
      header
        .map((fieldName) => JSON.stringify(row[fieldName], replacer))
        .join(';')
    );  // join header and body, and break into separate lines
    //const csv = [headerString, ...rowItems].join('\r\n');  
    const csv = [headerString, ...rowItems].join(';');  
    return csv;
  }


  module.exports = jsonToCsv;