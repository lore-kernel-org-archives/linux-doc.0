Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 31BF07DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 14:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965266AbeEJOiX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 10:38:23 -0400
Received: from osg.samsung.com ([64.30.133.232]:50825 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935660AbeEJOiW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 May 2018 10:38:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 44AFD2ED3A;
        Thu, 10 May 2018 07:38:21 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bKp7-KhXNtFi; Thu, 10 May 2018 07:38:20 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.96.165.dynamic.adsl.gvt.net.br [177.41.96.165])
        by osg.samsung.com (Postfix) with ESMTPSA id 3E97D2ED31;
        Thu, 10 May 2018 07:38:20 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fGmi1-0005HF-Nl; Thu, 10 May 2018 10:38:17 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 1/2] scripts/kernel-doc: Auto-detect common code-blocks
Date:   Thu, 10 May 2018 10:38:16 -0400
Message-Id: <2ac6e3da22119f714406925139e40f4d835d11a4.1525962971.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Comments that end with a comma and have certain keywords
should be presented as code-blocks

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/kernel-doc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0057d8eafcc1..8ce2d0f54369 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -803,7 +803,8 @@ sub output_highlight_rst {
 	#
 	if (! $in_literal) {
 	    $block .= $line . "\n";
-	    if (($line =~ /$sphinx_literal/) || ($line =~ /$sphinx_cblock/)) {
+	    if (($block =~ s/(code|example|artwork|flow|diagram)([^\:]*:)\n/$1$2:\n/) ||
+	        ($line =~ /$sphinx_literal/) || ($line =~ /$sphinx_cblock/)) {
 		$in_literal = 1;
 		$litprefix = "";
 		$output .= highlight_block($block);
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
