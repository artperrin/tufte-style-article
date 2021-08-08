\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tufte-style-article}[Personalised]

%  _________  ___  ___  ________ _________  _______
% |\___   ___\\  \|\  \|\  _____\\___   ___\\  ___ \
% \|___ \  \_\ \  \\\  \ \  \__/\|___ \  \_\ \   __/|   ____________
%      \ \  \ \ \  \\\  \ \   __\    \ \  \ \ \  \_|/__|\____________\
%       \ \  \ \ \  \\\  \ \  \_|     \ \  \ \ \  \_|\ \|____________|
%        \ \__\ \ \_______\ \__\       \ \__\ \ \_______\
%         \|__|  \|_______|\|__|        \|__|  \|_______|

%  ________  _________    ___    ___ ___       _______
% |\   ____\|\___   ___\ |\  \  /  /|\  \     |\  ___ \
% \ \  \___|\|___ \  \_| \ \  \/  / | \  \    \ \   __/|   ____________
%  \ \_____  \   \ \  \   \ \    / / \ \  \    \ \  \_|/__|\____________\
%   \|____|\  \   \ \  \   \/  /  /   \ \  \____\ \  \_|\ \|____________|
%     ____\_\  \   \ \__\__/  / /      \ \_______\ \_______\
%    |\_________\   \|__|\___/ /        \|_______|\|_______|
%    \|_________|       \|___|/

%  ________  ________  _________  ___  ________  ___       _______
% |\   __  \|\   __  \|\___   ___\\  \|\   ____\|\  \     |\  ___ \
% \ \  \|\  \ \  \|\  \|___ \  \_\ \  \ \  \___|\ \  \    \ \   __/|
%  \ \   __  \ \   _  _\   \ \  \ \ \  \ \  \    \ \  \    \ \  \_|/__
%   \ \  \ \  \ \  \\  \|   \ \  \ \ \  \ \  \____\ \  \____\ \  \_|\ \
%    \ \__\ \__\ \__\\ _\    \ \__\ \ \__\ \_______\ \_______\ \_______\
%     \|__|\|__|\|__|\|__|    \|__|  \|__|\|_______|\|_______|\|_______|


% 	This is tufte-style-article.cls,
% 	a LaTeX class inherited from article
%	with a style similar to E.Tufte's designs.

% 	For more information about installation and usage,
% 	see readme.md and documentation.pdf.

%	This class is hosted and maintained
%	by Sylvain Kern
%	on https://github.com/sylvain-kern/tufte-style-article.


