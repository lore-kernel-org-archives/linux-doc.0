Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935191;
	b=aQ8HBtXgzEty50nC4QIJN+v8PPbbZn7upBhpX775jhcHQPJ23NJxkgl6ig1CTySz1qrx
	 MzT/t/+eegG9eRRJGd03IGjH/122obAUmlW0ZHaWU5aQRBo79r7QK1h4T+cnmuB/6q3wW
	 wb2/KEdmlhRO03XE5PoozYBjDaRZzqv4STKdzrwOia9t7zcDd77rX5HiF4aTG9WlQlpG7
	 UiTKvmJvhzK0DQo5CHaKE0nNcGkNq+YvHJM5iNEsonE1cbabJa62nb8I/R7U/jtz0Dute
	 BQRMtAtyjHJnZHKNcpf+JNxXCauAOIMrmRy/CUn52q7TcKOhCwLJNGSrmWcF4R0yHMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935191;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=hixzDBYjex72mbAqfdJ0BMP0XnPJdhglkhJ+5expOLw=;
	b=SydjMNDp81CWpue+KwR13gv3Fhw7gP3UgwCfd46qoTaXdESMP2YMwLT6H+/n/fqVqsRN
	 Nwrww1a0YkUg1/x2ksJ1VU/WDlVnQZKXbcpUAgjF6PNZ6MhBWhjfNcnMHmGhLHvHDOxH9
	 cggO6mlYsYDpOLq/fDs2GodntmmuaZyuAKRTAJ8bp41SCsf78/ECzvApZDH+Nd6w0Z4aT
	 uiFUXMqCJwckce/AGUI4JgSB4ucBhVKf/a00Hfsh+rasCGnfkjh6vjfiRCIiVk3f60Ni+
	 DfB2YWahAsDQxdB4k0elswI9KqCR5ILOWW1+aZz3pzfaMAp6R1r8kCRIZqdSLw4ktZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PYuoHGcf;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1FF606A33E
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 17:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1FF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PYuoHGcf
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CuWYfoaIeUOLVmPy0v9FnC5ISe1ZRoIopzCKCHIxYjE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794935189; v=1; x=1795539989;
 b=PYuoHGcfaIqg1ON5AgkQMRg14SJoeAWvCbVwfioCDejarEbFCDrjUDIZvAAgM+Yt1xiMeKQv
 zGzn45+RLoAZw/B1Jqrl2zRcHLu2cd01qtn6+1h9lQJQklf7JlqQXMNkuC8QROhHkEMVqeaHKDz
 DEUnTx/b3JLnLTyurptijuFM=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2701c4c3be2a889;
	Tue, 17 Nov 2026 17:06:29 +0000
X-Mizu-Trace-ID: d2701c4c3be2a889
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be58ad9600so11303e87.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFJkdOPxYJoynAorfdKuGULvZP9qN2zoA1e6OQCqABKvKkv3YVCOIz+0pyHg3XSdQNYd1yANkpJaTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gRl/PbarBMs3PVEL7+y2xgFyb2tifFDQl27MHgX252G5s/xF7
	ydUZLV3Mnw+kXe/8Vo0i5XvT6ARAPl7/Sn2r6oio+oDd/rmv4i34kH/XY6C9gbjojqNat0WT5x5
	Y7owKRVG2sKeF1CYBwVeo0wQlmwdUGCRr+uOCmkaL
X-Received: by 2002:a05:6512:b8d:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c1a189bda1mr156069e87.5.1794935186033; Tue, 17 Nov 2026
 09:06:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117074428.7544-1-fuad.tabba@linux.dev> <20261117074428.7544-2-fuad.tabba@linux.dev>
 <avxfgWNePsGPK9mm@gremlin>
