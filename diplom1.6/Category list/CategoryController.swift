import UIKit
import SDWebImage


class CategoryController: UIViewController {    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    let loader = CategoriesLoader()
    let loader2 = ProductsLoader()
    let a = ProductViewController()
    var subcategories: [Subcategory] = []
    var categories: [Category] = []
    var  subcat = false

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isEnabled = false
        
        loader.loadCategories { (data) in
            self.categories = data
            self.tableView.reloadData()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        subcat = false
        backButton.isEnabled = false
        tableView.reloadData()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ProductViewController, segue.identifier == "ShowProducts", let senderID = sender as? Int  {
            let model = subcategories[senderID]
            vc.id = model.id
        }
    }
}

extension CategoryController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcat ? subcategories.count : categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryTableViewCell
       
        if subcat {
            let model = subcategories[indexPath.row]
            cell.categoryTitleLabel.text = model.name
            
            if model.iconImage == "" {
                cell.categoryImage.image = UIImage(named: "stars")
            } else {
                
            guard let imageURL = URL(string: ("http://blackstarshop.ru/" + model.iconImage)) else { return cell }
                
            cell.categoryImage.sd_setImage(with: imageURL, completed: nil)
            }
        } else {
            let model = categories[indexPath.row]
            cell.categoryTitleLabel.text = model.name
            
            switch cell.categoryTitleLabel.text {
            case "Детская": cell.categoryImage.image = UIImage(named: "det")
            case "Женская": cell.categoryImage.image = UIImage(named: "jen")
            case "Коллекции": cell.categoryImage.image = UIImage(named: "kol")
            case "Мужская": cell.categoryImage.image = UIImage(named: "muj")
            case "Скидки": cell.categoryImage.image = UIImage(named: "ski")
            case "Предзаказ": cell.categoryImage.image = UIImage(named: "pre")
            case "Обувь": cell.categoryImage.image = UIImage(named: "obu")
            case "Аксессуары": cell.categoryImage.image = UIImage(named: "aks")
            case "Новинки": cell.categoryImage.image = UIImage(named: "pre")
            default: cell.categoryImage.image = UIImage(named: "pre")
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if subcat {
            performSegue(withIdentifier: "ShowProducts", sender: indexPath.row)
        } else {
            subcategories = categories[indexPath.row].metod()
            subcat = true
            tableView.reloadData()
            backButton.isEnabled = true
        }
    }
}
