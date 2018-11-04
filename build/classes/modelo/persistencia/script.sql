drop database if exists compra;
create database compra;
use compra;

create table Conta (
    idConta         int             primary key    auto_increment,
    usuario         varchar(15)     unique,
    senha           varchar(15),
    perfil          varchar(15),
    saldo           int
);

create table Pessoa (
    idPessoa        int             primary key    auto_increment,
	nome            varchar(15),
	email           varchar(20),
	sexo            varchar(15),
	telefone        varchar(15),
	cep             varchar(15),
	nascimento      date,
	conta           int             unique,
    foreign key (conta) references Conta (idConta) ON DELETE CASCADE
);

create table Acesso (
    idAcesso        int             primary key    auto_increment,
    nome            varchar(20),
    ip              varchar(20),
    data            timestamp,
	conta           int,
    foreign key (conta) references Conta (idConta) ON DELETE CASCADE
);

create table Transacao (
    idTransacao     int             primary key    auto_increment,
    operacao        varchar(20),
    valor           int,
    data            timestamp,
    contaLocal      int,
    contaDestino    int,
    foreign key (contaLocal) references Conta (idConta) ON DELETE CASCADE,
    foreign key (contaDestino) references Conta (idConta) ON DELETE CASCADE
);

create table Filme (
	idFilme 		int 			primary key 	auto_increment,
	poster 			varchar(99),
	titulo 			varchar(99),
	genero 			varchar(99),
	protagonista 	varchar(99),
	diretor 		varchar(99),
	lancamento      int,
	preco 			int,
	estoque         int
);

create table Compra (
    idCompra        int             primary key    auto_increment,
    quantidade      int,
    status          varchar(50),
    data            timestamp,
    conta           int,
    filme           int,
    foreign key (conta) references Conta (idConta) ON DELETE CASCADE,
    foreign key (filme) references Filme (idFilme) ON DELETE CASCADE
);

create table Mensagem (
    idMensagem      int             primary key    auto_increment,
    texto           varchar(140),
    data            timestamp,
    visualizada     varchar(3),
    remetente       int,
    destinatario    int,
    foreign key (remetente) references Conta (idConta) ON DELETE CASCADE,
    foreign key (destinatario) references Conta (idConta) ON DELETE CASCADE
);

insert into Conta values
(1,'123','123','Administrador',0),
(2,'qwe','qwe','Cliente',400),
(3,'asd','asd','Cliente',400),
(4,'zxc','zxc','Cliente',400),
(5,'qaz','qaz','Cliente',400),
(6,'wsx','wsx','Cliente',400),
(7,'edc','edc','Cliente',400);

insert into Pessoa values
(1,'123','123@123123','Masculino','2111111111','21550530','2016-06-09',1),
(2,'qwe','qwe@qweqwe','Masculino','2111111111','21550530','2016-06-09',2),
(3,'asd','asd@asdasd','Masculino','2122222222','21550530','2016-06-07',3),
(4,'zxc','zxc@zxczxc','Masculino','2133333333','21550530','2016-06-05',4),
(5,'qaz','qaz@qazqaz','Feminino','2144444444','21550530','2016-06-03',5),
(6,'wsx','wsx@wsxwsx','Feminino','2155555555','21550530','2015-06-09',6),
(7,'edc','edc@edcedc','Feminino','2166666666','21550530','2014-06-01',7);

INSERT INTO Filme VALUES
(null,'Snow White and the Seven Dwarfs 1937.jpg','Snow White and the Seven Dwarfs','Animation',null,'William Cottrell',1937,77,10),
(null,'The Lion King 1994.jpg','The Lion King','Animation',null,'Roger Allers e Rob Minkoff',1994,85,10),
(null,'Pocahontas 1995.jpg','Pocahontas','Animation',null,'Mike Gabriel e Eric Goldberg',1995,66,10),
(null,'Toy Story 3 2010.jpg','Toy Story 3','Animation',null,'Lee Unkrich',2010,84,10),
(null,'Hercules 1997.jpg','Hercules','Animation',null,'Ron Clements',1997,72,10),
(null,'Tarzan 1999.jpg','Tarzan','Animation',null,'Chris Buck',1999,72,10),
(null,'Finding Nemo 2003.jpg','Finding Nemo','Animation',null,'Andrew Stanton',2003,82,10),
(null,'WALL�E 2008.jpg','WALL�E','Animation',null,'Andrew Stanton',2008,84,10),
(null,'How To Train Your Dragon 2010.jpg','How To Train Your Dragon','Animation',null,'Dean DeBlois',2010,82,10),
(null,'The Croods 2013.jpg','The Croods','Animation',null,'Kirk De Micco',2013,73,10),
(null,'Frozen 2013.jpg','Frozen','Animation',null,'Chris Buck',2013,77,10),
(null,'Inside Out 2015.jpg','Inside Out','Animation',null,'Pete Docter',2015,85,10),

