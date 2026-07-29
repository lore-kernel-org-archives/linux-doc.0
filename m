Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6B0425862
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314554; cv=none; b=M7H4JDnlhtdYQcHtgEkxJVhDQzVlYSg6qIplUsdStrtqLoVpx5TPYW9Jd5qD3PhjbjtnIdt6jqy8ItIt3dEdFSrMz4CJwSHtZQxy89Fe+fLBcDyvLU6JSY1RM6na4BxSrXpfidOcfEDMnW24IpHJnANrVMb+XMuXCVUCJgED4iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314554; c=relaxed/simple;
	bh=SopE7MqLzZcPVoDijXslOcJhSh4kStnW9CEO9fvMNdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p643X9kJF7OnW1yAVxlnRm3OvqLjQn1QxaFuSYLB6oz3qN3cAQD/PjPx0DsUCywdBjnVOmCT3bS6cPrz9ygpivzI6u/NeGsv/qNgqiBZ9+NNOdPyI+jFji8cEAIoTX0uLZfkfYe4GIRNZpPELNpbb0a+Lr1E8d7CKwWJh0EnixI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVwSiqyA; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVwSiqyA"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso819107a91.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785314552; x=1785919352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lt/d2kAncfp9Acac5Bt6s8eLHi0HnyPmHLMXZYN4/j8=;
        b=bVwSiqyAPMRLnA6trPFafeTdAY7raDd4OkS6jOIrLDoVSYuMnxI4a1VoJJqQfjDNjw
         UkR9hePHJ2p0AF/vhMyQZDSCJRZopwvHJBN//QLjePDzr/oN9D9/5rTu9xdruPL8JkGz
         oci7gEG8UsRSuYlTef2mtS+5ohWfyYnGVX7qeUF+0NdscbPgVdApcJgwLxHfxffx2pQr
         01Og1vByuuSFwwyKoXkMfJz/rCZlcWc3EJPyIP3qFHgsOAHIClWpIseQWRWzMzSoxgJl
         2aubRfybMt/XAo9TKD3/1rugk42/TG1sUZQSOG4Pk18xjgFcaVAY2LEqi/oC40DdCipt
         Z16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785314552; x=1785919352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lt/d2kAncfp9Acac5Bt6s8eLHi0HnyPmHLMXZYN4/j8=;
        b=IFq+dT8kkm9ou2XGyIrIZawTQBjbtd2kSTEfAxWugxZxpNqnb0XK+KfOzBUFC02QsE
         V9SPZ0Q8EvvzAQmyyPzz1kjk8mY5OxJ2B7xwyZYF+kYVQTw7CNh4NH0mwHbFAHwELumf
         2tlcfv08AD0hU048y+HRAYHGTHslboK1rHryY77XnT7IGSVBTtWlafGS1qh76uynOZZo
         8v9/DL+5b8b+dQuR5RZjcDRfq6Mkbn2Lt3uclh52YgVNIsYaZ1nPd38b9mCs9gvZFku3
         61mfqjQbugQ8VqgJRMknA8+gGKmYoBTmI9+BNoaB8mIqqmJxpxW8+d1ONhEHRm1zdkZi
         W7Eg==
X-Forwarded-Encrypted: i=1; AHgh+RrgWvR6x98eFgN75OibpgcfmnuQnQj1nPQ8XNzcgEoxNMnmUxMcwn0Q4ubdE3EmHi6wlXOZPukLEj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRrFIGGA6f84qbbG1j3LEo0Jv2zKCHO/DUdxFGWW8t3iEMaCGu
	x7opJIGmwRQbdpwA33+ydCZrkNdJRAZZoKArBc0HlXqffuPYDqhwtIg/
