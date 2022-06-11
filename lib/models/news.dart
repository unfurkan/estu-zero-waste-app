class News {
  final String title;
  final String subtitle;
  final String content;
  final String category;
  final String time;
  final String author;
  final String seen;
  final String favorite;
  final String image;
  final String estimate;

  News({
    required this.author,
    required this.content,
    required this.category,
    required this.estimate,
    required this.favorite,
    required this.image,
    required this.seen,
    required this.subtitle,
    required this.time,
    required this.title,
  });
}

List<News> popularList = [
  News(
      author: "ESTU AYS",
      estimate: "3",
      category: "Sıfır Atık",
      favorite: "700",
      seen: "4.51K",
      time: "4 Saat Önce",
      title: "Sıfır Atık Çalışmalarımız",
      image: "https://ays.eskisehir.edu.tr/Uploads/ays/images/BMSKA.jpg",
      subtitle:
          "Etkin bir atık yönetimi, atıkların düzenli depolama alanlarına gönderilmesinin yerine, atıkların geri dönüşüm ve/veya geri kazanım yöntemleriyle yeniden birer hammade olarak kullanılarak doğal kaynak kullanımının azaltılmasını sağlar. Bu durum, hem çevresel hem de ekonomik açıdan önemli kazanımların elde edilmesine olanak tanır.",
      content:
          "Etkin bir atık yönetimi, atıkların düzenli depolama alanlarına gönderilmesinin yerine, atıkların geri dönüşüm ve/veya geri kazanım yöntemleriyle yeniden birer hammade olarak kullanılarak doğal kaynak kullanımının azaltılmasını sağlar. Bu durum, hem çevresel hem de ekonomik açıdan önemli kazanımların elde edilmesine olanak tanır.Bu kapsamda, 12 Temmuz 2019 tarihinde (Resmi Gazete No: 30829) yayımlanarak yürürlüğe giren “Sıfır Atık Yönetmeliği”nde, hammadde ve doğal kaynakların etkin yönetimi ile birlikte sürdürülebilir kalkınma amaçları doğrultusunda (Görsel 1), atık yönetimi süreçlerinde çevre ve insan sağlığının ve tüm kaynakların korunmasını hedefleyen Atık Yönetim Sisteminin kurulması, geliştirilmesi, izlenmesi ve kayıt altına alınması gerektiği ifade edilmiştir. Bu kapsamda, Üniversitemizde atık yönetimi ve sıfır atık uygulamalarına yönelik birçok faaliyet gerçekleştirilmektedir."),
  News(
    author: "ESTU AYS",
    estimate: "3",
    category: "Eco Campus",
    favorite: "700",
    seen: "4.5K",
    time: "4 Saat Önce",
    title: "Kampüste Atık Yönetimi",
    image:
        "https://raw.githubusercontent.com/unfurkan/quartz-scheduling/main/ecocampus.png",
    subtitle:
        "Üniversite kampüslerimizde oluşan atıklarla ilgili uygulanan Atık Yönetim Sistemi şeması:",
    content:
        "Üniversitemizde “Sıfır Atık Yaklaşımıyla Atık Yönetimi Sistemi” çalışmalarına ilk olarak birimlerde belirlenen Sıfır Atık Odak noktalarına yapılması planlanan çalışmalarla ilgili bir bilgilendirme toplantısı düzenlenerek başlanmıştır.Daha sonra birimlerimizde sıfır atık sisteminin kurulması konusunda eksikliklerin tespiti ve bunların giderilmesi yönünde çalışmalar gerçekleştirilmiştir.Kampüslerimizde oluşan karışık ambalaj (cam, plastik, kağıt-karton ve metal) atıklarını kaynağında ayrı toplamak amacıyla binalarımızda yaklaşık iki yüz farklı noktada geri dönüşüm kutuları kullanılmaktadır. Bu kutularla birlikte tüm yiyecek vb. evsel nitelikli atıklarla karışmaması ve ayrı toplanması sağlanmıştır. (Görsel 2.) Toplanan Ambalaj Atıkları geri dönüşüm için Tepebaşı ve Odunpazarı belediyeleri tarafından düzenli olarak toplanarak geri dönüşüm tesislerine götürülmektedir.",
  ),
  News(
      author: "ESTU AYS",
      estimate: "5",
      category: "Sıfır Atık",
      favorite: "502",
      seen: "1.21K",
      time: "10 Saat Önce",
      title: "Eğitim ve farkındalık çalışmalarımız",
      image: "https://ays.eskisehir.edu.tr/Uploads/ays/images/Screenshot_1.jpg",
      subtitle:
      "Üniversitemizde meydana gelen atıkların yönetilmesinde benimsediğimiz sıfır atık yaklaşımı ile birlikte öncelikli olarak atıklarımızın oluşumunu önlemek,",
      content:
      "Üniversitemizde oluşan atık floresan lambalarımızı şu anda üç farklı kutuda (Görsel 5) kaynağında ayrı toplayarak lisanslı firmalara teslimini yapıyoruz. Bu uygulamayı tüm birimlerimizde yaygınlaştırmak ve akademik ve idari çalışanlarımız ve öğrencilerimize yönelik evlerimizde oluşan atık elektrik-elektronik eşyalarımızın değerli ürünlere dönüştürülmesini sağlamak amacıyla Çevre ve Şehircilik Bakanlığı tarafından lisanslı Aydınlatma Gereçleri İmalatçıları Derneği (AGİD) ile protokol süreci tamamlanmak üzeredi.Kompost çalışmamız: kampüsümüzde oluşan biyobozunur (yiyecek hazırlama, park ve bahçe vb.) atıklarımızdan kompost üretmeyi ve Park ve Bahçeler Müdürlüğümüz ile iş birliği yaparak, bunu kampüsümüzde kurulacak olan bostan alanında değerlendirmeyi hedefliyoruz.Eğitim ve farkındalık çalışmalarımız: Üniversitemizde meydana gelen atıkların yönetilmesinde benimsediğimiz sıfır atık yaklaşımı ile birlikte öncelikli olarak atıklarımızın oluşumunu önlemek, miktarlarını azaltmak ve kaynağında ayrı o toplamak, çevreye ve insanlara zarar vermeden bertarafını sağlamak için atık yönetim sistemimizde sürekli iyileştirme çalışmaları yapıyor ve bu kapsamda eğitim ve farkındalık çalışmalarımızı sürdürüyoruz. ESTÜ 101 Üniversite Hayatına Giriş dersinde, bu dersi alan öğrencilerimize sıfır atık konusunda eğitimler veriyoruz. Birim Sıfır Atık Odak Noktalarımıza, proje ekiplerimize ve diğer tüm paydaşlarımıza atık yönetimi sistemi ile ilgili eğitimlerimize devam ediyoruz"),
  News(
    author: "ESTU AYS",
    estimate: "5",
    category: "Sıfır Atık",
    favorite: "502",
    seen: "1.2K",
    time: "10 Saat Önce",
    title: "Sıfır Atık Nedir?",
    image:
        "https://raw.githubusercontent.com/unfurkan/quartz-scheduling/main/download.png",
    subtitle:
        "Üniversite kampüslerimizde oluşan atıklarla ilgili uygulanan Atık Yönetim Sistemi şeması:",
    content:
        "“Sıfır Atık”; israfın önlenmesini, kaynakların daha verimli kullanılmasını, atık oluşum sebeplerinin gözden geçirilerek atık oluşumunun engellenmesi veya minimize edilmesi, atığın oluşması durumunda ise kaynağında ayrı toplanması ve geri kazanımının sağlanmasını kapsayan atık yönetim felsefesi olarak tanımlanan bir hedeftir.Atıkların geri dönüşüm ve geri kazanım süreci içinde değerlendirilmeden bertarafı hem maddesel hem de enerji olarak ciddi kaynak kayıpları yaşanmasına neden olmaktadır. Dünya üzerindeki nüfus ve yaşam standartları artarken tüketimde de kaçınılmaz şekilde bir artış yaşanmakta ve bu durum doğal kaynaklarımız üzerindeki baskıyı artırarak dünyanın dengesini bozmakta, sınırlı kaynaklarımız artan ihtiyaçlara yetişememektedir. Bu durum göz önüne alındığında, doğal kaynakların verimli kullanılmasının önemi daha da ortaya çıkmaktadır. Bu nedenledir ki son yıllarda tüm dünyada sıfır atık uygulama çalışmaları hem bireysel hem kurumsal hem de belediye genelinde yaygınlaşmaktadır.",
  )
];

