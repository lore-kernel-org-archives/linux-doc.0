Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC311591F3
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654963; cv=none; b=sJ2AEmtljB/hrMOCccESqIrlTqXJvF1fTALLzPlIdlDiKCqUQKpi6B2F2H85h73zDYPN5XQBCE/pBwF3WPLtaObvKJKrghzVKOu1xABg7uNliYfDFkiLK1YfLtLyEZUv7ezLGCSpuZLxXeFJDrPSetdBrH7iLm9oQlu1IOe5JeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654963; c=relaxed/simple;
	bh=IdpdyzI/6CbiUVqWLoyfJDrAPLlE8GztB50eBsdtlK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nB5PUJ4jny1zf1a5VyFpXzYC6ihFeoZIJ+H0mfPycqionFezcOTZN17xubokQWFnJJqAK31FGmcop3b3N+tb1IvLQgMyohBlAd231qOISbxAngFSMaqeXQTiCz1ULG5aqsA1vyCJpSWjSSFHG5+PugBOmuGQafpKWykClOVd7Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z6xVYPuY; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z6xVYPuY"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e035f7b5976so696073276.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654961; x=1721259761; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsFdXvbgPwi63ncubEeloKTN1KDlxflVjQmCEhWWdzo=;
        b=z6xVYPuY9u9DnW1D08N6UbeW4WZ3lUpA0I54oa32ZS+jwfhopM+OARVmeh/DzyA0Ez
         KFaZFARK1UBLXqQSP/uJ6HN/yKtjRP2WDCGu5y984nR1Gx5xnC6ILzS92NJGzSzYKLd6
         zC0HT4uFaPdIOPkpumTOqIAc8bth+T1YosTp3WusDi9xffnpvMU/xKFnELAx2SzUH2cO
         4kf1NAuphTdbP5Y8p4TkC2xEpSPiJV184S33CjBr24Zobjdu+vOVnP92S2c8LlpmcAF6
         8zF5+zlQ2FwaxxHQo6UXUB2lYiS8pS7FsWlUVBqSTBU0+pfGWJg8yjGtG+M5WnsBXw/q
         XAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654961; x=1721259761;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsFdXvbgPwi63ncubEeloKTN1KDlxflVjQmCEhWWdzo=;
        b=V/NhH50aGxAkCa6m0ILns2uaJPb4Qy9rywgrZ1AxRO0AIUZJCv+Iv9IpOg8SKHwhNq
         9JJXRCiDwfqIeRRxRioO1tBwpV0IENbqJA1cdYkhIBt4txSnX3dJxtydqDO3RamrTVra
         X0PxSxL9KQ40zimsNoseAwWEFsaeKXwRIxIg4ljNdmm+oT+6qpiU8W1QD7DYF1nLmuYr
         jk1LV7nkgvtDeoKhLl5H/21ekF8j/Oc3Y6RISQf9UoXLxtvi6tks+WwtKCEAmJob8o4E
         KMLV5viAXSM4e30je1y9VuLiSkm2IjIYTw6f5zjFV9Y/ccRpb++t25V0pYn8Lp6kfCND
         TCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2HyLntoWo+R8rEJbRp2bt/yPDDuhL7w9cJhREOahSA/K45GV750hX/kjl7ex58BD8VqK0v7QtuRhMEEclZaZ5B2eNVEU8FP9i
X-Gm-Message-State: AOJu0YyFw+/L5hghoDs/iWl3bE5mM1AtBmNYLqCDrdtNqFMSUV15D59V
	u5uAxyuF9JkA/uUhDoEG08n0ZIR++aBzcZMLprqnQXggeiGdlhrKOZ/hyQsYf5OTGUYmBZ2ek9U
	WztI+f0LIZnjXPuRDMg==
X-Google-Smtp-Source: AGHT+IG3Vk6X5wTdtR4KaDZB2edBlrlcDT80/rqBxWjm1e2N+7Y128jb+W0Gi/uqye/vInLab8G3pghPeGswAEHn
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:2309:b0:e05:6532:aa4b with
 SMTP id 3f1490d57ef6-e05780396ccmr53350276.2.1720654960837; Wed, 10 Jul 2024
 16:42:40 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:07 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-4-jthoughton@google.com>
Subject: [RFC PATCH 03/18] KVM: Put struct kvm pointer in memslot
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

Because a gfn having userfault enabled is tied to a struct kvm, we need
a pointer to it. We could pass the kvm pointer around in the routines we
need it, but that is a lot of churn, and there isn't much of a downside
to simply storing the pointer in the memslot.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h | 2 ++
 virt/kvm/kvm_main.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f0d4db2d64af..c1eb59a3141b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -596,6 +596,8 @@ struct kvm_memory_slot {
 		pgoff_t pgoff;
 	} gmem;
 #endif
+
+	struct kvm *kvm;
 };
 
 static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fb7972e61439..ffa452a13672 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1769,6 +1769,7 @@ static void kvm_copy_memslot(struct kvm_memory_slot *dest,
 	dest->flags = src->flags;
 	dest->id = src->id;
 	dest->as_id = src->as_id;
+	dest->kvm = src->kvm;
 }
 
 static void kvm_invalidate_memslot(struct kvm *kvm,
@@ -2078,6 +2079,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
+	new->kvm = kvm;
 	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
 		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
 		if (r)
-- 
2.45.2.993.g49e7a77208-goog

