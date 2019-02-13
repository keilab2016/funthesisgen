BEGIN{
	title="";
	author="";
	id="";
	teacher="";
	etitle="";
	eauthor="";
	eteacher="";
	kauthor="";
}
/^ *$/{
	if (buff~/卒業論文/ || buff~/BA Thesis/) {
	} else if (title~/^$/) {
		title=buff;
	} else if (title!~/^$/ && author~/^$/) {
		author=buff;
	} else if (buff~/.*学科 *([0-9]+)/) {
		match(buff,/([0-9]+)/);
		id=substr(buff,RSTART,RLENGTH);
	} else if (buff~/提出日/ || buff~/^ *$/) {
	} else if (etitle~/^$/) {
		gsub(/by$/,"",buff);
		etitle=buff;
	} else if (etitle!~/^$/ && eauthor~/^$/) {
		eauthor=buff;
	} else {
		print buff;
	}
	buff="";
}
{
	gsub(/^ +/,"");
	gsub(/ +$/,"");
	if ($0~/指導教員/) {
		gsub(/ *指導教員 */,"");
		teacher=$0;
	} else if ($0~/Advisor: (.*)/) {
		gsub(/ *Advisor: /,"");
		eteacher=$0;
		nextfile;
	} else {
		buff=buff $0;
	}
}
END{
	printf("%s,%s,%s,%s,%s,%s,%s,%s",id,author,eauthor,kauthor,teacher,eteacher,title,etitle);
}
