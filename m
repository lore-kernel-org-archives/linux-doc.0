Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6172264AA
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716534; cv=none; b=ILCt8oAEr3LVEmFhdaLeOjpsW2oPcIlIPKyaYcjqLa99cHCTok1zQOuSc5DLfG/odWTX4aTq2B29i4N3sgiESztHhzb4oRfp8MudeDTVusDbu5ho5sp849GI4eSF4fZFsP1Qz32O8ylFS65cI7+Z6DPAt42Rd25fVK+wz11N9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716534; c=relaxed/simple;
	bh=94DqW7ogGAaLjIIqYMc4rSjyRy/Grl4qfjjA/fEJZ8c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rZOO2/hr0I+kGFkJ4RKStQUyiyVvL83+Of6xAE/h10wtH9zjf+xgeg4x83kquAiLM6nycNi1GIOuDPvspFbfvSCrC9sg9MvbLefPKeYXv6frAbh+SPom6SWZE3wHPvqszm0WxPyV2uQa7C3z7DnAM0TID18ECSGWMFugiTuzy/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T1Y54nrn; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1Y54nrn"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430fcf10280so804172f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 08:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767716528; x=1768321328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zKAqbwUbcchTwKTjD1t6ChHOkXjBfpnVs5Rhwmy3fpU=;
        b=T1Y54nrn6SRM+ANo2JdcSRwH5+Kd7KoX1jb44i32/2XD0L2LtZFYNEUsjSUUmSjCzg
         j8VTz9UjGn4eXcCn6uCa0a0KZt670aQzMQgueUHZ0GYarFeT3kKEBZtuJrt+Y+/QoO2W
         +EECa/IE8o1hCvCXufo2q357mGAYM7wAOjMX8xsuNAhIRrihN82uga+FsMHYppeaMBMb
         gpziQJttqmIePU37KEqFqpOUAOInnHrLDO+xID3vQYHH8VSxKTAeW8unSRakzrhWhxp/
         mpwewCiSU9INipL7zmOQiDlPpPt+GKa4Oiw3x978/sWV2YOB5hpPRntvA47IJhgp/7NQ
         6ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716528; x=1768321328;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKAqbwUbcchTwKTjD1t6ChHOkXjBfpnVs5Rhwmy3fpU=;
        b=b93GA8hZmPNzn2dgPsOF3jMxBIpxs5HQeeu70OdMUAI+iS6RGDLHXT4lVYBk6VoCbk
         cnv0tSOHKtQdaE8Gzy9peIXxSYdPoRZ7zP8xSkDgJL01xJqJvE7hPKsL74iBkG/2+bxN
         eLZLdlRF7OiRKczL/7VD9Q8oKD1CuvYW626OCYdiNJKcQFydk69x+YbD0ETyVJOhfOOm
         AvfWM6jJ+FignfKI73+hDJ6dbDC+HaqPah+uIAE3mpq7ZzedkjHSicEX+BS1KYQpQdJg
         SYD3taVpERjFWtMev18Jc8RuUpcCp127MhiDoPpEnxfvYyrWOWDmBKuQF0zfM2+YjBka
         3LcA==
X-Forwarded-Encrypted: i=1; AJvYcCXMFNZxfuB0KVNqAucRemVXmAffLFy7GTrtYYqyirYsvDooFZRqe+f7NoaJ0p1CVobimXwU9GzMSRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW6oSg5vq9/knQnTAgC/YknMNKlDuyCagAKcMyc2SqCJuKTZQj
	d0WKiZBhF4uwXOir8yMJN+bDZfHmrBNGkqRqlQGfwcoZcbjvvlfQ3j1neoKzp8mOQPABQtru3nR
	Of4akzvyLvSkFWA==
X-Google-Smtp-Source: AGHT+IE/qy1LfP4KHNR4hLsIgyEGcvqJy/Wln0GOFpcBQE2xmH7wf/+hwlojpH5iVq4CKKX4O8sUT1CS1VuLog==
X-Received: from wrbck18.prod.google.com ([2002:a5d:5e92:0:b0:431:334:a1ce])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2504:b0:432:5bf9:cf26 with SMTP id ffacd0b85a97d-432bc9cbe81mr4724605f8f.13.1767716528301;
 Tue, 06 Jan 2026 08:22:08 -0800 (PST)
Date: Tue,  6 Jan 2026 16:21:56 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106162200.2223655-1-smostafa@google.com>
Subject: [PATCH v5 0/4] iommu: Add IOMMU_DEBUG_PAGEALLOC sanitizer
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
Did some testing Lenovo IdeaCentre X Gen 10 Snapdragon
Did some testing on Qemu including different SMMUv3/CPU page size (arm64).

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
2.52.0.351.gbe84eed79e-goog

