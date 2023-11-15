import UIKit
import SnapKit
import AVFoundation

class GameViewController: UIViewController {
    
    //MARK: - Properties
    
    private var isSelected = true
    private var timer: Timer?
    private var timeInterval: TimeInterval = 30.0
    private var playerFire: AVAudioPlayer?
    private var playerBoom: AVAudioPlayer?
    private var backgroundMusic: AVAudioPlayer?
    private var count: Int = 1 { didSet { checkCounter() }}
    
    //MARK: - UI Elements
    
    private lazy var background = SecondBackground()
    
    private lazy var explosionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "explosion2")
//        image.backgroundColor = .white
        image.alpha = 0
        return image
    }()
    
    private lazy var boomImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "animation1")
        return image
    }()

    private lazy var titleLabel = UILabel.makeLabel(text: "Игра",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 28),
                                                     textColor: .black,
                                                   numberOfLines: 1)
    
    private lazy var exerciseLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
//        label.backgroundColor = .white
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 20)
        label.textColor = .black
        label.alpha = 0.0
        return label
    }()

    private lazy var headerLabel = UILabel.makeLabel(text: "Нажмите “Запустить” чтобы начать игру",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 24),
                                                     textColor: .black,
                                                   numberOfLines: 2)

    //не используем extension, потому что на этом экране много работы со свойствами кнопок

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.buttonYellow
        button.layer.cornerRadius = 30
        button.setTitle("Старт игры", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var anotherTaskButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.buttonYellow
        button.layer.cornerRadius = 30
        button.setTitle("Другое задание", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.alpha = 0
        button.addTarget(self, action: #selector(anotherTaskButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var pauseButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "pause.circle.fill"), style: .done, target: self, action: #selector(tapPause))
        button.tintColor = UIColor.buttonRed
        return button
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
        setupNavigation()
        
        playFire()
        playBoom()
        playBackground()
        
    }
    
    //MARK: - Methods
    
    private func setupViews() {

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let bombImageSize: CGFloat = (screenWidth - 30)
        let explosionImageSize: CGFloat = (screenWidth - 60)
        let buttonWidth: CGFloat = (screenWidth - 120)
        let buttonHeight: CGFloat = (screenHeight / 13)
        let amongInset: CGFloat = 10

        [background,  explosionImage, startButton, headerLabel, boomImage, exerciseLabel, anotherTaskButton].forEach { view.addSubview($0) }
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        boomImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(bombImageSize)
            make.height.equalTo(bombImageSize)
        }

        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(exerciseLabel.snp.top).inset(-amongInset)
        }
        
        exerciseLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(explosionImage.snp.top)
        }

        explosionImage.snp.makeConstraints { make in
            make.height.equalTo(explosionImageSize + 20)
            make.width.equalTo(explosionImageSize)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(60)
        }

        anotherTaskButton.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(explosionImage.snp.bottom).inset(amongInset)
        }

        startButton.snp.makeConstraints { make in
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(anotherTaskButton.snp.bottom).offset(amongInset + 3)
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
    
    @objc private func startButtonAction() {
        hideStartButton(startButton)
        startAnimation()
    }
    
    @objc private func tapBack() {
        stopAnimation()
        playerBoom = nil
        playerFire = nil
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
    
    @objc private func anotherTaskButtonAction() {
        UIView.animate(withDuration: 0.4) {
            self.exerciseLabel.alpha = 0
        } completion: { _ in
            self.exerciseLabel.text = ExerciseModel.shared.randomTask()
            
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
        exerciseLabel.text = ExerciseModel.shared.randomTask()
        
        UIView.animate(withDuration: 0.7) {
            self.boomImage.alpha = 0.0
            self.headerLabel.alpha = 0.0
            self.anotherTaskButton.alpha = 1.0
            self.startButton.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 0.7) {
                self.headerLabel.text = "Проигравший выполняет задание"
                self.headerLabel.alpha = 1.0
                self.exerciseLabel.alpha = 1.0
                self.explosionImage.alpha = 1.0
            }
        }
    }
    
    private func hideStartButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.7) {
            
            if sender.currentTitle != "Продолжить" {
                self.headerLabel.alpha = 0
            }
            
            self.startButton.alpha = 0
            self.exerciseLabel.alpha = 0.0
            self.anotherTaskButton.alpha = 0.0
            self.boomImage.alpha = 1.0
            self.explosionImage.alpha = 0.0
        } completion: { _ in
            
            if sender.currentTitle != "Продолжить" {
                self.headerLabel.text = ExerciseModel.shared.random()
            }
            
            UIView.animate(withDuration: 0.2) {
                self.headerLabel.alpha = 1.0
            }
        }
    }
    
    private func animatedForPause() {
        UIView.animate(withDuration: 0.7) {
            self.startButton.alpha = 0
            self.exerciseLabel.alpha = 0.0
            self.anotherTaskButton.alpha = 0.0
            self.boomImage.alpha = 1.0
        }
    }
    
    func load(count: Int, header: String) {
        self.count = count
        headerLabel.text = header
        boomImage.image = UIImage(named: "animation\(count)")
        startButton.setTitle("Продолжить", for: .normal)
    }
}
