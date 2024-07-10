Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C9E1662F8
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654971; cv=none; b=F6ctl2wZjooezpNK+l7fQT+mfsiQcmAZtwe9V6FZaiZ9OZHhARVaZdnHgFkausNuxZq5dnkqAeu8dGw2aBf0aazhenUHZCXjVIAe4nv73bNuWNsQhwFFsqHGA7LVh4zNjMcLlju6A73TdUszQl1eN762SEtXiq5BcPnlRT8Hzx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654971; c=relaxed/simple;
	bh=IjXnmRFVjtDWx5DdntFXxWYNolKMFz9eFCdi9O/NlGk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pt6HzSa9bJDuLt4NMK1nJ86aoSCTeoXAE4Dkm7RcgztFbfQ1S4+FBCVGeZWb4dmNE85+bTIgiO5NucSf/SBHltAjTMEscCSdNHyz/Bpxx/2FWOYVnPiBNITFq/p11L3MnVaoV+nv+R4Auu6VYJoPAwg1GFP/gd7MG/qvZNfkQ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Kxcusgv; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Kxcusgv"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-65b985bb059so4749487b3.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654969; x=1721259769; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0Yr0VzVLlHnBy7TTzGiqxJ6wuwWaRwmTmvFlX0dIWg=;
        b=1KxcusgvBBHitV4s1u7TQQ7LVMI2G0L8r5abXPHb8fs/1gW78CwYAl/ZbKiX/DWkRE
         S3LDZ62juwvgbxFm3VWxRQLQ7bmsah08T7z9aVVz7siJtESBEU0YU+tEuFp/EsRKp+I/
         3OUnUK2VbacifgaEuqWKWxPV6VaXSLQu/Ry+LeBoeGskfucFtHQqKepS+9vQ+P82fK03
         24qF6bZ+HdXGZ0tKQ5hLSeYFiIvG555CzZkmhJWIIpN9zhyPA0rI8DmXgD902LZnbEo6
         V/FumXQm2R+oAqqNKNTyUW9QOomG2shlLqFypw0TNsn1mT+wrQEpYZb+feMpe3Okxvxf
         Df8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654969; x=1721259769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0Yr0VzVLlHnBy7TTzGiqxJ6wuwWaRwmTmvFlX0dIWg=;
        b=HjtPSGlDb9yafnN91CsFEhHj6qzhCd6XZTAuq2/BhEybHw6PCMlJqXVIY2kQCXgspb
         kIknRKRxemai/XBlj9+QqmUtpdYfXWn3FqeJnCUC3T0PB7augprSNJKibO+NKEt66i0r
         5Er2DIXw1T3l5qK+ie6YIyloxXoQcE0HScAhTgZRI61aMQqp2iV8hNJU5BoJUgLjmWxj
         B6/o98gITXBhI3whNDeKVJZW/8acYyNlrAuMSg1z3w2yqQKkf27/ZctajUS97pvWtp6W
         JGKmH8u6keC3B/mfCgGG/Oi8a7BUu5h6tzYhkxhmyTTHWIfU9KE3I8Q2TCBXTfCCWzOK
         buBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc27GThDGhYjoh3s+PeCp6QiZrMIit7bOUAfPeCM05N3SEcN5sABD3O7s+pUhKTU+amycf3TcCm8f0iK/QsszmcHuEILfmQ6yC
X-Gm-Message-State: AOJu0Yw3m4j27nWuWnsQ948+W4Vk25GkWagyFvlCNu3ppRHGJ9eXx1qF
	ztyrFPtEzgr6CHxNdjqk0mEGJPq5rmgIc0JlI8F8O4QlVhVHSxu6X/BQ3pUrZtVyIi6nlbe5RKD
	ZbMXDVW/5EzLfNK+nRQ==
X-Google-Smtp-Source: AGHT+IEnfc9JNyCNV09EBc2D+TZxXa8AOYJGFkqDSB6HeXipR+uC/GqUScItBcKVfj4YhKzC1lFukBy8dAilrvDh
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:154c:b0:de5:2694:45ba with
 SMTP id 3f1490d57ef6-e041af3e29emr358942276.0.1720654968877; Wed, 10 Jul 2024
 16:42:48 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:15 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-12-jthoughton@google.com>
Subject: [RFC PATCH 11/18] KVM: arm64: Add vCPU memory fault fast-path for Userfault
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

Make this optimization for the same reason we make it for x86: because
it necessary for sufficient post-copy performance when scaling up to
hundreds of cores (even though KVM Userfault today doesn't scale very
well).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/mmu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ac283e606516..c84633c9ab98 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1488,6 +1488,15 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	if (gfn_has_userfault(memslot->kvm, gfn)) {
+		kvm_prepare_memory_fault_exit(vcpu, gfn << PAGE_SHIFT,
+					      PAGE_SIZE, write_fault,
+					      /*exec=*/false,
+					      /*private=*/false,
+					      /*userfault=*/true);
+		return -EFAULT;
+	}
+
 	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
 				   write_fault, &writable, NULL);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
-- 
2.45.2.993.g49e7a77208-goog

