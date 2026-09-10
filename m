Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E34A54DACD
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060634; cv=none; b=SYhScyScNr/Fkw3LfAKtwzsU5pEYSYbJQX4NY7I54w1WuWXSaVxrVFSDftmA7cG+MCHI8J1EGaU7/em9YcET3KI0Zh2tqAwEDCeWBonPWtwOEDvj/XUB4Onjnu7o2xzlwrnUhoVLB+WfiMigqxXyNjzWmHJrWCqnXgrHliBp1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060634; c=relaxed/simple;
	bh=dKBhc/qYjs60oa/k5fBVE/b8yc5t8ryc/K02fqOJhvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5a8UhQs96qlNRhMskyPE2ixNU9NbmvLaA90Fs6S5IHL7NkZyCKnsOM1v5rtSnJZwMn/YKt2I9yrk1fQxk7Xiu6BrBxRP6V2s4BcQvawLJ9dRL6cp5RjIxIu/6gA4SjBFeLEvF23pA68qhEQoUHxL5H1/OvzBjNY2fXkXDcwOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pecCy4tt; arc=none smtp.client-ip=74.125.224.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pecCy4tt"
Received: by mail-yx2-f3.google.com with SMTP id 956f58d0204a3-66fd0af9eb0so2123121d50.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060596; x=1789665396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCG1VvuHQ6SCJdLVUga8vZowwN0KJmpgx8fDOpUOTA0=;
        b=pecCy4ttlFl92E3wsXFv+ZcV84Dc4f8C+QaE9brprA8uXDDVhGT0s30NhqH4gAMIOe
         rIIlxMmii2msTY9q4p7V3t3vKJqpoNV2jCmPTQ2xDWXFOpZ3QolPaFEc4GAS1EH3HQ5K
         ezTfAGIuAqucg0+7grBz+bHimblBEsLAcHPADrvTv7BtxhgCrlHnGEPzypipn6Q2ZXbX
         CdtzUeKYOIz9D32iTpr10Vrjyb3W8uBIghz2RgbuJySJq9ZZrCSEfcLBTxkwp9iHLDAI
         raUAuPBQiE45/Qkm5TDrhJ7zEFoD84+nMKaXKBGK3vxdktX17YUeRnsTfBH5eQCMX/rJ
         DOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060596; x=1789665396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCG1VvuHQ6SCJdLVUga8vZowwN0KJmpgx8fDOpUOTA0=;
        b=f7fuDlau0sD4cx3Sfsdtg1vmuiV30pYox/NqvxQ0/2DqEnrIZ7zXSlh9JFo5leHMHr
         x1/ft9jlIDN+sdVKnLNYUAw38CthePW8wT9KlpzFMTHEAsuFdjqRp5O1Cve9CFEYQswH
         MPRYzPBbpJ/VvOgW2prYAv8P81UCylJAElRgbvjTP+I53d/NIl0PGDyeYtYNN7Zvuqzx
         O1mN4qYbGIFZSu3s7YhiTVj9DTvAFql2HMpeV358Sck5nLGUYG9HEE0nHm8jinUVd42h
         u1iIa68hMu1dWZ2ci115WWP2Xf/QERsksHVPZ/v/bVCjCNAm0qjR1Ro6In9XIErPsjko
         g7xA==
X-Forwarded-Encrypted: i=1; AKwUvBxtqgFsEhVvDqfBTfNaJDlBkNnC38xcLrL7RkvwpYFgkvFVlszZX7mYLAnmphSLP/GKqkM2MgdXPpA=@vger.kernel.org
X-Gm-Message-State: AFuF++kF2XMRK6V2dPXdVqAX/t4OSDAtt1TffhqwUShynsGF4yfRocs3
	FOtNz8JCtriDABlq7RHTyT942BRMG9yNF+/GeAh0RBKMNZzWNkLLOFc=
X-Gm-Gg: AYBFou0FJFsO+5kx90e1PcYGtLxXQ+cFyCBuqzh+XRBl4MgWjqtIsaul6LQQxLPDRKl
	js3qpWhRphZpOw1arvuSksHc+ZVJ0bIqBG6JwBcUnAJlPfJCL9ufakaxTqLNSm99kqJyxxrw3xS
	u9onkAQ09bfLtufrdPnDu/Af3xryi75GLV1Hm6cvfjZ+aKJoDbqaPVybnCbhfG8LypTKeikSuPa
	yEIqsO1d6gg/ZDRa/b528TUjotSvbsPg0ypTfSkXpKBceVIyhgXdVRzdU6m843wmm4Tc7olYWCZ
	h3/Qgqt7KmZdcF9itKuTwF/mioIDUFmcYxdbWDrCg9AjFQJ7cCWG+SGPpzn1sjNXpIFlUPAoz8y
	PWeACysflrSQlP+JKtU3fpd/Xc+hq2HC8ajivQ3Unw7XPZuqDRxwCz2DVY32pg9QWjxQMg94iva
	5tWaepEaoJnwIJ2SKgQEnO7WNoozDxZsT6vept8CVoNOohTGOhcncvJIyb11IaIQk/mNQpF6wx1
	yFu6/t4w5VhjJbKUqGEtRyyR0hIHY1vR0pq7tokSBgt+JPn8rmvUg8KOFdQ
X-Received: by 2002:a05:690e:12c2:b0:66f:ca93:eae4 with SMTP id 956f58d0204a3-67124722b0dmr151051d50.92.1789060595769;
        Thu, 10 Sep 2026 10:16:35 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8b8fsm14316278d50.2.2026.09.10.10.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:16:35 -0700 (PDT)
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
	ravis.opensrc@gmail.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net
Subject: [RFC PATCH v2 4/9] mm/damon: add damos_node_eligible_mem_bp tracepoint
Date: Thu, 10 Sep 2026 10:16:18 -0700
Message-ID: <20260910171623.6638-5-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a per-tick tracepoint for DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP goal
evaluation, exposing the goal target/current values for observability of
the node-eligible-memory bandwidth quota loop.  Bandwidth-feedback tiering
loops read this goal metric to detect convergence.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/trace/events/damon.h | 32 ++++++++++++++++++++++++++++++++
 mm/damon/core.c              | 28 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/trace/events/damon.h b/include/trace/events/damon.h
index 4dfc9467ea4b5..b2a472eb45d95 100644
--- a/include/trace/events/damon.h
+++ b/include/trace/events/damon.h
@@ -74,6 +74,38 @@ TRACE_EVENT(damos_esz,
 			__entry->esz)
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
index 991ddb9a09414..6b56a3e961c4e 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3461,6 +3461,34 @@ static unsigned long damos_quota_score(struct damon_ctx *c, struct damos *s)
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
+			/*
+			 * cidx is hardcoded 0 because DAMON sysfs currently
+			 * supports a single context per kdamond.  Other DAMOS
+			 * tracepoints (damos_before_apply, damos_esz,
+			 * damos_stat_after_apply_interval) follow the same
+			 * convention; once multi-ctx-per-kdamond lands the
+			 * field becomes meaningful.
+			 */
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

