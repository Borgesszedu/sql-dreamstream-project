-- Initial Database Population
-- File: data.sql

USE dreamstream;

-- Inserting data into the users table
INSERT INTO users (id,name1, email) VALUES
(DEFAULT,'Alice Silva','alice.silva@email.com'),
(DEFAULT,'Bob Oliveira','bob.oliveira@email.com'),
(DEFAULT,'Charlie Brown','charlie.brown@email.com'),
(DEFAULT,'Diana Pereira','diana.pereira@email.com'),
(DEFAULT,'Eduardo Souza','eduardo.souza@email.com'),
(DEFAULT,'Fernanda Lima','fernanda.lima@email.com'),
(DEFAULT,'Gustavo Rocha','gustavo.rocha@email.com'),
(DEFAULT,'Helena Costa','helena.costa@email.com'),
(DEFAULT,'Igor Martins','igor.martins@email.com'),
(DEFAULT,'Juliana Vargas','juliana.vargas@email.com'),
(DEFAULT,'Kai Silva','kai.silva@email.com'),
(DEFAULT,'Laura Mendes','laura.mendes@email.com'),
(DEFAULT,'Mateus Oliveira','mateus.oliveira@email.com');

-- Inserting data into the movies table
INSERT INTO movies (id,title, release_year, sinopsis) VALUES
(DEFAULT,'Arrival',2016,'A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.'),
(DEFAULT,'Blade Runner 2049',2017,"Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what's left of society into chaos."),
(DEFAULT,'Interstellar',2014,"A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."),
(DEFAULT,'The Shawshank Redemption',1994,'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'),
(DEFAULT,'The Godfather',1972,'An aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
(DEFAULT,'The Dark Knight',2008,'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.'),
(DEFAULT,'Pulp Fiction',1994,"The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption."),
(DEFAULT,"Schindler's List",1993,'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.'),
(DEFAULT,'Forrest Gump',1994, 'The story of a man with a low IQ who accomplished great things in his life and witnessed some of the defining moments of the twentieth century.'),
(DEFAULT,'Inception',2010,'A thief who steals corporate secrets through the use of dream-sharing technology is given his inverse task of planting an idea into the mind of a C.E.O.'),
(DEFAULT,'Fight Club',1999,'An insomniac office worker looking for a way to change his life crosses paths with a devil-may-care soap maker and they form an underground fight club that evolves into something much, much more.'),
(DEFAULT,'The Matrix',1999,'A computer programmer discovers a sinister truth about the reality he perceives and his role in the war against its controllers.'),
(DEFAULT,'Goodfellas',1990,'The story of Henry Hill and his life in the mob, covering his relationship with his partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.');

-- Inserting data into the series table
INSERT INTO series (id,title, release_year, sinopsis) VALUES
(DEFAULT,'Dark',2017,'The disappearance of two young children in the German town of Winden reveals the dark secrets of four families connected by a supernatural mystery.'),
(DEFAULT,'Stranger Things', 2016, 'When a young boy vanishes, his mother, a police chief, and his friends must confront terrifying supernatural forces in order to get him back.'),
(DEFAULT,"The Queen's Gambit",2020,"Orphaned in the 1950s, a chess prodigy in a Kentucky girl's orphanage learns the game and battles addiction while trying to become the greatest chess player in the world."),
(DEFAULT,'Breaking Bad',2008,"A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's financial future."),
(DEFAULT,'Game of Thrones',2011,'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.'),
(DEFAULT,'The Sopranos',1999,'New Jersey mob boss Tony Soprano deals with personal and professional issues in his home and business life that affect his mental state, leading him to seek psychiatric counseling.'),
(DEFAULT,'The Wire',2002,'Seen through the eyes of drug dealers and law enforcement, the series explores and depicts the culture of inner-city Baltimore.'),
(DEFAULT,'Mad Men',2007,"A drama about one of New York's most prestigious ad agencies at the beginning of the 1960s, focusing on one of the firm's most mysterious but extremely talented ad executives, Don Draper."),
(DEFAULT,'The Office (US)', 2005, 'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, and tedium.'),
(DEFAULT,'Friends', 1994, 'Follows the personal and professional lives of six twenty to thirty-something year-olds living in Manhattan.'),
(DEFAULT,'Seinfeld', 1989, 'A comedian and his three friends in New York City get into everyday situations dealing with the minutiae of life, often making mountains out of molehills.'),
(DEFAULT,'The West Wing', 1999, 'Inside the lives of staffers in the West Wing of the White House.'),
(DEFAULT,'Peaky Blinders', 2013, 'A gangster family epic set in 1919 Birmingham, England, centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.');

-- Inserting data into the episodes table
INSERT INTO episodes (serie_id, title, season_number, episode_number, sinopsis) VALUES
((SELECT id FROM series WHERE title = 'Dark'), 'Secrets', 1, 1, 'In 2019, the disappearance of a boy leads to four families searching for answers. What they uncover is a mind-bending mystery that spans three generations.'),
((SELECT id FROM series WHERE title = 'Dark'), 'Lies', 1, 2, 'While the police investigate the disappearance, Ulrich visits a disturbed old man, and Charlotte suspects something is wrong at her home.'),
((SELECT id FROM series WHERE title = 'Stranger Things'), 'The Vanishing of Will Byers', 1, 1, "As a frantic Joyce searches for her missing son Will, Police Chief Hopper begins his own investigation and several of Will's friends make a startling discovery."),
((SELECT id FROM series WHERE title = 'Stranger Things'), 'The Weirdo on Maple Street', 1, 2, 'Haunted by flashbacks and increasingly disturbed, Eleven tries to communicate with Will, and the boys enlist her help to find their missing friend.'),
((SELECT id FROM series WHERE title = "The Queen's Gambit"), 'Openings', 1, 1, 'In a 1950s Kentucky orphanage, young Beth Harmon discovers she has an astonishing gift for chess while developing an unlikely bond with a fellow orphan.'),
((SELECT id FROM series WHERE title = "The Queen's Gambit"), 'Exchanges', 1, 2, 'As Beth enters her first chess tournament, her talent quickly becomes apparent. Mr. Shaibel makes a decision that will change her life.'),
((SELECT id FROM series WHERE title = 'Breaking Bad'), 'Pilot', 1, 1, 'A high school chemistry teacher with inoperable lung cancer teams up with a former student to manufacture and sell crystal meth.'),
((SELECT id FROM series WHERE title = 'Breaking Bad'), "Cat's in the Bag...", 1, 2, 'Walt and Jesse try to clean up the mess they made, but their problems only escalate when they have to deal with a body and a dangerous associate.'),
((SELECT id FROM series WHERE title = 'Game of Thrones'), 'Winter Is Coming', 1, 1, "Lord Eddard Stark is appointed Hand of the King by his old friend, King Robert Baratheon, prompting him to leave his family and travel south to King's Landing."),
((SELECT id FROM series WHERE title = 'Game of Thrones'), 'The Kingsroad', 1, 2, 'While Bran recovers from his fall, Ned travels south with his daughters. Jon Snow goes to the Wall with his uncle Benjen.'),
((SELECT id FROM series WHERE title = 'The Sopranos'), 'Pilot', 1, 1, 'New Jersey mob boss Tony Soprano starts seeing a psychiatrist to deal with panic attacks.'),
((SELECT id FROM series WHERE title = 'The Sopranos'), '46 Long', 1, 2, "Tony deals with the fallout from his nephew Christopher's first murder, while his mother Livia continues to manipulate him."),
((SELECT id FROM series WHERE title = 'The Wire'), 'The Target', 1, 1, 'After a drug dealer gets away with murder, Detective Jimmy McNulty goes outside his chain of command to get a detail to investigate Avon Barksdale and his drug operation.'),
((SELECT id FROM series WHERE title = 'The Wire'), 'The Detail', 1, 2, 'The detail starts its surveillance, but quickly runs into problems with resources and cooperation from their own department.'),
((SELECT id FROM series WHERE title = 'Mad Men'), 'Smoke Gets in Your Eyes', 1, 1, 'In 1960s New York, advertising executive Don Draper struggles to balance his personal and professional life as his firm tries to land the Lucky Strike account.'),
((SELECT id FROM series WHERE title = 'Mad Men'), 'Ladies Room', 1, 2, 'Peggy gets an unexpected promotion, while Don tries to keep his personal life separate from his work.'),
((SELECT id FROM series WHERE title = 'The Office (US)'), 'Pilot', 1, 1, 'Regional manager Michael Scott tries to make friends with the new temp, Ryan Howard, while the documentary crew begins filming the employees of Dunder Mifflin.'),
((SELECT id FROM series WHERE title = 'The Office (US)'), 'Diversity Day', 1, 2, "Michael's insensitive remarks at a corporate diversity seminar force the Stamford branch's diversity officer to hold a diversity training day at the Scranton branch."),
((SELECT id FROM series WHERE title = 'Friends'), 'The One Where Monica Gets a Roommate', 1, 1, "Monica's life is turned upside down when Rachel, a runaway bride and her old best friend from high school, suddenly appears at Central Perk."),
((SELECT id FROM series WHERE title = 'Friends'), 'The One with the Sonogram at the End', 1, 2, "Monica is upset when everyone makes a bigger deal out of Carol and Ross's baby than her new relationship with Paul the Wine Guy."),
((SELECT id FROM series WHERE title = 'Seinfeld'), 'The Pilot', 1, 1, 'Jerry and George discuss the intricacies of dating while waiting for a woman Jerry met in Michigan to arrive in New York.'),
((SELECT id FROM series WHERE title = 'Seinfeld'), 'The Stake Out', 1, 2, 'Jerry and Elaine pretend to be married in order to spy on a woman Jerry saw at a movie theater.'),
((SELECT id FROM series WHERE title = 'The West Wing'), 'Pilot', 1, 1, 'President-elect Josiah Bartlet and his senior staff deal with a crisis in Haiti and prepare for the inaugural address.'),
((SELECT id FROM series WHERE title = 'The West Wing'), 'Post Hoc, Ergo Propter Hoc', 1, 2, 'Toby Ziegler faces scrutiny after a memo he wrote criticizing the President leaks to the press.'),
((SELECT id FROM series WHERE title = 'Peaky Blinders'), 'Series 1, Episode 1', 1, 1, 'In 1919 Birmingham, a war hero returns home to find his family running the streets and a ruthless police chief arrives to clean up the city.'),
((SELECT id FROM series WHERE title = 'Peaky Blinders'), 'Series 1, Episode 2', 1, 2, 'Thomas Shelby makes a daring move against his rivals and deals with the unexpected return of a woman from his past.');

-- Inserting data into the genders table
INSERT INTO genders (id,name1) VALUES
(DEFAULT,'Science Fiction'),
(DEFAULT,'Drama'),
(DEFAULT,'Thriller'),
(DEFAULT,'Mystery'),
(DEFAULT,'Horror'),
(DEFAULT,'Action'),
(DEFAULT,'Crime'),
(DEFAULT,'Biography'),
(DEFAULT,'Romance'),
(DEFAULT,'Comedy'),
(DEFAULT,'Fantasy'),
(DEFAULT,'History'),
(DEFAULT,'Political');

-- Inserting data into the actors table
INSERT INTO actors (id,name1) VALUES
(DEFAULT,'Amy Adams'),
(DEFAULT,'Ryan Gosling'),
(DEFAULT,'Matthew McConaughey'),
(DEFAULT,'Louis Hofmann'),
(DEFAULT,'Millie Bobby Brown'),
(DEFAULT,'Anya Taylor-Joy');

-- Inserting data into the directors table
INSERT INTO directors (id,name1) VALUES
(DEFAULT,'Denis Villeneuve'),
(DEFAULT,'Christopher Nolan'),
(DEFAULT,'Baran bo Odar'),
(DEFAULT,'Shawn Levy'),
(DEFAULT,'Scott Frank');

-- Relating Movies with Genders (moviesgenders)
INSERT INTO moviesgenders (movie_id, gender_id) VALUES
((SELECT id FROM movies WHERE title = 'Arrival'), (SELECT id FROM genders WHERE name1 = 'Science Fiction')),
((SELECT id FROM movies WHERE title = 'Arrival'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = 'Blade Runner 2049'), (SELECT id FROM genders WHERE name1 = 'Science Fiction')),
((SELECT id FROM movies WHERE title = 'Blade Runner 2049'), (SELECT id FROM genders WHERE name1 = 'Thriller')),
((SELECT id FROM movies WHERE title = 'Interstellar'), (SELECT id FROM genders WHERE name1 = 'Science Fiction')),
((SELECT id FROM movies WHERE title = 'Interstellar'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = 'The Shawshank Redemption'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = 'The Godfather'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = 'The Godfather'), (SELECT id FROM genders WHERE name1 = 'Thriller')),
((SELECT id FROM movies WHERE title = 'The Dark Knight'), (SELECT id FROM genders WHERE name1 = 'Action')),
((SELECT id FROM movies WHERE title = 'The Dark Knight'), (SELECT id FROM genders WHERE name1 = 'Crime')),
((SELECT id FROM movies WHERE title = 'Pulp Fiction'), (SELECT id FROM genders WHERE name1 = 'Crime')),
((SELECT id FROM movies WHERE title = 'Pulp Fiction'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = "Schindler's List"), (SELECT id FROM genders WHERE name1 = 'Biography')),
((SELECT id FROM movies WHERE title = "Schindler's List"), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = 'Forrest Gump'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = 'Forrest Gump'), (SELECT id FROM genders WHERE name1 = 'Romance')),
((SELECT id FROM movies WHERE title = 'Inception'), (SELECT id FROM genders WHERE name1 = 'Science Fiction')),
((SELECT id FROM movies WHERE title = 'Inception'), (SELECT id FROM genders WHERE name1 = 'Thriller')),
((SELECT id FROM movies WHERE title = 'Fight Club'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM movies WHERE title = 'Fight Club'), (SELECT id FROM genders WHERE name1 = 'Thriller')),
((SELECT id FROM movies WHERE title = 'The Matrix'), (SELECT id FROM genders WHERE name1 = 'Science Fiction')),
((SELECT id FROM movies WHERE title = 'The Matrix'), (SELECT id FROM genders WHERE name1 = 'Action')),
((SELECT id FROM movies WHERE title = 'Goodfellas'), (SELECT id FROM genders WHERE name1 = 'Crime')),
((SELECT id FROM movies WHERE title = 'Goodfellas'), (SELECT id FROM genders WHERE name1 = 'Drama'));

