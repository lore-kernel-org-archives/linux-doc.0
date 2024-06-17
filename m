Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2508216A941
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643956; cv=none; b=cA4OZD8QRFNHkhOPaax3Ox8QSXCS9ebmf/5y7yV+cjZc7AQj7tjysZpJepfpsZJVCEKR2sa54L45cz4dv4B2r5WmCoB0FEEUZ5u4UTU+I2VORRGRYzTSQKaY1CdVn/JiF+XOccjS5D/KSv4mucoGf5z4a6BoLVAK48EzAQdifOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643956; c=relaxed/simple;
	bh=7hzTI7JNlDxEfLjvpOlOkZQ3nAyRsfeAGvDyTxr2TWY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t36DZpnlFTItU73yte3co7cL9vL6jYZlQ53WbVfzXjEjia/IK4Z8D2skDsw5P1FN0QuH8mHm0SU6wbNijzPQfbC1vC72jRbrqxFS4f59swDs1Le+irXeTCbK3pF4B5VgWvyhvB4/VWf1/alNoMnSTKiBPUYfW4oJ0SG5/2em1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uo/XVCIQ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uo/XVCIQ"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62fb36d7f5fso92251747b3.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718643954; x=1719248754; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lmqa+eDYiknLWtQ9zaPVQYbfuHlo6Q/kAey0Pd/nR7w=;
        b=Uo/XVCIQPfuYsEv4bvrS/dswcbUZjZj05wMhw35lhxI6H4h6Yh+/MonDuokF9enzeY
         o7cCZJlmYUT/CiW2lUcsHbV3Y2d0+3kSJRTFQs7f6XqR/0pec5hkfg+HEbU4b31t4Ed+
         kRQescCA8jaClcFv/RoniWGjTdNej4Rp/khKl+5hFBi1bObqsDJsILqpu/i9JWJbDYbi
         BEQhw7qjQk9l/zrIVuaqF2iJF4DyQKb34a+3/BuweS1vTPFEY74ceYMTBNKgida5iFOf
         0cuP+obFHy9iLqWmTtuSnMy2DcrOfWoa+7ajWF294lwmmqZu3SyRSavmdTqk+xUEvCIG
         /QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643954; x=1719248754;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmqa+eDYiknLWtQ9zaPVQYbfuHlo6Q/kAey0Pd/nR7w=;
        b=LG4XyPKQgQJjLGDXxsZIp9WfFNyIQjs4pqF4WXRH43pz0UKPDxtrOsybylVsZ0KPIB
         YnTOzCJNWZE8kmV59HILm8fP7uuBcQ14s51j/uY3KMu9bQqP4epElQZXh7DxkBuvcytS
         Knxw70FG36g0kTp5V3o2dlze8+PRniOolo5b9+NwP7gkBmzxy5p8tRmFVC0gCP+2hI4/
         Isfpx+dgwVSd0V/KMBT4vV6bR3SGwJqvvpmP8F7B63buzGq8A/DYi5g4ZN8ikAAFy9Y4
         vAdUCG2sB7hIz5r0gGVo7IXTdqmDN2sZipDWKo0R15Y7YqVHVeW7ISVfIL5AbFT5MX2D
         iaNg==
X-Forwarded-Encrypted: i=1; AJvYcCWSjZeHX+E9Vtmhsh+kjKoq+O5lHtRFnH9YigNr9TikVa9nE89ulqgfDwVlTPQMiIILXDElJBTr7ds/vftJOQr5lcRpa8HnUS4t
X-Gm-Message-State: AOJu0Yz8dyCVVtrplr3iwNQS1L1JTUqpbV6LrTc5jzl76udNqHPpL+2D
	RCynrnfu1/uMdDdoE4BSHx9jHBijGx5qukSc/nTpcggWm27IvztCX1qQZx9wTYRQhKI8GNq4InB
	rCQ6KEDfo2A==
X-Google-Smtp-Source: AGHT+IHINQQBbNRf7KhELYqBt0/Q0yNW0Gm7Uiwvy1m/YHP63sxC+8TwS3fjRLwHObbkJ8tAXyAlcAdEODvV0g==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a05:6902:1007:b0:dff:7d1:33a7 with SMTP
 id 3f1490d57ef6-dff1552cbabmr2952019276.12.1718643954195; Mon, 17 Jun 2024
 10:05:54 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:05:45 +0000
In-Reply-To: <20240617170545.3820912-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617170545.3820912-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617170545.3820912-4-jiaqiyan@google.com>
Subject: [PATCH v3 3/3] docs: mm: add enable_soft_offline sysctl
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	ioworker0@gmail.com
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the documentation for soft offline behaviors / costs, and what
the new enable_soft_offline sysctl is for.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index e86c968a7a0e..fc62fc272fc5 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -36,6 +36,7 @@ Currently, these files are in /proc/sys/vm:
 - dirtytime_expire_seconds
 - dirty_writeback_centisecs
 - drop_caches
+- enable_soft_offline
 - extfrag_threshold
 - highmem_is_dirtyable
 - hugetlb_shm_group
@@ -267,6 +268,38 @@ used::
 These are informational only.  They do not mean that anything is wrong
 with your system.  To disable them, echo 4 (bit 2) into drop_caches.
 
+enable_soft_offline
+===================
+Correctable memory errors are very common on servers. Soft-offline is kernel's
+solution for memory pages having (excessive) corrected memory errors.
+
+For different types of page, soft-offline has different behaviors / costs.
+- For a raw error page, soft-offline migrates the in-use page's content to
+  a new raw page.
+- For a page that is part of a transparent hugepage,  soft-offline splits the
+  transparent hugepage into raw pages, then migrates only the raw error page.
+  As a result, user is transparently backed by 1 less hugepage, impacting
+  memory access performance.
+- For a page that is part of a HugeTLB hugepage, soft-offline first migrates
+  the entire HugeTLB hugepage, during which a free hugepage will be consumed
+  as migration target.  Then the original hugepage is dissolved into raw
+  pages without compensation, reducing the capacity of the HugeTLB pool by 1.
+
+It is user's call to choose between reliability (staying away from fragile
+physical memory) vs performance / capacity implications in transparent and
+HugeTLB cases.
+
+For all architectures, enable_soft_offline controls whether to soft offline
+memory pages.  When setting to 1, kernel attempts to soft offline the pages
+whenever it thinks needed.  When setting to 0, kernel returns EOPNOTSUPP to
+the request to soft offline the pages.  Its default value is 1.
+
+It is worth mentioning that after setting enable_soft_offline to 0:
+- If RAS Correctable Errors Collector is running, its request to soft offline
+  pages will fail.
+- On ARM, the request to soft offline pages from GHES driver will fail.
+- On PARISC, the request to soft offline pages from Page Deallocation Table
+  will fail.
 
 extfrag_threshold
 =================
-- 
2.45.2.627.g7a2c4fd464-goog

