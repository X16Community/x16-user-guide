LATEX_COMPILER			= xelatex
LATEX_COMPILER_FLAGS	= -halt-on-error -file-line-error -shell-escape

# The name of the final PDF
NAME					= x16_user_guide
GETTING_STARTED_NAME	= x16_getting_started

# The name of the main file
MAIN					= user_guide

TARGETS					= $(MAIN).tex

PARTS					= getting_to_know_commanderx16.tex \
						  preface.tex \
						  setup.tex \
						  using_screen_and_keyboard.tex \
						  graphics.tex \
						  sound.tex \
						  appendix/basic_commands.tex \
						  appendix/basic_table.tex \
						  appendix/screen_codes_table.tex \
						  appendix/memory_map.tex \
						  appendix/65c02_op_codes.tex \
						  appendix/patch_table.tex \
						  appendix/music_play_macros.tex \
						  appendix/ym2151.tex \

TEMPLATES				= CommodoreBlueBook.cls

PDF_ARTIFACTS			= $(MAIN).aux \
						  $(MAIN).bcf \
						  $(MAIN).idx \
						  $(MAIN).log \
						  $(MAIN).pdf \
						  $(MAIN).ptc \
						  $(MAIN).run.xml \
						  $(MAIN).toc

						  # list of figures and list of tables not needed for now
						  # $(MAIN).lof \
						  # $(MAIN).lot \

INDEX_ARTIFACTS			= $(MAIN).ilg \
						  $(MAIN).ind

BIBLIOGRAPHY_ARTIFACTS	= $(MAIN).bbl \
						  $(MAIN).blg

FINAL_ARTIFACTS			= $(NAME).bcf \
						  $(NAME).idx \
						  $(NAME).ptc \
						  $(NAME).run.xml \
						  $(NAME).toc

						  # list of figures and list of tables not needed for now
						  # $(NAME).lof \
						  # $(NAME).lot \

FINAL_SOURCES			=  $(PDF_ARTIFACTS) $(INDEX_ARTIFACTS) $(BIBLIOGRAPHY_ARTIFACTS)

all: $(NAME).pdf

getting_started: NAME = $(GETTING_STARTED_NAME)
getting_started: MAIN = getting_started
getting_started: $(GETTING_STARTED_NAME).pdf


################################################################################
# First pass PDF
################################################################################

$(PDF_ARTIFACTS): $(TARGETS) $(TEMPLATES) $(PARTS)
	$(LATEX_COMPILER) $(LATEX_COMPILER_FLAGS) $(TARGETS)

pdf: $(PDF_ARTIFACTS)

################################################################################
# $(PDF_ARTIFACTS)
################################################################################

$(INDEX_ARTIFACTS): $(PDF_ARTIFACTS)
	makeindex $(MAIN).idx -s indexstyle.ist

index: $(INDEX_ARTIFACTS)

################################################################################
# Bibliography
################################################################################

$(BIBLIOGRAPHY_ARTIFACTS): $(PDF_ARTIFACTS)
	biber $(MAIN)

bibliography: $(BIBLIOGRAPHY_ARTIFACTS)

################################################################################
# Final PDF
################################################################################

$(NAME).pdf: $(FINAL_SOURCES)
	$(LATEX_COMPILER) $(LATEX_COMPILER_FLAGS) -jobname=$(NAME) $(TARGETS)
	$(LATEX_COMPILER) $(LATEX_COMPILER_FLAGS) -jobname=$(NAME) $(TARGETS)

$(GETTING_STARTED_NAME).pdf: $(FINAL_SOURCES)
	$(LATEX_COMPILER) $(LATEX_COMPILER_FLAGS) -jobname=$(NAME) $(TARGETS)
	$(LATEX_COMPILER) $(LATEX_COMPILER_FLAGS) -jobname=$(NAME) $(TARGETS)

################################################################################
# Clean
################################################################################

clean: clean_pdf_artifacts clean_index_artifacts clean_bibliography_artifacts clean_final_artifacts clean_appendix
	rm -f *.pdf *.aux *.log

clean_appendix:
	rm -f appendix/*.aux

clean_pdf_artifacts:
	rm -f $(PDF_ARTIFACTS)

clean_index_artifacts:
	rm -f $(INDEX_ARTIFACTS)

clean_bibliography_artifacts:
	rm -f $(BIBLIOGRAPHY_ARTIFACTS)

clean_final_artifacts:
	rm -f $(FINAL_ARTIFACTS)

clean_getting_started: NAME = $(GETTING_STARTED_NAME)
clean_getting_started: MAIN = getting_started
clean_getting_started: clean


################################################################################
# Run
################################################################################

run: all
	zathura $(NAME).pdf