(null,'Grave of the Fireflies 1988.jpg','Grave of the Fireflies','Animation',null,'Isao Takahata',1988,85,10),
(null,'Ghost 1995.jpg','Ghost in the Shell','Animation',null,'Mamoru Oshii',1995,80,10),
(null,'Pokemon 1997.jpg','Pokemon','Animation',null,'Kunihiko Yuyama',1997,74,10),
(null,'Digimon 1999.jpg','Digimon','Animation',null,'Hiroyuki Kakudo',1999,70,10),
(null,'Spirited Away 2001.jpg','Spirited Away','Animation',null,'Hayao Miyazaki',2001,86,10),
(null,'Pokemon O Filme 1998.jpg','Pokemon O Filme','Animation',null,'Kunihiko Yuyama',1998,58,10),
(null,'Dragon Ball Z 1996.jpg','Dragon Ball Z','Animation',null,null,1996,89,10),
(null,'Naruto Shippuden 2007.jpg','Naruto Shippuden','Animation',null,null,2007,84,10),
(null,'Wolf Children 2012.jpg','Wolf Children','Animation',null,null,2012,82,10),


(null,'Back to the Future 1985.jpg','Back to the Future','Comedy','Michael J Fox','Robert Zemeckis',1985,85,10),
(null,'Ferris Buellers Day Off 1986.jpg','Ferris Buellers Day Off','Comedy','Matthew Broderick','John Hughes',1986,79,10),
(null,'Home Alone 1990.jpg','Home Alone','Comedy','Macaulay Culkin','Chris Columbus',1990,74,10),
(null,'The Big Lebowski 1998.jpg','The Big Lebowski','Comedy','Jeff Bridges','Joel Coen',1998,82,10),
(null,'Bad Boys 1995.jpg','Bad Boys','Comedy','Will Smith e Martin Lawrence','Michael Bay',1995,68,10),
(null,'Rush Hour 1998.jpg','Rush Hour','Comedy','Jackie Chan e Chris Tucker','Brett Ratner',1998,69,10),
(null,'American Pie 1999.jpg','American Pie','Comedy','Jason Biggs','Paul Weitz',1999,70,10),
(null,'Scary Movie 2000.jpg','Scary Movie','Comedy','Anna Faris e Jon Abrahams','Keenen Ivory Wayans',2000,62,10),
(null,'The School of Rock 2003.jpg','The School of Rock','Comedy','Jack Black','Richard Linklater',2003,71,10),
(null,'White Chicks 2004.jpg','White Chicks','Comedy','Marlon Wayans e Shawn Wayans','Keenen Ivory Wayans',2004,53,10),
(null,'Mean Girls 2004.jpg','Mean Girls','Comedy','Lindsay Lohan','Mark Waters',2004,70,10),
(null,'Mr. & Mrs. Smith 2005.jpg','Mr. & Mrs. Smith','Comedy','Brad Pitt e Angelina Jolie','Doug Liman',2005,65,10),
(null,'The 40 Year Old Virgin 2005.jpg','The 40 Year Old Virgin','Comedy','Steve Carell','Judd Apatow',2005,72,10),
(null,'Click 2006.jpg','Click','Comedy','Adam Sandler','Frank Coraci',2006,64,10),
(null,'Little Miss Sunshine 2006.jpg','Little Miss Sunshine','Comedy','Abigail Breslin','Jonathan Dayton',2006,79,10),
(null,'Night at the Museum 2006.jpg','Night at the Museum','Comedy','Ben Stiller','Shawn Levy',2006,64,10),
(null,'Superbad 2007.jpg','Superbad','Comedy','Michael Cera e Jonah Hill','Greg Mottola',2007,76,10),
(null,'Funny People 2009.jpg','Funny People','Comedy','Adam Sandler','Judd Apatow',2009,64,10),
(null,'Zombieland 2009.jpg','Zombieland','Comedy','Jesse Eisenberg','Ruben Fleischer',2009,77,10),
(null,'The Hangover 2009.jpg','The Hangover','Comedy','Zach Galifianakis','Todd Phillips',2009,78,10),
(null,'Horrible Bosses 2011.jpg','Horrible Bosses','Comedy','Jason Bateman, Charlie Day, Jason Sudeikis','Seth Gordon',2011,69,10),
(null,'Friends With Benefits 2011.jpg','Friends With Benefits','Comedy','Mila Kunis e Justin Timberlake','Will Gluck',2011,66,10),
(null,'God Bless America 2011.jpg','God Bless America','Comedy','Joel Murray e Tara Lynne Barr','Bobcat Goldthwait',2011,73,10),
(null,'Ted 2012.jpg','Ted','Comedy','Mark Wahlberg','Seth MacFarlane',2012,70,10),
(null,'This Means War 2012.jpg','This Means War','Comedy','Reese Witherspoon','McG',2012,64,10),
(null,'Rock of Ages 2012.jpg','Rock of Ages','Comedy','Julianne Hough e Diego Boneta','Adam Shankman',2012,59,10),
(null,'Were the Millers 2013.jpg','Were the Millers','Comedy','Jason Sudeikis','Rawson Marshall Thurber',2013,71,10),
(null,'The Internship 2013.jpg','The Internship','Comedy','Vince Vaughn e Owen Wilson','Shawn Levy',2013,63,10),
(null,'The Wolf of Wall Street 2013.jpg','The Wolf of Wall Street','Comedy','Leonardo DiCaprio','Martin Scorsese',2013,82,10),


