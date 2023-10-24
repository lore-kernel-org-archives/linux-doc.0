Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2003FDB
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ad9/LY11"
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788A410D9
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 01:33:37 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2570037a12.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698136417; x=1698741217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXZWHgZHrQ6fRhi1dWH8Hwu+H4KBhNEo2ODkb4cUdHA=;
        b=ad9/LY11n2zGMzPzBh4fY7fh5YoLYIO5lCS4THCEnf8iUXJ1ZkmiVmkcUJb1y10BzE
         e+rVe/nmlQlI9e2ayDW0UK87kqxTxHttxQtNLOeiOZbb9KnkdD1x2uJBmWayO9W/PRsH
         G5EqV1WubywAOgxPDuo6rpmT4UFqWQG655cFP+PUjHwk8yVGJvYuejXvehc6CYnJtzoP
         DUpvCc7VZWchpLThQCmQCvpBkPOQjpNePY5uuDdUu0Mn9p1d0ovgO5DPc9vWLyuBH0zW
         5GMVjg87SGZ9EP+Yt2U6CD3lpkGPnMCNPyd7pl715oa+bCKYQFCN7nQcUDXTcJ1XjPgG
         79pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698136417; x=1698741217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXZWHgZHrQ6fRhi1dWH8Hwu+H4KBhNEo2ODkb4cUdHA=;
        b=W9eFE7ofCDUW7JkYWTGspKslUvSr6aQb3b41074IxqnU4gM4wNsk2dhcgXlWuvT10k
         2c6nvzRkSlemE7Jj+l71OCuZupkc6+cpO1x5/VAg5ZrK11ABMyN/Va3lAVuxHJVEntWf
         nzMw6HWxRBQgQLRUB4kSc0Va4h5n2xrAqbpJ5Uf2l5WpbnNWTVIyWFnGm+dtkWXPAwlw
         +uqrvdwvNffLP6OBhEF94CDdl82kGyk5F/Qsw5iNeD6gaMPj7m3lUvN8qsZsSQZQDlsM
         41Nf5wBi4/Q0iKJ7aZFyLfNS4uV1Q5vKWu017wBERy9jOWd16UBw+KtUl4vIwtofaNt+
         dsIQ==
X-Gm-Message-State: AOJu0YxLJfraxH8ygKplAoH2j12Dn5u6bkyNe9FI0j+HYUSjPsh7q+8y
	Ag7o4fG1lGEBmd2xcKy1dcX87w==
X-Google-Smtp-Source: AGHT+IF7YgpjhTzyLSokdtvDXNfCbJQY3JWpF75jJ39WYAp97AHtn6ttEhmwYaz4RKxtcXMftuCXLw==
X-Received: by 2002:a05:6a20:9381:b0:130:d5a:e40e with SMTP id x1-20020a056a20938100b001300d5ae40emr2254231pzh.7.1698136416831;
        Tue, 24 Oct 2023 01:33:36 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id y21-20020aa79af5000000b0068be348e35fsm7236977pfp.166.2023.10.24.01.33.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Oct 2023 01:33:36 -0700 (PDT)
From: Peng Zhang <zhangpeng.00@bytedance.com>
To: Liam.Howlett@oracle.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	willy@infradead.org,
	brauner@kernel.org,
	surenb@google.com,
	michael.christie@oracle.com,
	mjguzik@gmail.com,
	mathieu.desnoyers@efficios.com,
	npiggin@gmail.com,
	peterz@infradead.org,
	oliver.sang@intel.com,
	mst@redhat.com
Cc: zhangpeng.00@bytedance.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v6 04/10] radix tree test suite: Align kmem_cache_alloc_bulk() with kernel behavior.
Date: Tue, 24 Oct 2023 16:32:52 +0800
Message-Id: <20231024083258.65750-5-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231024083258.65750-1-zhangpeng.00@bytedance.com>
References: <20231024083258.65750-1-zhangpeng.00@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

