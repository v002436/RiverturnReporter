<?php

$name =$_GET["name"];
echo "
{\"success\":true,
 \"result\":  {\"token\":\"4fc5ef2bd77a3\",\"serverTime\":1338371883,\"expireTime\":1338372183, \"name\": \"$name\"}
}
";

?>
