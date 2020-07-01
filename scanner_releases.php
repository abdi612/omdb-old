<?php

  $nav_selected = "SCANNER";
  $left_buttons = "No";
  $left_selected = "";

  include("./nav.php");
  global $db;

  ?>

<style>
    #title {
        text-align: center;
        color: darkgoldenrod;
    }
 
    
</style>

<div class="right-content">
    <div class="container">
    <h2 id="title">Movies List</h2><br>
    
        <table id="info" cellpadding="0" cellspacing="0" border="0"
            class="datatable table table-striped table-bordered datatable-style table-hover"
            width="100%" style="width: 100px;">
              <thead>
                <tr id="table-first-row">
                        <th>id</th>
                        <th>Local Name</th>
                        <th>English Name</th>
                        <th>Year</th>
                        <th>Language</th>
                        <th>Country</th>
                        <th>Lead Actor</th>
                        <th>Lead Actress</th>
                        <th>Director</th>
                        <th>Producer</th>
                        <th>Writer</th>
                        <th>Genre</th>
                        <th>Poster</th>
                        
                </tr>
              </thead>



              <tbody>

              <?php

$sql = "SELECT * FROM vmoviesinfo;";
$result = $db->query($sql);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        echo '<tr>
            
                        <th>'.$row["id"].'</th>
                        <th>'.$row["local_name"].'</th>
                        <th>'.$row["english_name"].'</th>
                        <th>'.$row["release_year"].'</th>
                        <th>'.$row["language"].'</th>
                        <th>'.$row["country"].'</th>
                        <th>'.$row["LeadActor"].'</th>
                        <th>'.$row["LeadActress"].'</th>
                        <th>'.$row["Director"].'</th>
                        <th>'.$row["Producer"].'</th>
                        <th>'.$row["Writer"].'</th>
                        <th>'.$row["genre"].'</th>
                        <th><img src="images/'.$row["poster"].'"></th>
                     
                            </tr>';
                    }//end while
                }//end if
                else {
                    echo "0 results";
                }//end else

                 $result->close();
                ?>

              </tbody>
        </table>


        <script type="text/javascript" language="javascript">
    $(document).ready( function () {
        
        $('#info').DataTable( {
            dom: 'lfrtBip',
            buttons: [
                'copy', 'excel', 'csv', 'pdf'
            ] }
        );

        $('#info thead tr').clone(true).appendTo( '#info thead' );
        $('#info thead tr:eq(1) th').each( function (i) {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    
            $( 'input', this ).on( 'keyup change', function () {
                if ( table.column(i).search() !== this.value ) {
                    table
                        .column(i)
                        .search( this.value )
                        .draw();
                }
            } );
        } );
    
        var table = $('#info').DataTable( {
            orderCellsTop: true,
            fixedHeader: true,
            retrieve: true
        } );
        
    } );

</script>

        

 <style>
   tfoot {
     display: table-header-group;
   }
 </style>

  <?php include("./footer.php"); ?>
