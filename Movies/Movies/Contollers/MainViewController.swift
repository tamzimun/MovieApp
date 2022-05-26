//
//  MainViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 25.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var sectionNames: [String] = ["Today at the cinema", "Soon at the cinema", "Trending movies"]
    
    private var todayAtTheCinema: [Movie] = [
        Movie.init(image: UIImage.init(named: "Heirss.jpeg"), name: "Heirs", rating: 9.9, genreIds: [1,3], id: 1, descriptionImage: UIImage.init(named: "HeirsDesc.jpeg"), date: "2016-12-23", description: "  Cha Eun Sang and her disabled mother both have to work hard, humiliating jobs, in order to support her older sister who's at university in America. Cha Eun Sang can't wait for her sister, who's her idol, to come back to Korea, and start earning money, so she can stop washing dishes and get a degree herself. However one day, Cha Eun Sang learns that her sister is about to get married, and realizes she'll never return to Korea, so she'll forever have to wash dishes. She resolves to go to America as well, and get better life."),
        Movie.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rating: 3.6, genreIds: [1], id: 2, descriptionImage: UIImage.init(named: "Legend-of-the-Blue-Featured.jpeg"), date: "2021-08-23", description: "  Inspired by a classic Joseon legend from Korea's first collection of unofficial historical tales, about a fisherman who captured and kidnapped a mermaid, this drama tells the love story between the son of a Joseon noble family named Kim Dam Ryung (Lee Min Ho) and a mermaid he named Se Hwa (Jun Ji Hyun). Sometime during August, 1598, newly appointed governor Kim Dam Ryung stays for a night at an inn run by Lord Yang (Sung Dong Il). During that evening, Lord Yang shows Dam Ryung a captured mermaid named Se Hwa. Later that night, Dam Ryung releases her into the ocean and, before she swims away, Se Hwa reaches out her hand to Dam Ryung which he briefly holds."),
        Movie.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rating: 6.8, genreIds: [2,4], id: 3, descriptionImage: UIImage.init(named: "BoysoverFlowerDes.png"), date: "2008-09-11", description: "  Poor girl Jan Di attends elite Shin Hwa High, where she's bullied by Joon Pyo, leader of F4 (the four richest and most gorgeous boys). Joon Pyo becomes attracted to Jan Di, but she has a crush on Yoon Ji Hoo, Joon Pyo's best friend. This is a Cinderella story about the F4 friends and the normal girl who manages to break into their clique and win their friendship along with the romantic affections of two of the four.")
    ]
    
    private var soonAtTheCinema: [Movie] = [
        Movie.init(image: UIImage.init(named: "Heirss.jpeg"), name: "Heirs", rating: 9.9, genreIds: [1,3], id: 1, descriptionImage: UIImage.init(named: "HeirsDesc.jpeg"), date: "2016-12-23", description: "  Cha Eun Sang and her disabled mother both have to work hard, humiliating jobs, in order to support her older sister who's at university in America. Cha Eun Sang can't wait for her sister, who's her idol, to come back to Korea, and start earning money, so she can stop washing dishes and get a degree herself. However one day, Cha Eun Sang learns that her sister is about to get married, and realizes she'll never return to Korea, so she'll forever have to wash dishes. She resolves to go to America as well, and get better life."),
        Movie.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rating: 3.6, genreIds: [1], id: 2, descriptionImage: UIImage.init(named: "Legend-of-the-Blue-Featured.jpeg"), date: "2021-08-23", description: "  Inspired by a classic Joseon legend from Korea's first collection of unofficial historical tales, about a fisherman who captured and kidnapped a mermaid, this drama tells the love story between the son of a Joseon noble family named Kim Dam Ryung (Lee Min Ho) and a mermaid he named Se Hwa (Jun Ji Hyun). Sometime during August, 1598, newly appointed governor Kim Dam Ryung stays for a night at an inn run by Lord Yang (Sung Dong Il). During that evening, Lord Yang shows Dam Ryung a captured mermaid named Se Hwa. Later that night, Dam Ryung releases her into the ocean and, before she swims away, Se Hwa reaches out her hand to Dam Ryung which he briefly holds."),
        Movie.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rating: 6.8, genreIds: [2,4], id: 3, descriptionImage: UIImage.init(named: "BoysoverFlowerDes.png"), date: "2008-09-11", description: "  Poor girl Jan Di attends elite Shin Hwa High, where she's bullied by Joon Pyo, leader of F4 (the four richest and most gorgeous boys). Joon Pyo becomes attracted to Jan Di, but she has a crush on Yoon Ji Hoo, Joon Pyo's best friend. This is a Cinderella story about the F4 friends and the normal girl who manages to break into their clique and win their friendship along with the romantic affections of two of the four.")]
    
    
    
    private var trendingMovies: [Movie] = [
        Movie.init(image: UIImage.init(named: "Heirss.jpeg"), name: "Heirs", rating: 9.9, genreIds: [1,3], id: 1, descriptionImage: UIImage.init(named: "HeirsDesc.jpeg"), date: "2016-12-23", description: "  Cha Eun Sang and her disabled mother both have to work hard, humiliating jobs, in order to support her older sister who's at university in America. Cha Eun Sang can't wait for her sister, who's her idol, to come back to Korea, and start earning money, so she can stop washing dishes and get a degree herself. However one day, Cha Eun Sang learns that her sister is about to get married, and realizes she'll never return to Korea, so she'll forever have to wash dishes. She resolves to go to America as well, and get better life."),
        Movie.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rating: 3.6, genreIds: [1], id: 2, descriptionImage: UIImage.init(named: "Legend-of-the-Blue-Featured.jpeg"), date: "2021-08-23", description: "  Inspired by a classic Joseon legend from Korea's first collection of unofficial historical tales, about a fisherman who captured and kidnapped a mermaid, this drama tells the love story between the son of a Joseon noble family named Kim Dam Ryung (Lee Min Ho) and a mermaid he named Se Hwa (Jun Ji Hyun). Sometime during August, 1598, newly appointed governor Kim Dam Ryung stays for a night at an inn run by Lord Yang (Sung Dong Il). During that evening, Lord Yang shows Dam Ryung a captured mermaid named Se Hwa. Later that night, Dam Ryung releases her into the ocean and, before she swims away, Se Hwa reaches out her hand to Dam Ryung which he briefly holds."),
        Movie.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rating: 6.8, genreIds: [2,4], id: 3, descriptionImage: UIImage.init(named: "BoysoverFlowerDes.png"), date: "2008-09-11", description: "  Poor girl Jan Di attends elite Shin Hwa High, where she's bullied by Joon Pyo, leader of F4 (the four richest and most gorgeous boys). Joon Pyo becomes attracted to Jan Di, but she has a crush on Yoon Ji Hoo, Joon Pyo's best friend. This is a Cinderella story about the F4 friends and the normal girl who manages to break into their clique and win their friendship along with the romantic affections of two of the four.")
    ]
    
    var movieCastsHeirs: [Cast] = [
        Cast.init(image: .init(named: "1.jpeg"), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "Heirs", biograpy: "Park Shin-hye is a South Korean actress and singer. She gained recognition as a child on TV shows such as Stairway to Heaven, and Tree of Heaven. Later on, she would achieve further success when she starred in the film Miracle in Cell No. 7, one of the highest grossing Korean films of all-time.", birthday: "February 18, 1990 (age 32 years), Nam-gu, Gwangju, South Korea"),
        Cast.init(image: .init(named: "2.jpeg"), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "Heirs", biograpy: "Lee Min-ho is a South Korean actor, singer, model, creative director and businessman. He gained widespread fame worldwide with his role as Gu Jun-pyo in Boys Over Flowers which also earned him the Best New Actor award at the 45th Baeksang Arts Awards. ", birthday: "June 22, 1987 (age 34 years), Heukseok-dong, Seoul, South Korea"),
        Cast.init(image: .init(named: "3.jpeg"), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "Heirs", biograpy: "Kim Woo-bin is a South Korean actor and model. He began his career as a runway model and made his acting debut in the television drama White Christmas. He subsequently gained attention in A Gentleman's Dignity, and made his breakthrough with School 2013 and The Heirs.", birthday: "July 16, 1989 (age 32 years), Seoul, South Korea"),
        Cast.init(image: .init(named: "4.jpeg"), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "Heirs", biograpy: "Kim Ji-won is a South Korean actress. She gained attention through her roles in television series The Heirs, Descendants of the Sun, Fight for My Way, Arthdal Chronicles, Lovestruck in the City, and My Liberation Notes. The success of Kim's television dramas throughout Asia established her as a Hallyu star.", birthday: "October 19, 1992 (age 29 years), Geumcheon-gu, Seoul, South Korea"),
        Cast.init(image: .init(named: "5.jpeg"), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "Heirs", biograpy: "Chrystal Soo Jung, professionally known as Krystal, Krystal Jung or Jung Soo-jung, is a Korean-American singer and actress based in South Korea. She debuted in 2009 as a member of the South Korean girl group f(x) and has further participated in SM Entertainment's project group SM the Ballad.", birthday: "October 24, 1994 (age 27 years), San Francisco, California, United States"),
    ]
    
    var movieCastsBlueSea: [Cast] = [
        Cast.init(image: .init(named: "1blue.jpeg"), name: "Jun Ji-hyun", position: "As Shim Chung"),
        Cast.init(image: .init(named: "2blue.jpeg"), name: "Lee Hee-joon", position: "As Jo Nam"),
        Cast.init(image: .init(named: "3blue.jpeg"), name: "Won Ho Shin", position: "As Tae Oh"),
        Cast.init(image: .init(named: "2.jpeg"), name: "Lee Min-Ho", position: "As Heo Joon")
    ]
    
    var movieCastsBoyFlowers: [Cast] = [
        Cast.init(image: .init(named: "1flo.jpeg"), name: "Ku Hye-Sun", position: "As Geom Jan"),
        Cast.init(image: .init(named: "2flo.jpeg"), name: "Kim Hyun", position: "As Yoon Ji"),
        Cast.init(image: .init(named: "3flo.jpeg"), name: "Kim Bum Ju", position: "As So Yi"),
        Cast.init(image: .init(named: "2.jpeg"), name: "Lee Min-Ho", position: "As Goo Joon")
    ]
    
    lazy var sectionMovies: [[Movie]] = [todayAtTheCinema, soonAtTheCinema, trendingMovies]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Movies"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle(for: MovieTableViewCell.self)), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.estimatedRowHeight = 355
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.configure(with: (title: sectionNames[indexPath.row], movies: sectionMovies[indexPath.row]))
        cell.delegate = self
        return cell
    }
    
}

extension MainViewController: UIdelegate {
    func goToDesc(index: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        vc.filmsTitle =  todayAtTheCinema[index].name
        vc.filmsImage = todayAtTheCinema[index].descriptionImage
        vc.filmsDate = todayAtTheCinema[index].date
        vc.filmsDescription = todayAtTheCinema[index].description
        if index == 0 {
            vc.casts = movieCastsHeirs
        } else if index == 1 {
            vc.casts = movieCastsBlueSea
        } else if index == 2 {
            vc.casts = movieCastsBoyFlowers
        }

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func goToNext() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.movies = todayAtTheCinema
        self.navigationController?.pushViewController(vc, animated: true)


    }

}
