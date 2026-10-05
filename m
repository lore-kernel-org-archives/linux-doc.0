Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAECF44AB8E
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192808; cv=none; b=Q03Z0KW2p6xl5pti7mzHrqYPHugPqNRNdsDD5fSeoemcu4xjJUp+/j4z6eqYzyjo6NYIuk+m7fBNXl0LhWlv56f5rcNPjbneivt7iObxw/OZOM1aZ3gCSQq/RPsbWnrVZ21ISIAEAtVjjvIEhU/GN9PNSr6Z9qyS/YAIjYodeWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192808; c=relaxed/simple;
	bh=hnlvuHD3j1q486IVHIYtN1bRC0lpkXiJgGPgZ1hVZEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B63R70wb7uBxWpJ0eyLDVf7Xa+JxrVxLo4TlW1EMlwRNWwDbpcsXbQDCi8mdyXko1UZ0KvIpnqhlrvu5vdYPhmDndE4ZxFf70mk8Qqkah7j1I8o6ku/Tz7sYhrVvn7Tvy3ffSF5iijX3UCwtsTg7tD3f4MF+l010KF9rWtxDApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jsegyl0n; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jsegyl0n"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so1011367a12.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791192796; x=1791797596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLs2jkfQwtux7eVPJSnRw/UcV+abPABRykBiEqrbtIY=;
        b=Jsegyl0nRyB4Fu3iLqx13ZYo5DAJcQ44UKTGb2U7D1omhUZMnMQ+EzLdqIV6CcFXYu
         SBVV31UamlLJ6/Vcyck4Xx0+7rYouq98KVk8mQ2arung0ltqyuN7ZvM7S1wfDvOKxAsp
         R6dNzuWyzwcAzbR4MYQ7qXKy22sBWgwF+529fxQkAE71hf5fSjuIIxXSI1Yq4yAx6X0x
         2pnpWpKsYkOxJPctI+k4gvAJqSzKxOvxxHwmywbIAixq6yofDrI8hpvaegyYlGAUsblU
         XpzDZiIpnrrphn75lDX1+H0+CIbZND+TU/zcb80a+MWIcv4XOUdYAkh7RgXC3Agx1bNK
         QaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192796; x=1791797596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLs2jkfQwtux7eVPJSnRw/UcV+abPABRykBiEqrbtIY=;
        b=donSwjrXWJ+VEPM258GjDfN9md0f8Lz7lywi/ykmbCbFiTLgPG+Df8bFKJsY0aeLLL
         eg7EYSDVYuybR0QNGxIQzRzzOlSqD9SB0tHMq6Ofk2hfQK2zf/SWnUe6h/u5dCrLOR01
         IyUuBMBlxoEz3SHN16yPUSho+xbdr1E78xE+G6YaZYM5Smd5lIdRcfw3excu54EtkeyG
         OUF35LmgCHgG4R3LupglQMW31yQYFnm1r0oMuBm424bVi6X0yDm5cDeIosUd8W+vwWOA
         uqiO6z1gQPh5SRgEeqyqo0fmDASStnFVZ8ZekIll8D3slElJ2TzHKZC1dZoBF5WHIqyX
         nEeQ==
X-Forwarded-Encrypted: i=1; AKwUvByexE2x8PbCot7D4zUatR4aCUFaWGqLyG+dvEL7pumwAPF3i15dD4FX9fztzPST5xGOTmqni3tM/ZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXIcoP2AgWznowIubNUNnN8PCXXojWHGZrgYno/kP7rFGrmP0V
	/y+83nO+8Bt7Obfu4+SU0xaKqU1DL1FsUzCG/2vSo8hhD/xuc1JHB72xAfQOC/mZRn8=
X-Gm-Gg: AYBFou20ktRXWxVVnSSI+3DAjPzqvwPJ4U9e8laxNWYnPKgs3km6+QsaVqJf5Bw5l8q
	H7km05Lq5E2ygFOsOuXulYXV5cLEErw5GO6z++A9KHxWCGfCl8xobcTS/BpNGST6OLTXPF12lGh
	zQNTA0mczKw1F7j8iichOQ93OL69ukUna9f4IWNngbSUcU+T20kid12G4XQl3HdLLQrOtLeLzwJ
	eS05GTm8yED4irE0KHoFGLUA+J9kdNJ5N5xRlhleafJcV32cnmAif23vGDDyouPMFjct2gxl750
	dLTRv+ATP146tu8fXR6wCf3td5FvDP8Brop593ZBWRk+eG7PW3CDjL2pvSP90F4iCxMpV3BHqol
	jLvpioUCHBCvn3zyVeVi2Gef9o2f39CbVXGx0zqRh4mAMF8K+Ck0UCmo/J3Uy9iOnUOD3uV1A3F
	q0Su3z4XdgsWEG+i6+u76QYYA/LzFAAuZCX9wap8Yr3PlQSIfD8hH1Qg8rpAwxXcGjiynKZ8KKT
	wElobm0WlCPXAnKCWk=
