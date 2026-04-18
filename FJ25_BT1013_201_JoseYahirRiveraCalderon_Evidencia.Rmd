---
title: "FJ25_BT1013_201_JoseYahirRiveraCalderon_Evidencia"
author: "Jose Yahir Rivera Calderon A01739474"
matricula: "A01739474"
grupo: "202"
materia: "Análisis de Biología Computacional (Gpo 202)"
docente: "Jorge Lozano Aponte"
date: "r Sys.Date()"
output: html_document
---
introduccion ala problematica
A finales de 2019, Wuhan (China) fue el origen de un brote de neumonía desconocida con impacto global. Las pruebas serológicas, junto con datos clínicos y epidemiológicos, ayudan a detectar infecciones, estimar su gravedad y conocer qué grupos son vulnerables. Por eso, las secuencias genéticas virales son clave para entender el origen y comportamiento del patógeno.
## Preguntas de investigación y respuestas

### 1. ¿Cuáles son los virus "similares" a SARS-CoV-2 en el mundo?

Basado en la literatura científica disponible en PUBMED, los virus más similares al SARS-CoV-2 incluyen:

- SARS-CoV-1: Causante del brote de SARS en 2002-2003, comparte aproximadamente 79% de similitud genómica con SARS-CoV-2 (Zhou et al., 2020, Nature).
- MERS-CoV: Causante del Síndrome Respiratorio de Oriente Medio, comparte aproximadamente 50% de similitud con SARS-CoV-2 (Lu et al., 2020, The Lancet).
- HCoV-OC43 y HCoV-HKU1: Coronavirus humanos que causan resfriados comunes, son betacoronavirus pero con menor similitud genética (Corman et al., 2018, Journal of Virology).
- RaTG13: Coronavirus de murciélago identificado en China, presenta la mayor similitud genómica (96.2%) con SARS-CoV-2 (Zhou et al., 2020, Nature).
- HCoV-229E y HCoV-NL63: Alfacoronavirus humanos que causan enfermedades respiratorias leves pero están más distantes filogenéticamente.

### 2. ¿Cuáles son los coronavirus reportados en otras especies cercanos al SARS-CoV-2?

Según la literatura científica en PUBMED, los coronavirus de otras especies más cercanos al SARS-CoV-2 son:

- RaTG13 (Murciélago Rhinolophus affinis, China): 96.2% de similitud genómica (Zhou et al., 2020, Nature).
- RmYN02 (Murciélago Rhinolophus malayanus, China): 93.3% de similitud genómica (Zhou et al., 2020, Current Biology).
- Coronavirus de pangolín malayo (Manis javanica): 91-92% de similitud genómica, con 97.4% de similitud en el dominio de unión al receptor (RBD) (Lam et al., 2020, Nature).
- Bat-CoV-ZC45 y Bat-CoV-ZXC21 (Murciélagos Rhinolophus sinicus, China): aproximadamente 88% de similitud (Chan et al., 2020, Emerging Microbes & Infections).
- SADS-CoV (Síndrome de Diarrea Aguda del Cerdo, en cerdos): Coronavirus relacionado pero más distante (Zhou et al., 2018, Nature).

### 3. Propuestas para comunidades de bajos recursos durante la contingencia

Para comunidades de bajos recursos durante la contingencia del SARS-CoV-2, propondría:

 
1. *Estaciones de lavado de manos comunitarias:*Implementar puntos de lavado de manos en lugares estratégicos con acceso limitado a agua.
2. Distribución de kits básicos: Proporcionar mascarillas reutilizables, jabón y material educativo sobre prevención.

3.*Redes de apoyo local:*Organizar grupos comunitarios para identificar personas vulnerables y coordinar ayuda.

4. Comunicación adaptada: Difundir información preventiva a través de altavoces, radio local y mensajes visuales para personas con bajo nivel educativo.

5. Espacios de aislamiento comunitario: Habilitar lugares donde personas infectadas puedan aislarse si no tienen condiciones en sus hogares.

Si viviera en una situación de escasos recursos:
- Fabricaría mascarillas caseras reutilizables con materiales disponibles
- Establecería turnos con vecinos para abastecimiento de productos básicos minimizando exposición
- Utilizaría espacios exteriores para actividades esenciales cuando fuera posible
- Formaría una red de apoyo con la comunidad para compartir información y recursos


