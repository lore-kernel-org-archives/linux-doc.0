Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DE7CE7A89
	for <linux-doc@archiver.kernel.org>; Mon, 25 Sep 2023 03:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjIYD62 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Sep 2023 23:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbjIYD6V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Sep 2023 23:58:21 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A110FE
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:57:52 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a7f4f7a8easo2562484b6e.2
        for <linux-doc@vger.kernel.org>; Sun, 24 Sep 2023 20:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695614272; x=1696219072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+yL99gNcpn5/1bA5Ytv+b9WTtrbhVjUMVj2M753OVQ=;
        b=Xhc8+8CCFVgq8M4fkhioYGXr0xqfY4HsZHOyHLy8IDVBp3L8OA7eySBcvMY2qitjwc
         KLJMzPgkSFwtG+oM5PTp4X+0ct2tqU1Wk1C31UZdGp9euwLA5yiinszOmB+z9Z3HJwi/
         qlXpqj1mxWKgrUBk89XLRypOpBrjPyilwCsGF+NprTTt3sKuRuqoP7fmUcuaLiPVbxcD
         TWFy8/CtNGwVzVY/fyS0odH/DOvEfCASLl7UaJWuSPAvTufb00yMzq2zSjifdjjJdui1
         PEiW7JlK8xpmd/oVDigBc9MMsAj5HvoTonyZCLNkXG7m0ge/2Lvz+n0Kr0rXSMojmI0Z
         0ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695614272; x=1696219072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+yL99gNcpn5/1bA5Ytv+b9WTtrbhVjUMVj2M753OVQ=;
        b=FE+OpaJutLVINdlvFVylzKoqy8HkP/y+XmYE5KiPRvV55e/tTz8/f1evYvlPBqWUhb
         apR1tBwdeJhNQqzYE6hhEqGERypsIIEaWMEJQiCPm8PR5jd50ghhSJ4hd/DnEZXt2ojt
         sK5xttFlDBTyEkZ/EQIpHicmgF0nGyvRIURZW9Eet2RzPUpCi/X7OvJwqxLzdei0r4g/
         cKKV557Jb+dBV/Yc+pC9MiH5U8DvF89qKV1G1f2dWBABfzzv6UpAls6TATDrB7EYOnYE
         o/R75m3G7gV8o9QeqbtrzpI52hzvmnzmFzVqTJCmy31dadBc+tv+tN+q1Cd6pBXMUiMB
         Q6gw==
X-Gm-Message-State: AOJu0YzSfMjWz2Uzr5q+q2Gkwkfg7PaHSLEJaCFt/IvJMcpqQgJ7Bdli
        AuNq0Hzq6W0VZFSi7tm5V215Ig==
X-Google-Smtp-Source: AGHT+IGG/pGqZzmPoaP75aVcvq8nPu3sTd6h1U/TptNp61/MFYSLV+D+w14uPTsm2angOH/I6VmfIA==
X-Received: by 2002:a05:6808:4d8:b0:3ae:2b43:dd52 with SMTP id a24-20020a05680804d800b003ae2b43dd52mr7344221oie.22.1695614271943;
        Sun, 24 Sep 2023 20:57:51 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id fm1-20020a056a002f8100b00679a4b56e41sm7025387pfb.43.2023.09.24.20.57.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 24 Sep 2023 20:57:51 -0700 (PDT)
From:   Peng Zhang <zhangpeng.00@bytedance.com>
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, mjguzik@gmail.com,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com,
        peterz@infradead.org, oliver.sang@intel.com
Cc:     zhangpeng.00@bytedance.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 1/9] maple_tree: Add mt_free_one() and mt_attr() helpers
Date:   Mon, 25 Sep 2023 11:56:09 +0800
Message-Id: <20230925035617.84767-2-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
References: <20230925035617.84767-1-zhangpeng.00@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two helpers:
1. mt_free_one(), used to free a maple node.
2. mt_attr(), used to obtain the attributes of maple tree.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 lib/maple_tree.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index b0229271c24e..3fe5652a8c6c 100644
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

