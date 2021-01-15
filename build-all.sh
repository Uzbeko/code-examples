#!/bin/bash

MODULE=$1
MAIN_DIR=$PWD

build_gradle_module() {
  MODULE_PATH=$1
  echo ""
  echo "+++"
  echo "+++ BUILDING MODULE $MODULE_PATH"
  echo "+++"
  cd $MODULE_PATH && {
    chmod +x gradlew
    ./gradlew clean build
    if [ $? -ne 0 ]
    then
      echo ""
      echo "+++"
      echo "+++ BUILDING MODULE $MODULE_PATH FAILED"
      echo "+++"
      exit 1
    else
      echo ""
      echo "+++"
      echo "+++ BUILDING MODULE $MODULE_PATH SUCCESSFUL"
      echo "+++"
    fi
    cd $MAIN_DIR
  }
}

run_gradle_task() {
  MODULE_PATH=$1
  TASK_NAME=$2
  echo ""
  echo "+++"
  echo "+++ RUNNING GRADLE TASK $MODULE_PATH : $TASK_NAME"
  echo "+++"
  cd $MODULE_PATH && {
    chmod +x gradlew
    ./gradlew $TASK_NAME
    if [ $? -ne 0 ]
    then
      echo ""
      echo "+++"
      echo "+++ GRADLE TASK $MODULE_PATH : $TASK_NAME FAILED"
      echo "+++"
      exit 1
    else
      echo ""
      echo "+++"
      echo "+++ GRADLE TASK $MODULE_PATH : $TASK_NAME SUCCESSFUL"
      echo "+++"
    fi
    cd $MAIN_DIR
  }
}

build_maven_module() {
  MODULE_PATH=$1
  echo ""
  echo "+++"
  echo "+++ BUILDING MODULE $MODULE_PATH"
  echo "+++"
  cd $MODULE_PATH && {
    chmod +x mvnw
    ./mvnw clean package
    if [ $? -ne 0 ]
    then
      echo ""
      echo "+++"
      echo "+++ BUILDING MODULE $MODULE_PATH FAILED"
      echo "+++"
      exit 1
    else
      echo ""
      echo "+++"
      echo "+++ BUILDING MODULE $MODULE_PATH SUCCESSFUL"
      echo "+++"
    fi
    cd $MAIN_DIR
  }
}

if [[ "$MODULE" == "module5" ]]
then
  # ADD NEW MODULES HERE
  # (add new modules above the rest so you get quicker feedback if it fails)
  build_maven_module "graphql"
  build_maven_module "spring-boot/spring-boot-logging-2"
  build_gradle_module "spring-boot/devtools-demo"
  build_gradle_module "spring-boot/cache"
  build_gradle_module "spring-boot/bean-lifecycle"
  build_gradle_module "spring-boot/request-response/client"
  build_gradle_module "spring-boot/request-response/server"
  build_gradle_module "spring-boot/hazelcast/hazelcast-embedded-cache"
  build_gradle_module "spring-boot/hazelcast/hazelcast-client-server"

  echo ""
  echo "+++"
  echo "+++ MODULE 5 SUCCESSFUL"
  echo "+++"
fi


if [[ "$MODULE" == "module1" ]]
then
  build_maven_module "spring-boot/spring-boot-kafka"
  build_gradle_module "spring-boot/spring-boot-springdoc"
  build_maven_module "spring-boot/dependency-injection"
  build_maven_module "spring-boot/spring-boot-openapi"
  build_maven_module "spring-boot/data-migration/liquibase"
  build_gradle_module "spring-boot/boundaries"
  build_gradle_module "spring-boot/argumentresolver"
  build_gradle_module "spring-boot/data-migration/flyway"
  run_gradle_task "spring-boot/thymeleaf-vue" "clean npmInstall build"
  build_gradle_module "spring-boot/conditionals"
  build_gradle_module "spring-boot/configuration"

  echo ""
  echo "+++"
  echo "+++ MODULE 1 SUCCESSFUL"
  echo "+++"
fi

if [[ "$MODULE" == "module2" ]]
then
  build_gradle_module "solid/isp"
  build_maven_module "solid/lsp"
  build_maven_module "resilience4j/retry"
  build_maven_module "resilience4j/ratelimiter"
  build_maven_module "resilience4j/timelimiter"
  build_gradle_module "spring-data/spring-data-jdbc-converter"
  build_gradle_module "reactive"
  build_gradle_module "junit/assumptions"
  build_gradle_module "logging"
  build_gradle_module "pact/pact-feign-consumer"

  echo ""
  echo "+++"
  echo "+++ MODULE 2 SUCCESSFUL"
  echo "+++"
fi

if [[ "$MODULE" == "module3" ]]
then
  build_maven_module "aws/localstack"
  build_gradle_module "pact/pact-spring-provider"
  build_gradle_module "patterns"
  build_gradle_module "spring-cloud/feign-with-spring-data-rest"
  build_gradle_module "spring-cloud/sleuth-downstream-service"
  build_gradle_module "spring-cloud/sleuth-upstream-service"
  build_gradle_module "spring-cloud/spring-cloud-contract-provider" # has to run before consumer
  build_gradle_module "spring-cloud/spring-cloud-contract-consumer"
  build_gradle_module "spring-data/spring-data-rest-associations"
  build_gradle_module "spring-data/spring-data-rest-springfox"
  build_gradle_module "tools/jacoco"

  echo ""
  echo "+++"
  echo "+++ MODULE 3 SUCCESSFUL"
  echo "+++"
fi

if [[ "$MODULE" == "module4" ]]
then
  build_gradle_module "spring-boot/mocking"
  build_gradle_module "spring-boot/modular"
  build_gradle_module "spring-boot/paging"
  build_gradle_module "spring-boot/rabbitmq-event-brokering"
  build_gradle_module "spring-boot/spring-boot-logging"
  build_gradle_module "spring-boot/spring-boot-testing"
  build_gradle_module "spring-boot/starter"
  build_gradle_module "spring-boot/startup"
  build_gradle_module "spring-boot/static"
  build_gradle_module "spring-boot/validation"
  build_gradle_module "spring-boot/profiles"
  build_gradle_module "spring-boot/password-encoding"
  build_gradle_module "spring-boot/testcontainers"

  echo ""
  echo "+++"
  echo "+++ MODULE 4 SUCCESSFUL"
  echo "+++"
fi