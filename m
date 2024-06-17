Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B313AD1E
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643952; cv=none; b=rtFXr28W8BY77JzORnT6jLcXlBi4YuLg8GGaRl2opo9w8PPkKxsLtPveRqhmA7+PJtCgTwNJ5c4nTyKSnEgqhj3XbC0sjsGYwtSE1S6vWFz7mDcQ/6Jrs9h7J61akOw4H2qtKLvPFQ6YLTQtGBd4h7Qowsny08In6PH+MbiisPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643952; c=relaxed/simple;
	bh=nrb8VcEEmqzCZY0AyheJ4dwjXJaxNn/pRIAkPqq0mIc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oEOXs4MTXCj43zuWrtNQIw9eR+rZwGJGcYkzKHc+cSOZxfZchrcth3CKGySHsBMhpp0Q2Uo/0HQ0eDu5MUB3fgN2Pbwap5RTzo29UBEjgk3DTrTdiYjJUnvbgH4duDsE9kNKXKQG/nWsDOirgxmWZtfUaS5StS8UY76E5NEJvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y5Lmtqz/; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y5Lmtqz/"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-632588b1bdeso56007167b3.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718643949; x=1719248749; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v7FfUmROvXWPzNqZLzmg1Chpa3PlFFTPBJMZ6K8GE4k=;
        b=y5Lmtqz/4VmSxMQhjd9pv4F7F9RqAMcRLR5JbhOnN32Yr46WlFr52rDqxfplHzsRWl
         2r79coUO0Sw9aBZoAIXvWR4QQ1FZyRCmBMJl9GTL/qDOM99TPAjP9YhSkktbxMnNSjk+
         TRsRz2dW2j01BWTuykv3JshlpCC8qF7Aq270JjR0F7WoRaCwCx99kczhjWX1tbz8anVH
         CCsr3xfamYlV/l1ynvvRuW7MnUSUoTscHhDhVt9yXxkYJTeYpAfGNepbPkm+XiQkyp10
         5W5SDF6/ty4T1iAMGz52CC19jKKBcR27k02LqeVIP8mu+KLecSVE0tALoLMr3Ew/EtPd
         /TdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643949; x=1719248749;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7FfUmROvXWPzNqZLzmg1Chpa3PlFFTPBJMZ6K8GE4k=;
        b=qJqZ/IYhH1Qyurtmj4bcpVF6+y+LY6RMqbjxSIcd5h0rHmpxZc/NP+EHrdpVTdpqfx
         Wq6R1/8AOfPxHa/b7MJOjbRps2LYqpMh9AjBVK5ZlCFAqdAkH5Ps3s4052zqzOPwmz7t
         Mkivic7WEZfzAqTq6J7AYZYGAeJWJd5BrHNbM1WUJram1/fGYSA7l5cDB5ECH8zxCb7b
         F7ZNSoCkY6u9dfWvuS1XAKumDB386YEikqebVbtfdWnzMghw0/cOTZIvl+xWMvlZAufi
         BJ02IdjHTNd4wTFmL/lCepXwIByK5bVAfIQx13OsKmbqD82NGHU3Z9sgkr9d0JhEIsCF
         8p4A==
X-Forwarded-Encrypted: i=1; AJvYcCXEoGajIslDo7amSvdqMuUyj3jeyx5Pv05tSijBd2f/TPKZAcQI8MKVfxzkkcbcssBqvQn4k/e7DcmDVLJhrARy2WZVlDAdXF0E
X-Gm-Message-State: AOJu0YyXcy9htNTfgkBuw1wbcjr6zEJto/deo0B9CShPdpF2pAcX+HjE
	ZpKnJIcyHHrqcTekzcAlEV5UY/FpALd8HME+DRgIYAScY/5PL0xdjl3FsLQyzb70cXtezoEJydP
	cnQ47yWGZ0w==