List<News> trendingList = [
  News(
        author: "ESTU AYS",
      estimate: "3",
      category: "Sıfır Atık",
      favorite: "700",
      seen: "4.51K",
      time: "4 Saat Önce",
      title: "Sıfır Atık Çalışmalarımız",
      image: "https://ays.eskisehir.edu.tr/Uploads/ays/images/BMSKA.jpg",
      subtitle:
          "Etkin bir atık yönetimi, atıkların düzenli depolama alanlarına gönderilmesinin yerine, atıkların geri dönüşüm ve/veya geri kazanım yöntemleriyle yeniden birer hammade olarak kullanılarak doğal kaynak kullanımının azaltılmasını sağlar. Bu durum, hem çevresel hem de ekonomik açıdan önemli kazanımların elde edilmesine olanak tanır.",
      content:
          "Etkin bir atık yönetimi, atıkların düzenli depolama alanlarına gönderilmesinin yerine, atıkların geri dönüşüm ve/veya geri kazanım yöntemleriyle yeniden birer hammade olarak kullanılarak doğal kaynak kullanımının azaltılmasını sağlar. Bu durum, hem çevresel hem de ekonomik açıdan önemli kazanımların elde edilmesine olanak tanır.Bu kapsamda, 12 Temmuz 2019 tarihinde (Resmi Gazete No: 30829) yayımlanarak yürürlüğe giren “Sıfır Atık Yönetmeliği”nde, hammadde ve doğal kaynakların etkin yönetimi ile birlikte sürdürülebilir kalkınma amaçları doğrultusunda (Görsel 1), atık yönetimi süreçlerinde çevre ve insan sağlığının ve tüm kaynakların korunmasını hedefleyen Atık Yönetim Sisteminin kurulması, geliştirilmesi, izlenmesi ve kayıt altına alınması gerektiği ifade edilmiştir. Bu kapsamda, Üniversitemizde atık yönetimi ve sıfır atık uygulamalarına yönelik birçok faaliyet gerçekleştirilmektedir."),
  News(
      author: "ESTU AYS",
      estimate: "5",
      category: "Sıfır Atık",
      favorite: "502",
      seen: "1.21K",
      time: "10 Saat Önce",
      title: "Eğitim ve farkındalık çalışmalarımız",
      image: "https://ays.eskisehir.edu.tr/Uploads/ays/images/Screenshot_1.jpg",
      subtitle:
      "Üniversitemizde meydana gelen atıkların yönetilmesinde benimsediğimiz sıfır atık yaklaşımı ile birlikte öncelikli olarak atıklarımızın oluşumunu önlemek,",
      content:
      "Üniversitemizde oluşan atık floresan lambalarımızı şu anda üç farklı kutuda (Görsel 5) kaynağında ayrı toplayarak lisanslı firmalara teslimini yapıyoruz. Bu uygulamayı tüm birimlerimizde yaygınlaştırmak ve akademik ve idari çalışanlarımız ve öğrencilerimize yönelik evlerimizde oluşan atık elektrik-elektronik eşyalarımızın değerli ürünlere dönüştürülmesini sağlamak amacıyla Çevre ve Şehircilik Bakanlığı tarafından lisanslı Aydınlatma Gereçleri İmalatçıları Derneği (AGİD) ile protokol süreci tamamlanmak üzeredi.Kompost çalışmamız: kampüsümüzde oluşan biyobozunur (yiyecek hazırlama, park ve bahçe vb.) atıklarımızdan kompost üretmeyi ve Park ve Bahçeler Müdürlüğümüz ile iş birliği yaparak, bunu kampüsümüzde kurulacak olan bostan alanında değerlendirmeyi hedefliyoruz.Eğitim ve farkındalık çalışmalarımız: Üniversitemizde meydana gelen atıkların yönetilmesinde benimsediğimiz sıfır atık yaklaşımı ile birlikte öncelikli olarak atıklarımızın oluşumunu önlemek, miktarlarını azaltmak ve kaynağında ayrı o toplamak, çevreye ve insanlara zarar vermeden bertarafını sağlamak için atık yönetim sistemimizde sürekli iyileştirme çalışmaları yapıyor ve bu kapsamda eğitim ve farkındalık çalışmalarımızı sürdürüyoruz. ESTÜ 101 Üniversite Hayatına Giriş dersinde, bu dersi alan öğrencilerimize sıfır atık konusunda eğitimler veriyoruz. Birim Sıfır Atık Odak Noktalarımıza, proje ekiplerimize ve diğer tüm paydaşlarımıza atık yönetimi sistemi ile ilgili eğitimlerimize devam ediyoruz"),
  News(
      author: "ESTU AYS",
      estimate: "3",
      category: "Eco Campus",
      favorite: "700",
      seen: "41.51K",
      time: "4 Saat Önce",
      title: "ESTÜ ile AGİD Arasında Protokol İmzalandı",
      image: "https://ays.eskisehir.edu.tr/images/logo_v1.png",
      subtitle:
      "Üniversitemiz ile Aydınlatma Gereçleri İmalatçıları Derneği Ticari İşletmesi (AGİD) arasında kampüslerimizde oluşan atık floresan lambaların ve atık elektrikli ve elektronik eşyaların kaynağında ayrı toplanması ve lisanslı firmalara gönderilmesi ile ilgili 20 Mayıs 2021 tarihinde protokol imzalanmıştır",
      content:
      "Üniversitemiz ile Aydınlatma Gereçleri İmalatçıları Derneği Ticari İşletmesi (AGİD) arasında kampüslerimizde oluşan atık floresan lambaların ve atık elektrikli ve elektronik eşyaların kaynağında ayrı toplanması ve lisanslı firmalara gönderilmesi ile ilgili 20 Mayıs 2021 tarihinde protokol imzalanmıştır. Protokol, 31 Aralık 2023 tarihine kadar geçerli olacaktır.Bu protokol kapsamında, Üniversitemiz'de belirlenen yerlere atık (uzun floresan lamba, atık kompakt lamba, iki bölmeli atık küçük ev aletleri) toplama kutuları temin edilerek yerleştirilecektir"),
  News(
      author: "ESTU AYS",
      estimate: "12",
      category: "Sıfır Atık",
      favorite: "23K",
      seen: "40.51K",
      time: "12 Saat Önce",
      title: "Atık Kutusu Envanteri",
      image: "https://ays.eskisehir.edu.tr/Uploads/ays/images/pil4.jpg",
      subtitle:
          "Üniversitemizde “Sıfır Atık Yaklaşımıyla Atık Yönetimi Sistemi” çalışmalarına ilk olarak birimlerde belirlenen Sıfır Atık Odak noktalarına yapılması planlanan çalışmalarla ilgili bir bilgilendirme toplantısı düzenlenerek başlanmıştır.",
      content:
          "Üniversitemizde oluşan atık floresan lambalarımızı şu anda üç farklı kutuda (Görsel 5) kaynağında ayrı toplayarak lisanslı firmalara teslimini yapıyoruz. Bu uygulamayı tüm birimlerimizde yaygınlaştırmak ve akademik ve idari çalışanlarımız ve öğrencilerimize yönelik evlerimizde oluşan atık elektrik-elektronik eşyalarımızın değerli ürünlere dönüştürülmesini sağlamak amacıyla Çevre ve Şehircilik Bakanlığı tarafından lisanslı Aydınlatma Gereçleri İmalatçıları Derneği (AGİD) ile protokol süreci tamamlanmak üzeredi.Kompost çalışmamız: kampüsümüzde oluşan biyobozunur (yiyecek hazırlama, park ve bahçe vb.) atıklarımızdan kompost üretmeyi ve Park ve Bahçeler Müdürlüğümüz ile iş birliği yaparak, bunu kampüsümüzde kurulacak olan bostan alanında değerlendirmeyi hedefliyoruz.Eğitim ve farkındalık çalışmalarımız: Üniversitemizde meydana gelen atıkların yönetilmesinde benimsediğimiz sıfır atık yaklaşımı ile birlikte öncelikli olarak atıklarımızın oluşumunu önlemek, miktarlarını azaltmak ve kaynağında ayrı o toplamak, çevreye ve insanlara zarar vermeden bertarafını sağlamak için atık yönetim sistemimizde sürekli iyileştirme çalışmaları yapıyor ve bu kapsamda eğitim ve farkındalık çalışmalarımızı sürdürüyoruz. ESTÜ 101 Üniversite Hayatına Giriş dersinde, bu dersi alan öğrencilerimize sıfır atık konusunda eğitimler veriyoruz. Birim Sıfır Atık Odak Noktalarımıza, proje ekiplerimize ve diğer tüm paydaşlarımıza atık yönetimi sistemi ile ilgili eğitimlerimize devam ediyoruz"),

];

