Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B5AE95A97
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 09:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345719AbjJIJEr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345768AbjJIJEd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 05:04:33 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2103BC5
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 02:04:10 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1e5bc692721so937290fac.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Oct 2023 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696842249; x=1697447049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXZWHgZHrQ6fRhi1dWH8Hwu+H4KBhNEo2ODkb4cUdHA=;
        b=GZ99i+5lGt2piHXNvsRZ9ejcz11OMKmMIf0lxBL8NTHU9pwvLULkkVPiCH2prE+tQC
         uJXpkPLS3QzCiH7Yxt3Gbf4VoolSkC4a5I2zyaf3L92fXUGJnawZP8AJ8zLBM6bMkvVt
         2f4mWILlkfXoADzcCbVNVCcWY5pO4hLEF+KwKgFXn/JDQDsEpM+DxFGJbjIB14xl0M7m
         gFX/H0crq4AEitLs+yIE0URNX9k+xEAXcL49EAI5yPsTT9TkLUpDMNkMNX1EVogKP/s2
         nAnE4XCS65vYN5wVKla3zI+pAw6X6b3v3mqe6Z4auRph2qbUF/4yqS6JUVXLs0Gz3AAD
         hr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696842249; x=1697447049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXZWHgZHrQ6fRhi1dWH8Hwu+H4KBhNEo2ODkb4cUdHA=;
        b=WPAucv1UnkxIQeczKx5/ge/FW16Lsymvs9GfMBwa/zFqOXCT+jBPv3glAg29HQXbky
         Woq9xfBYGwMy/iH6fsHa4NhK4tU4nRFT1eKZKhTUJcL2TonSJOCnP+Gl45p50xXjO9og
         HS/AfqQeYlpn8I4SQLz1mqy40BpO87m/c/xljOD4KI87x6NXd+tufwLIknOHuART7lrL
         I6MHvkWU4k8EOF7GiMM9YlCqJXAK6v5ezJeDRt03caB7/1WdBno3vrm8jFoEfDlp2Rlf
         BZkMc4tCdSWxm6S4iDX8NTxZYPXjYnAsV+Wug4JLP+m6XclQsfMKfI/HuO+Vd0Nkk/Dj
         NZsw==
X-Gm-Message-State: AOJu0YwuEj+cEoTg2d5yZIcEhXX4IjmIQFJU7qdRrN3eNUSNd88tLEwe
        eBSaUIWI1X+iNqbhgB3vboMygw==
X-Google-Smtp-Source: AGHT+IHn4oU8w8VyA+/fsyHj61zhR6VGnu4RwZZtoM9wLO0d06HTYfGfAoM8qObwlt0rsYXB73IVJg==
X-Received: by 2002:a05:6870:b618:b0:1c8:d72a:d6ba with SMTP id cm24-20020a056870b61800b001c8d72ad6bamr17273488oab.45.1696842248950;
        Mon, 09 Oct 2023 02:04:08 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id fk3-20020a056a003a8300b00690ca4356f1sm5884847pfb.198.2023.10.09.02.04.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Oct 2023 02:04:08 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com, mst@redhat.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 04/10] radix tree test suite: Align kmem_cache_alloc_bulk() with kernel behavior.
Date:   Mon,  9 Oct 2023 17:03:14 +0800
Message-Id: <20231009090320.64565-5-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
References: <20231009090320.64565-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When kmem_cache_alloc_bulk() fails to allocate, leave the freed pointers
in the array. This enables a more accurate simulation of the kernel's
behavior and allows for testing potential double-free scenarios.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 tools/testing/radix-tree/linux.c | 45 +++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/tools/testing/radix-tree/linux.c b/tools/testing/radix-tree/linux.c
index 61fe2601cb3a..4eb442206d01 100644
--- a/tools/testing/radix-tree/linux.c
+++ b/tools/testing/radix-tree/linux.c
@@ -93,13 +93,9 @@ void *kmem_cache_alloc_lru(struct kmem_cache *cachep, struct list_lru *lru,
 	return p;
 }
 
-void kmem_cache_free_locked(struct kmem_cache *cachep, void *objp)
+void __kmem_cache_free_locked(struct kmem_cache *cachep, void *objp)
 {
 	assert(objp);
-	uatomic_dec(&nr_allocated);
-	uatomic_dec(&cachep->nr_allocated);
-	if (kmalloc_verbose)
-		printf("Freeing %p to slab\n", objp);
 	if (cachep->nr_objs > 10 || cachep->align) {
 		memset(objp, POISON_FREE, cachep->size);
 		free(objp);
@@ -111,6 +107,15 @@ void kmem_cache_free_locked(struct kmem_cache *cachep, void *objp)
 	}
 }
 
+void kmem_cache_free_locked(struct kmem_cache *cachep, void *objp)
+{
+	uatomic_dec(&nr_allocated);
+	uatomic_dec(&cachep->nr_allocated);
+	if (kmalloc_verbose)
+		printf("Freeing %p to slab\n", objp);
+	__kmem_cache_free_locked(cachep, objp);
+}
+
 void kmem_cache_free(struct kmem_cache *cachep, void *objp)
 {
 	pthread_mutex_lock(&cachep->lock);
@@ -141,18 +146,17 @@ int kmem_cache_alloc_bulk(struct kmem_cache *cachep, gfp_t gfp, size_t size,
 	if (kmalloc_verbose)
 		pr_debug("Bulk alloc %lu\n", size);
 
-	if (!(gfp & __GFP_DIRECT_RECLAIM)) {
-		if (cachep->non_kernel < size)
-			return 0;
-
-		cachep->non_kernel -= size;
-	}
-
 	pthread_mutex_lock(&cachep->lock);
 	if (cachep->nr_objs >= size) {
 		struct radix_tree_node *node;
 
 		for (i = 0; i < size; i++) {
+			if (!(gfp & __GFP_DIRECT_RECLAIM)) {
+				if (!cachep->non_kernel)
+					break;
+				cachep->non_kernel--;
+			}
+
 			node = cachep->objs;
 			cachep->nr_objs--;
 			cachep->objs = node->parent;
@@ -163,11 +167,19 @@ int kmem_cache_alloc_bulk(struct kmem_cache *cachep, gfp_t gfp, size_t size,
 	} else {
 		pthread_mutex_unlock(&cachep->lock);
 		for (i = 0; i < size; i++) {
+			if (!(gfp & __GFP_DIRECT_RECLAIM)) {
+				if (!cachep->non_kernel)
+					break;
+				cachep->non_kernel--;
+			}
+
 			if (cachep->align) {
 				posix_memalign(&p[i], cachep->align,
 					       cachep->size);
 			} else {
 				p[i] = malloc(cachep->size);
+				if (!p[i])
+					break;
 			}
 			if (cachep->ctor)
 				cachep->ctor(p[i]);
@@ -176,6 +188,15 @@ int kmem_cache_alloc_bulk(struct kmem_cache *cachep, gfp_t gfp, size_t size,
 		}
 	}
 
+	if (i < size) {
+		size = i;
+		pthread_mutex_lock(&cachep->lock);
+		for (i = 0; i < size; i++)
+			__kmem_cache_free_locked(cachep, p[i]);
+		pthread_mutex_unlock(&cachep->lock);
+		return 0;
+	}
+
 	for (i = 0; i < size; i++) {
 		uatomic_inc(&nr_allocated);
 		uatomic_inc(&cachep->nr_allocated);
-- 
2.20.1

