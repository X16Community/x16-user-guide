%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Commodore Blue Book
% LaTeX Class
% Version 3.1 (February 18, 2022)
%
% Authors:
% Jestin Stoffel (jestin.stoffel@gmail.com)
%
% Originally forked from:
%
% The Legrand Orange Book
% LaTeX Class
% Version 3.1 (February 18, 2022)
%
% Authors:
% Vel (vel@latextemplates.com)
% Mathias Legrand (legrand.mathias@gmail.com)
% 
% This class originates from:
% https://www.LaTeXTemplates.com
%
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CommodoreBlueBook}[2022/01/26 The Commodore Blue Book Class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{book} % Load the base class

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES AND CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{graphicx} % Required for including pictures
\graphicspath{{Images/}} % Specifies the directory where pictures are stored

\usepackage{float} % Allows more precisely positioning floats e.g. \begin{figure}[H]

\usepackage[usenames, svgnames, table]{xcolor} % Required for defining and using custom colors

\usepackage{calc} % For simpler calculations - used for spacing the index letter headings correctly

\usepackage{changepage} % Required for temporarily indenting text blocks

\usepackage[toc]{appendix} % Required for the appendices chapters

\usepackage{etoolbox} % Required for conditional logic and easily changing commands

\usepackage{afterpage}

\usepackage{anyfontsize}

\usepackage{contour}

\usepackage{fmtcount}

\usepackage{tcolorbox}

\usepackage[hang,flushmargin]{footmisc}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	papersize={5.5in,8.5in},
	top=0.5in, % Top margin
	bottom=0.75in, % Bottom margin
	inner=0.5in, % Inner margin (left on odd pages, right on even or left in oneside mode)
	outer=0.5in, % Outer margin (right on odd pages, left on even or right in oneside mode)
	headsep=10pt, % Space from the top margin to the baseline of the header
	headheight=0.25in, % Header height
	footskip=0.5in, % Space from the bottom margin to the baseline of the footer
	columnsep=0.5in, % Horizontal space between columns when in two column mode
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage{newcent} % Use the Libre Baskerville font for serif

\usepackage{helvet} % Use the New Century font for sans serif

\usepackage{microtype} % Improve typography

% use sans serif as default
\renewcommand{\familydefault}{\sfdefault}

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for customizing headers and footers
\pagestyle{fancy} % Enable the custom headers and footers

\renewcommand{\headrulewidth}{0.0pt} % Top horizontal rule thickness

\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\chaptername\ \thechapter.~#1}{}} % Redefine the styling of the current chapter name in the header
\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection~#1}{}} % Redefine the styling of the current section name in the header

\fancyhf{} % Clear default headers and footers

\fancyfoot[C]{\sffamily\thepage}

% change the footer for part pages
\fancypagestyle{part}{
	\fancyhead{}
	\fancyfoot[C]{\color{white}\sffamily\thepage}
}

\fancypagestyle{plain}{ % Style for when a plain pagestyle is specified
	\fancyhead{} % Clear headers
	\renewcommand{\headrulewidth}{0pt} % Remove header rule
}

\usepackage{emptypage} % This package removes headers and footers on empty pages between chapters

%----------------------------------------------------------------------------------------
%	CODE BLOCKS
%----------------------------------------------------------------------------------------

\newcommand{\codeblock}[1]{
	\begin{ttfamily}
	\begin{bfseries}

		#1
	
	\end{bfseries}
	\end{ttfamily}
}

%----------------------------------------------------------------------------------------
%	TIPS
%----------------------------------------------------------------------------------------

\newcommand{\tip}[2]{
	\begin{tcolorbox}[
			colback=white,
			colframe=blue,
			width=4.25in,
			]

			{

				\sffamily\bfseries\fontsize{16pt}{16pt}\selectfont X16 TIP:
				\uppercase{#1}\\

			}

			#2

	\end{tcolorbox}

	\vspace{16pt}
}

%----------------------------------------------------------------------------------------
%	NOTES
%----------------------------------------------------------------------------------------

\newcommand{\note}[1]{
	\begin{tcolorbox}[
			colback=white,
			colframe=blue,
			width=4.25in,
			]
			{\sffamily\bfseries\fontsize{16pt}{16pt}\selectfont NOTE:\\}

			#1

	\end{tcolorbox}

	\vspace{16pt}
}

%----------------------------------------------------------------------------------------
%	BUBBLES
%----------------------------------------------------------------------------------------

\newcommand{\sizedbubble}[6]{
	% draw a phantom box first, so we have the position
	\node[
		anchor=west,
		xshift=#2,
		yshift=#3,
		overlay,
		relative,
		rectangle,draw=blue,text=black,fill=white](r) at (0,0) {
		\phantom{\parbox{#1}{#6}}
		};
	
	% draw the line from the center of the phantom
	\draw [
		overlay,
		anchor=west,
		-stealth,
		line width = 0.03in,
		black
		](r.center) -- (#4,#5);

	% actually draw the bubble box
	\node[
		anchor=west,
		xshift=#2,
		yshift=#3,
		overlay,
		relative,
		rectangle,draw=blue,text=black,fill=white](b) at (0,0) {
		\parbox{#1}{#6}
		};
}

\newcommand{\bubble}[5]{\sizedbubble{2in}{#1}{#2}{#3}{#4}{#5}}
\newcommand{\smallbubble}[5]{\sizedbubble{1.5in}{#1}{#2}{#3}{#4}{#5}}
\newcommand{\tinybubble}[5]{\sizedbubble{0.80in}{#1}{#2}{#3}{#4}{#5}}

%----------------------------------------------------------------------------------------
%	KEYS
%----------------------------------------------------------------------------------------

% Command to store the current key background color to use for all future keys,
% can be changed any time in the document and can be empty
\newcommand{\thekeybackgroundcolor}{black}
\newcommand{\keybackgroundcolor}[1]{\renewcommand{\thekeybackgroundcolor}{#1}}

% Command to store the current key text color to use for all future keys,
% can be changed any time in the document and can be empty
\newcommand{\thekeytextcolor}{white}
\newcommand{\keytextcolor}[1]{\renewcommand{\thekeytextcolor}{#1}}

\newtcolorbox{outputkey}[2]{
	size=small,
	colback=#1,
	coltext=#2,
	width=0.22in,
	fontupper=\bfseries,
	nobeforeafter,
	halign=center,
	box align=bottom,
	baseline=3pt,
	left=0in,
	top=0in,
	bottom=0in,
	right=0in,
	text height=7pt
}

\newcommand{\key}[1]{
	\begin{outputkey}{\thekeybackgroundcolor}{\thekeytextcolor}
		\uppercase{#1}
	\end{outputkey}
}

\newtcolorbox{outputdoublekey}[2]{
	colback=#1,
	coltext=#2,
	size=small,
	fontupper=\fontsize{8pt}{8pt}\selectfont\bfseries,
	width=0.40in,
	height=0.30in,
	box align=base,
	nobeforeafter,
	halign=center,
	valign=center,
	left=0in,
	top=0.04in,
	bottom=0in,
	right=0in,
	baseline=4pt
}
\newcommand{\doublekey}[1]{
	\begin{outputdoublekey}{\thekeybackgroundcolor}{\thekeytextcolor}
		\uppercase{#1}
	\end{outputdoublekey}
}

\newtcolorbox{outputwidekey}[2]
{
	colback=#1,
	coltext=#2,
	size=small,
	fontupper=\tiny\bfseries,
	hbox,
	width=0.7in,
	height=0.25in,
	box align=base,
	nobeforeafter,
	valign=center,
	halign=center,
	boxsep=0.0in,
	baseline=4pt
}
\newcommand{\widekey}[1]{
	\begin{outputwidekey}{\thekeybackgroundcolor}{\thekeytextcolor}
		\fontsize{10pt}{10pt}\selectfont\uppercase{#1}
	\end{outputwidekey}
}

%----------------------------------------------------------------------------------------
%	SCREEN BOX
%----------------------------------------------------------------------------------------

% a cursor to be used with screen boxes
\newcommand{\cursor}{
	\begin{tikzpicture}
		\node[
			rectangle,
			fill = white,
			draw] (r) at (0,0) {};
	\end{tikzpicture}
}

% useful for wrapping screens
\def\enablehyph#1{\enablehyphA #1\end}
\def\enablehyphA#1{\ifx\end#1\unskip\unpenalty
\else#1\penalty0\hskip0pt plus1pt\relax
\expandafter\enablehyphA\fi}


\newcommand{\screenbox}[3]{
	\begin{tcolorbox}[
			colback=blue,
			colframe=blue,
			coltext=white,
			width=#1,
			height=#2
			]
			\sffamily\bfseries
	#3
	\end{tcolorbox}
}

%----------------------------------------------------------------------------------------
%	TYPE IN COMMAND
%----------------------------------------------------------------------------------------
\newcommand{\outputtypein}[1]{
	{
		\noindent\Huge\sffamily\bfseries\color{blue}
		Try typing this program:
	}\\\\
	{
		\noindent\fontsize{16pt}{16pt}\selectfont\sffamily
	Type this program exactly as shown and see what happens!
	}\\

	\begin{tcolorbox}[
			colback=blue,
			colframe=blue,
			coltext=white,
			width=2.375in,
			height=1.75in
			]
			\sffamily\bfseries
	#1
	\end{tcolorbox}

	\vspace{16pt}

	{
		\keybackgroundcolor{white}
		\keytextcolor{black}
		Type \key{r}\key{u}\key{n} and hit \keybackgroundcolor{gray}\widekey{return}
	}

	{
		\keybackgroundcolor{gray}
		\keytextcolor{black}
		\noindent\fontsize{16pt}{16pt}\selectfont\sffamily
	To stop the program, press the \doublekey{RUN\\STOP} key.
	}
}

%----------------------------------------------------------------------------------------
%	SECTION STYLING
%----------------------------------------------------------------------------------------

\setcounter{secnumdepth}{3} % Number sections down to subsubsections, a value of 2 will number to subsections only and 1 to sections only

\usepackage[
	explicit, % Specify section names explicitly in \titleformat with #1
	newparttoc, % Required for writing the part toc entry number in a standard way (overriding default LaTeX behavior) so the titletoc package can style it
]{titlesec} % Required for modifying sections

%-------------------------------------------

\renewcommand{\thepart}{\arabic{part}}

% Command to create and output the parts pages
\newcommand{\outputpartpage}[2]{
	\thispagestyle{part} % use part header/footer style
	\begin{tikzpicture}[remember picture, overlay]

		% Background color
		\node[anchor=center,
		rectangle,
		fill=blue,
		inner sep=0pt,
		minimum height=\paperheight,
		minimum width=\paperwidth] at (current page.center) {};

		% Lines
		\draw[white, thick] (-3,2.0) -- (13,2.0);
		\draw[white, thick] (-3,2.125) -- (13,2.125);
		\draw[white, thick] (-3,2.25) -- (13,2.25);

		% Part number
		\node[
			anchor=north east,
			inner sep=0pt,
			xshift=-0.5in,
			yshift=-0.5in] at (current page.north east){
			\contourlength{2pt}
			\contournumber{20}
			\rmfamily\fontsize{120pt}{120pt}\selectfont\contour{white}{\textcolor{blue} {#1}}
			};

		% Part title
		\node[
			anchor=north east, 
			xshift=-0.75in,
			yshift=-2.5in,
			inner sep=0pt] at (current page.north east) {
			\parbox[t][][t]{2.0in}{
				\begin{flushleft}
					\fontsize{24pt}{24pt}\selectfont\sffamily\bfseries\textcolor{white}{\strut #2}
				\end{flushleft}
				}
			};

		% Display the mini table of contents showing chapters and sections,
		% change tocdepth to 2 to also show subsections or 0 to only show
		% chapters
		\node[
			anchor=south east,
			inner sep=0pt,
			xshift=-0.5in,
			yshift=3.0in] at (current page.south east) { % Mini table of contents
			\parbox[t][][t]{2.0in}{ % Width of box holding the mini ToC
				\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
			}
		};

	\end{tikzpicture}
}

\titleformat
	{\part} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\startcontents[part]\outputpartpage{\thepart}{#1}} % Format of the whole section
	{} % Format of the section label
	{0em} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

%-------------------------------------------

% Command to output the chapter title with optional background image
\newcommand{\outputchaptertitle}[2]{
	\begin{tikzpicture}[remember picture,overlay]
		% Box with the chapter title
		\draw[anchor=west] (current page.north west) node [
			anchor=north west, % Anchor point of the chapter box
			yshift=-0.5in, % Vertical distance from the top of the page
			fill opacity=1, % Background transparency
			text opacity=1, % Text transparency
			align=flush center, % Text alignment inside box
			text width=1.2\linewidth, % Box width (wider than page to go off the right side)
			font=\huge\sffamily\bfseries, % Font styling for chapter title
		] {\parbox{0.85\linewidth}{\strut\raggedright\expandafter\ifstrequal\expandafter{#1}{}{}{}#2\vspace{-3pt}}}; % Chapter title in a fixed width box for wrapping
	\end{tikzpicture}
}

% Numbered chapters
\titleformat
	{\chapter} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\outputchaptertitle{\thechapter}{#1}} % Format of the whole section
	{} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

% Unnumbered chapters
\titleformat
	{name=\chapter, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\outputchaptertitle{}{#1}} % Format of the whole section
	{} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\chapter}{0pt}{0pt}{0.25in} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\section} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\Large} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label
	
\titleformat
	{name=\section, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\Large} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\section}{0pt}{12pt}{6pt} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\subsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\large} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label
	
\titleformat
	{name=\subsection, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\large} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\subsection}{0pt}{12pt}{4pt} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\subsubsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily} % Format of the whole section
	{\llap{{\thesubsubsection}\hspace{1em}}#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label
	
\titleformat
	{name=\subsubsection, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\subsubsection}{0pt}{8pt}{4pt} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\paragraph} % Section type being modified
	[runin] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily} % Format of the whole section
	{} % Format of the section label
	{0cm} % Space between the title and label
	{#1} % Code before the label
	[] % Code after the label

\titlespacing*{\paragraph}{0pt}{0pt}{6pt} % Spacing around section titles, the order is: left, before and after

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\usepackage{titletoc} % Required for manipulating the table of contents

\setcounter{tocdepth}{2} % Display down to subsections in the table of contents

\renewcommand*\contentsname{TABLE OF CONTENTS}

\contentsmargin{0cm} % Removes the default right margin

%------------------------------------------------

% Styling of numbered parts in the table of contents
\newcommand{\tocentrypartnumbered}[1]{%
	\setlength\fboxsep{0pt}% Remove box padding
	\contentslabel[%
		% Part number box
		\colorbox{blue}{% Background color
			\strut\parbox[c][.7cm]{1.1cm}{% Box size
				\Large\color{white}\sffamily\bfseries\centering\thecontentslabel% Part number
			}%
		}%
		\hspace{4pt}%
		% Part title box
		\colorbox{blue}{% Background color
			\strut\parbox[c][.7cm]{\linewidth-1.25cm}{% Box size
				\centering\Large\color{white}\sffamily #1% Part title
			}%
		}%
	]{1.25cm}
}

% Styling of unnumbered parts in the table of contents
\newcommand{\tocentrypartunnumbered}[1]{%
	\setlength\fboxsep{0pt}% Remove box padding
	\contentslabel[%
		% Part title box
		\colorbox{blue}{% Background color
			\strut\parbox[c][.7cm]{\linewidth}{% Box size
				\centering\Large\color{white}\sffamily #1% Part title
			}%
		}%
	]{1.25cm}
}


\titlecontents{part} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{10pt}\Large\sffamily\bfseries\hypersetup{linkcolor=white}} % Before code
	{\tocentrypartnumbered} % Formatting of numbered sections of this type
	{\tocentrypartunnumbered} % Formatting of numberless sections of this type
	{} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{chapter} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{12pt}\large\sffamily\bfseries\hypersetup{linkcolor=blue}} % Before code
	{\color{blue}\contentslabel[\Large\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\color{blue!60}\normalsize\;\titlerule*[6pt]{.}\;\color{blue}\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{section} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{3pt}\sffamily\bfseries} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{subsection} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{1pt}\sffamily\small} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code
	
%------------------------------------------------

\titlecontents{subsubsection} % Section type being modified
	[1.75cm] % Left indentation
	{\sffamily\small} % Before code
	{\contentslabel[\thecontentslabel]{1.75cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

% List of figures entries
\titlecontents{figure} % Section type being modified
	[0cm] % Left indentation
	{\addvspace{2pt}\sffamily\small} % Before code
	{\thecontentslabel\hspace*{1em}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

% List of tables entries
\titlecontents{table} % Section type being modified
	[0cm] % Left indentation
	{\addvspace{2pt}\sffamily\small} % Before code
	{\thecontentslabel\hspace*{1em}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{lchapter} % Chapter headings on part pages
	[0cm] % Left indentation
	{\addvspace{12pt}\large\sffamily\bfseries\hypersetup{linkcolor=white}} % Before code
	{\color{white}\contentslabel[\Large\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{\color{white}} % Formatting of numberless sections of this type
	{\color{white}} % Formatting of the filler to the right of the heading and the page number

%------------------------------------------------

\titlecontents{lsection} % Section headings on part pages
	[0cm] % Left indentation
	{\sffamily\small} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number

%------------------------------------------------

\titlecontents{lsubsection} % Subsection headings on part pages
	[0cm] % Left indentation
	{\sffamily\footnotesize} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}\hspace{0.5cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number

%----------------------------------------------------------------------------------------
%	BIBLIOGRAPHY
%----------------------------------------------------------------------------------------

\usepackage[
	backend=biber, % Use the biber engine for compiling the bibliography
	bibstyle=numeric, % Main bibliography style
	citestyle=numeric, % In-text citation style
	sorting=nyt, % Sort references in the bibliography by name, then year, then title
	sortcites=true, % If multiple citekeys are passed to a citation command, sort them in the citation
	abbreviate=false, % Suppress abbreviations such as "Ed." for Editor
	backref=true, % List the page where references were cited in the bibliography
	defernumbers=true,
]{biblatex}

\defbibheading{bibempty}{} % Suppress default bibliography headings

%----------------------------------------------------------------------------------------
%	INDEX
%----------------------------------------------------------------------------------------

\usepackage{makeidx} % Required to make an index

\makeindex % Tells LaTeX to create the files required for indexing

% Modify the command to output the index to output the correctly styled Index name to the page headers
\patchcmd{\theindex}
	{\MakeUppercase\indexname} % Find
	{\sffamily\normalsize\bfseries\indexname} % Replace
	{}
	{}

%----------------------------------------------------------------------------------------
%	 TABLES
%----------------------------------------------------------------------------------------

\usepackage{array} % Required for manipulating table elements

\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}} % Define a new right-aligned paragraph column type
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}} % Define a new left-aligned (no justification) paragraph column type
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}} % Define a new centered paragraph column type

\usepackage{booktabs} % Required for high quality horizontal rules in tables

%----------------------------------------------------------------------------------------
%	 LISTS
%----------------------------------------------------------------------------------------

\usepackage{enumitem} % Required for list customization

\setlist{nolistsep, noitemsep} % Customize spacing inside and outside lists

\renewcommand{\labelenumi}{\arabic{enumi}.} % Customize the first level numbered list characters
\renewcommand{\labelenumii}{\alph{enumii}.} % Customize the second level numbered list characters
\renewcommand{\labelenumiii}{\roman{enumiii}.} % Customize the third level numbered list characters

%------------------------------------------------

\renewcommand{\labelitemi}{\raisebox{-2pt}{\Large \textbullet}} % Customize the first level bullet point character
\renewcommand{\labelitemii}{--} % Customize the second level bullet point character
\renewcommand{\labelitemiii}{$\circ$} % Customize the third level bullet point character

%----------------------------------------------------------------------------------------
%	LINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref}

\hypersetup{
	colorlinks=true, % Whether to color links (a thin box is output around links if this is false)
	%hidelinks, % Hide the default boxes around links
	urlcolor=blue, % Color for \url and \href links
	linkcolor=black, % Color for \ref/\nameref links
	citecolor=blue, % Color for reference citations like \cite{}
	hyperindex=true, % Adds links from the page numbers in the index to the relevant page
	linktoc=all, % Link from section names and page numbers in the table of contents
}

%----------------------------------------------------------------------------------------
%	BOOKMARKS
%----------------------------------------------------------------------------------------

\usepackage{bookmark} % Required for customizing PDF bookmarks

\bookmarksetup{
	open, % Open all bookmark drawers automatically
	numbered, % Add section numbers to bookmarks
	addtohook={%
		\ifnum\bookmarkget{level}=-1 % Customize part bookmarks
			\bookmarksetup{color=blue, bold}% Bold and colored
		\fi
		\ifnum\bookmarkget{level}=0 % Customize chapter bookmarks
			\bookmarksetup{bold}% Bold
		\fi
	}
}

%----------------------------------------------------------------------------------------
%	COVER PAGE
%----------------------------------------------------------------------------------------

\newcommand{\coverpage}[3]{
	\thispagestyle{empty} % Suppress headers and footers on the title page

	\begin{tikzpicture}[remember picture, overlay]
		\node [inner sep=0pt] at (current page.center) {#1}; % Background image
		\node [anchor=north, inner sep=1.25cm, text opacity=1, minimum height=0.2\paperheight, minimum width=\paperwidth, text width=0.8\paperwidth] at (current page.north) {#2}; % Top
		\node [anchor=south, inner sep=1.25cm, text opacity=1, minimum height=0.3\paperheight, minimum width=\paperwidth, text width=0.8\paperwidth] at (current page.south) {#3}; % Bottom
	\end{tikzpicture}
	
	\newpage
}

%----------------------------------------------------------------------------------------
%	THEOREM STYLES
%----------------------------------------------------------------------------------------

\usepackage{amsmath, amsfonts, amssymb, amsthm} % For math equations, theorems, symbols, etc

\renewcommand{\qedsymbol}{$\blacksquare$} % Redefine the QED symbol to be a filled square vs. the default unfilled square

%------------------------------------------------

% Orange theorem number and optional black title with padding above and below
\newtheoremstyle{bluenum} % Theorem style name
	{6pt} % Space above
	{6pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries\color{blue}\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	\thmnote{\the\thm@notefont\sffamily\bfseries\color{black}---~#3.\hspace{0.25em}}} % Optional theorem note

%------------------------------------------------

% Orange theorem number and optional black title with no padding above and below
\newtheoremstyle{bluenumbox} % Theorem style name
	{0pt} % Space above
	{0pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries\color{blue}\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	\thmnote{\the\thm@notefont\sffamily\bfseries\color{black}---~#3.\hspace{0.25em}}} % Optional theorem note

%------------------------------------------------

% Black theorem number and optional black title no padding above and below
\newtheoremstyle{blacknumex} % Theorem style name
	{6pt} % Space above
	{6pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries{\raisebox{1.25pt}{\tiny\ensuremath{\blacksquare}}}~\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	\thmnote{\the\thm@notefont\sffamily\bfseries---~#3.\hspace{0.25em}}} % Optional theorem note

%------------------------------------------------

% Black theorem number and optional black title padding above and below
\newtheoremstyle{blacknumbox} % Theorem style name
	{0pt} % Space above
	{0pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	\thmnote{\the\thm@notefont\sffamily\bfseries---~#3.\hspace{0.25em}}} % Optional theorem note

%------------------------------------------------

% Set the theorem style for each type of theorem-like environment by placing it under the theorem style you would like to use for it

% Orange theorem number and optional black title with padding above and below
\theoremstyle{bluenum}
\newtheorem{proposition}{Proposition}[chapter] % Propositions, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)

% Orange theorem number and optional black title with no padding above and below
\theoremstyle{bluenumbox}
\newtheorem{theoremeT}{Theorem}[chapter] % Theorems, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{problem}{Problem}[chapter] % Problems, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{exerciseT}{Exercise}[chapter] % Exercises, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)

% Black theorem number and optional black title no padding above and below
\theoremstyle{blacknumex}
\newtheorem{exampleT}{Example}[chapter] % Examples, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{notation}{Notation}[chapter] % Notations, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{vocabulary}{Vocabulary}[chapter] % Vocabularies, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)

% Black theorem number and optional black title with padding above and below
\theoremstyle{blacknumbox}
\newtheorem{definitionT}{Definition}[chapter] % Definitions, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{corollaryT}{Corollary}[chapter] % Corollaries, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)

%----------------------------------------------------------------------------------------
%	COLORED THEOREM BOXES
%----------------------------------------------------------------------------------------

\RequirePackage[framemethod=default]{mdframed} % Required for creating colored boxes used for theorems, definitions, exercises and corollaries

% Theorem box
\newmdenv[
	skipabove=7pt, % Whitespace above box
	skipbelow=7pt, % Whitespace below box
	backgroundcolor=black!5, % Background color
	linecolor=blue, % Border color
	innerleftmargin=5pt, % Inside left margin width
	innerrightmargin=5pt, % Inside right margin width
	innertopmargin=5pt, % Inside top margin height
	innerbottommargin=5pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{tBox}

% Exercise box
\newmdenv[
	skipabove=7pt, % Whitespace above box
	skipbelow=7pt, % Whitespace below box
	rightline=false, % Right line visible
	leftline=true, % Left line visible
	topline=false, % Top line visible
	bottomline=false, % Bottom line visible
	linecolor=blue, % Line color
	linewidth=4pt, % Line width
	backgroundcolor=blue!10, % Background color
	innerleftmargin=5pt, % Inside left margin width
	innerrightmargin=5pt, % Inside right margin width
	innertopmargin=5pt, % Inside top margin height
	innerbottommargin=5pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{eBox}

% Definition box
\newmdenv[
	skipabove=7pt, % Whitespace above box
	skipbelow=7pt, % Whitespace below box
	rightline=false, % Right line visible
	leftline=true, % Left line visible
	topline=false, % Top line visible
	bottomline=false, % Bottom line visible
	linecolor=blue, % Border color
	linewidth=4pt, % Border width
	innerleftmargin=5pt, % Inside left margin width
	innerrightmargin=5pt, % Inside right margin width
	innertopmargin=0pt, % Inside top margin height
	innerbottommargin=0pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{dBox}

% Corollary box
\newmdenv[
	skipabove=7pt, % Whitespace above box
	skipbelow=7pt, % Whitespace below box
	rightline=false, % Right line visible
	leftline=true, % Left line visible
	topline=false, % Top line visible
	bottomline=false, % Bottom line visible
	linecolor=gray, % Line color
	linewidth=4pt, % Line width
	backgroundcolor=black!5, % Background color
	innerleftmargin=5pt, % Inside left margin width
	innerrightmargin=5pt, % Inside right margin width
	innertopmargin=5pt, % Inside top margin height
	innerbottommargin=5pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{cBox}

% Creates an environment for each type of theorem and assigns it a theorem text style from the THEOREM STYLES block above and a colored box from above
\newenvironment{theorem}{\begin{tBox}\begin{theoremeT}}{\end{theoremeT}\end{tBox}}
\newenvironment{exercise}{\begin{eBox}\begin{exerciseT}}{\hfill{\color{blue}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}
\newenvironment{definition}{\begin{dBox}\begin{definitionT}}{\end{definitionT}\end{dBox}}
\newenvironment{example}{\begin{exampleT}}{\hfill{\tiny\ensuremath{\blacksquare}}\end{exampleT}}	
\newenvironment{corollary}{\begin{cBox}\begin{corollaryT}}{\end{corollaryT}\end{cBox}}

%----------------------------------------------------------------------------------------
%	REMARK ENVIRONMENT
%----------------------------------------------------------------------------------------

\newenvironment{remark}{%
	\par\small % Reduce font size for remarks
	\vspace{4pt} % Vertical whitespace
	\begin{adjustwidth}{35pt}{25pt} % Left and right padding
		\hspace{-2.5pt}%
		\begin{tikzpicture}[overlay]
			\node[draw=blue!60,line width=1pt,circle,fill=blue!25,font=\sffamily\bfseries,inner sep=3pt,outer sep=0pt] at (-15pt,0pt){\textcolor{blue}{R}}; % Orange R in a circle
		\end{tikzpicture}
	\advance\baselineskip -1pt% Reduce line spacing
}{%
	\end{adjustwidth}
}

%----------------------------------------------------------------------------------------
%	 LOAD PACKAGES THAT CLASH WITH OTHER PACKAGES
%----------------------------------------------------------------------------------------

\usepackage{tikz} % Required for drawing custom shapes and positioning elements absolutely on the page
\usetikzlibrary{calc,shapes.callouts,shapes.arrows}
