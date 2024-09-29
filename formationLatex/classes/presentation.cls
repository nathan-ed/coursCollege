% author : sylcha
% licence : Creative Commons Attribution-NonCommercial-ShareAlike 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
% purpose : une classe pour fabriquer des cartes mentales de cours
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{presentation}[2023/10/05 v0.1]%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax%
\LoadClass[svgnames,slidetop,12pt]{beamer}%
\RequirePackage{xkeyval}%
\def\theme{Mon thème}%
\def\titre{Mon titre}%
\define@key{presentation.cls}{theme}[Mon thème]{%
  \def\theme{#1}%
}
\define@key{presentation.cls}{titre}[Mon titre]{%
  \def\titre{#1}%
}
\ExecuteOptionsX{theme}
\ProcessOptionsX%
\RequirePackage{couleurs}
\usetheme[sectionpage=progressbar,numbering=none,progressbar=head,block=fill]{metropolis}
% \RequirePackage{metropolis_framesubtitle}
\setbeamercolor{block title alerted}{fg=white, bg=colorSec}
\setbeamercolor{block body alerted}{bg=colorSec!20}
\setbeamercolor{alerted text}{fg=colorSec,bg=colorSec!20}
\setbeamercolor{block title example}{fg=white, bg=colorTer}
\setbeamercolor{block body example}{bg=colorTer!20}
\setbeamercolor{example text}{fg=colorTer,bg=colorTer!20}
\setbeamercolor{frametitle}{bg=colorPrim}
\setmonofont{Iosevka}
\setsansfont{Dinish}
\RequirePackage[french]{babel}%
\RequirePackage{mathtools}
\RequirePackage{tabularray}
\RequirePackage{codehigh}
\RequirePackage{fontawesome5}
\RequirePackage{listings}
\lstdefinestyle{mystyle}{
  backgroundcolor=\color{colorPrimLight},
  numberstyle=\tiny\color{DarkGrey},
  basicstyle=\ttfamily\small,
  breakatwhitespace=false,         
  breaklines=true,                 
  captionpos=b,                    
  keepspaces=true,                 
  numbers=left,                    
  numbersep=8pt,                  
  showspaces=false,                
  showstringspaces=false,
  showtabs=false,                  
  tabsize=2,
  basewidth={.48em},
  columns=flexible,
  frame=l,
  framerule=1.5pt,
  rulesep=8pt,
  rulecolor=\color{colorPrim}
}
\lstset{style=mystyle}
% contenu de la page de titre
\title{\titre}
%\subtitle{Session 7}
\author{\theme}
\date{}
\AtBeginDocument{
  \maketitle
}
% Keys to support piece-wise uncovering of elements in TikZ pictures:
% \node[visible on=<2->](foo){Foo}
% \node[visible on=<{2,4}>](bar){Bar}   % put braces around comma expressions
%
% Internally works by setting opacity=0 when invisible, which has the
% adavantage (compared to \node<2->(foo){Foo} that the node is always there, hence
% always consumes space plus that coordinate (foo) is always available.
%
% The actual command that implements the invisibility can be overriden
% by altering the style invisible. For instance \tikzsset{invisible/.style={opacity=0.2}}
% would dim the "invisible" parts. Alternatively, the color might be set to white, if the
% output driver does not support transparencies (e.g., PS)
%
\tikzset{
  invisible/.style={opacity=0},
  visible on/.style={alt={#1{}{invisible}}},
  alt/.code args={<#1>#2#3}{%
    \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}} % \pgfkeysalso doesn't change the path
  },
}
% TikZ command to show sometyhing on certain slides
% 
% Usage :
% \onslide<2-> {...}
\tikzset{onslide/.code args={<#1>#2}{%
  \only<#1>{\pgfkeysalso{#2}} % \pgfkeysalso doesn't change the path
}}
