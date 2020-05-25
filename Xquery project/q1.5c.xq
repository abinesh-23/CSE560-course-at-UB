(: answer for 1.5c:)


let $science := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "Science"

return <book>{$i/title} {$i/price} {$i/rating}  {$category}</book>
)
let $PL := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "PL"

return <book>{$i/title} {$i/price} {$i/rating}  {$category}</book>
)
let $DB := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "DB"

return <book>{$i/title} {$i/price} {$i/rating}  {$category}</book>
)
let $others := (
for $i in doc("/db/books.xml")//book
let $category := $i/category
where $category = "Others" 
 
return <book> {$i/title} {$i/price} {$i/rating}  {$category} </book>  
)

let $a := for $i in $DB, $j in $PL, $k in $science, $l in $others

return <book> {$i} {$j} {$k} {$l} </book>

let $b := 
for $s in $a
where sum($s//price) <= 1800
order by sum($s//rating) descending
return $s

for $i in $b[1]/*
return $i/*