import UIKit
import SnapKit
import AVFoundation

class GameViewController: UIViewController {
    
    //MARK: - Properties
    
    private var isSelected = true
    private var timer: Timer?
    private var timeInterval: TimeInterval = 9.0
    private var playerFire: AVAudioPlayer?
    private var playerBoom: AVAudioPlayer?
    private var backgroundMusic: AVAudioPlayer?
    private var count: Int = 1 { didSet { checkCounter() }}
    private let exerciseModel = ExerciseModel()
    
    //MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()
    
    private lazy var imageFire: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image9")
        image.alpha = 0
        return image
    }()
    
    private lazy var boomImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "animation1")
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "Игра"
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 28)
        label.textColor = .purple
        return label
    }()
    
    private lazy var exerciseLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        label.textColor = .purple
        label.alpha = 0.0
        return label
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите “Запустить” чтобы начать игру"
        label.numberOfLines = 5
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        label.textColor = .purple
        return label
    }()
    
    private lazy var startButton: UIButton = {
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
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 40
        button.setTitle("Другое задание", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.alpha = 0
        button.addTarget(self, action: #selector(tapNext), for: .touchUpInside)
        return button
    }()
    
    private lazy var pauseButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "pause.circle.fill"), style: .done, target: self, action: #selector(tapPause))
        button.tintColor = .purple
        return button
    }()
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle.fill"), style: .done, target: self, action: #selector(tapBack))
        button.tintColor = .purple
        return button
    }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigation()
        
        playFire()
        playBoom()
        playBackground()
        
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        
        view.addSubview(image)
        view.addSubview(startButton)
        view.addSubview(headerLabel)
        view.addSubview(boomImage)
        view.addSubview(exerciseLabel)
        view.addSubview(nextButton)
        view.addSubview(imageFire)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        startButton.snp.makeConstraints { make in
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
        
        exerciseLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(220)
            make.bottom.equalTo(nextButton.snp.top).inset(16)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(78)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(startButton.snp.top).inset(-16)
        }
        
        imageFire.snp.makeConstraints { make in
            make.height.equalTo(240)
            make.width.equalTo(200)
            make.top.equalTo(headerLabel.snp.bottom).inset(-16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = titleLabel
        navigationItem.rightBarButtonItem = pauseButton
        navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK: - Timer's methods
    
    private func startAnimation() {
        let totalTime = 85
        let frameDuration = timeInterval / TimeInterval(totalTime)
        
        timer = Timer.scheduledTimer(timeInterval: frameDuration, target: self, selector: #selector(updateAnimation), userInfo: nil, repeats: true)
    }
    
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateAnimation() {
        if count < 85 {
            playerFire?.play()
            backgroundMusic?.play()
            DispatchQueue.main.async { self.boomImage.image = UIImage(named: "animation\(self.count)") }
            count += 1
        } else {
            playerFire?.stop()
            backgroundMusic?.stop()
            stopAnimation()
            exerciseLabelAnimated()
            count = 1
        }
    }
    
    //MARK: - Button's targets
    
    @objc private func tapStart() {
        hideStartButton()
        startAnimation()
    }
    
    @objc private func tapBack() {
        timer?.invalidate()
        timer = nil
        playerBoom?.stop()
        playerBoom = nil
        playerFire?.stop()
        playerFire = nil
        backgroundMusic?.stop()
        backgroundMusic = nil
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func tapPause() {
        
        guard let _ = timer?.isValid else { return }
        
        if isSelected {
            pauseButton.image = UIImage(systemName: "play.circle.fill")
            isSelected = false
            timer?.invalidate()
            animatedForPause()
            playerBoom?.pause()
            playerFire?.pause()
            backgroundMusic?.pause()
        } else {
            pauseButton.image = UIImage(systemName: "pause.circle.fill")
            isSelected = true
            startAnimation()
        }
    }
    
    @objc private func tapNext() {
        UIView.animate(withDuration: 0.4) {
            self.exerciseLabel.alpha = 0
        } completion: { _ in
            self.exerciseLabel.text = self.exerciseModel.randomTask()
            
            UIView.animate(withDuration: 0.4) {
                self.exerciseLabel.alpha = 1
            }
        }
    }
    
    private func playFire() {
        if playerFire == nil {
            guard let sound = Bundle.main.path(forResource: "fire", ofType: "mp3") else { return }
            
            let url = URL(fileURLWithPath: sound)
            
            do {
                playerFire = try AVAudioPlayer(contentsOf: url)
                playerFire?.prepareToPlay()
            } catch {
                print(error)
            }
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
    
    private func playBackground() {
        guard let sound = Bundle.main.path(forResource: "backMusic", ofType: "mp3") else { return }
        
        let url = URL(fileURLWithPath: sound)
        
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.prepareToPlay()
            backgroundMusic?.volume = 0.1
        } catch {
            print(error)
        }
    }
    
    private func checkCounter() {
        UserDef.shared.count = count
        UserDef.shared.header = headerLabel.text
        if count == 80 {
            playerBoom?.play()
        }
    }
    
    private func exerciseLabelAnimated() {
        startButton.setTitle("Начать заново", for: .normal)
        exerciseLabel.text = exerciseModel.randomTask()
        
        UIView.animate(withDuration: 0.7) {
            self.boomImage.alpha = 0.0
            self.headerLabel.alpha = 0.0
            self.nextButton.alpha = 1.0
            self.startButton.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 0.7) {
                self.headerLabel.text = "Проигравший выполнянет задание"
                self.headerLabel.alpha = 1.0
                self.exerciseLabel.alpha = 1.0
                self.imageFire.alpha = 1.0
            }
        }
    }
    
    private func hideStartButton() {
        
        UIView.animate(withDuration: 0.7) {
            self.headerLabel.alpha = 0
            self.startButton.alpha = 0
            self.exerciseLabel.alpha = 0.0
            self.nextButton.alpha = 0.0
            self.boomImage.alpha = 1.0
            self.imageFire.alpha = 0.0
        } completion: { _ in
            self.headerLabel.text = self.exerciseModel.random()
            
            UIView.animate(withDuration: 0.2) {
                self.headerLabel.alpha = 1.0
            }
        }
    }
    
    private func animatedForPause() {
        UIView.animate(withDuration: 0.7) {
            self.startButton.alpha = 0
            self.exerciseLabel.alpha = 0.0
            self.nextButton.alpha = 0.0
            self.boomImage.alpha = 1.0
        }
    }
    
    func load(count: Int, header: String) {
        self.count = count
        headerLabel.text = header
        boomImage.image = UIImage(named: "animation\(count)")
    }
}
