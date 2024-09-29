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
\define@boolkey{mystuff}{eval}[true]{}
\ProcessOptionsX<mystuff>\relax
\RequirePackage{ProfCollege}%
\RequirePackage[french]{babel}%
% mise en page
\RequirePackage{geometry}%
\ifKV@mystuff@eval
\geometry{a4paper,nomarginpar,bottom=1.5cm,top=3cm,left=2cm,right=2cm,includeall,marginparsep=0pt,nohead,nofoot}
\RequirePackage[numfeuille={\SheetNum},\SheetType,niveau=\SheetLevel,theme=\SheetTheme,evaluation]{packages/banner}%
\AtBeginDocument{%
    \begin{tikzpicture}[remember picture,overlay]%
      \path ([xshift=10mm,yshift=-25mm]current page.north west)
      -- ([xshift=10mm,yshift=-45mm]current page.north west) coordinate[midway] (milieuGauche)
      -- ([xshift=-10mm,yshift=-45mm]current page.north east)
      -- ([xshift=-10mm,yshift=-25mm]current page.north east) coordinate[midway] (milieuDroit);
      \node[text=black!70,anchor=west,inner sep=0pt,font=\footnotesize] at (milieuGauche) {%
        \begin{tblr}{colspec={rl},stretch=1.2}
          Nom~: & \pointilles[4cm]\\
          Prénom~: & \pointilles[4cm]\\
          Classe~: & \pointilles[1cm]\\
        \end{tblr}
      };
  % \node[anchor=east,font=\footnotesize,text=Gray] at (milieuDroit.west) {\gradingtable[template=ligne]};
\end{tikzpicture}%
    \vspace*{0.5cm}
  }
\else
\geometry{a4paper,nomarginpar,bottom=1.5cm,top=3cm,left=1cm,right=1cm,includeall,marginparsep=0pt,nohead,nofoot}
\RequirePackage[numfeuille={\SheetNum},\SheetType,niveau=\SheetLevel,theme=\SheetTheme]{banner}%
\fi
% couleurs
\RequirePackage{xcolor}%
\RequirePackage{packages/couleurs}%  
% tableaux
\RequirePackage{tabularray}%
\UseTblrLibrary{varwidth}%
% fontes
\RequirePackage[%
  % math={Noto Sans Math},%
  % title={Source Sans Pro Black},%
  main={Source Sans Pro}%
]{packages/fontes}%
% listes
\RequirePackage{enumitem}%
\setlist[1]{labelindent=\parindent}%
\NewDocumentCommand{\SetListsColor}{ O{colorPrim} }{
  \setlist[enumerate,1]{%
    label   = {\textcolor{#1}{\textbf{\arabic*. }}},%
    ref     = \arabic*%
    left    = 0pt .. \parindent,%
    labelindent = \parindent,%
    align   = left,%
    leftmargin = *}%
  \setlist[enumerate,2]{%
    label       = \textcolor{#1}{\textbf{\alph*)} },%
    ref         = \theenumi.\emph{\alph*},%
    leftmargin  = 1em}%
  \setlist[itemize]{%
    label   = \raisebox{0.2ex}{\textcolor{#1}{\tiny \faCircle}},%
    leftmargin = 15pt%
  }%
  \setlist[itemize,2]{%
    label   = \raisebox{0.2ex}{\textcolor{#1}{\tiny \faMinus}},%
    leftmargin = 15pt%
  }%
}
\SetListsColor
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
% exercices
\RequirePackage{packages/exos}%
\xsimsetup{%
  exof/the-counter = \arabic{exof},%
  % exof/template = runin,%
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
