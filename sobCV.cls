\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sobCV}[2015/09/08 Staffan björnsons CV class]
\LoadClass[11pt]{article}

%\RequirePackage[paperwidth=210mm,paperheight=297mm,top=1cm,right=0cm,bottom=2.5cm,left=0cm]{geometry}
\RequirePackage[paperwidth=210mm,paperheight=297mm,top=1cm,right=0.6cm,bottom=2.5cm,left=0.6cm]{geometry}
%\RequirePackage{hyperref}                         % Required for links
\RequirePackage[colorlinks = true]{hyperref}
\RequirePackage{tabularx}
\RequirePackage{pgffor}
%\RequirePackage{amssymb}
\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\RequirePackage{forloop}
\RequirePackage[usenames,dvipsnames]{xcolor}      % Required for custom colors
\usepackage{graphicx}                             % Used for images
\usepackage{hyperxmp}
\usepackage{lipsum}
\usepackage{array}
\usepackage{multirow}
\usepackage{multicol}
\usepackage{changepage}
\usepackage[none]{hyphenat}
\usepackage{tabularx}


% ============================================================================
% FONT
\RequirePackage[scaled=1]{carlito}
\renewcommand*{\familydefault}{\sfdefault}


% ============================================================================
% COLORS
\definecolor{highlight}{HTML}{0066cc}
\definecolor{descrete}{HTML}{808080}
\definecolor{darkGray}{rgb}{0.52, 0.52, 0.51}


