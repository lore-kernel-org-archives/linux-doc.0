Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC139E162
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267430; cv=none; b=OQUMXJ92SGk/ib342pZnCbk2/ZTDBAarnYan1mxQ2KFYnm1Ukheoen0w3i4RcDoEXUvp6ynotPoE28iNnm/ftljWe9zG7qMyi6rWBjkYlthyUrKqz3JbTdpaUnESASVrlCo/hEDsrFrjFYtuvd4F2S4Ndmgj3hwuiu2QdgA/QB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267430; c=relaxed/simple;
	bh=c52s+1rtQJ0Q70cxAwYJIZomn2o6AOpxotKtFgeYSpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ld+qYpWB0nlUZjR8WiylI4k1QBImxCOAEGIb7fGERoYHW8HHfgZBchq7zNgVAyEzsHLR+QuvITakLBCd/Rwk+jzmPdahheXRTIiD2fnbRzzPOHamEIkJ9Jjfg1ifUiFoqu3JoHVFkNQr2GUUPIVzod7FXws7nZgKi6EuT57YAuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB8Ymg67; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB8Ymg67"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a0a911e8d6so1216283a91.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267427; x=1791872227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXj+ppi34PaHFxHHINamngQe5IHrKp/NnyfjPYvY7jg=;
        b=lB8Ymg67Vr1k5jHMVO1wyN5wHdZfhnqsLSE2fe6Coo0bDvsdOiCMMYASR4kVu6FgEU
         Hwlb6lEo9ex6IWXGHzzVsfJAX2ZfrV04foCSuNESncAPMGbjJblcgK7NUcwSJQI973gQ
         qxUr3tJZ82e0k4ouSbFSLdEDNwSr0NhUz8uB061pXN1SwRFBbfxDlshah97ah8UB1y/F
         h/GHkT3oJMarwrA1oCHopaISB7vWzQKhKbufhNBeYzBaJskg6G0wfQM0FTYpCMgMZ1RN
         h2uIBaMEs/0m76RT0nd9bYOtVa84dSL19ChwNgBv/PZiE5lI9neNoXg1KcWBYdB/zmSz
         h/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267427; x=1791872227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXj+ppi34PaHFxHHINamngQe5IHrKp/NnyfjPYvY7jg=;
        b=X0WPs3MHhfVXcEAbtaz5jM7dx8N22Da7JCSulHy+6an5EMZu5+AuEbjj9eSLpizUL1
         ZgVixY/g/7/a60Surob4EaGjKJH55gBoVrDkgc1MYx6DD0yLdQxhncqO6+CqDCS7Htdm
         nQ5dfFdhwKlz8ZdAMQqCTKadkXUrG9Wj1HL/vKVkJPGVo80Jo/xIQSN8lXtAg3u1pR3M
         lvtrvQarFmi8yOnnBxF9Rovv65bZGcOYIQy3LLaCkj1B98i6L0z9gLaVz5B6mk/6g0M2
         d9aBzRwmSih60nuNUy6K1HwZKcX6I9crHTrDakAhBSIs4iPryv8EX8dCt+8SwETbQFd0
         kHCw==
X-Forwarded-Encrypted: i=1; AKwUvBy++bKAe0es0B5xuR97C/BwWraCC84FCQbyT5be25GSrhfJb88PaCWH4Pw9LYz/Bw6b8AFs+NPkFWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeaeL5q6OHIw1HD9I1BiO3jkk5PAp21HsjdjSF0Jl6AePwNb7s
	mOQyIwz1GjzRaL4eFqa4zilabuHc6BaN88CtT3I19JDoPSMWsCJaYbs3
X-Gm-Gg: AYBFou0o1s3yjKJCTPhOd3Qz5dT+uDAWsxp8JNRlhPJdFMz6PVyDMZ1IaTnqbP+T0Jv
	4CZQS3XveGgXUkXPHZYvoCYCib3WGSiCl/AKdFDt86kcI5bjcbJyEjoYVnlGVL3pJj1u/giFtF9
	lTNiw0ilviypRcF0ap/rXV6XK3ldTJ4BnBalxM6nkTqKfuquSCeT5IWgE5L74zY9pdCcWNadmii
	w7x98SbY+P50vjO79W0/D0IuBbg0YC8leVgyoUKVsDq8hJBhkLt9gJEmRa80YLBORzvb7iSAu2W
	cQyoTPg1r+z+y8CKk53NiHawxTGIfquu0kylylLBwdIY07kT60uN4/mksZPA0SHKmHoad2GTsfJ
	4ueIBFgeEkbmwCqTnp8fC1pHticNomSEfUO/E+IMOgicVHipfq1ezqpW5uRwdDdfmN5ruUGgdgi
	5vHsDrfJr+FWQIdlm5ZqG+ldkQv/leDmcXE+L0M11W7NMJlAMp1KAHZJSJPgyZPM/qhEB2sEuCa
	+LcX2+qm/3FB/ihNQ8TNqowruF2FGdM3srxNGIS5EBAxggqq4q2efFtJkXEJPC00pb6QcOs1z1Z
	mPE4wxOX6uToYNUz
