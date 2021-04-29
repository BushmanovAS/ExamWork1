import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBuyButton: UIButton!
    @IBOutlet weak var productPriceLabel: UILabel!
    let a = ProductViewController()
    @IBAction func buyButton(_ sender: Any) {
    }    
}