X-Received: by 2002:a17:90b:164c:b0:3a8:e1e:3396 with SMTP id 98e67ed59e1d1-3a80e1e3a3cmr1498545a91.56.1791192795729;
        Mon, 05 Oct 2026 02:33:15 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7ad87874esm4527886a91.0.2026.10.05.02.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:33:15 -0700 (PDT)
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
Subject: [PATCH v3 3/4] rbtree: update augmented data on the way down in rb_add_augmented_cached()
Date: Mon,  5 Oct 2026 17:32:35 +0800
Message-Id: <20261005093236.62702-4-s921975628@gmail.com>
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

rb_add_augmented_cached() links the new node and then calls
->propagate() from the parent up to the root to bring the augmented
data of the ancestors up to date.  It marks that as "suboptimal": every
augmented user that open-codes its insertion (interval trees, vmalloc,
drm_mm, gpu buddy, ...) instead folds the new node's value into each
ancestor while walking down, which touches no sibling and needs no
second pass.  ->propagate() has to read both children of every
ancestor until it finds one whose value did not change.

Add a ->merge() callback to struct rb_augment_callbacks that folds the
augmented data of a node being inserted into one of its future
ancestors, and use it on the descent.  RB_DECLARE_CALLBACKS() derives
it from the RB_AUG() list, so every user of the template gets it for
free, and sched/eevdf, the only caller of the helper, needs no change.

The new node's augmented data must describe the node alone before the
call.  That was already required, since ->propagate() read it, and
sched/eevdf sets it up that way.

Measured with rbtree_test's cached augmented test switched to
rb_add_augmented_cached() (next patch), nnodes cached insert+delete,
median of 5 runs, for reference also the open-coded descent used by
augmented test 1.  Raspberry Pi 4 Model B (Cortex-A72, 1.8 GHz), arch
timer ticks (54 MHz):

    nnodes    open-coded      before       after
       100           459         500         442  (-11.6%)
     10000        182046      186144      180208   (-3.2%)
    100000       5533679     5711647     5579444   (-2.3%)

x86-64 KVM guest (Intel i7-13800H), cycles:

    nnodes    open-coded      before       after
       100          7657        7622        7059   (-7.4%)
     10000       4738075     5075847     4627462   (-8.8%)
    100000      75618429    79840335    71324700  (-10.7%)

The other rbtree_test numbers are unchanged and the augmented invariant
checks still pass on both.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 Documentation/core-api/rbtree.rst | 27 ++++++++++++++++++++++++---
 include/linux/rbtree_augmented.h  | 27 +++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/rbtree.rst b/Documentation/core-api/rbtree.rst
index cce80e19087b4..210045f128d65 100644
--- a/Documentation/core-api/rbtree.rst
+++ b/Documentation/core-api/rbtree.rst
@@ -257,8 +257,14 @@ When erasing a node, the user must call rb_erase_augmented() instead of
 rb_erase(). rb_erase_augmented() calls back into user provided functions
 to update the augmented information on affected subtrees.
 
-In both cases, the callbacks are provided through struct rb_augment_callbacks.
-3 callbacks must be defined:
+Alternatively, rb_add_augmented_cached() performs the whole insertion into
+a cached tree: it walks down to the insertion point, merges the new node's
+augmented information into every node on that path, links the node and
+rebalances.  The new node's augmented information must already describe
+the node alone when it is called.
+
+In all cases, the callbacks are provided through struct rb_augment_callbacks.
+3 callbacks must be defined, plus a fourth one for rb_add_augmented_cached():
 
 - A propagation callback, which updates the augmented value for a given
   node and its ancestors, up to a given stop point (or NULL to update
@@ -271,6 +277,10 @@ In both cases, the callbacks are provided through struct rb_augment_callbacks.
   subtree to a newly assigned subtree root AND recomputes the augmented
   information for the former subtree root.
 
+- A merge callback, which folds the augmented value of a node being inserted
+  into the augmented value of one of its future ancestors.  It is only used
+  by rb_add_augmented_cached().
+
 The compiled code for rb_erase_augmented() may inline the propagation and
 copy callbacks, which results in a large function, so each augmented rbtree
 user should have a single rb_erase_augmented() call site in order to limit
@@ -395,8 +405,19 @@ Insertion/removal are defined using the following augmented callbacks::
 	old->__subtree_last = compute_subtree_last(old);
   }
 
