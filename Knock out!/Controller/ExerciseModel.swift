//
//  ExerciseModel.swift
//  Knock out!
//
//  Created by sidzhe on 08.08.2023.
//

import UIKit

class ExerciseModel {
    
    static let shared = ExerciseModel()
    
    var index: Set<Int> = []
    
    private var model: [CategoryModel]?

    private var geographyQuestions = [

        "geo"

//        "Какие страны входят в Евросоюз?",
//        "Какие страны имеют общую границу с Россией?",
//        "Назовите страны на букву «К»",
//        "Назовите города Испании",
//        "Назовите регионы России",
//        "Перечислите штаты в составе США",
//        "Какие горные массивы существуют?",
//        "Назовите страны Юго-Восточной Азии",
//        "Назовите реки России",
//        "Какие моря омывают Евразию?",
//        "Назовите страны Африки",
//        "В каких странах говорят на испанском языке?",
//        "Какие валюты существуют в современном мире?"
    ]

    private var sportQuestions = [

        "sport"

//        "Какие виды спорта требуют использования мяча?",
//        "Какие виды спорта представлены на зимних Олимпийских играх?",
//        "Назовите известных футболистов",
//        "Назовите виды единоборств, где применяются удары руками и ногами",
//        "Какие виды спортивных забегов проводятся на длинных дистанциях?",
//        "Назовите виды спорта, в которых спортсмены выступают индивидуально",
//        "Назовите виды борьбы, проводимые на ковре",
//        "Назовите командные виды спорта",
//        "Назовите страны, которые выигрывали чемпионат мира по футболу",
//        "Какие виды спорта требуют использования ракетки?",
//        "Назовите известные бренды спортивной одежды",
    ]
    
    private var moviesAndCultureQuestions = [

        "movies"
        
//        "Назовите итальянских художников",
//        "Назовите фильмы, снятые режиссёром Кристофером Ноланом",
//        "Назовите известных скульпторов",
//        "Какие актёры снимались в фильмах о Гарри Поттере?",
//        "Назовите фильмы Эльдара Рязанова",
//        "Назовите направления в живописи",
//        "Назовите произведения классической музыки",
//        "Назовите фильмы в стиле фэнтэзи",
//        "Назовите известных британских музыкантов",
//        "Назовите фильмы, в которых снимался Леонардо Ди Каприо",
//        "Назовите известных русских композиторов",
//        "Назовите вымышленных персонажей, обладающих сверхспособностями",
//        "Назовите известные национальные танцы",
//        "Назовите известных русских киноактёров",
//        "Назовите актёров, игравших в марвеловских 'Мстителях'"
    ]
    
    private var natureQuestions = [

        "nature"

//        "Какие хищные животные обитают в лесу?",
//        "У каких деревьев есть листья?",
//        "Какие птицы являются перелётными?",
//        "Какие рыбы обитают в пресных водоёмах?",
//        "Какие цветы используются для составления букетов?",
//        "Какие звёзды можно увидеть на небе?",
//        "Какие животные являются травоядными?",
//        "Какие породы дерева высоко ценятся в мебельном производстве?",
//        "Какие фрукты относятся к роду цитрусовых?",
//        "Какие животные умеют лазить по деревьям?",
//        "Какие животные водятся в Австралии?",
//        "Каких животных можно держать дома в качестве домашних?"
    ]

    private lazy var technicalQuestions = [

        "tech"

//        "Назовите компоненты системного блока компьютера",
//        "Что находится под капотом у автомобиля?",
//        "Назовите гаджеты, выпускаемые компанией Apple",
//        "Назовите зарубежные марки автомобилей",
//        "Какие технические жидкости нужны для работы автомобиля?",
//        "Каким образом можно передать файлы с одного компьютера на другой?",
//        "Из каких систем состоит современный автомобиль?",
//        "Назовите версии операционных систем Windows",
//        "Какие лампочки можно увидеть в современном автомобиле?",
//        "Какую технику можно увидеть в офисе?"
    ]

    private lazy var historyQuestions = [

        "history"

//        "Назовите народные республики, входившие в состав СССР",
//        "Назовите правителей царской России",
//        "Назовите американских президентов",
//        "Назовите мореплавателей-первооткрывателей",
//        "Назовите революционных деятелей",
//        "Назовите исторические сражения, произошедшие вблизи водоёмов",
//        "Назовите страны, где когда-либо был коммунистический строй",
//        "Назовите русских первооткрывателей",
//        "Назовите русских учёных дореволюционного времени",
//        "Назовите крупные императорские династии",
//        "Назовите известных философов",
//        "Назовите известных преступников"
    ]

    private var foodQuestions = [

        "food"

//        "Назовите знаменитые блюда французской кухни",
//        "Какие блюда являются традиционными для славянских стран?",
//        "Какие виды итальянской пасты существуют?",
//        "Назовите распространённые сорта вин",
//        "Какие существуют сорта сыра?",
//        "Какие блюда являются традиционными для новогоднего стола в России?",
//        "Мясо каких птиц можно употреблять в пищу?",
//        "Назовите виды алкогольных напитков",
//        "Назовите различные виды круп",
//        "Назовите блюда из морепродуктов"
    ]

