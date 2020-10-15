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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4304C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 03:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70F2922245
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 03:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cSRzfwSv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387634AbgJODhY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Oct 2020 23:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729604AbgJODhR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Oct 2020 23:37:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86083C0613D2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 20:37:17 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w21so1124518pfc.7
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 20:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SurWNoEuD6TTtB4XFp88vfsS4MGv6DgcHJa9LNU4sRM=;
        b=cSRzfwSvHvjyHkoYE/K38T5Ur3yGQeAFQ/A0BVo05yNGOGjLBV7RmE2tnUgaWIJZcm
         gJCezP1zrirgCcF787B66uPhC8K1r2moXDD1eVOS3GEn7XGMiaIh5afWbiuFJbQx7EDS
         fTDqiysEC79UP8Y/HxFBu2Q2r7ifekHzFspcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SurWNoEuD6TTtB4XFp88vfsS4MGv6DgcHJa9LNU4sRM=;
        b=NAexvHyPnxeA91f9BoAlwH3+xZIXNS5T4ERdCsAUO0uKwzRMV504KeNlHMJoUK8XuS
         rr2MfJkX2fC5vClRiUm1elU74glKe77l2qe1GBlJofCVtlbuoqzk9fUZWYL6rIWZmNH+
         ynNrkBT/Ch+tnwjvL3B9gJ3JcRaLenqvZcVjvddcd9xtGSV8AY4c2aHIU6YXUNzyv7He
         AXsZCbsHTdhWEbwO5elCFoieTXoVotSsbqfylauuBEDxPrLGvd3cAWVvliKUIK6hT3CT
         59ETXs2Hwzzd3zEBpoNOyvWg6cvQqgAQOvkSD+xYrgWXxd9fOxSKTwHLtEG0nx/tnyT6
         f48g==
X-Gm-Message-State: AOAM532pdPpTL+jlC4RwLQC0+P2tUIarxnoCFm80SUr7kCey9NfxNBAb
        vqO07BraQsK2KhUmCKm8ACNAwA==
X-Google-Smtp-Source: ABdhPJxtMQurAs24PVDe3ClRON3VZXKCxnFyNNGqQxzQkVllW9GeD0AsKT82EWzmD3Jg8GfZs9INug==
X-Received: by 2002:a63:5c5e:: with SMTP id n30mr1749232pgm.54.1602733036990;
        Wed, 14 Oct 2020 20:37:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t6sm1204756pfl.50.2020.10.14.20.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 20:37:14 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>,
        stable@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Christoph Lameter <cl@linux.com>,
        Waiman Long <longman@redhat.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v3 3/3] mm/slub: Actually fix freelist pointer vs redzoning
Date:   Wed, 14 Oct 2020 20:37:12 -0700
Message-Id: <20201015033712.1491731-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201015033712.1491731-1-keescook@chromium.org>
References: <20201015033712.1491731-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It turns out that SLUB redzoning ("slub_debug=Z") checks from
s->object_size rather than from s->inuse (which is normally bumped
to make room for the freelist pointer), so a cache created with an
object size less than 24 would have the freelist pointer written beyond
s->object_size, causing the redzone to be corrupted by the freelist
pointer. This was very visible with "slub_debug=ZF":

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

(Note that no caches in this size range are known to exist in the kernel
currently.)

Reported-by: Marco Elver <elver@google.com>
Link: https://lore.kernel.org/linux-mm/20200807160627.GA1420741@elver.google.com/
Fixes: 89b83f282d8b (slub: avoid redzone when choosing freepointer location)
Cc: stable@vger.kernel.org
Tested-by: Marco Elver <elver@google.com>
Link: https://lore.kernel.org/lkml/CANpmjNOwZ5VpKQn+SYWovTkFB4VsT-RPwyENBmaK0dLcpqStkA@mail.gmail.com
Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Link: https://lore.kernel.org/lkml/0f7dd7b2-7496-5e2d-9488-2ec9f8e90441@suse.cz/
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

