Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4BE3A4AD4
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409013; cv=none; b=BbvwxuGwhsixOYMiJrsJ/dYPpuvYGqvDD0IZ+C1o78DcCabkzGJVewFVTfT5bjaMQZvc7V3bWpfnnRgkHpJg5gBwKa5mnaiwxrFYmGXzBYCbyBsm3gsTbc+xtBC9hH2Gx1WZMz01ST+8uN2ZlmbKoBBo2+jy4HLCntUelqztmFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409013; c=relaxed/simple;
	bh=dXh2ayx+79QFmMkjaJ3fx+VU7Efs17lwo3jymxpelrw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NNhzAaoaD/l4bdjkq8Mepk62RJWMY1dJc00yTJQ6nkyeYys5hg1ycn/emumpRS/y0g2z75CV81AQzwL804Ls5VjOu+9l/lfDMDoh3Re9TXSi+KHo5aI1Uck4cXIoCUQ+bhf7u/BVwaHsXRdJNyKbAU++PhCFC4KXjp7vewMJWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jxkn+zFE; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jxkn+zFE"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-432db1a9589so33098f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768409010; x=1769013810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptbGfqhARAg/OJu3oyRxs8/LiGbyPAv+mElQ7v4+SEE=;
        b=jxkn+zFEX4wqkCL028YMr8Tb4x07CF2YDV/spkm027HK3h0ioFF7fKRgFZ7KLre9h7
         FAo+4GXiHHFkPosauFoIRkZGYA3cDKNEtUErtxXixH4xH2NQxws7uNXJQ8czeqDKCSzi
         fFcPDstRn0Cs7LuUtqtuOnN16IS13/XIl5U0a1kdwwmOGqG+iVndq93RAaYTeI7ROquG
         DUxWEGn8oioitqNIdcBpyj5/VMixecd0DYYO+34i08lsqWIk+xm53BN/J7Fs/p9YvR23
         nTgWwtYUlfNNRZjKJvIl1qxxzj0s6GLHy1UBWrMCMEL8figz/veQk1DsDOzWRrwwLz9B
         r8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409010; x=1769013810;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptbGfqhARAg/OJu3oyRxs8/LiGbyPAv+mElQ7v4+SEE=;
        b=hBPf+a3rHZhW6tomyOwpISL+glENCi0Txeh81Mr8KJpPzofpNob/6COvjkcyla+zcG
         UUUob7vif90O77chq0guVXV5dtDS/4rMoK/1ldKiz4zZsy05fRzS7BXjOmjVxSKskZ59
         qxG5Rg8ifYALoOVr9mscoHvPJS/N/hwwp/vLpWCVJDq1KFSMfkIZldyLzJmpCVRo87P+
         ku/vRu/5BCU5CaE6yoxeRHRZOWvpCKvtaYyI/RbiW68IjeRzjiGZ05G6g2rsqIWnAiVW
         mbiMDtIrym8p7MzefTLBdDZz7WczjhMk9CxJQpbAZxeO7BWYEk+p/sSXMFQzQ7j0k2zz
         fdng==
X-Forwarded-Encrypted: i=1; AJvYcCWtEToyt3f+oljBtwyE2QMGHxm0QdYKn9YE6Ckx3CzICcjNpypfna5veKpmQWeauG0YVtKNkxbO6uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnPW0m2RxsM6uks80iCOkn2VHJ7ODRzbLOcCGIFTCnHXdphmB2
	tX5fn5zrC88KLvobbk85q3s/C7Jq7yZgnBOLIuV/0SmtCB9D10FNlhpotSfFFjf1iJAGTYiNChy
	zwx4KoFGLAvyG8A==
X-Received: from wmbem10.prod.google.com ([2002:a05:600c:820a:b0:479:3624:3472])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0f:b0:477:73cc:82c2 with SMTP id 5b1f17b1804b1-47ee32fcef4mr41658405e9.9.1768409009960;
 Wed, 14 Jan 2026 08:43:29 -0800 (PST)
Date: Wed, 14 Jan 2026 16:43:17 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260114164322.787125-1-smostafa@google.com>
Subject: [PATCH v7 0/5] iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Overview
--------
This patch series introduces a new debugging feature,
IOMMU_DEBUG_PAGEALLOC, designed to catch DMA use-after-free bugs
and IOMMU mapping leaks from buggy drivers.

The kernel has powerful sanitizers like KASAN and DEBUG_PAGEALLOC
for catching CPU-side memory corruption. However, there is limited
runtime sanitization for DMA mappings managed by the IOMMU. A buggy
driver can free a page while it is still mapped for DMA, leading to
memory corruption or use-after-free vulnerabilities when that page is
reallocated and used for a different purpose.

Inspired by DEBUG_PAGEALLOC, this sanitizer tracks IOMMU mappings on a
per-page basis, as it=E2=80=99s not possible to unmap the pages, because it
requires to lock and walk all domains on every kernel free, instead we
rely on page_ext to add an IOMMU-specific mapping reference count for
each page.
And on each page allocated/freed from the kernel we simply check the
count and WARN if it is not zero, and dumping page owner information
if enabled.

Concurrency
-----------
By design this check is racy where one caller can map pages just after
the check, which can lead to false negatives.
In my opinion this is acceptable for sanitizers (for ex KCSAN have
that property).
Otherwise we have to implement locks in iommu_map/unmap for all domains
which is not favourable even for a debug feature.
The sanitizer only guarantees that the refcount itself doesn=E2=80=99t get
corrupted using atomics. And there are no false positives.

