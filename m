Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C02054E8
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455801; cv=none; b=X8Q01O2xpR1TP4RmTE5msHKavQBDYBZRBVMux/6SEghE8aueGTxaPytoclh7xtJyCZkTELkTeJneCWlp9lR422Q0y2kdDIXDqZQ+VY1rwihw83itcmmYC9tHVD6UdAC2BtaTYwWj8jGC4Xce7/gLg8Lc37DZqmxCxmSUiOBFeiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455801; c=relaxed/simple;
	bh=tSVByeVc+YvO1YwpxO6WQbJnBeXOFHCPwH2YC78/pxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T2pbdxWv0x0jBSo9ZXDQ+EZPvDLEI043o2IalZOpxJHkbsOi5vrz76kVybcmf3aVtY4zuXdoij9GfmJEncxVafSvSKEYeEAxgB/+nsejmwZid7AivsBWVIxWZP7ykCd6IT3pBt/V5KHumfZGjTwz4yc/IizwNcC/wYJ0h/y4b9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mcF52Ldy; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcF52Ldy"
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-85b9d3180a6so303422241.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455798; x=1737060598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1DrcQjgptnhIcToWnmFksBp0MRaAX2CW6X5qNo+eD6A=;
        b=mcF52LdyaRfn8cLItO/k6gTIxPtxYCogEWTleb8jRHW5KCCfdg6b4Wxm6SdmctkCMX
         666H6Ru4TkG1aTe9t4Cx2NzHHduVFIL1s7ZFcPOhgwUIzhQVeJHbyt0aeS4j/Oapc5fu
         7WQ3Fgq27FPX/bljvQi0dHJd4D7DxZu8V4Adm4i7utDYAPDeC3sqkPvp9A+lDvOTQ/zV
         ffGQKir7iTjt/Et9/bvsItbKw6jxc+VOWSL9KKCaMOfpIEm9vfkeeUofLque5fwYuXoM
         U1gMtxRzhZkup6Zk6CeoK3meC4LYDukumG0Ay0mTX2jVcv+XULeQyFs+sfljBZPOEE/U
         C3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455798; x=1737060598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DrcQjgptnhIcToWnmFksBp0MRaAX2CW6X5qNo+eD6A=;
        b=IzZJjz2fjAc7+DHF3jabA30PtbL2dqgWjKBlZhm/Lw47NzPj19axehoU9ybf2k4Nnm
         cCn86wr7VBlwWvyT5ByKaz62zEYrjK2Ob+S/vY2Ro9oTLLPJBFD/BnJruNM5eSt1Oho3
         WYpS98NdJ79iIrPgxFEq+Xu3kfd2C/xoVqOWC1G91ztodOzbEwU6S6JhzIch7kBBRnkd
         c+0K4LlnlHja/ZofSHBF5k4H/VLQmMDqeS9G/OctBxYmaA1DH0vmkI84N1Z3WqC7gxvy
         q+koIB5iiy6nhFOFajT25dKdq/2sxYz3FANH3jeyVhTvs73tMj92V9852D8IJ08Dhxbx
         PjFg==
X-Forwarded-Encrypted: i=1; AJvYcCWOpwH+eteKr6kcwvlgAqeMWdxEtDo+4WaND09m+cCLkHa01lIXFu3Bl8tDpXR5IjYPWszBDrC41Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+c2czBDXlj6ng9Y5gIRKNYQ0IfqGWH5BfwEm591PrDY28Dszq
	Wx0EQ9ErVpIIYls2dnU3C4SOMh5Z2jVHYE8R6QcCkBqcHJtwK2ejm1BTIwHgzsyruJ1eX1G5ntT
	X5/ouI+FGjbZbBn4omw==
X-Google-Smtp-Source: AGHT+IEK0449o9KbC3fWak3S16jydYyIqzxOV/2eZ44AIR7w7I0DQuvF+HeqMnZYowZ6lm/VqNUOgc0IX+KhZU1E
X-Received: from vscv18.prod.google.com ([2002:a05:6102:3312:b0:4af:df7b:f439])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:2c02:b0:4af:d487:45f3 with SMTP id ada2fe7eead31-4b3d0ffc73fmr8314563137.23.1736455798514;
 Thu, 09 Jan 2025 12:49:58 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:20 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-5-jthoughton@google.com>
Subject: [PATCH v2 04/13] KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
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

Advertise support for KVM_CAP_USERFAULT when kvm_has_userfault() returns
true. Currently this is merely IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT), so
it is somewhat redundant.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c302edf1c984..defcad38d423 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -936,6 +936,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_USERFAULT 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 882c1f7b4aa8..30f09141df64 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4811,6 +4811,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_HAVE_KVM_USERFAULT
+	case KVM_CAP_USERFAULT:
+		return kvm_has_userfault(kvm);
 #endif
 	default:
 		break;
-- 
2.47.1.613.gc27f4b7a9f-goog

