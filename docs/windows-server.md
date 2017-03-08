윈도우 서버 메모
========

### 기본적인 세팅
1.  IE 10 이하일경우, Chrome이나 Firefox 둘중하나 설치
1.  브라우저들에 uBlock Origin + HTTPS Everywhere + privacy badger 설치.
    크롬의경우 uBlock Origin Extra도 설치
1.  브라우저들의 홈화면/검색공급자를 https://encrypted.google.com 로 변경
1.  배경화면 그림 바꾸기 :shipit:
1.  bginfo 실행해서 시스템 정보 배경화면에 표시

### 서비스 만드는법
```cmd
:: 서비스 만드는법
sc create gogs start= auto binPath= ""C:\gogs\gogs.exe" web --config "C:\gogs\custom\conf\app.ini""

:: 서비스 실행
net start gogs
```