CPU vs IOMMU Page Size
----------------------
IOMMUs can use different page sizes and which can be non-homogeneous;
not even all of them have the same page size.

To solve this, the refcount is always incremented and decremented in
units of the smallest page size supported by the IOMMU domain. This
ensures the accounting remains consistent regardless of the size of
the map or unmap operation, otherwise double counting can happen.

Testing & Performance
---------------------
Earlier versions were tested on Morello with Arm64 + SMMUv3
This version was tested and benchmarked on Lenovo IdeaCentre X Gen 10
Snapdragon.

With dma_map_benchmark, tested on both SMMUv3 and SMMUv3, where:

CONFIG refers to "CONFIG_IOMMU_DEBUG_PAGEALLOC"
cmdline refers to "iommu.debug_pagealloc"
Numbers are (map latency)/(unmap latency), lower is better.

SMMUv3:
echo dma_map_benchmark > /sys/bus/pci/devices/0005\:01\:00.0/driver_overrid=
e
echo 0005:01:00.0 >  /sys/bus/pci/devices/0005\:01\:00.0/driver/unbind
echo 0005:01:00.0 > /sys/bus/pci/drivers/dma_map_benchmark/bind
./dma_map_benchmark -t $threads -g $nr_pages

			CONFIG=3Dn    CONFIG=3Dy    CONFIG=3Dy
			            cmdline=3D0   cmdline=3D1
4K - 1 thread		0.0/1.8     0.0/1.8     0.1/1.9
4K - 8 threads		0.2/6.2     0.2/6.1     0.3/6.8
1M - 1 thread		0.5/54.3    0.5/54.4    6.7/74.4
1M - 8 threads		1.2/339.7   1.1/340.9   10.5/331.7


SMMUv2:
echo dma_map_benchmark > /sys/bus/platform/devices/ac0000.geniqup/driver_ov=
erride
echo ac0000.geniqup >  /sys/bus/platform/devices/ac0000.geniqup/driver/unbi=
nd
echo ac0000.geniqup > /sys/bus/platform/drivers/dma_map_benchmark/bind
./dma_map_benchmark -t $threads -g $nr_pages

			CONFIG=3Dn    CONFIG=3Dy    CONFIG=3Dy
			            cmdline=3D0   cmdline=3D1
4K - 1 thread		0.6/3.9     0.6/3.9     0.7/4.0
4K - 8 threads		1.0/19.6    1.0/19.7    1.1/19.9
1M - 1 thread		61.8/372.0  61.8/374.9  68.1/396.7
1M - 8 threads		89.4/1470.5 89.9/1362.9 100.3/1373.3

Changes in v7:
v6: https://lore.kernel.org/linux-iommu/20260109171805.901995-1-smostafa@go=
ogle.com/
- Add a new function page_ext_get_phys() and use it instead of
  pfn_valid() + phys_to_page().
- Drop R-bs on patch 4.

Changes in v6:
v5: https://lore.kernel.org/linux-iommu/20260106162200.2223655-1-smostafa@g=
oogle.com/
- Remove wrong logic for handling unmap with bigger size than requested
  and warn instead.
- Collect R-bs and Acked-by

Changes in v5:
v4: https://lore.kernel.org/all/20251211125928.3258905-1-smostafa@google.co=
m/
- Fix typo in comment
- Collect Baolu R-bs

Main changes in v4:
v3: https://lore.kernel.org/all/20251124200811.2942432-1-smostafa@google.co=
m/
- Update the kernel parameter format in docs based on Randy feedback
- Update commit subjects
- Add IOMMU only functions in iommu-priv.h based on Baolu feedback

Main changes in v3: (Most of them addressing Will comments)
v2: https://lore.kernel.org/linux-iommu/20251106163953.1971067-1-smostafa@g=
oogle.com/
- Reword the Kconfig help
- Use unmap_begin/end instead of unmap/remap
- Use relaxed accessors when refcounting
- Fix a bug with checking the returned address from iova_to_phys
- Add more hardening checks (overflow)
- Add more debug info on assertions (dump_page_owner())
- Handle cases where unmap returns larger size as the core code seems
  to tolerate that.
- Drop Tested-by tags from Qinxin as the code logic changed

Main changes in v2:
v1: https://lore.kernel.org/linux-iommu/20251003173229.1533640-1-smostafa@g=
oogle.com/
- Address J=C3=B6rg comments about #ifdefs and static keys
- Reword the Kconfig help
- Drop RFC
- Collect t-b from Qinxin
- Minor cleanups

Mostafa Saleh (5):
  mm/page_ext: Add page_ext_get_phys()
  iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
  iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
  iommu: debug-pagealloc: Track IOMMU pages
  iommu: debug-pagealloc: Check mapped/unmapped kernel memory

 .../admin-guide/kernel-parameters.txt         |   9 +
 drivers/iommu/Kconfig                         |  19 ++
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/iommu-debug-pagealloc.c         | 169 ++++++++++++++++++
 drivers/iommu/iommu-priv.h                    |  58 ++++++
 drivers/iommu/iommu.c                         |  11 +-
 include/linux/iommu-debug-pagealloc.h         |  32 ++++
 include/linux/mm.h                            |   5 +
 include/linux/page_ext.h                      |   6 +
 mm/page_ext.c                                 |  27 +++
 10 files changed, 335 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
 create mode 100644 include/linux/iommu-debug-pagealloc.h

--=20
2.52.0.457.g6b5491de43-goog

