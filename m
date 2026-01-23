Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1049E38F95D
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 04:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769144280; cv=none; b=qRwjGT0+BiLESzuG4VU8idhJwFw1Z8d0aGojTcuPN4fTH8WsGmRbPggFR++D8+VzgQV9kgSeuZG7BljM+/5ydLDthkviaWtlOmhWgycsO5UKP65cdH9CJoXNiJ+QtB8WkEazbbP/4ZBUIlTAIw89tQ0/ddMbaztSt/Rfy8s2zQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769144280; c=relaxed/simple;
	bh=+AOWSwl3iOQaWr6u6EF8dNnZr3QA8X8HEruWVBZRH4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sneSL6GA9eAQNT8h5I1cPTS0wmjP6w2nbf31G4rPWj5Yx74sXoAfpsqEsi7NxlTNz/3fMsYpF2SxFEVKpV3pE2v9jIB/gFwyUaQuD0ypqAfrUXbSc4cAZVSnN1JlhvfbrsON60Cgj86/uo7e5/uKLVr69JIOYOPkBy1qBK57Z7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COIiW0g7; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COIiW0g7"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-79430ef54c3so13882157b3.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 20:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769144266; x=1769749066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D+wUgUp3AIJjrSF87TlviSGACs4vs0t8FpLdk/Qkks=;
        b=COIiW0g7pGS9dNwXAzI+Oq2ApeTYthU2XpwZvvQk8zQxm6hIgrdmjgh6mdL6EQ0bqR
         No7LPCSxxlvUobxqfIxx5XLQh2LF9L29E9cqRiiNI7iQYHOvb56UUkYq6p7aKWAXrFCE
         CMkCL813Ku8v0Lyn9AI92QW+FNNgiUb3b+KOAv2a5JTQKxSGNdBBdyZZvuG+EKWUk7EN
         dTLOR1PtDOpLCbSUVjeltLWLdHjY1TK8Uvpay+pMwaTTViylDS8VCmw3TUcCwEDUGTTx
         5iCe8yqSjEvlzP5qZ/ppdSAN7XvgmoC1gvawEGNwaCjhNfZrgjaknk22aFAB7vbRn+/U
         MTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769144266; x=1769749066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1D+wUgUp3AIJjrSF87TlviSGACs4vs0t8FpLdk/Qkks=;
        b=pbirdsXnIy4VAaLz58/7s/CGPXhZ4MJhOjQ5wLZnhTwR1nHrVuBaDf8L8hQwEPwgIl
         nnOISa03ta7VF6zCnneTfNJ7egeWIFwQhMel4IM2YbwNmwBHOup8QXJbIYVtNf76ib8x
         uMXlzXU8lS4lYP/XHuyo6AEO+rO2CHGKwQ50aSlDFIv05GNVC1FU0AR9yf8MQnFnwAq4
         GzlZPIGX+eyHcq2lb8uQRO5CC3HsXQRvdSlOBZsIpDDcqyX2YbuaPD5z3ad4L8tuviST
         NoGIEXrIjqFDenwkemTUkjoBndcGvwBARRNB6wh44zAHkdgAfSQN1ASjfQWYr0hPCds5
         n+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTiFU8eV4ceWUTDKvFt9+ox4FARo5xIbs61W0zsBDJaIUytf8P97adDGbyTOwG/66cV9/umkppeMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5gjFoOwuGDZs5Iz86M8NaYbfJWUEpRNEcrCMdfE+x9cQe3apJ
	YmslEoyqcRSjtdMDvZh74yPELVKd/XWbMxSqkLpq2eWSEEOa6ncv6cTYbgDokLc=
X-Gm-Gg: AZuq6aI5NJl2/nN2D2+9k/wmlj0zFQPFAu+F+I8scPmmZSHVcBt2hIlw8B9YfCyKiaY
	FQOFLaKDFtw95IoWvWSaZhBwnQNXQA8C/1SMHu1C2sM7Dz1X3dy7F6h4RLto2McLFVY8mInUN6q
	yNhDLD6GMta2XIBbotMojIvpYKMMx57DGrNbl7eNcTJ7HgnhExLszkGXQRJh17Lt4J0Ywi8d2Z/
	xRpW6wtM6Z8Z7D36mckH8pV+6S7yTCJrLN67mkO2n6CfYkM67TPF2VEB/ySnY3gxJJ3urSaHaF5
	QaZnszupjriNrDY80TrmxY/vbA1qn6trwwrNaGiH5xlWSDcrIL7Qc2+EhVHe91LK+dBlNlpfUuH
	si4UVnMyIm2iRT8u4T18zcXSb8tG0y6IzBNIihLK9GvEZl87r4ptjm4x4/L7dPuFRxsH9RukVij
	NXzMMhYCi1uQtZFuRL9zEAnVy271xJ6ifdJb+hZDmNwgUbbTO5DXLmRdNbhJmi1Q==
