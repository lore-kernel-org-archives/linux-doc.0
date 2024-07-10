Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC713D503
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654970; cv=none; b=LtKm93jOlvl8ow98IDyvnmrBagzvgJP8mPiTrM6/mDqyvOI4rjW3zPSn3+PlGrLwmn7MyTZUGrJbnQJCEx7bAwUwbTGlV5lPdyROD4ZbY6DAeB5l7/Uj4Kvd49HZInaSHO9Yc/kYHXvXdcsU3asWsVMBBTd16xbKt2rcG5LTLlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654970; c=relaxed/simple;
	bh=EiaFG/eYwx8Esdk1XHkxgkjzifP+kflmXrizk7/imlQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VroGlwkog9q1d5w8Wh00e8zbb7iSNqveztJ3FbUEkaQ9N3/tqZY1r6JtIPmZFfJjD1XiBXdklQyfzEr9R5AhpF9FwS82WFH9xKOb8DiHY+rhQYGz2D9Ag4Snsm5l8yOiptkK6tqPBCL8/AyuDiVKgjUZSKLxS01rAEz/EplOxRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMFUNTKL; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMFUNTKL"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e03a40bd8afso513344276.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654967; x=1721259767; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=45lnTGeGmxXRWR2sOGpDAv49wjAnxo1Jn2Fj4ejBtf8=;
        b=rMFUNTKLofPpwYducIF7Cw1iPUXYaUMhIvA4pJK+FJsMhuBbEfYeGicZCi2TAepbxP
         /gfUoP17B9rXWJ04a8cN6dpwPorrae1HDEr0DaMvofo0rxTKVYyJk9uUPiW5jtycP6sM
         pZCFGBncyRsJ84unXBEqIZeqeIws7SW9Aowz3p9Z4Xi6IVfFcdNkG+NI1RgmFuLsV6lL
         UmM+1Q0Svtf4n6oRyE3aVLRupiIw93GNtJDF0o8h9JlpvB5VAcPLnJj2TRcnb92fpZhf
         4B7SwgKMUOCpAGuicSrQ9lZgLXgduUWTfR31z++P+QGZH+8fD6eMyxul0aWQ/fd1+Pht
         1qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654967; x=1721259767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45lnTGeGmxXRWR2sOGpDAv49wjAnxo1Jn2Fj4ejBtf8=;
        b=XFOc46QNrreGA3w5q58WDxvWgCwC9Dy0amuxwtlMrS/kWbH1N4Nxpg6+imYsbuH3Eb
         7WhsH8nLcG8/K5tmTE04GgbvnMpRxpc28fX0F//XHJoYedG/BVVKM5y3mPsxIEtcOpe9
         I/o0ZJikeiDZWbu6cm6R7KrHruO7mO0wQOTonc3+8nAnYeX9NN/CBdo/a+DMEoZ9AVkt
         tJV7TQWDwGrMGqXacYVT3i34FbaTQwfqjdnRkrcB4XnsXlsNKfMAUPuj5lU5Q7N8H4DP
         q8CopgV8eeG2G5dDAHSQBOp3UEtJppjf+Am156cMhbr6JPoZJbUliFmWxqJJ6PEjntWf
         AYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2B+RDyLFDbl/DZ6V0cBxl3hPqOfCVbtJ2fKT6sqWcu6dabEP2sRbx/XYRWEdNL3cVZSv6dtgVIrTz7NheVjQHsmk8qrg3Eu/c
X-Gm-Message-State: AOJu0YxexOr7gWOCWygBjqUI9tRQl55m0M1XDZetTYtu7s1Gz8WPNfB1
	pnzeTfgCIPd5N9ImZ0zWJwitY/URJ9fUHC3atyJFawR06r53W9tv1VzYDmOrwJxhCkRSpDdoJlT
	RZNX+WkR2Atv68DC0Yw==
X-Google-Smtp-Source: AGHT+IFCxPs0hzUflzzz70jRYwVRx4Gd4jDUqm7Yw06oBbmfCbRIBM9zwU8x8QPsTa/dYviA394CpxXkoxFldKzv
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:2381:b0:e05:65b7:32d9 with
 SMTP id 3f1490d57ef6-e0565b7352bmr91773276.6.1720654966908; Wed, 10 Jul 2024
 16:42:46 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:13 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-10-jthoughton@google.com>
Subject: [RFC PATCH 09/18] KVM: x86: Add vCPU fault fast-path for Userfault
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Peter Xu <peterx@redhat.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	David Matlack <dmatlack@google.com>, James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Without this fast-path, we will take the asynchronous userfault path
every time, which is inefficient.

As implemented today, KVM Userfault isn't well optimized at all, but I'm
providing this optimization because something like this will be required
to significantly improve post-copy performance. Memory fault exits for
userfaultfd were proposed for the same reason[1].

[1]: https://lore.kernel.org/kvm/20240215235405.368539-7-amoorthy@google.com/

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6b6a053758ec..f0dbc3c68e5c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4380,6 +4380,13 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (fault->is_private)
 		return kvm_faultin_pfn_private(vcpu, fault);
 
+	/* Pre-check for userfault and bail out early. */
+	if (gfn_has_userfault(fault->slot->kvm, fault->gfn)) {
+		fault->pfn = KVM_PFN_ERR_USERFAULT;
+		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		return -EFAULT;
+	}
+
 	async = false;
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, false,
 					  &async, fault->write,
-- 
2.45.2.993.g49e7a77208-goog

