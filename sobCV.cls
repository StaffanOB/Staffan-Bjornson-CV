\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sobCV}[2015/09/08 Staffan björnsons CV class]
\LoadClass[11pt]{article}

\RequirePackage[paperwidth=595pt,paperheight=841pt,top=2cm,right=2cm,bottom=2cm,left=2cm]{geometry}
%\RequirePackage{hyperref}                         % Required for links
\RequirePackage[colorlinks = true]{hyperref}
\RequirePackage{tabularx}
\RequirePackage{pgffor}
\RequirePackage{amssymb}
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


% :=-------------------------------------------------------------------------=:
% : FONT
% :=-------------------------------------------------------------------------=:

\RequirePackage[scaled=1]{carlito}
\renewcommand*{\familydefault}{\sfdefault}

% :=-------------------------------------------------------------------------=:
% : COLORS
% :=-------------------------------------------------------------------------=:

\definecolor{highlight}{HTML}{0066cc}
\definecolor{descrete}{HTML}{808080}
\definecolor{darkGray}{rgb}{0.52, 0.52, 0.51}


% :=-------------------------------------------------------------------------=:
% : TITLE NAME 
% :=-------------------------------------------------------------------------=:
\newcommand{\name}[2]{
  \centerline{\fontsize{40}{60}\selectfont {#1 \color{highlight}#2} CV}
  \vspace{.5em}
}

% :=-------------------------------------------------------------------------=:
% : CONTACT INFORMATION
% :=-------------------------------------------------------------------------=:
\newcommand{\contact}[5]{
    #1 {\large\textperiodcentered} #2 {\large\textperiodcentered} #3
    {\Large} #4  {\Large} #5
}

\newcommand{\longcontact}[6]{
  {\raggedright
    \vspace{3pt}\noindent
    \begin{tabular}{
           p{\dimexpr.75\linewidth-2\tabcolsep-1.3333\arrayrulewidth}  % column 1
          r p{\dimexpr.20\linewidth-2\tabcolsep-1.3333\arrayrulewidth}  % column 2
        }
            \textbf{#1} & Date:  #4\\
            #2 & #5\\
            #3 & #6\\
    \end{tabular}
  }
}


% :=-------------------------------------------------------------------------=:
% : LIFE QUORE
% :=-------------------------------------------------------------------------=:

\newcommand{\userquote}[1]{%
   \vspace{1em}
   \quote{
      \begin{center}
        {\color{darkGray}\textit{One of my life motos are:}\\}
        \color{darkGray}\textit{{\Large "#1"}}
      \end{center}
  }
  \vspace{1em}
}

% :=-------------------------------------------------------------------------=:
% : About 
% :=-------------------------------------------------------------------------=:

\newcommand{\userAbout}[3]{%
   \vspace{1em}
   \raggedright\textbf{#1}
   
   #2

   \compList{#3}
  \vspace{1em}
}

\newcommand{\compList}[1]{
    \vspace{1em} \noindent
    \raggedright\textbf{Kompetenser i fokus:}
    \vspace{0.2em} \noindent
        #1
}

% :=-------------------------------------------------------------------------=:
% : EXPERIENCE NODE
% :=-------------------------------------------------------------------------=:

\newcommand{\experiencenode}[8]{
  \vspace{0pt} \noindent
    \begin{tabular}{
      p{\dimexpr.20\linewidth-2\tabcolsep-1.3333\arrayrulewidth}% column 1
      p{\dimexpr.80\linewidth-2\tabcolsep-1.3333\arrayrulewidth}% column 2
      }
      {\centerline{#3}

      \centerline{\textit{\color{darkGray}#4}}} &  
      {\raggedright\textbf{#1}

      \textit{\color{darkGray}#2}
      \vspace{.4em}} 

      {\raggedright#6} 

      \exList{#5} 

      #7
    \end{tabular}
         
  \vspace{0pt}
}

\newcommand{\exList}[1]{
  \vspace{1em} \noindent
  \raggedright\textbf{Uppgifter}
  \vspace{0.2em} \noindent

  \foreach \n in {#1}{{\color{highlight}$\bullet$} \n\par} 
  \vspace{1em}
}

\newcommand{\jobDetails}[2]{
    \vspace{1em} \noindent
    \raggedright\textbf{#1}\\
    #2 \\
    \vspace{1em}
}



% :=-------------------------------------------------------------------------=:
% : EDUCATION NODE
% :=-------------------------------------------------------------------------=:

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

% :=-------------------------------------------------------------------------=:
% : COURSE NODE
% :=-------------------------------------------------------------------------=:

\newcommand{\coursenode}[4]{
  \vspace{0pt} \noindent
  \begin{tabular}{
    p{\dimexpr.20\linewidth-2\tabcolsep-1.3333\arrayrulewidth}
    p{\dimexpr.80\linewidth-2\tabcolsep-1.3333\arrayrulewidth}
    }
    {\centerline{#1}
     
    \centerline{\textit{\color{darkGray}#2}}} & \textbf{#3}


    \textit{#4} \\
  \end{tabular}

}

% :=-------------------------------------------------------------------------=:
% : SKILLS
% :=-------------------------------------------------------------------------=:
\newcommand{\skills}[2]{
  \vspace{0pt} \noindent
  \begin{tabular}{
    p{\dimexpr.30\linewidth-2\tabcolsep-1.3333\arrayrulewidth}
    p{\dimexpr.70\linewidth-2\tabcolsep-1.3333\arrayrulewidth}
    }
    \textbf{#1}  & \foreach \n in {#2}{{\raggedright\color{highlight}$\bullet$} \n\par} \\
  \end{tabular}
  \vspace{2pt}
}

\newcommand{\skillLevel}[1]{
  \def\cmd{#1}
  \if\cmd1{{\small{\color{highlight}$\bigstar$}{\color{descrete}$\bigstar$}{\color{descrete}$\bigstar$}{\color{descrete}$\bigstar$}{\color{descrete}$\bigstar$}}}\fi
  \if\cmd2{{\small{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{descrete}$\bigstar$}{\color{descrete}$\bigstar$}{\color{descrete}$\bigstar$}}}\fi
  \if\cmd3{{\small{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{descrete}$\bigstar$}{\color{descrete}$\bigstar$}}}\fi
  \if\cmd4{{\small{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{descrete}$\bigstar$}}}\fi
  \if\cmd5{{\small{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}{\color{highlight}$\bigstar$}}}\fi
}


% :=-------------------------------------------------------------------------=:
% : LANGGUAGES
% :=-------------------------------------------------------------------------=:
\newcommand{\spokenLanguage}[1]{
  \hfill\begin{minipage}{
    \dimexpr\textwidth-3cm
  }
  \foreach \n in {#1}{{
    \indent\color{highlight}$\bullet$} Write and speak \n\par
  } 
  \xdef\tpd{\the\prevdepth}
\end{minipage}


}

% :=-------------------------------------------------------------------------=:
% : LICENSE
% :=-------------------------------------------------------------------------=:
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


% :=-------------------------------------------------------------------------=:
% : SECTION HEADERS
% :=-------------------------------------------------------------------------=:

\titleformat{\section}          % Customise the \section command 
   {\color{highlight}\huge\raggedright\bf}      % Make the \section headers large (\Large),
   {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
   {}                           % Can be used to insert code before the heading

\titleformat{\subsection}          % Customise the \section command 
   {\color{highlight}\Large\raggedright\bf}      % Make the \section headers large (\Large),
   {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
   {}   

% :=-------------------------------------------------------------------------=:
% : LINKS
% :=-------------------------------------------------------------------------=:
\newcommand{\changeurlcolor}[1]{\hypersetup{urlcolor=#1}}       
\newcommand{\sosialLink}[3]{
  \vspace{0pt}
  \begin{tabular}{rl}
    \multirow{2}{*}{\includegraphics[width=26pt]{icons/#3}} & \textbf{#1}\tabularnewline
    & \small{\changeurlcolor{highlight}\href{#2}{#2}}\tabularnewline
  \end{tabular}
}
