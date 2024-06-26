Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE113D635
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 05:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719378508; cv=none; b=mGZb+nx49Zj5rbkWB4pC5yqN8YChOFbTJ3a29C9HNq7PQfb2S1bwp6+EojFLExyRgyuj3sWvxsZ1CQbiOPxQzUmi0K0oxiNTzWfbFjZHC12QkwEnoKftUUJjwWarar3kpr1Qd519hXbWBh9DS1sCKBCgjthcH3ctZZfLOg89K3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719378508; c=relaxed/simple;
	bh=tcIp/UGK2HdcAnbgBr6MhQluLLHq7D2d16NFgsGLSeo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=raIJvsiUB+hzrRmop8n5UExlzqeKeTMeOFmzks8p4NrUUTTxAw1GWK1sF8fWWVkKeE4xfBo8IGiF11gBJyp4w5pYx2r/ufeeSf2zSPBGT14/rXWJP3L4HN4rXnUDZ3QIIF10OKXerjqIZo6HRUtsJCv8dF0zdivlygojikTzGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tD6mwDII; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tD6mwDII"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1f9db3192d8so2133035ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719378506; x=1719983306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8y7ao8RcoBqL0KFdl8TvipShcb1ljHNHWsgFR/lOgAk=;
        b=tD6mwDII32F5R37XRlpACf9z4VlwpYscfjH6GhdnN1xWUiIe8KlC//CwxeVyGsr328
         v6jV0vN8m5fK8FX2A7n6aqyuT09Mi5ft33l+xNHeYsIhR+Wf7yrW4KFiDN0B3ObffEHx
         nluxkP2NIFtBujVqQvDIPSeEXct3jpVB2C68REfWj0h4uVdedVG15Fye/NQDotNDJixA
         3R0mG1hC3N9pPY3fs1+hpvesxcaLjlTLqNS+jEmznmXshf5Jom+mv149VOlfDV6mHB2M
         3pCwjwTOCnRWzbYEtTiMbc9hXxcqN83EUtwa05+fYWhRbuhB4fuz/c0NUFZwKupSRyDR
         7JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719378506; x=1719983306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8y7ao8RcoBqL0KFdl8TvipShcb1ljHNHWsgFR/lOgAk=;
        b=f8pquKKi0SGWk9Zw+UcBV0Ehv8MTly+KYCFOHbz236EdrSlf+k3opc8oYHth01qM3V
         uZoMwY22/nloWDVqQhuTYmsUJzA2e2/IA9zih5SKKjvXuioKF1ndsA5vtKSqnML7eefU
         WdE+7AZ/EOFkX+6sfNWHwuUzkE1HQx9ROQGIJ3tiAdnba8getAZu6U9E+HVHwQD2aZCI
         buy6JFMCi3lBtFgglB0/LzrS0cl4851yy14SfTqKtSQVCCQ3Zk4zBHW7SqDTLF4Y7Pg2
         P3+9iVkdLPQIjjsHhJ+PwzK0AalhwJjaoeomje9W/iv03hmoCqQEx7+bw+il4BpJ5Fpz
         SI/w==
X-Forwarded-Encrypted: i=1; AJvYcCX+T0Vhzx6BJsjt+myKF70MtrPdfr+diAQVhLvsLV6auOojxOiUBBKDdOozHmhSmqbMHxbyZ6C3ehd/dI68d8qxGC33EpG4bPc8
X-Gm-Message-State: AOJu0Yy490Jir4zmzKYPgB6bdhIu9knXEwaOPbvt0/lnAZ5DI+gKHjTv
	hZ9ojiDwkPwla3n0NECLLAHTMrBY0EPgPJ/G5R56UgZt6azMsR7/uti9N3kEzeMO1GtLj7x07mH
	na4xILh6a5Q==
X-Google-Smtp-Source: AGHT+IFMw6f7MOlDWfVepmO+C1PVKVXo4zQODjs53YFlJ2c1BkCfmt+eu9ZUoQDtHFkvUJpUimIn1RfCeGhwow==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a17:902:eccb:b0:1f9:cc3c:9dc with SMTP id
 d9443c01a7336-1fa104968e4mr4123865ad.5.1719378506297; Tue, 25 Jun 2024
 22:08:26 -0700 (PDT)
Date: Wed, 26 Jun 2024 05:08:16 +0000
In-Reply-To: <20240626050818.2277273-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240626050818.2277273-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240626050818.2277273-3-jiaqiyan@google.com>
Subject: [PATCH v6 2/4] mm/memory-failure: userspace controls soft-offlining pages
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: jane.chu@oracle.com, rdunlap@infradead.org, ioworker0@gmail.com, 
	muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Correctable memory errors are very common on servers with large
amount of memory, and are corrected by ECC. Soft offline is kernel's
additional recovery handling for memory pages having (excessive)
corrected memory errors. Impacted page is migrated to a healthy page
if inuse; the original page is discarded for any future use.

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
1. when GHES driver sees both GHES_SEV_CORRECTED and
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

Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 mm/memory-failure.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 6f5ac334efba..1559e773537f 100644
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
@@ -2749,8 +2760,9 @@ static int soft_offline_in_use_page(struct page *page)
  * @pfn: pfn to soft-offline
  * @flags: flags. Same as memory_failure().
  *
- * Returns 0 on success
- *         -EOPNOTSUPP for hwpoison_filter() filtered the error event
+ * Returns 0 on success,
+ *         -EOPNOTSUPP for hwpoison_filter() filtered the error event, or
+ *         disabled by /proc/sys/vm/enable_soft_offline,
  *         < 0 otherwise negated errno.
  *
  * Soft offline a page, by migration or invalidation,
@@ -2786,6 +2798,13 @@ int soft_offline_page(unsigned long pfn, int flags)
 		return -EIO;
 	}
 
+	if (!sysctl_enable_soft_offline) {
+		pr_info_once("%#lx: disabled by /proc/sys/vm/enable_soft_offline\n",
+			pfn);
+		put_ref_page(pfn, flags);
+		return -EOPNOTSUPP;
+	}
+
 	mutex_lock(&mf_mutex);
 
 	if (PageHWPoison(page)) {
-- 
2.45.2.741.gdbec12cfda-goog

