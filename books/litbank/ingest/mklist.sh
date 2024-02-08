wget -O - "https://litteraturbanken.se/api/query/etext?exclude=text,parts,sourcedesc,pages,errata&include=lbworkid,titlepath,sortkey,title,titleid,work_titleid,shorttitle,mediatype,authors.authorid,sort_date_imprint.plain,authors.name_for_index,authors.authortype,startpagename,authors.surname,authors.full_name,authors.type&search=%7B%22query%22:%7B%22bool%22:%7B%22filter%22:%7B%22bool%22:%7B%22must%22:%5B%7B%22term%22:%7B%22has_epub%22:true%7D%7D,%7B%22term%22:%7B%22show%22:true%7D%7D%5D%7D%7D%7D%7D%7D&sort_field=epub_popularity%7Cdesc&to=10000" \
| jq '.data | map("https://litteraturbanken.se/txt/epub/\(.authors[0].authorid)_\(.work_titleid // .titleid).epub")  | .[]' -r \
> sources.txt

