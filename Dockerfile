# ============================================================
# Dockerfile para desplegar Danimar como sitio web (una sola URL).
# Compila el backend (Spring Boot) e incluye el frontend dentro de
# los recursos estáticos, de modo que un solo servicio sirve la API
# y las páginas.
#
# Contexto de build: la RAÍZ del repositorio (donde están las
# carpetas backend/ y frontend/).
# ============================================================

# ---------- Etapa 1: compilación ----------
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Dependencias de Maven (capa cacheable)
COPY backend/.mvn/ .mvn/
COPY backend/mvnw backend/pom.xml ./
RUN chmod +x mvnw && ./mvnw -q -DskipTests dependency:go-offline || true

# Código fuente del backend
COPY backend/src ./src

# Incluir el frontend dentro de los estáticos de Spring (mismo origen)
COPY frontend/ ./src/main/resources/static/

# Empaquetar el .jar
RUN ./mvnw -q -DskipTests clean package

# ---------- Etapa 2: ejecución ----------
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# El host define la variable PORT; la app la lee desde application.properties.
ENTRYPOINT ["java", "-jar", "app.jar"]
