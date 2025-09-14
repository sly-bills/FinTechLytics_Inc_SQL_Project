{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;\f2\froman\fcharset0 Times-Roman;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid1\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid1}
{\list\listtemplateid2\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid101\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid2}
{\list\listtemplateid3\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid201\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid3}
{\list\listtemplateid4\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid301\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid4}
{\list\listtemplateid5\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid401\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid5}
{\list\listtemplateid6\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid501\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid6}
{\list\listtemplateid7\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid601\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid7}
{\list\listtemplateid8\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid701\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid8}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}{\listoverride\listid2\listoverridecount0\ls2}{\listoverride\listid3\listoverridecount0\ls3}{\listoverride\listid4\listoverridecount0\ls4}{\listoverride\listid5\listoverridecount0\ls5}{\listoverride\listid6\listoverridecount0\ls6}{\listoverride\listid7\listoverridecount0\ls7}{\listoverride\listid8\listoverridecount0\ls8}}
\paperw11900\paperh16840\margl1440\margr1440\vieww31000\viewh13960\viewkind0
\deftab720
\pard\pardeftab720\sa240\partightenfactor0

\f0\b\fs24 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Indexes:
\f1\b0 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\ls1\ilvl0\cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}I \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 created indexes on the foreign keys \'91
\fs26 user_id\'92
\fs24  and \'91
\fs26 stock_id\'92
\fs24  in the portfolios, transactions and stock_prices tables to speed up common lookups by user or stock or stock prices.\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}I created \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 composite indexes 
\fs26 (stock_id, timestamp)
\fs24  on stock_prices and transactions partitions to optimize queries filtering by stock within specific time ranges.\
\pard\tx720\pardeftab720\sa240\partightenfactor0
\cf0 \
\pard\pardeftab720\sa240\partightenfactor0

\f0\b \cf0 Partitioning:
\f1\b0 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\sl360\slmult1\partightenfactor0
\ls2\ilvl0\cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}I \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 partitioned \'91stock_prices\'92 monthly to be able to get a more concise and easy to read data. Each month won\'92t be so much therefore easier to query. I partitioned transactions quarterly also for the same reason. I partitioned them both by 
\fs26 timestamp
\fs24  to improve query speed on date-range filters and ease data management (archiving, maintenance).\
\pard\tx720\pardeftab720\sa240\partightenfactor0
\cf0 \strokec2 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\ls3\ilvl0
\f0\b \cf0 {\listtext	\'95	}Renaming:
\f1\b0 \strokec2 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\ls4\ilvl0\cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Original tables renamed to 
\fs26 _old
\fs24  for backup; partitioned tables renamed to original names for seamless application use.
\f2 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\cf0 \
\
\

\f0\b JUSTFICATION OF ROLES\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\ls5\ilvl0\cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}Admin Role\
\pard\pardeftab720\partightenfactor0

\f1\b0 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Admins oversee all database operations, maintenance, security, and user management, so unrestricted access is necessary.\kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
\pard\tx720\pardeftab720\sa240\partightenfactor0

\f0\b \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\sa240\partightenfactor0
\ls6\ilvl0\cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}Data Engineer Role\
\pard\pardeftab720\partightenfactor0

\f1\b0 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Data engineers handle the full lifecycle of data management and require broad data manipulation capabilities, but not higher-level administrative rights.\
\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls7\ilvl0
\f0\b \cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Data Analyst Role
\f1\b0 \strokec2 \
\pard\tx720\pardeftab720\partightenfactor0

\f0\b \cf0 \strokec2 \
\pard\pardeftab720\partightenfactor0

\f1\b0 \cf0 \strokec2 Data analysts focus on extracting insights without altering data, so read-only permissions safeguard the data environment while providing needed access.\
\
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls8\ilvl0
\f0\b \cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	\uc0\u8226 	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 ML Engineer Role\
\pard\tx720\pardeftab720\partightenfactor0
\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b0 \cf0 \strokec2 ML engineers require read access to training data and write access to prediction results but do not need broader modification privileges.
\f0\b \strokec2 \
}