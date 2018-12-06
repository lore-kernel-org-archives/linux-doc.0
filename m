Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 542EA7D8A3
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 12:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbeLFMYx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 07:24:53 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45303 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729501AbeLFMYw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 07:24:52 -0500
Received: by mail-wr1-f66.google.com with SMTP id b14so252148wru.12
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 04:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QE+Q4nZZeBuS5Au8e+/piROKf4cgt6sP42L8SlWJEXM=;
        b=wVfJoDn2JNGToLJ7T1uR10yBYoDyUvZHDPfnc33migagJxNgK+X3SnnMPkKaXVWcF5
         v6DU0pyjTpUKWwu0GEPHwrHDIrKhpC24bXdBcz+YJcAfaB/02+ok4ph+SNNgl1+MJDM4
         2PaoZbYfH88/GrmDHUvLd2wPovhStnou6VwHZqIxFuXbq1dEWnuoMs68mCqn/3V8dT/m
         r/FsTY+w6qZiGf1nry8kOTCuRubMXKayBenfsABcza7lF8t6/ApNTC0pVXwtJVEzfn/w
         2gGTTyhI6k4TX6dIeS1j4PSmYrg9rFHuvrEsBSU5NzDgCEnyQyIViFt+X8uGtgGXYdIf
         dcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QE+Q4nZZeBuS5Au8e+/piROKf4cgt6sP42L8SlWJEXM=;
        b=TozZxhpcjbH8yZi8xGNwhHHeYCiDEA5l393ehhfEL+21VTDTLOkNITPwNSRAPghtzW
         XCi94AUtEguHixRllcUv2pWWHEHfEwB+sfLOACwbV1ObTlz1zQBVuxNy6J+PsEc21YGC
         E304D15A3PZ+ypzlnSBqJ73AqrrpryrzDDlpoNodW/xgYgVnPt7YeRz0OThbvvIrMKmR
         QThlhRyXeeUzaBuh/k3m4wmCji8NuksjUObrldTbIayitPhQDroaZ2VV3tXEGupz4Ej2
         ES2MqbyXX1sBptybHq5S1UXRHWcRuW1ShogyQFs3S/mOJmYTZ726H4EbNnna2ApXDw4H
         jVxQ==
X-Gm-Message-State: AA+aEWZYQQHlNSC69dz3+G7FJzotQSzf6gknZAuBa0ntChuldhfNCfFH
        tNc07oAKfGsArnYLtMT6rexSrQ==
X-Google-Smtp-Source: AFSGD/UAxL1TxZ6RYc2RrvhCYipZjB8cIoKC8RPAEZ0NrTXPhYFAwqyGlH1xcwr5wkyHaLQL8hqwWw==
X-Received: by 2002:adf:f091:: with SMTP id n17mr9677058wro.292.1544099090436;
        Thu, 06 Dec 2018 04:24:50 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id j8sm339988wrt.40.2018.12.06.04.24.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Dec 2018 04:24:49 -0800 (PST)
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
Subject: [PATCH v13 02/25] kasan, slub: handle pointer tags in early_kmem_cache_node_alloc
Date:   Thu,  6 Dec 2018 13:24:20 +0100
Message-Id: <fc8d0fdcf733a7a52e8d0daaa650f4736a57de8c.1544099024.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc1.387.gf8505762e3-goog
In-Reply-To: <cover.1544099024.git.andreyknvl@google.com>
References: <cover.1544099024.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The previous patch updated KASAN hooks signatures and their usage in SLAB
and SLUB code, except for the early_kmem_cache_node_alloc function. This
patch handles that function separately, as it requires to reorder some of
the initialization code to correctly propagate a tagged pointer in case a
tag is assigned by kasan_kmalloc.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/slub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index fdd4a86aa882..8561a32910dd 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3364,16 +3364,16 @@ static void early_kmem_cache_node_alloc(int node)
 
 	n = page->freelist;
 	BUG_ON(!n);
-	page->freelist = get_freepointer(kmem_cache_node, n);
-	page->inuse = 1;
-	page->frozen = 0;
-	kmem_cache_node->node[node] = n;
 #ifdef CONFIG_SLUB_DEBUG
 	init_object(kmem_cache_node, n, SLUB_RED_ACTIVE);
 	init_tracking(kmem_cache_node, n);
 #endif
-	kasan_kmalloc(kmem_cache_node, n, sizeof(struct kmem_cache_node),
+	n = kasan_kmalloc(kmem_cache_node, n, sizeof(struct kmem_cache_node),
 		      GFP_KERNEL);
+	page->freelist = get_freepointer(kmem_cache_node, n);
+	page->inuse = 1;
+	page->frozen = 0;
+	kmem_cache_node->node[node] = n;
 	init_kmem_cache_node(n);
 	inc_slabs_node(kmem_cache_node, node, page->objects);
 
-- 
2.20.0.rc1.387.gf8505762e3-goog

