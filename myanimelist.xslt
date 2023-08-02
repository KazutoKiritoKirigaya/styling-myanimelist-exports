<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>MyAnimeList</title>
        <style>
          body {
            background-color: aliceblue;
            color: #333;
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0 15px;
          }

          h1, h2, h3 {
            color: #2e51a2;
            font-family: 'Roboto', sans-serif;
            text-align: center;
          }

          h1 {
            font-size: 40px;
            padding-top: 10px;
          }

          .anime-list,
          .user-info-list {
            list-style: none;
            padding: 0;
            margin: 0;
          }

          .anime-entry {
            margin: 20px auto;
            padding: 15px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.2s ease-in-out;
          }

          .anime-entry:hover {
            background-color: #f8f8f8;
          }

          .anime-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
          }

          .anime-status {
            color: #4b85e0;
            font-weight: bold;
          }

          .anime-comments {
            color: #666;
            font-style: italic;
          }

          .anime-score {
            color: #333;
            font-weight: bold;
          }

          .user-info-list li {
            margin-bottom: 10px;
            color: #333;
            font-size: 16px;
          }

          .user-info-list li::before {
            content: "►";
            margin-right: 5px;
            color: #2e51a2;
            font-size: 18px;
          }

          #user-info {
            text-align: left;
          }
        </style>
      </head>
      <body>
        <xsl:apply-templates select="myanimelist"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="myanimelist">
    <h1>MyAnimeList</h1>
    <h2 id="user-info">User Information</h2>
    <ul class="user-info-list">
      <li>User ID: <xsl:value-of select="myinfo/user_id"/></li>
      <li>User Name: <xsl:value-of select="myinfo/user_name"/></li>
      <li>Total Anime: <xsl:value-of select="myinfo/user_total_anime"/></li>
      <li>Total Watching: <xsl:value-of select="myinfo/user_total_watching"/></li>
      <li>Total Completed: <xsl:value-of select="myinfo/user_total_completed"/></li>
      <li>Total On Hold: <xsl:value-of select="myinfo/user_total_onhold"/></li>
      <li>Total Dropped: <xsl:value-of select="myinfo/user_total_dropped"/></li>
      <li>Total Plan to Watch: <xsl:value-of select="myinfo/user_total_plantowatch"/></li>
    </ul>
    <ul class="anime-list">
      <xsl:apply-templates select="anime"/>
    </ul>
  </xsl:template>

  <xsl:template match="anime">
    <li class="anime-entry">
      <div class="anime-title">
        <xsl:value-of select="series_title"/>
      </div>
      <div class="anime-status">
        <xsl:value-of select="my_status"/>
      </div>
      <div class="anime-comments">
        <xsl:value-of select="my_comments"/>
      </div>
      <div class="anime-score">
        Score: <xsl:value-of select="my_score"/>
      </div>
    </li>
  </xsl:template>
</xsl:stylesheet>
