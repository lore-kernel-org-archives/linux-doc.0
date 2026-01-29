Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0F367F25
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769723903; cv=none; b=hMMMkzDykPmT3M0WqQkMEU5rSlqgcIZCkWhjyZM11WHYkHa59EFgK1YKZfjX6Jpp5vemWWLj3HhMMMLiptEaHk4yMzzlAa/R9tqo2sUlU8jRfMUC2Sm4Paoo8vvEeBLwFqgtMpW8TieOS1myv5kwYBdFQcfW/g8qWdNbAnKRH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769723903; c=relaxed/simple;
	bh=E2PzmQBsrkUQlUCjGwf4xR0qYrrxe/5JAZuNmStoFY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mF6+XqH3hy3ewaEHFxAij4BIqtQR8RQat0LasgeOXCKE80hzVLyr3DTd16bzKDjVPK4sNI+OometsdoyBikx4u7yGae2AvD+nQK1f2QuXvU3ibwymvKaFa25BKajCG4CvpLDG3Ero6D5vfu8AXx/nk0RxRRPvNeoPFGJsY6lK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYnDmlqw; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYnDmlqw"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so1884365eec.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769723901; x=1770328701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuNybkTlqvH+9m8T0FgwqGQF2N52zzKrzPQ6MtpsUMY=;
        b=EYnDmlqw1d61nLN0ymqNCon1i7a6Ca9sH9gdzOC+SQA5VMW+RHtLi3AFqzC2F0BkYG
         KQUvGTHYP0um0Z60ZucCcbBXFpbjeDV40yU+0Dz0MUGk/WEn5IgTaBzjxL3VAKbEiPgI
         tjmeDqff6I4ybIDhlAwJrLqZJBzK1HrybzEflJcBq1mhNNtS5+iET3mMkLK6toAAwlNy
         iYFlsAdy0WPYGtdjy8JE8j+Imp4L3wBiOZ8kl/6SQGdneMvZftcng7hN9DDLUMYjVP6Q
         1ViXRDG3t7zV8eMJ6dCHp0VGcUhdnKBGcDvNqf3y3RpFpCXuUyUO8DKmII9RnIe6bI7r
         gdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769723901; x=1770328701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JuNybkTlqvH+9m8T0FgwqGQF2N52zzKrzPQ6MtpsUMY=;
        b=w8Qwf2r+/DoHmDGk6eIvwCoRgHc+7pkvDdKaxmKf/KVnd+UJAdJc3IATjezZyJmYGb
         sCICCBm1VqJTES7neXB1rcbndx0LmlXJ7jZbHKfxpqef8geW/pIUZW2TMx/eZteBWHD1
         k8PlKSulI+pNiGgitBdrtUBGr4B0aR2oz1kjIFrA3G68VE5kSU0a7tiZ8XwLfyAhaFtN
         jnIaB8OwV1lJqC6eHK2w1rlZMGQqzlQoNDJ215fR/UpOknKcffen6Ku7yrAB8kPdR1yn
         9N3mqCEjROpjWGlkDjRhHa71khdSIuVdK2mtPK3xo4d194G5mMbOcp+AUe8h2HjlJuUP
         ooxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwNIvv2U4hzD3ifS0MCHK4nMs2eeDYPbKxZRvVIZqyXbIYgjwCDM8EwASDdRLJ0TYfZA1oLvI1b84=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvTY+/NL4RyJm5rrTGoIR6oD77PYWdiwxX9Hk/H5f+BHMgQ9lE
	bY8Ot165u4gcx1eoe/1w6X/MaQi5P6aVmHxRrUfuvwQ9ecJWYvoP1aQ=
