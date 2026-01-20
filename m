Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856EE3C1980
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900775; cv=none; b=LiHppT3VSwGkZ+LdVWf/9e3T3FemXr2zx3ZWFuRs6DIC2dCtmH9Zd8OVVEZ/2SpYilnA0gGcLPMMAe9QxfmnI4v3edsvMuf78yp0wfjGgbZbWE018gDW7iJF4/sZvAm7Akf6Bd0ZkjmWtLIebyiYSI3VhfMxtSdrXUKIpjZyGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900775; c=relaxed/simple;
	bh=dz8KYRvaR4cIH7OFqi4HAkd8OxCeLLplo8K/12b6aYw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XXGgDjXmCJ+FJyMsPUHt4P+3lDV+ErdQczjWuZXVHX/Fr0Csu2oIZeUHnJknzc2KpRroZW0CgKNHEMRxCgcs/swUke9QHRT9wSqwdQvd6aX1XJ7F3XuQbbNux2ed2QoCKxw0b4kSx3/5OOb5Np5mI2429/VtHh8OYjdj0JI/WFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eMyJBusn; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eMyJBusn"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4358fe2e7e1so338082f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 01:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768900772; x=1769505572; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gf2YI936iIbQws0HxhhxYueO3tESeyYZp/38y2RVRZI=;
        b=eMyJBusnpMgFnAMXed+2f1wG4XySRJZqFhwWfa3RT9O+aq1hq9HI9eBwXn/mtpeTNb
         oOCKme/NgFtShUllK4D4eLO2NKv7B7m84pInxUXAqI87zJl+3FXu+5TfifXtPJwlJY25
         1P6kt9i00Qz/iN7wwHI3f3b8DpXvpmoQVBGzQ9C6Ayq6EdsVQ38FdnXsqmvaR7Xbzm3C
         K9K9hXJ0UYXwiH/Ot00WEm7cGWmLT2VGZkiBY7KNPpo5/lRb6xoStHkcafG5Nr++K/7D
         Qf5aAxvhEeigZUrBArkV9ticxW4A7ecatDPXuXo5eSLkKF+kox2S96xIwpm+KnelcBDf
         +aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900772; x=1769505572;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf2YI936iIbQws0HxhhxYueO3tESeyYZp/38y2RVRZI=;
        b=ITokEYyW04bd6t81xtXIfRDdtE6jJcsiizkMaVKvNRq3QquI6XFN0WDdcBdJ+uImoF
         DAhOSSOSZT3ZYvnVdCByOD3nwjWWfzCSjuCJcmK2WLFzqcQ5w3h0GdlK9b7Yzc/ALN23
         3GE45BhlDEHw+KPEYiwffOT2mfWZSBH/RygdhQ0LiCZtD5Yj4Zw12ha3+kuDbLV0zMXw
         so94JDpzfdsZSrVGraY5/7HGl1VF2/gKq1WD7zIjerD6YRXvVvmp1q9Aj6f40/a1KBPL
         jdtNegvsAQOFkvP8AhbF5WkS8+vay6/JN4P+U3emKzRfhiOOP7FW+652nD7WTnprwRyh
         +fWg==
X-Forwarded-Encrypted: i=1; AJvYcCUazHx3LHvveG05viUvCY+i4Qa8XZ01UPyUaDaEYRv8XgjM8VVSRyTBmewxqR5ciNL9LisgW49+kZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuV6Rmva5thfH9kxiPcdlwTEtUacuiM/cQHtwCrunbnfBq9Gok
	I9SuBCFl/DnpZT9riqE5l7Cf0wXY5TPPbg3bDxeFmwWIWJcbC6doSlAXIvZ98bsUz9blVGvcYwQ
	ViWbBo+rWGv6dwg==
X-Received: from wrvk17.prod.google.com ([2002:a5d:5191:0:b0:430:f5ea:d30b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1448:b0:42f:f627:3aa3 with SMTP id ffacd0b85a97d-4358ff398b2mr1994536f8f.56.1768900771795;
 Tue, 20 Jan 2026 01:19:31 -0800 (PST)
Date: Tue, 20 Jan 2026 09:19:24 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260120091926.670155-1-smostafa@google.com>
Subject: [PATCH v2 0/2] iommu: debug-pagealloc: Remove pfn_valid() usage
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

This is a small fix for the new config IOMMU_DEBUG_PAGEALLOC based
on the discussion:
https://lore.kernel.org/linux-iommu/CAFgf54pBAUm3ao-UJksiuGKtvv4wzRyFq_uKwLe0H1ettO4DLQ@mail.gmail.com/

Where it was concluded that pfn_valid() is not enough to validate
physical addresses before access to page_ext.

The first patch introduces a new function in page_ext that takes a
physical address as an argument, and the second patch uses it instead
of calling pfn_valid() and phys_to_page()

Benchmarks with the new implementation can be found in:
https://lore.kernel.org/linux-iommu/20260114164322.787125-1-smostafa@google.com/

This series applies to iommu/core tree.

Changes on v2:
v1: https://lore.kernel.org/linux-iommu/20260119142246.3821052-1-smostafa@google.com/
- Rename page_ext_phys() to page_ext_from_phys()
- Reword comment and commit messages.

Mostafa Saleh (2):
  mm/page_ext: Add page_ext_get_from_phys()
  iommu: debug-pagealloc: Use page_ext_get_from_phys()

 drivers/iommu/iommu-debug-pagealloc.c | 31 ++++++++++++---------------
 include/linux/page_ext.h              |  6 ++++++
 mm/page_ext.c                         | 23 ++++++++++++++++++++
 3 files changed, 43 insertions(+), 17 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog

