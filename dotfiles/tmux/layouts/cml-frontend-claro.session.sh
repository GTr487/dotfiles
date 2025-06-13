session_root "~/workspace/claro/cml/repositories"

if initialize_session "cml-frontend-claro"; then

  new_window "Editor"
  run_cmd "cd cml-frontend-claro.git"
  run_cmd "nvim ."

  split_v 5
  run_cmd "cd cml-frontend-claro.git"
  run_cmd "HISTFILE=/tmp/cml-frontend-claro_w1p2.zsh_history zsh"
  run_cmd "cls"
  send_keys "npm start"

  split_h 50 
  run_cmd "cd cml-business-service.git"
  run_cmd "HISTFILE=/tmp/cml-frontend-claro_w1p3.zsh_history zsh"
  run_cmd "cls"
  send_keys "mvn spring-boot:run -Pdev-ar"

  new_window "Terminals"
  run_cmd "cd cml-frontend-claro.git"
  run_cmd "git status"

  split_h 50 
  run_cmd "cd cml-business-service.git"
  run_cmd "git status"

  select_window 1
  select_pane 1

fi

finalize_and_go_to_session
