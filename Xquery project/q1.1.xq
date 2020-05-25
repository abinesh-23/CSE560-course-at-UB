(: answer for 1.1:)

let $jeff := (for $p in doc("/db/books.xml")/biblio/author where $p/name = "Jeff" return $p//title )
let $book := (for $i in doc("/db/books.xml")//author let $book := <b> {$i//title} {$i//name}</b> where $book//name != "Jeff" return $book)


for $x in $jeff, $y in $book
where $y/title = $x
return <book> {$x} {for $i in doc("/db/books.xml")/biblio/author where $i/name = "Jeff" return $i/name}  {$y/name} </book>