Criterio: Virus (de preferencia respiratorios)
  
  En este análisis se estudiaron 15 secuencias de diferentes virus utilizando herramientas de R. El objetivo es observar diferencias en longitud, composición de bases, contenido GC.
  Al igual que 2 arboles filogenéticos correspondientes a las nucleoproteínas y el otro de DNA
  
  En algunas secuencias genéticas es común encontrar letras que no representan una única base nitrogenada, sino una posible combinación. Por ejemplo, la letra Y indica que en esa posición puede haber una T (timina) o una C (citosina), ambas clasificadas como pirimidinas. Por su parte, W representa la posibilidad de encontrar una A (adenina) o una T (timina), que forman pares más débiles debido a sus dos enlaces de hidrógeno. Finalmente, N se usa cuando no se puede determinar con certeza qué base hay, ya que puede tratarse de A, C, G o T.
  
  Estas letras reflejan incertidumbre en ciertas posiciones del ADN, ya sea por baja calidad en la secuenciación o por variaciones reales entre muestras. También es importante considerar que las regiones del ADN con más contenido de G (guanina) y C (citosina) suelen ser más estables, ya que el enlace entre estas dos bases es más fuerte al formar tres puentes de hidrógeno, en contraste con los dos enlaces entre A y T.
  
  
  
  1.- Cargamos librerias y leemos las variantes asi como los virus de SARS-CoV-2:
  {r}
  ## Librerías
  library(seqinr)
  library(adegenet)
  library(ape)
  library(ggtree)  
  library(DECIPHER)
  library(viridis)
  library(ggmsa) 
  library(ggplot2)
  library(dplyr)
  
  ## Secuencias desde archivo fasta único
  library(Biostrings)
  secuencias <- readDNAStringSet("C:/Users/fatim/Downloads/FJ25_BT1013_202_JoseYahirRiveraCalderonA01739474_Ev2Inputs/Virus_1.fasta")
  
  ## Asignación a variables individuales (mismo formato que el original)
  Enterovirus <- secuencias["Enterovirus"]
  Rabies_nucleoprotein <- secuencias["Rabies nucleoprotein"]
  Rhinovirus <- secuencias["Rhinovirus"]
  Ebola <- secuencias["Ebola"]
  HIV <- secuencias["HIV"]
  SARS_CoV2_Delta <- secuencias["SARS-CoV2-Delta"]
  SARS_CoV2_Alpha <- secuencias["SARS-CoV2-Alpha"]
  SARS_CoV2_Beta <- secuencias["SARS-CoV2-Beta"]
  SARS_CoV2_Gamma <- secuencias["SARS-CoV2-Gamma"]
  SARS_CoV2_Omicron <- secuencias["SARS-CoV2-Omicron"]
  Bank_vole_virus <- secuencias["Bank vole virus"]
  Perhabdovirus_perca <- secuencias["Perhabdovirus perca"]
  Hantavirus <- secuencias["Hantavirus"]
  Respiratory_syncytial_virus <- secuencias["Respiratory syncytial virus"]
  Rabies_lyssavirus_isolate <- secuencias["Rabies lyssavirus isolate"]
  
  
  
  2.-Calculamos la longitud de las secuencias de cada variante.
  
  {r}
  print("Longitud de la secuencia del virus Enterovirus:")
  length(Enterovirus[[1]])
  
  print("Longitud de la secuencia del virus Rabies nucleoprotein:")
  length(Rabies_nucleoprotein[[1]])
  
  print("Longitud de la secuencia del virus Rhinovirus:")
  length(Rhinovirus[[1]])
  
  print("Longitud de la secuencia del virus Ebola:")
  length(Ebola[[1]])
  
  print("Longitud de la secuencia del virus HIV:")
  length(HIV[[1]])
  
  print("Longitud de la secuencia del virus SARS-CoV2-Delta:")
  length(SARS_CoV2_Delta[[1]])
  
  print("Longitud de la secuencia del virus SARS-CoV2-Alpha:")
  length(SARS_CoV2_Alpha[[1]])
  
  print("Longitud de la secuencia del virus SARS-CoV2-Beta:")
  length(SARS_CoV2_Beta[[1]])
  
  print("Longitud de la secuencia del virus SARS-CoV2-Gamma:")
  length(SARS_CoV2_Gamma[[1]])
  
  print("Longitud de la secuencia del virus SARS-CoV2-Omicron:")
  length(SARS_CoV2_Omicron[[1]])
  
  print("Longitud de la secuencia del virus Bank vole virus:")
  length(Bank_vole_virus[[1]])
  
  print("Longitud de la secuencia del virus Perhabdovirus perca:")
  length(Perhabdovirus_perca[[1]])
  
  print("Longitud de la secuencia del virus Hantavirus:")
  length(Hantavirus[[1]])
  
  print("Longitud de la secuencia del virus Respiratory syncytial virus:")
  length(Respiratory_syncytial_virus[[1]])
  
  print("Longitud de la secuencia del virus Rabies lyssavirus isolate:")
  length(Rabies_lyssavirus_isolate[[1]])
  
  
  
  
  3. Gráficas para comparacion de las bases nitrogenadas de adn que componen a las variantes del virus
  {r}
  compara <- function(ent, rab_nuc, rhino, ebo, hiv, delta, alpha, beta, gamma, omicron,
                      vole, perca, hanta, syncytial, rab_lyssa) {
    par(mfrow = c(3, 5))
  
    barplot(table(ent), col = 1:15, main = "Enterovirus")
    barplot(table(rab_nuc), col = 1:15, main = "Rabies nucleoprotein")
    barplot(table(rhino), col = 1:15, main = "Rhinovirus")
    barplot(table(ebo), col = 1:15, main = "Ebola")
    barplot(table(hiv), col = 1:15, main = "HIV")
  
    barplot(table(delta), col = 1:15, main = "SARS-CoV2-Delta")
    barplot(table(alpha), col = 1:15, main = "SARS-CoV2-Alpha")
    barplot(table(beta), col = 1:15, main = "SARS-CoV2-Beta")
    barplot(table(gamma), col = 1:15, main = "SARS-CoV2-Gamma")
    barplot(table(omicron), col = 1:15, main = "SARS-CoV2-Omicron")
  
    barplot(table(vole), col = 1:15, main = "Bank vole virus")
    barplot(table(perca), col = 1:15, main = "Perhabdovirus perca")
    barplot(table(hanta), col = 1:15, main = "Hantavirus")
    barplot(table(syncytial), col = 1:15, main = "Respiratory syncytial virus")
    barplot(table(rab_lyssa), col = 1:15, main = "Rabies lyssavirus isolate")
  }
  
  compara(
    strsplit(as.character(Enterovirus[[1]]), "")[[1]],
    strsplit(as.character(Rabies_nucleoprotein[[1]]), "")[[1]],
    strsplit(as.character(Rhinovirus[[1]]), "")[[1]],
    strsplit(as.character(Ebola[[1]]), "")[[1]],
    strsplit(as.character(HIV[[1]]), "")[[1]],
    strsplit(as.character(SARS_CoV2_Delta[[1]]), "")[[1]],
    strsplit(as.character(SARS_CoV2_Alpha[[1]]), "")[[1]],
    strsplit(as.character(SARS_CoV2_Beta[[1]]), "")[[1]],
    strsplit(as.character(SARS_CoV2_Gamma[[1]]), "")[[1]],
    strsplit(as.character(SARS_CoV2_Omicron[[1]]), "")[[1]],
    strsplit(as.character(Bank_vole_virus[[1]]), "")[[1]],
    strsplit(as.character(Perhabdovirus_perca[[1]]), "")[[1]],
    strsplit(as.character(Hantavirus[[1]]), "")[[1]],
    strsplit(as.character(Respiratory_syncytial_virus[[1]]), "")[[1]],
    strsplit(as.character(Rabies_lyssavirus_isolate[[1]]), "")[[1]]
  )
  
  
  
  Interpretacion delas graficas
  
  el análisis comparativo de la composición de bases en los 15 virus muestra que, en términos generales, se observa un predominio de adenina y timina sobre citosina y guanina. Dado que las uniones formadas por A–T se sostienen con solo 2 puentes de hidrógeno en contraste con los 3 de las uniones C–G, esta distribución implica que la mayoría de los virus presentan una menor estabilidad térmica en sus genomas, lo que favorece la aparición de errores durante la replicación y, por ende, un mayor potencial mutagénico. En este sentido, virus como el Respiratory Syncytial Virus, el Hantavirus y el Bank vole virus evidencian una mayor proporción de A y T, lo que se traduce en una fragilidad genética y zonas propensas a variaciones, especialmente cuando se detectan también bases ambiguas que indican regiones altamente variables. Por otro lado, algunas variantes, como Ebola y Enterovirus, muestran una distribución más equilibrada entre A–T y C–G, sugiriendo una estabilidad moderada y, por tanto, una tasa de mutación relativamente controlada. En el caso particular de las variantes de SARS‑CoV‑2 – Alpha, Beta, Gamma, Delta y Omicron – se destaca un marcado predominio de las bases A y T, con conteos que alcanzan hasta 8000 unidades, lo que se asocia a una menor estabilidad del genoma y a una alta capacidad evolutiva. Esta alta proporción de A–T en las variantes de COVID evidencia su potencial para generar múltiples subvariantes y adaptarse rápidamente a la presión inmunológica, explicando en parte su notable velocidad de evolución y su capacidad de evasión. En resumen, la relación entre la composición de bases, la estabilidad de los puentes de hidrógeno y la presencia de zonas ambiguas permite entender las diferencias en la tasa de mutación y, en consecuencia, la capacidad adaptativa de cada virus, siendo los virus con un alto contenido de A–T, en general, los que presentan mayor inestabilidad y potencial mutagénico.
  
  Arbol Filogenetico (Nucleoproteinas)
  {r}
  library(msa)
  mySequences <- readAAStringSet("C:/Users/fatim/Downloads/FJ25_BT1013_202_JoseYahirRiveraCalderonA01739474_Ev2Inputs/Virus_1.fasta")
  myFirstAlignment <- msa(mySequences)
  mySeqforPT <- msaConvert(myFirstAlignment, type="seqinr::alignment")
  library(seqinr)
  d <- dist.alignment(mySeqforPT, "identity") 
  as.matrix(d)[2:15, "SARS-CoV2-Omicron", drop = FALSE]
  library(ape)
  Tree <- nj(d)
  plot(Tree, main="Phylogenetic Tree of virus")
  
  Interpretacion del primer arbol filogenetico:
  
  El árbol filogenético obtenido muestra cómo se relacionan evolutivamente distintas especies virales, incluidas variantes del SARS-CoV-2 y otros virus como el VIH, Ébola y virus respiratorios. Para elaborarlo, se utilizó un archivo .fasta con secuencias de aminoácidos (proteínas) representativas de cada virus. Estas secuencias fueron comparadas y alineadas con ayuda de la herramienta msa, lo cual permitió detectar tanto regiones conservadas como diferencias importantes entre ellas.
  
  En los resultados se observa un agrupamiento muy claro de las variantes del SARS-CoV-2 (Omicron, Delta, Gamma, Beta y Alpha), lo cual indica que tienen un origen común y diferencias evolutivas relativamente recientes. Este conjunto de variantes forma un clado separado del resto de los virus analizados, evidenciando su parentesco estrecho.
  
  Por otro lado, virus como el VIH, Hantavirus y Ébola se ubican en ramas distintas y más alejadas, lo que sugiere un origen evolutivo más distante. También es notable el caso de los virus de la rabia, que aparecen juntos, lo cual confirma su cercanía filogenética. En contraste, otros virus respiratorios como el Rhinovirus o el Virus Sincitial Respiratorio muestran ubicaciones intermedias, reflejando una evolución diferenciada aunque no tan lejana.
  
  Este tipo de análisis resulta esencial para estudiar cómo han evolucionado los virus, entender su diversidad genética y reconocer patrones comunes o divergentes. Además, representa una herramienta poderosa en el campo de la salud pública, ya que ayuda a seguir el rastro evolutivo de patógenos, prever cambios importantes y mejorar estrategias de prevención o respuesta ante nuevas variantes.
  
  
  
  Segundo arbol filogenetico
  {r}
  ### R code from vignette source 'vignettes/DECIPHER/inst/doc/DECIPHERing.Rnw'
  
  ###################################################
  ### code chunk number 1: startup
  ###################################################
  library(DECIPHER)
  library(DBI)
  library(RSQLite)
  
  
  {r}
  ###################################################
  ### code chunk number 2: expr1
  ###################################################
  # access a sequence file included in the package:
  gen <- "C:/Users/Nubes/Downloads/Bacteria_175seqs.gen"
  
  # connect to a database:
  dbConn <- dbConnect(SQLite(), ":memory:")
  
  # import the sequences into the sequence database
  Seqs2DB(gen, "GenBank", dbConn, "Orthornavirae")
  
  
  {r}
  ###################################################
  ### code chunk number 3: expr2
  ###################################################
  BrowseDB(dbConn)
  
  
  {r}
  ###################################################
  ### code chunk number 4: expr3
  ###################################################
  l <- IdLengths(dbConn)
  head(l)
  Add2DB(l, dbConn)
  BrowseDB(dbConn, maxChars=20)
  
  
  
  {r}
  ###################################################
  ### code chunk number 5: expr4
  ###################################################
  r <- IdentifyByRank(dbConn, level=3, add2tbl=TRUE)
  ### r <- IdentifyByRank(dbConn, add2tbl=TRUE)
  BrowseDB(dbConn, maxChars=20)
  
  
  {r}
  ###################################################
  ### code chunk number 6: expr5
  ###################################################
  dna <- SearchDB(dbConn, identifier = "Orthornavirae")
  BrowseSeqs(subseq(dna, 140, 240))
  
  
  {r}
  ###################################################
  ### code chunk number 7: expr6
  ###################################################
  ###d <- DistanceMatrix(dna, verbose=FALSE)
  ###c <- IdClusters(d, method="complete", cutoff=.02, showPlot=TRUE, verbose=FALSE)
  
  d <- DistanceMatrix(dna, correction="Jukes-Cantor", verbose=FALSE)
  c <- TreeLine(myDistMatrix=d, method="NJ", cutoff=0.05, showPlot=TRUE, verbose=FALSE)
  
  
  {r}
  ###################################################
  ### code chunk number 8: expr7
  ###################################################
  dbDisconnect(dbConn)
  
  
  
  {r}
  ###################################################
  ### code chunk number 9: sessinfo
  ###################################################
  toLatex(sessionInfo(), locale=FALSE)
  
  
  
  
  Interpretacion del segundo arbol filogenetico(DNA):
  
  El árbol filogenético generado a partir de las secuencias de ADN muestra cómo se agrupan genéticamente distintos virus, incluyendo múltiples variantes de SARS-CoV-2, así como virus como el Ébola, VIH, Rabia, entre otros. Las ramas reflejan la distancia genética acumulada entre secuencias, es decir, mientras más largo sea el camino que conecta dos virus, más diferencias genéticas han acumulado entre ellos.
  
  A continuación se analizan algunos patrones observables:
  
  SARS-CoV-2 (secuencias 6, 7, 8, 9 y 10): Aunque pertenecen al mismo virus, no aparecen agrupados en un único clado, lo cual sugiere que algunas variantes presentan mutaciones significativas que las alejan genéticamente. Por ejemplo, secuencias 8 y 9 (coronavirus con accesiones OR278055 y OR578388) se agrupan muy cerca, indicando alta similitud. Sin embargo, la secuencia 10 (OR575624) se separa más temprano, y las secuencias 6 y 7 (OK091006 y OV054768) forman un subgrupo distinto. Esto puede reflejar diferencias por región geográfica o linaje.
  
  Enterovirus (1), Rabies nucleoprotein (2) y Rhinovirus (3): Se encuentran distribuidos en diferentes ramas. Rabies nucleoprotein (2) se agrupa cerca de Bank vole virus (11), lo que sugiere un cierto grado de similitud dentro del orden Mononegavirales. En cambio, Rhinovirus (3) aparece más alejado y agrupa con una rama más próxima a algunos SARS, lo cual puede deberse a propiedades compartidas del genoma de ARN.
  
  Rabies lyssavirus isolate (15) y Ebola (4): Estas dos secuencias están relativamente cercanas y forman parte de una rama independiente, lo que refleja su divergencia tanto del SARS-CoV-2 como de otros virus respiratorios, pero cierta relación entre ellos por su tipo de genoma.
  
  HIV (5) aparece en una posición aislada del árbol, indicando que, a pesar de ser también un virus de ARN, su arquitectura genética es muy distinta al resto de los virus analizados. Esta separación es esperable debido a su pertenencia a un grupo completamente diferente (Retroviridae).
  
  Perhabdovirus perca (12) y Hantavirus Z10 (13) también se agrupan cercanamente, lo que podría estar relacionado con su pertenencia a ramas similares dentro del orden Bunyavirales o Rhabdovirales.
  
  Finalmente, Respiratory syncytial virus (14) aparece como uno de los virus más alejados de todos los grupos, lo cual puede interpretarse como un linaje muy diferenciado evolutivamente respecto a los demás virus presentes en este análisis.
  
  6.-Conlcusion
  
  A lo largo de este análisis se exploraron distintas variantes virales mediante el uso de herramientas bioinformáticas en R, permitiendo comparar secuencias, evaluar su contenido genético y representar visualmente sus relaciones evolutivas. El estudio incluyó tanto virus respiratorios como variantes del SARS-CoV-2, aplicando diferentes enfoques para entender su similitud genética y posibles divergencias.
  
  Las secuencias analizadas revelaron que, aunque las variantes de SARS-CoV-2 comparten un origen común, existen diferencias genéticas que las alejan entre sí en distintos niveles. Esto se reflejó tanto en la presencia de letras ambiguas como N, W y Y, que indican posiciones inciertas o variables, como en las diferencias en la longitud de las secuencias y su contenido en pares GC, lo que influye en su estabilidad y confiabilidad.
  
  Los árboles filogenéticos generados mostraron perspectivas complementarias: el árbol basado en proteínas (msa + ape) ofreció una visión clara y comprensible sobre la cercanía evolutiva entre variantes conocidas, mientras que el árbol generado desde ADN crudo (DECIPHER) mostró una estructura más detallada y matemática de las distancias genéticas reales, aunque menos directa de interpretar.
  
  Esto permitió aplicar conceptos de biología molecular y bioinformática de forma práctica, demostrando cómo herramientas computacionales pueden facilitar el análisis de grandes volúmenes de datos genéticos. Además, resalta la importancia de la calidad de las secuencias, la elección del método de comparación, y la interpretación crítica de los resultados para sacar conclusiones significativas.

 Referencias bibliográficas

