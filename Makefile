mkfilepath := $(abspath $(lastword $(MAKEFILE_LIST)))
currentdir := $(shell pwd)
helperdir := $(currentdir)/helperTools
githooksdir := $(currentdir)/git_hooks
gitignore := .gitignore
tmpfile := tmp
install:
		@echo 'Ensuring permission on hooks ...'
		@chmod 755 $(githooksdir) -R
		@cd $(helperdir) && make

# Put helperdir and githooks in gitignore we don't want those to change
# Only code maintainers should change those !! 
# What's better approach for this ??
 		ifeq (,$(wildcard $(gitignore)))
			@echo 'Creating $(gitignore) ...'
			@cat /dev/null > $(gitignore)
			@echo 'helperTools' >> $(gitignore) 
			@echo 'git_hooks'   >> $(gitignore)
			@echo '*gitignore'  >> $(gitignore)
 		endif
clean:
		@rm -f $(gitignore)
		@cd $(helperdir) && make clean
		@echo 'Cleaning complete ...'
