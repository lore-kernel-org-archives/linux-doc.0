Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03D22EF2
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 01:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721783483; cv=none; b=p23XiGpjuixmeyRBBi2VxRY8xzyI56GF5kk6whk1VSWGQjaVu+b+7BYDFcBxeaoPoYJKehtz2VaWbFqReD0TjC/TihLmf1cDNQxP39kDTfDHqr2jN3KSbc7rP0QRWFgnaXds5d8PVSJIzQJ/7Lkbv9tftvO+t0h28CGI87FwTrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721783483; c=relaxed/simple;
	bh=GzvrAe/cY3CTCsf2eL2JXn03bXEL3fKmbljP7UMpANQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FFP94dyD8WJ7g3sFguQtuGdNe+Ju2TnXFLpSuhCwn5p+YJeaUVcg8zg+pTQsPFX8frfNmhgOn/yt67YLEC2b8UtqV/lhvBB97AMbVAHHMC+mQ178Welk2HcPFSMvm1R220Rg7D5NKAYRRqPvm97MNRIp2OvUbPKKqhKQpUog3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bEVrWdvN; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bEVrWdvN"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-664b7a67ad4so176397487b3.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 18:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721783480; x=1722388280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JW+jUUoqcXqadXhonZGbNsXZ7+Zma3rlwNzyePdiaMw=;
        b=bEVrWdvNOrCwwmsJ1hAAr8f5K+fJrCEQ9vgVVUnw4YVzIaIx6yEn2Dje8/gS/CuRNd
         A0uzVz0nNdAgEtEEoYdODrERFRx7PPeprEKYQEhMJGtGggoOc+RnRtpuevreRJ3j2SSy
         1m2K7jhiLQZfbBcu+0RI/HSJsRC1d4oVhtTn6a4YiIGuaC5E6nvIPlHJdVYHoPxlKnaT
         IBdQag3yWPghnLXLIukxJuVUH/Hhc6JVP40ywaGSc8yOSkVT7Fju2wtQCkJ3CAhSZDeV
         B4fNS0KVG/K/R4N6Prlx9uMfRHpimmnmFyMCynGAtfdJ2BEFuBy8ruZEhDoAUjEXFOU7
         Tw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721783480; x=1722388280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JW+jUUoqcXqadXhonZGbNsXZ7+Zma3rlwNzyePdiaMw=;
        b=Ya0cg8RiFZ+YX13LbujhLTagDZGSsVzMnv7NiuXKX6UB3rALpX2G+i9W3ivAxK1xhc
         uvuZhKtXnZ7T2mTT54mkRmpjPFf41LPMOjbDFF3RJq2xCEGWs24wlqp/86FsNCMMjH8F
         JbkpChmUOzXlhZjhMyC5sRVLVGUATcnEMvnAkyigK+UHs0NthJ65EQ+WoM5fMjEqZm0j
         oqZITwmOoHQG7LaQ/KYPGwCLQqplco1UPdTlHndMEdOBC0VHXuiVUwVyMMysMjmLlnVJ
         oq/4+HrXKC8HMc1FEqx0i9/9BC9IDzI4SL4KGoussndDcw17VmDHtIG/U0qxon47Api3
         7v0g==
X-Forwarded-Encrypted: i=1; AJvYcCWcxBFoQZP0Q7LzaA28EME4ETzkBNri9wVQEeYnw2okXWHUMPHmMLM10Qv2DgqxBmdSy9cyN8kT20XeeJIlugzO9xxLMZ9xd6Za
X-Gm-Message-State: AOJu0YyoxY1Btea5acbf/7KHv3Vtl+eSGjlUHO5/EggmJyYpYVWNckc/
	tgBNHHMlNWR/y3n6ScXt1mMSm7hqBG/jMf2kMvsyjki+cbOgbPq27fWcSSYQHAyCzU5t3s6X/Qy
	zKFjK1wN0a58KFmU6WA==
X-Google-Smtp-Source: AGHT+IHToUjK35hNR0etsZGQeAjUCPxr50Jqta5Si1cnS8NseXl88g/0Ew0GUmmAUp0HML6hFdfWagbQP5rsIFm/
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:102:b0:66b:fb2f:1c2 with SMTP
 id 00721157ae682-671f4e0a6damr821967b3.7.1721783480393; Tue, 23 Jul 2024
 18:11:20 -0700 (PDT)
Date: Wed, 24 Jul 2024 01:10:33 +0000
In-Reply-To: <20240724011037.3671523-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240724011037.3671523-9-jthoughton@google.com>
Subject: [PATCH v6 08/11] KVM: x86: Optimize kvm_{test_,}age_gfn a little bit
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Optimize both kvm_age_gfn and kvm_test_age_gfn's interaction with the
shadow MMU by, rather than checking if our memslot has rmaps, check if
there are any indirect_shadow_pages at all.

Also, for kvm_test_age_gfn, reorder the TDP MMU check to be first. If we
find that the range is young, we do not need to check the shadow MMU.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 7b93ce8f0680..919d59385f89 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1629,19 +1629,24 @@ static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
 	__rmap_add(vcpu->kvm, cache, slot, spte, gfn, access);
 }
 
+static bool kvm_has_shadow_mmu_sptes(struct kvm *kvm)
+{
+	return !tdp_mmu_enabled || READ_ONCE(kvm->arch.indirect_shadow_pages);
+}
+
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	if (kvm_memslots_have_rmaps(kvm)) {
+	if (tdp_mmu_enabled)
+		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
+
+	if (kvm_has_shadow_mmu_sptes(kvm)) {
 		write_lock(&kvm->mmu_lock);
 		young = kvm_handle_gfn_range(kvm, range, kvm_age_rmap);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-	if (tdp_mmu_enabled)
-		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
-
 	return young;
 }
 
@@ -1649,15 +1654,15 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	if (kvm_memslots_have_rmaps(kvm)) {
+	if (tdp_mmu_enabled)
+		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
+
+	if (!young && kvm_has_shadow_mmu_sptes(kvm)) {
 		write_lock(&kvm->mmu_lock);
 		young = kvm_handle_gfn_range(kvm, range, kvm_test_age_rmap);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-	if (tdp_mmu_enabled)
-		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
-
 	return young;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

