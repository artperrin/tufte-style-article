
%        .d88888b.  888      888 


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tufte-style-article}[]

%                    8888888b.  888b     d888         

\DeclareOption{raggedright}{
	\AtBeginDocument{
		\RaggedRightParIndent
	}
}

\DeclareOption{parskip}{
	\renewcommand{\leftmark}{}
	\AtBeginDocument{\RequirePackage{parskip}}
}

\DeclareOption{noheaders}{
	\renewcommand{\leftmark}{}
	\renewcommand{\rightmark}{}
}

\ProcessOptions\relax
\LoadClassWithOptions{article}


%
%
%
%
%
%
%


%=======================================%
%       LAYOUT AND SHORTCUTS            %
%=======================================%

%	Page geometry

\RequirePackage{geometry}

\newgeometry{
	textwidth = .75\paperwidth,
	textheight = .73\paperheight,
	lmargin = 90pt,
	marginparwidth = 0pt,
	marginparsep = 0pt,
	headheight = 15pt,
	tmargin = 100pt,
	%showframe,
}
\savegeometry{headaz}

\newgeometry{
	textwidth = .6\paperwidth,
	textheight = .73\paperheight,
	lmargin = 90pt,
	marginparwidth = .26\textwidth,
	marginparsep = 10pt,
	headheight = 15pt,
	tmargin = 100pt,
	%showframe,
}
\savegeometry{regular}


%	Paragraphs

%\RequirePackage{parskip}

\RequirePackage{ragged2e}

%	Basic stuff

\RequirePackage[T1]{fontenc}

%	Raccourcis sympa

\newenvironment{ul}	% instead of begin{itemize}
{\begin{itemize}}
	{\end{itemize}}

\newenvironment{ol}
{\begin{enumerate}}
	{\end{enumerate}}

