<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Php Picture Table Example</title>
	</head>	
    
	<body>
		<h4>Select * from patient</h4>
	
		<table border="1">
			
			<tr>
				<td><h2>patientId</h2></td>
				<td><h2>firstName</h2></td>
				<td><h2>lastName</h2></td>
				<td><h2>dob</h2></td>
				<td><h2>townOrCity</h2></td>
				<td><h2>county</h2></td>
				<td><h2>phoneNumber</h2></td>
				<td><h2>email</h2></td>		
				<td><h2>picture</h2></td>		
				<td><h2>picture_path</h2></td>		
			</tr>

			<?php			
				$host = "localhost";
				$host1 = "http://localhost";
				$user = "root";
				$password = "";
				$database = "dentist";				
				
				$query = "Select * from patient";
				// Connect to the database
				$connect = mysqli_connect($host, $user, $password, $database) or die("Problem connecting.");
				// Set connection to UTF-8
				mysqli_query($connect, "SET NAMES utf8");
				// Select data
				$result = mysqli_query($connect, $query) or die("Bad Query.");

				mysqli_close($connect);

				while($row = $result->fetch_array())
				{
					echo "<tr>";
					echo "<td><h2>" .$row['patientId'] . "</h2></td>";
					echo "<td><h2>" .$row['firstName'] . "</h2></td>";
					echo "<td><h2>" .$row['lastName'] . "</h2></td>";
					echo "<td><h2>" .$row['dob'] . "</h2></td>";
					echo "<td><h2>" .$row['townOrCity'] . "</h2></td>";
					echo "<td><h2>" .$row['county'] . "</h2></td>";
					echo "<td><h2>" .$row['phoneNumber'] . "</h2></td>";
					echo "<td><h2>" .$row['email'] . "</h2></td>";
					echo "<td><h2><img src=image_dentist.php?patientId=".$row['patientId']." width=80 height=80/></h2></td>";
					echo "<td><h2><img src=".$host1.$row['picture_path'] . " width=80 height=80/></h2></td>";
					echo "</tr>";
				}
			?>

		<table>
	</body>
</html>