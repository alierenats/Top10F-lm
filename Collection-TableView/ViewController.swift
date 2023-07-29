import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TableView: UITableView!
    
    var movieList = [Movies]()
    var filmType:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CollectionView.frame.size
        layout.minimumLineSpacing = 0
        self.CollectionView.collectionViewLayout = layout
        self.CollectionView.isPagingEnabled = true
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        TableView.delegate = self
        TableView.dataSource = self
        
        let m1 = Movies(movieID: 1, movieImageName: "fıghtclub", genre: "Action")
        let m2 = Movies(movieID: 2, movieImageName: "yenilmezler", genre: "Action")
        let m3 = Movies(movieID: 3, movieImageName: "yenilmez4", genre: "Action")
        let m4 = Movies(movieID: 4, movieImageName: "interstellar1", genre: "Action")
        let m5 = Movies(movieID: 5, movieImageName: "batman", genre: "Action")
        let m6 = Movies(movieID: 6, movieImageName: "legend", genre: "Action")
        let m7 = Movies(movieID: 7, movieImageName: "thor", genre: "Action")
        let m8 = Movies(movieID: 8, movieImageName: "greenbook", genre: "Action")
        let m9 = Movies(movieID: 9, movieImageName: "barbie", genre: "Action")
        let m10 = Movies(movieID: 10, movieImageName: "venom" ,genre: "Action")

        movieList.append(m1)
        movieList.append(m2)
        movieList.append(m3)
        movieList.append(m4)
        movieList.append(m5)
        movieList.append(m6)
        movieList.append(m7)
        movieList.append(m8)
        movieList.append(m9)
        movieList.append(m10)

        filmType = ["Action","Animation","Biography","Comedy","Crime","Documentary","Drama","Family","Fantasy","Horror","Musical","Mystery","Romance","Sci-Fi","Sport","Thriller","War"]
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate , UITableViewDataSource {
    
    // ******* CollectionView *******
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        let movie = movieList[indexPath.row]
        
        if let image = UIImage(named: movie.movieImageName!) {
            let ratio: CGFloat = 16/9
            let newWidth = collectionView.frame.size.width
            let newHeight = newWidth / ratio
            
            UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
            image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            cell.movieImageView.image = newImage
        }
        
        cell.movieImageView.contentMode = .scaleAspectFill
        cell.movieImageView.clipsToBounds = true
        
        return cell
    }
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    // Cell Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // ******** TableView ********

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genresCell", for: indexPath)

        cell.textLabel?.text = filmType[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(filmType[indexPath.row])")
    }
    
}
