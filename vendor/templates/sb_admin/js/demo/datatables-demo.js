// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
    columnDefs: [{
      targets: [3,4,5],
      orderable: false
    }]
  });
});
