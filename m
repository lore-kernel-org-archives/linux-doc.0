Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750F16C865
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654976; cv=none; b=oaOaZxuu8+82S2SGU/maYpdxYFPoUtbxSkA/Zg2TEj7x9fz37jWWJ3fybPsh3ko3BoutZqTuQ2RvTT7RmplHzWRAAJrAQVP7Jm+4afnRT7tAeJydLbUE5HNGDWfuc3gYnQzcJju5G+bkqypM6o5bVsXYnTHs3XHILYYkYcITI+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654976; c=relaxed/simple;
	bh=9nGVvjTtRrzXeDKQT/PGApCposmumXI12BdKtg64Aj8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sr0MBajdDkIvG7PwjziK7ZMJZz5b7PbNJe8Uib896oF+5WF32ycObu9mTUFboxSxXOHgzuAM4eFggLn9/lxg68HkkKG4NzSEEsRD4Br35hmCqp40DUD+aXC9mWDSUIiOYVb444Gs3novJ5BBfb6FKoTVeIUaIFHl2dJgv+QuGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gDXVRsCx; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gDXVRsCx"
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-80fe9aab33dso90566241.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654973; x=1721259773; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=86wUnUhZHhvP2m3KtD2mzNoNsfKZM3y2BVe++0uTyFA=;
        b=gDXVRsCx4zAb+aXQVU500pfuxdZC1fBEA1iLF/nd/5kaJzmrZvl9SDY2pHegNlDieX
         hd8gLixD2Jl+++LLsALferKZDuhbA1PzIJmVwFM8Wxmp/scWJlgpfU4AOkD3t3ObKRst
         OenkqnPb3tJdCOiWX2bVSr6jwWzDTB9i8nH3LgleIWgOGXl/Rttrre+zbPV0eS4/jV7t
         GxzpanKaknmyn08V6EwDg4rLCLeQnOEpfQJwuOgWAkBzMg1JhsnWXn8AFPs44QJP8Z5X
         4VhbUFc2EcLF1yjqiDWBwv3TuwVIiYFgdsjHaSSKoewzwiQlIBfCLxwee5mFwULOgDOb
         40LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654973; x=1721259773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86wUnUhZHhvP2m3KtD2mzNoNsfKZM3y2BVe++0uTyFA=;
        b=bOOzLD9lD0t8PUzwv8pbJt6PaJubuLGUTku40MnakFdNRGnxdQtuflSlgnOoW7S6mC
         +ktP/go7YoWbu+yu2PlfWX8dxW5lW78vmHJcMZxTofbOeRhBqd2oICd/BS+zuWJoNcaG
         QOlscPnsm/7KTevhQOm+BcxAc8epBmpnOIMdXUz8tdgz5udlQdE08Inha0heFeLKns2V
         y4gtd5l8tY/0NgIfz4gbRYq25KabxDcrMPnECyGguyI+Set4CFyV+Y6nL585zOcUTl99
         V/dEU4WEYaK1MtAbXhJKIX7RCrdsCx5qViSIvXZPHyM5QOQHQDsbmKoZDwvPhMBPOKLb
         Omzw==
X-Forwarded-Encrypted: i=1; AJvYcCVKdAyyZ3en3TFwcGO3uwT61ICnl9VywdcCFBqo5kNnQtWw+Wrzab8R74n0mnTCmLeKQwpP1RkTGJRt0lluJGxcJxTAti4Pnqnp
X-Gm-Message-State: AOJu0YwmNTjRi966A34ZrXHKTPe2O+jxjZjnL2CP7qPb8MlU9UdBOsOv
	PjcyY9Uqb5U++epTfc638JGlirBqQK8bu9DTheNTH2inwIxO7eq1GgZh527dMREr+oiAjWnF0h1
	4Jvh1aTvimpvLs2X8mQ==
X-Google-Smtp-Source: AGHT+IFuuD8TX5cMTXqfbBITU1Rk5gbgp8/gjNqtfzjUDzjMtEhdHehLKT0HBMd1mO2mStlwTdwfc0NYjYZ51/Zs
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6130:2c07:b0:80f:e89a:dc21 with
 SMTP id a1e0cc1a2514c-81076f04ee0mr30519241.2.1720654972976; Wed, 10 Jul 2024
 16:42:52 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:19 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-16-jthoughton@google.com>
Subject: [RFC PATCH 15/18] KVM: guest_memfd: Add KVM Userfault support
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

We now have to pass our struct kvm into __kvm_gmem_get_pfn to know if a
gfn is userfault-enabled or not.

For faults on userfault-enabled gfns, indicate this to the caller by
setting *pfn to KVM_PFN_ERR_USERFAULT. Architectures may use this to
know to return a userfault to userspace, though they should be careful
to set a value for *pfn before calling (e.g. KVM_PFN_ERR_FAULT).

While we're at it, set *pfn to KVM_PFN_ERR_HWPOISON for accesses to
poisoned gfns.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/guest_memfd.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 9148b9679bb1..ba7a981e3396 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -542,8 +542,9 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 	fput(file);
 }
 
-static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
-		       gfn_t gfn, kvm_pfn_t *pfn, int *max_order, bool prepare)
+static int __kvm_gmem_get_pfn(struct kvm *kvm, struct file *file,
+		       struct kvm_memory_slot *slot, gfn_t gfn, kvm_pfn_t *pfn,
+		       int *max_order, bool prepare)
 {
 	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	struct kvm_gmem *gmem = file->private_data;
@@ -551,6 +552,11 @@ static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 	struct page *page;
 	int r;
 
+	if (gfn_has_userfault(kvm, gfn)) {
+		*pfn = KVM_PFN_ERR_USERFAULT;
+		return -EFAULT;
+	}
+
 	if (file != slot->gmem.file) {
 		WARN_ON_ONCE(slot->gmem.file);
 		return -EFAULT;
@@ -567,6 +573,7 @@ static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 		return PTR_ERR(folio);
 
 	if (folio_test_hwpoison(folio)) {
+		*pfn = KVM_PFN_ERR_HWPOISON;
 		folio_unlock(folio);
 		folio_put(folio);
 		return -EHWPOISON;
@@ -594,7 +601,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!file)
 		return -EFAULT;
 
-	r = __kvm_gmem_get_pfn(file, slot, gfn, pfn, max_order, true);
+	r = __kvm_gmem_get_pfn(kvm, file, slot, gfn, pfn, max_order, true);
 	fput(file);
 	return r;
 }
@@ -634,7 +641,8 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 			break;
 		}
 
-		ret = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &max_order, false);
+		ret = __kvm_gmem_get_pfn(kvm, file, slot, gfn, &pfn,
+					 &max_order, false);
 		if (ret)
 			break;
 
-- 
2.45.2.993.g49e7a77208-goog

