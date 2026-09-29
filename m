Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138653FD44
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695502; cv=none; b=bQgP2DzJFqqDpg+WuMV2UR9hngHiytiVPSyWLZddKczI82ocBoXp2gcXuwLLrgf4fEeqv69h85fAiCHxN4zWOapo9hsn6XdwTKtd0mRQleE7s0Lc3mXHV3rMEKf2A3PNx5CneCNmXFo76Qny0S/SsYZ1/riGcF5k72yxwAN27eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695502; c=relaxed/simple;
	bh=ljRvTa1FKA++fXKqZkWKN8lwihjtnE8tip6RujlYs5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S9yiQph5iHO2pn9kpelhVQTYwsMAB3ziFZ6Hngd//GHSYGIWy77xzAsmQMbeVvF26HrTacpD7cXOwtIvbcJSu2FQ8BnbB5iOR/t1uQ+3rHJmzV3wXFavjQjaFNG+25ZEEy/F3MGzPcQoRZdAGnFJUXqel4tOOThZieY0Y56O+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWBdaA3e; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWBdaA3e"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so31617485ad.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695490; x=1791300290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=FWBdaA3egrMft8kpUEphfyrKPxWf6GoTUZp6iTGqRaMbh5E31wMk2NloOo1Z0omw7Z
         t45n7eKwLosFe3dc953EXsx3iVqpjkKJvyjPIP22uSx9j5K4K22xfZ1zwiHM3HS1V7n8
         FRTwzTufhgHfiqLg3UojiM0J9MyFKzd4P8fOsZ+8zt3P1kXkxtBnEQEn8bs6yf6xySgL
         5+tYFkN8x8FDaoqNEaD8BHTlA2YSlG17kLDmpbgExCCgkBmIbPfZyfwn2bDUUgxjy2Ot
         JfXBxcDlt+uhiEgMFSAXXJe2zGnlAlqG+vipDayHt3wduVkqleG7Y57TPwdtQBdRfv4v
         aaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695490; x=1791300290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=NrktzDPqvz2DEJHNKwDeoe/FWP0UkM+ZD88IxjTUKbIZtWpPPtac+Vah/SMqcBkFPd
         ARvM9JM0L0+jd6wi0p+KdHKVaHm8GKe7Bku+uqZOOhNnIRtiGa3AAkKn7yPSuXzV7egh
         s2kiS4A9VlHHecOwZ5D6OpLui4jNienA+HkRVnvvk+hsLN6XFB4LrdshTze7y3w2OiQG
         6NYo9hyo+PaV3tEwCtCTV61LMcQtN7T8JHeQeSbdV+EMysiVlYh0B31DN64f2LvYMBhf
         BJXdafxcVB38O85n/Rfv7qh/mKK+xENoDQVk8RAWiaycdlfqM5VRtG1TUFcSvU9KrHdn
         xlwQ==
X-Forwarded-Encrypted: i=1; AKwUvByH4sv+vNJQ5AFse8njTQDBwJt8H1q1XKmrSMR1ZQZhmhG7qWp++nW6LNOom/kWAD0Keo1G0t2k3Rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjXQrchtqK3wHB2ldS+59xXSmQ2ivQKYN3EkyMVe54rP+pYw0B
	OulNgAlN0gq2M1oydziOUIytdxudz/pFkGSNjikxLYs4MGoBIOncNEkM
X-Gm-Gg: AYBFou24XnfmhUrTg08glW0/+Tig5JudQFPw+WHFhtDp7iGRIFmblZLGsIt50nk406+
	OLl5RYHBGbLZBI0AeA8Lk7YSpXa0T0bc3RVbEA3GNNIbzodxCgDWfIVKINr7s9KtyBNQsXowLCc
	0OjbNrxkIZt06Dg0FME+lnBhIHPNXWsbjtO5MRyZFhV7SDTpxK2VEuijS6C6h7k4ctXTj77KGnU
	gEuDaxS4TzzmuN/YCsyUwVXnpOa8LDcjwRVqwHuwWoQzXR4cKNBQA5rMflydYQG0VQ7ClCtB+u3
	mPH6nxJ+0zNquOWZLjJyRf7Uo7LrtLLPdlYjm6VQf6G6/Prk8y1pY2O3Q5jM8wVK/RInd6u6/Tp
	iYY3UAbiAXWv2JT+qHvUH/M5Sn9lApwJDWwFwfQ3I6oTmPifx1kVs6eWAc1QNwMuZBjs3tDJuoF
	V0asx8MXbhzyAGiL2mFcVqGan3HjsD6xd/571xM0k8qytA+k2EdCeSln+/et9uMbTwmh6Ki2nz5
	DvLxBXTJZO71GFhYCVBG547yMN5QOTE1cKmboRGsdjWJjEJLdgqwGbG/y4wavQ6++YfKyum6QZG
	w+rVx4mr5vMIwo2kbLhY
X-Received: by 2002:a17:902:ffcf:b0:2df:b55a:5039 with SMTP id d9443c01a7336-2dfb55a53fdmr69446205ad.41.1790695489583;
        Tue, 29 Sep 2026 08:24:49 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2005-5b75-0412-f652-3152-53f1.dynamic-ip6.hinet.net. [2001:b011:2005:5b75:412:f652:3152:53f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm59762255ad.83.2026.09.29.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:24:48 -0700 (PDT)
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
Subject: [PATCH v2 1/4] rbtree_test: use rb_add() and rb_add_cached() for the basic tests
Date: Tue, 29 Sep 2026 23:24:36 +0800
Message-Id: <20260929152439.91443-2-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929152439.91443-1-s921975628@gmail.com>
References: <20260929152439.91443-1-s921975628@gmail.com>
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

