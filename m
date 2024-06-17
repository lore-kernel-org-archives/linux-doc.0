Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF7168496
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643953; cv=none; b=nZUHjBlfjCb4nk5psRX1EZ9GF9/twU4j2WdI0PXTckzHLnv7tE17bp6w/i8fD4Cy/ZIc6o7Tgl66XpMU6V/Pn21tthf83m5B6YaKqjcA4HBD9y6Z1AmLnlswCdjQzHB/pW+vCh6ATqw/szkz9kxKUXdosFL69HF7+xqWwkqNqjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643953; c=relaxed/simple;
	bh=Gu8A9AYfgQC1Aigf7qPqEvA6BpX8DMbjCBO1dWkHLIo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n/XQpB25CV+Jl+er7nhQl1EJBcLbQEy//FOgaQY9jITpZcFL5sFZPz84D5+QY6aelbLgEBYEbTG3CJx1txZ9vfx4/CLafrNptrU3fceJbxuyVO4wK+Y6BBcR/XYhu6kG09r63hFFwt7nh8vzTK4vr9S8ZMSUFv1qWFoU7ZIMsug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0RdWoolO; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0RdWoolO"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dff166b6847so5571179276.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718643951; x=1719248751; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KM/EmQyPzaIKRRU3lBo3RyHuJehGBp5I0jJwxKmg0Wk=;
        b=0RdWoolOyTr2rR0rNjs5Rn+57riblyZXTsiW6IOlAVZnbzL8sfVmGjEn0b0+ZaB8cI
         CDTS+PFP6sQpLeFnhb5KahUt/pb9o4Bvfa60bwZZrmo2D0Yspr8htd+czYSVYwVPZ1zM
         ERbQscjhRY5TcPnzX3hHNy5GmJB147BRT+UipDP2Oci+bhiX26i4MjPhtgp8CNwnEZGU
         xrwpTz1JCizMx+r0JzLzAuPe0sRQdOdJZb/O5LQvJodUzx/CDVQpITy/VZNiI9RNu8AX
         1Czns6ngu2eAPrOO+wH32CjeyqcPA+AHH+dRy48azTSlH/P8uPrdjvUg1RG4V9TpNa7W
         kd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643951; x=1719248751;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KM/EmQyPzaIKRRU3lBo3RyHuJehGBp5I0jJwxKmg0Wk=;
        b=tWGyF2zdBzxCjPu9iQtrcLhVttLthd1TvkcSB6XNNjGkP28zHR8Yl3UqJWD7QM8JGC
         CfxH2oSOU6DXA9FcOdcM2Apfgv6bMq00tkMAY+SLb223e8iwU4zrT//QaChW1DidJoj1
         ow+Lunkiyr0KukuGRxVRBltw0nCwzpZyl7uhcJMZFoZ2l7eSmE1Sug31gMxQFKU/SUVw
         my7oAkIPbEt3HITBvBJJ7/6HQ+lPd4bgQFATsQaVPSxGPXsXD29Rw7S/KExlDDXET51U
         Ex3/+TgsYIsV1lOr6GBmWyQbTDVjEuqgu39HnQFbk7tnmPpy+giVvEqNfFppkZYGW+nx
         ppZg==
X-Forwarded-Encrypted: i=1; AJvYcCXDP5SYbPS3Vmh8IG9T8VxMtbBmY9lbHg5IVPLl0AZ6Lhg9r61QhetxKgAORFnbw+MvtPzFLJ0hiwVONits8TS2TflOLlLIyXGR
X-Gm-Message-State: AOJu0YzGcTcVWrXFlCrAMB1mL1XTQcDLcyT4kG1C6Yy08sffham4RzCS
	ACPz8Z6fpdf0wQr7AkxRawtDpGsWejTxD+JxeGYQLIrt5A5xBPxZQZvjDVDQ3xUU30S5T6/Yz3T
	qKke5yvUTxQ==
