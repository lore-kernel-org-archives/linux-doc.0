Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E513C8F5
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 05:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719378513; cv=none; b=JXnCGzfsam9M7TmB9HgWoGbKl4uxys0cawGZKiI81AfNwpr1AZUw6mKnZ1U4NKe1kY4n5054jzup78YlOmdKjzxv2ZB9/ccbznoUob5yvebmR7jEPzQTT9riCcZBs5aC6bbaJhvLwPh0bc2WatblU16K2OpJzcKA/vBv4vfnsSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719378513; c=relaxed/simple;
	bh=6RTswbAavt5pcU+GjXWq0ODhw/9EICs853/4bjB6N8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r0FkZ/8T0ZjGpoMp2an1aNqntuDQeWP5tkDRzNG5/fdszrTSHFWnIalkKEwP0al/1sOIEAgPqiSxCokuHsaBrelSHlstEd7Z66Y7S9/XLCf8Il+3NXJJahBQGk2qG+jEsDPzmjYG7cRbZ+ViguII4RnADV23LPPI85bn3EJBqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VIyIwzd4; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VIyIwzd4"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6344d164c35so138544927b3.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 22:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719378510; x=1719983310; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fs5YbFk0qJzpaxZmqawYh52QCdlQJr8uKPRepM7gFQs=;
        b=VIyIwzd44aKZC7G4XzySnl/zVWyQhq1Owrj17ZvNhK0a4AyKc9CpoPpQIx/AD7qpLi
         ZOo7Xwj0DuxHmAMpdjJAin2QIeXKXkM8Crg9itk6en/JZWL6B+PnaJj+4GhCGjfLdm+b
         9a7ZNhVLz7KN6lzySDtGKlKU1jO+7w3fsYvMzyRp2G9H9YS/SwrTwpZLdJh2S5QHEw6I
         uXGvSXTq953VN180wdsJt5AyEkYpOH/vImRR7WE9pebFEAANxGM9fagUBCHJpZytLSye
         dctycQnz5mQJNzpPN6vh2ny+1N4wPog5L0OZHELZiUnCxjPG2cp+IjmuGZzUKpHZJASI
         43Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719378510; x=1719983310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fs5YbFk0qJzpaxZmqawYh52QCdlQJr8uKPRepM7gFQs=;
        b=uxCFAkpNtKnGpoPKo6208tBTjSeF1wItNB9flMalKU9j2MogHmscZoSxs3zPvq2src
         sKtAtORJ5eqUeUoXgAP0xtYk8Rof/qvVqAqhPhbyH04fYjpTJIdiQcZzaVgEp3gP7IIB
         lR+1BRoNG5/0RZSFgadTjlvJiKTZYJdrP+i676lTBk1rXlUJjQChuT6gUPck7suX7mwu
         FJpNsGaNidlHHsGIEbndUnpkZwNDZMJa2SqPnp5igYnkzWR2iJNY5bHS8xS2j/sTCQEb
         ZS39YNOR6O/vzZjOh+aZiX2LeJb2nbudChlgfDnepq/AmEfZy3k+QMubVwJ2yPZdT51Y
         i2UA==
X-Forwarded-Encrypted: i=1; AJvYcCVZGOoATLG9rE775ckXPfcNGcwYtdHfRCFeTZK7LI2dPVRgLLiCqCtzr6co2VdlFTYNc+bo0TVzH1d7m8qUbiTfYbPFttJpEChz
X-Gm-Message-State: AOJu0Yxr8CIeoz5umXHPOJEge2r8hIdiGGwX22lMmKTIZwC5mkFiRPUF
	vhEZmaKClub9LX7+ZJp/KYxekQqFKv6Fkpe7//zQvXry+3rzZeAMaGTnAxHQaIZFy9khhk6/AUT
	eM0IHhTht4A==
X-Google-Smtp-Source: AGHT+IFbYtXNPHY4Pw0FRa6rRjfHtPjWM7CA5XFPN+LXvpcfxkrH7JF+YaAawTMCM5hKGPwKQTJAsq2tclvKYg==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a05:6902:2b0a:b0:dff:83e:b259 with SMTP
 id 3f1490d57ef6-e0304040464mr362430276.6.1719378509753; Tue, 25 Jun 2024
 22:08:29 -0700 (PDT)
Date: Wed, 26 Jun 2024 05:08:18 +0000
In-Reply-To: <20240626050818.2277273-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240626050818.2277273-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240626050818.2277273-5-jiaqiyan@google.com>
Subject: [PATCH v6 4/4] docs: mm: add enable_soft_offline sysctl
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: jane.chu@oracle.com, rdunlap@infradead.org, ioworker0@gmail.com, 
	muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the documentation for soft offline behaviors / costs, and what
the new enable_soft_offline sysctl is for.

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index e86c968a7a0e..71463a7b3e2a 100644
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
@@ -267,6 +268,37 @@ used::
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
+- For a page that is part of a transparent hugepage, soft-offline splits the
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
+memory pages.  When set to 1, kernel attempts to soft offline the pages
+whenever it thinks needed.  When set to 0, kernel returns EOPNOTSUPP to
+the request to soft offline the pages.  Its default value is 1.
+
+It is worth mentioning that after setting enable_soft_offline to 0, the
+following requests to soft offline pages will not be performed:
+- Request to soft offline pages from RAS Correctable Errors Collector.
+- On ARM, the request to soft offline pages from GHES driver.
+- On PARISC, the request to soft offline pages from Page Deallocation Table.
 
 extfrag_threshold
 =================
-- 
2.45.2.741.gdbec12cfda-goog

