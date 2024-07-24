Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78331B813
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721783481; cv=none; b=BqGXKWuHcCjt5DUg0PsjU/4fpLEmcQFL7VMZaXLrr7gn4cff11bx8NAjVl7fiGiT7nu0EJuaC4xLXCBqlc4bCkNDgzz1z7Dl6qwL5l5ZfAQyk8UFMbgGWcmRq8CS33lWAnSyfpqfdEaWZcuzY4X3bZA66m7LdtZNebFBgMLL00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721783481; c=relaxed/simple;
	bh=m1fa3ZDpVnv4zEi0VZF20BrwMEl3RMOGRGSa81uq+1c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EF2YKEu9jSHs8HkeJ6Eg82CHM764741dppdkS/n9q6ZiX4efODLaR1/iRygDeUMviaB5TTWRGA1KzhayUFwwZ86GOXseSpBYR7ah27gmfgP/VuUXY8CAP4/1k0jaBjyWVdePs967EFsyLcq6U7nwTSvVFQ1ZXsQOOxQ6XKIaMRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3norkF/4; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3norkF/4"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e03a544b9c8so12344700276.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 18:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721783479; x=1722388279; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RjwIFwaGyFm0pqYoSJRPlexY59ZZdKZ6ixfPL8P7AvM=;
        b=3norkF/4/X8q44aP2fcXXTaMRHxAtCeh3XZWIfKimDOntPqAdetvYgYV9O9pE3LXZ5
         Sy1bQcY9XitVeHVby2QRO62m6B64cLIfrF59B4gq9OBJELj2DxnTJLSkOtpxameAtY4W
         p6JT4OWRdcvByle+LZGWwuOHZrX0b7h5rpvdWMU/h91PILsXTWOEHjJXm5I2Ej6oLIA1
         lagi2Pis30TmJ+hbhWvoTFXoqvBAMEiAIZUSvIt88SDiB2vSyvChbOIv3xocFDQrV4yu
         RfoS34m63GvCXQPHvUhe7KjWQUtfgCqM8gZ0PAXV/fx/DHNRzvRRxGIf56ZMkms1URLj
         CB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721783479; x=1722388279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjwIFwaGyFm0pqYoSJRPlexY59ZZdKZ6ixfPL8P7AvM=;
        b=BhBh2XvJmSuGJPg1V76k3/E0TiYnkMRPU1+SSkwTZRFoL9M47JHF02ujsQlQuBBhlO
         cHLZhc2zfDoaE5CYeTmhdEtzXI5N0xI4cX/gm0eA2j7FPd5HnWn1u71zbwk4tyKDZe4/
         C3ngn4chIl1DAU8bh1Wxb7+sk4WPNrLOsQQLxHjjnXNIoEA367mHlqvg/9qTP3xWO7NQ
         +BuiGpVImW5wfMjoDgmhOCHGTxSnVSpBk+09IOHKxSqd6FyrrzY1KlMpzvlHaz+VX+Ff
         MRKGQfh5Wt+IGKOCyTUUiU4L+9nffhepxO3RZJgffnHnhY6LwZK0j1MuGViFcriZmrEH
         KNow==
X-Forwarded-Encrypted: i=1; AJvYcCUJeOZgAsALPmw9LJwAY2UaOV/LlmuHuyHqv//E2z5eTKQI5sOuTB2cf1MDnljF4xLQkm/JKR8fnsBGA3Iu0O19r4+fnw2uw50K
X-Gm-Message-State: AOJu0YxaOlbwb+M2E5MDPJr4+q7qvq3bn8HdFu7jiAeOpId3S2t1fKO4
	0RJOviU2bTQJMcpqxr9RW8iQsgB5Fv6/m8+PaifeTCY+E4e8WzpcRUbQdZGiotwZHY6xitSx1rk
	k1bN0Sv5Ck7AX5g+iMA==
X-Google-Smtp-Source: AGHT+IEf8LhPu+J2AQj8JKbpYxC+Q+/7UmZG6e+vLGbTXrpNe4bcC8God4ZSRUYFG8d6cpp91FbqTUc9FhMyYUjh
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:20ca:b0:e08:5554:b2be with
 SMTP id 3f1490d57ef6-e0b0e60b370mr1189276.9.1721783478588; Tue, 23 Jul 2024
 18:11:18 -0700 (PDT)
