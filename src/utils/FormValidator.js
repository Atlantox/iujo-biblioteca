const field_translator = {
    'title': 'Título',
    'call_number': 'Cota',
    'author': 'Autor',
    'select2-author-container': 'Autor',
    'editorial': 'Editorial',
    'select2-editorial-container': 'Editorial',
    'state': 'Estado',
    'select2-state-container': 'Estado',
    'pages': 'Páginas',
    'description': 'Descripción',
}

class FormValidator{
    CleanWrongInputs(){
        // Remove the border-red class from each HTMLElement
        const targets = document.getElementsByClassName('border-red')

        for(let i = 0; i < targets.length; i++){
            targets[i].classList.remove('border-red')
        }
    }

    // Recieves an object key - value and check if one or more fields are empty
    // If all fields are filled, returns false else return a list of objects id: fieldFormId, message: 'error message'
    FieldsAreEmpty(fields){
        this.CleanWrongInputs()
        var errors = []
        for(let key in fields){
            if (fields[key] === '' || fields[key] === undefined){
                errors.push('El campo ' + field_translator[key]  + ' no puede estar vacío')
                const redBorderedTarget = document.getElementById(key)
                if(!redBorderedTarget.classList.contains('border-red'))
                    redBorderedTarget.classList.add('border-red')
            }
        }
        
        if(errors.length === 0)
            return false
        else
            return errors
    }

    FieldsAreNumber(fields){

    }

    FieldsAreDate(fields){

    }

    FieldsAreEmail(fields){

    }
}

export default FormValidator