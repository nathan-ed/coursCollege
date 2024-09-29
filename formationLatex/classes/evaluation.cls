% author : sylcha
% licence : Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{evaluation}[2023/08/12 v0.1]%
\DeclareOption{onecolumn}{\OptionNotUsed}%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}%
\ProcessOptions\relax%
\LoadClass[a4paper,12pt,svgnames]{article}%
\RequirePackage{boites}%
\RequirePackage{xkeyval}%
\def\titrePDF{Maths}%
\define@key{evaluation.cls}{titrePDF}[Mathématiques]{%
  \def\titrePDF{#1}%
}
\ExecuteOptionsX{titrePDF}
\ProcessOptionsX%
% gestion des marges dans la page
\RequirePackage[a4paper,top=1.5cm,bottom=2cm,left=30mm,right=15mm]{geometry}%
% tableaux
\RequirePackage{tabularray}%
\UseTblrLibrary{varwidth}%
% listes
\RequirePackage{enumitem}%
\setlist[1]{labelindent=\parindent}%
\setlist[enumerate,1]{%
    label   = {\textcolor{colorPrim}{\textbf{\arabic*.}}},%
    ref     = \arabic*}%
% \setlist[enumerate,2]{label={\textcolor{colorPrim}{\textbf{\alpha*.}}}}
\setlist[enumerate,2]{%
    label       = \textcolor{colorPrim}{\textbf{\alph*}.},%
    ref         = \theenumi.\emph{\alph*},%
    leftmargin  = 1.5em}%
\setlist[itemize]{%
    label   = \raisebox{0.2ex}{\textcolor{colorPrim}{\tiny \faCircle}}%
}%
% pas d'indentation
\setlength{\parindent}{0pt}%
% gestion des compétences
\RequirePackage{competences}
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
    pdftitle={\titrePDF},    % title
    pdfauthor={Sylcha},     % author
    pdfsubject={Cours de maths},   % subject of the document
    pdfcreator={},   % creator of the document
    pdfproducer={}, % producer of the document
    pdfkeywords={keyword1, key2, key3}, % list of keywords
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=gray25,          % color of internal links (change box color with linkbordercolor)
    citecolor=green,        % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=colorTextLight           % color of external links
}
% node[cross] draw a cross
\usetikzlibrary{shapes.misc}
\tikzset{cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
%default radius will be 1pt.
cross/.default={1pt}} %[cross=2pt] for size, [cross, rotate=50] to rotate...