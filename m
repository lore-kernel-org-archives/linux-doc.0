Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EEFDF7D92A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 11:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfGZLba (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 07:31:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39306 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfGZLba (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 07:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5tM2MS1kf1uhWY8D5GobT8hsim8st9pL5ByAyD55Xv4=; b=I0vLv5r3/moDdwucSNPQFd0Kwh
        rIGMfW9mC9RkkTDOnDSPdk1tFlxPOiqLk6HI0jS8QvEYvUAYzVC5A/SdLQn+Dv1bWTJ9t51UQzu2c
        b/X3PLkCHldK/4bdxdCmqYae+aefq+maikpDrgWg0EzN57ZdocYkzMwxVVyQTGH0d+gwoQM2d4i94
        AD+Ud2Me/leKbjB5ijf4g9XFIFd6Qi7EI2OUIA9YFKhoxpoyVy9JqdOPoym/0JcaUqNRVbi3TKtZe
        vv83VALKPpygCbB1qaWaaf/YODdmIOSa2hjtDX1JZxO1+1TQyFe2SWHcigt900dTB/wT7PJ3sTirm
        1QVqJmIQ==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqyRc-0005vr-Nn; Fri, 26 Jul 2019 11:31:29 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqyRZ-0008EC-EW; Fri, 26 Jul 2019 08:31:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 03/10] docs: conf.py: only use CJK if the font is available
Date:   Fri, 26 Jul 2019 08:31:17 -0300
Message-Id: <5a9e47f3094a6188a3e9279bd48e2a6a19ab9f5b.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If we try to build a book with asian characters with XeLaTeX
and the font is not available, it will produce an error.

So, instead, add a logic at conf.py to detect if the proper
font is installed.

This will avoid an error while building the document, although
the result may not be readable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/conf.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index fa0a42b47e62..a8fe845832bc 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -16,6 +16,8 @@ import sys
 import os
 import sphinx
 
+from subprocess import check_output
+
 # Get Sphinx version
 major, minor, patch = sphinx.version_info[:3]
 
@@ -276,13 +278,20 @@ latex_elements = {
         \\setsansfont{DejaVu Sans}
         \\setromanfont{DejaVu Serif}
         \\setmonofont{DejaVu Sans Mono}
+     '''
+}
 
+# At least one book (translations) may have Asian characters
+# with are only displayed if xeCJK is used
+
+cjk_cmd = check_output(['fc-list', '--format="%{family[0]}\n"']).decode('utf-8', 'ignore')
+if cjk_cmd.find("Noto Sans CJK SC") >= 0:
+    print ("enabling CJK for LaTeX builder")
+    latex_elements['preamble']  += '''
 	% This is needed for translations
         \\usepackage{xeCJK}
         \\setCJKmainfont{Noto Sans CJK SC}
-
      '''
-}
 
 # Fix reference escape troubles with Sphinx 1.4.x
 if major == 1 and minor > 3:
-- 
2.21.0

