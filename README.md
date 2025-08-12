## Описание Архитектуры

Приложение было разбито на следующие модули:
* **App** - Вход в приложение, здесь осуществляется регистрация всех зависимостей
* **DI** - DI слой, содержит все необходимое для DI
* **Common** - Содержит общий функционал, который может использоваться в любой части проекта
* **DesignSystem** - Содержит все UI компоненты
* **CoreEntities** - Содержит Domain модельки
* **Navigation** - Слой навигации, содержит логику навигации
* **AdsFeature** - Фича объявлений
* **ChatFeature** - Чат
* **ProfileFeature** - Профиль
* **AuthFeature** - Авторизация
* **API** - Содержит Network DataSources
* **LocalAPI** - Содержит Local DataSources
* **Networking** - Обретка над сетевым слоем (URLSession в моем случае)
* **Persistance** - Обертка над local persistance (CoreData в моем случае)
* **ImageLoader** - Содержит фунционал для скачивания изображений
* **Analytics** - Аналитика
* **Logger** - Логирование

<img src="https://github.com/ReFon-team/ReFon/blob/master/Screens/modules.png" alt="Modules scheme">

## Инструкции по сборке

Скачать tuist, если еще не скачен

```bash
brew install tuist
```

В корневой папке проекта выполнить

```bash
tuist generate
```

Выбрать схему App в XCodе, если не выбрана

Запустить приложение