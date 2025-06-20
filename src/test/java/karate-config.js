function fn() {
  let env = karate.env || 'local';
  
  // Configuración base para todos los entornos
  let config = {
    baseUrl: 'http://localhost:8080'
  };
  
  // URLs para todos los microservicios (nombrados con formato port_nombre_microservicio)
  config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api';
  
  // Configuración específica por entorno
  if (env == 'dev') {
    config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api';
  } else if (env == 'qa') {
    config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api';
  }
  
  karate.log('karate.env:', env);
  karate.log('config:', config);
  return config;
}
