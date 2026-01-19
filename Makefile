.PHONY: help git clean cv watch-cv app compile-app watch-app list build-all

CV_OUTPUT = TudorAndrei-Dumitrascu-CV.pdf

help: ## show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'

git: ## backup all files to git repository
	git add .
	git commit -m "backup the files"
	git push

clean: ## remove all generated PDF files
	rm -f *.pdf
	rm -f applications/*/*.pdf
	@echo "All PDF files removed."

cv: ## compile the full CV and open it
	typst compile cv.typ $(CV_OUTPUT)
	@echo "Opening $(CV_OUTPUT)..."
	@xdg-open $(CV_OUTPUT) &>/dev/null &

watch-cv: ## watch the CV file for changes and auto-rebuild
	typst watch cv.typ $(CV_OUTPUT)

app: ## create or compile an application resume (Usage: make app applications/OpenAI-AIEngineer)
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Error: Application directory is required."; \
		echo "Usage: make app applications/OpenAI-AIEngineer"; \
		exit 1; \
	fi
	@APP_DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
		if [ ! -d "$$APP_DIR" ]; then \
			echo "Creating directory $$APP_DIR..."; \
			mkdir -p "$$APP_DIR"; \
			cp templates/application_template.typ "$$APP_DIR/resume.typ"; \
			echo "Template copied to $$APP_DIR/resume.typ"; \
		fi; \
		if [ ! -f "$$APP_DIR/resume.typ" ]; then \
			cp templates/application_template.typ "$$APP_DIR/resume.typ"; \
		fi; \
		if [ ! -f "$$APP_DIR/config.json" ]; then \
			echo "Error: config.json not found in $$APP_DIR/"; \
			echo "Please create config.json before compiling."; \
			exit 1; \
		fi; \
		typst compile --root=. "$$APP_DIR/resume.typ" "$$APP_DIR/TudorAndrei-Dumitrascu-Resume.pdf"; \
	echo "Resume compiled: $$APP_DIR/TudorAndrei-Dumitrascu-Resume.pdf"; \
	echo "Opening the resume..."; \
	xdg-open "$$APP_DIR/TudorAndrei-Dumitrascu-Resume.pdf" &>/dev/null &

compile-app: ## compile an application resume (Usage: make compile-app applications/OpenAI-AIEngineer)
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Error: Application directory is required."; \
		echo "Usage: make compile-app applications/OpenAI-AIEngineer"; \
		exit 1; \
	fi
	@APP_DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	if [ ! -d "$$APP_DIR" ]; then \
		echo "Error: Application directory $$APP_DIR does not exist."; \
		exit 1; \
	fi; \
	if [ ! -f "$$APP_DIR/config.json" ]; then \
		echo "Error: config.json not found in $$APP_DIR/"; \
		exit 1; \
	fi; \
	typst compile --root=. "$$APP_DIR/resume.typ" "$$APP_DIR/TudorAndrei-Dumitrascu-Resume.pdf"; \
	echo "Resume compiled: $$APP_DIR/TudorAndrei-Dumitrascu-Resume.pdf"

# This is a rule to match any target that isn't defined
# It's used to capture arguments passed to app, watch-app commands
%:
	@:

watch-app: ## watch an application resume for changes (Usage: make watch-app applications/OpenAI-AIEngineer)
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Error: Application directory is required."; \
		echo "Usage: make watch-app applications/OpenAI-AIEngineer"; \
		exit 1; \
	fi
	@APP_DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	if [ ! -d "$$APP_DIR" ]; then \
		echo "Error: Application directory $$APP_DIR does not exist."; \
		exit 1; \
	fi; \
	if [ ! -f "$$APP_DIR/config.json" ]; then \
		echo "Error: config.json not found in $$APP_DIR/"; \
		exit 1; \
	fi; \
	typst watch --root=. "$$APP_DIR/resume.typ" "$$APP_DIR/TudorAndrei-Dumitrascu-Resume.pdf"

list: ## list all applications
	@echo "Available Application Resumes:"
	@for dir in applications/*/; do \
		if [ -d "$$dir" ]; then \
			base=$$(basename "$$dir"); \
			echo "  $$base"; \
		fi; \
	done

build-all: cv ## build the CV and all application resumes
	@echo "Building all application resumes..."
	@for dir in applications/*/; do \
		if [ -d "$$dir" ]; then \
			base=$$(basename "$$dir"); \
			echo "Building resume for $$base..."; \
			typst compile --root=. "$$dir/resume.typ" "$$dir/TudorAndrei-Dumitrascu-Resume.pdf"; \
		fi; \
	done
	@echo "All resumes built successfully!"
	@echo "Opening the CV..."
	@xdg-open $(CV_OUTPUT) &>/dev/null &

all:
	help
