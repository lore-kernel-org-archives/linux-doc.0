Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C074BE0
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608403; cv=none; b=gJ99DqfRY0SUCMpjE2EG/Xvtjdm6oRV5ewJMEuI44MJrTrslCIXLXzqfCk52X4WAmDEwaqH37S8LoERen1dewsZfvbIpTcunC9uqO6KxCRBAXJoiJiMDccXCH0tLv7ESIRLjb0bX53vZKcpidMTdXZsusqf9Y/nFvYZNpaZi2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608403; c=relaxed/simple;
	bh=UAPqb+JNmQrB49up25N8O7cnzwrMhoXoMbtq6J/VFLs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rKl0kWyx2mjCP3+LXpcPH+0QMu6PHlmW7LjtQeL1ec+TOy4hILGdb0ignddC5u0wxN9M+1TJsd4G92rqrcbWyC76mfyaah1E8GrkOsGqTh6IgvhM0eM+CmOnGgJJX0KrYmPdln0Ud9zx58ftrv2Y2Cla+bb6ZfzGEN8aG702fqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G1KUlgCA; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G1KUlgCA"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-64507372362so20140897b3.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719608401; x=1720213201; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H9SemWeck9sqZhF4PUkpmqs6CWCt5ZKMH0k65qfYp1Y=;
        b=G1KUlgCACJUHtii6tGiKYUpcWUhM4r5wfNb5Szwf3XQc75Y4YD5L7zyFOwpxG9A2sw
         fpJpz+uoa4Ufz0yUQmqQnOXJCtWX7elHkVtftaDnloc2XJOJ3YB8xMD7cC+C27/MwM5j
         FefJZKCVZTCul2jStJgkye6BVvZpEB95oHC51aPrgKt5fpEOmLh/EMy0oZLZotX4ri0c
         YV3wj85bgYzeDWl6bbT1Vav7FLO/6VzVmVjS75+5AF7tx4PDr3jl1ayevmb1b1RUad+Y
         Ncl9KFHs/YsKZ66+95K6/cTj/maFkUGUUY5Hlmc96TA7iJ/xFCtXLm+0s95OBNvQoist
         Zfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608401; x=1720213201;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9SemWeck9sqZhF4PUkpmqs6CWCt5ZKMH0k65qfYp1Y=;
        b=sji12SWUbrl/nqxwZM9bT/uKygnDypIMLla0hEdsMyJxGYlu/KqntoQ0h+8eIhDN1F
         po4cesiPOBhLCkUHFEPk48HGv5c9eY7c6xDtpyl/bgFZskFc3awTXkZej22zB9GZjc73
         RKhzYNNnp2z0+aNDRp2ph0dFMj//VLu59RDtehG47M7yiVSuEpVM0We5WA/I+yfZLFs1
         28YGjtqPP5cBhGkSAK5kp8ccgs9/YIRGwtmsEm822BP1oIGf9jW56OQnuKsfAlw7aQ2D
         k9OKQkxnyB0bHL4xE97yHF20mKBkMZELGYjXlKNzQD9XDaTJe5UOgTE3Jtdv5wHMoT8r
         BLIA==
X-Forwarded-Encrypted: i=1; AJvYcCXEDGRdQEnWM+uaBre3+Jo2G6HGTKzV+ivwhOG659WBbWQhTnJcsIGgG4KaN3wAYKFN7OYIunyfwnS5cD3FtmVGKZzTFnap4+q3
X-Gm-Message-State: AOJu0YybOQ+i0DZPmXi+ad9PucfS5Uk45QghXcq7O30ztDZ9LSwgEeUI
	08f4lK3fkk64AOqlOWdAKXMCopH80C7jvbOVCNOqSTNU1cOO8I78lJKCCEmmc7P5OJbE0wWU41d
	zh8rcUHMUhg==
X-Google-Smtp-Source: AGHT+IHuT2gN9XPtmf5SVn4cA59errpT4hxsDy5JZE1D+/oWILvq0fkQTnieruKPvX36J5LvENb5Muq2Vr+jNQ==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a05:690c:e:b0:62a:4932:68de with SMTP id
 00721157ae682-6429d26f55emr814727b3.8.1719608401004; Fri, 28 Jun 2024
 14:00:01 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:59:54 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628205958.2845610-1-jiaqiyan@google.com>
Subject: [PATCH v7 0/4] Userspace controls soft-offline pages
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: jane.chu@oracle.com, ioworker0@gmail.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, shuah@kernel.org, rdunlap@infradead.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, ak@linux.intel.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jiaqi Yan <jiaqiyan@google.com>
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
v6 => v7
* incorporate feedbacks from Miaohe Lin <linmiaohe@huawei.com> and David
  Rientjes <rientjes@google.com>
* remove PFN value from enable_soft_offline log
* save/restore enable_soft_offline in run_vmtests.sh
* v7 is based on commit 7c89bdbd3778 ("khugepaged: simplify the
  allocation of slab caches")

v5 => v6:
* incorporate feedbacks from Miaohe Lin <linmiaohe@huawei.com>
* add a ':' in soft offline log.
* close hugetlbfs file descriptor in selftest.
* no need to "return" after ksft_exit_fail_msg.

v4 => v5:
* incorporate feedbacks from Muhammad Usama Anjum
  <usama.anjum@collabora.com>
* refactor selftest to use what available in kselftest.h

v3 => v4:
* incorporate feedbacks from Miaohe Lin <linmiaohe@huawei.com>,
  Andrew Morton <akpm@linux-foundation.org>, and
  Oscar Salvador <osalvador@suse.de>.
* insert a refactor commit to unify soft offline's logs to follow
  "Soft offline: 0x${pfn}: ${message}" format.
* some rewords in document: fail => will not perform.
* v4 is still based on commit 83a7eefedc9b ("Linux 6.10-rc3"),
  akpm/mm-stable.

v2 => v3:
* incorporate feedbacks from Miaohe Lin <linmiaohe@huawei.com>,
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

Jiaqi Yan (4):
  mm/memory-failure: refactor log format in soft offline code
  mm/memory-failure: userspace controls soft-offlining pages
  selftest/mm: test enable_soft_offline behaviors
  docs: mm: add enable_soft_offline sysctl

 Documentation/admin-guide/sysctl/vm.rst       |  32 +++
 mm/memory-failure.c                           |  37 ++-
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   1 +
 .../selftests/mm/hugetlb-soft-offline.c       | 228 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   6 +
 6 files changed, 297 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/mm/hugetlb-soft-offline.c

-- 
2.45.2.803.g4e1b14247a-goog