X-Google-Smtp-Source: AGHT+IG6R2axixGQhhzTe7v99HTPI+dX+xPnuaKeod6jwj6XeI/di+Vqf4aBYtfcMff+UqyPSeISN4w3QpoWsQ==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a05:690c:4805:b0:631:9b3b:525d with SMTP
 id 00721157ae682-63222b588bdmr27182107b3.4.1718643949130; Mon, 17 Jun 2024
 10:05:49 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:05:42 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617170545.3820912-1-jiaqiyan@google.com>
Subject: [PATCH v3 0/3] Userspace controls soft-offline pages
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	ioworker0@gmail.com
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Correctable memory errors are very common on servers with large
amount of memory, and are corrected by ECC, but with two
pain points to users:
1. Correction usually happens on the fly and adds latency overhead
2. Not-fully-proved theory states excessive correctable memory
   errors can develop into uncorrectable memory error.

Soft offline is kernel's additional solution for memory pages
having (excessive) corrected memory errors. Impacted page is migrated
to healthy page if it is in use, then the original page is discarded
for any future use.

The actual policy on whether (and when) to soft offline should be
maintained by userspace, especially in case of an 1G HugeTLB page.
Soft-offline dissolves the HugeTLB page, either in-use or free, into
chunks of 4K pages, reducing HugeTLB pool capacity by 1 hugepage.
If userspace has not acknowledged such behavior, it may be surprised
when later mmap hugepages MAP_FAILED due to lack of hugepages.
In case of a transparent hugepage, it will be split into 4K pages
as well; userspace will stop enjoying the transparent performance.

In addition, discarding the entire 1G HugeTLB page only because of
corrected memory errors sounds very costly and kernel better not
doing under the hood. But today there are at least 2 such cases:
1. GHES driver sees both GHES_SEV_CORRECTED and
   CPER_SEC_ERROR_THRESHOLD_EXCEEDED after parsing CPER.
2. RAS Correctable Errors Collector counts correctable errors per
   PFN and when the counter for a PFN reaches threshold
In both cases, userspace has no control of the soft offline performed
by kernel's memory failure recovery.

This patch series give userspace the control of softofflining any page:
kernel only soft offlines raw page / transparent hugepage / HugeTLB
hugepage if userspace has agreed to. The interface to userspace is a
new sysctl called enable_soft_offline under /proc/sys/vm. By default
enable_soft_line is 1 to preserve existing behavior in kernel.

Changelog

v2 => v3:
* incorporate feedbacks from Miaohe Lin <linmiaohe@huawei.come>,
  Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>,
  and David Rientjes <rientjes@google.com>.
* release potential refcount if enable_soft_offline is 0.
* soft_offline_page() returns EOPNOTSUPP if enable_soft_offline is 0.
* refactor hugetlb-soft-offline.c, for example, introduce
  test_soft_offline_common to reduce repeated code.
* rewrite enable_soft_offline's documentation, adds more details about
  the cost of soft-offline for transparent and hugetlb hugepages, and
  components that are impacted when enable_soft_offline becomes 0.
* fix typos in commit messages.
* v3 is still based on commit 83a7eefedc9b ("Linux 6.10-rc3").

v1 => v2:
* incorporate feedbacks from both Miaohe Lin <linmiaohe@huawei.com> and
  Jane Chu <jane.chu@oracle.com>.
* make the switch to control all pages, instead of HugeTLB specific.
* change the API from
  /sys/kernel/mm/hugepages/hugepages-${size}kB/softoffline_corrected_errors
  to /proc/sys/vm/enable_soft_offline.
* minor update to test code.
* update documentation of the user control API.
* v2 is based on commit 83a7eefedc9b ("Linux 6.10-rc3").

Jiaqi Yan (3):
  mm/memory-failure: userspace controls soft-offlining pages
  selftest/mm: test enable_soft_offline behaviors
  docs: mm: add enable_soft_offline sysctl

 Documentation/admin-guide/sysctl/vm.rst       |  33 +++
 mm/memory-failure.c                           |  22 +-
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   1 +
 .../selftests/mm/hugetlb-soft-offline.c       | 229 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 6 files changed, 288 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/mm/hugetlb-soft-offline.c

-- 
2.45.2.627.g7a2c4fd464-goog

