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
![CoreLayer](https://user-images.githubusercontent.com/76704724/115156273-1ef26600-a08c-11eb-96ec-b14d077471d2.PNG) <br/>
![CoreAspect](https://user-images.githubusercontent.com/76704724/115156120-7e9c4180-a08b-11eb-9cb6-e3089fdbdd32.PNG) <br/>
![CoreUtilities](https://user-images.githubusercontent.com/76704724/115156186-b60aee00-a08b-11eb-8a92-34eced0a1829.PNG) <br/>
![CoreDataAccess](https://user-images.githubusercontent.com/76704724/115156192-bf945600-a08b-11eb-9dc9-8dbf418ae00d.PNG) <br/>

# Data Access Katmanı
Veritabanı CRUD işlemleri gerçekleştirmek için oluşturulan Data Access Katmanı'nda Abstract ve Concrete olmak üzere iki adet klasör bulunmaktadır.Abstract klasörü soyut nesneleri, Concrete klasörü ise somut nesneleri tutmak için oluşturulmuştur.
![DataAccessLayer](https://user-images.githubusercontent.com/76704724/115159433-bf03bb80-a09b-11eb-9d8a-c7ec8a9e986e.PNG) <br/>


## Entities Katmanı
![EntitiesLayer](https://user-images.githubusercontent.com/76704724/115159584-8c0df780-a09c-11eb-937e-ed861a850ddc.PNG) <br/>
Veritabanı nesneleri için oluşturulmuş Entities Katmanı'nda Abstract ve Concrete olmak üzere iki adet klasör bulunmaktadır.Abstract klasörü soyut nesneleri, Concrete klasörü somut nesneleri tutmak için oluşturulmuştur.

## UIConsole Katmanı
![UIConsoleLayer](https://user-images.githubusercontent.com/76704724/115159664-f888f680-a09c-11eb-87a0-d74796584294.PNG) <br/>
Kodların doğru çalıştığını görmek için kullandığımız katman test katmanı da diyebiliriz.
