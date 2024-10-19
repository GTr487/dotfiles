session_root "~/workspace/claro/cml/repositories"

if initialize_session "cml-frontend-claro"; then

  new_window "Editor"
  run_cmd "nvim cml-frontend-claro.git"

  split_v 5
  run_cmd "cd cml-frontend-claro.git"
  send_keys "npm start"

  split_h 50 
  run_cmd "cd cml-business-service.git"
  send_keys "mvn spring-boot:run -Pdev-ar"

  select_pane 1

fi

finalize_and_go_to_session
