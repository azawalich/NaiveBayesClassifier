setwd('scr/naiveBayes/')

#renderujemy pliki pomocy
devtools::document()

# debugujemy ewentualne errory
devtools::check(cran = T, document = F, args = "--no-examples")

# instalacja pakietu do wygenerowania plikow html
# install.packages('pkgdown')
# library(pkgdown)
pkgdown::build_site(examples = F)

# ladujemy do pamieci najnowsza wersje paczki, coby potestowac 
devtools::load_all()

# jak wszystko dziala, to instalujemy paczke w naszym folderze R-owym,
# potem powinnismy wyczyscic srodowisko i zobaczyc czy dziala tak jak z load_all
devtools::install_local('/home/azawalich/dataScience/NaiveBayesClassifier/scr/naiveBayes/', dependencies = TRUE, force = TRUE)
