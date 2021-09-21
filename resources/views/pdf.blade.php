@php //echo $html; @endphp 


<table border=1 align="center" style="width:400;height:400">
    <tr>
        <th>Sr.No.</th>
        <th>Name</th>
        <th>Email</th>
    </tr>

   @php 
        
      $i=1;
          foreach($data as $v)
          {
            echo '<tr><td>'.$i.'</td><td>'.$v['name'].'</td><td>'.$v['email'].'</td></tr>';
            $i++;
          }   

   @endphp 

</table>