Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 03ACD7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 17:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389742AbeKGC6l (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 21:58:41 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40553 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389775AbeKGC5P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 21:57:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id b203-v6so12992854wme.5
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 09:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T48YNHXSNi4eeu2bzn4PMsbpUkqEeLL24cz/k9DQXN4=;
        b=loc8gPpA6BsyBfsLQZ1xJJK8SKgPFvND8p3yzI24gRT2R2tnyR8tmqImgBFESqB8u6
         PsKYO6u6js23G9tUx/zXdhJPXl+StChQkny+zenERtzcQKXZX8ErExSxCBBX0yJgxY9q
         ixayJsgrtswgOvbM6wpAqylRzFKJAPeUvLDsu3CzamxYGtDIKdwUQIQqlWUq2a9OtTnM
         YJ3/ly3iHAfyh/CxczjrHcrrDPYqCFrsso3DtMOk5fQuf3lw29WfInkABtCJROdU18/4
         tb44qp9/xEdYSkh/b4qqUwewkJgv1o4YKZIPZTgkYWer1OOoqUZO6eD68PC/TJpFaWzl
         /5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T48YNHXSNi4eeu2bzn4PMsbpUkqEeLL24cz/k9DQXN4=;
        b=HBCI2VURkqIFff5D68hrb3+DZPwt4RWjaKR0IZPmOIcfwfvzlI36/B2DZMf+7sqUb3
         ZTUWr+5unFC1jft3t2v4oEcUnyb+db2WDU+oM9uXdr+zM7PdItsGNkAa9NDZUTGc4f05
         Bur5eSyNdjOiXxsGdhdC2X6spnE3o72xfhYGwk2uXevDxNSiIRCd8Qlz8NunsxvMd4tq
         CcvPKX4uuWFIrP0rUaOqEEfbUORLjn2NvGV76ExJn5if4Iyvr13TBiMIabGhdrTUKu/m
         4J2KmwrWkL7XIDsMPNnWuGivRNQSvBKj8sEVA6bPdUGtDlPSZXTaUUbT/Qb8jXj2EaOx
         xp3Q==
X-Gm-Message-State: AGRZ1gJga8Dk7YwyBB/cbpq8H+aClLymqUEzXMcQoePCc9vXQwnTx/r0
        nOQJ1drFZtI2jYmjazDb+srdFg==
X-Google-Smtp-Source: AJdET5cxhc/meAOXt3ESBWUaU6vT9ON5JhSvHyq74Qc/JQ1ollGs24FteiQAUYp/Kw4/4V5LhOwRHw==
X-Received: by 2002:a1c:d78e:: with SMTP id o136-v6mr2759533wmg.124.1541525458005;
        Tue, 06 Nov 2018 09:30:58 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z17-v6sm16328416wrm.65.2018.11.06.09.30.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 09:30:57 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v10 10/22] kasan: preassign tags to objects with ctors or SLAB_TYPESAFE_BY_RCU
Date:   Tue,  6 Nov 2018 18:30:25 +0100
Message-Id: <ca1163790f93c891fed0458a8e0470519efce4ee.1541525354.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541525354.git.andreyknvl@google.com>
References: <cover.1541525354.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An object constructor can initialize pointers within this objects based on
the address of the object. Since the object address might be tagged, we
need to assign a tag before calling constructor.

The implemented approach is to assign tags to objects with constructors
when a slab is allocated and call constructors once as usual. The
downside is that such object would always have the same tag when it is
reallocated, so we won't catch use-after-frees on it.

Also pressign tags for objects from SLAB_TYPESAFE_BY_RCU caches, since
they can be validy accessed after having been freed.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/slab.c |  2 +-
 mm/slub.c | 24 ++++++++++++++----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index 26f60a22e5e0..27859fb39889 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -2574,7 +2574,7 @@ static void cache_init_objs(struct kmem_cache *cachep,
 
 	for (i = 0; i < cachep->num; i++) {
 		objp = index_to_obj(cachep, page, i);
-		kasan_init_slab_obj(cachep, objp);
+		objp = kasan_init_slab_obj(cachep, objp);
 
 		/* constructor could break poison info */
 		if (DEBUG == 0 && cachep->ctor) {
diff --git a/mm/slub.c b/mm/slub.c
index e739d46600b9..08740c3f3745 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1451,16 +1451,17 @@ static inline bool slab_free_freelist_hook(struct kmem_cache *s,
 #endif
 }
 
-static void setup_object(struct kmem_cache *s, struct page *page,
+static void *setup_object(struct kmem_cache *s, struct page *page,
 				void *object)
 {
 	setup_object_debug(s, page, object);
-	kasan_init_slab_obj(s, object);
+	object = kasan_init_slab_obj(s, object);
 	if (unlikely(s->ctor)) {
 		kasan_unpoison_object_data(s, object);
 		s->ctor(object);
 		kasan_poison_object_data(s, object);
 	}
+	return object;
 }
 
 /*
@@ -1568,16 +1569,16 @@ static bool shuffle_freelist(struct kmem_cache *s, struct page *page)
 	/* First entry is used as the base of the freelist */
 	cur = next_freelist_entry(s, page, &pos, start, page_limit,
 				freelist_count);
+	cur = setup_object(s, page, cur);
 	page->freelist = cur;
 
 	for (idx = 1; idx < page->objects; idx++) {
-		setup_object(s, page, cur);
 		next = next_freelist_entry(s, page, &pos, start, page_limit,
 			freelist_count);
+		next = setup_object(s, page, next);
 		set_freepointer(s, cur, next);
 		cur = next;
 	}
-	setup_object(s, page, cur);
 	set_freepointer(s, cur, NULL);
 
 	return true;
@@ -1599,7 +1600,7 @@ static struct page *allocate_slab(struct kmem_cache *s, gfp_t flags, int node)
 	struct page *page;
 	struct kmem_cache_order_objects oo = s->oo;
 	gfp_t alloc_gfp;
-	void *start, *p;
+	void *start, *p, *next;
 	int idx, order;
 	bool shuffle;
 
@@ -1651,13 +1652,16 @@ static struct page *allocate_slab(struct kmem_cache *s, gfp_t flags, int node)
 
 	if (!shuffle) {
 		for_each_object_idx(p, idx, s, start, page->objects) {
-			setup_object(s, page, p);
-			if (likely(idx < page->objects))
-				set_freepointer(s, p, p + s->size);
-			else
+			if (likely(idx < page->objects)) {
+				next = p + s->size;
+				next = setup_object(s, page, next);
+				set_freepointer(s, p, next);
+			} else
 				set_freepointer(s, p, NULL);
 		}
-		page->freelist = fixup_red_left(s, start);
+		start = fixup_red_left(s, start);
+		start = setup_object(s, page, start);
+		page->freelist = start;
 	}
 
 	page->inuse = page->objects;
-- 
2.19.1.930.g4563a0d9d0-goog