% ============================================================================
% TITLE NAME 
\newcommand{\name}[2]{
    \newline
    \centerline{\fontsize{40}{60}\selectfont {#1 \color{highlight}#2} CV}
}
\newcommand{\namecl}[2]{
    \vspace{2.5em}
    \centerline{\fontsize{30}{60}\selectfont {#1 \color{highlight}#2}}
}
\newcommand{\namecltitle}[1]{
    \vspace{0.5em}
    \centerline{\fontsize{10}{60}\selectfont {\color{darkGray}\MakeUppercase{#1}}}
}

\newcommand{\banner}[1]{
    \vspace{0.5em}
    \noindent\makebox[\textwidth][l]{%
        \hspace*{-\dimexpr\oddsidemargin+1in}%
        \includegraphics[width=\paperwidth]{icons/#1}%
    }
    \vspace{2em}
}


% ============================================================================
% CONTACT INFORMATION
\newcommand{\contact}[5]{
    #1 {\large\textperiodcentered} #2 {\large\textperiodcentered} #3
    {\Large} #4  {\Large} #5
}

\newcommand{\longcontact}[6]{
    \noindent\begin{tabularx}{\textwidth} { 
        >{\raggedright\arraybackslash}X 
        >{\raggedleft\arraybackslash}X  }
        \textbf{#1} & Date:  #4\\
        #2 & #5\\
        #3 & \changeurlcolor{highlight}\href{mailto:#6}{#6}\\
    \end{tabularx}
}


% ============================================================================
% LIFE QUORE
\newcommand{\userquote}[1]{
    \vspace{.5em}
    \quote{
        \begin{center}
            {\color{darkGray}\textit{One of my life mottos are:}\\}
            \color{darkGray}\textit{{\Large "#1"}}
        \end{center}
    }
    \vspace{2.5em}
    }


% ============================================================================
% About 
\newcommand{\userAbout}[3]{%
    \vspace{1em}
    \raggedright\textbf{#1}

    #2

    \compList{#3}
    \vspace{1em}
}

\newcommand{\compList}[1]{
    \vspace{1em} \noindent
    \raggedright\textbf{Competencies in focus: }
    \vspace{0.2em} \noindent
        #1
}

% ============================================================================
% Cover Letter Title 
\newcommand{\coverLetter}[1]{
  \vspace{2.5em}
  \noindent
    \begin{adjustwidth}{1.5cm}{1.5cm} % ← adjust margins here
    \raggedright
    \setlength{\parskip}{0.5em} % optional spacing between paragraphs
    \setlength{\parindent}{0pt} % remove indent
    #1
  \end{adjustwidth}
  \vspace{1em}
}

% ============================================================================
% EXPERIENCE NODE
\newcommand{\experiencefocus}[2]{
    \textbf{#1} --- #2}

\newcommand{\experiencenode}[9]{
    \vspace{1cm} \noindent
    \begin{tabular}{
            p{\dimexpr.25\linewidth-2\tabcolsep-1.3333\arrayrulewidth}% column 1
            p{\dimexpr.75\linewidth-2\tabcolsep-1.3333\arrayrulewidth}% column 2
        }
        {
            \leftline{\large\textbf{#2}}
            \leftline{#3}
            \leftline{\textit{\color{darkGray}#4}}
        } &  
        {
            \raggedright\textbf{#1}

        } 
        {
            \textit{\color{darkGray}#5}
            \vspace{.4em}
        }

        \exList{#6}{#7}
        #8
        
        \vspace{.4em}
        \it\small\color{darkGray}#9
    \end{tabular}
    \vspace{0pt}
}

\newcommand{\exList}[2]{
    \vspace{1em} \noindent
    \raggedright\textbf{#1}
    \vspace{0em} %\noindent
        \begin{multicols}{2}
            \vspace{0pt}
            \foreach \n in {#2}{
                \noindent{\raggedright\color{highlight}$\bullet$} \n\par
            }
            \vfill\null
        \end{multicols}
    %\foreach \n in {#1}{{\color{highlight}$\bullet$} \n\par} 
    \vspace{1em}
    }

\newcommand{\jobDetails}[2]{

    \vspace{1em} \noindent
    \raggedright\textbf{#1}

    #2
    \vspace{1em}
}


% ============================================================================
% EDUCATION NODE
\newcommand{\ednode}[3]{
    \vspace{3pt} \noindent
    \begin{tabular}{
            p{\dimexpr.20\linewidth-2\tabcolsep-1.3333\arrayrulewidth}
            p{\dimexpr.80\linewidth-2\tabcolsep-1.3333\arrayrulewidth}
        }
        {\centerline{#2}} & {\raggedright\textbf{#1}1

        \textit{#3}} \\
    \end{tabular}
    \vspace{2pt}
}


% ============================================================================
% COURSE NODE
\newcommand{\coursenode}[3]{
    \begin{adjustwidth}{30pt}{0pt}
        {
            {#2} \\
            \textit{\color{darkGray}#3 --- #1} \\
        }
        \vspace{0.2cm} \noindent
    \end{adjustwidth}
}


% ============================================================================
% SKILLS
\newcommand{\skills}[2]{
    \vspace{0pt} \noindent
    \begin{adjustwidth}{30pt}{0pt}
        \begin{multicols}{#1}
            \vspace{0pt}
            \foreach \n in {#2}{
                \noindent{\raggedright\color{highlight}$\bullet$} \n\par
            }
            \vfill\null
        \end{multicols}
    \end{adjustwidth}
    \vspace{2pt}
}


% ============================================================================
% LANGGUAGES
\newcommand{\spokenLanguage}[1]{
    \hfill\begin{minipage}{
            \dimexpr\textwidth-3cm
        }
        \foreach \n in {#1}{
            \noindent{\raggedright\color{highlight}$\bullet$} \n\par
        }
        \vfill\null
    \end{minipage}
}


% ============================================================================
% LICENSE
\newcommand{\license}[1]{
    \hfill\begin{minipage}{
            \dimexpr\textwidth-3cm
        }
        \foreach \n in {#1}{{
            \indent\color{highlight}$\bullet$} \n\par
        } 
        \xdef\tpd{\the\prevdepth}
    \end{minipage}
}


% ============================================================================
% SECTION HEADERS
\titleformat{\section}                          % Customise the \section command 
   {\color{highlight}\huge\raggedright\bf}      % Make the \section headers large (\Large),
   {}{0em}                                      % Can be used to give a prefix to all sections, like 'Section ...'
   {}                                           % Can be used to insert code before the heading

\titleformat{\subsection}                       % Customise the \section command 
   {\color{highlight}\Large\raggedright\bf}     % Make the \section headers large (\Large),
   {}{0em}                                      % Can be used to give a prefix to all sections, like 'Section ...'
   {}   

% ============================================================================
% FOOTER
\newcommand{\fotter}[1]{
    \vspace{2.5em} \noindent
    \centerline{#1}
}

% ============================================================================
% LINKS
\newcommand{\changeurlcolor}[1]{\hypersetup{urlcolor=#1}}
\newcommand{\sosialLink}[3]{
    \begin{tabular}{cl}
        \multirow{2}{*}{\includegraphics[width=26pt]{icons/#3}} & \textbf{#1}\tabularnewline
        & \small{\changeurlcolor{highlight}\href{http://#2}{#2}}\tabularnewline 
    \end{tabular}
}

