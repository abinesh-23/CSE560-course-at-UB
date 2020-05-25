(: answer for 1.2:)

let $finalz := 
let $final :=
let $first := 

for $i in doc('/db/books.xml')//author
for $j in doc("/db/books.xml")//author

for $book1 in $i//book
for $book2 in $j//book
return if ($book1 = $book2 and $i/name != $j/name)
then <book> {<coauthor>{$i/name}</coauthor>}{<author>{$j/name}</author>} {$book1} </book>

let $second := for $i in $first, $j in $first
return if ($i/book != $j/book and $i/coauthor = $j/coauthor and $i/author = $i/author)
then $i

for $y in $second, $z in $second
where $y/book != $z/book and $y/author = $z/author and $y/coauthor = $z/coauthor
return $y

for $p in $final

let $coauthor := $p/coauthor
let $author := $p/author
let $book := $p/book/title

where $author < $coauthor
group by $author, $coauthor, $book
return 
<output> 
<name> {data($author)}</name>
<name> {data($coauthor)} </name>
{$p/book} 
</output>

return <coauthor> {$finalz} </coauthor>

