(: answer for 1.4a:)

let $p := (
let $a :=

for $i in doc("/db/books.xml")/biblio/author/book

return <book> {$i/title} {$i/price} </book>

for $i in $a
group by $title := $i/title, $price := $i/price

return $i[1]
)

for $i in $p
let $price := $i/price
order by xs:integer($price)
return $i/*

