Return-Path: <SRS0=YNrp=DQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A924C35266
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 19:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6A0E22B4B
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 19:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZCPdEfES"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389651AbgJITye (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Oct 2020 15:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391315AbgJITyV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 15:54:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAEAC0613D9
        for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2020 12:54:19 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 34so8021379pgo.13
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2020 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JMYL2FCSaXkjGdwauYSRLvBY1B8xfDKXMqCzfo1TOs8=;
        b=ZCPdEfEStPdr8MBrgInFcmzphM88HeVkiLW5HeK18RfWZaUwWiD8BL6dyzwKs/1dnc
         OvyIRwqQEbyYL8lhOTaDweFLQpNL6qYjO+KCfCOzwMLQR7sRdWc8JlusCWKLJbLLqBrG
         AzMwws/+ykogo4TXKjb/cxA2ap5hUNDuUtxA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JMYL2FCSaXkjGdwauYSRLvBY1B8xfDKXMqCzfo1TOs8=;
        b=CK9Bds6xLtFbKLROP6pWCmZCCcrVGK+GRSJa5CHHusnV0zLkvkuJ8lxkqdtsPPTHMy
         CkR6fk/bcrszJ9Q9865CRozPkgsSL0HmlcBJmw7/rHO+XJKy3++N4hO5vkewJptpP47U
         l3b65LJcWvaAwi4VyhXZpLuAGNWUKIYcEG2sGz/knbWWlZyZF15dqno/HOVe0hzAD2z9
         Dg9DTdd5Dq/W3GLYUe9w2UCgRyh+IKi0Y9rF9hsmSJE28ql9KMU68TN+sqeZFL1foJvd
         b8HKjxD1WHSi3XQAC4dI3mNVF8ZFqSnldgDDknpSVwL+GSqmEoYVAm3O51nlhUmRCIxa
         YTYw==
X-Gm-Message-State: AOAM532bU2L9pwQy+d8Hr7mp+2nbts1VuF7s3jj1+at7vwnfyDPAK/Qu
        ME8ADikiwi8T7sEVkBkaNYT8OA==
X-Google-Smtp-Source: ABdhPJy1JWcE3giDZXo2NocSb/TmztEuw95HJz8DBEL5swgLDRHJMERTIzgeXrC7UsA6aCc8bZxDOQ==
X-Received: by 2002:a17:90a:1596:: with SMTP id m22mr6456795pja.189.1602273258702;
        Fri, 09 Oct 2020 12:54:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 8sm11767961pfn.54.2020.10.09.12.54.16
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
Subject: [PATCH v2 3/3] mm/slub: Actually fix freelist pointer vs redzoning
Date:   Fri,  9 Oct 2020 12:54:11 -0700
Message-Id: <20201009195411.4018141-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009195411.4018141-1-keescook@chromium.org>
References: <20201009195411.4018141-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It turns out that SLUB redzoning ("slub_debug=Z") checks from
s->object_size rather than from s->inuse (which is normally bumped to
make room for the freelist pointer), so a cache created with an object
size less than 24 would have their freelist pointer written beyond
s->object_size, causing the redzone to corrupt the freelist pointer.
This was very visible with "slub_debug=ZF":

BUG test (Tainted: G    B            ): Right Redzone overwritten
-----------------------------------------------------------------------------

INFO: 0xffff957ead1c05de-0xffff957ead1c05df @offset=1502. First byte 0x1a instead of 0xbb
INFO: Slab 0xffffef3950b47000 objects=170 used=170 fp=0x0000000000000000 flags=0x8000000000000200
INFO: Object 0xffff957ead1c05d8 @offset=1496 fp=0xffff957ead1c0620

Redzone  (____ptrval____): bb bb bb bb bb bb bb bb               ........
Object   (____ptrval____): 00 00 00 00 00 f6 f4 a5               ........
Redzone  (____ptrval____): 40 1d e8 1a aa                        @....
Padding  (____ptrval____): 00 00 00 00 00 00 00 00               ........

Adjust the offset to stay within s->object_size.

Reported-by: Marco Elver <elver@google.com>
Link: https://lore.kernel.org/linux-mm/20200807160627.GA1420741@elver.google.com/
Fixes: 89b83f282d8b (slub: avoid redzone when choosing freepointer location)
Tested-by: Marco Elver <elver@google.com>
Link: https://lore.kernel.org/lkml/CANpmjNOwZ5VpKQn+SYWovTkFB4VsT-RPwyENBmaK0dLcpqStkA@mail.gmail.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 mm/slub.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 752fad36522c..6f115e56c5d0 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3637,7 +3637,6 @@ static int calculate_sizes(struct kmem_cache *s, int forced_order)
 {
 	slab_flags_t flags = s->flags;
 	unsigned int size = s->object_size;
-	unsigned int freepointer_area;
 	unsigned int order;
 
 	/*
@@ -3646,13 +3645,6 @@ static int calculate_sizes(struct kmem_cache *s, int forced_order)
 	 * the possible location of the free pointer.
 	 */
 	size = ALIGN(size, sizeof(void *));
-	/*
-	 * This is the area of the object where a freepointer can be
-	 * safely written. If redzoning adds more to the inuse size, we
-	 * can't use that portion for writing the freepointer, so
-	 * s->offset must be limited within this for the general case.
-	 */
-	freepointer_area = size;
 
 #ifdef CONFIG_SLUB_DEBUG
 	/*
@@ -3678,7 +3670,7 @@ static int calculate_sizes(struct kmem_cache *s, int forced_order)
 
 	/*
 	 * With that we have determined the number of bytes in actual use
-	 * by the object. This is the potential offset to the free pointer.
+	 * by the object and redzoning.
 	 */
 	s->inuse = size;
 
@@ -3701,13 +3693,13 @@ static int calculate_sizes(struct kmem_cache *s, int forced_order)
 		 */
 		s->offset = size;
 		size += sizeof(void *);
-	} else if (freepointer_area > sizeof(void *)) {
+	} else {
 		/*
 		 * Store freelist pointer near middle of object to keep
 		 * it away from the edges of the object to avoid small
 		 * sized over/underflows from neighboring allocations.
 		 */
-		s->offset = ALIGN(freepointer_area / 2, sizeof(void *));
+		s->offset = ALIGN_DOWN(s->object_size / 2, sizeof(void *));
 	}
 
 #ifdef CONFIG_SLUB_DEBUG
-- 
2.25.1

