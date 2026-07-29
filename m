Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79343B3C5
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314543; cv=none; b=RVZBBuQu/68RCADcVFnqAddHls0uBt90URAJYC7nDfAhWCt1PqltbpAXyS3PvsV9B4Di9rMEEVRjJO/iV22G3X8GxwNQ+X6Kd++96MzM4C8cSgjbHRPN5V9pEdu2F9gQSl3x10uOup+N2l3cdKCX8UW74z2UcYBUBuB2BB9DxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314543; c=relaxed/simple;
	bh=AoEport5yLXgXmPHgl97YXtejIIJlLqw4ZGm5ofomAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hnl3rz0JqLdmt8ks6tmIV6Hz1R5aKngJqx4MXKkzrMAa+Dh4oKujwb2LLWoq1tLki1CEMsn+Oa6Pv2Rg39W3sMCPg8zESLi57BV9kOQG93Kj7GYuGtbO5a4E2H7PZLnDjxnYvgozzKbE8a7/5aPLRUQFbjRD6K7rKg29LuAEBw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcb752iE; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcb752iE"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so671682a91.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785314542; x=1785919342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWC4cJlWYFKlCjFYJ8Sm1JeDbDYVJfA5kqL88tKZQqg=;
        b=dcb752iEkftjYUTc79d8izBjRGfhAzCqB2eoHqmvN7pyTPg3lPO1uWWyXpu2sfS4Yn
         qquSCgYDIsQvVlg8GDslB+3ARvGTwQa6PSQ/FDHIuN24Ap9GCzkloxDx5o3vYjlc506e
         y/iJDBrIe9uPR6GHyIQZtp5oWDALU08CH32fjTDSe67QsKvf5LvPAYPpJBj8Ylksl71c
         P3dKCLhR+IlFueD2eziaTM/kRdFPjbeamg/TQvQb1Uev67lbmY7grr3qrW3WMlQ5nBg9
         0vres/nF+7I1LTLepBJWe+MZcwL9WxrNLHNK7dOkSkEgcO0heBhq7l0G82JRnW/7mnfJ
         Qpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785314542; x=1785919342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWC4cJlWYFKlCjFYJ8Sm1JeDbDYVJfA5kqL88tKZQqg=;
        b=Y1nOkn9UOsJWVtohBzshQvdOyA9p9ELOknIH7YynDg/87wGkBsTB5OiFk9+GuJq0fK
         u9XODVsKmwg0dQC5BQixBrCb5h89jL+88UAF6HnbPJfzKRu7cDh0WUEnMZ7CcjH718k1
         u35BdKXn87RxskO9rrCHwpDfLyqnlasO9KpPYAGfbmGQZBpsb32Tk5z5tybg1XCeUWva
         wXU0rZUKPEF04UVMmNKL8GWBoh1u83un+IeGOQVBkPO9w8BSpaT4H6E7z77cNH+RDL8K
         q+4Z8Z1JRRIyh/Mvb+ZIsVqUsRtnl9nyvFqkS79oQkEyhEhplf1bOxByval/+UGuM3ot
         PLsw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2sFcz7CFVfItTjqvGqIoD9uyYzNWgwOut8i62psShyaxfdCwuNW0bwih60c3K971cdyfcndCPaC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv5vKAGK1Sl+XPLe3XEHFdFHY6LMbPQKYzh0OxTwgWB4KDiFok
	lAV7Oy7sS8nipdDhHuaxqDUdeVdpYwL5qbXu4pTUqarFDZhqyWmdEJdD
X-Gm-Gg: AR+sD13KY0WyirPjxb42ARLYQWFfI5gkl3vIvKosV7N9wmf8AelX4nFl8hxVafbZ854
	cZlvkEFPRp11laMMC7dgpRkMJgMJjf9DKrPobZGypWSC5z7zs+WRbbWyeO6klqhPIqEFKN1bC7Z
	CDQH1VUbFAsaK/0l2mai4Cn9P9yudi6zwOs76fK1NEPemIc3tuU8U74PcLoTAwHcvz8xKwyE3Ma
	vukP5zz8TrstkSGorBqK1gPjsX868hC8QlwjdP63ETG8l6QPLcOaV3OdrxnhPxZRP9T/i09r2uc
	3i6swTxkGYhEixVjsjwka8Q4g30yELtPOPPzxoG7I5hd9a9oawpG8w9ufHNEMGov6fgTnIX/FpV
	VWfTVfOSU3+D/gDT7s3JrMLLtaRBTbFKEaZF+8S7z8PP3MlukIR4QtOhE0uW4dSxlTWir0VBHIv
	LxN07YxQHoaDRV4yGjbsne+MzHGoQWGCFSZoyD6F5iL5qJptNMfchSQj/kXXry2f3JbvP020xmz
	2u9aRHYDvq5D79G
X-Received: by 2002:a17:90b:51c5:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38f6a37e87fmr6475462a91.15.1785314541543;
        Wed, 29 Jul 2026 01:42:21 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2447744a91.17.2026.07.29.01.42.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 01:42:21 -0700 (PDT)
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
Subject: [PATCH v3 0/2] mm/zswap: Fixes and improves the zswap shrink
Date: Wed, 29 Jul 2026 16:42:04 +0800
Message-Id: <20260729084206.77793-1-jiahao.kernel@gmail.com>
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


[v2] https://lore.kernel.org/all/20260717085151.22822-1-jiahao.kernel@gmail.com
[v1] https://lore.kernel.org/all/20260714081510.16895-1-jiahao.kernel@gmail.com

Hao Jia (2):
  mm/zswap: Fix global shrinker when memory cgroup is disabled
  mm/zswap: Support batch writeback in shrink_memcg()

 mm/zswap.c | 58 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 13 deletions(-)

-- 
2.34.1

