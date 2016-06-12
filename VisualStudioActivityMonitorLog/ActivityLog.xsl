<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="html"  encoding="utf-16"/>
  <xsl:template match="activity">


    <html lang="en">
      <head>
        <meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />

        <title>Activity Monitor Log</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />

        <link rel="stylesheet" href="bootstrap.min.css" />
        <style>
          *{outline:0!important;}
          body{padding:1.5rem 0;background-color:#eeeef2}
          html,table{font-size:13px!important}
          .tab-pane{padding:0;border:5px solid #007acc; background-color:#fff}
          .table tr{background-color:#fff}
          .table thead tr th{font-size:12px!important}
          .counter{width:75px;text-align:center}
          .type{width:100px;text-align:center}
          .guid{width:250px;font-size:10px}
          .source{font-weight:700}
          .time{width:200px;font-weight:700;text-align:right}
          .vs-template{padding:3rem 1.5rem}
          .bg-inverse{color:#eceeef;background-color:#662d91}
          .navbar .nav-link{color:#fff}
          .navbar .nav-link:hover{color:#fff}
          .thead-inverse th{color:#3e3e3e;background-color:#cccedb}
          .table .table {margin: 0 0 2px 0;}
        </style>
      </head>
      <body id="body">
        
        <nav class="navbar navbar-fixed-top navbar-dark bg-inverse">
          <a class="navbar-brand" href="#"><b>Visual Studio / Activity Monitor Log</b></a>
          <ul class="nav navbar-nav pull-xs-right">
            <li class="nav-item"><a href="#body" class="nav-link" id="back-to-top" title="Back to top">Back to Top</a></li>
            <li class="nav-item"><a id="refreshLink" class="nav-link" href="#">Refresh</a></li>
            <li class="nav-item active"><a class="nav-link" href="https://github.com/tahaipek/VisualStudioActivityMonitorLogViewer">GitHub</a></li>
            <li class="nav-item active"><a class="nav-link" href="https://twitter.com/_tipek">@_tipek</a></li>
            <li class="nav-item"></li>
          </ul>
        </nav>


        <div class="vs-template ">
          <div class="row">
            <div class="col-md-12">
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#errors" role="tab" aria-controls="profile">
                    Errors (<xsl:value-of select="count(entry[type='Error'])" />)
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#warnings" role="tab" aria-controls="messages">
                    Warnings (<xsl:value-of select="count(entry[type='Warning'])" />)
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#informations" role="tab" aria-controls="settings">
                    Informations (<xsl:value-of select="count(entry[type='Information'])" />)
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#allLogs" role="tab" aria-controls="home">All Logs</a>
                </li>
              </ul>

              <div class="tab-content">

                <div class="tab-pane active" id="errors" role="tabpanel">
                  <table id="tableErrors" class="table">
                    <thead class="thead-inverse">
                      <tr>
                        <th class="counter">#</th>
                        <th class="type">Type</th>
                        <th class="source">Source</th>
                        <th class="guid">GUID</th>
                        <th class="time">Time (UTC)</th>
                      </tr>
                    </thead>
                    <tr>
                      <td class="content" colspan="5"></td>
                    </tr>
                  </table>
                </div>
                <div class="tab-pane" id="warnings" role="tabpanel">
                  <table id="tableWarnings" class="table">
                    <thead class="thead-inverse">
                      <tr>
                        <th class="counter">#</th>
                        <th class="type">Type</th>
                        <th class="source">Source</th>
                        <th class="guid">GUID</th>
                        <th class="time">Time (UTC)</th>
                      </tr>
                    </thead>
                    <tr>
                      <td class="content" colspan="5"></td>
                    </tr>
                  </table>
                </div>
                <div class="tab-pane" id="informations" role="tabpanel">
                  <table id="tableInformations" class="table">
                    <thead class="thead-inverse">
                      <tr>
                        <th class="counter">#</th>
                        <th class="type">Type</th>
                        <th class="source">Source</th>
                        <th class="guid">GUID</th>
                        <th class="time">Time (UTC)</th>
                      </tr>
                    </thead>
                    <tr>
                      <td class="content" colspan="5"></td>
                    </tr>
                  </table>
                </div>

                <div class="tab-pane" id="allLogs" role="tabpanel">

                  <table class="table">
                    <thead class="thead-inverse">
                      <tr>
                        <th class="counter">#</th>
                        <th class="type">Type</th>
                        <th class="source">Source</th>
                        <th class="guid">GUID</th>
                        <th class="time">Time (UTC)</th>
                      </tr>
                    </thead>
                    <tr>
                      <td colspan="5">
                        <xsl:apply-templates/>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>


        <script src="jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>

        <script>
          $(document).ready(function () {
          $("#refreshLink").attr("href", "?" + new Date().getTime());

          $(".tableErrorRow").each(function (index) {
          $("#tableErrors .content").append($(this).clone());
          });

          $(".tableWarningRow").each(function (index) {
          $("#tableWarnings .content").append($(this).clone());
          });


          $(".tableInformationRow").each(function (index) {
          $("#tableInformations .content").append($(this).clone());
          });
          });
          
        </script>

      </body>
    </html>

  </xsl:template>

  <xsl:template match="entry">


    <xsl:choose>

      <xsl:when test="type='Information'">
        <table class="table table-bordered table-hover tableRow tableInformationRow">

          <tr id="info" class="info">
            <th class="counter" scope="row" rowspan="2">
              # <xsl:value-of select="record"/>
            </th>
            <td class="type" rowspan="2">
              <span class="label label-info">INFORMATION</span>
            </td>
            <xsl:call-template name="row"/>
          </tr>
          <tr>
            <td class="description" colspan="7">
              <div style="overflow: auto;">
                <xsl:value-of select="description"/>
                <xsl:if test="path">
                  <br/>
                  <xsl:value-of select="path"/>
                </xsl:if>
              </div>
            </td>
          </tr>
        </table>
      </xsl:when>

      <xsl:when test="type='Warning'">
        <table class="table table-bordered table-hover tableRow tableWarningRow">
          <tr class="table-warning">
            <th class="counter" scope="row" rowspan="2">
              # <xsl:value-of select="record"/>
            </th>
            <td class="type" rowspan="2">
              <span class="label label-warning">WARNING</span>
            </td>
            <xsl:call-template name="row"/>
          </tr>
          <tr class="table-warning">
            <td class="description" colspan="7">
              <div style="overflow: auto;">
                <xsl:value-of select="description"/>
                <xsl:if test="path">
                  <br/>
                  <xsl:value-of select="path"/>
                </xsl:if>
              </div>
            </td>
          </tr>
        </table>
      </xsl:when>

      <xsl:when test="type='Error'">
        <table class="table table-bordered table-hover tableRow tableErrorRow">
          <tr class="table-danger">
            <th class="counter" scope="row" rowspan="2">
              # <xsl:value-of select="record"/>
            </th>
            <td class="type" rowspan="2">
              <span class="label label-danger">ERROR</span>
            </td>
            <xsl:call-template name="row"/>
          </tr>
          <tr class="table-danger">
            <td class="description" colspan="7">
              <div style="overflow: auto;">
                <div>
                  <b>Error Detail:</b>
                </div>
                <xsl:value-of select="description"/>
                <xsl:if test="path">
                  <br/>
                  <xsl:value-of select="path"/>
                </xsl:if>
              </div>
            </td>
          </tr>


        </table>
      </xsl:when>

    </xsl:choose>


  </xsl:template>

  <xsl:template name="row">
    <td class="source">
      <xsl:value-of select="source"/>
    </td>
    <td class="guid">
      <xsl:value-of select="guid"/>
    </td>
    <!--<td class="hr">
      <xsl:value-of select="hr"/>
    </td>-->

    <td class="time">
      <xsl:value-of select="time"/>
    </td>
  </xsl:template>

</xsl:stylesheet>