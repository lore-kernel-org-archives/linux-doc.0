Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F663A268
	for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732614705; cv=none; b=cPDyk7eccWJXEK3HXuCNdwLHQiRIuqPC+tymJHnbQTRTtiziVxBgxHYClZPR+YHI0JckXsw6wnLBCbpOjl1Fh2Bhiu1qTDngrsMBxVtrl1uAR8LQyh5zHn2/MtQy4OQErR8NcBpGqgkQacYFAn5tBIFf3IA4Eb+HpkQzcylGnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732614705; c=relaxed/simple;
	bh=QL+jsKpJlz5b4P+2bQcbr5zSIL44zoHSmizxnSBuhFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ndLRQky3zIvy8AStDI7fzedbaaxwL8TH41F1xu4HRytmnpUf3nhD1JmoCz2QV3p0XYVbZ/btgOsw9509+xdKF189VJMhwxpJSu50DMDvecDp/7nQQrywLflW6dsKnAg/xK4IIt1LbL9CoMC6GMjI9hv9qyK99UffIcTLXGZcLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jSwhb/+x; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jSwhb/+x"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38230ed9baeso3812939f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 01:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732614701; x=1733219501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UO4mSSBKzizqKXO9HWAu5xtTzjjab3K6hG1bXe5LLuo=;
        b=jSwhb/+xJGkmRpcDV5yeW4ZHr7qKmu8gg0TsF6fQ/WyLEgCk+J6w4yJlOEpwGWfQvc
         Px1u0FRQRU5O+EAZKwd1NtilFiUd+G83fb3urpPmz1Sihdoro1R3QyQk9bGWgI/LFMTW
         X8rZzBLoflUoWaDYDJWGmNkEOBn9pkoZpYT3pEVLIENYrDJK2QoPoCeW6d1I8YcGs9AY
         mSE3Nr77RVmmqbGsFIGFsoBPPlrzvEP1NzCwApCg0mvIm/tY8omeBUyZziC2QEwboZaX
         /+a2mw77BlIUipmLafYNZhlRST/0+FOOHAHC5Ppzk8yvx8bsAKeaavzTkBchVTgjMmsP
         vXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732614701; x=1733219501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO4mSSBKzizqKXO9HWAu5xtTzjjab3K6hG1bXe5LLuo=;
        b=lfVo253qTdMTI9JXPlnfUAhkYtiFFHVl0gsC3JwqBsFxqGRAVtEr3tEpWedXtOtWEx
         a/Wctkex7BjzwctNeXoCM0tRUHhyXpvO82aGW24bpCyejy2ViVWmtr9xNP+rg7yzbCcL
         pW0eQ+GUvsU9limPtPCny58Rs139mZlGs0tH3EaN7ElzE5vMRxgpG4MtkX5LVI7IZZ4j
         wbG/zBrSGyvTSoYrlmS8N2siRBcmMovZE0/sZuW+LUWWJxohpnyRCv11FzaYkmjbUV1y
         2q+/zjNtaYoebsuc0QNt12ejw1FM/kBbvLXk5GOaNAjckvEKeiM5PhXS1tz5E8PDjmhf
         LFfw==
X-Gm-Message-State: AOJu0YxtrIA+QMB33YPxzuVu4MQrsKGg2bbUwL246iCDvBtJXqz1pNLN
	/fez+pKuy9eVX/fOt0+9v2hX/Zvc1JwA+/WNAmbVdumojMxFCAISTEqKHn1SxyU=
X-Gm-Gg: ASbGncuqcLdYjG14wrT0UQ17IdY/3zVM5NTmyH2e968Hv6POxJeu3HEacS7ceHQS4FS
	ECvEwhr03eN7BTvrcrI/Zt2pRHeNUU4g6+RbAKwea9PTNTRdxLmVxlJzzCgqUby1Js7WboFiVAb
	i+6ql4RqYMGoigIyotkGNN4rC/ZVTZ1rQ3oB99M2KQp+/1Ypi+tIA2gZWzMAVQXG2GRY1CSANp3
	jcYj2mtzG2O7LPlbw8SZik292LXbH07rpSS0GIrRaei/TINqyb+obb0dGKeEJjrpBlSzYYvjY7p
	lEY=
X-Google-Smtp-Source: AGHT+IGy1fknfYw17Hs9F6ZticKpVJz4vkS8NC2H5qrqchJz9nfNpZvrSiMCMB7eggn/X6U7IKtd2g==
X-Received: by 2002:a5d:64c3:0:b0:37c:cc67:8b1f with SMTP id ffacd0b85a97d-38260be3f72mr12341731f8f.48.1732614701364;
        Tue, 26 Nov 2024 01:51:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb271ffsm12745475f8f.53.2024.11.26.01.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:51:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: corbet@lwn.net,
	akpm@linux-foundation.org,
	thuth@redhat.com,
	rostedt@goodmis.org,
	paulmck@kernel.org,
	xiongwei.song@windriver.com,
	ying.huang@intel.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [RFC PATCH] mm: page_alloc: Add kernel parameter to select maximum PCP batch scale number
