Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 18C857E95F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 18:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404170AbeKTDvw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 22:51:52 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51737 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404804AbeKTDvv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 22:51:51 -0500
Received: by mail-wm1-f68.google.com with SMTP id w7-v6so6149016wmc.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 09:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EyBpjtdRieSeOMALerP208swINOjBw8fKlaLIeFHrqw=;
        b=XIyQ7LkUD5KAD5LNVibegZo2YQL6sjY4shf+8EvtMS6lfNAIXlipRsrY9SlZEP7tD8
         B5CRBSh/M3mEjQrRCV/ecd+9q4uglviLpKl/jQ0nz3N45zcqgiXrJG/PA/uAFzg8cPxN
         ZYrVcJ48b3UetIZqZ8rVQIQLIKBJk6ESdkoMs4NEBLtfVOB56wxkbDJBaySqw3JL8XNK
         xHsv7FoerSQTBV277w91lFXqeBB6vczxEDIlx2tGUMbQRzpBiq3hwY2CNya3WFAfzqeC
         HBL9OedMuAPzzcdHA2a0nv4EsScPU6M6n7KIYif+hal1VdNgGMers+rOlJaJDx7od8bA
         IMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EyBpjtdRieSeOMALerP208swINOjBw8fKlaLIeFHrqw=;
        b=JELAimzym73u+suXl4pwU0KLvKiypZOjYFYDgbXetgnvmOghET6K9wpRWoWwS1yW9y
         MSzm+YqxZg+DlP/dWosHkPBEA6OQllmFmg7NPLWC/XUxVtgHvVMjn79e4Yeolai7rzVZ
         iJX6o6hlN8b8Y2YzdLv7H3bwQ7UDI3uc79VkSgMrQdCv8T3AhAT4uYyTo6ai+7OfzmVq
         BMTkMfjlhS+Aem2+UvNcjb+LLtcRx+aUBQPY9Kw7dZq1m6j4Z1BC1wCZCA9Pmcxbi5vx
         H66P+ataEnLuwCqRIpfrCg8INv2nLpYO3U/2jT8YmdHeP88jeGZ3h4v/rzRERFe7Lp9c
         v/Uw==
X-Gm-Message-State: AGRZ1gKGeZvSDCd1DQG0kNq/JtRtDHj8xnP0+gKhb+ig8HtcAtB70nAv
        EobodizrytGtXHwLILW7NDhCxw==
X-Google-Smtp-Source: AJdET5em08xCL54dcPzAIIByw4HLT4EUANvkk0hgkMmdTHmVtMZ3YohRtB8Wp4xwH3qn/bCiwV77Tw==
X-Received: by 2002:a1c:4a:: with SMTP id 71-v6mr7564782wma.140.1542648444928;
        Mon, 19 Nov 2018 09:27:24 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l143-v6sm23685190wmb.23.2018.11.19.09.27.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 09:27:24 -0800 (PST)
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
Subject: [PATCH v11 18/24] mm: move obj_to_index to include/linux/slab_def.h
Date:   Mon, 19 Nov 2018 18:26:34 +0100
Message-Id: <10ca1e57fe2d5dc835e88fb9dc9ab6855ae618dc.1542648335.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.1215.g8438c0b245-goog
In-Reply-To: <cover.1542648335.git.andreyknvl@google.com>
References: <cover.1542648335.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While with SLUB we can actually preassign tags for caches with contructors
and store them in pointers in the freelist, SLAB doesn't allow that since
the freelist is stored as an array of indexes, so there are no pointers to
store the tags.

Instead we compute the tag twice, once when a slab is created before
calling the constructor and then again each time when an object is
allocated with kmalloc. Tag is computed simply by taking the lowest byte of
the index that corresponds to the object. However in kasan_kmalloc we only
have access to the objects pointer, so we need a way to find out which
index this object corresponds to.

This patch moves obj_to_index from slab.c to include/linux/slab_def.h to
be reused by KASAN.

Acked-by: Christoph Lameter <cl@linux.com>
Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/slab_def.h | 13 +++++++++++++
 mm/slab.c                | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/linux/slab_def.h b/include/linux/slab_def.h
index 3485c58cfd1c..9a5eafb7145b 100644
--- a/include/linux/slab_def.h
+++ b/include/linux/slab_def.h
@@ -104,4 +104,17 @@ static inline void *nearest_obj(struct kmem_cache *cache, struct page *page,
 		return object;
 }
 
+/*
+ * We want to avoid an expensive divide : (offset / cache->size)
+ *   Using the fact that size is a constant for a particular cache,
+ *   we can replace (offset / cache->size) by
+ *   reciprocal_divide(offset, cache->reciprocal_buffer_size)
+ */
+static inline unsigned int obj_to_index(const struct kmem_cache *cache,
+					const struct page *page, void *obj)
+{
+	u32 offset = (obj - page->s_mem);
+	return reciprocal_divide(offset, cache->reciprocal_buffer_size);
+}
+
 #endif	/* _LINUX_SLAB_DEF_H */
diff --git a/mm/slab.c b/mm/slab.c
index 27859fb39889..d2f827316dfc 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -406,19 +406,6 @@ static inline void *index_to_obj(struct kmem_cache *cache, struct page *page,
 	return page->s_mem + cache->size * idx;
 }
 
-/*
- * We want to avoid an expensive divide : (offset / cache->size)
- *   Using the fact that size is a constant for a particular cache,
- *   we can replace (offset / cache->size) by
- *   reciprocal_divide(offset, cache->reciprocal_buffer_size)
- */
-static inline unsigned int obj_to_index(const struct kmem_cache *cache,
-					const struct page *page, void *obj)
-{
-	u32 offset = (obj - page->s_mem);
-	return reciprocal_divide(offset, cache->reciprocal_buffer_size);
-}
-
 #define BOOT_CPUCACHE_ENTRIES	1
 /* internal cache of cache description objs */
 static struct kmem_cache kmem_cache_boot = {
-- 
2.19.1.1215.g8438c0b245-goog

