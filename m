Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8A16A952
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654973; cv=none; b=T4W9CZSHr+rSnWwA4AXMnn7RaDHhiwzWUA6TQHdRY1XuJOcUpNYLCaxkBekgX5tNtS0pD5gDIZqxmIkYYenqMdbytnJjex2zKTvnELrliaMcpBSdn3zR68GHiCkXrKFrCVemODsSmkpRBxxa2U17d3V5AZoGG/IX7ShMlh2xNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654973; c=relaxed/simple;
	bh=u+awbVx9aoPKS0xGDQreI8aQ8m7YRSIdZYPdiuLJprA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=twkceT7Zsz5mp5W9q7QyF59f/5U5J2/gdSwe8UkCNULmJF+ULtokkqSP7caR5QrIZQU/2hZGZNBw1jMRycz0A0XyRVmjb6/X1zXofOpwZvuGt/rHyhz0tUOg9QyxanxjPnPGRR31yrDPUWXpe915/ybteilQUu9qRgElNCOvmRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e6NELnNh; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e6NELnNh"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-653b4b01872so5683697b3.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654971; x=1721259771; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcajhSgtnKDY4bKjbf4ZVWmvqiJNI58ACmEJvGd9BEA=;
        b=e6NELnNh7DbSwWwtHHEldQJH7sr8xKLGh90dcELCZM/kGuCX6P9o53v/cw1f2kDu4b
         ZfUSQ5xYn+DP5swZ5BsTWD6leZ5xcV3edNNxeM56kih9lKIfKzuPMfP3AplfhTZ9M8xc
         XTsgy54wbezX6YiaA+3FcTyEcZeCmbgBvIOcU0jp4srrEoMRIwPtWUxHGsYwKfOnYPS+
         u0qdLlyKasM4cdWBA8wdzKKFlq2uFHP7KRZwiKwXohYbP9I2jJRtDhy/aOjnn/KOtWRz
         okVqjQr+kEPPOVxGWZWhninG8zhSy92CU8wHG+ifGpWL2auqJsCVBRwFH2XKk1+ife46
         JpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654971; x=1721259771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcajhSgtnKDY4bKjbf4ZVWmvqiJNI58ACmEJvGd9BEA=;
        b=OmY6esLKx/Ixef+4Z2Q+NOKwzE5wMJZCHF1aTLGwx5YnX009OAaGIGJbK5FEs8CXgs
         b9630xXnI48qadQ8MAK8fZbZ9YKm1wGt4volNgahSx2qBar1IdcJyC2WTLvRYn0kIpAn
         +AortaKqhlkQ6BbjG3iCq/9qLmAzFE5zbBkDSAma1Z5nhTI9BuZZyY2tb3/ipLV0yaFh
         L5KtTtucwWoeMoT3vIZdUUpB+F85G3aKD8q585v8dkfcT0Zv6Hbk/WhTI0wG2ckKAU/T
         a/6MWZLSLGkzM3fD2I3h1PDkDOaYTB3Kqrs5nryADAYnKrlHrlRs3AOvTlsixghT9rD9
         x8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVMXb/0+mmdieqawrwteWZfgA/wdXvaAVJpHJKG1tqn3rTXPSxLX8zlFisl0WjMC4hpB3U9+/IAp9BDASVD5Kbf5a4/axXmbGYK
X-Gm-Message-State: AOJu0YxpCA/UP+hwg3IUrlp1/eJ7m8WeQ4wdYKq9T8sFzNyYi/avd5HV
	ZKRG0NWJU9Sxff6xNG4C+tmROdlx3YoQiG+a1BaiQWHm0JSWeYzIjhPFXaj5Un7owja8z6RV/sg
	qtWItZSMBTvFP/IHUOw==
X-Google-Smtp-Source: AGHT+IEC/EQtrNezpt+9blgHEpHxd1YhFnUWh0/2vBf3Usnz5Irc0nFTjIjjYgCU/UmvBPArza1QUIUaWp5gpwOj
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:6d0d:b0:61c:89a4:dd5f with
 SMTP id 00721157ae682-658ebabc90amr1126767b3.0.1720654970940; Wed, 10 Jul
 2024 16:42:50 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:17 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-14-jthoughton@google.com>
Subject: [RFC PATCH 13/18] KVM: Add atomic parameter to __gfn_to_hva_many
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

Atomic translations cannot wait for userspace to resolve a userfault.
Add an atomic parameter for later use with KVM Userfault.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/kvm_main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 77eb9f0de02d..4ac018cac704 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2679,7 +2679,7 @@ static bool memslot_is_readonly(const struct kvm_memory_slot *slot)
 }
 
 static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t gfn,
-				       gfn_t *nr_pages, bool write)
+				       gfn_t *nr_pages, bool write, bool atomic)
 {
 	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
 		return KVM_HVA_ERR_BAD;
@@ -2699,7 +2699,7 @@ static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t
 static unsigned long gfn_to_hva_many(struct kvm_memory_slot *slot, gfn_t gfn,
 				     gfn_t *nr_pages)
 {
-	return __gfn_to_hva_many(slot, gfn, nr_pages, true);
+	return __gfn_to_hva_many(slot, gfn, nr_pages, true, false);
 }
 
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot,
@@ -2732,7 +2732,7 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_hva);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot,
 				      gfn_t gfn, bool *writable)
 {
-	unsigned long hva = __gfn_to_hva_many(slot, gfn, NULL, false);
+	unsigned long hva = __gfn_to_hva_many(slot, gfn, NULL, false, false);
 
 	if (!kvm_is_error_hva(hva) && writable)
 		*writable = !memslot_is_readonly(slot);
@@ -3002,7 +3002,8 @@ kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
 			       bool atomic, bool interruptible, bool *async,
 			       bool write_fault, bool *writable, hva_t *hva)
 {
-	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
+	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault,
+					       atomic);
 
 	if (hva)
 		*hva = addr;
@@ -3074,7 +3075,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 	unsigned long addr;
 	gfn_t entry = 0;
 
-	addr = gfn_to_hva_many(slot, gfn, &entry);
+	addr = __gfn_to_hva_many(slot, gfn, &entry, true, true);
 	if (kvm_is_error_hva(addr))
 		return -1;
 
-- 
2.45.2.993.g49e7a77208-goog