Date: Wed, 24 Jul 2024 01:10:31 +0000
In-Reply-To: <20240724011037.3671523-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240724011037.3671523-7-jthoughton@google.com>
Subject: [PATCH v6 06/11] mm: Add has_fast_aging to struct mmu_notifier
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

has_fast_aging should be set by subscribers that non-trivially implement
fast_only versions of both test_young() and clear_young().

Fast aging must be opt-in. For a subscriber that has not been
enlightened with "fast aging", the test/clear_young() will behave
identically whether or not fast_only is given.

Given that KVM is the only test/clear_young() implementer, we could
instead add an equivalent check in KVM, but doing so would incur an
indirect function call every time, even if the notifier ends up being a
no-op.

Add mm_has_fast_young_notifiers() in case a caller wants to know if it
should skip many calls to the mmu notifiers that may not be necessary
(like MGLRU look-around).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/mmu_notifier.h | 14 ++++++++++++++
 mm/mmu_notifier.c            | 26 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 45c5995ebd84..e23fc10f864b 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -233,6 +233,7 @@ struct mmu_notifier {
 	struct mm_struct *mm;
 	struct rcu_head rcu;
 	unsigned int users;
+	bool has_fast_aging;
 };
 
 /**
@@ -387,6 +388,7 @@ extern int __mmu_notifier_clear_young(struct mm_struct *mm,
 extern int __mmu_notifier_test_young(struct mm_struct *mm,
 				     unsigned long address,
 				     bool fast_only);
+extern bool __mm_has_fast_young_notifiers(struct mm_struct *mm);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
 extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
@@ -449,6 +451,13 @@ static inline int mmu_notifier_test_young_fast_only(struct mm_struct *mm,
 	return 0;
 }
 
+static inline bool mm_has_fast_young_notifiers(struct mm_struct *mm)
+{
+	if (mm_has_notifiers(mm))
+		return __mm_has_fast_young_notifiers(mm);
+	return 0;
+}
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
@@ -653,6 +662,11 @@ static inline int mmu_notifier_test_young_fast_only(struct mm_struct *mm,
 	return 0;
 }
 
+static inline bool mm_has_fast_young_notifiers(struct mm_struct *mm)
+{
+	return 0;
+}
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index f9a0ca6ffe65..f9ec810c8a1b 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -382,6 +382,26 @@ int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 	return young;
 }
 
+bool __mm_has_fast_young_notifiers(struct mm_struct *mm)
+{
+	struct mmu_notifier *subscription;
+	bool has_fast_aging = false;
+	int id;
+
+	id = srcu_read_lock(&srcu);
+	hlist_for_each_entry_rcu(subscription,
+				 &mm->notifier_subscriptions->list, hlist,
+				 srcu_read_lock_held(&srcu)) {
+		if (subscription->has_fast_aging) {
+			has_fast_aging = true;
+			break;
+		}
+	}
+	srcu_read_unlock(&srcu, id);
+
+	return has_fast_aging;
+}
+
 int __mmu_notifier_clear_young(struct mm_struct *mm,
 			       unsigned long start,
 			       unsigned long end,
@@ -394,6 +414,9 @@ int __mmu_notifier_clear_young(struct mm_struct *mm,
 	hlist_for_each_entry_rcu(subscription,
 				 &mm->notifier_subscriptions->list, hlist,
 				 srcu_read_lock_held(&srcu)) {
+		if (fast_only && !subscription->has_fast_aging)
+			continue;
+
 		if (subscription->ops->clear_young)
 			young |= subscription->ops->clear_young(subscription,
 								mm, start, end,
@@ -415,6 +438,9 @@ int __mmu_notifier_test_young(struct mm_struct *mm,
 	hlist_for_each_entry_rcu(subscription,
 				 &mm->notifier_subscriptions->list, hlist,
 				 srcu_read_lock_held(&srcu)) {
+		if (fast_only && !subscription->has_fast_aging)
+			continue;
+
 		if (subscription->ops->test_young) {
 			young = subscription->ops->test_young(subscription, mm,
 							      address,
-- 
2.46.0.rc1.232.g9752f9e123-goog

