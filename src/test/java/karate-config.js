function fn() {

   var env = karate.env;

    karate.log('karate.env system property was:', env);

   if (!env) {
          env = '';
      }

    var config = {
        baseUrl: 'https://' + env + 'petstore.swagger.io/v2/',
        modelPath: 'classpath:model',
        callersPath: 'classpath:callers',
        featuresPath: 'classpath:features',
        helpersPath: 'classpath:helpers'
    }

    karate.log('config.properties =', JSON.stringify(karate.properties));
    karate.log('config.baseUrl =', config.baseUrl);
    karate.configure('connectTimeout', 500000);
    karate.configure('readTimeout',500000);
    karate.configure('abortedStepsShouldPass', true);
    return config;
}
