Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4643448B9C
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192798; cv=none; b=uj1A8EXGiNzEewrVyMM7m91faLJnWHT1PoMxfULD/LMPiR+lA0DZcW0V9qHyxLJXKkaU2UfKux72sugAq629laPPpI0WfJdyiSL3KVKrIsl7ZqnsVL/uaJbqbFiIIXYgSWqbgOENaeucage1kAyZfc7fXDyCarxw5ezKLq7i+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192798; c=relaxed/simple;
	bh=ljRvTa1FKA++fXKqZkWKN8lwihjtnE8tip6RujlYs5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m9g3uiXUw9ONlwgwlckSzw/qMSEqWBDFFtlVC4gjgKHbz17Nmg9eQLiSGUq8H71AEI4TojMEwYubteHgs9edaw15vp7/Pb4xsMuja1Xa+Tok3u6rVZHm8qw73jCP0U4+qLWlIDmTJrV+t+6o98t/gIKoRqT+lE+OAHilurbNI/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+ANPpma; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+ANPpma"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso719375a12.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791192787; x=1791797587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=R+ANPpmasXczR4MLk/lqBpKV/9YLFrMBYhR/ZGE8e/r7kklNI5m36HYDzSkuC1xXUl
         jAMN22A0/t0hWR8He90N9ZA0tdthKTsMEyl/J/Oq2FftLCKQrwmZ0BZ/zYEm/p9r56C2
         T9BWHqW4VyIefG2pfhczQW0+80pvs4hUYTPp2tlw4iivy4rQSNvLon3juhR2P3k8jO0V
         2/ZEE3rTu0o/+agykz7YWbenf5o21z0tL55gsOZPrHF60Xx+sHA2X+cEwPnD5S1v3yoR
         bjhljdA58/3/cbBPJXTcEzePjCwOL4AmpGEzKQTZ3mAct6GISnKHri6W7qWvwcsL+ecO
         bVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192787; x=1791797587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=V24h1DgfsE4ytZ4Iy9Gp/+gBfTa5FIbenbC0IwjVUGuCPAOz+Ecv8u39gAY+lO4tqs
         V8b2SiTALXKYvOC9utavWAuaoVjdLPN1wcKLTYRAgNADu5w1lCDe6bnVSPG2n3Ygcsvh
         vk3naTfZ+wtBCMghP4m0qv1gu5213zym34qmTaVHKkiLN0e5ZnFxEBtsczcE8Bt1HWgD
         CN6u5RpUfJUeZ7xXpcRtSwroGDfjz9PlO1xjy9Q90E8w29kK0b80B66FVWm3kKK0N59r
         VXJzpn0dlWMyaMDeO9tbI45XibIyw05S2jw1azwQYkX5pFhuYVvjkGhfjI1XZ7wp2GLP
         9WZw==
X-Forwarded-Encrypted: i=1; AKwUvBwbdmaPQc3jYqkDIkR5APC9emds8UcN5pRSXxPe7KBVLdV4e7xSXKo4jXA8AxD63PKXf2hattpoYzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Vi57LieVotOwwBQjYq9vfdR3tKZzrn7t4swCvnrutqheTovo
	YlbAJ05U1RALoOMonOWwQzrg6fEwDTKiCxm4rU6qv7BGyX/bVCFLIeYf
X-Gm-Gg: AYBFou1jlN/AJ9+R7pqrPYiTvyrB9+MI/FPe04Y2aFCL5yW2XFzHY3WG7sIrm6Ltl2Z
	UW4hbXLg8WN5F1Is+8byLJZ+lL+6FKdVZ++W7Uq7+LnF6aQN196LEMu4d5s2ZZHVcpHyVSgk2D5
	2eHVqrYC3sn7nxjys1yiGvtoYyjhVsrWjjTT6xaMRiIHHjFEUppD4mjAioZlrIhd5m/NRh+O16C
	gNU59/snEO5DrEbjtQ+0g2ADh8xGNGaxfY3W55GbyaMcgtBOhCPJKvKCJliQicfwm7AOO+tkfR6
	8gKw8ljuwF56hIqLygcYReAUOi/ZXDvjZc9Sh7t7FRZNbbOVyHvM+W30mR3296vFju5REOpHMS7
	c7sl1ui9FM4+J4j5CiniMl2RC8Z1pYIfq0BOxVlKSW8rTQGPTl9mSpwW8KxAG9kOO6CSu/0KZca
	Juh7fQQgzpny0oRubzaVGN4kyYnSoUbajSIQDxCtiWuDgnOgkmxG5DWE9KJ0r87U+qar/xkJpdl
	GhPjWSncnnJqY8FSBQ=
X-Received: by 2002:a17:90b:1c12:b0:3a4:9f7f:8cc1 with SMTP id 98e67ed59e1d1-3a6ce75d149mr9261079a91.24.1791192787284;
        Mon, 05 Oct 2026 02:33:07 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7ad87874esm4527886a91.0.2026.10.05.02.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:33:06 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jon Maloy <jmaloy@redhat.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] rbtree_test: use rb_add() and rb_add_cached() for the basic tests
Date: Mon,  5 Oct 2026 17:32:33 +0800
Message-Id: <20261005093236.62702-2-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093236.62702-1-s921975628@gmail.com>
References: <20261005093236.62702-1-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

insert() and insert_cached() open-code exactly what the generic
rb_add() and rb_add_cached() helpers do.  Use the helpers instead.

Besides removing duplicated code, this makes rbtree_test cover the
helpers themselves, which is what most in-tree rbtree users call
nowadays.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 lib/rbtree_test.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index 768c5e6453f37..c1386d328cfb1 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -30,41 +30,20 @@ static struct test_node *nodes = NULL;
 
 static struct rnd_state rnd;
 
-static void insert(struct test_node *node, struct rb_root_cached *root)
+static inline bool less(struct rb_node *a, const struct rb_node *b)
 {
-	struct rb_node **new = &root->rb_root.rb_node, *parent = NULL;
-	u32 key = node->key;
-
-	while (*new) {
-		parent = *new;
-		if (key < rb_entry(parent, struct test_node, rb)->key)
-			new = &parent->rb_left;
-		else
-			new = &parent->rb_right;
-	}
+	return rb_entry(a, struct test_node, rb)->key <
+	       rb_entry(b, struct test_node, rb)->key;
+}
 
-	rb_link_node(&node->rb, parent, new);
-	rb_insert_color(&node->rb, &root->rb_root);
+static void insert(struct test_node *node, struct rb_root_cached *root)
+{
+	rb_add(&node->rb, &root->rb_root, less);
 }
 
 static void insert_cached(struct test_node *node, struct rb_root_cached *root)
 {
-	struct rb_node **new = &root->rb_root.rb_node, *parent = NULL;
-	u32 key = node->key;
-	bool leftmost = true;
-
-	while (*new) {
-		parent = *new;
-		if (key < rb_entry(parent, struct test_node, rb)->key)
-			new = &parent->rb_left;
-		else {
-			new = &parent->rb_right;
-			leftmost = false;
-		}
-	}
-
-	rb_link_node(&node->rb, parent, new);
-	rb_insert_color_cached(&node->rb, root, leftmost);
+	rb_add_cached(&node->rb, root, less);
 }
 
 static inline void erase(struct test_node *node, struct rb_root_cached *root)
-- 
2.34.1