(null,'Blade 1998.jpg','Blade','BasedOnHQ','Wesley Snipes','Stephen Norrington',1998,71,10),
(null,'Road to Predition 2002.jpg','Road to Predition','BasedOnHQ','Tom Hanks','Sam Mendes',2002,77,10),
(null,'The Amazing Spider-Man 2012.jpg','The Amazing Spider-Man','BasedOnHQ','Andrew Garfield','Marc Webb',2012,71,10),
(null,'V For Vendetta 2005.jpg','V For Vendetta','BasedOnHQ','Hugo Weaving e Natalie Portman','James McTeigue',2005,82,10),
(null,'Constantine 2005.jpg','Constantine','BasedOnHQ','Keanu Reeves','Francis Lawrence',2005,69,10),
(null,'The Dark Knight 2008.jpg','The Dark Knight','BasedOnHQ','Christian Bale','Christopher Nolan',2008,90,10),
(null,'The Fountian 2006.jpg','The Fountian','BasedOnHQ','Hugh Jackman','Darren Aronofsky',2006,73,10),
(null,'300 2006.jpg','300','BasedOnHQ','Gerard Butler','Zack Snyder',2006,78,10),
(null,'Watchmen 2009.jpg','Watchmen','BasedOnHQ','Billy Crudup','Zack Snyder',2009,76,10),
(null,'Kick-Ass 2010.jpg','Kick-Ass','BasedOnHQ','Aaron Taylor-Johnson','Matthew Vaughn',2010,77,10),
(null,'X-Men Days of Future Past 2014.jpg','X-Men, Days of Future Past','BasedOnHQ','Patrick Stewart e Ian McKellen','Bryan Singer',2014,81,10),
(null,'Dredd 2012.jpg','Dredd','BasedOnHQ','Karl Urban','Pete Travis',2012,70,10),
(null,'Man of Steel 2013.jpg','Man of Steel','BasedOnHQ','Henry Cavill','Zack Snyder',2013,72,10),
(null,'Deadpool 2016.jpg','Deadpool','BasedOnHQ','Ryan Reynolds','Tim Miller',2016,84,10),

(null,'The Avengers 2012.jpg','The Avengers','BasedOnHQ','Robert Downey Jr','Joss Whedon',2012,82,10),
(null,'Iron Man 3 2013.jpg','Iron Man 3','BasedOnHQ','Robert Downey Jr','Jon Favreau',2013,79,10),
(null,'Captain America, The Winter Soldier 2014.jpg','Captain America, The Winter Soldier','BasedOnHQ','Chris Evans','Anthony Russo',2014,78,10),
(null,'Guardians of the Galaxy 2014.jpg','Guardians of the Galaxy','BasedOnHQ','Chris Pratt','James Gunn',2014,82,10),


