(: answer for 1.4b:)

let $p := (
let $a :=

for $i in doc("/db/books.xml")/biblio/author/book

return <book> {$i/title} {$i/rating} </book>

for $i in $a
group by $title := $i/title, $price := $i/rating

return $i[1]
)

for $i in $p
let $price := $i/rating
order by xs:float($price) descending
return ($i/*)
