Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375D620103A
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455798; cv=none; b=V0+91h+jo7XJo8bpJiDjU4TzX8gy05txSL8CGjMIOqLm1A0KqmCLV7ltDlfQytx70PyfdHV5uFPLTz146eEJ0U4VILbaLA+JSko2v0CjJHi+85gltg1L7gRLjlYSbh3cUeJ5287Kp/w0iZHYqulyQoutXym4y6PWHo9UehSAN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455798; c=relaxed/simple;
	bh=6egPkffTqCljeChAEC1xtjQx5okoA3w1tTDlM9Q/gaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uRy7MlTSkfSODVqQ7VJTT+7f0hXqgK91Vg1rf0w+/G9kZpv2zq96VbXXN/Ek5c62kBsbjHkMdw9M7K0hkjSyzioyG57kJcvLN4FRHAueE75jn2PM1/SMNvbbiORM3FFUhwlTWij3XwbvBVAPLLykU3SIkUII9CDpJoZLNtaqyO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ufEASTQR; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ufEASTQR"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7b6e9fb0436so355197385a.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455796; x=1737060596; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wiJ4r6U+4DKwl7a0Sm0LZeZPdZmNUbmXckiwF/fu60=;
        b=ufEASTQRfOty4pmHjO1Estca+rcvTERGUu2gZN4b85yJsQ0tsrrGcfIov4vM74s8tw
         FC8KjmaTzJ23QUa7ggMsdJnsOK9TBDqmrgzhebLvAEfI7ckwLn6gcjnPXKWreQIte1BD
         429CUj/kxserARkbjufgOuNr8aYAhNmJcP519hg+m/xlVTwjIrDIQ5Bszk709Fnj6KgC
         IBtQYuUAEJcRarEXZFXqxRbejeifzLRAO4NS5V8/Q9eDPk0BrqUKi3zgdNHufEbz7vxZ
         pZhg4EQfLv1hLw/k0auVh0CCxiiullcAypWBP7olJEE7WZ5xtYLG83Ik5KiF1m1I7gov
         K9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455796; x=1737060596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wiJ4r6U+4DKwl7a0Sm0LZeZPdZmNUbmXckiwF/fu60=;
        b=nkLMrgUxkEODRUzLKLhXjJw0MzAOYOfQhY7CI7CqgjQeAN4lXSl5aFrFte1m4z607b
         gDKuJeMqbIJh0quBNvIBE0FBVCNrRuK5erqV2sCy50Rd06inZ1LGaNtMGrgdMHSLVK2o
         sfnDOGyhfHjQaIpMR4vagWUgYBGdboQcvWQBjY1d95dpNlrte8M4fmDVQ99Xf3TypR0u
         hyWbEM6jVXj1Zyzu9hmSU4s5eV1HaaMOqiVxhCz0fKYfIt/hOvJ2GQ8/d15VtqLGZg1U
         IMVhn1GV5Udg9DhFO4XFU3nzUzp/8NvNn2FmyvItcwoqyUufkXpZt6yz+W6ISSagDoTB
         gokA==
X-Forwarded-Encrypted: i=1; AJvYcCVLKPLMoNUE0KdS40oIELeVoIB1ZfHlQUxiGDdFaviHNux0OaXQKEg4q15n6inJoGeX5VseaLq5fOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPT8kHGUq1p7mDRdUMiy9FrBYmho4sHsLq5z+tg3qqHYgMntOV
	0oUkcpXiwgzjbxMot/pqhUi9MlSop9kCWHmjC1oGqCGWy77REq5XVFaKEdlf5EMfRboC833aJ7+
	bu68+41WbeoL+DzRe4Q==
X-Google-Smtp-Source: AGHT+IG26IPp3qbl2E13g/CbVexbYg/eWO5E84o5Ua+axOZx93ciuXt5lAWy60cQgF+PsXPiSlHQOVHo5aFaWyuK
X-Received: from qkkl1.prod.google.com ([2002:a37:f501:0:b0:7b6:e209:1c29])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:d87:b0:7b6:d632:37cf with SMTP id af79cd13be357-7bcd9729affmr1146945885a.3.1736455796215;
 Thu, 09 Jan 2025 12:49:56 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:17 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-2-jthoughton@google.com>
