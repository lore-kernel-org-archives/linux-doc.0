Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA60C3062E
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 14:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244253AbjHQOna (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352045AbjHQOm6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 10:42:58 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C39D359D
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=x05b/HV5exgeM133qM2otg6aE9OHYqAirfKHhl5VQCg=; b=ByHok/nhCxVvE+JNnLqe+xZYq2
        15kqzr1jvbkln1HcA0rnpQox3E6hFrhiTIUBLTaq71OdyMlEkMH53+0W8gq+1E74dpUa1RaFEdQeD
        LI69nftuyQnPIvJWncOTnfMVZEBGBtKdxXuCAdhZO9bxI2XalYOmosboYSjwEGkP3HGBkcsWI3em+
        r/LjiSpWUkSPX9I2BAY0VzIhhBP5HtSCffSYrS6ACYmsUvu5igHfb5k4pq62BCzmWhgAldIokzzV/
        ID38I5jRVBmJ7fLd1pPCK49Ygzq57AXVPlNywowmL4yAMom9KRyfuaVDkSQkn+K8BVcs8dle5ZgAK
        oCExAENg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qWeBz-003n4W-SL; Thu, 17 Aug 2023 14:41:43 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Carlos Bilbao <carlos.bilbao@amd.com>
Subject: [PATCH] doc: Always check kernel-doc
Date:   Thu, 17 Aug 2023 15:41:42 +0100
Message-Id: <20230817144142.903553-1-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

kernel-doc checks were initially enabled only for builds which had extra
warnings enabled.  We have now eliminated enough kernel-doc warnings that
we can enable kernel-doc checking by default.  This comes at a slight
cost; for an allmodconfig build, make -j8 fs/ timings on my laptop
increase by less than 5%:

before real     4m7.456s        4m4.416s        4m6.663s
after real      4m18.960s       4m21.566s       4m23.234s
before user     29m35.370s      29m11.036s      29m30.092s
after user      30m55.602s      31m10.918s      31m20.311s
before sys      2m8.230s        2m6.392s        2m9.727s
after sys       2m19.896        2m23.422s       2m25.762s

This feels like a reasonable price to pay to force people to keep
documentation up to date.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
 scripts/Makefile.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 82e3fb19fdaf..52f57c0c5227 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -100,11 +100,9 @@ else ifeq ($(KBUILD_CHECKSRC),2)
         cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif
 
-ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
+cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
         $<
-endif
 
 # Compile C sources (.c)
 # ---------------------------------------------------------------------------
-- 
2.40.1

