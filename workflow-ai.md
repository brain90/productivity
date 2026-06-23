# query automation 
dump semua ddl db, masukkan sebagai context
tidak perlu lagi tulis manual sql. cukup bicara dgn bahasa natural:
```
ex: select id, partner.nama, sum(total) dari so yang nilainya antara 2000 s.d 5000. join dgn partner. 

output: 
select 
    id, name, sum(total) 
from 
    so 
join 
    partner on partner.id = so.customer_id 
where 
    price between 2000 and 5000
group by 
    id, name;
```