(null,'Full Metal Jacket 1987.jpg','Full Metal Jacket','Action','Matthew Modine','Stanley Kubrick',1987,83,10),
(null,'Die Hard 1988.jpg','Die Hard','Action','Bruce Willis','John McTiernan',1988,83,10),
(null,'1996 - Mission Impossible.jpg','Mission Impossible','Action','Tom Cruise','Brian De Palma',1996,71,10),
(null,'Braveheart 1995.jpg','Braveheart','Action','Mel Gibson','Mel Gibson',1995,84,10),
(null,'Heat 1995.jpg','Heat','Action','Al Pacino e Robert De Niro','Michael Mann',1995,83,10),
(null,'Se7en 1995.jpg','Se7en','Action','Morgan Freeman e Brad Pitt','David Fincher',1995,87,10),
(null,'Saving Private Ryan 1998.jpg','Saving Private Ryan','Action','Tom Hanks','Steven Spielberg',1998,86,10),
(null,'Gladiator 2000.jpg','Gladiator','Action','Russell Crowe','Ridley Scott',2000,85,10),
(null,'2002 - Identity.jpg','The Bourne Identity ','Action','Matt Damon','Doug Liman',2002,79,10),
(null,'2002 - The Transporter.jpg','The Transporter','Action','Jason Statham','Louis Leterrier',2002,68,10),
(null,'Training Day 2001.jpg','Training Day','Action','Denzel Washington','Antoine Fuqua',2001,77,10),
(null,'Man on Fire 2004.jpg','Man on Fire','Action','Denzel Washington','Tony Scott',2004,78,10),
(null,'Alexander 2004.jpg','Alexander','Action','Colin Farrell','Oliver Stone',2004,55,10),
(null,'Troy 2004.jpg','Troy','Action','Brad Pitt','Wolfgang Petersen',2004,72,10),
(null,'The Departed 2006.jpg','The Departed','Action','Leonardo DiCaprio','Martin Scorsese',2006,85,10),
(null,'Tropa de Elite 2 2010.jpg','Tropa de Elite 2','Action','Wagner Moura','Jos� Padilha',2010,81,10),
(null,'IP Man 2008.jpg','IP Man','Action','Donnie Yen','Wilson Yip',2008,81,10),
(null,'Rambo 2008.jpg','Rambo','Action','Sylvester Stallone','Sylvester Stallone',2008,71,10),
(null,'24 2008.jpg','24','Action','Kiefer Sutherland','Jon Cassar',2008,75,10),
(null,'Taken 2008.jpg','Taken','Action','Liam Neeson','Pierre Morel',2008,79,10),
(null,'The Raid 2011.jpg','The Raid','Action','Iko Uwais','Gareth Evans',2011,76,10),
(null,'2010 - The Expendables.jpg','The Expendables','Action','Sylvester Stallone','Sylvester Stallone',2010,65,10),
(null,'Safe House 2012.jpg','Safe House','Action','Denzel Washington','Daniel Espinosa',2012,68,10),
(null,'RoboCop 2014.jpg','RoboCop','Action','Joel Kinnaman','Jos� Padilha',2014,63,10),
(null,'Fury 2014.jpg','Fury','Action','Brad Pitt','David Ayer',2014,77,10),
(null,'2015 - Fast and Furious 7.jpg','Fast and Furious','Action','Vin Diesel e Paul Walker','James Wan',2015,76,10),
(null,'Mad Max - Fury Road 2015.jpg','Mad Max - Fury Road','Action','Tom Hardy, Charlize Theron','George Miller',2015,84,10),


(null,'Forrest Gump 1994.jpg','Forrest Gump','FeelGood','Tom Hanks','Robert Zemeckis',1994,88,10),
(null,'Schindlers List 1993.jpg','Schindlers List','FeelGood','Liam Neeson','Steven Spielberg',1993,89,10),
(null,'The Shawshank Redemption 1994.jpg','The Shawshank Redemption','FeelGood','Tim Robbins','Frank Darabont',1994,93,10),
(null,'Its a Wonderful Life 1946.jpg','Its a Wonderful Life','FeelGood','James Stewart','Frank Capra',1946,87,10),
(null,'Stand by me 1986.jpg','Stand by me','FeelGood','Wil Wheaton','Rob Reiner',1986,81,10),
(null,'Dead Poets Society 1989.jpg','Dead Poets Society','FeelGood','Robin Williams','Peter Weir',1989,80,10),
(null,'Groundhog Day 1993.jpg','Groundhog Day','FeelGood','Bill Murray','Harold Ramis',1993,81,10),
(null,'Before Sunrise 1995.jpg','Before Sunrise','FeelGood','Ethan Hawke','Richard Linklater',1995,81,10),
(null,'Good Will Hunting 1997.jpg','Good Will Hunting','FeelGood','Matt Damon','Gus Van Sant',1997,83,10),
(null,'Titanic 1997.jpg','Titanic','FeelGood','Leonardo DiCaprio','James Cameron',1997,77,10),
(null,'Jerry Maguire 1996.jpg','Jerry Maguire','FeelGood','Tom Cruise','Cameron Crowe',1996,73,10),
(null,'A Beautiful Mind 2001.jpg','A Beautiful Mind','FeelGood','Russell Crowe','Ron Howard',2001,82,10),
(null,'Almost Famous 2000.jpg','Almost Famous','FeelGood','Patrick Fugit','Cameron Crowe',2000,79,10),
(null,'Men of Honor 2000.jpg','Men of Honor','FeelGood','Cuba Gooding Jr','George Tillman Jr',2000,71,10),
(null,'Vanilla Sky 2001.jpg','Vanilla Sky','FeelGood','Tom Cruise','Cameron Crowe',2001,69,10),
(null,'I am Sam 2001.jpg','I am Sam','FeelGood','Sean Penn e Dakota Fanning','Jessie Nelson',2001,76,10),
(null,'John Q 2002.jpg','John Q','FeelGood','Denzel Washington','Nick Cassavetes',2002,70,10),
(null,'The Pianist 2002.jpg','The Pianist','FeelGood','Adrien Brody','Roman Polanski',2002,85,10),
(null,'The Last Samurai 2003.jpg','The Last Samurai','FeelGood','Tom Cruise','Edward Zwick',2003,77,10),
(null,'The Pursuit of Happyness 2006.jpg','The Pursuit of Happyness','FeelGood','Will Smith','Gabriele Muccino',2006,79,10),
(null,'Marley & Me 2008.jpg','Marley & Me','FeelGood','Owen Wilson','David Frankel',2008,71,10),
(null,'Hachi - A Dogs Tale 2009.jpg','Hachi - A Dogs Tale','FeelGood','Richard Gere','Lasse Hallstr�m',2009,82,10),
(null,'Love & Other Drugs 2010.jpg','Love & Other Drugs','FeelGood','Jake Gyllenhaal','Edward Zwick',2010,67,10),
(null,'War Horse 2011.jpg','War Horse','FeelGood','Jeremy Irvine','Steven Spielberg',2011,72,10),
(null,'Les Mis�rables 2012.jpg','Les Mis�rables','FeelGood','Hugh Jackman','Tom Hooper',2012,77,10),
(null,'The Perks of Being a Wallflower 2012.jpg','The Perks of Being a Wallflower','FeelGood','Logan Lerman','Stephen Chbosky',2012,81,10),
(null,'About Time 2013.jpg','About Time','FeelGood','Domhnall Gleeson','Richard Curtis',2013,78,10),
(null,'Begin Again 2013.jpg','Begin Again','FeelGood','Keira Knightley e Mark Ruffalo','John Carney',2013,75,10),


