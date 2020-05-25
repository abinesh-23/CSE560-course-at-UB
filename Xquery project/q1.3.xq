(: answer for 1.3:)

declare namespace functx = "func";
declare function functx:is-node-in-sequence-deep-equal
  ( $node as node()? ,
    $seq as node()* )  as xs:boolean {

   some $nodeInSeq in $seq satisfies deep-equal($nodeInSeq,$node)
 } ;
declare function functx:distinct-deep
  ( $nodes as node()* )  as node()* {

    for $seq in (1 to count($nodes))
    return $nodes[$seq][not(functx:is-node-in-sequence-deep-equal(
                          .,$nodes[position() < $seq]))]
 } ;


let $pp := (
let $depts :=
(let $glob := for $i in  functx:distinct-deep(doc("/db/books.xml")//book)
return <global> {avg($i//price)} </global>
let $dept := 
for $z in (
for $i in doc("/db/books.xml")//author/book
return <cat> {$i/category} {$i/price}</cat>)

group by $c := $z/category
return <n> <dept> {$c} </dept> 
<avgprice> {avg($z/price)} </avgprice></n>

for $p in $dept
return if ($p/avgprice > avg($glob))
then $p)

let $authors :=
for $i in doc("/db/books.xml")//author
for $j in doc("/db/books.xml")//author

for $book1 in $i//book
for $book2 in $j//book

return if ($book1 = $book2 and $i/name != $j/name)
then <book>{$book1/category} {$book1/title} {$book1/price}  </book>

for $auth in $authors

return if ($auth/category = $depts/dept)
then $auth)

let $title :=
for $i in $pp
let $title := $i/title
return $title

let $auth := for $a in functx:distinct-deep($pp)
return <b>  {for $d in functx:distinct-deep(doc("/db/books.xml")//author) where $a/title = $d/book/title  return $d/name} </b>


let $ans := for-each-pair($auth, functx:distinct-deep($pp), function($f, $s) { <output>{$s/*,$f/*}</output>})

let $finans :=
for $i in $ans
group by $cat := $i//category
let $price := max($i//price)
where data($i//price) = $price
return <categories> {for $h in $i where $h//price = $price return $h} </categories>

return <result> {$finans} </result>