class DataTableInitializer{
    constructor(){
        $('#normal-dt').DataTable( {
            "language": {
                paginate: {
                  previous: '<i class="bi bi-caret-left-fill text-white datatable-navigation"></i>',
                  next:     '<i class="bi bi-caret-right-fill text-white datatable-navigation"></i>',
                  first: "Primero",
                  last: "Último",
                },
                aria: {
                  paginate: {
                      previous: '<i class="bi bi-caret-right-fill text-white datatable-navigation"></i>',
                      next:     '<i class="bi bi-caret-right-fill text-white datatable-navigation"></i>',
                      first: "Primero",
                      last: "Último",
                  }
                },
                search: '<i class="bi bi-search text-black me-2 datatable-search"></i>',    
                "lengthMenu": "Mostrar _MENU_ libros por página",
                "info": "Mostrando _START_ a _END_ de entre _TOTAL_ libros totales",
                "infoEmpty": "No se encontraron libros",
                "infoFiltered": "(filtrado de _MAX_ libros totales)",
                "emptyTable": "No se encontraron resultados",
                "zeroRecords": "No se encontraron coincidencias"
            }
        });
    }
}

export default DataTableInitializer