Return-Path: <SRS0=YNrp=DQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD800C9DCAF
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 19:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E09022B4B
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 19:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F0I4Bmj+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391320AbgJITyV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Oct 2020 15:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391316AbgJITyV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 15:54:21 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FE8C0613DC
        for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2020 12:54:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x13so5118803pfa.9
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2020 12:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MKVT1NayGOCFPj4jUjfddG2fh98d2Hp64B/fUAoeHgc=;
        b=F0I4Bmj+eZOoMvjlN+/ePSMaTLGzaEP42n737m9wUNFUUqKSjNcQ1KfgYY64SHbwc/
         pH5/+JoxjefU5iPH3wCOgQAfbtvdT/6ouLTahinKdZA7WV7o13stY5YRlxyA3MgonoCS
         C1ILFTDADlhndXBcilmyvcUSNQ9g281qHpw4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MKVT1NayGOCFPj4jUjfddG2fh98d2Hp64B/fUAoeHgc=;
        b=FaD9OxBQTLJ6HaBWgmRAQwNkYtUo52uBnFNUGb106dlA2Y21ZdypVZBtO6kA3BLSkE
         m4vToxZTaCdCAAKN9ISMjvK+XsVoIdrF/gmEcm40TY602zoOw12ziRnd/CVImzafQ3lb
         js4KTr/ZHx2uovjDoFQsvWWsop6JEQoQrTa+cOf+e5bEHYo6l90eAnDKj+OE7edcylMg
         c9fmLjR+i4/yuPglDwq/8RkISIuh9owuljQ0tFtahmvNynXTFqhzbx5Lfh/dl4d6pjVu
         lv3BL/M3P8mvt5kJ4tg1q3v6qUHcciupVqsk3X+yHNX3nrxYfRyx5eKDiYrU5jwBtimV
         gWcg==
X-Gm-Message-State: AOAM533l0CQ6EG5zY+k6oWp6cOZdmMg43iCvkF0/GIENkHhM1HMbdQls
        dRwiBr6jU7fBkrCeT/6fc8g/AA==
X-Google-Smtp-Source: ABdhPJwPN7od3JJSjQz1VUfsBLXqZz58dCE/XYP9DIxX2N/C3vfTS5tvZMhnS1O5NEJjIzdYcDnnOA==
X-Received: by 2002:a62:1951:0:b029:152:6669:ac74 with SMTP id 78-20020a6219510000b02901526669ac74mr13510431pfz.36.1602273259675;
        Fri, 09 Oct 2020 12:54:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w23sm11091704pfn.142.2020.10.09.12.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 12:54:16 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <guro@fb.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 1/3] mm/slub: Clarify verification reporting
Date:   Fri,  9 Oct 2020 12:54:09 -0700
Message-Id: <20201009195411.4018141-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009195411.4018141-1-keescook@chromium.org>
References: <20201009195411.4018141-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Instead of repeating "Redzone" and "Poison", clarify which sides of
those zones got tripped. Additionally fix column alignment in the
trailer.

Before:

BUG test (Tainted: G    B            ): Redzone overwritten
...
Redzone (____ptrval____): bb bb bb bb bb bb bb bb      ........
Object (____ptrval____): f6 f4 a5 40 1d e8            ...@..
Redzone (____ptrval____): 1a aa                        ..
Padding (____ptrval____): 00 00 00 00 00 00 00 00      ........

After:

BUG test (Tainted: G    B            ): Right Redzone overwritten
...
Redzone  (____ptrval____): bb bb bb bb bb bb bb bb      ........
Object   (____ptrval____): f6 f4 a5 40 1d e8            ...@..
Redzone  (____ptrval____): 1a aa                        ..
Padding  (____ptrval____): 00 00 00 00 00 00 00 00      ........

Fixes: d86bd1bece6f ("mm/slub: support left redzone")
Fixes: ffc79d288000 ("slub: use print_hex_dump")
Fixes: 2492268472e7 ("SLUB: change error reporting format to follow lockdep loosely")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/vm/slub.rst | 10 +++++-----
 mm/slub.c                 | 14 +++++++-------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/vm/slub.rst b/Documentation/vm/slub.rst
index 289d231cee97..77c7a3331eda 100644
--- a/Documentation/vm/slub.rst
+++ b/Documentation/vm/slub.rst
@@ -181,7 +181,7 @@ SLUB Debug output
 Here is a sample of slub debug output::
 
  ====================================================================
