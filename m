Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37C5C2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 22:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E6336102A
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 22:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhFNWLg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 18:11:36 -0400
Received: from ms.lwn.net ([45.79.88.28]:50612 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229760AbhFNWLg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jun 2021 18:11:36 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A717E77F
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 22:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A717E77F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1623708572; bh=ZPZkB1WlZJpS6NqlPckxF1f7XFI2t+jvtCCjsRlcZKw=;
        h=From:To:Subject:Date:From;
        b=LCxCiNOP/DHnQHRHKOiQJilDgb2u7YOTtUXrztmCmRuaGhAuDSBsadOlb458JLIUf
         NxJ4BCsKkQf/kTLTOXSlUo3UlJz4ONIFamEXpHOjXW1Nf3R62CT0bSRRdZZq1WK+k4
         He1oqgP2CxI94OhQUZoddb3GqTdIjmm6uRBbdRvqLEj/SRv66dMZc2Pq7QyiI1UUKU
         HXRzkUS2ZHCDyck0SviqvEPnKHKOwjxup/l/mTed0PBvShWMHabtMsprJ9P7fueIIN
         Z3AqmZU8Cqrl7BVc1D+6d0k7zuyWKEQz9U0Cbb1p+xGDbjedE7X22g6mj1JbF9idu/
         peNkKLYVIv+wQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Subject: [PATCH] docs: Take a little noise out of the build process
Date:   Mon, 14 Jun 2021 16:09:32 -0600
Message-ID: <875yyg14kj.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx 3.0 works at this point (albeit slowly) so stop scaring people
with a loud warning.  We also don't need to babble about CJK support in the
LaTeX build.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/conf.py | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index a05225056e08..7d92ec3e5b6e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -41,15 +41,7 @@ extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
               'maintainers_include', 'sphinx.ext.autosectionlabel',
               'kernel_abi', 'kernel_feat']
 
-#
-# cdomain is badly broken in Sphinx 3+.  Leaving it out generates *most*
-# of the docs correctly, but not all.  Scream bloody murder but allow
-# the process to proceed; hopefully somebody will fix this properly soon.
-#
 if major >= 3:
-    sys.stderr.write('''WARNING: The kernel documentation build process
-        support for Sphinx v3.0 and above is brand new. Be prepared for
-        possible issues in the generated output.\n''')
     if (major > 3) or (minor > 0 or patch >= 2):
         # Sphinx c function parser is more pedantic with regards to type
         # checking. Due to that, having macros at c:function cause problems.
@@ -368,7 +360,6 @@ latex_elements = {
 
 cjk_cmd = check_output(['fc-list', '--format="%{family[0]}\n"']).decode('utf-8', 'ignore')
 if cjk_cmd.find("Noto Sans CJK SC") >= 0:
-    print ("enabling CJK for LaTeX builder")
     latex_elements['preamble']  += '''
 	% This is needed for translations
         \\usepackage{xeCJK}
-- 
2.31.1

