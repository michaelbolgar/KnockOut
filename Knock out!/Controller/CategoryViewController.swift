import UIKit
import SnapKit

class CategoryViewController: UIViewController {
    
    //MARK: - UI Elements

    let backgroungImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background5")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bomb2"))
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.2
        return imageView
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 174, height: 174)
        layout.minimumLineSpacing = 12
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

        let screenHeight = UIScreen.main.bounds.height
        let bombSize: CGFloat = (screenHeight * 0.42 + 20)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = headerLabel
        navigationItem.leftBarButtonItem = backButton
        
        view.addSubview(backgroungImageView)
        view.addSubview(bombImageView)
        view.addSubview(collectionView)
        
        backgroungImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        bombImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.trailing.equalTo(view.snp.trailing).offset(85)
            make.height.equalTo(bombSize - 25)
            make.width.equalTo(bombSize - 75)
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
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
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.configure(ExerciseModel.shared.getCategoryModel()[indexPath.row])
        
        cell.completionHandler = { value in
            
            if ExerciseModel.shared.index.contains(value) {
                ExerciseModel.shared.index.remove(value)
            } else {
                ExerciseModel.shared.index.insert(value)
            }
        }
        
        return cell
    }
}
