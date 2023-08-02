<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>MyAnimeList</title>
        <style>
          /* Apply CSS styles to the document */
          body {
            background-color: #f0f0f0;
            color: #333;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
          }
          h1, h2, h3 {
            color: #2E51A2;
          }
          .anime-list {
            list-style: none;
            padding: 0;
          }
          .anime-entry {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #fff;
          }
          .anime-title {
            font-size: 18px;
            font-weight: bold;
          }
          .anime-status {
            color: #4B85E0;
          }
          .anime-comments {
            color: #777;
            font-style: italic;
          }
          .anime-score {
            color: #333;
            font-weight: bold;
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
    <h2>User Information</h2>
    <ul>
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