X-Gm-Gg: AR+sD10khx38U//2fodgZMNxCNy39XaZaqUufTHtDbVWTVz/wwNAiVtl9sp/fDR11bH
	KN4t4lEFOvkH5XhPcUXX5a0FKdKOz5lHcaROfrUkrr/OwsVpByitziFnfoTNH9J1LqqdxfNpQV1
	mF5eZjG5DmPKLjO50P4p/jIquHx7PW2OZiT1zFKTQX+oRlCZL3/dmZsWJWdMli2r5Fyj3pJrgtb
	C/8HFKtAiKpGI1fT/E580WxDArRU2sKS/NYn9Ana0JirZ9aWjgf23YTdpG9E/DTye4YtVoALlOU
	LAUlqiMv/JR4TIsUwGCSk3683dn11YmQq/vgRaj8u15cVj9bswrpGfGmicmIwn5CmmCER3m7N10
	4bN1Cq2rb/tUYtFYhKiDQp5BN0z+gdTcH3a7GpNmAGW/TuUQ5hj0gOcWc/RAEgMun7+BuGFP0V2
	imHYvXrd1C2/MwGfidkYtfb0JL8zb2wMyQ/sL4DZUaUhOEiybB5N4sXzQ0nWbH9eTykvK+Wy1FN
	ipTzK9XVFKIXlwa
X-Received: by 2002:a17:90b:3a8d:b0:38e:6c37:d95a with SMTP id 98e67ed59e1d1-38f6a445e64mr5503868a91.19.1785314551939;
        Wed, 29 Jul 2026 01:42:31 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2447744a91.17.2026.07.29.01.42.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 01:42:31 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	yosry@kernel.org,
	mkoutny@suse.com,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] mm/zswap: Fix global shrinker when memory cgroup is disabled
Date: Wed, 29 Jul 2026 16:42:05 +0800
Message-Id: <20260729084206.77793-2-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260729084206.77793-1-jiahao.kernel@gmail.com>
References: <20260729084206.77793-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Zswap writeback when the global pool limit is hit fails when memory
cgroup is disabled. The pool remains full until it is organically
drained by swapins or memory freeing, leading to zswap store failures
and pages bypassing getting written directly to the backing swap device,
causing LRU inversion (hotter pages with higher fault latency).

This happens because mem_cgroup_iter() always returns NULL when
memory cgroups are disabled. As a result, the global shrinker
shrink_worker() repeatedly takes empty walks. After MAX_RECLAIM_RETRIES
failed attempts, the worker gives up without writing back any pages.

Therefore, when memory cgroup is disabled, fall through with the !memcg
branch and shrink the root memcg directly.

With memcg disabled, shrink_memcg() only returns -ENOENT when the root
LRU is empty, which means the total pages are already below thr. In the
absence of heavy concurrent zswap stores, the loop then safely bails out
via the zswap_total_pages() <= thr check; otherwise, it will resume
shrinking the memcg after processing the reschedule check. For any other
return value from shrink_memcg(), the loop is guaranteed to terminate,
either after MAX_RECLAIM_RETRIES failures or once the threshold is met.

Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
Cc: stable@vger.kernel.org
Suggested-by: Nhat Pham <nphamcs@gmail.com>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Acked-by: Yosry Ahmed <yosry@kernel.org>
Reported-by: Yosry Ahmed <yosry@kernel.org>
Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/zswap.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index b5a17ea20237..48fc7b575e24 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1356,11 +1356,12 @@ static void shrink_worker(struct work_struct *w)
 		} while (memcg && !mem_cgroup_tryget_online(memcg));
 		spin_unlock(&zswap_shrink_lock);
 
-		if (!memcg) {
-			/*
-			 * Continue shrinking without incrementing failures if
-			 * we found candidate memcgs in the last tree walk.
-			 */
+		/*
+		 * A NULL memcg ends a full hierarchy pass (except when memcg is
+		 * disabled, where it is always NULL: fall through to the root LRU).
+		 * Count a failure only if the last pass found no candidates.
+		 */
+		if (!memcg && !mem_cgroup_disabled()) {
 			if (!attempts && ++failures == MAX_RECLAIM_RETRIES)
 				break;
 
@@ -1379,7 +1380,7 @@ static void shrink_worker(struct work_struct *w)
 		 * and failures.
 		 */
 		if (ret == -ENOENT)
-			continue;
+			goto resched;
 		++attempts;
 
 		if (ret && ++failures == MAX_RECLAIM_RETRIES)
-- 
2.34.1

