let $sklep := doc("sklep1.xml")/sklep
return
<html><body> {
  for $kategoria in  $sklep/kategoria/text()
  return (
    <h2>Kategoria {$kategoria}</h2>,
    for $towar in $sklep/towar[kategoria = $kategoria]
    return (
      <h3>Towar {$towar/nazwa/text()}</h3>,
      <p>Cena: {$towar/cena/text()}</p>
    )
  )
} </body></html>