(null,'The Godfather 1972.jpg','The Godfather','Drama','Al Pacino','Francis Ford Coppola',1972,92,10),
(null,'Goodfellas 1990.jpg','Goodfellas','Drama','Ray Liotta','Martin Scorsese',1990,87,10),
(null,'Leon The Professional 1994.jpg','Leon The Professional','Drama','Natalie Portman','Luc Besson',1994,86,10),
(null,'The Silence of the Lambs 1991.jpg','The Silence of the Lambs','Drama','Jodie Foster','Jonathan Demme',1991,86,10),
(null,'Basic Instinct 1992.jpg','Basic Instinct','Drama','Michael Douglas','Paul Verhoeven',1992,69,10),
(null,'A Few Good Men 1992.jpg','A Few Good Men','Drama','Tom Cruise','Rob Reiner',1992,76,10),
(null,'Gone with the Wind 1939.jpg','Gone with the Wind','Drama','Vivien Leigh','Victor Fleming',1939,82,10),
(null,'The Green Mile 1999.jpg','The Green Mile','Drama','Tom Hanks','Frank Darabont',1999,85,10),
(null,'American History X 1998.jpg','American History X','Drama','Edward Norton','Tony Kaye',1998,86,10),
(null,'Fight Club 1999.jpg','Fight Club','Drama','Brad Pitt','David Fincher',1999,89,10),
(null,'Gangs of New York 2002.jpg','Gangs of New York','Drama','Leonardo DiCaprio','Martin Scorsese',2002,75,10),
(null,'Million Dollar Baby 2004.jpg','Million Dollar Baby','Drama','Hilary Swank','Clint Eastwood',2004,81,10),
(null,'The Passion of the Christ 2004.jpg','The Passion of the Christ','Drama','Jim Caviezel','Mel Gibson',2004,71,10),
(null,'Hotel Rwanda 2004.jpg','Hotel Rwanda','Drama','Don Cheadle','Terry George',2004,82,10),
(null,'Blood Diamond 2006.jpg','Blood Diamond','Drama','Leonardo DiCaprio','Edward Zwick',2006,80,10),
(null,'The Da Vincis Code 2006.jpg','The Da Vincis Code','Drama','Tom Hanks','Ron Howard',2006,65,10),
(null,'Shutter Island 2010.jpg','Shutter Island','Drama','Leonardo DiCaprio','Martin Scorsese',2010,81,10),
(null,'Cruel Intentions 1999.jpg','Cruel Intentions','Drama','Ryan Phillippe','Roger Kumble',1999,69,10),
(null,'Dogville 2003.jpg','Dogville','Drama','Nicole Kidman','Lars von Trier',2003,80,10),
(null,'Crash 2004.jpg','Crash','Drama','Don Cheadle','Paul Haggis',2004,79,10),
(null,'Mystic River 2003.jpg','Mystic River','Drama','Sean Penn','Clint Eastwood',2003,80,10),
(null,'Rocky Balboa 2006.jpg','Rocky Balboa','Drama','Sylvester Stallone','Sylvester Stallone',2006,72,10),
(null,'Blindness 2008.jpg','Blindness','Drama','Julianne Moore','Fernando Meirelles',2008,66,10),
(null,'Law Abiding Citizen 2009.jpg','Law Abiding Citizen','Drama','Gerard Butler, Jamie Foxx','F Gary Gray',2008,74,10),
(null,'The Help 2011.jpg','The Help','Drama','Emma Stone','Tate Taylor',2011,81,10),
(null,'The Fault in Our Stars 2013.jpg','The Fault in Our Stars','Drama','Shailene Woodley','Josh Boone',2013,80,10),
(null,'The Normal Heart 2014.jpg','The Normal Heart','Drama','Mark Ruffalo','Ryan Murphy',2014,80,10),
(null,'Birdman 2014.jpg','Birdman','Drama','Michael Keaton','Alejandro Gonz�lez I��rritu',2014,80,10),
(null,'Veronica Mars 2014.jpg','Veronica Mars','Drama','Kristen Bell','Rob Thomas',2014,69,10),
(null,'Whiplash 2014.jpg','Whiplash','Drama','Miles Teller','Damien Chazelle',2014,86,10),
(null,'I Origins 2014.jpg','I Origins','Drama','Michael Pitt','Mike Cahill',2014,73,10),


