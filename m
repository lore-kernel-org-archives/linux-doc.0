Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D11FD1
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 03:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="f2wN4xQO"
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A890DC
	for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:22:49 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5aa481d53e5so1372077a12.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1697426568; x=1698031368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MLK4HxQMsxrLAQzNmdHMtQCN++SQMztyyHR1MHkRQQ=;
        b=f2wN4xQOCM0f+nThGjAETD6mMdWTSPkmkKiG8kleQKCm6Mll6niSRKq+BeaUigBJ/b
         aHVu5V76nZcV2/e6sTGU4U7daNWFPyiocKph/7hXn+0NiTxcLYc8MJqR2D6bFtWlvBvp
         K4znW/+Hoq28Wd7FoS7jY5snH2FrXpnufdpyiMncHr00t5Z48MTUsREn/1/wuCJM3w8P
         KYqHGugQs10QIq1bYted9mGeoou4HVoQVP8FyZEOrzCxd3pH7fgryHypxedWpgJhILmR
         l8/fFQVTb0vFE6R9WL/1jOTP6flLTMFFm7OXzKXgVFUjK8OZc0z9yQfNjGTphnADtj60
         CB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697426568; x=1698031368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MLK4HxQMsxrLAQzNmdHMtQCN++SQMztyyHR1MHkRQQ=;
        b=RBh+YVh3DweQITjEdBTSY+Mb0plNsmK+svk+3JOKGRMkwaz7YPBcr0R17OaqGF3m70
         DPnkW2/dM+BIWDGJOjhCclkXtEvaDtD2MNhYUP44G/xdUXiXBIknXYSJYGXYCU0z13Tq
         xUGSYJAsq9bx5TeVF9z/fIegBLaLf+U3sY2NWKxmtXzvjRDX4p+MTujh/F+EN7EFWJc/
         DKKjLlJngsbnuzFpCOJMdeCrHAnx3igJa6tdgQyuYWpVOedM4yu9iZkuC18gmHbZH1yK
         GTor51xbvdDT03P6iXhie/URUmCciSmok3wn1yoOWDK5HjVRu9ONJG9YpkWW3rJ+kX3v
         dnGw==
X-Gm-Message-State: AOJu0YxDCyz6lUqezCnWuMojTGeGEnqSDFdDEZG3FHxht76jyH0hO+2U
	YSgKrPYP1tX3lYSouXCsrXkshw==
X-Google-Smtp-Source: AGHT+IGUNON6/iy5nHhowUF+lwNS0aMjdLqxBBty2ZXDevKfnR4hUvescHuITP1+A0eJuZZ+fdkYww==
X-Received: by 2002:a17:90b:4b4a:b0:27d:54b9:c3c5 with SMTP id mi10-20020a17090b4b4a00b0027d54b9c3c5mr3463142pjb.17.1697426568534;
        Sun, 15 Oct 2023 20:22:48 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090ae28800b0027758c7f585sm3452770pjz.52.2023.10.15.20.22.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Oct 2023 20:22:48 -0700 (PDT)
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
Subject: [PATCH v5 01/10] maple_tree: Add mt_free_one() and mt_attr() helpers
Date: Mon, 16 Oct 2023 11:22:17 +0800
Message-Id: <20231016032226.59199-2-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231016032226.59199-1-zhangpeng.00@bytedance.com>
References: <20231016032226.59199-1-zhangpeng.00@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add two helpers:
1. mt_free_one(), used to free a maple node.
2. mt_attr(), used to obtain the attributes of maple tree.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 lib/maple_tree.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index bb24d84a4922..ca7039633844 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -165,6 +165,11 @@ static inline int mt_alloc_bulk(gfp_t gfp, size_t size, void **nodes)
 	return kmem_cache_alloc_bulk(maple_node_cache, gfp, size, nodes);
 }
 
+static inline void mt_free_one(struct maple_node *node)
+{
+	kmem_cache_free(maple_node_cache, node);
+}
+
 static inline void mt_free_bulk(size_t size, void __rcu **nodes)
 {
 	kmem_cache_free_bulk(maple_node_cache, size, (void **)nodes);
@@ -205,6 +210,11 @@ static unsigned int mas_mt_height(struct ma_state *mas)
 	return mt_height(mas->tree);
 }
 
+static inline unsigned int mt_attr(struct maple_tree *mt)
+{
+	return mt->ma_flags & ~MT_FLAGS_HEIGHT_MASK;
+}
+
 static inline enum maple_type mte_node_type(const struct maple_enode *entry)
 {
 	return ((unsigned long)entry >> MAPLE_NODE_TYPE_SHIFT) &
@@ -5573,7 +5583,7 @@ void mas_destroy(struct ma_state *mas)
 			mt_free_bulk(count, (void __rcu **)&node->slot[1]);
 			total -= count;
 		}
-		kmem_cache_free(maple_node_cache, node);
+		mt_free_one(ma_mnode_ptr(node));
 		total--;
 	}
 
-- 
2.20.1