-- Relating Series with Genders (seriesgenders)
INSERT INTO seriesgenders (serie_id, gender_id) VALUES
((SELECT id FROM series WHERE title = 'Dark'), (SELECT id FROM genders WHERE name1 = 'Mystery')),
((SELECT id FROM series WHERE title = 'Dark'), (SELECT id FROM genders WHERE name1 = 'Thriller')),
((SELECT id FROM series WHERE title = 'Stranger Things'), (SELECT id FROM genders WHERE name1 = 'Science Fiction')),
((SELECT id FROM series WHERE title = 'Stranger Things'), (SELECT id FROM genders WHERE name1 = 'Horror')),
((SELECT id FROM series WHERE title = "The Queen's Gambit"), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'Breaking Bad'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'Breaking Bad'), (SELECT id FROM genders WHERE name1 = 'Crime')),
((SELECT id FROM series WHERE title = 'Game of Thrones'), (SELECT id FROM genders WHERE name1 = 'Fantasy')),
((SELECT id FROM series WHERE title = 'Game of Thrones'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'The Sopranos'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'The Sopranos'), (SELECT id FROM genders WHERE name1 = 'Crime')),
((SELECT id FROM series WHERE title = 'The Wire'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'The Wire'), (SELECT id FROM genders WHERE name1 = 'Crime')),
((SELECT id FROM series WHERE title = 'Mad Men'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'Mad Men'), (SELECT id FROM genders WHERE name1 = 'History')),
((SELECT id FROM series WHERE title = 'The Office (US)'), (SELECT id FROM genders WHERE name1 = 'Comedy')),
((SELECT id FROM series WHERE title = 'Friends'), (SELECT id FROM genders WHERE name1 = 'Comedy')),
((SELECT id FROM series WHERE title = 'Friends'), (SELECT id FROM genders WHERE name1 = 'Romance')),
((SELECT id FROM series WHERE title = 'Seinfeld'), (SELECT id FROM genders WHERE name1 = 'Comedy')),
((SELECT id FROM series WHERE title = 'The West Wing'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'The West Wing'), (SELECT id FROM genders WHERE name1 = 'Political')),
((SELECT id FROM series WHERE title = 'Peaky Blinders'), (SELECT id FROM genders WHERE name1 = 'Drama')),
((SELECT id FROM series WHERE title = 'Peaky Blinders'), (SELECT id FROM genders WHERE name1 = 'Crime')),
((SELECT id FROM series WHERE title = 'Peaky Blinders'), (SELECT id FROM genders WHERE name1 = 'History'));

