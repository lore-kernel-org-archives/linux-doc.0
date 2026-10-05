Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282343CE7C
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192814; cv=none; b=B6fAdy6Bb6rMBirPPZdzU2pFn31Np207zKzVskYpnp1L/PWEKQCOTdRgXPIWOT7czi/hsuSgAI9rVdTS9OpMPFwOLiCvNWOzkRXS92MM8UDp+HnCmkEKTtRJUCuUwNmuhsgzjffNSyKBDPR99npJY+ihVowXSXB88iBSo4pgEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192814; c=relaxed/simple;
	bh=+cEEr6znaNoigBam8Uz4P3hHrN1WO+xiS9Xy1l2461g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQIdCovKAUjB0kmdkaKnvypUDjuw8cPHHCKH/9BOr5htOb2dDAFAUUeKzFm3KoPpHCr+6zUYxKH5J6gey44FQ+iGR5pFeVwcB03g2ioOugOl8QdSgywelFsdXyxi0knm27jaTP0NyRu+k3PjJ3SL2pJ04wJeV9eNZWpqAuJXg7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/p46LFe; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/p46LFe"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so576003a91.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791192802; x=1791797602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=V/p46LFeBCwpmiN9Rb3ln/6vl8QHBNSP8j3kitbf6DWqNCrFssMdZiN8uwnL2m6nNB
         P67vW6mW4ySpUn1SmjeAYxAu4SFQTw/KtVGNIwdZz5tsbzKbHMAm4sJc4koy7E9VI0kH
         AZ4Tvg7xQYKy/xncjZN3IamoT5fsrwmJqgcFjsb5pOU7UYpXYllCTQfThEccJ2syjQaj
         Q2K0LMdJgAJrTapH+5Vfl7uZiwBGSkJxo6oQGdMbaySSQKE30bcQp8dcfQTNSTABd7B4
         x9KTlnoYPsHs9BY2OMTcEo6Mrlouy3JWgLLqKSP85nX5MO8JOZPeuA9JnNXgjdhcRkuT
         NhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192802; x=1791797602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=rp5HOUgqhAob5+u11beBIiObH+fhsDSNwjqXlFVCHLVH6BXJ3ucmEvEYEIZTLeZtfc
         VmdSAvA6pvZ9ixHvfGwEj60/zjBgPTI8vB4GSGxVpjGfn1TqJ/OHoH7ilK77+g2JMOSU
         GYhYsEQBXXz4LIB9iejL3Sr7tdmQwwpk6wfOJ7+ocjrekQgIuBN2h8DSgEQ4FiduTgBW
         EQdZy/xpMLUEDHI15Opq7mTITVeaEYh+6gkboQEhhQ4+gdP3VlVhZWKpoPW8L2iEqlpl
         SAip9rZMsGt6BXtIfxqAYDUBNsHKNHMfiFM4NegJE7DBWla8fYv4Sm80laD1/opM/P/T
         enLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzciUvv+Zz/nKoXADgQ/LkZLmJzi81nw5B1C60TJrOobdBjLqEJgIAnmiwa/GjumTxAU/TCeTS6qRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFOVdz36iYpF+jGGSjYufea/mIELpFtoyDnW/n71eAM1TCkU1R
	TWFasAa3FcantvkHis1fnd7xjX2EdgQxaOISJDPsQUYSWFn5p8YAP9C5
X-Gm-Gg: AYBFou0U/3dJJLrD3Dg6S73VcUbMgz7tGU4mJGk0YRVg3vPhHlD3v3et5AOaVcJa/Yf
	bCznthY0lmc3UL6AWUf8R2aWXwRp18XAqlh5YZrlmVPb7aqtHVwDZHeROAPHt8xfh3xkPnW5Vhm
	ORMwZGF/A1zFoyk+RuJ2Zfag4W+bY9ol8G3f0FPI1M5E7xtB8FsjCXhYLr6J1QEX3zg/u2RxH4T
	5wLmHj1C1uNMxWrEcAJWmLQeB5ocEaI4k/XaPdavrLjrXLAskmhafty3I14hIBPXfz3HLfrfOvv
	s6JE7XHkxDCPsWFOPTyXWkIpKNP/2qoho9sQWShSZfSBTGDWImJDoQewGV73ZRtVSrGttiaoP8w
	Fw3EZi5mi9rJjtGP71WRsd7Xr7Kbu/Jb5NNflR9nzqHEtNgpSTzWi0qCrUZnN1LXaHR2XUz1HuE
	nTyWlgYm9IXKnf+hebFBOX3lFAOQt5NHWK7RsFuO4Tu5hmD/gPaemY+05XQ1YlLMeWn8hk0nVGC
	P5PIikNltgigZla4fw=
X-Received: by 2002:a17:90b:3c05:b0:3a4:a525:56fe with SMTP id 98e67ed59e1d1-3a7138bb9e0mr2976843a91.5.1791192801892;
        Mon, 05 Oct 2026 02:33:21 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7ad87874esm4527886a91.0.2026.10.05.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:33:21 -0700 (PDT)
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
Subject: [PATCH v3 4/4] rbtree_test: use rb_add_augmented_cached() for the cached augmented test
Date: Mon,  5 Oct 2026 17:32:36 +0800
Message-Id: <20261005093236.62702-5-s921975628@gmail.com>
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

insert_augmented_cached() open-codes the descent that the generic
rb_add_augmented_cached() helper provides.  Use the helper instead,
so that rbtree_test covers it: it is what sched/eevdf relies on and
nothing in lib/ exercises it today.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 lib/rbtree_test.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index c1386d328cfb1..00f62e4f9d10e 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -89,29 +89,8 @@ static void insert_augmented(struct test_node *node,
 static void insert_augmented_cached(struct test_node *node,
 				    struct rb_root_cached *root)
 {
-	struct rb_node **new = &root->rb_root.rb_node, *rb_parent = NULL;
-	u32 key = node->key;
-	u32 val = node->val;
-	struct test_node *parent;
-	bool leftmost = true;
-
-	while (*new) {
-		rb_parent = *new;
-		parent = rb_entry(rb_parent, struct test_node, rb);
-		if (parent->augmented < val)
-			parent->augmented = val;
-		if (key < parent->key)
-			new = &parent->rb.rb_left;
-		else {
-			new = &parent->rb.rb_right;
-			leftmost = false;
-		}
-	}
-
-	node->augmented = val;
-	rb_link_node(&node->rb, rb_parent, new);
-	rb_insert_augmented_cached(&node->rb, root,
-				   leftmost, &augment_callbacks);
+	node->augmented = node->val;
+	rb_add_augmented_cached(&node->rb, root, less, &augment_callbacks);
 }
 
 
-- 
2.34.1

