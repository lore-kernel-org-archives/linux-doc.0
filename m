Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E7F307DD29
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Nov 2018 16:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731418AbeK1Dy4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Nov 2018 22:54:56 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55759 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731782AbeK1Dyy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Nov 2018 22:54:54 -0500
Received: by mail-wm1-f68.google.com with SMTP id y139so22468249wmc.5
        for <linux-doc@vger.kernel.org>; Tue, 27 Nov 2018 08:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gUtzPQYfY+TlBxAchiIeeRXD6wCQXCysNds7bqypcX0=;
        b=IMJYfJiI/vB4T61XMcgVTV8zpG/cNUZ9nUDQYlZotMywFSqsb9p6E5fGevB3WlOUPN
         WYEvLbC1mSpKJzaGwPyy4OY2YppWyioLYLVvVb2CTW36kbdDIZZULSxTmqVX0yCtLGZr
         h7ait1GfvypAFS10mVxKoj2RlvQLCgzvXNgOOzQ/gI4BzcJfQWOT8XhNOy4hcBvljuF3
         m6lSda+HiC/s2RX543RqEk/6NhgRyhKa+80UGh0EpNFOe+b4oZiJW+HH4RvKtKxC/GCq
         4CxUQoyDF4r1KcfNAGQtcjiexUSciNdRwhomD+90qhKiRoDRT0rbnTmTSXi3u6aQ4z7T
         QA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gUtzPQYfY+TlBxAchiIeeRXD6wCQXCysNds7bqypcX0=;
        b=LNodJu6Xhc9HL7g7cNsSldY7AWpElAa+gLyi/Zh8FOSMUi/4UXz9GL1n4ArbWpICts
         9PDySxoywyZC8pWzWXFF0t0dwNImcPc1lq39ilPYy1cA1RzHaitb/JE63AgWxuh/fH0L
         ZY2qPvDHzNbDc0I2LJv43zHN0hBZVG9WZbINv+qQheCtAKTnvpfUE2hzZ8qZOkRlFxol
         NdAv4vKpBe2/qGZ9mLddCPHtBDmx7YXFtNFazlyeRx7b1/IdU8QNs5e1WbfYX95yjwf5
         o6XX7uEHWooJu6bk8dhJlxMQ6Tg9hJS08KDbXOab9kWp34CIn/hjqWxjcewdBpz0z+el
         7v/w==
X-Gm-Message-State: AGRZ1gKMTH+WZihLv8hqQu1u5f28HWh9usRssNkaW5q5/VKp08dYdD3i
        f/TC/B8U5xyEi2DSjvHs0zTlHQ==
X-Google-Smtp-Source: AJdET5cRyGAnPAul2HIkjRAXyOS/E0C99g3NbwpaMk33p87uBm2YavwrII5dayxtmukuFuwV97cF/w==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr29334808wmf.97.1543337781882;
        Tue, 27 Nov 2018 08:56:21 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id k73sm6383099wmd.36.2018.11.27.08.56.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Nov 2018 08:56:21 -0800 (PST)
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
Subject: [PATCH v12 18/25] mm: move obj_to_index to include/linux/slab_def.h
Date:   Tue, 27 Nov 2018 17:55:36 +0100
Message-Id: <b68796c554fba66d5285274ea6356e642e18a9e5.1543337629.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc0.387.gc7a69e6b6c-goog
In-Reply-To: <cover.1543337629.git.andreyknvl@google.com>
References: <cover.1543337629.git.andreyknvl@google.com>
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
2.20.0.rc0.387.gc7a69e6b6c-goog