-- Relating Movies with Actors (actorsmovies)
INSERT INTO actorsmovies (movie_id, actor_id) VALUES
((SELECT id FROM movies WHERE title = 'Arrival'), (SELECT id FROM actors WHERE name1 = 'Amy Adams')),
((SELECT id FROM movies WHERE title = 'Blade Runner 2049'), (SELECT id FROM actors WHERE name1 = 'Ryan Gosling')),
((SELECT id FROM movies WHERE title = 'Interstellar'), (SELECT id FROM actors WHERE name1 = 'Matthew McConaughey'));

-- Relating Series with Actors (actorsseries)
INSERT INTO actorsseries (serie_id, actor_id) VALUES
((SELECT id FROM series WHERE title = 'Dark'), (SELECT id FROM actors WHERE name1 = 'Louis Hofmann')),
((SELECT id FROM series WHERE title = 'Stranger Things'), (SELECT id FROM actors WHERE name1 = 'Millie Bobby Brown')),
((SELECT id FROM series WHERE title = "The Queen's Gambit"), (SELECT id FROM actors WHERE name1 = 'Anya Taylor-Joy'));

-- Relating Movies with Directors (directorsmovies)
INSERT INTO directorsmovies (movie_id, director_id) VALUES
((SELECT id FROM movies WHERE title = 'Arrival'), (SELECT id FROM directors WHERE name1 = 'Denis Villeneuve')),
((SELECT id FROM movies WHERE title = 'Blade Runner 2049'), (SELECT id FROM directors WHERE name1 = 'Denis Villeneuve')),
((SELECT id FROM movies WHERE title = 'Interstellar'), (SELECT id FROM directors WHERE name1 = 'Christopher Nolan'));

-- Relating Series with Directors (directorsseries)
INSERT INTO directorsseries (serie_id, director_id) VALUES
((SELECT id FROM series WHERE title = 'Dark'), (SELECT id FROM directors WHERE name1 = 'Baran bo Odar')),
((SELECT id FROM series WHERE title = 'Stranger Things'), (SELECT id FROM directors WHERE name1 = 'Shawn Levy')),
((SELECT id FROM series WHERE title = "The Queen's Gambit"), (SELECT id FROM directors WHERE name1 = 'Scott Frank'));

-- Inserting data into viewhistory
INSERT INTO viewhistory (user_id, content_id, content_type) VALUES
((SELECT id FROM users WHERE name1 = 'Alice Silva'), (SELECT id FROM movies WHERE title = 'Arrival'), 'Movie'),
((SELECT id FROM users WHERE name1 = 'Alice Silva'), (SELECT id FROM series WHERE title = 'Dark'), 'Serie'),
((SELECT id FROM users WHERE name1 = 'Bob Oliveira'), (SELECT id FROM movies WHERE title = 'Blade Runner 2049'), 'Movie');

