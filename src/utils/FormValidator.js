const field_translator = {
    'title': 'Título',
    'call_number': 'Cota',
    'author': 'Autor',
    'editorial': 'Editorial',
    'pages': 'Páginas',
    'state': 'State',
    'description': 'Descripción',
}

class FormValidator{
    FieldsAreEmpty(fields){
        var isEmpty = false
        fields.forEach((field) => {
            if (field === '')
                isempty = true
        })
        
        return isEmpty
    }

    FieldsAreNumber(fields){

    }

    FieldsAreDate(fields){

    }

    FieldsAreEmail(fields){

    }
}

export default FormValidator