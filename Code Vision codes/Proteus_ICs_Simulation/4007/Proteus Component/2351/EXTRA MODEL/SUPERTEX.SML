SPICE LIBRARY  ,  d   K       2N6660              ?  }?=-A  2N6661              ?  }?=.A  2N7000              8  }?=MA  2N7002              ?  }?=ZA  2N7008              ?  }?=`A  DN2530                }?=D  DN2535              z  }?=A  DN2540              ?  }?= A  LND150                }?=e@  LND250              Z  }?=f@  LP0701              ?  }?=?D  TD9944              ?  }?=D  TN0104              Z  }?=?A  TN0106              ?  }?=pA  TN0110              ?  }?=kA  TN0604              ?   }?=:B  TN0606              ?!  }?=?A  TN0610              ?"  }?=?A  TN0620              ($  }?=A  TN0702              t%  }?=B  TN2106              ?&  }?=?A  TN2124              (  }?=?A  TN2130              \)  }?=?A  TN2501              ?*  }?=A  TN2504              ?+  }?=;D  TN2510              R-  }?=D  TN2524              ?.  }?=?C  TN2535              0  }?=fD  TN2540              e1  }?=bD  TN2640              ?2  }?=?C  TP0604              4  }?=A  TP0606              e5  }?=?A  TP0610T             ?6  }?=?A  TP0620              ?7  }?=7A  TP2104              D9  }?=A  TP2502              ?:  }?=?C  TP2510              ?;  }?=D  TP2520              D=  }?=D  TP2522              ?>  }?=D  TP2535              ??  }?=D  TP2540              UA  }?=D  TP2635              ?B  }?=D  TP2640              D  }?=9D  VN10K               gE  }?=vA  VN0104              ?F  }?=oA  VN0106              ?G  }?=qA  VN0300L             KI  }?=aD  VN0550              ?J  }?= @  VN0606L             ?K  }?=?A  VN0808L             :M  }?=?A  VN1206L             ?N  }?=:D  VN1306              ?O  }?=?A  VN1310              /Q  }?=?A  VN2106              |R  }?=~A  VN2110              ?S  }?=yA  VN2210              U  }?=?@  VN2222              _V  }?=?@  VN2222LL            ?W  }?=?A  VN2224              ?X  }?=?@  VN2406L             =Z  }?=2D  VN2410L             ?[  }?=-D  VN3205              ?\  }?=?C  VN3515L             N^  }?=?D  VN4012L             ?_  }?=?D  VP0104              a  }?=WA  VP0106              Rb  }?=YA  VP0109              ?c  }?=\A  VP0550              ?d  }?=??  VP0808L             *f  }?==D  VP1304              ?g  }?=3A  VP1306              ?h  }?=5A  VP1310              j  }?=0A  VP2106              ck  }?=A  VP2110              ?l  }?=A  VP2206              ?m  }?=~@                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  L  .MODEL 2N6660   NMOS (LEVEL=3   RS=0.36            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.343E-10
+RD=0.43        VTO=1.600       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=5.0E-3)
 L  .MODEL 2N6661   NMOS (LEVEL=3   RS=0.36            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.343E-10
+RD=0.43        VTO=1.600       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=5.0E-3)
 L  .MODEL 2N7000   NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.8E-2)
 M  .MODEL 2N7002   NMOS (LEVEL=3   RS=0.0405          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=1.22        VTO=2.00        VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 M  .MODEL 2N7008   NMOS (LEVEL=3   RS=0.0405          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=1.22        VTO=2.00        VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 \  .MODEL DN2530   NMOS (LEVEL=3   RS=0.25            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=7.0         VTO=-2.20       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=750E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=3.0E-6
+W=59E-3        KP=12E-6)
 L  .MODEL DN2535   NMOS (LEVEL=3   RS=1.05            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=11          VTO=-1.50       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=4.0E-6
+W=59E-3)
 L  .MODEL DN2540   NMOS (LEVEL=3   RS=1.05            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=11          VTO=-1.50       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=4.0E-6
+W=59E-3)
 H  .MODEL LND150   NMOS (LEVEL=3   RS=150.00          NSUB=5.0E13
+DELTA=0.1      KAPPA=1.O       TPG=1              CGDO=2.1716E-12
+RD=40.0        VTO=-2.0        VMAX=1.0E8         ETA=0.1
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=5.09E-10      L=10.0E-6
+W=600E-6)
 H  .MODEL LND250   NMOS (LEVEL=3   RS=150.00          NSUB=5.0E13
+DELTA=0.1      KAPPA=1.O       TPG=1              CGDO=2.1716E-12
+RD=40.0        VTO=-2.0        VMAX=1.0E8         ETA=0.1
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=5.09E-10      L=10.0E-6
+W=600E-6)
 ]  .MODEL LP0701   PMOS (LEVEL=3   RS=0.10            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.10123   TPG=-1             CGDO=8.3432E-10
+RD=0.350       VTO=-0.50       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=3.5E-8      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=5.21798E-9    L=3.0E-6
+W=3.82E-1      KP=2.6E-6)
 [  .MODEL TD9944   NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.916E-10
+RD=2.5         VTO=1.500       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 M  .MODEL TN0104   NMOS (LEVEL=3   RS=0.0205          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.00E-7     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.9E-2)
 L  .MODEL TN0106   NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.9E-2)
 L  .MODEL TN0110   NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.9E-2)
 M  .MODEL TN0604   NMOS (LEVEL=3   RS=3.56E-3         NSUB=1.0E15
+DELTA=0.1      KAPPA=0.10123   TPG=1              CGDO=4.3432E-11
+RD=0.0239      VTO=1.327       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.21798E-10   L=2.5E-6
+W=2.0E-2)
 N  .MODEL TN0606   NMOS (LEVEL=3   RS=0.100           NSUB=3.00E15
+DELTA=0.1      KAPPA=0.10123   TPG=1              CGDO=4.3432E-11
+RD=0.45        VTO=1.300       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.00E-7     LD=1.698E-9        UO=862.425
+XJ=6.46E-7     THETA=1.0E-5    CGSO=1.2179-10     L=2.5E-6
+W=2.0E-2)
 N  .MODEL TN0610   NMOS (LEVEL=3   RS=0.100           NSUB=3.00E15
+DELTA=0.1      KAPPA=0.10123   TPG=1              CGDO=4.3432E-11
+RD=0.45        VTO=1.300       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.00E-7     LD=1.698E-9        UO=862.425
+XJ=6.46E-7     THETA=1.0E-5    CGSO=1.2179-10     L=2.5E-6
+W=2.0E-2)
 L  .MODEL TN0620   NMOS (LEVEL=3   RS=0.1             NSUB=1.0E14
+DELTA=0.1      KAPPA=0.10123   TPG=1              CGDO=2.743E-10
+RD=3.3         VTO=1.34        VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.50E-8       L=2.5E-6
+W=1.6E-2)
 M  .MODEL TN0702   NMOS (LEVEL=3   RS=3.56E-3         NSUB=1.0E15
+DELTA=0.1      KAPPA=0.10123   TPG=1              CGDO=8.3432E-10
+RD=0.2039      VTO=0.900       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=7E-8        LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=5.21798E-9    L=2.5E-6
+W=2.0E-2)
 M  .MODEL TN2106   NMOS (LEVEL=3   RS=0.0205          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=0.12        VTO=1.200       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=0.80E-7     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 N  .MODEL TN2124 NMOS (LEVEL=3     RS=0.02            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=4.5         VTO=1.100       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=0.75E-7     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=3.4E-9        L=2.5E-6
+W=0.85E-2)
 M  .MODEL TN2130 NMOS (LEVEL=3     RS=0.0205          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=10          VTO=1.500       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=0.75E-7     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=3.5E-6
+W=0.5E-2)
 L  .MODEL TN2501   NMOS (LEVEL=3   RS=0.07            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=1.2         VTO=0.700       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=2.0E-6
+W=59E-3)
 ]  .MODEL TN2504   NMOS (LEVEL=3   RS=0.03            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=0.1         VTO=1.100       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=750E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=2.0E-6
+W=59E-3        KP=5.5E-6)
 [  .MODEL TN2510   NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.916E-10
+RD=0.23        VTO=1.500       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=5.5E-6)
 [  .MODEL TN2524   NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.916E-10
+RD=2.5         VTO=1.500       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 ]  .MODEL TN2535   NMOS (LEVEL=3   RS=0.205           NSUB=5.0E14
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=6.5         VTO=1.500       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=2.0E-6
+W=59E-3        KP=5.5E-6)
 ]  .MODEL TN2540   NMOS (LEVEL=3   RS=0.205           NSUB=5.0E14
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=6.5         VTO=1.500       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=2.0E-6
+W=59E-3        KP=5.5E-6)
 Z  .MODEL TN2640   NMOS (LEVEL=3   RS=0.07            NSUB=1.5E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.16E-10
+RD=2.0         VTO=1.20        VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=750E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=6.13E-10      L=2.5E-6
+W=100E-3       KP=3.5E-6)
 I  .MODEL TP0604   PMOS (LEVEL=3   RS=0.0238          NSUB=5.0E14
+DELTA=0.1      KAPPA=0.08214   TPG=-1             CGDO=5.22123E-11
+RD=0.0239      VTO=-1.90       VMAX=3E6           ETA=0.121
+NFS=3.3841E11  TOX=1.0E-7      LD=1.140E-9        UO=365.45
+XJ=6.5E-7      THETA=4.06E-5   CGSO=8.532E-11     L=2.5E-6
+W=2.0E-2)
 K  .MODEL TP0606   PMOS (LEVEL=3   RS=0.200           NSUB=3.00E15
+DELTA=0.1      KAPPA=0.0821    TPG=-1             CGDO=5.2212E-11
+RD=0.854       VTO=-2.100      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.00E-7     LD=1.1400E-9       UO=365.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=8.532E-11     L=2.5E-6
+W=2.0E-2)
 J  .MODEL TP0610T  PMOS (LEVEL=3   RS=0.73            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=6.1716E-10
+RD=1.91        VTO=-2.10       VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.6980E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 J  .MODEL TP0620   PMOS (LEVEL=3   RS=0.200           NSUB=1.50E15
+DELTA=0.1      KAPPA=0.0821    TPG=-1             CGDO=2.812E-10
+RD=5.854       VTO=-2.100      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.00E-7     LD=1.1400E-9       UO=365.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=1.62E-8       L=2.5E-6
+W=1.6E-2)
 J  .MODEL TP2104   PMOS (LEVEL=3   RS=0.73            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=6.1716E-10
+RD=1.91        VTO=-2.10       VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.6980E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 [  .MODEL TP2502   PMOS (LEVEL=3   RS=0.03            NSUB=1.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=3.172E-10
+RD=0.25        VTO=-2.0        VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.750E-9      L=2.0E-6
+W=60E-3        KP=4.3E-6)
 [  .MODEL TP2510   PMOS (LEVEL=3   RS=0.05            NSUB=1.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=3.172E-10
+RD=0.90        VTO=-2.10       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 [  .MODEL TP2520   PMOS (LEVEL=3   RS=0.20            NSUB=1.5E15
+DELTA=1.0      KAPPA=1.20      TPG=-1             CGDO=1.916E-10
+RD=5.5         VTO=-2.10       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 [  .MODEL TP2522   PMOS (LEVEL=3   RS=0.20            NSUB=1.5E15
+DELTA=1.0      KAPPA=1.20      TPG=-1             CGDO=1.916E-10
+RD=5.5         VTO=-2.10       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 [  .MODEL TP2535   PMOS (LEVEL=3   RS=0.25            NSUB=1.5E15
+DELTA=1.0      KAPPA=1.20      TPG=-1             CGDO=1.916E-10
+RD=17          VTO=-2.10       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 [  .MODEL TP2540   PMOS (LEVEL=3   RS=0.25            NSUB=1.5E15
+DELTA=1.0      KAPPA=1.20      TPG=-1             CGDO=1.916E-10
+RD=17          VTO=-2.10       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 [  .MODEL TP2635   PMOS (LEVEL=3   RS=0.20            NSUB=1.5E15
+DELTA=1.0      KAPPA=1.20      TPG=-1             CGDO=1.916E-10
+RD=9.5         VTO=-1.10       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=750E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.5E-6
+W=100E-3       KP=2.5E-6)
 \  .MODEL TP2640   PMOS (LEVEL=3   RS=0.20            NSUB=1.5E15
+DELTA=1.0      KAPPA=1.20      TPG=-1             CGDO=1.916E-10
+RD=9.5         VTO=-1.10       VMAX=5.0E6         ETA=0.053089 
+NFS=6.6E10     TOX=750E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.5E-6
+W=100E-3       KP=2.5E-6)
 L  .MODEL VN10K    NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.8E-2)
 L  .MODEL VN0104   NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.8E-2)
 L  .MODEL VN0106   NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.239       VTO=1.000       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.8E-2)
 ]  .MODEL VN0300L  NMOS (LEVEL=3   RS=0.03            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=0.1         VTO=1.100       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=750E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=2.0E-6
+W=59E-3        KP=5.5E-6)
 E  .MODEL VN0550   NMOS (LEVEL=3   RS=1.0             NSUB=5.0E15
+DELTA=0.1      KAPPA=0.0612    TPG=1              CGDO=2.8432E-10
+RD=40.00       VTO=3.00        VMAX=5.0E4         ETA=0.20
+NFS=6.466E10   TOX=1.0E-7      LD=1.6938E-9       UO=862
+XJ=6.46E-7     THETA=1.0E-5    CGSO=3.8198E-9     L=4.5E-6
+W=0.95E-2)
 M  .MODEL VN0606L  NMOS (LEVEL=3   RS=0.0205          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=0.12        VTO=1.200       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=0.80E-7     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 M  .MODEL VN0808L  NMOS (LEVEL=3   RS=0.0405          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=1.22        VTO=2.00        VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 [  .MODEL VN1206L  NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.916E-10
+RD=0.23        VTO=1.500       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=5.5E-6)
 M  .MODEL VN1306   NMOS (LEVEL=3   RS=0.0205          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=1.87        VTO=2.400       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.4E-2)
 M  .MODEL VN1310   NMOS (LEVEL=3   RS=0.0205          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=1.87        VTO=2.400       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.4E-2)
 M  .MODEL VN2106   NMOS (LEVEL=3   RS=0.0405          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=1.22        VTO=2.00        VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 M  .MODEL VN2110   NMOS (LEVEL=3   RS=0.0405          NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=6.1716E-10
+RD=1.22        VTO=2.00        VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 I  .MODEL VN2210   NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.61E-10
+RD=0.03        VTO=1.650       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=4.850E-9      L=4.0E-6
+W=85E-3)
 I  .MODEL VN2222   NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.61E-10
+RD=0.3         VTO=1.650       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=4.850E-9      L=4.0E-6
+W=85E-3)
 L  .MODEL VN2222LL NMOS (LEVEL=3   RS=0.205           NSUB=1.0E15
+DELTA=0.1      KAPPA=0.0506    TPG=1              CGDO=3.1716E-9
+RD=0.439       VTO=1.600       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=1.0E-7      LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=9.09E-9       L=2.5E-6
+W=0.8E-2)
 I  .MODEL VN2224   NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.61E-10
+RD=0.3         VTO=1.650       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=4.850E-9      L=4.0E-6
+W=85E-3)
 [  .MODEL VN2406L  NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.916E-10
+RD=2.5         VTO=1.650       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 [  .MODEL VN2410L  NMOS (LEVEL=3   RS=0.02            NSUB=3.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=1.916E-10
+RD=2.5         VTO=1.650       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 [  .MODEL VN3205 NMOS (LEVEL=3     RS=0.03            NSUB=1.0E15
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=1.33E-10
+RD=0.07        VTO=1.100       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=750E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=5.10E-10      L=2.0E-6
+W=170E-3       KP=7.5E-6)
 ]  .MODEL VN3515L  NMOS (LEVEL=3   RS=0.205           NSUB=5.0E14
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=6.5         VTO=1.400       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=2.0E-6
+W=59E-3        KP=5.5E-6)
 ]  .MODEL VN4012L  NMOS (LEVEL=3   RS=0.205           NSUB=5.0E14
+DELTA=0.1      KAPPA=0.20      TPG=1              CGDO=3.1716E-10
+RD=6.5         VTO=1.400       VMAX=1.0E7         ETA=0.0223089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=2.50E-9       L=2.0E-6
+W=59E-3        KP=5.5E-6)
 J  .MODEL VP0104   PMOS (LEVEL=3   RS=0.43            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=2.6106E-11
+RD=4.23        VTO=-2.850      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.10E-7     LD=1.1400E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=4.2666E-11    L=2.5E-6
+W=0.9E-2)
 J  .MODEL VP0106   PMOS (LEVEL=3   RS=0.43            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=2.6106E-11
+RD=4.23        VTO=-2.850      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.10E-7     LD=1.1400E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=4.2666E-11    L=2.5E-6
+W=0.9E-2)
 J  .MODEL VP0109   PMOS (LEVEL=3   RS=0.43            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=2.6106E-11
+RD=4.23        VTO=-2.850      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.10E-7     LD=1.1400E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=4.2666E-11    L=2.5E-6
+W=0.9E-2)
 D  .MODEL VP0550   PMOS (LEVEL=3   RS=0.30            NSUB=5.0E15
+DELTA=0.1      KAPPA=0.0612    TPG=-1             CGDO=2.8432E-10
+RD=75.00       VTO=-3.50       VMAX=5.0E4         ETA=0.20
+NFS=6.466E10   TOX=1.0E-7      LD=1.6938E-9       UO=862
+XJ=6.46E-7     THETA=1.0E-5    CGSO=3.8198E-9     L=4.0E-6
+W=1.0E-2)
 [  .MODEL VP0808L  PMOS (LEVEL=3   RS=0.05            NSUB=1.0E15
+DELTA=1.0      KAPPA=1.20      TPG=1              CGDO=3.172E-10
+RD=0.90        VTO=-2.10       VMAX=5.0E6         ETA=0.053089
+NFS=6.6E10     TOX=725E-10     LD=1.698E-9        UO=862.425
+XJ=6.4666E-7   THETA=1.0E-5    CGSO=1.750E-9      L=2.0E-6
+W=59E-3        KP=2.5E-6)
 J  .MODEL VP1304   PMOS (LEVEL=3   RS=0.93            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=6.1716E-10
+RD=8.46        VTO=-2.950      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.6980E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=9.10E-9       L=2.5E-6
+W=0.4E-2)
 J  .MODEL VP1306   PMOS (LEVEL=3   RS=0.93            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=6.1716E-10
+RD=8.46        VTO=-2.950      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.6980E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=9.10E-9       L=2.5E-6
+W=0.4E-2)
 J  .MODEL VP1310   PMOS (LEVEL=3   RS=0.93            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=6.1716E-10
+RD=8.46        VTO=-2.950      VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.6980E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=9.10E-9       L=2.5E-6
+W=0.4E-2)
 J  .MODEL VP2106   PMOS (LEVEL=3   RS=0.73            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=6.1716E-10
+RD=1.91        VTO=-2.30       VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.6980E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 J  .MODEL VP2110   PMOS (LEVEL=3   RS=0.73            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=6.1716E-10
+RD=1.91        VTO=-2.30       VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.6980E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=9.10E-9       L=2.5E-6
+W=0.5E-2)
 G  .MODEL VP2206   PMOS (LEVEL=3   RS=0.08            NSUB=5.0E14
+DELTA=0.1      KAPPA=0.0411    TPG=-1             CGDO=1.61E-10
+RD=0.30        VTO=-2.30       VMAX=3.0E6         ETA=0.12098
+NFS=3.384E11   TOX=1.0E-7      LD=1.1400E-9       UO=865.45
+XJ=6.5E-7      THETA=4.063E-5  CGSO=4.850E-11     L=4.5E-6
+W=80E-3)
 