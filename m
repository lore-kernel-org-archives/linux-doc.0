Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22D1F03CE
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339664; cv=none; b=B8DBraxB0oVrMh1INArWI7wMbThgI3nSjmHPF6wAPN487swgm2n96B8WfOmQx0lfRdSCZzX0eEkidOXJmuuMuN7iS4nyvTzh/oAUGDFUXKyM0OvuYB8suoXJZpGUeeidlmY251aiyrnCTNP4FydtflEkg7RkZu9bDibO5A2RouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339664; c=relaxed/simple;
	bh=7uKPJu5MZttnLGZHU4AcApt1HeYqG3NuIftXyYnBeQo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mNMFJ99NDnboCh/yADfP1YcqoPPMPCiDRtv7+lkKl/upGP6dzcs7Xdw5u2GnC8stm3V12UmznVvWk5ySYOgcTzgKOqzqMtQ2jTOsG3MunmK2eKPK7qL9ZmTiWZCfiNfZkwTUCtZg68OulXTM6jJbiOLyBIt+8zDI0IupwF3zrE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JPNoCfaY; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JPNoCfaY"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7b69c165621so16230685a.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339661; x=1733944461; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LkXqlJAd4fQvrkyb/GIMYTRcu+OGHQVMPLjSgCJbVo=;
        b=JPNoCfaY5nuJ94PckOEx0Hov6Dil/1/XKbDK88WvHtYQ+sXLAShjjzstxZ8gtplxf8
         0WB/9hlsxv9yIrXYE/5PSiyy8mrGpIlWMsaoN1Y2xaojf3FQTYjSBWH5hhK5t6hMm3Ri
         yafWI5m+DVPPc9lLjVLrFkR4fcHKcWtjRndprEwkipUwvmJVUAdyHGi/k3d5sR35gKsc
         OiFCqGjYvYsdPAg6Xpj8jdJG8p2ZOSgoy4qG4gEWxRu55IlBoANsI3BnhprViMF6IGqH
         TDNuRJlfKqgNAKPOcDfC6kifvYOOpLpUz1E5tUyDPOe4OHjoJLXPszDFwhMVPwoowdRQ
         aP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339661; x=1733944461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LkXqlJAd4fQvrkyb/GIMYTRcu+OGHQVMPLjSgCJbVo=;
        b=luD0QYBVIeDr77Vw4Mflxn0EHbt0fauxwpByDRPazynzmkZ9ZWEO6AUI8gQ16BO7bb
         0KWlGAHU0e4B/LSyXyWVPWMtFZqhLldiUKj5wfjTPwbSUnT9NSVrNk/AeaQ0udwg+HV2
         eVBkZ3hCI4jDPDf/dxnNOw3ba3mSfD7gsaqyeBXBDIaj88sOH+TysgAgWU8uAkYAIt53
         o9j91G5N9liDaslicMdnbtfc/VWORRfPsBv6adpt3vrRxkTV2BrMQDw/zsGOrweOQpsE
         zvgx6ExQ281hzud74wKVIuvOglScmO2WItYVTG1eQHB5TLq2oS3phZGvl0IDLjgDPLxx
         qhuw==
X-Forwarded-Encrypted: i=1; AJvYcCWuBj6Au2Ik4csZf+xRgEUR/xOArPVLG4kqTWRELGHZ141yPnO743fgYALNz4Kr7ECN6Hr4pbSjzpU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4R7KcpzBsFI7sDO5W6chqO3DLD9rjHJAYA9upQUb3NLGVV/8
	AfdaFzSYGxt+8N08dto7eA6yPbL/jsPNogo4Y1XiUZV/TYOZpuZS0PlH+l2LbKszs1l8kadAzzn
	EgTx0Vzm81L90/i/rJQ==
X-Google-Smtp-Source: AGHT+IG2YC7xA0GwWXk+cMxHq3A6sTNXchADXjRqs7ScJbz/ng/FU66WmJEiNslyAxyIF4C+tDiCnDtGEeEHeuoK
X-Received: from uah9.prod.google.com ([2002:a05:6130:5209:b0:856:f0b0:717])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:40c2:b0:7b6:6b07:e80d with SMTP id af79cd13be357-7b6abbb7350mr835946485a.57.1733339661300;
 Wed, 04 Dec 2024 11:14:21 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:41 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-7-jthoughton@google.com>
Subject: [PATCH v1 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Adhering to the requirements of KVM Userfault:

1. When it is toggled (either on or off), zap the second stage with
   kvm_arch_flush_shadow_memslot(). This is to (1) respect
   userfault-ness and (2) to reconstruct block mappings.
2. While KVM_MEM_USERFAULT is enabled, restrict new second-stage mappings
   to be PAGE_SIZE, just like when dirty logging is enabled.

Signed-off-by: James Houghton <jthoughton@google.com>
---
  I'm not 100% sure if kvm_arch_flush_shadow_memslot() is correct in
  this case (like if the host does not have S2FWB).
---
 arch/arm64/kvm/Kconfig |  1 +
 arch/arm64/kvm/mmu.c   | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..d89b4088b580 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select HAVE_KVM_USERFAULT
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a71fe6f6bd90..53cee0bacb75 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1482,7 +1482,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active) {
+	if (logging_active || kvm_memslot_userfault(memslot)) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1571,6 +1571,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	if (kvm_gfn_userfault(kvm, memslot, gfn)) {
+		kvm_prepare_memory_fault_exit(vcpu, gfn << PAGE_SHIFT,
+					      PAGE_SIZE, write_fault,
+					      exec_fault, false, true);
+		return -EFAULT;
+	}
+
 	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
 				&writable, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
@@ -2062,6 +2069,20 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	u32 changed_flags = (new ? new->flags : 0) ^ (old ? old->flags : 0);
+
+	/*
+	 * If KVM_MEM_USERFAULT changed, drop all the stage-2 mappings so that
+	 * we can (1) respect userfault-ness or (2) create block mappings.
+	 */
+	if ((changed_flags & KVM_MEM_USERFAULT) && change == KVM_MR_FLAGS_ONLY)
+		kvm_arch_flush_shadow_memslot(kvm, old);
+
+	/*
+	 * Nothing left to do if not toggling dirty logging.
+	 */
+	if (!(changed_flags & KVM_MEM_LOG_DIRTY_PAGES))
+		return;
 
 	/*
 	 * At this point memslot has been committed and there is an
-- 
2.47.0.338.g60cca15819-goog