(null,'Episode I The Phantom Menace.jpg','Episode I - The Phantom Menace','Fantasy','Mark Hamill','George Lucas',1999,66,10),
(null,'Episode II Attack of the Clones.jpg','Episode II - Attack of the Clones','Fantasy','Mark Hamill','George Lucas',2002,68,10),
(null,'Episode III Revenge of the Sith.jpg','Episode III - Revenge of the Sith','Fantasy','Mark Hamill','George Lucas',2005,77,10),
(null,'Episode IV A New Hope.jpg','Episode IV A New Hope','Fantasy','Mark Hamill','George Lucas',1977,87,10),
(null,'Episode V The Empire Strikes Back.jpg','Episode V - The Empire Strikes Back','Fantasy','Mark Hamill','George Lucas',1980,88,10),
(null,'Episode VI Return of the Jedi.jpg','Episode VI - Return of the Jedi','Fantasy','Mark Hamill','George Lucas',1983,84,10),
(null,'Episode VII Star Wars The Force Awakens.jpg','Episode VII Star Wars The Force Awakens','Fantasy','Daisy Ridley, John Boyega','JJ Abrams',2015,85,10),
(null,'The Curse of the Black Pearl.jpg','Pirates of the Caribbean The Curse of the Black Pearl','Fantasy','Johnny Depp','Gore Verbinski',2003,81,10),
(null,'Dead Mans Chest.jpg','Pirates of the Caribbean Dead Mans Chest','Fantasy','Johnny Depp','Gore Verbinski',2006,73,10),
(null,'At Worlds End.jpg','Pirates of the Caribbean At Worlds End','Fantasy','Johnny Depp','Gore Verbinski',2007,71,10),
(null,'Avatar 2009.jpg','Avatar','Fantasy','Sam Worthington','James Cameron',2009,79,10),
(null,'Twilight.jpg','Twilight','Fantasy','Kristen Stewart','Catherine Hardwicke',2008,52,10),
(null,'New Moon.jpg','The Twilight Saga New Moon','Fantasy','Kristen Stewart','Catherine Hardwicke',2009,49,10),
(null,'Eclipse.jpg','The Twilight Saga Eclipse','Fantasy','Kristen Stewart','Catherine Hardwicke',2010,56,10),
(null,'Breaking Dawn - Part 1.jpg','The Twilight Saga Breaking Dawn - Part 1','Fantasy','Kristen Stewart','Catherine Hardwicke',2011,52,10),
(null,'Breaking Dawn - Part 2.jpg','The Twilight Saga Breaking Dawn - Part 2','Fantasy','Kristen Stewart','Catherine Hardwicke',2012,52,10),
(null,'and the Sorcerers Stone.jpg','Harry Potter and the Sorcerers Stone','Fantasy','Daniel Radcliffe','Chris Columbus',2001,75,10),
(null,'and the Chamber of Secrets.jpg','Harry Potter and the Chamber of Secrets','Fantasy','Daniel Radcliffe','Chris Columbus',2002,73,10),
(null,'and the Prisoner of Azkaban.jpg','Harry Potter and the Prisoner of Azkaban','Fantasy','Daniel Radcliffe','Chris Columbus',2004,78,10),
(null,'and the Goblet of Fire.jpg','Harry Potter and the Goblet of Fire','Fantasy','Daniel Radcliffe','Chris Columbus',2005,76,10),
(null,'and the Order of the Phoenix.jpg','Harry Potter and the Order of the Phoenix','Fantasy','Daniel Radcliffe','Chris Columbus',2007,74,10),
(null,'and the Half-Blood Prince.jpg','Harry Potter and the Half-Blood Prince','Fantasy','Daniel Radcliffe','Chris Columbus',2009,75,10),
(null,'and the Deathly Hallows - Part 1.jpg','Harry Potter and the Deathly Hallows - Part 1','Fantasy','Daniel Radcliffe','Chris Columbus',2010,77,10),
(null,'and the Deathly Hallows - Part 2.jpg','Harry Potter and the Deathly Hallows - Part 2','Fantasy','Daniel Radcliffe','Chris Columbus',2011,81,10),
(null,'The Fellowship of the Ring.jpg','The Lord of the Rings The Fellowship of the Ring','Fantasy','Elijah Wood','Peter Jackson',2001,88,10),
(null,'The Two Towers.jpg','The Lord of the Rings The Two Towers','Fantasy','Elijah Wood','Peter Jackson',2002,88,10),
(null,'The Return of the King.jpg','The Lord of the Rings The Return of the King','Fantasy','Elijah Wood','Peter Jackson',2003,89,10),
(null,'An Unexpected Journey.jpg','The Hobbit An Unexpected Journey','Fantasy','Martin Freeman','Peter Jackson',2012,80,10),
(null,'The Desolation of Smaug.jpg','The Hobbit The Desolation of Smaug','Fantasy','Martin Freeman','Peter Jackson',2013,80,10),
(null,'The Battle of the Five Armies.jpg','The Hobbit The Battle of the Five Armies','Fantasy','Martin Freeman','Peter Jackson',2014,76,10),


