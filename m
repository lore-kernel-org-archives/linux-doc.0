Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5FF175AE
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 01:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721783482; cv=none; b=cc3eEFxlr2ikd2NYy+pm1/GpqT9Mn9yCAP9bKMTpNiHove3JwWC0CfyuD3J1lFJE8Bz78aKftxoC869SNd9QAa2zGIWzR54nWay6O8dmXAMhJ90Mg4tQwkSM/UGIfZU7HYWgPYACHiyVFTadN5fxk2TEfiT+crFiNRcrQP5mds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721783482; c=relaxed/simple;
	bh=N5AHs84+wpgYLDGxUmkx9bJFeW6BOJNbxRrcWmqH1lk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F+t6hYgvK9dCvqDIf/GmWwpFd4icEPqlItLaijMpIN4BWEw0H1zgOkn0lUZQ07DPyA3l80ueq5aYkJyi+3LoqeahhhG1LPIH/n42kxQE8WPihi3x4IrHah1rr6YY/YLCmXzlHjZOQyVtQc3rYt+wBTevwP4zVsKKk9yVYlk7u5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cv2C6y75; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cv2C6y75"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e05ec8921fdso12788627276.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 18:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721783478; x=1722388278; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLmhrACopMN8CDbTxEqiwIPa4YrGM6ZGpV4/JEvInYA=;
        b=cv2C6y75tStRoH+VCIO9H2YHmVTnaEiyNDGtxnEX2BndhiIQjMzsn5TbbgY9XUUDKb
         DXUw9+A7KH92VLi6wp1ynAqqSKzTZlraOHXsgt+YD5t8vskwMNbZwfnMz/9maP2iTNrD
         YdpJpHc3/DRmz9QCe6pD9aZ2OFoxw1Vr/nEFcDsKvyOQBIsMQYPPjC03rsA9mvp1L7jW
         ziSBHaATO521DZWgQcvn3v3ON742LoFvOl02HxVieUzEyEfIYyxyEZ1obMU1yHfeonhL
         +KGUKH/1Ucyy7ELfRt1H1t1ueL8XOIFT4O3SvrrCy2BJkart5zz45IzgffEKfMya7GlD
         cK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721783478; x=1722388278;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLmhrACopMN8CDbTxEqiwIPa4YrGM6ZGpV4/JEvInYA=;
        b=bKs+yUr8wDhsReU3/HYNWxukKYueriU94xbFSuvLJEZvIQ1fjfq4zCnRQfTjirhCJj
         WgncNi2C+x7gpsV2YhBpL4cZsqGszNpbbAduNUlfxuBQBcdCHIyXlcA1XFPyc2rd+DFP
         hDQS03eA4bgsRM/JvMgFxCU1Hhw1iAEW9Ao8gBNv/j3+N87ptUMAGcU3s4bokE79pFoD
         oWimzHAIHfcBdS44Lj2cO/dM+sLI1QXSkCZDv5y8kNRomaDW/boFIvoVUZ1aqzCXnsHA
         +HwIgs1z2qVZKP/q6k9oFUkGzcnzsO8lITL5Q08Pxc2EDnVnIRSB0fwvnW+11nttWSaI
         dt5A==
X-Forwarded-Encrypted: i=1; AJvYcCUH5f8FAGC0V/gjfOEKGxfsbUJUm6PCO+ycXfNMxSB93h6FJJ0Ru1K/18I7DJxhW/BMXqTecuK5h/P1kG8DRD9d/rBE+uZMTKSN
X-Gm-Message-State: AOJu0YwGJ50XHcRNYZzhfhMm2YkKI/c+hnjCzByo0JUntqIy+8fiLE0n
	HI01LiRGSeHGkpDWOdhDzcO/SrqtYKznORON6xvRiRh7GKJ7b9Ig7gPP6of/bD52YVX5+syTlfu
	oDPz2l07Jrn/gyl5OvA==
X-Google-Smtp-Source: AGHT+IGmLYw0C2YUyk3sIv0ePZsCocY4rFKls0LnHS1LhedGuIns0QZPtcJEKudMyoCE03fu3hfho3QJFpB7QIkQ
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:100f:b0:e05:fb86:1909 with
 SMTP id 3f1490d57ef6-e0b0982aef8mr23085276.6.1721783477681; Tue, 23 Jul 2024
 18:11:17 -0700 (PDT)
