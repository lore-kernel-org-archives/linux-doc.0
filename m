Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297C39902D
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267434; cv=none; b=l9s8+/TtlHhvMhpvxUlP2ADcKPYoTQvYm5HLU44ILu1LmpZGXZSOVaeYbbfOxew5uCNnLI4+K6DQnrLSIkZHCztnPxXLUfG1eru107LSNTV+QBBJPLTR48QcgVmBMOnE+HlSLoemjwDJ3i7k4unQTixZlYMIjUWFgXUkSAjFrbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267434; c=relaxed/simple;
	bh=FHrnFnUSAWmZNX0SWBNQDgoJTqUbfpq0tVyXroLnvKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9RxTGgDEgGLZaEgyR7J0MJj7r+z9exJPcFQYPmc3D0NWO45nSxdhNbimrpTbzYfI2lXF7SE+rGj86khRO3/CwUTVjjXCI6MRW7bhVbSxOnP2Hx/za4EdEpcoi2rgCfXe9uPtGlk3EgbIv3tXdwR2nAZm6aAb7jpXweFgAkrPWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CC0M9Kdj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CC0M9Kdj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a6cf104827so230702a91.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 23:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267430; x=1791872230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoJmGRoqngODEsvXRKt/ZMhZp/J8z+h3M6E+QYGZLJw=;
        b=CC0M9KdjjqleMFVkCq91Om5KVMt+hQA9h8DxJ1BK9h6c1t3bWIE37uVrLhOcgGGgS8
         6yAna/KrwDkPrc+arRSyoo/uOB/+bGI7xjv6Hv8WTBp9+0lBwvZh3tRDNxtm53qvf9g2
         RZU/+2sLXP0PYVDDJ5Y/mQ4La46Ho0FvnxOzq2a9r4aIUeMxTV6/eG9ho9/oyeDeKRLW
         7EfeqsTekYzNDUqrmfff9EOm1jBOOFUVUyWt3R0cK07BJj4UQj0McsRz9J9xxRVGgY10
         ATUHaIqnhWBRkdD0Fo/bOotFXS5+UZOrxvtbTD4/EnXJF1y53AOZqfkWgIBJ5EaZePEX
         XuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267430; x=1791872230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoJmGRoqngODEsvXRKt/ZMhZp/J8z+h3M6E+QYGZLJw=;
        b=lc5orgX4A2p7yRypXo8HKRLJ63a4cAKo65JdkIWeHPuY0+Si4A6h/bqqCxQIJ3NnDk
         5yr1+whbqHbMSHzyPRqGgQQ93V8jSgBDT93bHUW9pg8mBj+ni/49lAyzDGFwpBX8gkI9
         25QK9/LpiBd3ya6X4Bzlxfvjd9oTYxFyufQePrsUjbzQNuch+sFxqHHXdCOAWE22Vjoe
         DMJXiKKFTcyaPypzR1QGODfGZvmd79d5qYRtk3U/K6uWsFIW3C5Keqt4ZXOZI/h3nPeS
         GxBTEAspcqa8olxqUA1jiTpDJVezh8pf+J1UYzJGv+R0B/vmcm9MJCyxTm/MuQwB2vEU
         ihGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcek0VdMEKU4oqF7RQVzBYBgnA+x4PfUWjQKRCN8G2U4pJklrEQVT6+Np6T2HPfNKj1Xpy+bLHx0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8nJLTQCMShcw3PELavJCs25ILEu8JDnmLDjs8Iwkl8EjJTsRA
	+64VbJx4FGkjceUTs0uZM/aYYxnwyzgf7ErG5DRxt8lpTBnCgmJxlep8
X-Gm-Gg: AYBFou06WT+YRfaiLzOLuwPGKNYXH+KGRY6XmAR3/dW58VrAmc4E2YaKKwYg8loen/R
	q9SOVNfV4bOovAJ7dS2zHzGTwsgy5XqTbUEgJ7IEZJY3V+VpjCSh2RMnD5cJXR42vsW5E9r0nJr
	h/fyPfGMSxlOL+vJoP1GTbl5imHIVk8JN7tBqwWk6ZFUdAEHeCTwv2mzwJb3Ug8yvTaZLLlGLC2
	LcoY4gd85ng3yPIVsDo5uNJKtaRWJ+0DHHNuYpClLz/2bVRj0bJDhBuf3+nHJJGQ82JvLeicUDj
	TcJJQJjnjEKz1UquvhaK6pGEIak6b4Y9d/bUQ/Q6PGofg6aGLuf8RMIFL94OHzaKNA6Lv/8jOJl
	eIh8UDkue0CgNEZQV4lH4BRYrZP9QNvUZhRnZtWQG8ouxK0M+DOZiqUi4kNxpeV3+4Wt4Qzcv6/
	79GCC5P+YZVup380qEcvFP0JNs4CtsXKYps4swq+2AvjOd0gWF3vF7+PedRI/UhQ4E9ARMEKSrz
	SFjhdUeg9gMHX4VOGL/CSMM8km2LHW+PIkUnZJI9isFoX1t8MeWsTAzCJoZuGxbKQQFgtZ86QPS
	pb25z441vPX/MKmgl8c8k+DONX4=
X-Received: by 2002:a17:90b:2f88:b0:3a8:6b84:235b with SMTP id 98e67ed59e1d1-3a8726c1d9fmr135343a91.7.1791267430371;
        Mon, 05 Oct 2026 23:17:10 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm3662789a91.2.2026.10.05.23.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:17:09 -0700 (PDT)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 2/3] Docs/admin-guide/mm/damon/lru_sort: Fix copy-paste mistakes
Date: Tue,  6 Oct 2026 14:15:48 +0800
Message-Id: <20261006061549.627-3-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006061549.627-1-adrianhuang0701@gmail.com>
References: <20261006061549.627-1-adrianhuang0701@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAMON_LRU_SORT documentation mistakenly refers to DAMON_RECLAIM
in a few places.

Fix these copy-paste mistakes to correctly refer to DAMON_LRU_SORT.

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index c3b688385681..0c04d238edc4 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -264,7 +264,7 @@ addr_unit
 A scale factor for memory addresses and bytes.
 
 This parameter is for setting and getting the :ref:`address unit
-<damon_design_addr_unit>` parameter of the DAMON instance for DAMON_RECLAIM.
+<damon_design_addr_unit>` parameter of the DAMON instance for DAMON_LRU_SORT.
 
 ``monitor_region_start`` and ``monitor_region_end`` should be provided in this
 unit.  For example, let's suppose ``addr_unit``, ``monitor_region_start`` and
@@ -347,7 +347,7 @@ memory regions that not accessed for 120 seconds.  The prioritization and
 deprioritization is limited to be done using only up to 1% CPU time to avoid
 DAMON_LRU_SORT consuming too much CPU time for the (de)prioritization.  It also
 asks DAMON_LRU_SORT to do nothing if the system's free memory rate is more than
-50%, but start the real works if it becomes lower than 40%.  If DAMON_RECLAIM
+50%, but start the real works if it becomes lower than 40%.  If DAMON_LRU_SORT
 doesn't make progress and therefore the free memory rate becomes lower than
 20%, it asks DAMON_LRU_SORT to do nothing again, so that we can fall back to
 the LRU-list based page granularity reclamation. ::
-- 
2.43.0

