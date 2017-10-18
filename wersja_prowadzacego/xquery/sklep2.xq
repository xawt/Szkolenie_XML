let $sklep := doc("sklep2.xml")/sklep
return
<html><body> {
  for $kategoria in  $sklep/towar/kategoria/text()
  where not($kategoria/preceding::kategoria[text() = $kategoria])
  return (
    <h2>Kategoria {$kategoria}</h2>,
    for $towar in $sklep/towar[kategoria = $kategoria]
    return (
      <h3>Towar {$towar/nazwa/text()}</h3>,
      <p>Cena: {$towar/cena/text()}</p>
    )
  )
} </body></html>