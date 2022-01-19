# LINUX CMD


#### [remove space]:

`cat output.txt | sed -e 's/[\t ]//g;/^$/d'`

#### [read from output.txt line (3) to line (6)]:

`sed -n '3,6p' output.txt`

#### [remove last string in output.txt]:

`sed 's/.\{1\}$//' output.txt `

#### [remove string from output.txt ex:> {"result": <]:

`sed -i -e 's/XXXXXXX//g' output.txt`

`sed -i -e 's/{"result"://g' output.txt `

#### [tested remove `{"result":` and `}` in the end ,]:

`sed -i -e 's/{"result"://g' output.txt && sed 's/.\{1\}$//' output.txt`

#### [find and replace in the end } replace it with ,]:

`sed -i -e 's/{"result"://g' out.txt && sed -i -e 's/.\{1\}$/,/g' out.txt`



#### [find all *.log file and remove]:

`find . -name "*.log" | xargs rm`