%	O P T I O N S
%
\DeclareOption{raggedright}{	% makes all paragraphs left-aligned
	\AtBeginDocument{
		\setlength{\RaggedRightParindent}{1em}
		\RaggedRight
	}
}
\DeclareOption{parskip}{		% changes paragraph indents vor vertical skips
	\AtBeginDocument{\usepackage{parskip}}
	\setlength{\parskip}{\baselineskip}
}
\DeclareOption{noheaders}{		% disables section titles on page headers
	\renewcommand{\leftmark}{}
	\renewcommand{\rightmark}{}
}
\DeclareOption{casual}{		% removes header numbering --still puts them in toc
	\AtBeginDocument{\setcounter{secnumdepth}{0}}
}
\newif\if@sans\@sansfalse
\DeclareOption{sans}{
	\@sanstrue
	\renewcommand{\familydefault}{\sfdefault}
}
\newif\if@colorful\@colorfulfalse
\DeclareOption{black}{
	\@colorfulfalse
}
\DeclareOption{colorful}{
	\@colorfultrue
}
\newif\if@nomargins\@nomarginsfalse
\DeclareOption{notufte}{
	\@nomarginstrue
	\AtBeginDocument{
		\captionsetup{width = .7\textwidth}
		\renewcommand{\textfig}[4][]{%
			\begin{figure}[ht!]
				\noindent\includegraphics[width=#1\textwidth]{#2}%
				\caption{#3}%
				\label{#4}%
			\end{figure}
		}
		\renewcommand{\marginfig}[3]{%
			\begin{figure}[ht!]
				\noindent\includegraphics[width=.5\textwidth]{#1}%
				\caption{#2}%
				\label{#3}%
			\end{figure}
		}
		\renewcommand{\widefig}[4][]{%
			\begin{figure}[ht!]
				\noindent\includegraphics[width=#1\textwidth]{#2}%
				\caption{#3}%
				\label{#4}%
			\end{figure}
		}
		\renewcommand{\plainfig}[4][]{%
			\begin{figure}[ht!]
				\noindent\includegraphics[width=#1\textwidth]{#2}%
				\caption{#3}%
				\label{#4}%
			\end{figure}
		}
		\renewcommand{\plainwidefig}[4][]{%
			\begin{figure}[ht!]
				\noindent\includegraphics[width=#1\textwidth]{#2}%
				\caption{#3}%
				\label{#4}%
			\end{figure}
		}
		\renewcommand{\marginnote}[1]{
			\footnote{#1}
		}
		\renewcommand{\sidetext}[1]{
			\footnote{#1}
		}
	}
}
\newif\if@french \@frenchfalse
\DeclareOption{french}{\@frenchtrue}
\DeclareOption{english}{\@frenchfalse}
\newif\if@tocignoresection \@tocignoresectionfalse
\DeclareOption{tocignoresection}{\@tocignoresectiontrue}
\ExecuteOptions{english}
\ExecuteOptions{black}
\ProcessOptions\relax
\LoadClassWithOptions{article}

%	P A C K A G E   D E F I N I T I O N
%
\RequirePackage{geometry}		% page geometry, margin definition
\RequirePackage{emptypage}		% if a page is empty, is is really empty
\RequirePackage{fullwidth}		% for wide environments
\RequirePackage{marginnote}
\RequirePackage{sidenotes}		% for margin stuff
\RequirePackage[
	hypcap=false				% hypcap=true spits an error
]{caption}						% for caption formatting
\RequirePackage[T1]{fontenc}	% font encoding
\RequirePackage[osf]{libertinus}% main font
\RequirePackage{libertinust1math}
\RequirePackage{gillius}		% sans font
\if@sans
	\RequirePackage[			% font for full sans document
		osf,
		default
	]{sourcesanspro}
\fi
\RequirePackage[
	defaultmono,
	scale=.8
]{droidsansmono}				% mono font
\RequirePackage{ragged2e}		% for better raggedright
\RequirePackage{titlesec}		% header customization
\RequirePackage{titletoc}		% toc customization
\RequirePackage{fancyhdr}		% page header customization
\RequirePackage{graphicx}		% for images
\RequirePackage[
	protrusion=true,
	expansion=true,
	final,
	tracking,
]{microtype}					% microtypography: fine-tuning in text
\RequirePackage{amsfonts}		% math fonts
\RequirePackage{amsmath}		% math stuff
\RequirePackage{mathtools}		% amsmath extension
\RequirePackage{physics}		% handy shortcuts for physics
\RequirePackage{minted} 		% for code display
\RequirePackage{xcolor}			% colorz
\RequirePackage[framemethod=TikZ]{mdframed} % for custom code boxes
\RequirePackage{tabularx}		% adaptive columns on tables
\RequirePackage{booktabs}		% better looking tables
\RequirePackage{enumitem}		% better looking lists
\RequirePackage[hidelinks]{hyperref}	% automatic references in pdf
\RequirePackage{etoolbox}		% really idk what this does
\RequirePackage{verbatim}   	% for verbatim environments
\RequirePackage[export]{adjustbox}
\RequirePackage[strict]{changepage}


%	C O L O R  D E F I N I T I O N
%
\if@colorful
	\definecolor{main_accent}{HTML}{cb3004}
	\definecolor{lighter_accent}{HTML}{e45826}
	\definecolor{darker_gray}{HTML}{393136}
	\definecolor{dark_gray}{HTML}{5a565c}
	\definecolor{light_blue}{HTML}{0695c4}
	\definecolor{dark_blue}{HTML}{084983}
	\hypersetup{
		colorlinks = true,
		linkcolor = .,
		anchorcolor = main_accent,
		citecolor = main_accent,
		urlcolor = light_blue
	}
	\renewcommand\thefootnote{\color{main_accent}\arabic{footnote}}
	\renewcommand\thesidenote{\color{main_accent}\arabic{sidenote}}
\else
	\definecolor{main_accent}{HTML}{000000}
	\definecolor{lighter_accent}{HTML}{000000}
	\definecolor{darker_gray}{HTML}{000000}
	\definecolor{dark_gray}{HTML}{000000}
\fi


%	G E O M E T R Y  D E F I N I T I O N
%
\newgeometry{
	textwidth = .8\paperwidth,
	textheight = .8\paperheight,
	lmargin = 70pt,
	marginparwidth = .28\textwidth,
	marginparsep = 10pt,
	headheight = 15pt,
	tmargin = 80pt,
	%showframe,
}
\savegeometry{headaz}
\newgeometry{
	textwidth = .62\paperwidth,
	textheight = .8\paperheight,
	lmargin = 70pt,
	marginparwidth = .28\textwidth,
	marginparsep = 10pt,
	headheight = 15pt,
	tmargin = 80pt,
	%showframe,
}
\savegeometry{regular}

\if@nomargins
	\newgeometry{
		textheight = .8\paperheight,
		lmargin = 80pt,
		rmargin = 80pt,
		marginparwidth = 50pt,
		marginparsep = 10pt,
		headheight = 15pt,
		tmargin = 100pt,
		%showframe,
	}
	\savegeometry{headaz}
	\newgeometry{
		textheight = .8\paperheight,
		lmargin = 80pt,
		rmargin = 80pt,
		marginparwidth = 50pt,
		marginparsep = 10pt,
		headheight = 15pt,
		tmargin = 100pt,
		%showframe,
	}
	\savegeometry{regular}
\fi

%	M A R G I N S
%
% formatting sidenote text
\makeatletter
\RenewDocumentCommand\sidenotetext{ o o +m }{%
    \IfNoValueOrEmptyTF{#1}{%
		\@sidenotes@placemarginal{#2}{\noindent\footnotesize\RaggedRight{\thesidenote{}}~~\color{darker_gray} #3}%
        \refstepcounter{sidenote}%
    }{%
        \@sidenotes@placemarginal{#2}{\textsuperscript{#1}~#3}%
    }%
}
\makeatother

\newcommand{\sidetext}[1]
{\marginpar{\color{darker_gray}\RaggedRight\footnotesize\noindent #1 \vskip 4pt}}

\newenvironment{wide}{
\begin{fullwidth}[outermargin=-\marginparwidth-\marginparsep, width=\linewidth+\marginparwidth+\marginparsep]
}%
{
\end{fullwidth}
}

%	P A G E  H E A D E R S
%
\loadgeometry{headaz}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LO]{
	\small\textls{\color{dark_gray}\MakeUppercase{\sffamily\rightmark}} \hfill \normalfont\normalsize\thepage
}
\fancyhead[RE]{
	\normalfont\normalsize\thepage \hfill \small\textls{\color{dark_gray}\MakeUppercase{\sffamily\leftmark}}
}

\fancypagestyle{plain}{
\fancyhf{}
\fancyhead[RO]{\thepage}
\fancyhead[LE]{\hfill}
}
\loadgeometry{regular}

%	T I T L E  H E A D E R S
%
\titleformat{\section}
	{\itshape\Large}
	{\color{main_accent}\normalfont\thesection}
	{1em}
	{\raggedright\color{main_accent}\itshape}
\titleformat{\subsection}
	{\itshape\large}
	{\raggedright\color{lighter_accent}\normalfont\thesubsection}
	{1em}
	{\color{lighter_accent}\itshape}
\titleformat{\subsubsection}
	{\itshape}
	{\color{dark_gray}\normalfont\thesubsubsection}
	{1em}
	{\raggedright\color{dark_gray}\itshape}

% new title without numbering
\newcommand{\littletitle}[1]{%
	\medskip%
	\noindent\textit{#1}%
	\\\smallskip%
}

%	F I G U R E S  A N D  S T U F F
%
% 	caption formatting
\DeclareCaptionLabelFormat{lc}{\MakeLowercase{#1}~#2}
\DeclareCaptionLabelSeparator{mysep}{.\quad}
\captionsetup{
	labelfont = {bf, color=main_accent},
	%labelformat = lc,
	labelsep = mysep,
	justification=RaggedRight,
	font={footnotesize, color=darker_gray},
	singlelinecheck=off,
}

\DeclareCaptionStyle{sidecaption}{
    labelfont = {bf, color=main_accent},
	%labelformat = lc,
	labelsep = mysep,
	justification=RaggedRight,
	font={footnotesize, color=darker_gray},
	singlelinecheck=off,
}
\DeclareCaptionStyle{marginfigure}{
    labelfont = {bf, color=main_accent},
	%labelformat = lc,
	labelsep = mysep,
	justification=RaggedRight,
	font={footnotesize, color=darker_gray},
	singlelinecheck=off,
}
\DeclareCaptionStyle{widefigure}{
    labelfont = {bf, color=main_accent},
	%labelformat = lc,
	labelsep = mysep,
	justification=RaggedRight,
	font={footnotesize, color=darker_gray},
	singlelinecheck=off,
}
\DeclareCaptionStyle{margintable}{
    labelfont = {bf, color=main_accent},
	%labelformat = lc,
	labelsep = mysep,
	justification=RaggedRight,
	font={footnotesize, color=darker_gray},
	singlelinecheck=off,
}
\DeclareCaptionStyle{widetable}{
    labelfont = {bf, color=main_accent},
	%labelformat = lc,
	labelsep = mysep,
	justification=RaggedRight,
	font={footnotesize, color=darker_gray},
	singlelinecheck=off,
}

%	figure macros
\AtBeginDocument{\usepackage[export]{adjustbox}}
\newcommand{\textfig}[4][]{%
	\begin{figure}[!htb]%
		\sidecaption{#3\label{#4}}%
		\includegraphics[width = #1\linewidth, outer]{#2}%
	\end{figure}%
}
\newcommand{\marginfig}[3]{
	\begin{marginfigure}%
		\includegraphics[width = \linewidth]{#1}%
		\caption{#2\label{#3}}%
	\end{marginfigure}%
}
\newcommand{\widefig}[4][]{%
	\begin{figure*}[!htb]%
		\includegraphics[width=#1\linewidth, outer]{#2}%
		\sidecaption{#3\label{#4}}%
	\end{figure*}%
}
\newcommand{\plainfig}[4][]{%
	\begin{figure}[!htb]%
		\includegraphics[width=#1\linewidth, left]{#2}%
		\caption{#3\label{#4}}%
	\end{figure}%
}
\newcommand{\plainwidefig}[4][]{%
	\begin{figure*}[!htb]%
		\includegraphics[width=#1\linewidth, left]{#2}%
		\caption{#3\label{#4}}%
	\end{figure*}%
}

%	table macros
\newcolumntype{Y}{>{\centering\arraybackslash}X} % tabularx column type
\newenvironment{texttable}[2]{%
	\begingroup%
	\small%
	\marginpar{%
		\vskip 8pt%
		\captionof{table}{#1}%
		\label{#2}%
	}

	\noindent%
}
{
	\endgroup%
}

%	T O C  C U S T O M I Z A T I O N
%
\makeatletter
\contentsmargin[1cm]{0cm}
\if@tocignoresection
	\titlecontents{section}[0em]
		{\large\vspace{16pt}}
		{\makebox[-1em][r]{\color{darker_gray}\bfseries\large\thecontentslabel}\large\hspace{1em}} % remove the page number next to the section's name to avoid redundancy
		{}
		{}
\else
	\titlecontents{section}[0em]
		{\large\vspace{16pt}}
		{\makebox[-1em][r]{\color{darker_gray}\bfseries\large\thecontentslabel}\large\hspace{1em}} % remove the page number next to the section's name to avoid redundancy
		{\large}
		{~~~~{\color{main_accent}\contentspage}}[\vskip 0pt]
\fi
\titlecontents*{subsection}
	[0em]
	{}
	{{\thecontentslabel}~~\itshape}
	{\color{darker_gray}\itshape}
	{~~{\color{main_accent}\contentspage}}
	[\qquad]
\pretocmd{\contentsname}{}{}{}
\makeatother

%	toc offset
\let\oldtoc\tableofcontents
\renewcommand{\tableofcontents}{
\begin{quote}
\oldtoc
\end{quote}
}

%	toc depth
\AtBeginDocument{\setcounter{tocdepth}{2}}

%	T I G H T  L I S T S
%
\AtBeginDocument{
	\setlist{topsep=0pt, itemsep=0pt}
}

% 	smallet bullets
\renewcommand{\labelitemi}{$\vcenter{\hbox{\scriptsize$\bullet$}}$}

%	C O D E
%
\usemintedstyle{colorful}
\definecolor{bg}{rgb}{.95,.95,.95} % background color
\mdfdefinestyle{code_box}{%
	backgroundcolor=bg,
	linewidth=1pt,
	linecolor=lightgray,
	topline=false,
	bottomline=false,
	leftline=false,
	rightline=false,
	innerleftmargin=32pt,
	innertopmargin=1em,
	innerbottommargin=1em,
	roundcorner=3pt
}
\mdfdefinestyle{code_box_nonos}{%
	backgroundcolor=bg,
	linewidth=1pt,
	linecolor=lightgray,
	topline=false,
	bottomline=false,
	leftline=false,
	rightline=false,
	innerleftmargin=12pt,
	innertopmargin=1em,
	innerbottommargin=1em,
	roundcorner=3pt
}
\renewcommand{\theFancyVerbLine}{
	\scriptsize
	\textcolor{black}{
		\texttt
		\oldstylenums{}
		\arabic{FancyVerbLine}
	}
}

%	macro environments
\newenvironment{codeboxnum}[1]{%
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			tabsize=2,
			autogobble,
			numbersep=4pt,
		]{#1}%
}%
{%
		\end{minted}
	\end{mdframed}
}
\newenvironment{codebox}[1]{%
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box_nonos]%
		\begin{minted}[
			breaklines,
		 	breakanywhere,
			fontsize=\small,
			tabsize=2,
		]{#1}%
}%
{%
		\end{minted}
	\end{mdframed}
}
\newenvironment{altcodebox}[1]{% to cite latex code containing codeboxes
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box_nonos]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			tabsize=2,
		]{#1}%
}%
{%
		\end{minted}
	\end{mdframed}
}
\newenvironment{nextcodebox}[1]{
	\VerbatimEnvironment
	\begin{mdframed}[style = code_box]
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			firstnumber = last,
			tabsize=2,
			autogobble,
			numbersep=4pt,
		]{#1}
}%
{%
		\end{minted}
	\end{mdframed}
}

%	snippet environments
\newenvironment{snippetnum}[3]{%
	\VerbatimEnvironment%
	\marginpar{%
		\vskip 8pt%
		\captionof{listing}{#2}%
		\label{#3}%
	}\nopagebreak%
	\begin{mdframed}[style = code_box]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			tabsize=2,
			autogobble,
			numbersep=4pt,
		]{#1}%
}%
{%
		\end{minted}%
	\end{mdframed}%
}
\newenvironment{snippet}[3]{
	\VerbatimEnvironment
	\marginpar{
		\vskip 8pt
		\captionof{listing}{#2}
		\label{#3}
	}\nopagebreak%
	\begin{mdframed}[style = code_box_nonos]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			tabsize=2,
			autogobble,
		]{#1}%
}%
{%
		\end{minted}
	\end{mdframed}
}
\newenvironment{nextsnippet}[3]{
	\VerbatimEnvironment
	\marginpar{
		\vskip 8pt
		\captionof{listing}{#2}
		\label{#3}
	}\nopagebreak%
	\begin{mdframed}[style = code_box]%
		\begin{minted}[
			breaklines,
			breakanywhere,
			fontsize=\small,
			linenos,
			firstnumber = last,
			tabsize=2,
			autogobble,
			numbersep=4pt,
		]{#1}
}%
{%
		\end{minted}
	\end{mdframed}
}

%   Inline code
\newcommand{\inlinecode}[1]{\mintinline[bgcolor=bg, fontsize=\small]{#1}}

%	M I S C E L L A N E O U S
%
%	for  t i g h t  lists (pandoc style)
\providecommand{\tightlist}{%
	\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}
}
%	minipages with margin notes
\usepackage{minipage-marginpar}
%	no page break environment
\newenvironment{absolutelynopagebreak}
  {\par\nobreak\vfil\penalty0\vfilneg
   \vtop\bgroup}
  {\par\xdef\tpd{\the\prevdepth}\egroup
   \prevdepth=\tpd}

% ---- Personnal ---- %

\newcommand{\school}[1]{\renewcommand{\school}{#1}}
\newcommand{\institution}[1]{\renewcommand{\institution}{#1}}
\newcommand{\course}[1]{\renewcommand{\course}{#1}}
\newcommand{\datestart}[1]{\renewcommand{\datestart}{#1}}
\newcommand{\dateend}[1]{\renewcommand{\dateend}{#1}}
\newcommand{\internship}[1]{\renewcommand{\internship}{#1}}
\newcommand{\incharge}[1]{\renewcommand{\incharge}{#1}}
\newcommand{\student}[1]{\renewcommand{\student}{#1}}

% cover
\makeatletter
\newcommand{\coverpage}{
    \newgeometry{left=2.5cm, right=2.5cm, top=2cm, bottom=2cm}
    \begin{titlepage}
        \centering
        % display school logo
        \begin{minipage}{.49\textwidth}
            \begin{flushleft}
                \centering
                \includegraphics[width=.6\textwidth]{chart/top_left.png} % TOP LEFT LOGO
            \end{flushleft}
        \end{minipage}
        % display company logo
        \begin{minipage}{.49\textwidth}
            \begin{flushright}
                \centering
                \includegraphics[width=.6\textwidth]{chart/top_right.png} % TOP RIGHT LOGO
            \end{flushright}
        \end{minipage}
        % main text section
        \par\vspace{1cm}
        {\scshape\LARGE \color{main_accent}\school \\ \institution \par}
        \vspace{1.5cm}%
		\if@french%
			{\scshape\Large \course \\ \normalsize du \datestart~au \dateend \\ \Large Rapport \par}%
		\else%
        	{\scshape\Large \course \\ \normalsize from \datestart~to \dateend \\ \Large Report \par}%
		\fi%
        \vspace{1cm}
        \rule{\linewidth}{.2mm} \\[.4cm]
        {\huge\bfseries \internship \par} \
        \rule{\linewidth}{.2mm} \\[1.5cm]
        \vspace{1cm}
        % assignments section
        \begin{minipage}[t]{.4\textwidth} % left section
            \begin{flushleft} \large
				\if@french
					\emph{\color{lighter_accent}\textbf{Élève :}}\\
				\else
					\emph{\color{lighter_accent}\textbf{Student:}}\\
				\fi
				\student
            \end{flushleft}
		\end{minipage}
		\begin{minipage}[t]{.5\textwidth} % right section
            \begin{flushright} \large
				\if@french
					\emph{\color{lighter_accent}\textbf{Responsables :}}\\
				\else
					\emph{\color{lighter_accent}\textbf{In charge:}}\\
				\fi
				\incharge
            \end{flushright}
        \end{minipage}
        \includegraphics[height=4cm]{chart/bottom.png} % BOTTOM LOGO
        \vfill
        {\large \today\par} % date display
	\end{titlepage}
	\restoregeometry\clearpage
	\newpage
}
\makeatother
% ------------ Shortcuts ------------ %

\newcommand{\infine}{\textit{in fine~}} % shortcut for 'in fine' locution
\newcommand{\parent}[1]{\left(#1 \right)} % shortcut for parentheses
\renewcommand{\vec}[1]{\ensuremath{\mathbf{#1}}} % shortcut for bold vectors notation
\newcommand{\prim}[1]{\ensuremath{#1^\prime}} % shortcut for prim notation

% ------------ Environments ------------ %

\newcounter{NbSystems}
\newenvironment{system}[1]{
    \refstepcounter{NbSystems}
    \renewcommand{\theequation}{S.\thesection-\arabic{NbSystems}}
    \begin{equation}\label{sys:#1}
        \begin{cases}
            \strut
    }
    {
        \end{cases}
    \end{equation}
}

\newenvironment{system*}{
    \begin{equation*}
        \begin{cases}
            \strut
    }
    {
        \end{cases}
    \end{equation*}
}

\newcounter{NbEqs}
\newenvironment{eq}[1]{
    \refstepcounter{NbEqs}
    \renewcommand{\theequation}{Eq.\thesection-\arabic{NbEqs}}
    \begin{equation}\label{eq:#1}
    }
    {
    \end{equation}
}

\newenvironment{eq*}{
    \begin{equation*}
    }
    {
    \end{equation*}
}