    private var anyQuestions = [

        "any"

//        "Куда можно сходить на первое свидание?",
//        "Чем можно заняться в свободный вечер?",
//        "С чем можно сделать бутерброд?",
//        "Какую вещь лучше не иметь при себе, когда вас останавливает полицейский?",
//        "Какие вещи непременно нужно взять с собой в космос?",
//        "Назовите известные бренды одежды",
//        "В каких странах легализовано курение марихуаны?",
//        "В каких странах закреплено левостороннее движение автомобиля?",
//        "Назовите простые числа",
//        "Назовите элементы таблицы Менделеева"
    ]
    
    private var tasks = [

        "Кричать 'ого!' и 'ничего себе!' после каждого ответа в следующем раунде",
        "Вести себя как обезьяна в течение следующих двух раундов",
        "Говорить детским голосом в течение следующего раунда",
        "Съесть или выпить что-нибудь, не используя руки",
        "Нарисовать себе кошачьи усы",
        "Сказать комплимент каждому из присутствующих",
        "Художественно спародировать животное, в год которого он родился",
        "Выбрать одного из игроков и называть его 'Моя прелесть' до конца вечера",
        "Сделать массаж одному из игроков на выбор",
        "Рассказать нелепую историю из детства",
        "Обнять каждого игрока",
        "Сделать селфи с каждым из игроков, корча смешные рожицы",
        "Произнести предвыборную речь на пост главы подъезда",
        "Говорить с иностранным акцентом следующие три раунда",
        "Быть официантом для всех игроков в течение получаса",
        "Показать самое первое фото в галерее",
        "Показывать пантомимой любимую диснеевскую принцессу, пока остальные игроки не отгадают её",
        "Рассказать про лучшую поездку в своей жизни",
        "Рассказать про стрессовую ситуацию из своей жизни",
        "Рассказать про свою постыдную слабость",
        "Давать сразу по два правильных ответа на вопрос следующего раунда",
        "Выполнить любое желание игрока напротив",
        "Сделать забавное селфи со всеми игроками и выложить в сторис любой социальной сети",
        "Сделать 15 приседаний",
        "Сделать 10 отжиманий",
        "Позволить кому-то из игроков сделать себе макияж"
    ]
    
    func createCategoryModel() {
        
        var category = [
            CategoryModel(name: "География", image: UIImage(named: "cat1") ?? UIImage()),
            CategoryModel(name: "Искусство", image: UIImage(named: "artImage") ?? UIImage()),
            CategoryModel(name: "Спорт", image: UIImage(named: "cat2") ?? UIImage()),
            CategoryModel(name: "Природа", image: UIImage(named: "cat5") ?? UIImage()),
            CategoryModel(name: "Техника", image: UIImage(named: "technologyImage") ?? UIImage()),
            CategoryModel(name: "История", image: UIImage(named: "historyImage") ?? UIImage()),
            CategoryModel(name: "Еда", image: UIImage(named: "foodImage") ?? UIImage()),
            CategoryModel(name: "О разном", image: UIImage(named: "cat6") ?? UIImage())]
        
        index.forEach { value in
            category[value].isSelected = !category[value].isSelected!
        }
        
        model = category
    }
    
    func getCategoryModel() -> [CategoryModel] {
        createCategoryModel()
        return model!
    }
    
    func random() -> String {
        
        var category = [String]()
        
        if index.isEmpty {
            category.append(contentsOf: geographyQuestions)
            category.append(contentsOf: sportQuestions)
            category.append(contentsOf: moviesAndCultureQuestions)
            category.append(contentsOf: natureQuestions)
            category.append(contentsOf: technicalQuestions)
            category.append(contentsOf: historyQuestions)
            category.append(contentsOf: foodQuestions)
            category.append(contentsOf: anyQuestions)
        }
        
        index.forEach { index in
            
            switch index {
                
            case 0:
                category.append(contentsOf: geographyQuestions)
            case 1:
                category.append(contentsOf: sportQuestions)
            case 2:
                category.append(contentsOf: moviesAndCultureQuestions)
            case 3:
                category.append(contentsOf: natureQuestions)
            case 4:
                category.append(contentsOf: technicalQuestions)
            case 5:
                category.append(contentsOf: historyQuestions)
            case 6:
                category.append(contentsOf: foodQuestions)
            case 7:
                category.append(contentsOf: anyQuestions)
            default:
                category.append(contentsOf: geographyQuestions)
                category.append(contentsOf: sportQuestions)
                category.append(contentsOf: moviesAndCultureQuestions)
                category.append(contentsOf: natureQuestions)
                category.append(contentsOf: technicalQuestions)
                category.append(contentsOf: historyQuestions)
                category.append(contentsOf: foodQuestions)
                category.append(contentsOf: anyQuestions)
            }
        }
        
        return category[Int.random(in: 0..<category.count)]
    }
    
    func randomTask() -> String {
        return tasks[Int.random(in: 0..<tasks.count)]
    }
}