In-Reply-To: <avxfgWNePsGPK9mm@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 17 Nov 2026 17:05:49 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
X-Gm-Features: AclHuK8hlW_ShztJ0BsSWqDzcCkcDDTWK01dR1LguEsZLGP95yN_yfyBcMKgMpA
Message-ID: <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 17 Nov 2026 14:23:09 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> > The check also sets run->exit_reason, and arm64's KVM_RUN completes a
> > pending MMIO exit only if exit_reason is still KVM_EXIT_MMIO. If a
> > pre-fault stops on a full ring while an MMIO exit is pending, the next
> > KVM_RUN doesn't complete the exit and the guest repeats the MMIO
> > access. Userspace can avoid that by completing the exit with KVM_RUN
> > before it pre-faults.
>
> That's also true for riscv:
>
>         switch (run->exit_reason) {
>         case KVM_EXIT_MMIO:
>                 /* Process MMIO value returned from user-space */
>                 ret = kvm_riscv_vcpu_mmio_return(vcpu, vcpu->run);
>                 break;
>         case KVM_EXIT_RISCV_SBI:
>                 /* Process SBI value returned from user-space */
>                 ret = kvm_riscv_vcpu_sbi_return(vcpu, vcpu->run);
>                 break;
>         case KVM_EXIT_RISCV_CSR:
>                 /* Process CSR value returned from user-space */
>                 ret = kvm_riscv_vcpu_csr_return(vcpu, vcpu->run);
>                 break;
>         }
>
> (note that it skips CSR, SBI also with a changed exit_reason).

Ack.

> But the overflow bug only applies to x86 (see below), so is this something
> we should worry about at all?

The ring overflows on arm64 too (below). As for exit_reason, I asked
Sean about the arm64 MMIO case on v1, and his answer was that a VMM
that pre-faults between a KVM_EXIT_MMIO return and the next KVM_RUN
"gets to deal with the fallout" [1]. I think the same goes for riscv's
exits.

[...]
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
[...]
> >  The dirty ring can get full.  When it happens, the KVM_RUN of the
> > -vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL.
> > +vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL, and
> > +KVM_PRE_FAULT_MEMORY on the vcpu will process no more pages until the
> > +ring has been harvested and reset.
>
> Maybe worth mentioning the exit_reason thing if we keep this arch-generic?

Sure, I'll document that userspace should complete a pending exit with
KVM_RUN before it pre-faults on that vCPU.

[...]
> I wonder if this shouldn't just be an x86-only fix, since no other arch is
> impacted AFAICT.
>
> arm64 and riscv never map a dirty-logged memslot writable, so they're never
> pushed to the rin, and s390 doesn't have a dirty ring at all:
>
> arm64:
>
> static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                                      const struct kvm_s2_fault_vma_info *s2vi,
>                                      enum kvm_pgtable_prot *prot)
> {
>         ...
>         if (s2vi->map_writable && (s2vi->device ||
>                                    !memslot_is_logging(s2fd->memslot) ||
>                                    kvm_s2_fault_is_write(s2fd)))
>                 *prot |= KVM_PGTABLE_PROT_W;
>         ...
> }

arm64 does map a logged slot as writable today. memslot_is_logging()
tests memslot->dirty_bitmap, which isn't allocated when only the dirty
ring is enabled, and patch 2's selftest triggers the WARN in
kvm_dirty_ring_push() on arm64 without patch 1. Wei-Lin's fix to
memslot_is_logging() [2] is in kvmarm/fixes, not in mainline yet.

With it, the s2vi->device case above still maps a device page writable
on a read fault in a logged slot. kvm_arch_prepare_memory_region()
rejects logging on a VM_PFNMAP VMA, so that requires userspace to map
the device under the slot after creating it (I haven't tested it).

So I think the check should be in the generic loop.

[...]
> An x86-only version would be pretty simple, something like the below.
>
> This also covers off the retry (RET_PF_RETRY) loop which a generic version
> doesn't.

True. To overflow there, the retries for one page would have to push
more entries than the ring has in reserve (at least 64), and I don't
see a way to get that, so I left it alone.

Cheers,
/fuad

[1] https://lore.kernel.org/all/avs5UD79FB_DG1Vs@seanjc-mac.roam.internal/
[2] https://lore.kernel.org/all/20261029175238.3214788-2-weilin.chang@arm.com/
