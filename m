Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B437F0E3
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832573; cv=none; b=Y2PBPbDm7FgpQRLrhmLLzgzyD9HBA6uwoSh1ysejB0tmkk2rFRl2I0H77OjexkhC45QM+oZscuWRkF++l0HXvtWvc6YuJwzy0Mdl2h19hTNjOCOBp9TFz7URJx6Bt9CoOo4LHJmChXkHDRTcVvG/DXi5pGq56+vX6Lopwn+gRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832573; c=relaxed/simple;
	bh=zVvQkXwd/3IoS8G7uj5HLDfm5GyLxOaaz04WfzmMwD0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CZSRlPjc2u56Udubm+y2hd/62rF75cP9m7QPgUHLoTF9hAqwIHNa8dY2HH0MJb/TBFDNg7vGmTseWEb1gTQfMSp8kHCH8+owGAWrRH9UUAGnTFRPXPjhfJVUdFCoR28ffDRs149dHneUDzNl1NAYFQi2kDe9ej71lQoGfrbK6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pi3xZXCb; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pi3xZXCb"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-653f94a664eso4525126a12.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 06:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768832571; x=1769437371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b8pkyldJ+pGAVMQEprScMwPOOPhYPwuYlRTxB+xChvE=;
        b=Pi3xZXCb5OeozgHI8nehh831uKkP7lM0LUsrwzIyPPgRO/Q8Hg0sBl7iabsnOC8bjG
         QTtRg+LP9cAx8XYljQJx0sGxvstDCAud1OA//gl7NIcXyFUPtRAXhZFKWCQNy0A/7D+C
         cr23vhKUmeKKtsrrCAJVHhuO91rTluhxQqiS5Mq20BY12EseJAdvHsOOiZtWiqiRs+Jw
         B9R2ErsrD8P1xzQEFjK80dm0IUu677DjQaZr5Gb5Vme9AtLXflpYvi9pLrf+Z4hlY3Zo
         qw4lHw3E5Be78YK1L+8lm1etyk7NGjno/V5z8uMf6G0/NRkbWxCK49MO5BWGVsy/NOQR
         R3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832571; x=1769437371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8pkyldJ+pGAVMQEprScMwPOOPhYPwuYlRTxB+xChvE=;
        b=CLqnkQvgSkt6QrolpsrWyR4lZNQfiZUJ8jEMbdfFtWUggVDL9xXnJm0zkxa+dlpQAu
         wWWYL/1tv1gp9LvuadVjI/XM8dxNpAAO/Feuj2MnV0WRV+F3AoemWSYsI0MOYlNKU8sL
         JoNHh9z6HJdlbsHmB80Wzwy/T6TQoVx4XxPyCKuyZXjrvCEVKCUg6rxBJNe7wMXZ+s/M
         Hqx40+opeHQMCAVUwCxNY4QSF6g0rLXXWz6NS1/oFFtUrdXrdS5xGk4oK2KuQMS8G3Me
         j2yGoi+nw/DWWdf8Hxee4ka7qrEO/FTsEZDywScL3F3pqyET0eKlbi2cCfL5wWJ+W8T/
         i2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrBkBjn3/qClEynJ1L1jY7UEn2DaOpfZpJNXfrWRpFhoLgkBWnCi6uQnFX+WSq91Ucv/a67HZz2XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7iiESleXvbTossD0wyMtNchz0rtRj8JmMlAIy0FN9VPBN4N9c
	R5mqMhHgf3i/e8fHHUBlawAKciWUaWks9OtfwkCaXCHNQWb4bmY+BCz3ILBDvtH8Qzs54TUo1Bi
	05bW9+mBPCO/GUQ==
X-Received: from edwf2.prod.google.com ([2002:a05:6402:1502:b0:650:9d8c:ee30])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:90a:b0:64d:88c:c2ca with SMTP id 4fb4d7f45d1cf-65452bd56f7mr8686719a12.28.1768832570709;
 Mon, 19 Jan 2026 06:22:50 -0800 (PST)
Date: Mon, 19 Jan 2026 14:22:44 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119142246.3821052-1-smostafa@google.com>
Subject: [PATCH 0/2] iommu: debug-pagealloc: Remove pfn_valid() usage
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

Mostafa Saleh (2):
  mm/page_ext: Add page_ext_get_phys()
  iommu: debug-pagealloc: Use page_ext_get_phys()

 drivers/iommu/iommu-debug-pagealloc.c | 31 ++++++++++++---------------
 include/linux/page_ext.h              |  6 ++++++
 mm/page_ext.c                         | 23 ++++++++++++++++++++
 3 files changed, 43 insertions(+), 17 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog

