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


              <?php

$sql = "SELECT * FROM vmoviesinfo;";
$result = $db->query($sql);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        echo '<div>
                        <h2 id="title">'.$row["english_name"].'</h2>
                        <br>
                        <br>
                        
 
                        <div>
                        <img src="images/'.$row["poster"].'">
                        <br>
                        </div>
                        
                        <div>
                        <label for="id">English Name: </label> '.$row["english_name"].'
                        </div>
                        <div>
                        <label for="Year">Released Year: </label> '.$row["release_year"].'</div>
                        <div>
                        <label for="language">Language: </label> '.$row["language"].'
                        </div>
                        <div>
                        <label for="country">Country: </label> '.$row["country"].'
                        </div>
                        <div>
                        <label for="leadActor">Lead Actor: </label> '.$row["LeadActor"].'
                        </div>
                        <div>
                        <label for="leadActress">Lead Actress: </label> '.$row["LeadActress"].'
                        </div>
                        <div>
                        <label for="director">Director: </label> '.$row["Director"].'
                        </div>
                        <div>
                        <label for="producer">Producer: </label> '.$row["Producer"].'
                        </div>
                        <div>
                        <label for="Writer">Writer : </label> '.$row["Writer"].'
                        </div>
                        <div>
                        <label for="genre">Genre: </label> '.$row["genre"].'
                        </div>
                        
                     
                            </div>';
                    }//end while
                }//end if
                else {
                    echo "0 results";
                }//end else

                 $result->close();
                ?>

              </tbody>
        </table>