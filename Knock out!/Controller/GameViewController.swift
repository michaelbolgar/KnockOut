import UIKit
import SnapKit
import AVFoundation

class GameViewController: UIViewController {
    
    //MARK: - Properties
    
    private var timer: Timer?
    private var timeInterval: TimeInterval = 5.0
    private var playerFire: AVAudioPlayer?
    private var playerBoom: AVAudioPlayer?
    private var count: Int = 1 { didSet { checkCounter() }}
    
    //MARK: - UI Elements
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()
    
    private var boomImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "animation1")
        return image
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите “Запустить” чтобы начать игру"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 28)
        label.textColor = .purple
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 40
        button.setTitle("Запустить", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(tapStart), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        playFire()
        playBoom()
        
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        
        //        navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: pauseButton)
        
        view.addSubview(image)
        view.addSubview(button)
        view.addSubview(headerLabel)
        view.addSubview(boomImage)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(78)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(64)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(130)
        }
        
        boomImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(312)
            make.height.equalTo(352)
        }
    }
    
    //MARK: - Timer's methods
    
    private func startAnimation() {
        let totalTime = 102
        let frameDuration = timeInterval / TimeInterval(totalTime)
        
        timer = Timer.scheduledTimer(timeInterval: frameDuration, target: self, selector: #selector(updateAnimation), userInfo: nil, repeats: true)
    }
    
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateAnimation() {
        if count < 102 {
            playerFire?.play()
            DispatchQueue.main.async { self.boomImage.image = UIImage(named: "animation\(self.count)") }
            count += 1
        } else {
            playerFire?.stop()
            stopAnimation()
            DispatchQueue.main.async { self.boomImage.image = UIImage(named: "animation1") }
            count = 1
        }
    }
    
    @objc private func tapStart() {
        startAnimation()
    }
    
    @objc private func tapButton() {
        
    }
    
    private func playFire() {
        guard let sound = Bundle.main.path(forResource: "fire", ofType: "mp3") else { return }
        
        let url = URL(fileURLWithPath: sound)
        
        do {
            playerFire = try AVAudioPlayer(contentsOf: url)
            playerFire?.prepareToPlay()
        } catch {
            print(error)
        }
    }
    
    private func playBoom() {
        guard let sound = Bundle.main.path(forResource: "boom", ofType: "mp3") else { return }
        
        let url = URL(fileURLWithPath: sound)
        
        do {
            playerBoom = try AVAudioPlayer(contentsOf: url)
            playerBoom?.prepareToPlay()
        } catch {
            print(error)
        }
    }
    
    private func checkCounter() {
        if count == 79 {
            playerFire?.stop()
        } else if count == 80 {
            playerBoom?.play()
        }
    }
}



