Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FA419E7C2
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246840; cv=none; b=DRCSvYcEioptRVDOS8Y91Q6M20tOZ2WapoRZrFv+gGzaKGp9VzKG0suHjwGZSHC0iVBZCOHhHDAme1hSDqtHvMotGGEHxnwDzqFnf64A5HONN8WblOobODr/cZRzgfJyeYLplYAPUQhpWpfSRwVa5ChtElD+N9TWut6cob7CO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246840; c=relaxed/simple;
	bh=7Wo1vdpRujfwVa5E2lZDEmMHiqeYmjrjdL5DzTInIks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xy2B5ZKUYO55hMd4H6QczkI5hk5EMT/lFce/5xeiJickNeyXOF8iJXvcewRdCoGmonwH4gt/WE2zvEgFA5xlAA3bcpPsQoKNLCx9txOywnqBfFQyw/V4eDSXDXEtUidAjxKVa0jDKrsAMJjiHqSYdOfVm8dKkL+Lz1iHbANe+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zNAKiJWR; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zNAKiJWR"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1f733390185so39421645ad.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719246838; x=1719851638; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GVvAVLVgyp7BPn3YqnrE+Un4CdtD1Zv3a2093D82WyY=;
        b=zNAKiJWRrdiyMLcRtS9CEAPvNDVlwcMAU4MbzbBKU9uiSTu+/hgU1K4WcLc+7VEtXG
         E9s+XDKLBrFmHqG14TD9iVDtkOxr1kZ8KnbNWeDxXhL9wcL8YH9lTi8TJ6GTWtRonNkJ
         8GPMnhdGp0WoTSLbdTGPQpiAqNDanbJn9dajd8JF4g/h+UvEXaYyFza/QWaWWdfuOtUS
         76guww4d5ehYg3CSJgBSb4S/zEvb5eksfwAODnml17yZB2l/DHhc4axqxm9eVA7oqlhY
         Ejl5XdXhWnzqYFCjgCmnA9gZWU6OBvoD2xLChuE23L9jtXxo6KwwxY0kHq08TOkId0lF
         xkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246838; x=1719851638;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVvAVLVgyp7BPn3YqnrE+Un4CdtD1Zv3a2093D82WyY=;
        b=ZvAd5d4+DpZZyC3wGb1XubH/gmF1p473O3oYNz+qAzewARw+SmtryupZNwVZIiuI1u
         jg0jcDXHq5ED2KBUCqdDRXtkWTVkBTlvFxXIsRAhAmdzBoHtZf5r66AImYH4Gt8ywDDt
         NYFXLeeLuboqUDrXtHmexf9xvQ90dUSs0hGyKdoQHIRSHgScz4VgKnLiSq8MG01202C/
         OO+2tv/qy4rig+Rg0X1rEilkWGs26yzuH6aF6TLUGH/2V+TWTjWC2CWwNrqJ1i7O1muK
         ComNDwWQL07CF6PHopOS2PTSPzkpFqfmho77NoPjaijAnKjeyryf94CkpmwPprhWlG1D
         KRtA==
X-Forwarded-Encrypted: i=1; AJvYcCUhVEU473so7j6nOB61jHbIgptlrHOJVZ+2qbE0LlnrRUnFaMm9udJqDkopfziPBQE1I8mqpYKv+PZ5q7JQeFElm2Pn+0dADyn4
X-Gm-Message-State: AOJu0YzuaKY7JnJpqqGxlfdKaSLNv7cXDzjVcRRIX979zg5upF2vMebD
	9GdHNzoUQWhztcC0f8Pz5aE/8N1YTwksAM0rDFP1ji4UZhrh1RF/I5WUesSLMoIAyuj7AsK9oTD
	0Cuu7jJ3mXw==
X-Google-Smtp-Source: AGHT+IFQ03M3aTRppiNCfLsuYEASJusj+ybeUo8fprfJ1Y1kR44v8CZCgZBXMkKg6JbKjrrKoR1HPHTKxUnd6g==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a17:902:e74c:b0:1f9:c823:d3 with SMTP id
 d9443c01a7336-1fa1d516b81mr196425ad.6.1719246837884; Mon, 24 Jun 2024
 09:33:57 -0700 (PDT)
Date: Mon, 24 Jun 2024 16:33:48 +0000
In-Reply-To: <20240624163348.1751454-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240624163348.1751454-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624163348.1751454-5-jiaqiyan@google.com>
Subject: [PATCH v5 4/4] docs: mm: add enable_soft_offline sysctl
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

Acked-by: Oscar Salvador <osalvador@suse.de>

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
+It is worth mentioning that after setting enable_soft_offline to 0, the
+following requests to soft offline pages will not be performed:
+- Request to soft offline pages from RAS Correctable Errors Collector.
+- On ARM, the request to soft offline pages from GHES driver.
+- On PARISC, the request to soft offline pages from Page Deallocation Table.
 
 extfrag_threshold
 =================
-- 
2.45.2.741.gdbec12cfda-goog

