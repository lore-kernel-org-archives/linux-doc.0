Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79BE194C90
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 01:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314531; cv=none; b=MSR6WJqKUaySGOGTAq84iftqVJFU2/58ZBrLsVNHpUdwkc64jsYv2KjGa/MK13vNsTNfmE4PLn4RdzIAL/5iGBVpO/u4NQuLlGu2bvdPfLtbaRYjTTcbP7A7k/Ce7O1jVRZQWn8tIg5DEBrOMX9jG6vO44WIai57tIIfiYQGAWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314531; c=relaxed/simple;
	bh=sw/0Zxhq6kIY8BLZP2OCu04cT4fuVwkynKL63RK8D/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ap4bTlum/Fec2qrM4gPQnW/dNTLhRhXio2B7QS32MX2nkpNtnL1u6nTfFdcorPbV00Om2xF1Nt5XZFiB3swCC4zquD9a0Cd1skCyv1oIoXQ7SucvaZLjrzhCpGVvtjY/G+aZiaqnoiUiEOvlkZxi93g+xG4FHBR/mICEqr1RLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NyDqdK0M; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NyDqdK0M"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d7124938d1so13359957b3.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727314529; x=1727919329; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Z3PBXE4Aegel3/riahgcLFAyLXvOzS5uEE7fXt5qw=;
        b=NyDqdK0MUeFhnTGPO4a53vM7oIUtGkfJf5l8z7QLLNR2IilwZYdei/+jLdGegJY5BT
         t8BrxOjW00e3Iq9G8/0wb5kASaTmuqXpZ+1+mtdxjPb8zhrdmKCu9bQNVb8d3ORoPmKH
         SHOylSm9zAjWXCTc7yxMWaOsAC2AgrPNLXnmfGJveuOucYENOwwu3osE0kwa+spXRiww
         A7qzB2rnHMnIs6OMQ3xFCg/L8z1G/Gw7bbRFMBvVi435KKW4p2TduyzusVU7C5Pxt8Dy
         yrBSGdZ/ak5w4sULoeWvxU4mCOIQjMKCkSHGAPiRaL8wejtYqQ8dNCot5L8q8YhNmCfL
         ft/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727314529; x=1727919329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Z3PBXE4Aegel3/riahgcLFAyLXvOzS5uEE7fXt5qw=;
        b=JMbZ0eEiHcw9I793sTZo8mbKY5X2A7nrP+8Al699AIaohA2GRk1YyjuFrM19ylIfFH
         ijZLAsWlF1hZeqPN8jzLdY+qFAZpn/RHxy7RLsLdVgbTq5ZCivxLye5HGOYfFTPDdRTv
         hyiecPBLlTJFtNTObFpX4BSGv0lPge5qKbc8BUQ3zKmQcDsg/OZLNcy/ajUp6XPXvrjI
         60/do6QanNH+ETCtaekCimMZkSrp3w29pXREMLx4ZUK9wN5KBHDwtYHjs4SrJnM2UaQZ
         mgIRgOYoS8KfU3NDkmu6osErG1yVEdcxs5zaz+K/3C3JnkXk8r4VoXD5OzaXYw64phxw
         1v/A==
X-Forwarded-Encrypted: i=1; AJvYcCU09uuvSLQMGo04t005S/b2CdXITfB8K3qWJQdf7mUNml8cCZ5xwMZbHzIE96+LhZd2qVc42G5Iho0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTwzLBZfKoYpzFa2+MaW8bpXpR/6GWF68bYqahXgq8mXUefPaL
	rwEVfJUte35LbD4/eAax/0hfYMx479xPE4LlQOCn8/7a1a7tha75lZWppfBKmiq+bYon8aEtGFH
	7AFcceiWeGLkRw2XTRQ==
X-Google-Smtp-Source: AGHT+IEpNqlcby3XCzPxmMXEa3yAsp88MrqHgIHgIiYwCpactoczoPP9Ca8XqrYS/AN0Db4KS1YJcToucGPf0cLH
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:13d:fb22:ac12:a84b])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:2892:b0:648:fc8a:cd23 with
 SMTP id 00721157ae682-6e21d6e1f34mr309987b3.2.1727314528595; Wed, 25 Sep 2024
 18:35:28 -0700 (PDT)
Date: Thu, 26 Sep 2024 01:34:59 +0000
In-Reply-To: <20240926013506.860253-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926013506.860253-12-jthoughton@google.com>
Subject: [PATCH v7 11/18] mm: Add missing mmu_notifier_clear_young for !MMU_NOTIFIER
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Remove the now unnecessary ifdef in mm/damon/vaddr.c as well.

Signed-off-by: James Houghton <jthoughton@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mmu_notifier.h | 7 +++++++
 mm/damon/vaddr.c             | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index d39ebb10caeb..e2dd57ca368b 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -606,6 +606,13 @@ static inline int mmu_notifier_clear_flush_young(struct mm_struct *mm,
 	return 0;
 }
 
+static inline int mmu_notifier_clear_young(struct mm_struct *mm,
+					   unsigned long start,
+					   unsigned long end)
+{
+	return 0;
+}
+
 static inline int mmu_notifier_test_young(struct mm_struct *mm,
 					  unsigned long address)
 {
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 58829baf8b5d..2d5b53253bc2 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -351,11 +351,9 @@ static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
 		set_huge_pte_at(mm, addr, pte, entry, psize);
 	}
 
-#ifdef CONFIG_MMU_NOTIFIER
 	if (mmu_notifier_clear_young(mm, addr,
 				     addr + huge_page_size(hstate_vma(vma))))
 		referenced = true;
-#endif /* CONFIG_MMU_NOTIFIER */
 
 	if (referenced)
 		folio_set_young(folio);
-- 
2.46.0.792.g87dc391469-goog

