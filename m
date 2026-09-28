Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51E3815E3
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598385; cv=none; b=Dr/s+ctBsJa2IeWnaRmiHJNHlH1nBsn2vAnYtCexrNmBO4h1WH/an7hBmN/Ynlkpbxik4STeZZY8fFXWlY3AXuZQUrgX4Pz612cBCis1Gml1VdHNiPaHg1IgiR+aZR4J/KqZ3IKtrkJt+N9DjYUzo9Z9wuIK7g/NQcdERzcwf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598385; c=relaxed/simple;
	bh=ljRvTa1FKA++fXKqZkWKN8lwihjtnE8tip6RujlYs5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=St7Wx2bH1D8qXtmAM0RIGr49dr+CmHIGGM+fsBdCMovtQNTeOEdPgxOHEvMW7tC2uNrGMea9Tn1VoyCQdtMTRFRd+Uo7d8Kirw45pP5zHQI0fXAc/m/CNmg7lSJizCmkQW7n25EP0H9fMMIIYZ5YficGONfN7dZ2Ec0yyqOxVW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmoSSesC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmoSSesC"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso18269095ad.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598383; x=1791203183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=YmoSSesCMYZUOy5SLMPEbg4dlhpMUeoWMwanjWzLXri7Y27xAgSN4ZV35BV8GnuAKo
         zulw6BBsm2r/s6ROttoUKc6fIGkNLwaiQ8WMeXYqyBnlf6JH8R2XG60M5adfIno8L4qq
         ZzGk8bARotS6o0we3CMZwh2Mu3c4tK7KcLE9JK8PYTztSMfP7ziN3HUtSzMqQgpozLTt
         fpaGwTGI9QM1KSx+ZK1jQMv26hcmJK8NqcZwlYamsvni+PcjhLtMSBTum2qR4X6/gT6D
         q/saV+Ie03Gaowz1gK47GG55w/9+vxudKkbm4ZAhvOrZrBqobH3YKqxU85Ba7IqXcN/W
         3cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598384; x=1791203184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=i607/b9704mVvps/3DGrZE1xHVlE8pZ+thwg6+b/uihdBERBQcysRahgic6CR0ocvp
         0ckOr7rmWQUYMeKP6LiLD3v5OLzG3IvPhH2LTA1n6I/DjbGR35qliKoF9fpM/P0P4qm8
         JbXhVa9yCQ5MxLS0szPp9bSChlKnToTzg3NnF/fuzocvoIwFazmTiTwVvpKr3eNwBIAs
         fNHjD0CxyN6stm43/VvgtzHa1mlerVV4AdnL1hyv8MFrbw/Xj/Kih45bSaaKD30XqbXi
         Mq0Hs2fEHVNarfAi3PgWn57wcw/9/E8fJqevGC1wJGjigPrWx1dnjtdCcO+1trU5e/+P
         qfiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhHiy4xhEvuVFgR37JHrFr4rWivT10t9HOzfRegKBSY6oPK+/5srG1HTpKG9JLlMbsFzrstZ9FSug=@vger.kernel.org
X-Gm-Message-State: AFq9FYKntZz3vvhKd1i9kbHBigRu0KGCDFXsHZtiCjec6fmZlyOaM0gM
	XT8qDyUfgZPKtJmerQCRM3p9WRgFRTdgCjd23WWZj6wX9JI2RLbKkUlR+FI/m6PV
X-Gm-Gg: AYBFou2pWaVVJz/uKLM/7tKvxaY9dxrjwdJwWU5nypQ6RvKXr9imb8WLdVDR2muLFnd
	6YQ/FKRHeIu0APyupADTimY9LnpJ0zxoiGUNt4ZqtgAj+p6A8wMi4fypFhPI8KAwtWl9mBJTSfh
	wBg6EUf2JbrwSE0/Hr71BSjuF9ZkQe+kx95X1Z4fI8qpSERoJXeDEt4264fhuIrQn0hvtFuibLh
	G0Rd7/5LidnWgj7sYoX6qg7cUYdfDcI3x71q3C/PCbGrCSB1im1JKc4k91uOcOuDcsWSKgEwoaz
	UpuRtLwuLjhfmRerVpZiyam0q5XE2ZCkBQmG9sAdvKtomdo0YEGkpElwtfIi1R5wBzkxetVeeMs
	ctDq8dBmsLsKmp9i4o1EfH50tIs/8FYY0koJd6HGY18y5TkOWiCDT4RCmErjvAdXYkNWm53pH6n
	bMwj+d+wDaHEl1wBnvJsCU005LTpuGX6amOuZpLctpcRdGsdnCi+i0fxvMtwFYhbU3+W+lLSl9d
	N9wJ3fZv5ZxICR43VsAWR1fmZimXdUE72bziVSR2pGeVm1YmeHkD8+bQ1P0GlJUql4LujqdeByo
	BVhDWEcYwm6xkx2I1zrN
X-Received: by 2002:a17:903:b85:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2df7da4bf1fmr101833885ad.0.1790598383395;
        Mon, 28 Sep 2026 05:26:23 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2006-1fb9-8409-0195-705e-5b47.dynamic-ip6.hinet.net. [2001:b011:2006:1fb9:8409:195:705e:5b47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc951sm40485615ad.8.2026.09.28.05.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:26:22 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rbtree_test: use rb_add() and rb_add_cached() for the basic tests
Date: Mon, 28 Sep 2026 20:26:09 +0800
Message-Id: <20260928122611.336351-2-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928122611.336351-1-s921975628@gmail.com>
References: <20260928122611.336351-1-s921975628@gmail.com>
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

