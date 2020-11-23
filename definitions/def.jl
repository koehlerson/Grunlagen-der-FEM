using PlutoUI
using StringDistances

hint(text) = Markdown.MD(Markdown.Admonition("hint", "Hilfe", [text]))
warning(text) = Markdown.MD(Markdown.Admonition("warning", "Warnung", [text]))
yays = [md"Sehr gut! 🐣", md"Yay ❤", md"Genau so! 🎉", md"Gut gemacht! 🐦", md"Weiter so! 🐤", md"Klasse! 🐧", md"Korrekt! 🐖", md"Sehr schön! 🐿"]
correct(text=rand(yays)) = Markdown.MD(Markdown.Admonition("correct", "Richtig!", [text]))
still_missing(text=md"Ersetzen sie `missing` mit ihrer Antwort") = Markdown.MD(Markdown.Admonition("warning", "Here we go! 🦦", [text]))
keep_working(text=md"Noch nicht die richtige Antwort, noch ein Versuch! 🦥") = Markdown.MD(Markdown.Admonition("danger", "Falsch", [text]))
solution(text; blur=true) = blur ? Markdown.MD(Markdown.Admonition("hint", "Lösung", [text])) : Markdown.MD(Markdown.Admonition("note", "Lösung", [text]))

function stringmatrix_to_mdmatrix(stringmatrix; latextype="bmatrix")
	prefix = "\\begin{$latextype}"
	suffix = "\\end{$latextype}"
	result = ""
	result *= prefix
	rows = lastindex(stringmatrix,1)
	cols = lastindex(stringmatrix,2)
	for i in 1:rows
		row = "" 
		for j in 1:cols
			row *= isa(stringmatrix[i,j], String) ? strip(stringmatrix[i,j]) : "$(stringmatrix[i,j])"
			if j != cols 
				row *= "&" 
			end
		end
		row *= "\\\\" 
		result *= row
	end
	return result *= suffix
end

function stringmatrix_vector(stringmatrix, stringvector;latextype="bmatrix")
   matrix_string = stringmatrix_to_mdmatrix(stringmatrix; latextype)
   vector_string = stringmatrix_to_mdmatrix(stringvector; latextype)
   return matrix_string * "\\qquad" * vector_string
end

function stringmatrix_vector(stringmatrix, stringvector1, stringvector2, operator;latextype="bmatrix")
   matrix_string = stringmatrix_to_mdmatrix(stringmatrix; latextype)
   vector_string1 = stringmatrix_to_mdmatrix(stringvector1; latextype)
   vector_string2 = stringmatrix_to_mdmatrix(stringvector2; latextype)
   return matrix_string * "\\cdot " * vector_string1 * operator * vector_string2
end

show_matrix(stringmatrix)=Markdown.MD(Markdown.LaTeX(stringmatrix_to_mdmatrix(stringmatrix)))
show_matrix(stringmatrix,stringvector) = Markdown.MD(Markdown.LaTeX(stringmatrix_vector(stringmatrix, stringvector)))
show_matrix(stringmatrix,stringvector1, stringvector2, operator) = Markdown.MD(Markdown.LaTeX(stringmatrix_vector(stringmatrix, stringvector1, stringvector2, operator)))


nothing
