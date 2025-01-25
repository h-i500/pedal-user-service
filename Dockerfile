# ベースイメージとして Red Hat UBI 8 OpenJDK 17 を使用
FROM registry.access.redhat.com/ubi8/openjdk-17:latest

# root ユーザーで証明書を更新
USER root

# 証明書の更新
RUN update-ca-trust extract

# 証明書ストアの設定
ENV TRUSTSTORE_PATH="/etc/pki/ca-trust/extracted/java/cacerts"
ENV TRUSTSTORE_PASSWORD="changeit"

# MavenビルドおよびJava実行時にTrustStoreを適用
ENV MAVEN_OPTS="-Djavax.net.ssl.trustStore=${TRUSTSTORE_PATH} -Djavax.net.ssl.trustStorePassword=${TRUSTSTORE_PASSWORD}"
ENV JAVA_OPTS="-Djavax.net.ssl.trustStore=${TRUSTSTORE_PATH} -Djavax.net.ssl.trustStorePassword=${TRUSTSTORE_PASSWORD}"

# 作業ディレクトリの設定
WORKDIR /app

# pom.xml をコピーし、依存関係を先に解決してキャッシュを活用
COPY pom.xml ./
RUN mvn dependency:go-offline -B

# ソースコードをコピー
COPY src ./src

# Mavenビルドの実行（テストをスキップ）
RUN mvn clean package -DskipTests

# セキュアな実行ユーザーに変更
USER 1001

# アプリケーションの実行
CMD ["java", "-jar", "target/user-service-1.0.0-SNAPSHOT-runner.jar"]
