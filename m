Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13052C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 23:41:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C29BF61606
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 23:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbhBJXlA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Feb 2021 18:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbhBJXkw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Feb 2021 18:40:52 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE444C061756
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 15:40:11 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id e9so2150500pjj.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 15:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uAWSXvpQPcEZxBfWLAq9KMpbaceesRBn8UO6bwMMYcM=;
        b=mNIPYaHAuG61Uq+h7YfY4dD0IKrgyV/PFOGMyCrwlR2etIT9pSeYNs3M+z3haJt8PR
         xtRhhCViduE257iU9ZVUgKKEoGUBcLFYc+mnMX6Ky8TFEhWv/WCDyX1YHI+t2tFLWvnh
         j9UtHwqjYEeS0/ewcQpb9Diebl5JSQ+rv7d2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uAWSXvpQPcEZxBfWLAq9KMpbaceesRBn8UO6bwMMYcM=;
        b=uDjhBpDJGgZW5Uatup+F1sp4A7veGsdMbON721ICa1d2Rmi9j65szTWvvIPHttwhrb
         KbIYv0Y/BXCRd0dMJi2Hk9pFBpWRnT4glpB894xmfRkiBZewfLDl25wzZdU+cNBO2lh7
         vdBUi7zowwl/THJbDdqq10P9fUuTg1E44GfCw9+YE3DTeBNp717gntTa75pCKPkpXPqD
         UsCAWG/n5lRFTL7AtTJYJ5By6KJ3nyXbNn121cf84dZfemXDRuCNC/F0TE6oHxXuDDhQ
         4UCn8kQH9aNhd+vLNx0bRuezbMjP4FS8HFXCjJT4yVS3k5GprP/swYz/4F63EUjnCxqO
         Vrug==
X-Gm-Message-State: AOAM533hRlshVH9SOW42YPrSoJCauNoiowKKqHY7ol6ZyUJAv6ELmzK/
        My4JpbMzCf6QZBw4inTaBcgH+g==
X-Google-Smtp-Source: ABdhPJzZQIox6gVm9Zi41NhZEllcOYKZ0jTxrzJWFvIZdiBZ5WptwVebfmWD07cmb53FZ0pK4suSng==
X-Received: by 2002:a17:903:8b:b029:e2:d409:cba2 with SMTP id o11-20020a170903008bb02900e2d409cba2mr4925561pld.79.1613000411251;
        Wed, 10 Feb 2021 15:40:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c6sm3047474pjd.21.2021.02.10.15.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 15:40:10 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>
Subject: [PATCH] Documentation: Replace more lkml.org links with lore
Date:   Wed, 10 Feb 2021 15:40:05 -0800
Message-Id: <20210210234005.2236201-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=7a155117e28ac19a1867e3293ab7260d2b8b6376; i=ZkWBuV1lY/FQk1XArICOT3syW9MQpR3pnoaYs6kIaj8=; m=mcjuVZhImrtqsXSZYkRGWl5DUyj67zLBKVE703uActo=; p=6nn2B3DLs2NJLR0M14jy1xofkGgZTOlXHVy3HP9Ra/I=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmAkbtQACgkQiXL039xtwCYYkw//fh5 1LAUFJfnECFhS8UJ/+rqgm8xF7luKHaL661EA2FQXR+e92/GtzUuHTwYYSpxWly0N7L0IEvf+1KtL 46cTeRbBupxVKnpbDKO50K4yLQutvS5oPBWi1V6Gbj1WF/kfUtdNE+5SKzygDDpAW6gRD82CEl9Ve ykgNLOIEYHdG7cwzEeaQEpS+5/5d1Wa7jne9YoY18Y/3fCS5GZA1hLXGthiDCf36mboufwAZ+4YzD 9CCFJBgIfQNwuVJU/FE/DC3B7tYq4+Y/iCONfO9RVsrS9kMdepeqImHbAOdvaqbJKCjl/zvAcgy0j l7/Ab/i4/W2uKvtGXCxep+9VdO3OEU7z91QWR/AHEtgy8lOD5B8VpxX3F1L/apEQ0rllgJLvtTFkM Qvn7gKTBmK/Cn2TwFCtYTsh8n4a+SgBJOJLiHBeRLN+1tN43KKhObhXGJP2QobCXanXQ8SaXm0qxS qhRyKT7OFCACBNYVPvfIpfjbS18cd1gpdpH6fdxnTe5Q5GwdDDDmuzfQleyaYTGzQfeLBUzF6Z28i SEI3FXZN4e5a87dGgn/nPT/c1oyHutflaGbjI7bANf9e5Vih8vN0wCAoGnrY1L9qnzlTuc6mZVqDY Ta68CdAIUDsnXPtloVLZNF2B6fSJjd+puTPfXVHREMg66gXYLOnOEr7df1leqp5o=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
links with lore"), replace a few more scattered lkml.org links with
lore to better use a single source that's more likely to stay available
long-term.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 CREDITS                        | 2 +-
 tools/scripts/Makefile.include | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index cef83b958cbe..cf8e23498a34 100644
--- a/CREDITS
+++ b/CREDITS
@@ -550,7 +550,7 @@ D: gadget layers, SPI subsystem, GPIO subsystem, and more than a few
 D: device drivers.  His encouragement also helped many engineers get
 D: started working on the Linux kernel.  David passed away in early
 D: 2011, and will be greatly missed.
-W: https://lkml.org/lkml/2011/4/5/36
+W: https://lore.kernel.org/lkml/20110405034819.GA7872@kroah.com
 
 N: Gary Brubaker
 E: xavyer@ix.netcom.com
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 4255e71f72b7..01e767a049c6 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -86,7 +86,8 @@ endif
 # in newer systems.
 # Needed for the __raw_cmpxchg in tools/arch/x86/include/asm/cmpxchg.h
 #
-# See https://lkml.org/lkml/2006/11/28/253 and https://gcc.gnu.org/gcc-4.8/changes.html,
+# See https://lore.kernel.org/lkml/9a8748490611281710g78402fbeh8ff7fcc162dbcbca@mail.gmail.com/
+# and https://gcc.gnu.org/gcc-4.8/changes.html,
 # that takes into account Linus's comments (search for Wshadow) for the reasoning about
 # -Wshadow not being interesting before gcc 4.8.
 
-- 
2.25.1