X-Google-Smtp-Source: AGHT+IE6i7AwPAxo0OUUZFk9HFUB3axExctM9lLZOhHsVMPD9MZ5+BUeIdWtDZUhg3QZQeglebomfhWpC7C7uw==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a05:6902:1242:b0:dff:2d92:d952 with SMTP
 id 3f1490d57ef6-dff2d92e760mr569722276.9.1718643950758; Mon, 17 Jun 2024
 10:05:50 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:05:43 +0000
In-Reply-To: <20240617170545.3820912-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617170545.3820912-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617170545.3820912-2-jiaqiyan@google.com>
Subject: [PATCH v3 1/3] mm/memory-failure: userspace controls soft-offlining pages
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	ioworker0@gmail.com
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Correctable memory errors are very common on servers with large
amount of memory, and are corrected by ECC. Soft offline is kernel's
additional recovery handling for memory pages having (excessive)
corrected memory errors. Impacted page is migrated to a healthy page
if it is in-use; the original page is discarded for any future use.

The actual policy on whether (and when) to soft offline should be
maintained by userspace, especially in case of an 1G HugeTLB page.
Soft-offline dissolves the HugeTLB page, either in-use or free, into
chunks of 4K pages, reducing HugeTLB pool capacity by 1 hugepage.
If userspace has not acknowledged such behavior, it may be surprised
when later failed to mmap hugepages due to lack of hugepages.
In case of a transparent hugepage, it will be split into 4K pages
as well; userspace will stop enjoying the transparent performance.

In addition, discarding the entire 1G HugeTLB page only because of
corrected memory errors sounds very costly and kernel better not
doing under the hood. But today there are at least 2 such cases
doing so:
1. GHES driver sees both GHES_SEV_CORRECTED and
   CPER_SEC_ERROR_THRESHOLD_EXCEEDED after parsing CPER.
2. RAS Correctable Errors Collector counts correctable errors per
   PFN and when the counter for a PFN reaches threshold
In both cases, userspace has no control of the soft offline performed
by kernel's memory failure recovery.

This commit gives userspace the control of softofflining any page:
kernel only soft offlines raw page / transparent hugepage / HugeTLB
hugepage if userspace has agreed to. The interface to userspace is a
new sysctl at /proc/sys/vm/enable_soft_offline. By default its value
is set to 1 to preserve existing behavior in kernel. When set to 0,
soft-offline (e.g. MADV_SOFT_OFFLINE) will fail with EOPNOTSUPP.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 mm/memory-failure.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index d3c830e817e3..9eb216ed0b86 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -68,6 +68,8 @@ static int sysctl_memory_failure_early_kill __read_mostly;
 
 static int sysctl_memory_failure_recovery __read_mostly = 1;
 
+static int sysctl_enable_soft_offline __read_mostly = 1;
+
 atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
 
 static bool hw_memory_failure __read_mostly = false;
@@ -141,6 +143,15 @@ static struct ctl_table memory_failure_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
+	{
+		.procname	= "enable_soft_offline",
+		.data		= &sysctl_enable_soft_offline,
+		.maxlen		= sizeof(sysctl_enable_soft_offline),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	}
 };
 
 /*
@@ -2746,8 +2757,9 @@ static int soft_offline_in_use_page(struct page *page)
  * @pfn: pfn to soft-offline
  * @flags: flags. Same as memory_failure().
  *
- * Returns 0 on success
- *         -EOPNOTSUPP for hwpoison_filter() filtered the error event
+ * Returns 0 on success,
+ *         -EOPNOTSUPP for hwpoison_filter() filtered the error event,
+ *         -EOPNOTSUPP if disabled by /proc/sys/vm/enable_soft_offline,
  *         < 0 otherwise negated errno.
  *
  * Soft offline a page, by migration or invalidation,
@@ -2783,6 +2795,12 @@ int soft_offline_page(unsigned long pfn, int flags)
 		return -EIO;
 	}
 
+	if (!sysctl_enable_soft_offline) {
+		pr_info("%#lx: OS-wide disabled\n", pfn);
+		put_ref_page(pfn, flags);
+		return -EOPNOTSUPP;
+	}
+
 	mutex_lock(&mf_mutex);
 
 	if (PageHWPoison(page)) {
-- 
2.45.2.627.g7a2c4fd464-goog

