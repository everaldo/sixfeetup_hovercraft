<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

<xsl:import href="resource:templates/reST.xsl" />

<xsl:template match="/" name="main">
<html>
  <head>
    <title><xsl:value-of select="/document/@title"/></title>
    <meta name="generator" content="Hovercraft! 1.0 http://regebro.github.com/hovercraft"/>
    <xsl:if test="/document/author"> <!-- Author is a child to the document, everything else become attributes -->
      <meta name="author">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/author" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    <xsl:if test="/document/@description">
      <meta name="description">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/@description" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    <xsl:if test="/document/@keywords">
      <meta name="keywords">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/@keywords" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    
    <xsl:for-each select="/document/templateinfo/header/css">
      <link rel="stylesheet">
        <xsl:copy-of select="@*"/>
      </link>
    </xsl:for-each>
    
    <xsl:if test="/document/@pygments">
        <link rel="stylesheet" media="all">
            <xsl:attribute name="href">css/pygments/<xsl:value-of select="/document/@pygments" />.css</xsl:attribute>
        </link>
    </xsl:if>

    <xsl:for-each select="/document/templateinfo/header/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>

  </head>
  <body class="impress-not-supported">
  
    <xsl:for-each select="/document">
      <div id="impress">
        <xsl:if test="@data-transition-duration">
          <xsl:attribute name="data-transition-duration">
            <xsl:value-of select="@data-transition-duration" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@auto-console">
          <xsl:attribute name="auto-console">
            <xsl:value-of select="@auto-console" />
          </xsl:attribute>
        </xsl:if>
        <xsl:for-each select="step">
          <div class="step">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates />
          </div>
        </xsl:for-each>
      </div> 
    </xsl:for-each>
    
    <div id="footer">
      <img class="screen" width="130" height="85" title="" alt="Six Feet Up Logo" src="data:image/jpeg;base64,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" />
        
        <svg
           xmlns:dc="http://purl.org/dc/elements/1.1/"
           xmlns:cc="http://creativecommons.org/ns#"
           xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
           xmlns:svg="http://www.w3.org/2000/svg"
           xmlns="http://www.w3.org/2000/svg"
           xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
           version="1.1"
           class="print"
           width="162.5"
           height="43.75"
           id="svg2"
           xml:space="preserve"><metadata
             id="metadata8"><rdf:RDF><cc:Work
                 rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
                   rdf:resource="http://purl.org/dc/dcmitype/StillImage" /></cc:Work></rdf:RDF></metadata><defs
             id="defs6"><clipPath
               id="clipPath18"><path
                 d="M 0,349.996 0,0 l 1300,0 0,349.996 -1300,0 z"
                 inkscape:connector-curvature="0"
                 id="path20" /></clipPath></defs><g
             transform="matrix(1.25,0,0,-1.25,0,43.75)"
             id="g10"><g
               transform="scale(0.1,0.1)"
               id="g12"><g
                 id="g14"><g
                   clip-path="url(#clipPath18)"
                   id="g16"><path
                     d="m 95.9844,128.984 -25.4649,0.157 c -0.1445,0.871 -0.2656,1.574 -0.3281,2.011 -0.5078,5.227 -1.9883,8.496 -4.4492,9.793 -2.4453,1.313 -8.4219,1.946 -17.8984,1.993 -13.5665,0.089 -20.375,-4.266 -20.418,-13.028 -0.043,-5.984 1.1484,-9.551 3.5273,-10.683 2.3789,-1.129 10.4727,-2.086 24.2539,-2.832 18.586,-1.004 30.6563,-3.512 36.2422,-7.567 5.5899,-4.016 8.3672,-12.246 8.2852,-24.6483 C 99.6641,70.9844 95.8906,61.8359 88.4102,56.7461 80.918,51.7188 67.4961,49.2188 48.1562,49.3164 29.5898,49.4141 16.9062,51.7773 10.1055,56.4336 3.28516,61.0938 -0.0546875,69.7188 0,82.3242 L 0.015625,85.0586 27.0977,84.9102 c -0.4063,-1.5196 -0.6329,-2.7149 -0.7149,-3.6211 -1.1133,-9.5899 6.2734,-14.4258 22.211,-14.5118 16.4296,-0.0976 24.6835,4.6289 24.746,14.168 0.0547,9.1211 -5.0859,13.7344 -15.375,13.7891 -23.3007,0.1094 -38.625,2.3633 -45.9687,6.8206 -7.38672,4.383 -11.042975,13.523 -10.96094,27.351 0.0625,12.403 3.49609,20.762 10.25784,25.117 6.7695,4.356 19.7461,6.465 38.9218,6.383 18.125,-0.101 30.2813,-2.281 36.5313,-6.519 6.2187,-4.297 9.3125,-12.578 9.2383,-24.903"
                     inkscape:connector-curvature="0"
                     id="path22"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 146.879,204.906 -0.121,-21.652 -26.039,0.125 0.117,21.644 26.043,-0.117 z m -0.258,-46.359 -0.551,-108.3439 -26.05,0.1094 0.57,108.3595 26.031,-0.125"
                     inkscape:connector-curvature="0"
                     id="path24"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 261.148,157.949 -31.886,-50.851 34.843,-57.5199 -31.152,0.1563 -21.629,39.4765 -21.453,-39.2304 -31.988,0.1367 35.902,56.8478 -31.113,51.48 31.035,-0.156 17.781,-34.422 18.61,34.258 31.05,-0.176"
                     inkscape:connector-curvature="0"
                     id="path26"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 339.727,49.1992 0.461,88.6328 -15.368,0.078 0.114,19.727 15.339,-0.086 0.086,11.551 c 0.055,13.769 3.063,23.242 9.059,28.472 5.965,5.235 16.77,7.793 32.402,7.723 2.649,-0.024 6.305,-0.16 11.012,-0.399 l -0.113,-20.293 c -3.539,0.84 -6.582,1.293 -9.09,1.293 -11.426,0.047 -17.188,-5.589 -17.238,-16.925 l -0.075,-11.551 27.059,-0.137 -0.098,-19.719 -27.054,0.129 -0.453,-88.6247 -26.043,0.1289"
                     inkscape:connector-curvature="0"
                     id="path28"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 477.77,113.895 -0.11,4.296 c 0.07,8.625 -1.394,14.211 -4.375,16.809 -2.988,2.59 -9.48,3.887 -19.496,3.945 -9.719,0.059 -16.019,-1.465 -18.961,-4.558 -2.933,-3.078 -4.422,-9.817 -4.48,-20.254 l 47.422,-0.238 z m -0.383,-30.7505 26.144,-0.0976 -0.011,-4.2071 c -0.114,-21.1562 -16.075,-31.6523 -47.93,-31.4882 -21.613,0.0976 -35.719,3.832 -42.348,11.2109 -6.64,7.3828 -9.902,22.9102 -9.769,46.6405 0.089,21.074 3.675,35.235 10.691,42.453 6.992,7.215 20.633,10.774 40.859,10.672 19.403,-0.105 32.383,-3.699 38.946,-10.801 6.574,-7.097 9.785,-21.011 9.699,-41.707 l -0.059,-7.9489 -73.566,0.3711 c -0.176,-2.4024 -0.254,-3.9961 -0.254,-4.7461 -0.043,-10.6445 1.551,-17.7656 4.828,-21.3281 3.293,-3.5547 9.856,-5.3711 19.703,-5.4414 9.563,-0.0469 15.774,0.9687 18.668,3.0195 2.891,2.0781 4.356,6.543 4.399,13.3984"
                     inkscape:connector-curvature="0"
                     id="path30"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 595.688,113.289 -0.09,4.309 c 0.039,8.613 -1.422,14.199 -4.399,16.789 -2.996,2.586 -9.484,3.902 -19.496,3.961 -9.699,0.05 -16.027,-1.473 -18.965,-4.547 -2.914,-3.078 -4.402,-9.836 -4.468,-20.278 l 47.418,-0.234 z m -0.391,-30.7226 26.156,-0.125 -0.023,-4.1875 c -0.098,-21.1953 -16.082,-31.6523 -47.914,-31.4961 -21.614,0.1055 -35.739,3.8555 -42.356,11.211 -6.644,7.3437 -9.898,22.8906 -9.773,46.6092 0.093,21.113 3.668,35.258 10.687,42.453 7.004,7.227 20.637,10.789 40.864,10.703 19.41,-0.117 32.41,-3.703 38.96,-10.8 6.563,-7.098 9.778,-21.016 9.684,-41.711 l -0.043,-7.9261 -73.586,0.3672 c -0.156,-2.4414 -0.238,-4.0118 -0.238,-4.7657 -0.059,-10.6406 1.543,-17.7695 4.812,-21.3359 3.293,-3.5664 9.868,-5.3711 19.703,-5.4219 9.547,-0.0468 15.778,0.9688 18.676,3.0313 2.899,2.0508 4.367,6.5195 4.391,13.3945"
                     inkscape:connector-curvature="0"
                     id="path32"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 713.707,155.637 -0.09,-19.719 -41.844,0.203 -0.293,-54.4022 c -0.05,-10.0469 3.77,-15.0782 11.407,-15.1368 8.398,-0.0273 12.656,6.0469 12.722,18.2032 l 0.012,4.2968 22.188,-0.0976 -0.039,-5.4375 c 0,-4.9922 -0.188,-9.2813 -0.508,-12.8164 -1.524,-16.5508 -13.918,-24.7461 -37.207,-24.6446 -23.192,0.1133 -34.711,10.8164 -34.633,32.0391 l 0.305,58.137 -14.106,0.066 0.109,19.727 14.106,-0.071 0.121,24.274 26.031,-0.156 -0.117,-24.254 41.836,-0.211"
                     inkscape:connector-curvature="0"
                     id="path34"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 887.242,155.117 -0.539,-108.3787 -26.043,0.1367 1.57,18.5938 -0.457,0.1054 C 856.598,52.3047 844.898,45.6914 826.625,45.8203 802.008,45.9453 789.742,58.2695 789.867,82.832 l 0.383,72.766 26.023,-0.121 -0.339,-66.5434 c -0.039,-9.1992 1.238,-15.293 3.769,-18.2109 2.578,-2.918 7.91,-4.4219 16.035,-4.4336 16.66,-0.0782 25.047,9.8515 25.164,29.7851 l 0.313,59.1798 26.027,-0.137"
                     inkscape:connector-curvature="0"
                     id="path36"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 964.809,135.535 c -9.942,0.102 -16.434,-2.129 -19.481,-6.57 -3.066,-4.434 -4.629,-13.875 -4.699,-28.301 -0.067,-14.0624 1.516,-23.4062 4.738,-28.0195 3.242,-4.6367 9.863,-6.9687 19.883,-7.0195 10.164,-0.0586 16.777,2.0781 19.812,6.4727 3.047,4.3671 4.61,13.7304 4.7,28.1953 0.078,14.805 -1.407,24.355 -4.473,28.699 -3.039,4.297 -9.863,6.504 -20.48,6.543 m -51.18,19.426 26.473,-0.117 -1.094,-16.094 0.578,-0.117 c 6.336,11.687 18.074,17.48 35.215,17.375 15.847,-0.07 26.739,-4.055 32.639,-11.875 5.9,-7.863 8.81,-22.141 8.71,-42.856 -0.12,-21.5895 -3.16,-36.3864 -9.12,-44.3629 -5.95,-7.9883 -16.917,-11.9414 -32.893,-11.836 -17.071,0.0664 -28.184,5.7891 -33.371,17.1485 l -0.45,0 L 940.004,0 912.828,0.144531 913.629,154.961"
                     inkscape:connector-curvature="0"
                     id="path38"
                     style="fill:#100f0d;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1096.44,43.6523 c -0.48,9.0235 -0.24,105.9567 -44.45,230.0037 l -0.2,0.66 -0.17,0.918 -0.16,1.371 -0.07,0.95 -0.13,1.433 -0.02,0.883 0.03,0.637 0.06,0.719 c 0,0 6.04,5.707 6.06,5.707 0,0 15,1.429 94.81,18.734 66.16,14.34 100,32.184 129.43,44.059 0.61,0.257 1.05,0 1.05,0 0,0 8.46,-21.813 11.87,-49.395 1.01,-8.207 2.05,-16.855 2.84,-26.637 2.22,-26.961 3.33,-60.035 1.95,-93.91 -1.14,-28.223 0.8,-49.961 -9.36,-88.1639 -0.07,-0.2422 -1.87,-0.7149 -1.87,-0.7149 0,0 -21.08,-9.1796 -75.99,-24.8203 -8.82,-2.5117 -7.92,-1.9062 -18.76,-4.414 -24.5,-5.6563 -96.9,-18.3438 -96.92,-18.0196"
                     inkscape:connector-curvature="0"
                     id="path40"
                     style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1157.37,227.539 c 0.39,-1.039 0.77,-2.07 1.16,-3.098 0.64,0.461 1.28,0.926 1.91,1.387"
                     inkscape:connector-curvature="0"
                     id="path42"
                     style="fill:#4190ab;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1183.89,148.176 c 12.8,12.754 25.15,26.019 36.97,39.758 -17.11,11.64 -34.71,22.558 -52.86,32.695 -1.78,-1.305 -3.6,-2.602 -5.39,-3.926 8.22,-22.445 15.35,-45.324 21.28,-68.527"
                     inkscape:connector-curvature="0"
                     id="path44"
                     style="fill:#438fa4;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1156.97,236.93 c 3.82,-2.032 6.43,-3.047 10.22,-5.133 8.42,5.957 17.71,12.258 26.36,17.848 -11.79,13.457 -24.05,26.523 -36.88,39.101 -4.52,4.426 -10.42,10.379 -15.03,14.68 -4.6,-1.035 -8.36,-1.848 -12.87,-2.758 9.95,-19.715 20.09,-43.188 28.2,-63.738"
                     inkscape:connector-curvature="0"
                     id="path46"
                     style="fill:#5ab2c5;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1238.36,209.617 c 0.27,-0.351 0.51,-0.715 0.78,-1.062 3.41,4.215 6.78,8.472 10.1,12.757 15.9,20.563 33.24,45.032 46.73,67.028 -0.32,3.222 -0.5,4.203 -0.87,7.402 -29.37,-13.539 -60.63,-29.894 -87.95,-47.211 10.83,-12.578 21.27,-25.562 31.21,-38.914"
                     inkscape:connector-curvature="0"
                     id="path48"
                     style="fill:#a8e1df;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1282.45,349.996 c -0.14,0.024 -0.63,-0.172 -0.7,-0.203 -4.86,-2.039 -7.8,-3.289 -11.74,-4.961 -37.89,-16.152 -76.83,-29.598 -117.11,-39.031 17.06,-16.055 33.33,-32.949 48.77,-50.61 28.33,17.969 61.8,35.704 92.22,49.582 -1.89,15.586 -6.09,29.875 -11.13,44.727 -0.04,0.207 -0.14,0.461 -0.31,0.496"
                     inkscape:connector-curvature="0"
                     id="path50"
                     style="fill:#b3e6e4;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1176.85,142.305 c -4.8,19.215 -10.4,38.277 -16.85,57.09 -1.45,4.234 -2.96,8.449 -4.5,12.636 -25.02,-18.574 -48.46,-38.496 -70.92,-60.234 0.35,-1.934 0.83,-4.375 1.16,-6.309 19.85,-10.468 38.75,-21.64 57.58,-33.957 11.48,9.914 22.67,20.149 33.53,30.774"
                     inkscape:connector-curvature="0"
                     id="path52"
                     style="fill:#214860;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1082.95,160.562 c 7.74,7.407 20.27,19.286 38.59,34.465 10.41,8.633 21.07,16.922 31.92,24.934 -1.33,3.551 -2.66,7.109 -4.06,10.644 -2.99,1.563 -5.99,3.172 -9,4.704 -28.7,14.535 -58.33,27.746 -88.44,38.253 8.47,-23.347 20.66,-61.257 30.99,-113"
                     inkscape:connector-curvature="0"
                     id="path54"
                     style="fill:#33728c;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1145.84,240.781 c -7.62,18.789 -16.92,39.949 -26.07,57.965 -8.94,-1.75 -50.09,-10.207 -62.46,-11.844 -0.98,-0.656 -2.27,-1.566 -3.14,-2.375 -1.13,-1.074 -1.84,-2.043 -2.82,-3.277 32.23,-11.176 64.07,-24.844 94.49,-40.469"
                     inkscape:connector-curvature="0"
                     id="path56"
                     style="fill:#4695b1;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1278.55,160.816 c 6.58,6.551 13.94,13.465 20.78,19.782 1.24,34.523 0.65,51.586 -0.86,77.742 -0.28,5.121 -0.74,11 -1.18,16.082 -15.71,-24.988 -33.45,-49.867 -52.15,-72.824 7.57,-10.371 14.87,-20.914 21.86,-31.664 3.88,-2.985 7.72,-6.047 11.55,-9.118"
                     inkscape:connector-curvature="0"
                     id="path58"
                     style="fill:#9fded9;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1188.73,77.4102 c 0.92,-0.7227 1.85,-1.4649 2.79,-2.1875 -2.99,19.2578 -6.75,38.4183 -11.31,57.4333 -9.81,-9.511 -19.88,-18.683 -30.18,-27.597 13.2,-8.7817 26.1,-17.9809 38.7,-27.6488"
                     inkscape:connector-curvature="0"
                     id="path60"
                     style="fill:#245066;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1249.84,175.328 c -3.82,5.578 -7.7,11.082 -11.68,16.567 -1.43,-1.731 -2.87,-3.422 -4.33,-5.133 5.39,-3.754 10.74,-7.551 16.01,-11.434"
                     inkscape:connector-curvature="0"
                     id="path62"
                     style="fill:#4fa4ae;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1193.63,61.7266 c -0.18,1.25 -0.56,3.6718 -0.74,4.9218 -15.24,11.9922 -31.87,24.1602 -48.07,34.9136 -15.92,-13.5347 -32.37,-26.3589 -49.33,-38.4253 0.39,-6.5156 0.65,-13.0586 0.86,-19.582 3.22,0.3984 6.43,0.7695 9.65,1.2109 28.8,3.9571 87.18,16.3203 87.63,16.961"
                     inkscape:connector-curvature="0"
                     id="path64"
                     style="fill:#224055;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1284.78,155.41 c 4.46,-3.652 9.14,-7.715 13.52,-11.465 0.66,8.575 0.58,17.547 0.72,26.184 -5.16,-4.832 -9.23,-9.746 -14.24,-14.719"
                     inkscape:connector-curvature="0"
                     id="path66"
                     style="fill:#52a0a6;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1225.75,194.609 c 1.86,2.188 3.69,4.434 5.53,6.641 -10.49,14.199 -21.55,27.992 -33.08,41.422 -8.07,-5.207 -15.64,-10.293 -23.48,-15.813 11.99,-6.785 23.45,-14.164 35.08,-21.656 5.37,-3.457 10.67,-7.004 15.95,-10.594"
                     inkscape:connector-curvature="0"
                     id="path68"
                     style="fill:#52a2b2;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1094.89,72.5586 c 15.37,11.0742 30.03,22.5586 44.48,34.8124 -6.99,4.555 -14.03,9.016 -21.21,13.332 -10.26,6.172 -20.67,11.981 -31.19,17.617 3.54,-21.855 6.4,-43.6325 7.92,-65.7614"
                     inkscape:connector-curvature="0"
                     id="path70"
                     style="fill:#173348;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1258.5,160.184 c -9.49,7.3 -19.16,14.351 -29.02,21.183 -12.75,-14.851 -26.13,-29.187 -40.09,-43 4.27,-17.371 7.96,-34.949 10.92,-52.6522 0.8,-4.8554 1.54,-9.707 2.26,-14.5742 0.02,-0.0195 0.04,-0.0468 0.08,-0.0781 19.63,26.6797 41.1,52.0355 64.29,75.8325 -2.77,4.46 -5.57,8.886 -8.44,13.289"
                     inkscape:connector-curvature="0"
                     id="path72"
                     style="fill:#43859b;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1293.07,104.277 c -5.98,11.055 -14.32,26.289 -20.86,37.039 -9.7,-10 -18.95,-20.425 -28.06,-30.996 -12.17,-14.0973 -26.15,-30.7028 -37.11,-45.613 1.87,0.2539 56.64,15.9375 82.89,26.8086 1.52,5.3321 2.01,7.0196 3.14,12.7614"
                     inkscape:connector-curvature="0"
                     id="path74"
                     style="fill:#438293;fill-opacity:1;fill-rule:nonzero;stroke:none" /><path
                     d="m 1279.68,149.797 c -0.28,-0.317 -0.03,-0.102 -0.31,-0.402 5.49,-9.004 11.63,-19.493 16.73,-28.711 0.58,4.746 1.19,9.406 1.61,14.207 -5.47,4.757 -12.4,10.312 -18.03,14.906"
                     inkscape:connector-curvature="0"
                     id="path76"
                     style="fill:#4d959f;fill-opacity:1;fill-rule:nonzero;stroke:none" /></g></g></g></g></svg>
        <p>
            <xsl:value-of select="/document/@title"/>
            <xsl:if test="/document/author">
                -
                <xsl:value-of select="/document/author" />
            </xsl:if>
            <xsl:if test="/document/@event">
                 - <xsl:value-of select="/document/@event" />
            </xsl:if>
        </p>
    </div>
  
    <div id="hovercraft-help">
      <xsl:if test="/document/@skip-help">
        <xsl:attribute name="class">hide</xsl:attribute>
      </xsl:if>
      <table>
        <tr><th>Space</th><td>Forward</td></tr>
        <tr><th>Right, Down, Page Down</th><td>Next slide</td></tr>
        <tr><th>Left, Up, Page Up</th><td>Previous slide</td></tr>
        <tr><th>P</th><td>Open presenter console</td></tr>
        <tr><th>H</th><td>Toggle this help</td></tr>
      </table>
    </div>
    <xsl:for-each select="/document/templateinfo/body/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>
  
</body>
</html>
</xsl:template>

</xsl:stylesheet>
