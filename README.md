## 프로젝트 설명
http와 https 간의 교차통신과 관련된 샘플 애플리케이션

## tomcat ssl 설정
openssl을 통해 파일들을 생성하고 tomcat의 server.xml에 SSL 설정 부분을 아래처럼 바꾼다.
```xml
<Connector SSLEnabled="true" clientAuth="false"
       keystoreFile="keystore 파일 위치" keystorePass="생성한 keystore의 비밀번호" keystoreType="pkcs12" maxThreads="150" port="8443"
       protocol="org.apache.coyote.http11.Http11NioProtocol" scheme="https" secure="true" sslProtocol="TLS"/>
```