(null,'2001 - A Space Odyssey 1968.jpg','2001 - A Space Odyssey','Sci-Fi','Keir Dullea','Stanley Kubrick',1968,83,10),
(null,'Blade Runner 1982.jpg','Blade Runner','Sci-Fi','Harrison Ford','Ridley Scott',1982,82,10),
(null,'The Terminator 1984.jpg','The Terminator','Sci-Fi','Arnold Schwarzenegger','James Cameron',1984,81,10),
(null,'Jurassic Park 1993.jpg','Jurassic Park','Sci-Fi','Sam Neill','Steven Spielberg',1993,80,10),
(null,'Twelve Monkeys 1995.jpg','Twelve Monkeys','Sci-Fi','Bruce Willis','Terry Gilliam',1995,81,10),
(null,'Species 1995.jpg','Species','Sci-Fi','Natasha Henstridge','Roger Donaldson',1995,58,10),
(null,'Contact 1997.jpg','Contact','Sci-Fi','Jodie Foster','Robert Zemeckis',1997,74,10),
(null,'The Matrix 1999.jpg','The Matrix','Sci-Fi','Keanu Reeves','The Wachowski Brothers',1999,87,10),
(null,'Donnie Darko 2001.jpg','Donnie Darko','Sci-Fi','Jake Gyllenhaal','Richard Kelly',2001,81,10),
(null,'Minority Report 2002.jpg','Minority Report','Sci-Fi','Tom Cruise','Steven Spielberg',2002,77,10),
(null,'Equilibrium 2002.jpg','Equilibrium','Sci-Fi','Christian Bale','Kurt Wimmer',2002,76,10),
(null,'Resident Evil 2002.jpg','Resident Evil','Sci-Fi','Milla Jovovich','Paul WS Anderson',2002,67,10),
(null,'The Butterfly Effect 2004.jpg','The Butterfly Effect','Sci-Fi','Ashton Kutcher','Eric Bress',2004,77,10),
(null,'The Island 2005.jpg','The Island','Sci-Fi','Scarlett Johansson','Michael Bay',2005,69,10),
(null,'Children of Men 2006.jpg','Children of Men','Sci-Fi','Julianne Moore','Alfonso Cuar�n',2006,79,10),
(null,'The Man From Earth 2007.jpg','The Man from Earth','Sci-Fi','David Lee Smith','Richard Schenkman',2007,80,10),
(null,'Moon 2009.jpg','Moon','Sci-Fi','Sam Rockwell','Duncan Jones',2009,80,10),
(null,'Inception 2010.jpg','Inception','Sci-Fi','Leonardo DiCaprio','Christopher Nolan',2010,88,10),
(null,'Star Trek 2009.jpg','Star Trek','Sci-Fi','Chris Pine','JJ Abrams',2009,80,10),
(null,'Prometheus 2012.jpg','Prometheus','Sci-Fi','Noomi Rapace','Ridley Scott',2012,70,10),
(null,'Total Recall 2012.jpg','Total Recall','Sci-Fi','Colin Farrell','Len Wiseman',2013,63,10),
(null,'World War Z 2013.jpg','World War Z','Sci-Fi','Brad Pitt','Marc Forster',2013,70,10),
(null,'Oblivion 2013.jpg','Oblivion','Sci-Fi','Tom Cruise','Joseph Kosinski',2013,70,10),
(null,'Elysium 2013.jpg','Elysium','Sci-Fi','Matt Damon','Neill Blomkamp',2013,67,10),
(null,'Gravity 2013.jpg','Gravity','Sci-Fi','Sandra Bullock','Alfonso Cuar�n',2013,79,10),
(null,'Interstellar 2014.jpg','Interstellar','Sci-Fi','Matthew McConaughey','Christopher Nolan',2014,88,10),
(null,'Lucy 2014.jpg','Lucy','Sci-Fi','Scarlett Johansson','Luc Besson',2014,64,10),
(null,'Ex Machina 2015.jpg','Ex Machina','Sci-Fi','Domhnall Gleeson','Alex Garland',2015,78,10),
(null,'Jurassic World 2015.jpg','Jurassic World','Sci-Fi','Chris Pratt','Colin Trevorrow',2015,72,10),
(null,'Terminator Genisys 2015.jpg','Terminator Genisys','Sci-Fi','Arnold Schwarzenegger, Jason Clarke, Emilia Clarke','Alan Taylor',2015,67,10),

