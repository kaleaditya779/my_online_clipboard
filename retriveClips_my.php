<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retrieved clips</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #63d37d, #4abddd);
            /* Light gray background */
            color: #333;
            /* Dark gray text color */
            margin: 0;
            padding: 0;
        }

        #headingDiv {
            display: flex;
            background-color: aqua;
            flex-direction: column;
            align-items: center;
            margin: 20px;
            /* width: max-content; */
        }

        #mainHeader {
            display: flex;
            font-family: 'Amatic SC', cursive;
            font-size: 40px;
        }

        .clip-container {
            display: flex;
            flex-direction: column;
            margin: 20px;
            padding: 20px;
            background-color: #f4e5d3;
            /* Soft beige background */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            /* Subtle box shadow */
        }

        .clip-text {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            /* Choose a readable font */
            font-size: 20px;
            white-space: pre-wrap;
            /* Preserve formatting including newlines */
            word-wrap: break-word;
            /* Break long words */
            line-height: 1.4;
        }

        .clip-date {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
            /* Dark gray text color for the date */
        }
    </style>
    <!-- <script>
        const clips = document.getElementsByClassName('clip-container'); 
        // clips is the collection of all the clip-container divs
        let buttonLastCopied;

        for (const clip of clips) {
            console.log(clip.children[0].textContent)
            const button = document.createElement("button");
            setClipboardEmoji(button);
            button.addEventListener('click', () => {
                navigator.clipboard.writeText(clip.children[0].data) // assumption: the second child element is always the clip content
                    .then(() => {
                        setTickEmoji(button);
                    }, (err) => {
                        alert('Error copying text: ', err);
                    });
            });
            clip.children[2].appendChild(button);
        }

        function setClipboardEmoji(button) {
            button.innerHTML = String.fromCodePoint(0x1F4CB); // 📋 (Clipboard emoji)
        }

        function setTickEmoji(button) {
            if (buttonLastCopied) {
                setClipboardEmoji(buttonLastCopied);
            }
            button.innerHTML = String.fromCodePoint(0x2714); // ✔️ (Tick emoji)
            buttonLastCopied = button;
        }
    </script> -->

</head>

<body>
    <div id="headingDiv">
        <?php
        // code to connect with the database and keep a connection variable
        $host = 'localhost';
        $username = 'root';
        $password = '';
        $database = 'clipboard';

        $conn = new mysqli($host, $username, $password, $database);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        ?>

        <h1 id="mainHeader">These are the retrieved clips !!</h1>
        <br>
        <?php
        $clipNum = $_GET["clipNumber"];
        echo "<h3>Number of clips: $clipNum</h3>";
        // $typpe = gettype($clipNum);
        // echo "The data type of clipNum is: $typpe"; 
        ?>
    </div>
    <br>
    <?php
    // Now getting those number of clips/rows as requested by the user.
    if($clipNum == "ALL"){
        $getQuery = "SELECT clip_text, clip_date FROM clip_info ORDER BY sr_no DESC";
    }
    else {
        $getQuery = "SELECT clip_text, clip_date FROM clip_info ORDER BY sr_no DESC LIMIT $clipNum";
    }
    
    $result = $conn->query($getQuery);
    $row_count = $result->num_rows;

    if ($row_count == 0) {
        echo "<br>No record found";
    } else {
        // Here displaying all the clips in div manner..
        while ($row = $result->fetch_assoc()) {
            echo '<div class="clip-container">';
            echo '<pre class="clip-text">' . htmlspecialchars($row['clip_text']) . '</pre>';
            echo '<p class="clip-date">' . $row['clip_date'] . '</p>';
            // echo '<button></button>';
    //         echo '<div class="copydiv">
    //     <button class="copy-button" onclick="copyTheContent()">COPY</button>
    // </div>';
            echo '</div>';
        }

        $result->free_result();
    }
    ?>

    <!-- <div class="copydiv">
        <button onclick="copyTheContent()">COY</button>
    </div> -->

</body>

</html>