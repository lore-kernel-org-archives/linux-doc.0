Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642323BB102
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598392; cv=none; b=uKQx180jzQLAQbIxyVZF7LZPrCl7IkQg/U4JBQ1nmVFoYMUTnWwrS9rvST3c7+6n8LVwxZJx6TJJEr/jGqYCGbRbyJS9dBf3ckSzblcLNYP8t57emhmtfOvff/gHIGMYJiFsTmlh7W0tRXXF0J/0KFRU3GLytG9faGBa7I8nWyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598392; c=relaxed/simple;
	bh=+cEEr6znaNoigBam8Uz4P3hHrN1WO+xiS9Xy1l2461g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U5zfUX2BOYruFLUkSYJovNShumR+vipAWf7vIZs/13pqcK0JJ36Rn9tbg/OihRN2cim/V2j7AfiNfdpCGtVpP3jFDf575NQwUrMY/5aG9UhiGLzPc09B83Wp4Z8BUFCCvgBxXyCsTsOsa1ITYyUI+bNoCB2J4yuwXGxeXoiTHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpUDjpwr; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpUDjpwr"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df964b6893so12792055ad.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598391; x=1791203191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=EpUDjpwrbnrXfScg4GM19rAP17AQwc9ImvXkvUjjruy53jxYDqs4rhEkoT2Zvz0E2T
         uM/6ity4HUOJNibTGtSkpx4yCqFdqDZ7vHZXMagU4yufL14mRy0E51yysztWYX/wfJKN
         npL1K773CZkYossaKD5APgTt2Uz/RZ/AczXSxh9fA7fI/6so5fo7pvmiuq8dl/S4Y6Xd
         3biFi5eT2QpHqlVrs+owxk/J1O2OSh7svaWf9lkb4tOfJqRZ9TH6c47AJxF7/AUGA1RT
         lPgewiXdvDWlnyHVRCHZODW2MqYS1qinmdPOY9f/CLz6Ps07GESuMprQYikkPuLj0Pnh
         ndOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598391; x=1791203191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=NeFtC0rzXTPg7GaUANuXbI4jExnNKjATm/8OdVnzUYd7GlEgKxFpiGFHcKcwBvgczv
         tT0W/m+6Uo+ojVYXS8oREC553poLa4F5JVXTuITFpB5SidV9TWT9wvxfRZrh1Qz8FRGk
         xXgGDk1+1w6axqs+ERsjrgK+q8GF6/QSniF79q/fC6e9WKMvKLRD+QKaiXr9NblNJWDL
         +sr2TWB8qKcTOG9F7kel1PnjghTnx0njnDuNofFvS68THO2yMnPsqR/rwC+vdSVjV8gM
         SHwwI59VXff7niSMhXNrtQl3TetvvWfeY1SKy398zxE1LtJnbOgvqxAD6n0q6BwIir+6
         3Y+g==
X-Forwarded-Encrypted: i=1; AKwUvBzw87G1UZAKa7P5urPcZaXwugnJpXKtXLusDB606lGvhNBBi39HVwEpOi/xrnhZBdv5IQt6eGkHuw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2kv+5Jj7eg7jfzz59XIV7tQzd+fzKSO3fi7nIiQnrlDNznNav
	AXFyzpNyNHzqD1l1XuFKcjX0lKYhw3Qvwu8tExyGzE6pboWOmLuAJeJp
X-Gm-Gg: AYBFou2c1ejnTVTA1cBHDYSc0hnSAQmfTWrIhL4Bw9E2ahJh4hTrVLeJV7mKrTuXk8k
	MLJ0obGm0wqHb4htKvKg+Omfr9KJpxD3tYQb6BWwnURnc9SZPnzkZXBLUtgQI43G7NabHa25QCY
	lZkfGd6iMq4nnMvQyn96BGSk5f6K3MbwxpXpFB7Qwym9Bh0rvGgpXjMnJOPwH9GgAgZ/WVt62Ee
	gFKp907P/JwpaR7ug9wd2jZA5CK8BC3HZfo3xntZwXZZV6zt8MuWHon1nsAapsOM/U4kso6Zm1n
	mTg+qy6sUxIWjqTgukaip1nWJ0jwglWMAV7IsVkVcfrBXfeq7E48qUdrXjXszcYDye3BCpw5kGS
	4OILhBo6uDdTwBj/8OuaSRTY2CtfBPkEUQo5MhVx91exjwby6GzipAKWdnVp6iS73sAmxFyXCxz
	7Gucs8gSxv0zweLlUOoBf4WklmHwomnJ6STkIo7JXOZYFNRpZbtfx98ZqpDZLdnrX4twie/rSGV
	KQo3vTreEe2TDSTZhtPCEwCW0bvBfv5iP3C4+nTVNHF4HU+/CpMowMa8nORXxG5MU0hdp7bYPN4
	999v92UYzAA7AQ13ZXlt
X-Received: by 2002:a17:902:e54e:b0:2e1:24ec:df51 with SMTP id d9443c01a7336-2e124ece09fmr30200625ad.53.1790598390500;
        Mon, 28 Sep 2026 05:26:30 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2006-1fb9-8409-0195-705e-5b47.dynamic-ip6.hinet.net. [2001:b011:2006:1fb9:8409:195:705e:5b47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc951sm40485615ad.8.2026.09.28.05.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:26:29 -0700 (PDT)
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
Subject: [PATCH 3/3] rbtree_test: use rb_add_augmented_cached() for the cached augmented test
Date: Mon, 28 Sep 2026 20:26:11 +0800
Message-Id: <20260928122611.336351-4-s921975628@gmail.com>
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