(null,'Psycho 1960.jpg','Psycho','Terror','Anthony Perkins e Janet Leigh','Alfred Hitchcock',1960,86,10),
(null,'The Exorcist 1973.jpg','The Exorcist','Terror','Linda Blair','William Friedkin',1973,80,10),
(null,'Alien 1979.jpg','Alien','Terror','Sigourney Weaver','Ridley Scott',1979,85,10),
(null,'Angel Heart 1987.jpg','Angel Heart','Terror','Mickey Rourke','Alan Parker',1987,62,10),
(null,'Scream 1996.jpg','Scream','Terror','Neve Campbell','Wes Craven',1996,72,10),
(null,'Event Horizon 1997.jpg','Event Horizon','Terror','Laurence Fishburne','Paul WS Anderson',1997,67,10),
(null,'The Sixth Sense 1999.jpg','The Sixth Sense','Terror','Bruce Willis','M Night Shyamalan',1999,82,10),
(null,'Final Destination 2000.jpg','Final Destination','Terror','Devon Sawa','James Wong',2000,67,10),
(null,'Ghost Ship 2002.jpg','Ghost Ship','Terror','Julianna Margulies','Steve Beck',2002,54,10),
(null,'The Ring 2002.jpg','The Ring','Terror','Naomi Watts','Gore Verbinski',2002,71,10),
(null,'Saw 2004.jpg','Saw','Terror','Tobin Bell','James Wan',2004,77,10),
(null,'Shutter 2004.jpg','Shutter','Terror','Ananda Everingham','Banjong Pisanthanakun',2004,71,10),
(null,'The Grudge 2004.jpg','The Grudge','Terror','Sarah Michelle Gellar','Takashi Shimizu',2004,59,10),
(null,'The Exorcism of Emily Rose 2005.jpg','The Exorcism of Emily Rose','Terror','Jennifer Carpenter','Scott Derrickson',2005,67,10),
(null,'Silent Hill 2006.jpg','Silent Hill','Terror','Radha Mitchell','Christophe Gans',2006,66,10),
(null,'The Mist 2007.jpg','The Mist','Terror','Thomas Jane','Frank Darabont',2007,72,10),
(null,'Halloween 2007.jpg','Halloween','Terror','Scout Taylor-Compton','Rob Zombie',2007,61,10),
(null,'Mirrors 2008.jpg','Mirrors','Terror','Kiefer Sutherland','Alexandre Aja',2008,62,10),
(null,'Insidious 2010.jpg','Insidious','Terror','Patrick Wilson e Rose Byrne','James Wan',2010,68,10),
(null,'I Spit on Your Grave 2010.jpg','I Spit on Your Grave','Terror','Sarah Butler','Steven R Monroe',2010,63,10),
(null,'Sinister 2012.jpg','Sinister','Terror','Ethan Hawke','Scott Derrickson',2012,68,10),
(null,'The Cabin in the Woods 2012.jpg','The Cabin in the Woods','Terror','Kristen Connolly','Drew Goddard',2012,70,10),
(null,'Carrie 2013.jpg','Carrie','Terror','Chlo� Grace Moretz','Kimberly Peirce',2013,60,10),
(null,'Mama 2013.jpg','Mama','Terror','Jessica Chastain','Andr�s Muschietti',2013,62,10),
(null,'Evil Dead 2013.jpg','Evil Dead','Terror','Jane Levy','Fede Alvarez',2013,65,10),
(null,'The Conjuring 2013.jpg','The Conjuring','Terror','Patrick Wilson e Vera Farmiga','James Wan',2013,75,10),
(null,'Last Shift 2014.jpg','Last Shift','Terror','Juliana Harkavy','Anthony DiBlasi',2014,55,10),

(null,'The Blair Witch Project 1999.jpg','The Blair Witch Project','Terror','Heather Donahue','Daniel Myrick',1999,64,10),
(null,'Paranormal Activity 2007.jpg','Paranormal Activity','Terror','Katie Featherston','Oren Peli',2007,63,10),
(null,'[Rec] 2007.jpg','[Rec]','Terror','Manuela Velasco','Jaume Balaguer�',2007,75,10),
(null,'Grave Encounters 2011.jpg','Grave Encounters','Terror','Ben Wilkinson','Colin Minihan',2011,61,10),
(null,'As Above, So Below 2014.jpg','As Above, So Below','Terror','Perdita Weeks','John Erick Dowdle',2014,61,10);
