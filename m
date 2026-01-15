Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A852D94BA
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 05:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768455966; cv=none; b=N2jakGpd1Ois/fR+bKMSQmlpRzuZqvzUDf+LoUDjbsbTsZkepDd12dZqNobMAYMv3DG5Txy1Sa9qo/0wf3+USld/2koi5eOnkSJam8x9/PTxJG50tpMU69BDTwIkWXmdBxKy/w6kYeaeHDgTn98XlXprngVez3nAH/yYJ/ciwpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768455966; c=relaxed/simple;
	bh=oCpw7jog4Ls/Y7/A/Xl/Q7Wuv3MmMbEyOn73zYZS5ww=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VwzG/mKjHwC+THsjk24xY9plWW40w5IwlKtoFYoBMyLa93fh0sZEnSz22vRwzcIjMVyTvy3Gp1JL34lukcoTX1tytuCyWxRWyzJLIS0951yCP41ZbClYzmP899YDTrD7VFDKrCv6CA61OJPqD2Q96v5dFM05J399AXTYeSoOsDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x2VWUdH6; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x2VWUdH6"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-123349958b2so2384479c88.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768455961; x=1769060761; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aDAvyad0Gd6nn9PvkirLJfs5+fzAbzM3y3l25Mdn4/I=;
        b=x2VWUdH68EMWb+8hqX/HurpzBUHWkXUCUhwh6WP+ddTv/BUs7v+btDC/lQpy4UybUF
         aUKMKq2ewm3Z8TmQJr0iiLBXYr4g1u+AA1TmIaOw4z3UYT7U86ZzmZwL6Az9JxoE+hIO
         eR7fZQp7aE2RB8aIpMV6ojsMbk/HS4wszGehIgI9/PC7F2tpEq95bLuZHm+799fFss6P
         b2Fs3m1pspDk4sjUDTEUzQ9Ze8t/Z9i7cGxgkzZPyfR8/ZjLTdHphk2mAQmeA1B3pPFJ
         Hj+C9LEi/pjmIZAGf76+FUawcSmmBu5qNy+QMwkcg7/c2xZeet8b62PpAf2yK5M0FJho
         TM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768455961; x=1769060761;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDAvyad0Gd6nn9PvkirLJfs5+fzAbzM3y3l25Mdn4/I=;
        b=tokY40OZZVd3+5KW7TlYMS7ySuFOsvwwqTqhTK/j/mND7wCGAO5jrdsKYzD6YPI5qj
         LH6Lv+CTa/B4l0ABXTX2OC9Cj/BO61AkCFGGqZkfVy5Q1tE2xhLmXYENYayfzj7LsUXd
         w3BvK6WKoCQYR/MMKUtWYrCkIm4xk4AXmXemZMnKdMsCmgPnxnnE9zRV9IxCXM48r/1y
         nnGjP3U3CAuwIvsAH75A/UpZvdcvMDeRJNcj3on+Y/dXvNK0rJjMI8XqKWd2Qps5VP7E
         /HYJl4aOK5PP+e/sZ2O4ncbXHTX5viX4pj7EH2BwU/RtELr7GJjgnptlAIvp5JNIBilH
         hvSw==
X-Forwarded-Encrypted: i=1; AJvYcCUdDHPANpqqmWiy68LkYQReJ9yXyogUXCEFG67xflYWYUoJpLDO/69uK+jHtIZcKzmtgm47eHKRpiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLksFt+457/FWZ4fHaAgdngoXjnOW3QJ+yW08WWiOMJd43CWM
	CTfTsp4MDaypg/IC7r5EFsl+nkJD5NodSv0ECXj5cxxusBXp5tTVpiPqiyYkkhP2YbWE5CPWSH+
	toeNBrw==
X-Received: from dybb6.prod.google.com ([2002:a05:693c:6086:b0:2a2:4eb1:3771])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:688:b0:2ac:2480:f0ac
 with SMTP id 5a478bee46e88-2b48f5bac9emr4987449eec.23.1768455961332; Wed, 14
 Jan 2026 21:46:01 -0800 (PST)
Date: Wed, 14 Jan 2026 21:45:57 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260115054557.2127777-1-surenb@google.com>
Subject: [PATCH 1/1] Docs/mm/allocation-profiling: describe sysctrl
 limitations in debug mode
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, ranxiaokai627@163.com, 
	ran.xiaokai@zte.com.cn, surenb@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When CONFIG_MEM_ALLOC_PROFILING_DEBUG=y, /proc/sys/vm/mem_profiling is
read-only to avoid debug warnings in a scenario when an allocation is
made while profiling is disabled (allocation does not get an allocation
tag), then profiling gets enabled and allocation gets freed (warning due
to the allocation missing allocation tag).

Fixes: ebdf9ad4ca98 ("memprofiling: documentation")
Reported-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: stable@vger.kernel.org
---
 Documentation/admin-guide/sysctl/vm.rst   |  4 ++++
 Documentation/mm/allocation-profiling.rst | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 9096e2d77c2a..8577ea91e226 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -487,6 +487,10 @@ memory allocations.
 
 The default value depends on CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT.
 
+When CONFIG_MEM_ALLOC_PROFILING_DEBUG=y, this control is read-only to avoid
+warnings produces by allocations made while profiling is disabled and freed
+when it's enabled.
+
 
 memory_failure_early_kill
 =========================
diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm/allocation-profiling.rst
index 316311240e6a..058d2faffb75 100644
--- a/Documentation/mm/allocation-profiling.rst
+++ b/Documentation/mm/allocation-profiling.rst
@@ -33,6 +33,16 @@ Boot parameter:
 sysctl:
   /proc/sys/vm/mem_profiling
 
+  1: Enable memory profiling.
+
+  0: Disable memory profiling.
+
+  The default value depends on CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT.
+
+  When CONFIG_MEM_ALLOC_PROFILING_DEBUG=y, this control is read-only to avoid
+  warnings produces by allocations made while profiling is disabled and freed
+  when it's enabled.
+
 Runtime info:
   /proc/allocinfo
 

base-commit: 560d6a4c4951ae76b5c6d5b5b8650276706f68ac
-- 
2.52.0.457.g6b5491de43-goog