- BUG kmalloc-8: Redzone overwritten
+ BUG kmalloc-8: Right Redzone overwritten
  --------------------------------------------------------------------
 
  INFO: 0xc90f6d28-0xc90f6d2b. First byte 0x00 instead of 0xcc
@@ -189,10 +189,10 @@ Here is a sample of slub debug output::
  INFO: Object 0xc90f6d20 @offset=3360 fp=0xc90f6d58
  INFO: Allocated in get_modalias+0x61/0xf5 age=53 cpu=1 pid=554
 
- Bytes b4 0xc90f6d10:  00 00 00 00 00 00 00 00 5a 5a 5a 5a 5a 5a 5a 5a ........ZZZZZZZZ
-   Object 0xc90f6d20:  31 30 31 39 2e 30 30 35                         1019.005
-  Redzone 0xc90f6d28:  00 cc cc cc                                     .
-  Padding 0xc90f6d50:  5a 5a 5a 5a 5a 5a 5a 5a                         ZZZZZZZZ
+ Bytes b4 (0xc90f6d10): 00 00 00 00 00 00 00 00 5a 5a 5a 5a 5a 5a 5a 5a ........ZZZZZZZZ
+ Object   (0xc90f6d20): 31 30 31 39 2e 30 30 35                         1019.005
+ Redzone  (0xc90f6d28): 00 cc cc cc                                     .
+ Padding  (0xc90f6d50): 5a 5a 5a 5a 5a 5a 5a 5a                         ZZZZZZZZ
 
    [<c010523d>] dump_trace+0x63/0x1eb
    [<c01053df>] show_trace_log_lvl+0x1a/0x2f
diff --git a/mm/slub.c b/mm/slub.c
index 6d3574013b2f..f4f1d63f0ab9 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -698,15 +698,15 @@ static void print_trailer(struct kmem_cache *s, struct page *page, u8 *p)
 	       p, p - addr, get_freepointer(s, p));
 
 	if (s->flags & SLAB_RED_ZONE)
-		print_section(KERN_ERR, "Redzone ", p - s->red_left_pad,
+		print_section(KERN_ERR, "Redzone  ", p - s->red_left_pad,
 			      s->red_left_pad);
 	else if (p > addr + 16)
 		print_section(KERN_ERR, "Bytes b4 ", p - 16, 16);
 
-	print_section(KERN_ERR, "Object ", p,
+	print_section(KERN_ERR,         "Object   ", p,
 		      min_t(unsigned int, s->object_size, PAGE_SIZE));
 	if (s->flags & SLAB_RED_ZONE)
-		print_section(KERN_ERR, "Redzone ", p + s->object_size,
+		print_section(KERN_ERR, "Redzone  ", p + s->object_size,
 			s->inuse - s->object_size);
 
 	off = get_info_end(s);
@@ -718,7 +718,7 @@ static void print_trailer(struct kmem_cache *s, struct page *page, u8 *p)
 
 	if (off != size_from_object(s))
 		/* Beginning of the filler is the free pointer */
-		print_section(KERN_ERR, "Padding ", p + off,
+		print_section(KERN_ERR, "Padding  ", p + off,
 			      size_from_object(s) - off);
 
 	dump_stack();
@@ -895,11 +895,11 @@ static int check_object(struct kmem_cache *s, struct page *page,
 	u8 *endobject = object + s->object_size;
 
 	if (s->flags & SLAB_RED_ZONE) {
-		if (!check_bytes_and_report(s, page, object, "Redzone",
+		if (!check_bytes_and_report(s, page, object, "Left Redzone",
 			object - s->red_left_pad, val, s->red_left_pad))
 			return 0;
 
-		if (!check_bytes_and_report(s, page, object, "Redzone",
+		if (!check_bytes_and_report(s, page, object, "Right Redzone",
 			endobject, val, s->inuse - s->object_size))
 			return 0;
 	} else {
@@ -914,7 +914,7 @@ static int check_object(struct kmem_cache *s, struct page *page,
 		if (val != SLUB_RED_ACTIVE && (s->flags & __OBJECT_POISON) &&
 			(!check_bytes_and_report(s, page, p, "Poison", p,
 					POISON_FREE, s->object_size - 1) ||
-			 !check_bytes_and_report(s, page, p, "Poison",
+			 !check_bytes_and_report(s, page, p, "End Poison",
 				p + s->object_size - 1, POISON_END, 1)))
 			return 0;
 		/*
-- 
2.25.1

