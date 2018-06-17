Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4FD057D048
	for <lwn-linux-doc@archive.lwn.net>; Sun, 17 Jun 2018 00:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756942AbeFQAJo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 16 Jun 2018 20:09:44 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57596 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756940AbeFQAJo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jun 2018 20:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZGvy9zEFeb1TaVHNCqBe3/vRs8eosxPgnykYCqlE/9Q=; b=NrbCXeGI6ALpGwUyJBsjcvRgX
        PFLO7W7n6ra8SoVIs5ArJFToEoFkmfL3kpcSZO2Buz9Jmbof9iomiVtcCw4xql9V5eAT2D6k8fO5o
        aCzmzuv27Nmnsdp2V9NOIqhZrxqGbRMCYtdcMqGLS2XsIVSuIizp5Zem0fsfBZbiTduEtnGR3E7Tl
        wO6rDUE9QaRsThumlz4sg+4nWM1ayPhm+yP4A0dXdQe7LEHBGByAsfhCmvcLAG3emJyBGvYLKveaK
        GEdmAVhh5M42ywpJKeK16oJeNy4B5+vuz+HovWp5jdtTx80lZ+gDT9LLhW/4SnR8qn1cWJ7BKm3Yl
        9F5Ol1SIg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fULGJ-0005Q4-4N; Sun, 17 Jun 2018 00:09:43 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Ingo Molnar <mingo@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] v4.18-rc1: fix Documentation build due to rename of main.c to
 mtrr.c
Message-ID: <335ff56a-4d19-5c91-acc7-9f24e5797c60@infradead.org>
Date:   Sat, 16 Jun 2018 17:09:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fixes this documentation build error that is due to a file rename:

Error: Cannot open file ../arch/x86/kernel/cpu/mtrr/main.c

Fixes 0afe832e55a7:
  ("Merge branch 'x86-cleanups-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")

Merge: 42964c6f6261 844ea8f62619
    Pull x86 cleanups from Ingo Molnar:
      "Misc cleanups"

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
How do you want the Fixes: info formatted?

 Documentation/core-api/kernel-api.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-418-rc1.orig/Documentation/core-api/kernel-api.rst
+++ lnx-418-rc1/Documentation/core-api/kernel-api.rst
@@ -284,7 +284,7 @@ Resources Management
 MTRR Handling
 -------------
 
-.. kernel-doc:: arch/x86/kernel/cpu/mtrr/main.c
+.. kernel-doc:: arch/x86/kernel/cpu/mtrr/mtrr.c
    :export:
 
 Security Framework


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
