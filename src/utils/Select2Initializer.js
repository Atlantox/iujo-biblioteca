class Select2Initializer{
    constructor(){
        const select2Ids = [
            'books',
            'select2',
            'readers',
            'state',
            'category',
            'editorial',
            'author'
        ]

        select2Ids.forEach((id) => { 
            $('#' + id).select2() 
        })
    }
}

export default Select2Initializer