List<News> recentList = [
  News(
      author: "ESTU AYS",
      estimate: "3",
      category: "Eco Campus",
      favorite: "700",
      seen: "41.51K",
      time: "4 saat önce",
      title: "ESTÜ ile AGİD Arasında Protokol İmzalandı",
      image: "https://ays.eskisehir.edu.tr/images/logo_v1.png",
      subtitle:
          "Üniversitemiz ile Aydınlatma Gereçleri İmalatçıları Derneği Ticari İşletmesi (AGİD) arasında kampüslerimizde oluşan atık floresan lambaların ve atık elektrikli ve elektronik eşyaların kaynağında ayrı toplanması ve lisanslı firmalara gönderilmesi ile ilgili 20 Mayıs 2021 tarihinde protokol imzalanmıştır",
      content:
          "Üniversitemiz ile Aydınlatma Gereçleri İmalatçıları Derneği Ticari İşletmesi (AGİD) arasında kampüslerimizde oluşan atık floresan lambaların ve atık elektrikli ve elektronik eşyaların kaynağında ayrı toplanması ve lisanslı firmalara gönderilmesi ile ilgili 20 Mayıs 2021 tarihinde protokol imzalanmıştır. Protokol, 31 Aralık 2023 tarihine kadar geçerli olacaktır.Bu protokol kapsamında, Üniversitemiz'de belirlenen yerlere atık (uzun floresan lamba, atık kompakt lamba, iki bölmeli atık küçük ev aletleri) toplama kutuları temin edilerek yerleştirilecektir"),
  News(
      author: "ESTU AYS",
      estimate: "5",
      category: "Eco Campus",
      favorite: "502",
      seen: "11.21K",
      time: "10 saat önce",
      title: "Pandemi Sürecinde Maske Atıklarını Ne Yapmalıyız?",
      image:
          "https://ih1.redbubble.net/image.1364348882.5439/ur,flat_mask_three_quarter,tall_portrait,750x1000.jpg",
      subtitle:
          "Çevre ve Şehircilik Bakanlığı'nın 07.04.2020 tarihinde Tek Kullanımlık Maske.",
      content:
          "Çevre ve Şehircilik Bakanlığı'nın 07.04.2020 tarihinde Tek Kullanımlık Maske, Eldiven Gibi Kişisel Hijyen Malzeme Atıklarının Yönetiminde Covid-19 Tedbirlerine İlişkin yayınladığı genelge ile tek kullanımlık maske, eldiven gibi hijyen malzeme atıklarının bertarafına ilişkin alınması gereken tedbirler belirlenmiştir.Genelgeye göre; atıkların, en az 72 saat bekletildikten sonra “diğer atık” olarak evsel atık kapsamında yönetilmek üzere belediyeye teslim edilmesi sağlanmalıdır."),
  News(
    author: "ESTU AYS",
    estimate: "4",
    category: "Sıfır Atık",
    favorite: "213K",
    seen: "41.51K",
    time: "12 Saat Önce",
    title: "Atıklarımızı Kaynağında Ayrı Topluyoruz!",
    image:
        "https://ays.eskisehir.edu.tr/Uploads/ays/images/tehlikeliat%c4%b1k1.jpg",
    subtitle:
        "Üniversitemizde oluşan atık pil ve atık yazıcı/toner kartuşlarımızın kaynağında ayrı",
    content:
        "Üniversitemizde oluşan atık pil ve atık yazıcı/toner kartuşlarımızın kaynağında ayrı toplanması için kampüslerimizde şu anda 30 farklı noktada atık pil kutusu ve 5 farklı noktada da atık kartuş kutuları konulmuştur. Toplanan atık piller için Çevre ve Şehircilik Bakanlığı tarafından lisanslı Taşınabilir Pil Üreticileri ve İthalatçıları Derneği (TAP)’ne gönderilmektedir.Laboratuvarlarda oluşan laboratuvar kimyasalları birlikte tehlikeli atık kapsamına giren kontamine ambalajlar, kontamine atıklar, atık madeni ve bitkisel yağlar, Çevre ve Şehircilik Bakanlığı’ndan lisanslı firmalara gönderilmekte ve mevzuata ygun bir şekilde bertarafı yapılmaktadır ",
  ),
  News(
    author: "ESTU AYS",
    estimate: "8",
    category: "Sıfır Atık",
    favorite: "12K",
    seen: "31.1K",
    time: "22 Saat Önce",
    title: "ESTÜ AKTİF'de BİZ DE VARIZ!",
    image: "https://www.eskisehir.edu.tr/Uploads/www/Icerik/kucuk/bfc8293f-0350-4f3b-b3a2-a9e43a8d5886-1.jpeg",
    subtitle:
        "ESTÜ Aktif dergisinin 31. sayısında Üniversitemiz'de Sıfır Atık yaklaşmıyla Atık Yönetim Sistemi çalışmalar",
    content:
        "ESTÜ Aktif dergisinin 31. sayısında Üniversitemiz'de Sıfır Atık yaklaşmıyla Atık Yönetim Sistemi çalışmaları ile ilgili yazımız yayınlandı.",
  )

];