X-Received: by 2002:a17:90b:3912:b0:3a4:bc68:e867 with SMTP id 98e67ed59e1d1-3a87268878cmr360148a91.7.1791267427477;
        Mon, 05 Oct 2026 23:17:07 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm3662789a91.2.2026.10.05.23.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:17:07 -0700 (PDT)
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
Subject: [PATCH 1/3] Docs/admin-guide/mm/damon: Fix various typos
Date: Tue,  6 Oct 2026 14:15:47 +0800
Message-Id: <20261006061549.627-2-adrianhuang0701@gmail.com>
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

Fix several spelling mistakes found while reading the DAMON
documentation:
  * trusworthy -> trustworthy
  * DAMON_RCLAIM -> DAMON_RECLAIM
  * charget -> charge
  * hetmap -> heatmap
  * colun -> column
  * evelenth -> eleventh
  * idlee -> idle

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 2 +-
 Documentation/admin-guide/mm/damon/reclaim.rst  | 4 ++--
 Documentation/admin-guide/mm/damon/start.rst    | 6 +++---
 Documentation/admin-guide/mm/damon/stat.rst     | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index b93ca9b0853d..c3b688385681 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -7,7 +7,7 @@ DAMON-based LRU-lists Sorting
 DAMON-based LRU-lists Sorting (DAMON_LRU_SORT) is a static kernel module that
 aimed to be used for proactive and lightweight data access pattern based
 (de)prioritization of pages on their LRU-lists for making LRU-lists a more
-trusworthy data access pattern source.
+trustworthy data access pattern source.
 
 Where Proactive LRU-lists Sorting is Required?
 ==============================================
diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index ec7e3e32b4ac..e4e2ffa52e26 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -55,7 +55,7 @@ enabled
 
 Enable or disable DAMON_RECLAIM.
 
-You can enable DAMON_RCLAIM by setting the value of this parameter as ``Y``.
+You can enable DAMON_RECLAIM by setting the value of this parameter as ``Y``.
 Setting it as ``N`` disables DAMON_RECLAIM.  Note that DAMON_RECLAIM could do
 no real monitoring and reclamation due to the watermarks-based activation
 condition.  Refer to below descriptions for the watermarks parameter for this.
@@ -125,7 +125,7 @@ quota_reset_interval_ms
 
 The time/size quota charge reset interval in milliseconds.
 
-The charget reset interval for the quota of time (quota_ms) and size
+The charge reset interval for the quota of time (quota_ms) and size
 (quota_sz).  That is, DAMON_RECLAIM does not try reclamation for more than
 quota_ms milliseconds or quota_sz bytes within quota_reset_interval_ms
 milliseconds.
diff --git a/Documentation/admin-guide/mm/damon/start.rst b/Documentation/admin-guide/mm/damon/start.rst
index ec8c34b2d32f..d98b0eb8e771 100644
--- a/Documentation/admin-guide/mm/damon/start.rst
+++ b/Documentation/admin-guide/mm/damon/start.rst
@@ -69,16 +69,16 @@ monitored access pattern of the process from DAMON and shows the pattern in a
 human readable format.
 
 The first line of the output shows the relative access temperature (hotness) of
-the regions in a single row hetmap format.  Each column on the heatmap
+the regions in a single row heatmap format.  Each column on the heatmap
 represents regions of same size on the monitored virtual address space.  The
-position of the colun on the row and the number on the column represents the
+position of the column on the row and the number on the column represents the
 relative location and access temperature of the region.  ``[...]`` means
 unmapped huge regions on the virtual address spaces.  The second line shows
 additional information for better understanding the heatmap.
 
 Each line of the output from the third line shows which virtual address range
 (``addr XX size XX``) of the process is how frequently (``access XX %``)
-accessed for how long time (``age XX``).  For example, the evelenth region of
+accessed for how long time (``age XX``).  For example, the eleventh region of
 ~9.5 MiB size is being most frequently accessed for last 3.7 seconds.  Finally,
 the fourth command stops DAMON.
 
diff --git a/Documentation/admin-guide/mm/damon/stat.rst b/Documentation/admin-guide/mm/damon/stat.rst
index 46c5dd96aa2e..4a9db755a526 100644
--- a/Documentation/admin-guide/mm/damon/stat.rst
+++ b/Documentation/admin-guide/mm/damon/stat.rst
@@ -81,7 +81,7 @@ Per-byte idle time (milliseconds) percentiles of the system.
 DAMON_STAT calculates how long each byte of the memory was not accessed until
 now (idle time), based on the current DAMON results snapshot.  For regions
 having access frequency (nr_accesses) larger than zero, how long the current
-access frequency level was kept multiplied by ``-1`` becomes the idlee time of
+access frequency level was kept multiplied by ``-1`` becomes the idle time of
 every byte of the region.  If a region has zero access frequency (nr_accesses),
 how long the region was keeping the zero access frequency (age) becomes the
 idle time of every byte of the region.  Then, DAMON_STAT exposes the
-- 
2.43.0

