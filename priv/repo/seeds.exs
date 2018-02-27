# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RockStore.Repo.insert!(%RockStore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RockStore.Repo
alias RockStore.Domain.Band
alias RockStore.Domain.Album

%Band{
  name: "Led Zeppelin",
  location: "England",
  rating: Enum.random(1..100),
  bio: """
  Led Zeppelin are a popular British band best known for their iconic "Stairway to Heaven" as well as for co-creating the music genre of heavy metal. Since their nine albums were recorded between 1968 and 1979, Led Zeppelin has been one of the most popular bands of all time, having sold more than 300 million records and millions of concert tickets worldwide.
  The quartet was conceived at the end of the Hippie love era, in a group marriage of blues, rock and roll, soul, rockabilly, folk ballad, jazz, classical and Eastern music, and something else scattered over some woozy sounds of their songs. It was their mutual artistic stimulation, their group interplay and imagination that incorporated mythology and mysticism, and concocted their inimitable style, and established the concept of album-oriented rock career.
  """,
  albums: [
    %Album{name: "Led Zeppelin", year: 1969},
    %Album{name: "Led Zeppelin II", year: 1969},
    %Album{name: "Led Zeppelin III", year: 1970}
  ]
} |> Repo.insert!

%Band{
  name: "Black Sabbath",
  location: "England",
  rating: Enum.random(1..100),
  bio: """
  Black Sabbath were an English rock band, formed in Birmingham in 1968, by guitarist and main songwriter Tony Iommi, bassist and main lyricist Geezer Butler, singer Ozzy Osbourne, and drummer Bill Ward. Black Sabbath are often cited as pioneers of heavy metal music. The band helped define the genre with releases such as Black Sabbath (1970), Paranoid (1970) and Master of Reality (1971). The band had multiple line-up changes, with Iommi being the only constant member throughout its history.
  Formed in 1968 as the Polka Tulk Blues Band, a blues rock band, the group went through line up changes, renamed themselves as Earth, broke up and reformed. By 1969, they had named themselves Black Sabbath after the film Black Sabbath starring Boris Karloff, and began incorporating occult themes with horror-inspired lyrics and tuned-down guitars. The band's first show as Black Sabbath took place on 30 August 1969, in Workington. Signing to Philips Records in November 1969, they released their first single, "Evil Woman" in January 1970. Their debut album, Black Sabbath, was released on Friday the 13th, February 1970, on Philips' newly formed progressive rock label, Vertigo Records. Though receiving a negative critical response, the album was a commercial success and reached number 8 in the UK Albums Chart, so the band returned to the studios to quickly record the follow up, Paranoid, which was also released in 1970. The band's popularity grew, and by 1973's Sabbath Bloody Sabbath, critics were starting to respond favourably.
  """,
  albums: [
    %Album{name: "Black Sabbath", year: 1970},
    %Album{name: "Paranoid", year: 1970},
    %Album{name: "Master of Reality", year: 1971}
  ]
} |> Repo.insert!

%Band{
  name: "AC/DC",
  location: "Australia",
  rating: Enum.random(1..100),
  bio: """
  AC/DC are an Australian rock band, formed in Sydney in 1973 by brothers Malcolm and Angus Young.[1] A hard rock/blues rock band,[2] their music has also been called heavy metal,[3][4][5][6] although they refer to themselves as "a rock and roll band, nothing more, nothing less".[7]
  AC/DC underwent several line-up changes before releasing their first album, High Voltage, in 1975. Membership subsequently stabilised until bassist Mark Evans was replaced by Cliff Williams in 1977 for the album Powerage. Within months of recording the album Highway to Hell, lead singer and co-songwriter Bon Scott died on 19 February 1980 after a night of heavy alcohol consumption. The group considered disbanding, but buoyed by support from Scott's parents, decided to continue and set about finding a new vocalist.[8] Ex-Geordie singer Brian Johnson was auditioned and selected to replace Scott. Later that year, the band released the new album Back in Black, which was made as a tribute to Bon Scott. The album launched them to new heights of success and became their all-time best-seller.
  """,
  albums: [
    %Album{name: "High Voltage", year: 1975},
    %Album{name: "T.N.T.", year: 1975},
    %Album{name: "Dirty Deeds Done Dirt Cheap", year: 1976}
  ]
} |> Repo.insert!