Date: Tue, 26 Nov 2024 11:51:38 +0200
Message-Id: <20241126095138.1832464-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Commit 52166607ecc9 ("mm: restrict the pcp batch scale factor to avoid
too long latency") introduced default PCP (Per-CPU Pageset) batch size as
a configuration flag. The configuration flag is CONFIG_PCP_BATCH_SCALE_MAX.

The ARM64 defconfig has CONFIG_PCP_BATCH_SCALE_MAX=5. This defconfig
is used by a high range of SoCs.

The Renesas RZ/G3S SoC is a single CPU SoC, with L1$ (I-cache 32Kbytes,
D-cache 32 Kbytes), L3$ (256 Kbytes), but no L2$. It is currently used in
a configuration with 1 GiB RAM size. In this configuration, starting with
commit 52166607ecc9 ("mm: restrict the pcp batch scale factor to avoid too
long latency") the "bonnie++ -d /mnt -u root" benchmark takes ~14 minutes
while previously it took ~10 minutes. The /mnt directory is mounted on SD
card. Same behavior is reproduced on similar Renesas single core devices
(e.g., Renesas RZ/G2UL).

Add a new kernel parameter to allow systems like Renesas RZ/G3S to
continue have the same performance numbers with the default mainline
ARM64 config. With pcp_batch_scale_max=5 (the default value) the bonnie++
benchmark takes ~14 minutes while with pcp_batch_scale_max=0 it takes
~10 minutes.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++++
 mm/page_alloc.c                               | 26 ++++++++++++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e7bfe1bde49e..ce745ea78470 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4716,6 +4716,12 @@
 			for debug and development, but should not be
 			needed on a platform with proper driver support.
 
+	pcp_batch_scale_max=n
+			Format: <integer>
+			Range: 0,6 : number
+			Default : CONFIG_PCP_BATCH_SCALE_MAX
+			Used for setting the scale number for PCP batch scale algorithm.
+
 	pdcchassis=	[PARISC,HW] Disable/Enable PDC Chassis Status codes at
 			boot time.
 			Format: { 0 | 1 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index bc55d39eb372..ef1d37cefb43 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -163,6 +163,20 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
 #define pcp_spin_unlock(ptr)						\
 	pcpu_spin_unlock(lock, ptr)
 
+static unsigned int pcp_batch_scale_max = CONFIG_PCP_BATCH_SCALE_MAX;
+#define MAX_PCP_BATCH	6
+
+static int __init setup_pcp_batch_scale_max(char *str)
+{
+	get_option(&str, (unsigned int *)&pcp_batch_scale_max);
+
+	if (pcp_batch_scale_max > MAX_PCP_BATCH)
+		pcp_batch_scale_max = MAX_PCP_BATCH;
+
+	return 1;
+}
+__setup("pcp_batch_scale_max=", setup_pcp_batch_scale_max);
+
 #ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
 DEFINE_PER_CPU(int, numa_node);
 EXPORT_PER_CPU_SYMBOL(numa_node);
@@ -2362,7 +2376,7 @@ int decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)
 	 * control latency.  This caps pcp->high decrement too.
 	 */
 	if (pcp->high > high_min) {
-		pcp->high = max3(pcp->count - (batch << CONFIG_PCP_BATCH_SCALE_MAX),
+		pcp->high = max3(pcp->count - (batch << pcp_batch_scale_max),
 				 pcp->high - (pcp->high >> 3), high_min);
 		if (pcp->high > high_min)
 			todo++;
@@ -2412,7 +2426,7 @@ static void drain_pages_zone(unsigned int cpu, struct zone *zone)
 		count = pcp->count;
 		if (count) {
 			int to_drain = min(count,
-				pcp->batch << CONFIG_PCP_BATCH_SCALE_MAX);
+				pcp->batch << pcp_batch_scale_max);
 
 			free_pcppages_bulk(zone, to_drain, pcp, 0);
 			count -= to_drain;
@@ -2540,7 +2554,7 @@ static int nr_pcp_free(struct per_cpu_pages *pcp, int batch, int high, bool free
 
 	/* Free as much as possible if batch freeing high-order pages. */
 	if (unlikely(free_high))
-		return min(pcp->count, batch << CONFIG_PCP_BATCH_SCALE_MAX);
+		return min(pcp->count, batch << pcp_batch_scale_max);
 
 	/* Check for PCP disabled or boot pageset */
 	if (unlikely(high < batch))
@@ -2572,7 +2586,7 @@ static int nr_pcp_high(struct per_cpu_pages *pcp, struct zone *zone,
 		return 0;
 
 	if (unlikely(free_high)) {
-		pcp->high = max(high - (batch << CONFIG_PCP_BATCH_SCALE_MAX),
+		pcp->high = max(high - (batch << pcp_batch_scale_max),
 				high_min);
 		return 0;
 	}
@@ -2642,7 +2656,7 @@ static void free_unref_page_commit(struct zone *zone, struct per_cpu_pages *pcp,
 	} else if (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) {
 		pcp->flags &= ~PCPF_PREV_FREE_HIGH_ORDER;
 	}
-	if (pcp->free_count < (batch << CONFIG_PCP_BATCH_SCALE_MAX))
+	if (pcp->free_count < (batch << pcp_batch_scale_max))
 		pcp->free_count += (1 << order);
 	high = nr_pcp_high(pcp, zone, batch, free_high);
 	if (pcp->count >= high) {
@@ -2984,7 +2998,7 @@ static int nr_pcp_alloc(struct per_cpu_pages *pcp, struct zone *zone, int order)
 		 * subsequent allocation of order-0 pages without any freeing.
 		 */
 		if (batch <= max_nr_alloc &&
-		    pcp->alloc_factor < CONFIG_PCP_BATCH_SCALE_MAX)
+		    pcp->alloc_factor < pcp_batch_scale_max)
 			pcp->alloc_factor++;
 		batch = min(batch, max_nr_alloc);
 	}
-- 
2.39.2

