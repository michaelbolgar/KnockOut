import UIKit
import SnapKit

class CategoryViewController: UIViewController {

    //MARK: - Properties

    static let screenWidth = UIScreen.main.bounds.width
    static let sideInset: CGFloat = 20
    static let amongInset: CGFloat = 10
    static let cellSize: CGFloat = ((screenWidth - (sideInset * 2) - amongInset) / 2 - 10)

    //MARK: - UI Elements

    private lazy var backgroung = SecondBackground()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: CategoryViewController.cellSize, height: CategoryViewController.cellSize)
        layout.minimumLineSpacing = CategoryViewController.amongInset
        view.delegate = self
        view.dataSource = self
        view.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 30)
        return label
    }()
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle.fill"), style: .done, target: self, action: #selector(tapBack))
        button.tintColor = UIColor.buttonRed
        return button
    }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = headerLabel
        navigationItem.leftBarButtonItem = backButton
        
        view.addSubview(backgroung)
        view.addSubview(collectionView)
        
        backgroung.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(CategoryViewController.sideInset)
        }
    }
    
    @objc private func tapBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - Extension UICollectionViewDataSource, UICollectionViewDelegate

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ExerciseModel.shared.getCategoryModel().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.checkButton.tag = indexPath.row
        cell.contentView.layer.cornerRadius = 45
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.configure(ExerciseModel.shared.getCategoryModel()[indexPath.row])
        cell.checkButton.isSelected = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        let value = indexPath.row

        if ExerciseModel.shared.index.contains(value) {
            ExerciseModel.shared.index.remove(value)
        } else {
            ExerciseModel.shared.index.insert(value)
        }

        cell.checkButton.isSelected = ExerciseModel.shared.index.contains(value)

    }
}
