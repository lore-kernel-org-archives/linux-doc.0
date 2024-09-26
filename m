Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1958A1ABEAA
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 01:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314537; cv=none; b=EHcD0u474lT8MuLpSZuadwNoPoe5V12vybVxYOsDMPbW25CxRL9WmMaToLl+o3EDjgb0sylUrFtadEyj4cLqeQwMc9SdtK5/k9CE9qrqou+ZCPb10cYJsCW3mwardl1LvLFx5KL3qp+buwiN81mHMdsSprz2LSzcSpqTAJ4ALfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314537; c=relaxed/simple;
	bh=b3hOj3Hs+s10OWkM1ZyjJYJwKJI4XiaxkkuOL7OmSoE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rkX/lusjNVDzOBhMpLp1225NPQFVkYe2IgkoA9E/4YKyNFMjrrCCsCcgGAY+RDfGN17/cC8axVH0ZifKQiBpAnnf6jk6cp44hiONaX4UvwY5pBUuhUEvTeQsYpEfc1MJjyMmvWO6IKMYY/PpUwbJj8ortPleBp0XFoL0QnRJHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hNHeWhmg; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hNHeWhmg"
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-8485e720c52so328917241.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727314535; x=1727919335; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEOlPh0OL8PB5uPzly3STECymuKs02gkKhKmsw1ZgQM=;
        b=hNHeWhmgLFRQ2/Uc9GTeVXn78ModPOXmrvuJYjSfRKHvFK93P5qrFHPFtd58NC3F4N
         WX6woI2oNEuf213Ih3lQiDxYftnApJVnOFx8g0SOTNNKEHeO6Y6S08EhwKKkucmVIMkv
         ZwqSLx8o5DxCrd1OZbNDh6KKCSEDKpMgS8M3Vu0Vj+Nc33B/JKfgJNgJxtJ6Jssr1Mt7
         nhDzcMRqCj80o+ZKs5ZQgLCrbWPYNz6Q9RfmKjV8aJq7W/u0p4h5JKALmRFtEO3ZY+8Q
         4o/ymmrg5fKH78RE4R2kk32bBvjGDQVr/Tz21wgeF3iVvRQi+1UXnF5aCCDBRyVpZTaZ
         hvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727314535; x=1727919335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEOlPh0OL8PB5uPzly3STECymuKs02gkKhKmsw1ZgQM=;
        b=Uy7/jECPASNDeco1GHFZrvFAZUbAuV9L/ZRmhuMz7YD+MwYoy7OhrKoMOQurj5PBVN
         5krgUfwfZiZFRkxiqXjApm2yqyXSSqyr2igbbw063j252OHYSxny4FbMJ8uoaLgomYYZ
         JBQ4/mzqyKMcq+n8MTJKDZJURLOJv9aL6DJDZyuIhrhLvUvPg/zUDFWyWjJ0NQDiycbw
         ZxLpz4YC5vziTKlm5VVP/l6iiaJafkBqWOmE1QZJlQA99AeqSmiZnVFAEZiEcaoCQIGD
         oatcRAN86tmrnE/fh1VBf6CxufEtgLB9zaT3XDi7B0F4nhwiKK50s0mb1LKFNgVmj0FW
         s68w==
X-Forwarded-Encrypted: i=1; AJvYcCXBs7f6B7qNMAcy2v4bGeGQ7N0AE1/NGl05ejfvMXWxKmp2Ufr5b+vCh1z0O+Rtnx8ynumvxNGCy5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4POHccycAsyIOuyDuuO5xZx5fbZ+lA8zUJQJXXYc/IjOWHW8z
	KK3OnSpjOuxNbZuUnNQAbqDMxZO5wroHvWvBLTaWZVj9kP4hZmltuXlkH3+IbGElPOEV/PBWUxq
	MYbqy3SYXuPI68sCP1w==
X-Google-Smtp-Source: AGHT+IEMx7yb7oZJxjUcxiV+ubu09F3MgF2iO9wA9qRkGH/snKIzoGYYivc2BPhRyOg04he4NRTTUUTncXdmo6QX
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:13d:fb22:ac12:a84b])
 (user=jthoughton job=sendgmr) by 2002:ab0:71d3:0:b0:84e:89c5:3bdf with SMTP
 id a1e0cc1a2514c-84e9940fb1bmr4272241.0.1727314534796; Wed, 25 Sep 2024
 18:35:34 -0700 (PDT)
Date: Thu, 26 Sep 2024 01:35:04 +0000
In-Reply-To: <20240926013506.860253-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926013506.860253-17-jthoughton@google.com>
Subject: [PATCH v7 16/18] KVM: x86/mmu: Enable has_fast_aging
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Because the x86 MMU locklessly implements fast_only versions of
kvm_test_age_gfn and kvm_age_gfn, we can advertise support for
has_fast_aging to allow MGLRU to quickly find better eviction
candidates.

There is one case where the MMU is not 100% accurate: for the shadow
MMU, when A/D bits are not in use, young sptes will never be aged with
the fast_only kvm_age_gfn. In this case, such pages will consistently
appear young, so they will be the least likely eviction candidates.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f47bd88b55e3..1798e3853d27 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7708,6 +7708,8 @@ int kvm_mmu_post_init_vm(struct kvm *kvm)
 {
 	int err;
 
+	kvm->mmu_notifier.has_fast_aging = true;
+
 	if (nx_hugepage_mitigation_hard_disabled)
 		return 0;
 
-- 
2.46.0.792.g87dc391469-goog