Date: Wed, 24 Jul 2024 01:10:30 +0000
In-Reply-To: <20240724011037.3671523-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240724011037.3671523-6-jthoughton@google.com>
Subject: [PATCH v6 05/11] mm: Add fast_only bool to test_young and clear_young
 MMU notifiers
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

For implementers, the fast_only bool indicates that the age information
needs to be harvested such that we do not slow down other MMU operations,
and ideally that we are not ourselves slowed down by other MMU
operations.  Usually this means that the implementation should be
lockless.

Also add mmu_notifier_test_young_fast_only() and
mmu_notifier_clear_young_fast_only() helpers to set fast_only for these
notifiers.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/mmu_notifier.h | 46 +++++++++++++++++++++++++++++++-----
 include/trace/events/kvm.h   | 19 +++++++++------
 mm/mmu_notifier.c            | 12 ++++++----
 virt/kvm/kvm_main.c          | 12 ++++++----
 4 files changed, 67 insertions(+), 22 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index e2dd57ca368b..45c5995ebd84 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -110,7 +110,8 @@ struct mmu_notifier_ops {
 	int (*clear_young)(struct mmu_notifier *subscription,
 			   struct mm_struct *mm,
 			   unsigned long start,
-			   unsigned long end);
+			   unsigned long end,
+			   bool fast_only);
 
 	/*
 	 * test_young is called to check the young/accessed bitflag in
@@ -120,7 +121,8 @@ struct mmu_notifier_ops {
 	 */
 	int (*test_young)(struct mmu_notifier *subscription,
 			  struct mm_struct *mm,
-			  unsigned long address);
+			  unsigned long address,
+			  bool fast_only);
 
 	/*
 	 * invalidate_range_start() and invalidate_range_end() must be
@@ -380,9 +382,11 @@ extern int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 					  unsigned long end);
 extern int __mmu_notifier_clear_young(struct mm_struct *mm,
 				      unsigned long start,
-				      unsigned long end);
+				      unsigned long end,
+				      bool fast_only);
 extern int __mmu_notifier_test_young(struct mm_struct *mm,
-				     unsigned long address);
+				     unsigned long address,
+				     bool fast_only);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
 extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
@@ -416,7 +420,16 @@ static inline int mmu_notifier_clear_young(struct mm_struct *mm,
 					   unsigned long end)
 {
 	if (mm_has_notifiers(mm))
-		return __mmu_notifier_clear_young(mm, start, end);
+		return __mmu_notifier_clear_young(mm, start, end, false);
+	return 0;
+}
+
+static inline int mmu_notifier_clear_young_fast_only(struct mm_struct *mm,
+						     unsigned long start,
+						     unsigned long end)
+{
+	if (mm_has_notifiers(mm))
+		return __mmu_notifier_clear_young(mm, start, end, true);
 	return 0;
 }
 
@@ -424,7 +437,15 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 					  unsigned long address)
 {
 	if (mm_has_notifiers(mm))
-		return __mmu_notifier_test_young(mm, address);
+		return __mmu_notifier_test_young(mm, address, false);
+	return 0;
+}
+
+static inline int mmu_notifier_test_young_fast_only(struct mm_struct *mm,
+						    unsigned long address)
+{
+	if (mm_has_notifiers(mm))
+		return __mmu_notifier_test_young(mm, address, true);
 	return 0;
 }
 
@@ -613,12 +634,25 @@ static inline int mmu_notifier_clear_young(struct mm_struct *mm,
 	return 0;
 }
 
+static inline int mmu_notifier_clear_young_fast_only(struct mm_struct *mm,
+						     unsigned long start,
+						     unsigned long end)
+{
+	return 0;
+}
+
 static inline int mmu_notifier_test_young(struct mm_struct *mm,
 					  unsigned long address)
 {
 	return 0;
 }
 
+static inline int mmu_notifier_test_young_fast_only(struct mm_struct *mm,
+						    unsigned long address)
+{
+	return 0;
+}
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 74e40d5d4af4..6d9485cf3e51 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -457,36 +457,41 @@ TRACE_EVENT(kvm_unmap_hva_range,
 );
 
 TRACE_EVENT(kvm_age_hva,
-	TP_PROTO(unsigned long start, unsigned long end),
-	TP_ARGS(start, end),
+	TP_PROTO(unsigned long start, unsigned long end, bool fast_only),
+	TP_ARGS(start, end, fast_only),
 
 	TP_STRUCT__entry(
 		__field(	unsigned long,	start		)
 		__field(	unsigned long,	end		)
+		__field(	bool,		fast_only	)
 	),
 
 	TP_fast_assign(
 		__entry->start		= start;
 		__entry->end		= end;
+		__entry->fast_only	= fast_only;
 	),
 
-	TP_printk("mmu notifier age hva: %#016lx -- %#016lx",
-		  __entry->start, __entry->end)
+	TP_printk("mmu notifier age hva: %#016lx -- %#016lx fast_only: %d",
+		  __entry->start, __entry->end, __entry->fast_only)
 );
 
 TRACE_EVENT(kvm_test_age_hva,
-	TP_PROTO(unsigned long hva),
-	TP_ARGS(hva),
+	TP_PROTO(unsigned long hva, bool fast_only),
+	TP_ARGS(hva, fast_only),
 
 	TP_STRUCT__entry(
 		__field(	unsigned long,	hva		)
+		__field(	bool,		fast_only	)
 	),
 
 	TP_fast_assign(
 		__entry->hva		= hva;
+		__entry->fast_only	= fast_only;
 	),
 
-	TP_printk("mmu notifier test age hva: %#016lx", __entry->hva)
+	TP_printk("mmu notifier test age hva: %#016lx fast_only: %d",
+		  __entry->hva, __entry->fast_only)
 );
 
 #endif /* _TRACE_KVM_MAIN_H */
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 8982e6139d07..f9a0ca6ffe65 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -384,7 +384,8 @@ int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 
 int __mmu_notifier_clear_young(struct mm_struct *mm,
 			       unsigned long start,
-			       unsigned long end)
+			       unsigned long end,
+			       bool fast_only)
 {
 	struct mmu_notifier *subscription;
 	int young = 0, id;
@@ -395,7 +396,8 @@ int __mmu_notifier_clear_young(struct mm_struct *mm,
 				 srcu_read_lock_held(&srcu)) {
 		if (subscription->ops->clear_young)
 			young |= subscription->ops->clear_young(subscription,
-								mm, start, end);
+								mm, start, end,
+								fast_only);
 	}
 	srcu_read_unlock(&srcu, id);
 