+  static void augment_merge(struct rb_node *rb, struct rb_node *rb_new)
+  {
+	struct interval_tree_node *node =
+		rb_entry(rb, struct interval_tree_node, rb);
+	struct interval_tree_node *new =
+		rb_entry(rb_new, struct interval_tree_node, rb);
+
+	if (node->__subtree_last < new->__subtree_last)
+		node->__subtree_last = new->__subtree_last;
+  }
+
   static const struct rb_augment_callbacks augment_callbacks = {
-	augment_propagate, augment_copy, augment_rotate
+	augment_propagate, augment_copy, augment_rotate, augment_merge
   };
 
   void interval_tree_insert(struct interval_tree_node *node,
diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmented.h
index fbfa675dce5fb..9ac0f216cc301 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -30,6 +30,7 @@ struct rb_augment_callbacks {
 	void (*propagate)(struct rb_node *node, struct rb_node *stop);
 	void (*copy)(struct rb_node *old, struct rb_node *new);
 	void (*rotate)(struct rb_node *old, struct rb_node *new);
+	void (*merge)(struct rb_node *node, struct rb_node *new);
 };
 
 extern void __rb_insert_augmented(struct rb_node *node, struct rb_root *root,
@@ -62,6 +63,12 @@ rb_insert_augmented_cached(struct rb_node *node,
 	rb_insert_augmented(node, &root->rb_root, augment);
 }
 
+/*
+ * Insert @node into the leftmost cached augmented tree @tree.
+ *
+ * The augmented data of @node must already describe @node alone; it is
+ * merged into every ancestor on the way down through augment->merge().
+ */
 static __always_inline struct rb_node *
 rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 			bool (*less)(struct rb_node *, const struct rb_node *),
@@ -73,6 +80,7 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 
 	while (*link) {
 		parent = *link;
+		augment->merge(parent, node);
 		if (less(node, parent)) {
 			link = &parent->rb_left;
 		} else {
@@ -82,7 +90,6 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 	}
 
 	rb_link_node(node, parent, link);
-	augment->propagate(parent, NULL); /* suboptimal */
 	rb_insert_augmented_cached(node, tree, leftmost, augment);
 
 	return leftmost ? node : NULL;
@@ -170,6 +177,14 @@ RBNAME ## _compute_ ## n(RBSTRUCT *s, bool exit)			\
 #define RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
 	_RB_COMPUTE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
 
+/* fold @new, about to become a descendant of @node, into @node */
+#define __RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, val, aug, fold)	\
+	node->aug = fold(node->aug, new->aug);
+#define _RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, args)			\
+	__RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, args)
+#define RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, x)			\
+	_RB_MERGE(n, RBNAME, RBSTRUCT, RBFIELD, RB_UNPACK x)
+
 /*
  * Template for declaring augmented rbtree callbacks (generic multi fields)
  *
@@ -219,10 +234,18 @@ RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 	RBNAME ## __copy(old, new);					\
 	RBNAME ## __compute(old, false);				\
 }									\
+static inline void							\
+RBNAME ## _merge(struct rb_node *rb, struct rb_node *rb_new)		\
+{									\
+	RBSTRUCT *node = rb_entry(rb, RBSTRUCT, RBFIELD);		\
+	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
+	RB_FOR_EACH(RB_MERGE, RBNAME, RBSTRUCT, RBFIELD, RBAUG);	\
+}									\
 RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
 	.propagate = RBNAME ## _propagate,				\
 	.copy = RBNAME ## _copy,					\
-	.rotate = RBNAME ## _rotate					\
+	.rotate = RBNAME ## _rotate,					\
+	.merge = RBNAME ## _merge					\
 };
 
 /*
-- 
2.34.1

