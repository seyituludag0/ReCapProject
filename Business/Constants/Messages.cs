using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Constants
{
    public static class Messages
    {
                                        //Car Message
        public static string CarAdded = "Araba Eklendi";
        public static string CarNameInvalid = "Araba ismi geçersiz";
        public static string MaintenanceTime = "Sistem bakımda";
        public static string CarListed = "Arabalar listelendi";
        public static string ErrorCarListed = "Arabalar listelenemedi";
        public static string DailyPriceInvalid = "Geçersiz fiyat";
        //public static string ErrorDelete = "Araba silinemedi";
        public static string SuccessCarDelete = "Araba silindi";
        public static string SuccessCarUpdated = "Araba güncellendi";
        public static string ErrorCarUpdated = "Araba güncellenemedi";
        public static string CarGet = "Araba getirildi";
        public static string GetCarsByBrandIdMessage = "Arabalar Brand Id ye göre listelenmiştir";
        public static string GetCarsDetailMessage = "Arabaların detayları getirildi";
        public static string GetCarDetailMessage = "Araba detayları getirildi";
        public static string GetUnitPriceMessage = "Arabalar günlük fiyata göre listelenmiştir";
        public static string CarNameAlreadyExists = "Aynı modelde araç var zaten";

        //Customer Message
        public static string CustomerAdded = "Müşteri Eklendi";
        public static string CustomerAddedError = "Müşteri Eklenemedi";
        public static string CustomerNameInvalid = "Müşteri ismi geçersiz";
        public static string CustomerListed = "Müşterilar listelendi";
        public static string ErrorCustomerListed = "Müşterilar listelenemedi";
        //public static string ErrorDelete = "Müşteri silinemedi";
        public static string SuccessCustomerDelete = "Müşteri silindi";
        public static string SuccessCustomerUpdated = "Müşteri bilgileri güncellendi";
        public static string ErrorUpdated = "Müşteri güncellenemedi";
        public static string CustomerGet = "Müşteri getirildi";
        public static string GetCustomerDetailsMessage = "Müşteri detayları getirildi";

        //Rental Message
        public static string RentalAddedError = "Kiralanamadı";
        public static string RentalAdded = "Kiralandı";
        public static string GetAllRental = "Kiralıklar listelendi";
        public static string RentalUpdate = "Kira güncellendi";
        public static string RentalDelete = "Kira silindi";
        public static string GetRentalDto = "Kira bilgileri getirildi";
        public static string GetRentalById = "Kira getirildi";

        //User Message
        public static string UserAdded = "Kullanıcı eklendi";
        public static string UserAddedError = "Kullanıcı eklenemedi";
        public static string UserUpdated = "Kullanıcı güncellendi";
        public static string UserUpdatedError = "Kullanıcı güncellenemedi";
        public static string UserDeleted = "Kullanıcı silindi";
        public static string UserListed = "Kullanıcılar listelendi";
        public static string UserGet = "Kullanıcı getirildi";
        public static string AuthorizationDenied = "Yetkin Yok";
        public static string UserRegistered = "Kayıt başarılı";
        public static string UserNotFound = "Kullanıcı bulunamadı";
        public static string PasswordError = "Hatalı şifre";
        public static string SuccessfulLogin = "Giriş başarılı";
        public static string UserAlreadyExists = "Kullanıcı mevcut";
        public static string AccessTokenCreated = "Token oluşturuldu";

        //Brand Message
        public static string BrandAdded = "Marka eklendi";
        public static string BrandAddedError = "Marka eklenemedi";
        public static string GetBrandByIdMessage = "Markalar Brand Id ye göre listelenmiştir";
        public static string BrandUpdated = "Marka güncellendi";
        public static string BrandUpdatedError = "Marka güncellenemedi";
        public static string BrandDeleted = "Marka silindi";
        public static string GetBrandMessage = "Brand Id ye göre getirildi";

        //Color Message
        public static string ColorListed = "Renkler listelendi";
        public static string ColorAdded = "Renk eklendi";
        public static string ColorAddedError = "Renk eklenemedi";
        public static string GetColorByIdMessage = "Renk Color Id ye göre listelenmiştir";
        public static string ColorUpdated = "Renk güncellendi";
        public static string ColorUpdatedError = "Renk güncellenemedi";
        public static string ColorDeleted = "Renk silindi";
        public static string ColorNameAlreadyExists="Renk zaten var";
        public static string GetCarsByColorIdMessage = "Arabalar Color Id ye göre listelenmiştir";

        //CarImages Message
        public static string CarImageListed = "Resimler listelendi";
        public static string CarImageAdded = "Resim eklendi";
        public static string CarImageAddedError = "Resim eklenemedi";
        public static string GetCarImageByIdMessage = "Resim Car Image Id ye göre listelenmiştir";
        public static string CarImageUpdated = "Resim güncellendi";
        public static string CarImageUpdatedError = "Resim güncellenemedi";
        public static string CarImageDeleted = "Resim silindi";
        public static string GetAllCarByImage = "Araba resimleri getirildi";
        public static string ImageLimitError="Resim sınırına ulaşıldı";

        public static string PaymentAdded = "Ödeme başarıyla kaydedildi";
        public static string GetErrorCarMessage="Araç bilgisi / bilgileri getirilemedi.";
        public static string RentalDetails="Kiralama bilgileri getirildi";
        public static string ChangedPassword = "Şifre değiştirildi";

        //Card
        public static string CardAdded = "Kart bilgileri kaydedildi";
    }
}
