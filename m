Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0DCC83F27
	for <linux-doc@archiver.kernel.org>; Wed, 30 Aug 2023 18:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238298AbjH3Shf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244318AbjH3M5w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Aug 2023 08:57:52 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74AC193
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 05:57:25 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bee82fad0fso35034825ad.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1693400245; x=1694005045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP6g95MTpMxGO+X1eOP4Lih7hj+Gz/gWGNfVacVPrOc=;
        b=D2BcaqjVPO/gzlkDGqLxR4Cu3/LnZyAeaV3VAZQQARePdLsqtmWsIITHmSPR2Rc1zS
         SG33/PIy8p9d1+OC82IeZaaF0nx8p5Binm5j31I/rhLP0Y5Y4ptG+iBIS8crit4PHJHR
         5oKXE2TkpTbISwljRWGTNRqe3iWgsnYuw9/aG5I2GKLetUeG0/BzPco2GHrKu3+ubi/G
         hW5UQObQRQjPS2Qw1MM1vqQXcCqWTFYf7jq4l/soaEwneg1oNu4Ke/Pn1p8NNE+VfCs+
         Il5/cJv5MpPxSsxSCoW2AmAaKQeG5EfJ9pa7oDem7ORUMkPRp/vg9k3UF3WDeHl/AMrw
         Kolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693400245; x=1694005045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP6g95MTpMxGO+X1eOP4Lih7hj+Gz/gWGNfVacVPrOc=;
        b=Kj9em2BnoX16a0tfEMIQKC10N0wun90fuPxy7unXrto0iSUBqWf5OaN1Krsf+GvhzW
         PdLEtVBFkaM3bpkj+uMJHSHdjrpvTo17siwMCaaPYNur6j27xwHMfyZ7J0LmwWFv6D7O
         rJYYUGSS0wBrA7m96JZ33qB1dnEhVnvZy9XLohHsGVGXR3TP+45YyahrF3u4y929d4v3
         eTU9zAmu1HG63mf545NvADwxPZDALEYMYpTFwZXed8o+gChsN8bwoRKyXOxynW/kcdZv
         X92nRS+T7pGSCD7qyK5L68A48R3oK9lpPj/ZItCfVkwLI5Y0lHrGQeLGRr4faaqQSpxJ
         LINQ==
X-Gm-Message-State: AOJu0Yy9p9kXy2QEnwCz0++kolAVBoj+lsfgaWfsTc2yjWyJ5+zV5cvb
        lHpLF2BAU+z987sELhWC9HqhHA==
X-Google-Smtp-Source: AGHT+IE0rSvilLu9O36gttI/TkP4I00cCFIGMgIKwGw6O7fql+LFdULSrt81PWAZjYw7XwKOPHgFQA==
X-Received: by 2002:a17:903:487:b0:1bd:ccee:8f26 with SMTP id jj7-20020a170903048700b001bdccee8f26mr1802973plb.15.1693400245360;
        Wed, 30 Aug 2023 05:57:25 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id iw1-20020a170903044100b001bbd8cf6b57sm11023265plb.230.2023.08.30.05.57.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Aug 2023 05:57:25 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, peterz@infradead.org,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com, avagin@gmail.com
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Peng Zhang <zhangpeng.00@bytedance.com>
Subject: [PATCH v2 1/6] maple_tree: Add two helpers
Date:   Wed, 30 Aug 2023 20:56:49 +0800
Message-Id: <20230830125654.21257-2-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20230830125654.21257-1-zhangpeng.00@bytedance.com>
References: <20230830125654.21257-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two helpers, which will be used later.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 lib/maple_tree.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index ee1ff0c59fd7..ef234cf02e3e 100644
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
@@ -5520,7 +5530,7 @@ void mas_destroy(struct ma_state *mas)
 			mt_free_bulk(count, (void __rcu **)&node->slot[1]);
 			total -= count;
 		}
-		kmem_cache_free(maple_node_cache, node);
+		mt_free_one(ma_mnode_ptr(node));
 		total--;
 	}
 
-- 
2.20.1

