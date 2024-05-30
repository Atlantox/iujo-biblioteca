class DataTableInitializer{
    constructor(){
        var even = true
        $('#normal-dt').DataTable( {
            scrollX: true,
            order: false,
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
                "lengthMenu": "Mostrar _MENU_ registros por página",
                "info": "Mostrando _START_ a _END_ de entre _TOTAL_ registros totales",
                "infoEmpty": "No se encontraron registos",
                "infoFiltered": "(filtrado de _MAX_ registros totales)",
                "emptyTable": "No se encontraron resultados",
                "zeroRecords": "No se encontraron coincidencias"
            },
            createdRow: (row, data, index) => {
                if(even === false)
                    row.classList.add('odd')
                else
                    row.classList.add('even')
                even = !even
            }
        });
    }
}

export default DataTableInitializer