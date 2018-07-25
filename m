Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BC7B07D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 22:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731344AbeGYXwX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Jul 2018 19:52:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34369 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731295AbeGYXwX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jul 2018 19:52:23 -0400
Received: by mail-pg1-f195.google.com with SMTP id y5-v6so6217387pgv.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Jul 2018 15:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oxY++LSQOfleh6kuZ6Nnmu39HCHVekdNBgalBw0zoSQ=;
        b=dNw1lwGRgCROauGjwQ4GoQAxHZzBADqcxn2rXvCFmB0EStqG1axxxJ402+bbVMHvlM
         uU2rrDj+5wqSAPa3FOCCAyc+wz4CdCa8rLyTGrJWfDevP34w6rbhJnVku+ub9ftF1E3J
         +XlHPoRn9gxLtUmiEmjSfKndNLpVwNIfzYJ3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oxY++LSQOfleh6kuZ6Nnmu39HCHVekdNBgalBw0zoSQ=;
        b=PhhPnY+TYgxvNiqMXrplyKaaXmuEyShr+i7CGTx1DhrwUtXDhbsnza6VJ4KcysWfOQ
         XPNIgunboS5hwXd+iTrmivmbTnLejKwW7BAC0Skxz5MglRan+pzVGhZSiaMsgWEFutUZ
         5nYqN1jv1cgcV2mevJMAqzjqNOpW7kC1jkhra+4uwMVO/G5IpdGDf7/0dqAxkSkctC6o
         8KqMy5KdMujyR9z9thC1AHIHCCLoq2aVVLFpRdeag4WGgsyHYkAXL0E2VHn/PmTIqkED
         LNoXZg3V0P4FoRlxcleRsGLITVGLFW8lcEs4nI3LiV+FYw2Klw5Duo4sLLjhmBfureDt
         UFsA==
X-Gm-Message-State: AOUpUlFOCgYfSclUnslyqYoP+lx5vVAaGrqJ3Ho3b3qH+UIgoYmA9UPn
        fs9HmWh1iNhPk2xVymoi+1ndZQ==
X-Google-Smtp-Source: AAOMgpc44xQ1r3QIZ4JTE3F4cmZcxLppeXn7MLZLY4/bVR9cxKfCFWH3+QfUHLuhKFk8EL2KY0oMPg==
X-Received: by 2002:a62:57dc:: with SMTP id i89-v6mr23972397pfj.65.1532558315208;
        Wed, 25 Jul 2018 15:38:35 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id r83-v6sm18241486pgr.8.2018.07.25.15.38.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jul 2018 15:38:33 -0700 (PDT)
Date:   Wed, 25 Jul 2018 15:38:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Laura Abbott <labbott@redhat.com>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm: Clarify CONFIG_PAGE_POISONING and usage
Message-ID: <20180725223832.GA43733@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Kconfig text for CONFIG_PAGE_POISONING doesn't mention that it has to
be enabled explicitly. This updates the documentation for that and adds
a note about CONFIG_PAGE_POISONING to the "page_poison" command line docs.
While here, change description of CONFIG_PAGE_POISONING_ZERO too, as it's
not "random" data, but rather the fixed debugging value that would be used
when not zeroing. Additionally removes a stray "bool" in the Kconfig.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +++--
 mm/Kconfig.debug                                | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 533ff5c68970..f8a81b929089 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2933,8 +2933,9 @@
 			on: enable the feature
 
 	page_poison=	[KNL] Boot-time parameter changing the state of
-			poisoning on the buddy allocator.
-			off: turn off poisoning
+			poisoning on the buddy allocator, available with
+			CONFIG_PAGE_POISONING=y.
+			off: turn off poisoning (default)
 			on: turn on poisoning
 
 	panic=		[KNL] Kernel behaviour on panic: delay <timeout>
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index e5e606ee5f71..9a7b8b049d04 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -46,7 +46,8 @@ config PAGE_POISONING
 	  Fill the pages with poison patterns after free_pages() and verify
 	  the patterns before alloc_pages. The filling of the memory helps
 	  reduce the risk of information leaks from freed data. This does
-	  have a potential performance impact.
+	  have a potential performance impact if enabled with the
+	  "page_poison=1" kernel boot option.
 
 	  Note that "poison" here is not the same thing as the "HWPoison"
 	  for CONFIG_MEMORY_FAILURE. This is software poisoning only.
@@ -65,7 +66,7 @@ config PAGE_POISONING_NO_SANITY
 	   say N.
 
 config PAGE_POISONING_ZERO
-	bool "Use zero for poisoning instead of random data"
+	bool "Use zero for poisoning instead of debugging value"
 	depends on PAGE_POISONING
 	---help---
 	   Instead of using the existing poison value, fill the pages with
@@ -75,7 +76,6 @@ config PAGE_POISONING_ZERO
 	   allocation.
 
 	   If unsure, say N
-	bool
 
 config DEBUG_PAGE_REF
 	bool "Enable tracepoint to track down page reference manipulation"
-- 
2.17.1


-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
