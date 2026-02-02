Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD937F0FE
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071438; cv=none; b=gehjK/vz1g47MmQ41GrzoMlke6IuEinwJiqW/XDr0n41p9KZCX6vzGLpJjrAv+r8koBaQkJdv1dOIICKIG2xRk1OMTmfm7N6ynMUIbGwFPKdu0JMizQGlYfhXqA+SeBF7Qg2oESrWpbB3IppWY518DPPuT0DhtyhtdjlEguEGsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071438; c=relaxed/simple;
	bh=R40mwcCMun6/j9110X9mQgTyizI2cQm+7L6dXW4nnMM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CKgp45m9PCo+MTjobcGVGnyIYYEgFFuK9LSnCroOfPWj4Ped6nHEcVpGjEkFelynysnINck1WuoWx7uUn1ZiziQbNBtf62RrJwOiJRGLL6YEVtnFGgusPzfovmw94eH2vVvkbiz2mDUCrnYyDjhtfeUGE83xwmWhs0cUblSByDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DG9tC7Do; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DG9tC7Do"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2647773a12.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 14:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071436; x=1770676236; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ht8AlBzPzy7ufL/rSOcyDdqUQhHfsU0tKVmCnhhQqyw=;
        b=DG9tC7Do5U4/XuDK3XjKF+oyn4Z1wb1G/NDUGxFLhqfpJAuoBSYFr7Nuyr9yAIJSYc
         2Xcn3AYHN8xyENlnj4cqnsXVGcdMMbTAWCZLF3GOv3wRxHKZeElvv6+qzma9imNI0u+t
         DtpIG2ey9l1r3UBwQx/wv7BWRf0NmDx0LXnNHOjjJCUzlMOEzTntTXlOgOJrGNB/Qric
         vQxmpyFVcYG8nHC0wRQsOSQRvjfVwWzBMp0qTjZ3cKrtSteZTIoGnEUl17ppysXpv4VD
         0r7Ruqh1o5l6RansuhyR9bvqZvkfE1JwSeqSe/uk4nb8qWv3NMTZ4GQTPjYhhHoE/B8P
         ehfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071436; x=1770676236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ht8AlBzPzy7ufL/rSOcyDdqUQhHfsU0tKVmCnhhQqyw=;
        b=W2wAsrPxKzuAfSXxkMt60P25CTEDY6559hPh+UeDicaAO7h62c7sllHLsMC6O70vcg
         +R1yB1cCbYtUnyNRF0D99B1g2eGPMdXeG3L+hTJmF4E9d+pstUp7UdBQ6GZq89A0QtPg
         3GvP84uNW34sLXZlAU13QCPb52LB7s6Toqzj0Ge0WQhyviFEC9HfhGTISlrs/5HSeoHv
         m+U59nVzFP2sBkMNN4cAHq3rV3jWsvEunRBrz+AhBljpGH18ebLHFYE6dGiVhRgO0VWf
         aFNwrZKX4qcN6WVQX93vIgKzTV8B4uV3FrXiPgC6nP20jjOavmgGhB+tW7M6mZVEAdJ6
         HaRA==
X-Forwarded-Encrypted: i=1; AJvYcCWLtPgWwr0ZhLFhBO96LIWYPjsIPlhPDRFVG5eHEAUYyHLuU6Jo6xMLgFzv6Q/ojG880jeeTeWlKhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pSUGEvfFFIgta9OAzvLcc2nhiwQ2nkZL36CHT9mknAv3pi5/
	S1cog8o57kVhGTSUH0Xpc1XhdU378DKESGyWzC+7kCIAVNAQBTMxAPTcWby8rueu1LilMcJWAQR
	NsxXQs0exeYUYS6naEVKBSn9L5A==
X-Received: from pgbcs5.prod.google.com ([2002:a05:6a02:4185:b0:c65:c4d1:9d34])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:8044:b0:393:1ca0:17fa with SMTP id adf61e73a8af0-3931ca01889mr4471166637.67.1770071435848;
 Mon, 02 Feb 2026 14:30:35 -0800 (PST)
Date: Mon,  2 Feb 2026 14:29:46 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <0df75ffa37360aeabac009454eafc796c4b7edf2.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 08/37] KVM: guest_memfd: Enable INIT_SHARED on
 guest_memfd for x86 Coco VMs
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Now that guest_memfd supports tracking private vs. shared within gmem
itself, allow userspace to specify INIT_SHARED on a guest_memfd instance
for x86 Confidential Computing (CoCo) VMs, so long as per-VM attributes
are disabled, i.e. when it's actually possible for a guest_memfd instance
to contain shared memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b2e93f836dca..6518cdb4569f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13984,14 +13984,13 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 }
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
-/*
- * KVM doesn't yet support initializing guest_memfd memory as shared for VMs
- * with private memory (the private vs. shared tracking needs to be moved into
- * guest_memfd).
- */
 bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
 {
-	return !kvm_arch_has_private_mem(kvm);
+	/*
+	 * INIT_SHARED isn't supported if the memory attributes are per-VM,
+	 * in which case guest_memfd can _only_ be used for private memory.
+	 */
+	return !vm_memory_attributes || !kvm_arch_has_private_mem(kvm);
 }
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
-- 
2.53.0.rc1.225.gd81095ad13-goog

