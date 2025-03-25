<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css general/styles.css">
    <title>Rockstar Inspired Page</title>
    <style>
   
   .icon{
    max-height: 10px;
    max-width: 10px;
}
    </style>
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="./css general/img/Une.png" alt="Une Logo">
        </div>
        <nav class="navbar">
            <ul>
                <li><a href="#">Games</a></li>
                <li><a href="#">Newswire</a></li>
                <li><a href="#">Videos</a></li>
                <li><a href="#">Downloads</a></li>
                <li><a href="#">Support</a></li>
            </ul>
        </nav>
        <button class="btn-get-launcher">Get Launcher</button>
    </header>

    <main class="main-content">
        <section class="featured-game">
            <img src="./css general/img/pngwing.com.png" alt="BaseDatos2">
<h1>Base de datos 2</h1>
            <div class="trailer-info">
            <article>
        <?php 
        // Ruta del directorio actual donde se encuentra el archivo index.php
$directorio =__DIR__;
//var_dump($directorio);

// Escanea el directorio en busca de carpetas
$carpetas = array_diff(scandir($directorio), array('..', '.'));
//var_dump($carpetas);
// Itera sobre las carpetas encontradas

foreach ($carpetas as $carpeta) {
    if (is_dir($carpeta)) {
        echo '<a href="'  . './' . $carpeta .'"><img src="./css general/img/carpeta.png" alt="Carpeta" class="icon"> ' . $carpeta . '</a><br>';
        # code...
    }
    // Genera la etiqueta <a> con el enlace a cada carpeta
}
        ?>
            </div>
        </section>

        <section class="news-section">
            <h2>Newswire</h2>
            <div class="news-container">
                <div class="news-item">
                    <img src="news1.jpg" alt="News 1">
                    <p>Assault on AYYT-16</p>
                </div>
                <div class="news-item">
                    <img src="news2.jpg" alt="News 2">
                    <p>Bounty Bonuses</p>
                </div>
                <div class="news-item">
                    <img src="news3.jpg" alt="News 3">
                    <p>Executive Bonuses</p>
                </div>
            </div>
        </section>

        <section class="games-section">
            <h2>Featured Games</h2>
            <div class="games-container">
                <div class="game-item">
                    <img src="gta5.jpg" alt="GTA V">
                </div>
                <div class="game-item">
                    <img src="gta-online.jpg" alt="GTA Online">
                </div>
                <div class="game-item">
                    <img src="rdr2.jpg" alt="Red Dead Redemption II">
                </div>
                <div class="game-item">
                    <img src="rdr-online.jpg" alt="Red Dead Online">
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <ul>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="#">Community Guidelines</a></li>
            <li><a href="#">Privacy</a></li>
        </ul>
        <p>&copy; Rockstar Games - All Rights Reserved</p>
    </footer>
</body>
</html>