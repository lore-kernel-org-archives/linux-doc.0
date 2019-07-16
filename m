Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A5AD7D913
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Jul 2019 12:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732729AbfGPMK7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 08:10:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39048 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732574AbfGPMK6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 08:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5tM2MS1kf1uhWY8D5GobT8hsim8st9pL5ByAyD55Xv4=; b=DJbHJ7/Js/MFeRwn1RYpxNTBiS
        ltjF8PY00DEJYSGjZxuJjQ3xYCFklafAEx1MD5PbtSWiramVHo1hu3txZ2snNOMY6+Ef8XQAKMqcz
        2A4uQE+lFzP/JgY35XrpRIK3xPCwPJtrgSMPZE9NPlCSpJlJilg0ntASqyUl6Lr0vIMRw5Iu8mvkB
        1dOj5VdWt+VLyV7ffpLeCnU9yzG5JopR/XBvXcJ5JelLSAigtyd1IiA1r3Ex5TO03zghF+TLNGdZM
        Rvd9+5Baro6gbNOTpX/+KjSiVhYswGLnfL2SiRAHfpL/ZXr7c0rvuBFD8477VzPWNwlC97yFu5SJi
        O1l73vHQ==;
Received: from [189.27.46.152] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnMIL-0004ht-7f; Tue, 16 Jul 2019 12:10:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnMII-0000Qu-Pr; Tue, 16 Jul 2019 09:10:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 06/14] docs: conf.py: only use CJK if the font is available
Date:   Tue, 16 Jul 2019 09:10:45 -0300
Message-Id: <b18a35d87d3fe5737bed91c4c912dda68276b343.1563277838.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563277838.git.mchehab+samsung@kernel.org>
References: <cover.1563277838.git.mchehab+samsung@kernel.org>
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

