Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97957C4363A
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 03:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 396E522245
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 03:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SLL26Mxq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387589AbgJODhY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Oct 2020 23:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729634AbgJODhS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Oct 2020 23:37:18 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153F8C0613D4
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 20:37:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j7so996105pgk.5
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 20:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oE8671fGdc7a/ra0xKjfKpYochKuO322S/sLHjna38o=;
        b=SLL26MxqLUcSnVrzPPc8gZDG5nPisgFw+JOp2uG+hiEng9js/7mqB0nxf35Tyi2S6Q
         OFVkrwpHysGEtXORm5Pew42lpCgG1xEiXWRIf0hb9R9BZJPDMYF081NW3O+JjJ+mfjZ2
         hvCYBkxSNm3g5s6s6XJS0x8Mr6HYpttqhdhJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oE8671fGdc7a/ra0xKjfKpYochKuO322S/sLHjna38o=;
        b=bZyBzLZMfUAxRWn4ZXjwmXUcQERgT/DfuWzKses97dAMLtgDsYgJF3v3dhzdbRxcNX
         nIp4mOCLxGJqxnykilqgM1nIfb3WOwYt15NZtQVDsoA/LLeujdYQyRi/zhy2w6zX9ynO
         zBDp1fIUnob5T0QfOcrJHEQ+IcUAJY3WvBtpgRdJP/ok467+Dvqkoi5S24f23Pv8i+PA
         XhWXym+ilw5gdP8GulM29fm+qj9CwRYhQREeefUAA54DQyw3kZ0JLYR70ftdikLrMoiN
         wseby9NS5rW9ryFqWodfxdopkJkRGQeaNoQkFrm+ZQBsRGGCPPj5dfJD3ZGNkqpHQf/F
         YxIw==
X-Gm-Message-State: AOAM530kXqRn5HW3sBaiBXpiCphZ4s0liL29SIUuDA94H7GLfBGapDNe
        MdFBvOoLOzP60Qghvm5FAyknWg==
X-Google-Smtp-Source: ABdhPJxemA8WjaemcI4SUPAgMwduvheXLqyw4BgpfqXRgW9RfNWCCl3QpfT4dnDHY30ExHKaHqU6JQ==
X-Received: by 2002:a63:cc42:: with SMTP id q2mr1820442pgi.216.1602733037644;
        Wed, 14 Oct 2020 20:37:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o4sm1077806pjp.37.2020.10.14.20.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 20:37:14 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Christoph Lameter <cl@linux.com>,
        Waiman Long <longman@redhat.com>,
        Marco Elver <elver@google.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v3 1/3] mm/slub: Clarify verification reporting
Date:   Wed, 14 Oct 2020 20:37:10 -0700
Message-Id: <20201015033712.1491731-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201015033712.1491731-1-keescook@chromium.org>
References: <20201015033712.1491731-1-keescook@chromium.org>
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

The earlier commits that slowly resulted in the "Before" reporting were:

  d86bd1bece6f ("mm/slub: support left redzone")
  ffc79d288000 ("slub: use print_hex_dump")
  2492268472e7 ("SLUB: change error reporting format to follow lockdep loosely")

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Link: https://lore.kernel.org/lkml/cfdb11d7-fb8e-e578-c939-f7f5fb69a6bd@suse.cz/
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

