<HTML>

 <HEAD>

    <TITLE>Form Results/Using Strings</TITLE>
 </HEAD>
        <BODY>

        <?php

         /* Эта страница получает и обрабатывает данные, принятые

  от "form.html". */

   $FirstName = trim($FirstName);

    $LastName = trim($LastName). ;

  $Email = trim($Email)

   $Comments = trim($Comments);

   $Name = $FirstName . " " . $LastName;

   print ("Your name is $Name.<BR>n");

   print ("Your Email address is $Email.<BR>n");

   print ("This is what you had to say:<BR>n $Comments<BR>n");

   $CryptName = crypt($Name);

   print ("<P>This is the crypt() version of your name: $CryptNamen");

  ?>
        </BODY>
        </HTML>