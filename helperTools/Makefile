install_cmd := ./git-hooks --install
uninstall_cmd := ./git-hooks --uninstall
user_bin := $(HOME)/bin
install:
		@test -d $(user_bin) || echo 'Creating $(user_bin) ...'; mkdir -p $(user_bin);
		@test -d $(HOME)/.bash_profile || touch $(HOME)/.bash_profile
		@echo PATH=$(PATH):$(user_bin) >> $(HOME)/.bash_profile
		@echo export PATH >> $(HOME)/.bash_profile
		@test -s $(user_bin)/git-hooks || ln -s $(shell pwd)/git-hooks $(user_bin)/git-hooks;
		@echo 'Installing hooks ...'
		@$(install_cmd)	
clean:
		@$(uninstall_cmd)
		@rm -f $(user_bin)/git-hooks
