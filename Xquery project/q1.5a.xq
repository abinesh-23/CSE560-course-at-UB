(: answer for 1.5a:)


let $final := (
let $science := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "Science"
order by xs:float($i/price) 
return <book>{$i/title} {$i/price}  {$category}</book>
)
let $PL := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "PL"
order by xs:float($i/price) 
return <book>{$i/title} {$i/price}  {$category}</book>
)
let $DB := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "DB"
order by xs:float($i/price) 
return <book>{$i/title} {$i/price}  {$category}</book>
)
let $others := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "Others" 
order by xs:float($i/price) 
return <book> {$i/title} {$i/price} {$category} </book>  
)

return <books> {$DB[1]/*} {$others[1]/*} {$PL[1]/*} {$science[1]/*} </books>
)

return $final/*

