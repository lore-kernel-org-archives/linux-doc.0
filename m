Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1327EEB64DC
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jun 2023 11:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjF0L07 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jun 2023 07:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjF0L06 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 07:26:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCC726AF;
        Tue, 27 Jun 2023 04:26:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C47F16103A;
        Tue, 27 Jun 2023 11:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D4AC433C8;
        Tue, 27 Jun 2023 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687865216;
        bh=V9hfY3Q2c1rouujy72WRW9+fMopSLOZw2yXlhO7+N70=;
        h=From:To:Cc:Subject:Date:From;
        b=RL4O0iAzU35SM5pUzggf9EVWIHU6G+KbUo+REZrd1Aufg6z2PVUq5vF9oMPpZUlAn
         yxuQ6a2fdFwWS5zmFhNdF86KwLBT7H2Ii5tG+/nt/XpHMhgpEWeK3OeI+OgJnWe2ZA
         rV78hgp4WlGp+8m2wDI58FWIRDwKxW7wXsyFcMbI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH] Documentation: embargoed-hardware-issues.rst: clean out empty and unused entries
Date:   Tue, 27 Jun 2023 13:26:43 +0200
Message-ID: <2023062742-mouse-appease-7917@gregkh>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=V9hfY3Q2c1rouujy72WRW9+fMopSLOZw2yXlhO7+N70=; b=owGbwMvMwCRo6H6F97bub03G02pJDCmzjhexTtEybAyf/fl+mPMO66Xy7C/WnVjiVuid3P2ke uFcMd2ojlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhI83KGeSrtr17/1byYdI8r VpxFVVf69M4YH4b5ZUvS15Q/eS/+Mqh/69+Hy3LXmZs8BAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are a few empty entries in the company/project list, which
confuses people as to why they are there, so remove them entirely, and
also remove an entry that doesn't wish to participate in this process.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/process/embargoed-hardware-issues.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index df978127f2d7..81a8fb0862a4 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -244,7 +244,6 @@ disclosure of a particular issue, unless requested by a response team or by
 an involved disclosed party. The current ambassadors list:
 
   ============= ========================================================
-  AMD		Tom Lendacky <thomas.lendacky@amd.com>
   Ampere	Darren Hart <darren@os.amperecomputing.com>
   ARM		Catalin Marinas <catalin.marinas@arm.com>
   IBM Power	Anton Blanchard <anton@linux.ibm.com>
@@ -254,7 +253,6 @@ an involved disclosed party. The current ambassadors list:
   Samsung	Javier González <javier.gonz@samsung.com>
 
   Microsoft	James Morris <jamorris@linux.microsoft.com>
-  VMware
   Xen		Andrew Cooper <andrew.cooper3@citrix.com>
 
   Canonical	John Johansen <john.johansen@canonical.com>
@@ -263,10 +261,8 @@ an involved disclosed party. The current ambassadors list:
   Red Hat	Josh Poimboeuf <jpoimboe@redhat.com>
   SUSE		Jiri Kosina <jkosina@suse.cz>
 
-  Amazon
   Google	Kees Cook <keescook@chromium.org>
 
-  GCC
   LLVM		Nick Desaulniers <ndesaulniers@google.com>
   ============= ========================================================
 
-- 
2.41.0

