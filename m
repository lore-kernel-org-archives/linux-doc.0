Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com [209.85.160.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC33400DEB
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073834; cv=none; b=I/mZ7WmznR+Gl4kJJBF0XIrTlnLN6GSUphvF/fEM9TN0dBK3skvHMbLwh+Wd8PnN2CS2kxfcrxSbTbIAbqkeLM9NKMGKti5qL1P5TTIru+fj0JpbK/P9xTty3DD+D1Pi790V7N3K7vRwu8nEKfD5Zb1ASUm83l5xyeWwAqGZoWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073834; c=relaxed/simple;
	bh=mBWxNyD3dD7WZKndJ1kCqjFL7BsBzSS97QOevn010vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFPBXqe6W+4bhElyimGY4Hq7Bdmabwrh7tI3GbL3tAZDNTHZAidXrq9lw3EPikJdGFz+9DxRiSbI5Yw8tnwPAKZRWK2ga1OaLXrwVVAUcU0JVT1iePDU3oOOc/idNGosG7imr36Q54Z/zt6RT4H5aophGDuulgcSe1N6yuplosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZnnRRL1; arc=none smtp.client-ip=209.85.160.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZnnRRL1"
Received: by mail-oa1-f66.google.com with SMTP id 586e51a60fabf-43bfe209e45so3215513fac.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073832; x=1780678632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/62Lo7gqlbSGmK7of07r4Hjek/ejMB9r9tyx1CYLkQ=;
        b=LZnnRRL1vGOfhV+JSSJS2Fwm3Kj3Wd7fgtbu5Wxsrx38sNLSKDdFpVqbbLj9E82Epo
         CusJOc3gjrAY/UYUdBy0jzRFdLO7gT7n17SU2hnj/oIfLyjHVMIUomZRk1MRelF9a0ia
         bsqCmf/SbGo4bqp0KResGcMJt2KlqGLlL2AJvJXRImp1Qxzf38hj63UVJsYVRn+p2j7j
         wBPiLhFj4sBVUWgZrw9ca6/IZQEQKIeBBnsXwX8TLLvt1DmC3VYShFuVvosRdgAVtA0T
         u/Ych1eNj2B+tMoVzhB/jAE3FMlPv8I1+eRxy4f48fH9VHA+hhiJ1P1XPhRn4A9sYd+y
         xsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073832; x=1780678632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/62Lo7gqlbSGmK7of07r4Hjek/ejMB9r9tyx1CYLkQ=;
        b=Mdx0zYShba6AYV1hW3K+Xz5oDZq+fC8V2Dwxpy391yr5J+jJZvVMAS+dlUj4PAqaPs
         XIjKLuCN6/PlTUWplhTqaJepAtN5KXmaiu5cRZ/cGco84pxlVoxx6HeWkR6YeRDGM9Ow
         lmrsd4lJ108ZniQ7qac+D//bjWNfJkk3j6SHOQYBUq7H/lwLXi9VkHIvoRx3TapOM2qG
         SIp0WwwFUdxfeXLxx5EIrn3pZafVa1t1ypwNtGsac543VWs1fYhuAxC12x+cqcGmUysq
         jDIGQpDpqUnDnzLLkRuRHtvPa0obUqMmAEqpAZv1z/aP/Z8/xScI19gefBJb7jJFZYUr
         XV9g==
X-Forwarded-Encrypted: i=1; AFNElJ8e3ciViLTXchtgWY3wgNeT8Y/fSH+kFRaS5ouBekuDNBr5VsyWK/w4xaDZ4ewWUaJPIZFp4vb2AQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwd+PQF/WV+gB78DFqW1dd2KO2sGKOJyJjyy2HJaInccPbjJNE
	nl1+VLzyIu0rcmT6pHLRhDReSI9yaBid2lVD1VW+52Qd9DHr5qZ8nCg=
X-Gm-Gg: Acq92OEV/g+tbqVBZFy/7Bia7Qa8WoFQjwJgTFnCt9k+F/MoQBum2wFWmdTfKw/Gf7K
	tAGCnZZguT8a8yZA2KWw1WFUNSbqxENjevwvFMrhYxkzvlTJXVeZg4h2zKD5G1eb9QZM+7EkOA0
	qQV9dF0IedUN8ldN2zeOxyXgp7gN8CwWR96JpnER9AVlxbXAZTOlAozqGkUUe+BDDKM47KBz+iO
	CPdik7jVMMi2SzbPceusUZ4uyeRNsOGtLNKl0h9K70Dc4k59Tj8pXrnc7t/fPBXUMAlfZmhYE5i
	Ty496TfLlMOeInwE1bKOub7SzuMDtTorN/rWLEgVypOv5RQrUpRg7sBXzrtA4xrqhYo+toh0jcd
	rr+6MXPLmZ4gl8K9eOTjQsdkkHScElfafj6tz9s9jW5LfG58ObA/d824L3KeTMddb6xmYz0U9gO
	GrJLnwnnwnlYWMcamDrESNvhbFNYMyDnvIaV4Ay9ka1J8yajceXDyB/nAVowH5l5bTU8rp5QfUq
	zvrA2Nu3ug0
X-Received: by 2002:a05:6871:81e:b0:43b:9922:9ddd with SMTP id 586e51a60fabf-43ca425b65dmr369732fac.27.1780073831692;
        Fri, 29 May 2026 09:57:11 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43c93a2861fsm1392913fac.3.2026.05.29.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:57:11 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
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
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 6/6] mm/damon: add damos_node_eligible_mem_bp tracepoint
Date: Fri, 29 May 2026 09:56:40 -0700
Message-ID: <20260529165640.820-7-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529165640.820-1-ravis.opensrc@gmail.com>
References: <20260529165640.820-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fire a tracepoint at every DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP goal
evaluation, exposing (context, scheme, nid, target_value,
current_value).  This gives userspace observability into goal-tracking
without polling sysfs.

