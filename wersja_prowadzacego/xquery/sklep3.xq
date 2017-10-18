declare function local:filtr($towary, $granica as xs:double) {
  for $towar in $towary
  where $towar/cena/text() <= $granica
  return $towar
};

let $sklep := doc("sklep2.xml")/sklep
return
<html><body> {
  for $kategoria in $sklep/towar/kategoria/text()
  where not($kategoria/preceding::kategoria[text() = $kategoria])
  return (
    <h2>Kategoria {$kategoria}</h2>,
    let $towary := $sklep/towar[kategoria = $kategoria]
    let $sr := avg($towary/cena/text())
    for $towar in local:filtr($towary, $sr)
    return (
      <h3>Towar {$towar/nazwa/text()}</h3>,
      <p>Cena: {$towar/cena/text()}</p>
    )
  )
} </body></html>