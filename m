Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A063009F4
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457977; cv=none; b=YK4mrc9axkZugDWbTKUlLuekGhhYAnRc0D1E4gsd8I45FcV7qVFZJ/nwFm+nGh/VflJ/lcAVIpDVy7Wr7kcLiajMITaz6bzXO7wtpdw4IzexI0Guy0Jwyq9840X8NFAc3M/UsrGT0wLJKOIIG5Dw8oGDyPaxYDCTqhbMIVLy2t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457977; c=relaxed/simple;
	bh=rLcihtyFhSEoeTJa4t4hOIpNJcIYYd1QzG5DpHS2acY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Nj5ugBTmizsym6sfj+i9/F16UZsq5NPc33NUV7x5RmAXuUpqvIjuxUhGk6De5onDaQIpxpk9O4NOKBrvkx6SibRL5Wci5aqo2icDWiW89YnSamRXxPgNkSnbb52mPWsEuBeepc/gwWIxtoXnC1Zf+uOp5L5gTzkbbXOj3aMMmXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ECmWEpGb; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ECmWEpGb"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477563e531cso414925e9.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 04:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765457974; x=1766062774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YPd4rabCA15+W0gc58X3ldTKNVJsgSl/m8TAJcDC9k=;
        b=ECmWEpGb7wvNHWaO3wIO1jZ2PV378ZBMUSBqyQX+EiEIRgmapVFJM0qiZMBJyzHQmf
         LJeJj37Iuo18p5KcC94tuZ6m7r/OsPbl65Uuz48V00Z/qLMY4Me+IygO9KZjNrmfVJSc
         lU7e/ePeOtxOzJx6rv9t0xq4BqvHa+7/B1yfWKvOyQo+IrGoJQxkew4suncyjsPx99NY
         VLFS1j+KQKfuhr1Eq5fCG6Ka3vRy2X8KgXvkGems9u9jcwy3jUt3pniBumyiycNS9Oee
         65jEhnalCmBGYg9K2EFOdcRXeuM+uGYxLrE1IK5maWWVCGm9B4ZtqT/IWjtecGq39xHM
         hMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457974; x=1766062774;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YPd4rabCA15+W0gc58X3ldTKNVJsgSl/m8TAJcDC9k=;
        b=a85bPZwzZYjrGC+59uQiI5YS6byHRlrAwkLe1UxWar0curkw/unp+dd7ksbkOc0IbY
         xydNKrnF+e7V1d14Mnvxj/2/fYDLbdIT7OrEHxTynvBjhRcGlHcD49qLIwqfM9h57Gnl
         cbbRIDmzNh0Bri8CDzaBHSYmswUitTDnBJ0FnmXXmV6lIxAKMEhlTlyte9FnvzI+L6iY
         0bxW0Sg3IkXx4+nbWv96FoxedUUR/a6E+2tVCwHgiRxFeCu92gApVT2fIzkIbj1eTIBm
         tLjeX/UjSvtvYbx0Wz1Uejop9CbjrIWwVVyvD77T9mu4pE+4PdztuVZnEYlmu2bM/qfm
         UyFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA9rFvtConL+hUIH2emgPSWTnbgI3dTYR3VPe3wIBSdMZrudIxNGjVSN1K5UDib+kH3FYOdCSaZ6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUVWXnEsy5qhf5+JBBMyu6LixhiQteMgFnTr4jpCfcnP11bM2Q
	t9ZbWA3fDDtHsKRp7OoPsG16CneoTzLTwjVEWVY/zDluxTH8eSPb7Hiyan+41C99dKQiyRJaNZ3
	iGhvk1MSYpmpG+A==
X-Google-Smtp-Source: AGHT+IEutEw1d7HRrDvz7Uw5x03SFSXvQO6Sqwdti2F86uaAXoFjBNtSfbvmhvAiwBwLApQfmCLLxUs3FhConw==
X-Received: from wmbhi3.prod.google.com ([2002:a05:600c:5343:b0:477:c551:bdb9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1389:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-47a83843239mr56517695e9.19.1765457973952;
 Thu, 11 Dec 2025 04:59:33 -0800 (PST)
Date: Thu, 11 Dec 2025 12:59:24 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211125928.3258905-1-smostafa@google.com>
Subject: [PATCH v4 0/4] iommu: Add IOMMU_DEBUG_PAGEALLOC sanitizer
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
This was tested on Morello with Arm64 + SMMUv3
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
4K - 4 threads		0.1/1.1     0.1/1.0     0.2/1.1
1M - 1 thread		0.8/21.2    0.7/21.2    5.4/42.3
1M - 4 threads		1.1/45.9    1.1/46.0    5.9/45.1

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


Mostafa Saleh (4):
  iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
  iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
  iommu: debug-pagealloc: Track IOMMU pages
  iommu: debug-pagealloc: Check mapped/unmapped kernel memory

 .../admin-guide/kernel-parameters.txt         |   9 +
 drivers/iommu/Kconfig                         |  19 ++
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/iommu-debug-pagealloc.c         | 174 ++++++++++++++++++
 drivers/iommu/iommu-priv.h                    |  58 ++++++
 drivers/iommu/iommu.c                         |  11 +-
 include/linux/iommu-debug-pagealloc.h         |  32 ++++
 include/linux/mm.h                            |   5 +
 mm/page_ext.c                                 |   4 +
 9 files changed, 311 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
 create mode 100644 include/linux/iommu-debug-pagealloc.h

--=20
2.52.0.223.gf5cc29aaa4-goog