X-Gm-Gg: AZuq6aIY8KNt1OtQXXzrpgonxUfejtpTaadaHC3x2ddjiGJk33kNz0ulqQOSCmch5BI
	kimiqKb6qr1caYqewIKJefxgMCGrFzfW7iiYhPj7x4ARUWZni6aWbktzjXFiizOL9TOxQKdblWU
	iCUlYAJ+wLqJXR4dYEMhGJ0kyTsggjUtIcgTvH4+Ilx6hPu1uxo7mVGgypbkhw5oTUsKhu3IkZK
	kjUu9zZbrizlwDyaxDmMgzFoGaswKIVkIybc+uMN3uXrNqnl+3eh2A3O+oAQG4lIqGT54vR0VvB
	zLLalc3C3AjFipzy4oodP5INA6OGEDMoEr9w1pkEUzPChlXUDNyxafBz/pz/gmHXeMUL/EpMsxo
	70Iwd61v6U7SAJ79jMS6whd1/TwITb/u75ymp0V/wYs5lhl+lnE1W0+stjx6kDGheQwsGaCl8uA
	uTr3W0TYjcmA==
X-Received: by 2002:a05:7300:6404:b0:2b0:4c12:d74d with SMTP id 5a478bee46e88-2b7c865541fmr553751eec.15.1769723900641;
        Thu, 29 Jan 2026 13:58:20 -0800 (PST)
Received: from localhost ([137.201.204.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm8585570eec.3.2026.01.29.13.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:58:20 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [PATCH 1/3] mm/damon/core: add DAMOS_QUOTA_NODE_TARGET_MEM_BP metric
Date: Thu, 29 Jan 2026 13:58:12 -0800
Message-ID: <20260129215814.1618-2-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129215814.1618-1-ravis.opensrc@gmail.com>
References: <20260129215814.1618-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new quota goal metric DAMOS_QUOTA_NODE_TARGET_MEM_BP for
physical address space-based DAMON operation schemes. This metric
represents the ratio of scheme-eligible memory on a specific NUMA node
to that node's total capacity, expressed in basis points (1/10000).

The metric enables auto-tuning of DAMOS quotas based on how much
memory on a node matches the scheme's access pattern criteria, which
is essential for controlling memory migration in heterogeneous memory
systems (e.g., DRAM and CXL memory tiering).

Suggested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 3813373a9200..5eebb8aaab85 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -155,6 +155,7 @@ enum damos_action {
  * @DAMOS_QUOTA_NODE_MEM_FREE_BP:	MemFree ratio of a node.
  * @DAMOS_QUOTA_NODE_MEMCG_USED_BP:	MemUsed ratio of a node for a cgroup.
  * @DAMOS_QUOTA_NODE_MEMCG_FREE_BP:	MemFree ratio of a node for a cgroup.
+ * @DAMOS_QUOTA_NODE_TARGET_MEM_BP:	Scheme-eligible memory ratio of a node.
  * @NR_DAMOS_QUOTA_GOAL_METRICS:	Number of DAMOS quota goal metrics.
  *
  * Metrics equal to larger than @NR_DAMOS_QUOTA_GOAL_METRICS are unsupported.
@@ -166,6 +167,7 @@ enum damos_quota_goal_metric {
 	DAMOS_QUOTA_NODE_MEM_FREE_BP,
 	DAMOS_QUOTA_NODE_MEMCG_USED_BP,
 	DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
+	DAMOS_QUOTA_NODE_TARGET_MEM_BP,
 	NR_DAMOS_QUOTA_GOAL_METRICS,
 };
 
@@ -193,6 +195,9 @@ enum damos_quota_goal_metric {
  *
  * If @metric is DAMOS_QUOTA_NODE_MEMCG_{USED,FREE}_BP, @nid and @memcg_id
  * represents the node id and the cgroup to account the used memory for.
+ *
+ * If @metric is DAMOS_QUOTA_NODE_TARGET_MEM_BP, @nid represents the node
+ * to measure scheme-eligible memory ratio against its capacity.
  */
 struct damos_quota_goal {
 	enum damos_quota_goal_metric metric;
-- 
2.43.0