@@ -403,7 +405,8 @@ int __mmu_notifier_clear_young(struct mm_struct *mm,
 }
 
 int __mmu_notifier_test_young(struct mm_struct *mm,
-			      unsigned long address)
+			      unsigned long address,
+			      bool fast_only)
 {
 	struct mmu_notifier *subscription;
 	int young = 0, id;
@@ -414,7 +417,8 @@ int __mmu_notifier_test_young(struct mm_struct *mm,
 				 srcu_read_lock_held(&srcu)) {
 		if (subscription->ops->test_young) {
 			young = subscription->ops->test_young(subscription, mm,
-							      address);
+							      address,
+							      fast_only);
 			if (young)
 				break;
 		}
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 33f8997a5c29..959b6d5d8ce4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -874,7 +874,7 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 					      unsigned long start,
 					      unsigned long end)
 {
-	trace_kvm_age_hva(start, end);
+	trace_kvm_age_hva(start, end, false);
 
 	return kvm_handle_hva_range(mn, start, end, kvm_age_gfn);
 }
@@ -882,9 +882,10 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 					struct mm_struct *mm,
 					unsigned long start,
-					unsigned long end)
+					unsigned long end,
+					bool fast_only)
 {
-	trace_kvm_age_hva(start, end);
+	trace_kvm_age_hva(start, end, fast_only);
 
 	/*
 	 * Even though we do not flush TLB, this will still adversely
@@ -904,9 +905,10 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 
 static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 				       struct mm_struct *mm,
-				       unsigned long address)
+				       unsigned long address,
+				       bool fast_only)
 {
-	trace_kvm_test_age_hva(address);
+	trace_kvm_test_age_hva(address, fast_only);
 
 	return kvm_handle_hva_range_no_flush(mn, address, address + 1,
 					     kvm_test_age_gfn);
-- 
2.46.0.rc1.232.g9752f9e123-goog

