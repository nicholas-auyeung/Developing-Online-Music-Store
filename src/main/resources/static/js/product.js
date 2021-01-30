function searchProducts(){
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.tBodies[0].getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td");
	tr[i].style.display = "none"
	for(j = 0; j < td.length; j++){
	    if (td) {
	      txtValue = td[j].textContent || td[j].innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      	
			continue;
			}
	    }
	}      
  }
}