Subject: [PATCH v2 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Use one of the 14 reserved u64s in struct kvm_userspace_memory_region2
for the user to provide `userfault_bitmap`.

The memslot flag indicates if KVM should be reading from the
`userfault_bitmap` field from the memslot. The user is permitted to
provide a bogus pointer. If the pointer cannot be read from, we will
return -EFAULT (with no other information) back to the user.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h | 14 ++++++++++++++
 include/uapi/linux/kvm.h |  4 +++-
 virt/kvm/Kconfig         |  3 +++
 virt/kvm/kvm_main.c      | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..f7a3dfd5e224 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -590,6 +590,7 @@ struct kvm_memory_slot {
 	unsigned long *dirty_bitmap;
 	struct kvm_arch_memory_slot arch;
 	unsigned long userspace_addr;
+	unsigned long __user *userfault_bitmap;
 	u32 flags;
 	short id;
 	u16 as_id;
@@ -724,6 +725,11 @@ static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 }
 #endif
 
+static inline bool kvm_has_userfault(struct kvm *kvm)
+{
+	return IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT);
+}
+
 struct kvm_memslots {
 	u64 generation;
 	atomic_long_t last_used_slot;
@@ -2553,4 +2559,12 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range);
 #endif
 
+int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
+		      gfn_t gfn);
+
+static inline bool kvm_memslot_userfault(struct kvm_memory_slot *memslot)
+{
+	return memslot->flags & KVM_MEM_USERFAULT;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 343de0a51797..7ade5169d373 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -40,7 +40,8 @@ struct kvm_userspace_memory_region2 {
 	__u64 guest_memfd_offset;
 	__u32 guest_memfd;
 	__u32 pad1;
-	__u64 pad2[14];
+	__u64 userfault_bitmap;
+	__u64 pad2[13];
 };
 
 /*
@@ -51,6 +52,7 @@ struct kvm_userspace_memory_region2 {
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
 #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
+#define KVM_MEM_USERFAULT	(1UL << 3)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..9eb1fae238b1 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -124,3 +124,6 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config HAVE_KVM_USERFAULT
+       bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..4bceae6a6401 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1541,6 +1541,9 @@ static int check_memory_region_flags(struct kvm *kvm,
 	    !(mem->flags & KVM_MEM_GUEST_MEMFD))
 		valid_flags |= KVM_MEM_READONLY;
 
+	if (kvm_has_userfault(kvm))
+		valid_flags |= KVM_MEM_USERFAULT;
+
 	if (mem->flags & ~valid_flags)
 		return -EINVAL;
 
@@ -1974,6 +1977,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if ((mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_USERFAULT &&
+	    ((mem->userfault_bitmap != untagged_addr(mem->userfault_bitmap)) ||
+	     !access_ok((void __user *)(unsigned long)mem->userfault_bitmap,
+			DIV_ROUND_UP(mem->memory_size >> PAGE_SHIFT, BITS_PER_LONG)
+			 * sizeof(long))))
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -2042,6 +2051,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if (r)
 			goto out;
 	}
+	if (mem->flags & KVM_MEM_USERFAULT)
+		new->userfault_bitmap =
+		  (unsigned long __user *)(unsigned long)mem->userfault_bitmap;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
@@ -6426,3 +6438,26 @@ void kvm_exit(void)
 	kvm_irqfd_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
+
+int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
+		       gfn_t gfn)
+{
+	unsigned long bitmap_chunk = 0;
+	off_t offset;
+
+	if (!kvm_memslot_userfault(memslot))
+		return 0;
+
+	if (WARN_ON_ONCE(!memslot->userfault_bitmap))
+		return 0;
+
+	offset = gfn - memslot->base_gfn;
+
+	if (copy_from_user(&bitmap_chunk,
+			   memslot->userfault_bitmap + offset / BITS_PER_LONG,
+			   sizeof(bitmap_chunk)))
+		return -EFAULT;
+
+	/* Set in the bitmap means that the gfn is userfault */
+	return !!(bitmap_chunk & (1ul << (offset % BITS_PER_LONG)));
+}
-- 
2.47.1.613.gc27f4b7a9f-goog

