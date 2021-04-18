# ReCapProject
Bu projede ele araç kiralama sistemi ele alınmıştır.

# Katmanlar
* ### Proje Business, DataAccess, Entities, ConsoleUI, Core, WebAPI olmak üzere 6 katmandan oluşmaktadır.

## Solution Explorer
![SolutionExplorer](https://user-images.githubusercontent.com/76704724/115153139-252d1600-a07d-11eb-9368-f8f1166b87bd.PNG)

# Business Katmanı
Business katmanında iş kodları yer alır.
Bu katmanda abstract(interface) ve concrete(class) klasörleri olmak üzere 2 ana klasörden oluşmaktadır. <br/>
![Business](https://user-images.githubusercontent.com/76704724/115155133-2f541200-a087-11eb-9379-23b4b0b7144e.PNG)

# Business Katmanı Klasörleri
Abstract, Business, Business Aspects, Concrete, Constants, DependencyResolvers, Autofac, ValidationRules Klasörleri
![BusinessLayer](https://user-images.githubusercontent.com/76704724/115155212-8b1e9b00-a087-11eb-9ace-069370bf12be.PNG) <br/>
![BusinessLayer(ValidationRules)](https://user-images.githubusercontent.com/76704724/115155458-b6ee5080-a088-11eb-8913-d3c4e46fa39d.PNG)

# Core Katmanı
Bir framework katmanı olan Core Katmanı'nda DataAccess, Entities, Utilities olmak üzere 3 adet klasör bulunmaktadır.DataAccess klasörü DataAccess Katmanı ile ilgili nesneleri, Entities klasörü Entities katmanı ile ilgili nesneleri tutmak için oluşturulmuştur. Core katmanının .Net Core ile hiçbir bağlantısı yoktur.Oluşturulan core katmanında ortak kodlar tutulur. Core katmanı ile, kurumsal bir yapıda, alt yapı ekibi ilgilenir.