X-Received: by 2002:a05:690c:630a:b0:793:c850:9e05 with SMTP id 00721157ae682-79439900187mr15750197b3.28.1769144265778;
        Thu, 22 Jan 2026 20:57:45 -0800 (PST)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2d060esm6104507b3.56.2026.01.22.20.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 20:57:45 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [RFC PATCH 3/5] mm/damon/core: add new ops-specific goal metric
Date: Thu, 22 Jan 2026 20:57:26 -0800
Message-ID: <20260123045733.6954-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123045733.6954-1-ravis.opensrc@gmail.com>
References: <20260123045733.6954-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert static functions in core.c to pass damon_ctx* and damos* down to
`damos_set_quota_goal_current_value()`. This keeps all goal metrics (PSI,
node_mem*, node_memcg*, and the new node_sys_bp) computed in one place,
while core remains generic and ops-specific computation is delegated via
ctx->ops.get_goal_metric().

Only static functions in this file are touched; no external ABI changes.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 84f80a20f233..d898bfcbef72 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2119,8 +2119,20 @@ static unsigned long damos_get_node_memcg_used_bp(
 }
 #endif
 
+static unsigned long
+damos_get_goal_metric_from_ops(struct damon_ctx *ctx, struct damos *scheme,
+				       const struct damos_quota_goal *goal)
+{
+	if (!ctx || !goal)
+		return 0;
+	if (!ctx->ops.get_goal_metric)
+		return 0;
+	return ctx->ops.get_goal_metric(ctx, scheme, goal);
+}
 
-static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal)
+static void damos_set_quota_goal_current_value(struct damon_ctx *ctx,
+				       struct damos *scheme,
+				       struct damos_quota_goal *goal)
 {
 	u64 now_psi_total;
 
@@ -2141,19 +2153,25 @@ static void damos_set_quota_goal_current_value(struct damos_quota_goal *goal)
 	case DAMOS_QUOTA_NODE_MEMCG_FREE_BP:
 		goal->current_value = damos_get_node_memcg_used_bp(goal);
 		break;
+	case DAMOS_QUOTA_NODE_SYS_BP:
+		goal->current_value = damos_get_goal_metric_from_ops(ctx,
+							scheme, goal);
+		break;
 	default:
 		break;
 	}
 }
 
 /* Return the highest score since it makes schemes least aggressive */
-static unsigned long damos_quota_score(struct damos_quota *quota)
+static unsigned long damos_quota_score(struct damon_ctx *ctx,
+				       struct damos *scheme,
+				       struct damos_quota *quota)
 {
 	struct damos_quota_goal *goal;
 	unsigned long highest_score = 0;
 
 	damos_for_each_quota_goal(goal, quota) {
-		damos_set_quota_goal_current_value(goal);
+		damos_set_quota_goal_current_value(ctx, scheme, goal);
 		highest_score = max(highest_score,
 				goal->current_value * 10000 /
 				goal->target_value);
@@ -2165,7 +2183,9 @@ static unsigned long damos_quota_score(struct damos_quota *quota)
 /*
  * Called only if quota->ms, or quota->sz are set, or quota->goals is not empty
  */
-static void damos_set_effective_quota(struct damos_quota *quota)
+static void damos_set_effective_quota(struct damon_ctx *ctx,
+				      struct damos *scheme,
+				      struct damos_quota *quota)
 {
 	unsigned long throughput;
 	unsigned long esz = ULONG_MAX;
@@ -2176,7 +2196,7 @@ static void damos_set_effective_quota(struct damos_quota *quota)
 	}
 
 	if (!list_empty(&quota->goals)) {
-		unsigned long score = damos_quota_score(quota);
+		unsigned long score = damos_quota_score(ctx, scheme, quota);
 
 		quota->esz_bp = damon_feed_loop_next_input(
 				max(quota->esz_bp, 10000UL),
@@ -2227,7 +2247,7 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
 	/* First charge window */
 	if (!quota->total_charged_sz && !quota->charged_from) {
 		quota->charged_from = jiffies;
-		damos_set_effective_quota(quota);
+		damos_set_effective_quota(c, s, quota);
 	}
 
 	/* New charge window starts */
@@ -2240,7 +2260,7 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
 		quota->charged_sz = 0;
 		if (trace_damos_esz_enabled())
 			cached_esz = quota->esz;
-		damos_set_effective_quota(quota);
+		damos_set_effective_quota(c, s, quota);
 		if (trace_damos_esz_enabled() && quota->esz != cached_esz)
 			damos_trace_esz(c, s, quota);
 	}
-- 
2.43.0

