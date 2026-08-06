Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5EB3DC4D7
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000212; cv=none; b=dSOhtjcFC+hzfp85niYnFChFoe3vn9ll398tBddufzeZLHeOH7tVd+WHOQhRZteH4uas35g27Ts2koTYiIt8KOSOIAyXp2I5O7eovex3XRdor5bhwXDPuDsRYb6ArwCTx6rQAK/AVWMSmAMbo1aAVeOf86YFX47xfOdWd24Bnnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000212; c=relaxed/simple;
	bh=D9JmoKMI2Pmwotp5SEfjJj5F1SbchS7Q2k32kDMtCD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=brrK3IhXNPdiL/OWvRPrLe4cWQejsghH0ihFNNcdD8nqZKMxDZISU3pi+qkyfP/0G/dsBmlQqn3aF1zCYDaC2fTwz2A/Lw7gzu5nXwxSmkIitRHv46Yv7k7Tc9ql7wM4nIQy/iVrumBvwFJWlnlX+CcyrK92RKfKslijjGJeOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLfAZVMY; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLfAZVMY"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848761b5897so1402256b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786000210; x=1786605010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxkf9l/6VRKPUFdY+I+2JUrRfOgcQ7nzG7Tljs67NVc=;
        b=oLfAZVMYsURcvMNnJJX66I4qn/Eu34GjnRthIb3aVjz1X4yl1U4Xwnvxd7Z6k7g6oz
         6sgY6SrNdxmMAtTNetV8vbMkeOgMHy9ZUVhP3Cgctpc93YMimDBjI1vElbih091gWM01
         xNtwUFmgf8dQVu6ykVNa3KN6sexx9VRHb81ZB6/Okyin4mtp6BU5sjY+1imMR8/ikqYq
         I47oIiUArbuFY4SQmWSyD/I/hahDY3q2rDmKdVI0v9w/rzppQ/Ayz25ynKRzyEUdYv38
         1LWqLQgI0LygiZTARKT0OEG0D9bYBUDo45R+li0EIIZPtEvv2sjy5K25cMU1Po822vDH
         pQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786000210; x=1786605010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxkf9l/6VRKPUFdY+I+2JUrRfOgcQ7nzG7Tljs67NVc=;
        b=jwn5ScWBX4xYFjWVY5N/2Ni8VS9IrCzsPEclGBfJJmmOiSViO/07jA5+W/PuMXw3fA
         be6ClHrMCfxub5lOPrKT83Wb9SbJUHN/ndnUF2/FtkJhgMf8qH6/+xLqcd6Z5MFznk5S
         U5GmYBfo/iWoSoibVzYqtJRMnGXpWkqJMPI9Rg3sFf1l2jMiOawi0ZZz0lf71eQqnIis
         z1Xr2goTXCDif1XW2ai/VV2GXBFL+N+VrItKa7RL12Exx3ApY+ZBEpuKJhg2zl+z9u2X
         M0iqHQ4js1E/IlunXwVocIPQsmrwtF3Q+FXxM84ipGttjBgy0OGq1UE4WDhK7ap0zDpq
         ozGw==
X-Forwarded-Encrypted: i=1; AHgh+RoCVpKeKFtJXSeVqlbnALE43+fTTtTq1HgMeN+GvBeeubp1Vf+v5fQP8u5/lk2X/JGSLJafHyxp4Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9a+LSvTBVjXEERcHeL6FKJmX4x97jOHLMwwe6MBrG+vPyaU+Y
	e+oeSVkh9Tls9hPtZeyv9omwjNAGDOIlxvbo6PNUEP0Wo4m8FRQ1RM50
X-Gm-Gg: AR+sD10+tdA+161L309nV1/IJIYSvGIiAUwhub+O0sejck300mKBlg05S508IPx5/Gd
	yyohAtMw+oPr5xNtRYuQt2PtKBTjb6qyi271iW77JyZtrYyE0pQCTa86xH293P/WFo6aMtPBR9R
	+bl2/+kR8dzpWjPd37Vp9LYOlc25FtB1DbVHHymntRS32nDUZU376deFiUjE8y6h/3AzAHfGcg3
	ceAFczFUAJKuu+EYnJ5JvqbLUDjIl45lAqzAi/L7+uB7DjrYNUUIZZ63wFWiPEbOemzRY5Rx3WX
	fG6vV4k1LxPMss7rQUe4wy35xAFiyL/Zi/yIMiOJ3WbKM0JOF5u2b1u3F/fyVcblvyXccetfCUn
	bA1X8jMnsYZFMwwTxXbW5TkbTJyG/I+ffZZykOP61xhxfGTkDg6r2mpsqTYDWY9EPZex9A4pXku
	62OL/hI91RWaci8W4O4d8xSQDE3DnRbwgllnOFitTKfroLMUP2qTd3TWZ0gCITYY5Bp8hEBeoHj
	o4liD7dK+jdU2bO
X-Received: by 2002:a05:6a00:4218:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-84f2e210308mr14993193b3a.1.1786000210573;
        Thu, 06 Aug 2026 00:10:10 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm760154b3a.59.2026.08.06.00.10.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Aug 2026 00:10:10 -0700 (PDT)
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
Subject: [PATCH v4 1/2] mm/zswap: Fix global shrinker when memory cgroup is disabled
Date: Thu,  6 Aug 2026 15:09:42 +0800
Message-Id: <20260806070943.95542-2-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260806070943.95542-1-jiahao.kernel@gmail.com>
References: <20260806070943.95542-1-jiahao.kernel@gmail.com>
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