1. Zhou P, Yang XL, Wang XG, et al. A pneumonia outbreak associated with a new coronavirus of probable bat origin. Nature. 2020;579(7798):270-273.

2. Lu R, Zhao X, Li J, et al. Genomic characterisation and epidemiology of 2019 novel coronavirus: implications for virus origins and receptor binding. Lancet. 2020;395(10224):565-574.

3. Lam TT, Jia N, Zhang YW, et al. Identifying SARS-CoV-2-related coronaviruses in Malayan pangolins. Nature. 2020;583(7815):282-285.

4. Chan JF, Kok KH, Zhu Z, et al. Genomic characterization of the 2019 novel human-pathogenic coronavirus isolated from a patient with atypical pneumonia after visiting Wuhan. Emerg Microbes Infect. 2020;9(1):221-236.

5. Corman VM, Muth D, Niemeyer D, Drosten C. Hosts and Sources of Endemic Human Coronaviruses. Adv Virus Res. 2018;100:163-188.

6. Zhou P, Fan H, Lan T, et al. Fatal swine acute diarrhoea syndrome caused by an HKU2-related coronavirus of bat origin. Nature. 2018;556(7700):255-258.

7. Li W, Shi Z, Yu M, et al. Bats are natural reservoirs of SARS-like coronaviruses. Science. 2005;310(5748):676-679.

8. Andersen KG, Rambaut A, Lipkin WI, et al. The proximal origin of SARS-CoV-2. Nat Med. 2020;26(4):450-452.
#link:
