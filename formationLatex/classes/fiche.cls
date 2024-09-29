% author : sylcha
% licence : Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{fiche}[2023/08/01 v0.1]%
\DeclareOption{onecolumn}{\OptionNotUsed}%
\newcommand{\InnerMarginWidth}{15mm}
\DeclareOption{large}{\renewcommand{\InnerMarginWidth}{30mm}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}%
\ProcessOptions\relax%
\LoadClass[a4paper,12pt,svgnames,twoside]{article}%
\RequirePackage{boites}%
% gestion des marges dans la page
\RequirePackage[a4paper,nohead,vmargin=1.5cm,inner=\InnerMarginWidth,outer=15mm]{geometry}%
% tableaux
\RequirePackage{tabularray}%
\UseTblrLibrary{varwidth}%
% listes
\RequirePackage{enumitem}%
\setlist[1]{labelindent=\parindent}%
\setlist[enumerate,1]{%
    label   = {\textcolor{colorPrim}{\textbf{\arabic*.}}},%
    ref     = \arabic*
    left    = 0pt .. \parindent,
    labelindent = \parindent,
    align   = left,
    leftmargin = *}%
% \setlist[enumerate,2]{label={\textcolor{colorPrim}{\textbf{\alpha*.}}}}
\setlist[enumerate,2]{%
    label       = \textcolor{colorPrim}{\textbf{\alph*}.},%
    ref         = \theenumi.\emph{\alph*},%
    leftmargin  = 1em}%
\setlist[itemize]{%
    label   = \raisebox{0.2ex}{\textcolor{colorPrim}{\tiny \faCircle}},%
    leftmargin = 15pt
}%
\setlist[itemize,2]{%
    label   = \raisebox{0.2ex}{\textcolor{colorPrim}{\tiny \faMinus}},%
    leftmargin = 15pt
}%
% pas d'indentation
\setlength{\parindent}{0pt}%
% icones
\RequirePackage{fontawesome5}%
% highlight text
\RequirePackage{soul}%
% touches du clavier
\RequirePackage[os=win]{menukeys}
%%
%% Links
%%
\RequirePackage{hyperref}
\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={Cours de math\'{e}matiques -- 3e},    % title
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
% node[cross] draw a cross
\usetikzlibrary{shapes.misc}
\tikzset{cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
%default radius will be 1pt.
cross/.default={1pt}} %[cross=2pt] for size, [cross, rotate=50] to rotate...