윈도우 서버 메모
========

### 기본적인 세팅
1.  IE 10 이하일경우, Firefox 설치, 기본브라우저로 FF 사용.
1.  UI 원하는대로 개인화.
1.  IE와 FF, Edge의 홈화면/검색공급자를 https://encrypted.google.com 로 변경
1.  파이어폭스에 uBlock Origin + HTTPS Everywhere + privacy badger 설치.
1.  파이어폭스 개인정보 설정에 들어가서, "방문 기록 저장 안 함" 설정.
    이렇게 하면 항상 사생활 보호 모드가 켜진것처럼 작동한다.
1.  서버들을 구분할 수 있도록 배경화면을 바꿔주기. [1](https://s-media-cache-ak0.pinimg.com/originals/e1/a2/9c/e1a29c67bdb153888db3e126256363ca.png) [2](http://icanbecreative.com/resources/files/articles/40-high-resolution-wallpapers-for-minimalist-lovers/sources/flying-turtle.png)

### 서비스 만드는법
```cmd
:: 서비스 만드는법
sc create gogs start= auto binPath= ""C:\gogs\gogs.exe" web --config "C:\gogs\custom\conf\app.ini""

:: 서비스 실행
net start gogs
```
