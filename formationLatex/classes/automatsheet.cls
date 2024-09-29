% author : sylcha
% licence : Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{worksheet}[2024/08/187 v0.1]%
\LoadClass[a4paper,10pt,svgnames]{article}%
% options
\RequirePackage{xkeyval}%
\def\SheetLevel{Seconde}
\define@key{worksheet.cls}{SheetLevel}[Seconde]{%
  \def\SheetLevel{#1}%
}
\ExecuteOptionsX{SheetLevel}%
\def\SheetTheme{MonTheme}
\define@key{worksheet.cls}{SheetTheme}[MonTheme]{%
  \def\SheetTheme{#1}%
}
\ExecuteOptionsX{SheetTheme}%
\def\SheetType{exercices}
\define@key{worksheet.cls}{SheetType}[exercices]{%
  \def\SheetType{#1}%
}
\ExecuteOptionsX{SheetType}%
\def\SheetNum{1a}
\define@key{worksheet.cls}{SheetNum}[1a]{%
  \def\SheetNum{#1}%
}
\ExecuteOptionsX{SheetNum}%
\ProcessOptionsX%
\RequirePackage{ProfCollege}%
\RequirePackage[french]{babel}%
% mise en page
\RequirePackage{geometry}%
\geometry{a4paper,nomarginpar,bottom=1.5cm,top=3cm,left=1cm,right=1cm,includeall,marginparsep=0pt,nohead,nofoot}%
% couleurs
\RequirePackage{xcolor}%
\RequirePackage{couleurs}%  
% tableaux
\RequirePackage{tabularray}%
\UseTblrLibrary{varwidth}%
% fontes
\RequirePackage[%
  % math={Noto Sans Math},%
  % title={Source Sans Pro Black},%
  main={Source Sans Pro}%
]{fontes}%
% listes
\RequirePackage{enumitem}%
\setlist[1]{labelindent=\parindent}%
\setlist[enumerate,1]{%
  label   = {\textcolor{colorPrim}{\textbf{\arabic*. }}},%
  ref     = \arabic*%
  left    = 0pt .. \parindent,%
  labelindent = \parindent,%
  align   = left,%
  leftmargin = *}%
% \setlist[enumerate,2]{label={\textcolor{colorPrim}{\textbf{\alpha*.}}}}
\setlist[enumerate,2]{%
  label       = \textcolor{colorPrim}{\textbf{\alph*)} },%
  ref         = \theenumi.\emph{\alph*},%
  leftmargin  = 1em}%
\setlist[itemize]{%
  label   = \raisebox{0.2ex}{\textcolor{colorPrim}{\tiny \faCircle}},%
  leftmargin = 15pt%
}%
\setlist[itemize,2]{%
  label   = \raisebox{0.2ex}{\textcolor{colorPrim}{\tiny \faMinus}},%
  leftmargin = 15pt%
}%
% liens
\RequirePackage{hyperref}
\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={Cours de math\'{e}matiques -- \SheetLevel},    % title
    pdfauthor={Sylcha},     % author
    pdfsubject={Cours de maths},   % subject of the document
    pdfcreator={},   % creator of the document
    pdfproducer={}, % producer of the document
    pdfkeywords={keyword1, key2, key3}, % list of keywords
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=CornflowerBlue,          % color of internal links (change box color with linkbordercolor)
    citecolor=green,        % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=colorTextLight           % color of external links
}
% bandeau
\RequirePackage[numfeuille={\SheetNum},\SheetType,niveau=\SheetLevel,theme=\SheetTheme]{banner}%
% exercices
\RequirePackage{exos}%
\xsimsetup{%
  exof/the-counter = \arabic{exof}%
}%
% pour les chemins
\newcommand{\ExoPath}{}%
% 
% 
% Divers
% 
% 
% node[cross] draw a cross
\usetikzlibrary{shapes.misc}
\tikzset{cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
%default radius will be 1pt.
cross/.default={1pt}} %[cross=2pt] for size, [cross, rotate=50] to rotate...
% pas d'indentation
\setlength{\parindent}{0pt}%
% icones
\RequirePackage{fontawesome5}%
% highlight text
\RequirePackage{soul}%
% touches du clavier
\RequirePackage[os=win]{menukeys}