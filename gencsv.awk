BEGIN{
	debug=0;
	title="";
	author="";
	id="";
	teacher="";
	etitle="";
	eauthor="";
	eteacher="";
}
/^ *$/{
	gsub(/^ +/,"",buff);
	gsub(/ +$/,"",buff);
	if (buff~/卒業論文/ || buff~/BA Thesis/) {
	} else if (buff~/修士論文/ || buff~/Master.*s Thesis/ || buff~/研究科/ || buff~/ Thesis at /) {
	} else if (title~/^$/) {
		title=buff;
		if (debug) print "title is " title "\n";
	} else if (buff~/.*学科 *[bg]?([0-9]+)/) {
		match(buff,/([0-9]+)/);
		id=substr(buff,RSTART,RLENGTH);
	} else if (buff~/.*コース *[bg]?([0-9]+)/) {
		match(buff,/([0-9]+)/);
		id=substr(buff,RSTART,RLENGTH);
	} else if (buff~/学科/ || buff~/大学/) {
	} else if (title!~/^$/ && author~/^$/) {
		author=buff;
		gsub(/  +/," ",author);
		if (debug) print "author is " author "\n";
	} else if (buff~/提出日/ || buff~/^ *$/) {
	} else if (etitle~/^$/) {
		etitle=buff;
		if (debug) print "etitle is " etitle "\n";
	} else if (etitle!~/^$/ && eauthor~/^$/) {
		eauthor=buff;
		if (debug) print "eauthor is " eauthor "\n";
	} else {
		print buff;
	}
	buff="";
}
/^ *by *$/{
	next;
}
{
	gsub(/^ +/,"");
	gsub(/ +$/,"");
	if ($0~/指導教員/) {
		gsub(/ *指導教員 */,"");
		gsub(/  +/," ");
		teacher=$0;
		if (debug) print "teacher is " teacher "\n";
	} else if ($0~/Advisor: (.*)/) {
		gsub(/ *Advisor: +/,"");
		gsub(/.*Prof\. /,"");
		eteacher=$0;
		if (debug) print "eteacher is " eteacher "\n";
		nextfile;
	} else if ($0~/Supervisor[:]? (.*)/) {
		gsub(/ *Supervisor[:]? +/,"");
		gsub(/.*Prof\. /,"");
		eteacher=$0;
		if (debug) print "eteacher is " eteacher "\n";
		nextfile;
	} else {
		buff=buff " " $0;
	}
}
END{
	if (id~/^$/) {
		id=FILENAME;
		gsub(/^[bg]/,"",id);
		gsub(/\.txt$/,"",id);
	}
	printf("%s,%s,%s,%s,%s,%s,%s,%s\n",id,author,eauthor,swapname(roma2kana(tolower(eauthor))),teacher,eteacher,title,etitle);
}
function swapname(s) {
	split(s, n);
	return n[2] " " n[1];
}
function roma2kana(s) {

	gsub(/ryo/,"リョ",s);
	gsub(/ryu/,"リュ",s);
	gsub(/rya/,"リャ",s);
	gsub(/rho/,"リョ",s);
	gsub(/rhu/,"リュ",s);
	gsub(/rha/,"リャ",s);

	gsub(/syo/,"ショ",s);
	gsub(/syu/,"シュ",s);
	gsub(/sya/,"シャ",s);
	gsub(/sho/,"ショ",s);
	gsub(/shu/,"シュ",s);
	gsub(/shi/,"シ",s);
	gsub(/sha/,"シャ",s);
	gsub(/cho/,"チョ",s);
	gsub(/chu/,"チュ",s);
	gsub(/chi/,"チ",s);
	gsub(/cha/,"チャ",s);

	gsub(/jyo/,"ジョ",s);
	gsub(/jyu/,"ジュ",s);
	gsub(/jya/,"ジャ",s);
	gsub(/jho/,"ジョ",s);
	gsub(/jhu/,"ジュ",s);
	gsub(/jha/,"ジャ",s);
	gsub(/jo/,"ジョ",s);
	gsub(/je/,"ゼ",s);
	gsub(/ju/,"ジュ",s);
	gsub(/ji/,"ジ",s);
	gsub(/ja/,"ジャ",s);
	gsub(/zo/,"ゾ",s);
	gsub(/ze/,"ゼ",s);
	gsub(/zu/,"ズ",s);
	gsub(/zi/,"ジ",s);
	gsub(/za/,"ザ",s);

	gsub(/dyo/,"デョ",s);
	gsub(/dyu/,"デュ",s);
	gsub(/dya/,"デャ",s);
	gsub(/dho/,"デョ",s);
	gsub(/dhu/,"デュ",s);
	gsub(/dha/,"デャ",s);
	gsub(/do/,"ド",s);
	gsub(/de/,"デ",s);
	gsub(/du/,"ヅ",s);
	gsub(/dhi/,"ディ",s);
	gsub(/di/,"ヂ",s);
	gsub(/da/,"ダ",s);

	gsub(/gyo/,"ギョ",s);
	gsub(/gyu/,"ギュ",s);
	gsub(/gya/,"ギャ",s);
	gsub(/go/,"ゴ",s);
	gsub(/ge/,"ゲ",s);
	gsub(/gu/,"グ",s);
	gsub(/gi/,"ギ",s);
	gsub(/ga/,"ガ",s);

	gsub(/wo/,"ヲ",s);
	gsub(/wa/,"ワ",s);

	gsub(/lo/,"ロ",s);
	gsub(/le/,"レ",s);
	gsub(/lu/,"ル",s);
	gsub(/li/,"リ",s);
	gsub(/la/,"ラ",s);
	gsub(/ro/,"ロ",s);
	gsub(/re/,"レ",s);
	gsub(/ru/,"ル",s);
	gsub(/ri/,"リ",s);
	gsub(/ra/,"ラ",s);

	gsub(/yo/,"ヨ",s);
	gsub(/yu/,"ユ",s);
	gsub(/ya/,"ヤ",s);

	gsub(/mo/,"モ",s);
	gsub(/me/,"メ",s);
	gsub(/mu/,"ム",s);
	gsub(/mi/,"ミ",s);
	gsub(/ma/,"マ",s);

	gsub(/fu/,"フ",s);
	gsub(/ho/,"ホ",s);
	gsub(/he/,"ヘ",s);
	gsub(/hu/,"フ",s);
	gsub(/hi/,"ヒ",s);
	gsub(/ha/,"ハ",s);

	gsub(/no/,"ノ",s);
	gsub(/ne/,"ネ",s);
	gsub(/nu/,"ヌ",s);
	gsub(/ni/,"ニ",s);
	gsub(/na/,"ナ",s);

	gsub(/tsu/,"ツ",s);
	gsub(/to/,"ト",s);
	gsub(/te/,"テ",s);
	gsub(/tu/,"ツ",s);
	gsub(/ti/,"チ",s);
	gsub(/ta/,"タ",s);

	gsub(/so/,"ソ",s);
	gsub(/se/,"セ",s);
	gsub(/su/,"ス",s);
	gsub(/si/,"シ",s);
	gsub(/sa/,"サ",s);

	gsub(/ko/,"コ",s);
	gsub(/ke/,"ケ",s);
	gsub(/ku/,"ク",s);
	gsub(/ki/,"キ",s);
	gsub(/ka/,"カ",s);

	gsub(/o/,"オ",s);
	gsub(/e/,"エ",s);
	gsub(/u/,"ウ",s);
	gsub(/i/,"イ",s);
	gsub(/a/,"ア",s);

	gsub(/nn/,"ン",s);
	gsub(/n/,"ン",s);

	return s;
}