The trace_..._enabled() guard avoids the damon_for_each_scheme()
iteration cost when nothing is listening.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/trace/events/damon.h | 32 ++++++++++++++++++++++++++++++++
 mm/damon/core.c              | 20 ++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/trace/events/damon.h b/include/trace/events/damon.h
index e97e70579a8c8..877627c9a1a18 100644
--- a/include/trace/events/damon.h
+++ b/include/trace/events/damon.h
@@ -91,6 +91,38 @@ TRACE_EVENT(damon_perf_ring_overflow,
 	TP_printk("cpu=%d", __entry->cpu)
 );
 
+/* Per-tick DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP goal evaluation. */
+TRACE_EVENT(damos_node_eligible_mem_bp,
+
+	TP_PROTO(unsigned int context_idx, unsigned int scheme_idx,
+		int nid,
+		unsigned long target_value, unsigned long current_value),
+
+	TP_ARGS(context_idx, scheme_idx, nid, target_value, current_value),
+
+	TP_STRUCT__entry(
+		__field(unsigned int, context_idx)
+		__field(unsigned int, scheme_idx)
+		__field(int, nid)
+		__field(unsigned long, target_value)
+		__field(unsigned long, current_value)
+	),
+
+	TP_fast_assign(
+		__entry->context_idx = context_idx;
+		__entry->scheme_idx = scheme_idx;
+		__entry->nid = nid;
+		__entry->target_value = target_value;
+		__entry->current_value = current_value;
+	),
+
+	TP_printk("ctx_idx=%u scheme_idx=%u nid=%d "
+			"target_value=%lu current_value=%lu",
+			__entry->context_idx, __entry->scheme_idx,
+			__entry->nid,
+			__entry->target_value, __entry->current_value)
+);
+
 TRACE_EVENT_CONDITION(damos_before_apply,
 
 	TP_PROTO(unsigned int context_idx, unsigned int scheme_idx,
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 1e6966e45144f..609d627e2b33e 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3203,6 +3203,26 @@ static unsigned long damos_quota_score(struct damon_ctx *c, struct damos *s)
 		highest_score = max(highest_score,
 				mult_frac(goal->current_value, 10000,
 					goal->target_value));
+
+		/*
+		 * Per-tick visibility of NODE_ELIGIBLE_MEM_BP goal evaluation
+		 * for userspace convergence-detection.
+		 */
+		if (goal->metric == DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP &&
+		    trace_damos_node_eligible_mem_bp_enabled()) {
+			unsigned int cidx = 0, sidx = 0;
+			struct damos *siter;
+
+			damon_for_each_scheme(siter, c) {
+				if (siter == s)
+					break;
+				sidx++;
+			}
+			trace_damos_node_eligible_mem_bp(cidx, sidx,
+					goal->nid,
+					goal->target_value,
+					goal->current_value);
+		}
 	}
 
 	return highest_score;
-- 
2.43.0

