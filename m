Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4058A7D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 01:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbeJEIC1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 04:02:27 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:43244 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbeJEIC1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Oct 2018 04:02:27 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w950wqbD039077;
        Fri, 5 Oct 2018 01:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=xSEcHtc/atP+RQce3Y54zswMWb9E5v9mwXbkckke6cI=;
 b=I36gWKXOOHLd2L0Qiz0SX0dbYynXpR+7eXIe2iJZDVQ46WLleu7ac++M1dFY7DUOckvk
 17xCULx6q0SUSeMHImU22R6sh9t8TYcltKPLbFe6D2BRBTGJ3ieL9epBFHrsxJ2uj2Ua
 zLmv0FAcpWTvrCHMMZUNnpnedM4OOf0KeC0vJxdl7u2jw+5yTYCgBfC2HrYVA+9uE/+o
 u6jqLSrBW2TByvNAtxMsLgfTokZVlrgCyxSJEggO6YV5/NXDXhjUiFaZ9q3dwx4N0sK2
 MarX136kSdeWskS5MtCJ+WTj8Vm+WUz22u7O3m4XAk3731cbmy86TbDQpxr7oWKYgqgw vg== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
        by userp2130.oracle.com with ESMTP id 2mt0tu7pw9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Oct 2018 01:06:11 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w9516A4K026718
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 5 Oct 2018 01:06:10 GMT
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w951698k028053;
        Fri, 5 Oct 2018 01:06:09 GMT
Received: from localhost (/10.159.229.198)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 05 Oct 2018 01:06:09 +0000
Date:   Thu, 4 Oct 2018 18:06:03 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     corbet@lwn.net
Cc:     xfs <linux-xfs@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH] docs: improve readability for people with poorer eyesight
Message-ID: <20181005010603.GA6702@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9036 signatures=668706
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810050009
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

So my eyesight still hasn't fully recovered, so in the meantime it's
been difficult to read the online documentation.  Here's some stylesheet
overrides I've been using to make it easier for me to read them:
https://djwong.org/docs/kdoc/index.html

---
From: Darrick J. Wong <darrick.wong@oracle.com>

My eyesight is not in good shape, which means that I have difficulty
reading the online Linux documentation.  Specifically, body text is
oddly small compared to list items and the contrast of various text
elements is too low for me to be able to see easily.

Therefore, alter the HTML theme overrides to make the text larger and
increase the contrast for better visibility, and trust the typeface
choices of the reader's browser.

For the PDF output, increase the text size, use a sans-serif typeface
for sans-serif text, and use a serif typeface for "roman" serif text.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 Documentation/conf.py                           |    6 ++--
 Documentation/sphinx-static/theme_overrides.css |   38 +++++++++++++++++++++++
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index e45d4d2b5adb..03dd6dc135ea 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -259,7 +259,7 @@ latex_elements = {
 'papersize': 'a4paper',
 
 # The font size ('10pt', '11pt' or '12pt').
-'pointsize': '8pt',
+'pointsize': '11pt',
 
 # Latex figure (float) alignment
 #'figure_align': 'htbp',
@@ -272,8 +272,8 @@ latex_elements = {
     'preamble': '''
 	% Use some font with UTF-8 support with XeLaTeX
         \\usepackage{fontspec}
-        \\setsansfont{DejaVu Serif}
-        \\setromanfont{DejaVu Sans}
+        \\setsansfont{DejaVu Sans}
+        \\setromanfont{DejaVu Serif}
         \\setmonofont{DejaVu Sans Mono}
 
      '''
diff --git a/Documentation/sphinx-static/theme_overrides.css b/Documentation/sphinx-static/theme_overrides.css
index 522b6d4c49d4..e21e36cd6761 100644
--- a/Documentation/sphinx-static/theme_overrides.css
+++ b/Documentation/sphinx-static/theme_overrides.css
@@ -4,6 +4,44 @@
  *
  */
 
+/* Improve contrast and increase size for easier reading. */
+
+body {
+	font-family: serif;
+	color: black;
+	font-size: 100%;
+}
+
+h1, h2, .rst-content .toctree-wrapper p.caption, h3, h4, h5, h6, legend {
+	font-family: sans-serif;
+}
+
+.wy-menu-vertical li.current a {
+	color: #505050;
+}
+
+.wy-menu-vertical li.on a, .wy-menu-vertical li.current > a {
+	color: #303030;
+}
+
+div[class^="highlight"] pre {
+	font-family: monospace;
+	color: black;
+	font-size: 100%;
+}
+
+.wy-menu-vertical {
+	font-family: sans-serif;
+}
+
+.c {
+	font-style: normal;
+}
+
+p {
+	font-size: 100%;
+}
+
 /* Interim: Code-blocks with line nos - lines and line numbers don't line up.
  * see: https://github.com/rtfd/sphinx_rtd_theme/issues/419
  */
