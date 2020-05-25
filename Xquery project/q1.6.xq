(: answer for 1.6:)

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

let $title := 
for $i in doc("/db/books.xml")
return distinct-values($i//title)

let $books :=
for $p in doc("/db/books.xml")//author 
where data($p//title) = $title 
return $p/book

let $distbooks := functx:distinct-deep($books)

let $auth := for $a in functx:distinct-deep(doc("/db/books.xml")//author/book)
return <b>  {for $d in functx:distinct-deep(doc("/db/books.xml")//author) where $a = $d/book  return $d/name} </b>

let $findist := for $i in $distbooks return <b>{$i}</b>

let $ans := for-each-pair($findist, $auth, function($f, $s) { <row>{$f/*,<a> {$s//name} </a>}</row>})



let $finans := for $i in $ans
order by $i/book/@year descending
return <book> {$i/book/@year} {$i/book/*} {for $p in $i/a/* return <author>{data($p)}</author>} </book>

return <biblio> {$finans} </biblio>