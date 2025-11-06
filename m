Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49574322DD1
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447212; cv=none; b=Dy3bAWfIFhmr+U9I9RsN+Sshu2UY+k4VqtSKyPvFeUo5NBIlnHTzZB6VXlcfCei0pySeGqcOlP9eyahm5Y9EJ7BZG+on2D/0JfZaJSzp1rO+r3gxECuay0Og8d+pXCkKWXvGE3TDO3ZYmNb6mKnV6ooiIwR+kW3mRAPaK58N0m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447212; c=relaxed/simple;
	bh=mCZIsgqJp2i9uamt+pKRhzaXYJ3tiym2vWHNOfxN64g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bDvK1oZ5zjjxldMspB+zgERN1lTAVtP8AYzx3ezmCMIU2syBM3k1+KlN4opSG2UnvMBgfAxzeFewUabytbrWr6DIt2b6QozD2VIlfqMODzF+Or+EBqvAKKrDJIaeaIdxN4hrz0XmfoxyHvYn1W2JTthwRqNS4IaDkcw2H7B5p2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gO+Tvye4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gO+Tvye4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso5718535e9.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762447209; x=1763052009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LFdv3AJsjeDbdyHxZcbSRtknBSxAI/EO76KEsSfSxM=;
        b=gO+Tvye4mDh/S/ZLDnM1R/+QxnNQymk59mI+iNVTMrLPpwOsa3Whq+Y/PUNOMt2ds2
         FJBs5AuevKwOMEOeFSMfNWAgw2/Si7Du2y96ifAW+b9Lu4wBvi62DwBmgThZ6fUionW1
         w1KqGW15MBTKLW3xsmLrPgeiyJp2O1lTnKtxeg6TSnxGi3G1tC87q+cquuhFlMB0RMFH
         KFAt9hCwQMLxiRoYDezSlJKTy3jsGQLIuhP6H6PldjxNVL5wuUL1jz1Xrp2OY+My4Kkt
         IF77vDAEjuPKQ5Wrvgvmsc1sgKFxaxs4uWKBQHvvs+MNNTsUc0zNOkFpSjPlpiYgCMg2
         iH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447209; x=1763052009;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LFdv3AJsjeDbdyHxZcbSRtknBSxAI/EO76KEsSfSxM=;
        b=BCcHWsmIpXSy/cdfuG+FaqoRK7hf5QhlsbiamXWQ76AaoPmlI04VE1LO+i9QTcjFRu
         7NPy+FWpm0Qob5ZlF/bp9jf6bgtjqunlfyrqySDYl9nZGi6hwWv7ufYNJeY2VVd+YHyi
         cukcKRE8GNVkYWx/RbKc8TF1zOAeY2kMZFs/Ifngr8DGeBaL1mIWZh8417W9c1TzJvnL
         ZrDDdiKAIm1sQFzbOr+aSEsHLcPozl/IwdsDI8WuA4iCYYt1Ao8/k4JdSDNNkKRDBZxj
         toZyAOvxsjljaLiTcLuHDRYoKmaEN/R4xu7vpZojfFWXqY8a0zISeYI8tFIqoOGDvQIa
         XGWA==
X-Forwarded-Encrypted: i=1; AJvYcCXzbX749bw0jW9r1Uez49TWNjECrgto4PBwB4fKaAdNu394oRWd8KYuDkRFM7eZiI6H3YSR2lPPuxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbknnbIcF1EqgPczGlkPD7Pmv7wCfHsZW2IAFP4WtHzDCQzBAa
	yDYpMeNjtaW00CJx7RaS/Hd28J/qSNx61hFXIRQwNPwnTJJDCNcuSDRRaWEXlOfbgcnAiytvXbz
	7T16pQ1dUSyGEZw==
X-Google-Smtp-Source: AGHT+IHxGvKB7RNBXPd5yjtxQlMPWEmFro0Urso+GGwuaW5qjEm9Qb3qx0pkyEB024YUCyxOSQ+DM6J5drYxMg==
X-Received: from wmcm6.prod.google.com ([2002:a7b:ce06:0:b0:477:1716:3f2e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a12:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-4775cdad693mr58624485e9.5.1762447208638;
 Thu, 06 Nov 2025 08:40:08 -0800 (PST)
Date: Thu,  6 Nov 2025 16:39:49 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1026.g39e6a42477-goog
Message-ID: <20251106163953.1971067-1-smostafa@google.com>
Subject: [PATCH v2 0/4] iommu: Add IOMMU_DEBUG_PAGEALLOC sanitizer
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
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
count and WARN if it is not zero.

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
This was tested on Morello with Arm64 + SMMUv3
Also I booted RockPi-4b with Rockchip IOMMU.
Did some tests on Qemu including different SMMUv3/CPU page size (arm64).

I also ran dma_map_benchmark on Morello:

echo dma_map_benchmark > /sys/bus/pci/devices/0000\:06\:00.0/driver_overrid=
e
echo 0000:06:00.0 >  /sys/bus/pci/devices/0000\:06\:00.0/driver/unbind
echo 0000:06:00.0 > /sys/bus/pci/drivers/dma_map_benchmark/bind
./dma_map_benchmark -t $threads -g $nr_pages

CONFIG refers to "CONFIG_IOMMU_DEBUG_PAGEALLOC"
cmdline refers to "iommu.debug_pagealloc"
Numbers are (map latency)/(unmap latency), lower is better.

			CONFIG=3Dn    CONFIG=3Dy    CONFIG=3Dy
			            cmdline=3D0   cmdline=3D1
4K - 1 thread		0.1/0.6     0.1/0.6     0.1/0.7
4K - 4 threads		0.1/1.0     0.1/1.0     0.1/1.1
1M - 1 thread		0.8/21.2    0.8/21.2    5.6/42.4
1M - 4 threads		1.1/45.9    1.1/46.0    6.0/45.4


Main changes v2:
v1: https://lore.kernel.org/linux-iommu/20251003173229.1533640-1-smostafa@g=
oogle.com/
- Address J=C3=B6rg comments about #ifdefs and static keys
- Reword the KCONFIG help
- Drop RFC
- Collect t-b from Qinxin
- Minor cleanups

Mostafa Saleh (4):
  drivers/iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
  drivers/iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
  drivers/iommu-debug-pagealloc: Track IOMMU pages
  drivers/iommu-debug-pagealloc: Check mapped/unmapped kernel memory

 .../admin-guide/kernel-parameters.txt         |   6 +
 drivers/iommu/Kconfig                         |  15 ++
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/iommu-debug-pagealloc.c         | 148 ++++++++++++++++++
 drivers/iommu/iommu.c                         |  14 +-
 include/linux/iommu-debug-pagealloc.h         |  83 ++++++++++
 include/linux/mm.h                            |   5 +
 mm/page_ext.c                                 |   4 +
 8 files changed, 274 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
 create mode 100644 include/linux/iommu-debug-pagealloc.h


base-commit: dc77806cf3b4788d328fddf245e86c5b529f31a2
--=20
2.51.2.1026.g39e6a42477-goog

