Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD003DDAF9
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000200; cv=none; b=WPE1zh8AatEPWCsaAZVvkzWLZy0EdVzIY0GyqTlpSPtBx+HSdEexnLQOKlR0nFglrV1vrrNVEcYmX/iaoo6rMuw9N+GwalzdFbUXYqLdaY85kuptAUu2EfTA1nVplXn1h0H3d/WTs1P5mUmiwBO7xsQSdDUWj+kvami0eDNDQQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000200; c=relaxed/simple;
	bh=KB/jB6OqWEcRCtVeInMUBakqguBclC5RDAHwxdTvA14=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FWoJ+zdpG2/to1S8DFkDmsBa+I56AHj9Pej/tzyakUH10HS267ZPLCGA+JxcS9lXYAWNRb5c0erBew1wNX0mGYWtCPLQEQuMzQOFYDkECbHy+FAuDQsco2c0x+ifGkmcKbydJ24nrUKnGYcEg2tD/nRo72DKxRfSG3SJ9IMNJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it0YtjD3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it0YtjD3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2288267b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786000197; x=1786604997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rWnIhKLtx7RMjDuQwqgCN4If/Fil+88btYo9NiRc0M=;
        b=it0YtjD3GvRnyc2JpTyu4GZQQ1kiIU0+Tsb2Q4RZCxnmVs2vKx45u29vyf13oFjkWg
         aCy/Y5qLpWI564umd5WWuePxlbwxpsQMkv100mbDMGQz61s9MsQ/ii/YvpCrFyzVxdi4
         phPKjS6QazkOq5cc63hko5e4h4d+1DY8Ls36tzMQFGc2rfeBeuHzJbxmgfblN34kuUux
         EzhQUXbtc/JIzbVCs2BoTveEHfkB0Zl+UO5VejiAP/vxmhQbApwNZz9ejcOOWbVNK4Qo
         RbQkGET2QdjDdOqZ/cQqwpdzejVF6mMC5PHlapRMrODVAa4c99KaiBDRhYvVew/GxEj/
         YduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786000197; x=1786604997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rWnIhKLtx7RMjDuQwqgCN4If/Fil+88btYo9NiRc0M=;
        b=POFgTpv3EBJDUd1Yh73BMxYKJzuzvjoelufdqyHyMwmwfMHBefBBnHbHvgdS6suNaw
         XgNVxCsYTrjCj5y4iTx9V+TxokkR9dg9b8TEHz/rfeSIa0On0kdLl1/rXnJy2frfDfMO
         MAnJNbG6PiJPaoTSXZDu1i05YDJwOxRppsc/SqMh6cY5tRJuc6nMUBsED5ATwiP07hui
         CHPFpdivtx2QtqwBhyLOnJ50qaZxtiyinhKA+QZmSZsEgoaks0KwUMpEZA6k+GaUNU6z
         0EavhQDQC4IeISbJBw/hCQgs+EegSAirHgAgIZVBrtyWTyOvSPz8ey5lTA9Zs6tDKrPX
         QAxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrj6yOceTeu7nf/n/giTH78kSo5uWmdbhhK46xGZvDbJPwi+KncA12Nc6CNcezvQHnmVK8kDf1Bq94=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVrzCO3R9oW6eRAd97kvLma2En22CXoEGRGe5n7W5l5hdmfJ5c
	IozYig0bZz+BKOhEshKhGFb0D/+T4VyZixAemNzO5HpW1U/vzXzK/tV0
X-Gm-Gg: AR+sD129PODkMpfbOCCPUxvoZycSDvrZ59nENFUgd98zWUga+a2Hgxe0JEPIw03aqGR
	CvuppPhMvAQuiQZBgMo+6Fwo6tlLnvvHyFZTAhOJKx/OB5/PUQxvy3fC6kHyI7YwcdrhDiM3HBP
	qpmUG8Yhn/u1Sk/iEcKB06mDFm5hHQV4nO4FYaQRcJt4JevywWl/sRhtYmik5zfqIQdna6rhONX
	tJh6gZByLhl24O0sHBKHXtrIiayp49+r91pY9jemJMMUk6VnicJAIGc1jtiZmVdapqxYMapWua0
	xvsYrhYiitbcmPt6ZJZYUBJ7AJY/Ff5n7sJTDr0iKIklTxAHAPp/QElpwZ78RA5pBzq7b+AeR83
	JpJeDCAik3hNd2cgAdivSi2iuRJOIKrsI4eyuZKXNS9NWhLvpAig6cKqyAxAqoVxKprHdhHrgkv
	8AR4sz0gjqXvwtJwfQZrsjG+hdn+CmZVxpQtMWA9495FHw3mCzn2SFSTo4OBoI7QaTxfNhw0PJq
	6DALI9cFA0FtMWi
X-Received: by 2002:a05:6a00:3d54:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84f2e014151mr13785011b3a.3.1786000197171;
        Thu, 06 Aug 2026 00:09:57 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm760154b3a.59.2026.08.06.00.09.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Aug 2026 00:09:56 -0700 (PDT)
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
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v4 0/2] mm/zswap: Fixes and improves the zswap shrink
Date: Thu,  6 Aug 2026 15:09:41 +0800
Message-Id: <20260806070943.95542-1-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

This series fixes and improves the zswap global shrinker (shrink_worker()):
Patch 1: Fix missing global shrinker when memory cgroup is disabled.
Patch 2: Extend shrink_memcg() to support batch writeback and thereby improving
         the writeback efficiency in the shrink_worker() and zswap_store() paths.

v3->v4:
    - Remove the nr_to_scan parameter from shrink_memcg() and cap the per-node
      scan count at SWAP_CLUSTER_MAX to avoid writeback unfairness across NUMA
      nodes caused by a shared global scan quota.
v2->v3:
    - Added user impact to the commit 1 message.
    - Updated writeback batch size to SWAP_CLUSTER_MAX to avoid introducing new
      magic macros. And enabled batched shrinking in the zswap_store() path as well.
    - Re-benchmarked performance data with the updated patch.
v1->v2:
    - Add a reschedule check to the -ENOENT return path in shrink_memcg() to
      handle the theoretical issue of prolonged heavy concurrent zswap stores.
    - Remove the shrink_memcg() return value changes part, and include a more
       detailed test report in the commit message.

[v3] https://lore.kernel.org/all/20260729084206.77793-1-jiahao.kernel@gmail.com
[v2] https://lore.kernel.org/all/20260717085151.22822-1-jiahao.kernel@gmail.com
[v1] https://lore.kernel.org/all/20260714081510.16895-1-jiahao.kernel@gmail.com

Hao Jia (2):
  mm/zswap: Fix global shrinker when memory cgroup is disabled
  mm/zswap: Support batch writeback in shrink_memcg()

 mm/zswap.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
2.34.1