\newcommand{\p}[1]{\paragraph{#1}}

%   Colors

\RequirePackage[table]{xcolor}

%	Tables

\RequirePackage{tabularx}		% tables with adaptive columns

\newcolumntype{Y}{>{\centering\arraybackslash}X} % tabularx column type

\RequirePackage{booktabs}		% cleaner tables

%	Pictures and advanced tt

\RequirePackage{graphicx}		% for pictures

\RequirePackage{multicol}		% for multicolumn sections especially toc

\RequirePackage{fancyhdr}		% custom headers and footers

\RequirePackage{caption} %custom caption
\captionsetup{
	labelsep = endash,
	justification=raggedright,
	font=footnotesize,
	singlelinecheck=off,
}

%	Biblio

\RequirePackage[super,square]{natbib} % for custom bibliography references

%	m a t h

\RequirePackage{amsfonts}	% fonts
\RequirePackage{mathrsfs}	
\RequirePackage{amsmath}

%\renewcommand{\phi}{\varphi}	
%\renewcommand{\epsilon}{\varepsilon}	% i find it more pleasing

\newcommand{\N}{\mathbb{N}}     % shortcuts for usual number sets
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}

\RequirePackage{empheq}		% to have numbered equations in arrays

% vectors with a space before
\let\oldvec\vec
\renewcommand{\vec}{\:\oldvec}

%            dP                         oo                   
%            88                                              
%   88d888b. 88d888b. dP    dP .d8888b. dP .d8888b. .d8888b. 
%   88'  `88 88'  `88 88    88 Y8ooooo. 88 88'  `"" Y8ooooo. 
%   88.  .88 88    88 88.  .88       88 88 88.  ...       88 
%   88Y888P' dP    dP `8888P88 `88888P' dP `88888P' `88888P' 
%   88                     .88                               
%   dP                 d8888P  

\newcommand{\ee}[1]{\cdot 10^{#1}} 	% powers of 10

\newcommand{\vect}[1]{\:\overrightarrow{#1}} % new vect with overrightarrow style

\RequirePackage{physics}    % best package on earth

%	Micro-typesetting


\RequirePackage[  protrusion=true,
expansion=true,
final,
babel,
tracking,
]{microtype}


%	Hyperlinks in PDFs

\RequirePackage[hidelinks]{hyperref}


%=======================================%
%      STYLE: FONTS AND HEADERS         %
%=======================================%

%	default serif font

%\RequirePackage[T1]{fontenc}
%\RequirePackage[urw-garamond]{mathdesign}

\RequirePackage[osf]{mathpazo}
%\RequirePackage{lmodern}

%   sans font

\RequirePackage{gillius}
%\RequirePackage{tgheros}

%	mono font
\RequirePackage[defaultmono, scale=.86]{droidsansmono}


%	oldstyle nums
%	-- the [osf] options above put old style numbers for the selected fonts


%	two-column TOC
%	-- not needed since ET's tocs look tight af

\RequirePackage{titletoc}

\contentsmargin[1cm]{0cm}

\titlecontents{section}[0em]{\large\vspace{16pt}}
{\normalfont\thecontentslabel\enspace\itshape}
{\itshape}
{\quad\quad\contentspage}[\vskip 0pt]

\titlecontents{subsection}[1em]{\vspace{4pt}}
{\normalfont\thecontentslabel\enspace\itshape}
{\itshape}
{\quad\quad\contentspage}[\vskip 0pt]

\titlecontents{subsubsection}[2em]{\vspace{0pt}}
{\normalfont\thecontentslabel\enspace\itshape}
{\itshape}
{\quad\quad\contentspage}[\vskip 0pt]

\RequirePackage{etoolbox}
\pretocmd{\contentsname}{}{}{}

%	Custom chapters

\RequirePackage{titlesec}

\titleformat{\section}
{\itshape\Large}
{\normalfont\thesection}
{1em}
{}

\titleformat{\subsection}
{\itshape\large}
{\normalfont\thesubsection}
{1em}
{\itshape}

\titleformat{\subsubsection}
{\itshape}
{\normalfont\thesubsubsection}
{1em}
{}


%=======================================%
%      CODE                             %
%=======================================%

\RequirePackage{verbatim}   % for verbatim environments

\RequirePackage{minted} % for color highlighting
\usemintedstyle{friendly}

\definecolor{bg}{rgb}{.95,.95,.95} % background color

\RequirePackage{mdframed} % for custom code boxes

\mdfdefinestyle{code_box}{%
	backgroundcolor=bg,
	linewidth=1pt,
	linecolor=lightgray,
	topline=false,
	bottomline=false,
	leftline,
	rightline=false,
	innerleftmargin=35pt,
	innertopmargin=0pt,
	innerbottommargin=0pt, 
}

\mdfdefinestyle{code_box_nonos}{%
	backgroundcolor=bg,
	linewidth=1pt,
	linecolor=lightgray,
	topline=false,
	bottomline=false,
	leftline,
	rightline=false,
	innerleftmargin=6pt,
	innertopmargin=0pt,
	innerbottommargin=0pt, 
}

\renewcommand{\theFancyVerbLine}{
	\scriptsize
	\textcolor{black}{
		\texttt
		\oldstylenums{}
		\arabic{FancyVerbLine}
	}
}

%	Macro environments

\newenvironment{codebox}[1]{%
	\VerbatimEnvironment
	%\smallskip
	\begin{mdframed}[style = code_box]%
		\begin{minted}[
			breaklines,
			fontsize=\small,
			linenos,
			tabsize=2,
			]{#1}%
		}{%
		\end{minted}%
	\end{mdframed}%
	%\medskip
}

\newenvironment{codeboxnonos}[1]{%
	\VerbatimEnvironment
	%\smallskip
	\begin{mdframed}[style = code_box_nonos]%
		\begin{minted}[
			breaklines,
			fontsize=\small,
			tabsize=2,
			]{#1}%
		}{%
		\end{minted}%
	\end{mdframed}%
	%\medskip
}

\newenvironment{nextcodebox}[1]{
	\VerbatimEnvironment
	%\smallskip
	\begin{mdframed}[style = boite_code]
		\begin{minted}[
			breaklines,
			fontsize=\small,
			linenos,
			firstnumber = last,
			tabsize=2,
			]{#1}
		}
		{
		\end{minted}
	\end{mdframed}
	%\medskip
}

%   Inline code

\newcommand{\inlinecode}[1]{\mintinline[bgcolor=bg, fontsize=\small]{#1}}


%=======================================%
%       DOCUMENT CONFIGURATION          %
%=======================================%



\newcommand{\raisedrule}[2][0em]{\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill}


\loadgeometry{headaz}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LO]{
	\small\textls{\MakeUppercase{\sffamily\rightmark}} \hfill \normalfont\normalsize\thepage
}
\fancyhead[RE]{
	\normalfont\normalsize\thepage \hfill \small\textls{\MakeUppercase{\sffamily\leftmark}}
}

\fancypagestyle{plain}{
\fancyhf{}
\fancyhead[RO]{\thepage}
\fancyhead[LE]{\hfill}	
}
\loadgeometry{regular}

%	when there is no content on a page, remove the header

\RequirePackage{emptypage}


%=======================================%
%       CUSTOM MACROS                   %
%=======================================%


% Figures shortcuts

\RequirePackage[margincaption,outercaption, raggedright]{sidecap}
\sidecaptionvpos{figure}{t}
\sidecaptionvpos{table}{t}
\sidecaptionvpos{listing}{t}

\RequirePackage{adjustbox}

\newcommand{\textfig}[4][]{
	\medskip
	\marginpar{
		\vskip 8pt
		\captionof{figure}{#3}
		\label{#4}
	}\\
	\noindent\includegraphics[width=#1\textwidth, outer]{#2}
}

\newcommand{\marginfig}[3]{
	\marginpar{
		\includegraphics[width=\marginparwidth]{#1}
		\vskip-5pt
		\captionof{figure}{#2}
		\label{#3}
	}
}

\newcommand{\widefig}[3]{
	\vskip 8pt
	\begin{wide}
		\includegraphics[width=\linewidth]{#1}
		\vskip-5pt
	\end{wide}
	\marginpar{
		\vskip 8pt
		\captionof{figure}{#2}
		\label{#3}
		\vskip 8pt
	}
	\vskip 8pt
}



\newcommand{\plainfig}[3][]{
	\begin{figure}[ht!]
		\includegraphics[width=\textwidth]{#1}
		\vskip-5pt
		\caption{#2}
		\label{#3}
	\end{figure}
}



\RequirePackage{wrapfig}

\setlength{\intextsep}{0pt}%
\setlength{\columnsep}{8pt}%

\RequirePackage{subcaption}

\newcommand{\wrapfig}[3]
{
	\begin{wrapfigure}{O}{0.5\textwidth}
		\includegraphics[width=.5\textwidth]{#1}
		\caption{\raggedright #2}
		\label{#3}
		\vskip 10pt
	\end{wrapfigure}
}

\newcommand{\subfig}[3]
{
	\begin{subfigure}{.48\textwidth}
		\centering
		\includegraphics[width=\textwidth]{#1}
		\caption{\raggedright #2}
		\label{#3}
		~\vskip 5pt
	\end{subfigure}
}

\iffalse
\newcommand{\quadfig}[14]
{
	\begin{figure}[ht]
		\centering
		\subfig{#1}{#2}{#3}{.48}
		\subfig{#4}{#5}{#6}{.48}
		\subfig{#7}{#8}{#9}{.48}
		\subfig{#10}{#11}{#12}{.48}
		\caption{\raggedright #13}
		\label{#14}
	\end{figure}
}
\fi

\RequirePackage{xparse}

\NewDocumentEnvironment{multifig}{mm}
{
	\begin{figure}[ht!]
		\centering
	}{
		\vskip -10pt
		\caption{\raggedright #1}
		\label{#2}
	\end{figure}
}


%=======================================%
%       MARGINS						    %
%=======================================%

\RequirePackage{sidenotes}
\renewcommand*{\marginfont}{\footnotesize}
\renewcommand{\marginnote}[1]
{\sidenote{\raggedright\footnotesize #1 \vskip 4pt}}

\newcommand{\margintext}[1]
{\marginpar{\raggedright\footnotesize #1 \vskip 4pt}}


%=======================================%
%       THINGS THAT MUST BE PUT HERE    %
%=======================================%


\newcommand{\littletitle}[1]{
\medskip
\noindent\textit{#1}
\smallskip\\\noindent
}

\newcommand\@maketitlebis{%
	\hfill
	\begin{minipage}{0.9\textwidth}
		\vskip -4em
		\let\footnote\thanks 
		{\LARGE\raggedright \@title \par }
		\vskip 1em
		{\Large \itshape \@author \hfill \normalsize \@date}
		\vskip 2em~	
	\end{minipage}
}


\renewcommand\maketitle{
\@maketitlebis
\thispagestyle{empty}
}


