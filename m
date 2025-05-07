Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989AC41C72
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 00:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576114; cv=none; b=DyKCuf+XJLXNuD6EPUmRP4Dn67fy5YK+dJpm4GnZ/FtzYq0iXn2TXsswieqDiBJRXqSLSV38QlntOpETIFe6Nc9Q5HbK3r9qUM0tAIBe7WJZDikwg6t+k/8xEH+yFrjDO2B92qe4qwmsrjcbcz+IoQGol0f89QctI8KFg3Vxfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576114; c=relaxed/simple;
	bh=2GS2rxg7Aq7eNJotH2VhJb5wVzNB5eoTc/aK15VSyIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bnmMo/HF2MddGdWcj8JJOzf7ijcVe+gi2fuNRzIxypCv3s1FgeVbQjPaeiXVtQtRQzTbw7RfTN1zzggeGP5cYRRy7MN9Kzb39mqyN0mGS2yr8Dn4hpAb5KWgqEQkrafA/7T/jz33lxTIRARn0TjEcyL+I/zDkIitUyhBloeWyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJF8ibvB; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJF8ibvB"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30aab0f21a3so354648a91.3
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 17:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576111; x=1747180911; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IkMMN7aoLjrVziOe6MXRXG9fOk8E9BWhlOpYp2kNdvc=;
        b=mJF8ibvBVnc3nl49scdlGP1lqTmVRErLzdMAEgyB95el4PF27F6LKyagsI1tXK6Jxo
         +/3YSE6A9a1lkkP86ahPcbcHnqItje9hPrFkCfsRkYOyb1L504vBcOvrlspCn0xYv7J5
         iP00n/C96Wd9zWlc6xU9vVDgQhYcNBLbVIu0Cam/JnHU6ybvkqdHXQKhrdu3mKi5bMr1
         EhWSCIyih7QP65UdTAESguSl7cr02mM9Z7J177dythska+OSM1BOnpK9pTXupuylgaIP
         OqaKNZf1s3TSUdCqux5EOGxNCJ+9kIC2STws2136vdm7Ck3c7/ny6XZ1pEy8OLkl+pn+
         bMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576111; x=1747180911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkMMN7aoLjrVziOe6MXRXG9fOk8E9BWhlOpYp2kNdvc=;
        b=VC+zqADFGuZoyZ36gAKa6DWTUpSaadNei7GSW9I6s1AZmLayG6q5S9wA+IaMjEizwK
         iaX/3fqaL8Byn/22QzetVmLwAkGhH6wI5gG51A3FfEgfp4RShvWAYoJxYzN5tVG2OdPw
         bOGVANB1vtuof7ZToq/K5mRXYhyDT6A4StJlQ0/ca8ALtr9bnF5tHnXK41EF37DsE46E
         xPm89oGgHPmDg/neNvHNcJxY32dT+njiB9GYn5KvTZoVl7+98v022jBlzxG8gN0UpAwZ
         3AhzIbRz8q8FB1mmbCMTOF6h7lisI0fVtBc3tcyUSCBFhxd/X+piznDzQ54kn0KgjhhT
         PyBg==
X-Forwarded-Encrypted: i=1; AJvYcCXUBi6tqeSqnza9OjfhMZg4z18RI62TVsdYUyHncO0Ny3y14WPxdCUsFbB8NH0gZyp7mfsRpiwP4jA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/2172tfHyElKpT1gttHJrK3vg7WPMw4i6yCDIUVAQR61hQrRB
	jlxCA3G5U6nSDKVY8cspUMT9rZMge/8J0Kdehox18ATo8/bf8OSVJCS/FCvAA/lgkWLu1FS1Tb1
	u2A==
X-Google-Smtp-Source: AGHT+IG6EiJshM8I+/QNoyITpB25GV3XJSeVoH1WhXumO4+pfjjtK3RlA2H+mctfIUZWla7V1VRApNhLAsY=
X-Received: from pjbsi7.prod.google.com ([2002:a17:90b:5287:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c6:b0:2ff:5a9d:937f
 with SMTP id 98e67ed59e1d1-30aac21f2f2mr2069431a91.24.1746576110794; Tue, 06
 May 2025 17:01:50 -0700 (PDT)
Date: Tue, 6 May 2025 17:01:49 -0700
In-Reply-To: <20250109204929.1106563-2-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <20250109204929.1106563-2-jthoughton@google.com>
Message-ID: <aBqi7fDtnvxzxV1V@google.com>
Subject: Re: [PATCH v2 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 09, 2025, James Houghton wrote:
> Use one of the 14 reserved u64s in struct kvm_userspace_memory_region2
> for the user to provide `userfault_bitmap`.
> 
> The memslot flag indicates if KVM should be reading from the
> `userfault_bitmap` field from the memslot. The user is permitted to
> provide a bogus pointer. If the pointer cannot be read from, we will
> return -EFAULT (with no other information) back to the user.

For the uAPI+infrastructure changelog, please elaborate on the design goals and
choices.  The "what" is pretty obvious from the patch; describe why this is being
added.

> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  include/linux/kvm_host.h | 14 ++++++++++++++
>  include/uapi/linux/kvm.h |  4 +++-
>  virt/kvm/Kconfig         |  3 +++
>  virt/kvm/kvm_main.c      | 35 +++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 401439bb21e3..f7a3dfd5e224 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -590,6 +590,7 @@ struct kvm_memory_slot {
>  	unsigned long *dirty_bitmap;
>  	struct kvm_arch_memory_slot arch;
>  	unsigned long userspace_addr;
> +	unsigned long __user *userfault_bitmap;
>  	u32 flags;
>  	short id;
>  	u16 as_id;
> @@ -724,6 +725,11 @@ static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>  }
>  #endif
>  
> +static inline bool kvm_has_userfault(struct kvm *kvm)
> +{
> +	return IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT);
> +}

Eh, don't think we need this wrapper.  Just check the CONFIG_xxx manually in the
one or two places where code isn't guarded by an #ifdef.

>  struct kvm_memslots {
>  	u64 generation;
>  	atomic_long_t last_used_slot;
> @@ -2553,4 +2559,12 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  				    struct kvm_pre_fault_memory *range);
>  #endif
>  
> +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
> +		      gfn_t gfn);
> +
> +static inline bool kvm_memslot_userfault(struct kvm_memory_slot *memslot)

I strongly prefer kvm_is_userfault_memslot().  KVM's weird kvm_memslot_<flag>()
nomenclature comes from ancient code, i.e. isn't something I would follow.

> +{
> +	return memslot->flags & KVM_MEM_USERFAULT;

I think it's worth checking for a non-NULL memslot, even if all current callers
pre-check for a slot.

> @@ -2042,6 +2051,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  		if (r)
>  			goto out;
>  	}
> +	if (mem->flags & KVM_MEM_USERFAULT)
> +		new->userfault_bitmap =
> +		  (unsigned long __user *)(unsigned long)mem->userfault_bitmap;

	if (mem->flags & KVM_MEM_USERFAULT)
		new->userfault_bitmap = u64_to_user_ptr(mem->userfault_bitmap);

>  	r = kvm_set_memslot(kvm, old, new, change);
>  	if (r)
> @@ -6426,3 +6438,26 @@ void kvm_exit(void)
>  	kvm_irqfd_exit();
>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
> +
> +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
> +		       gfn_t gfn)

I think this series is the perfect opportunity (read: victim) to introduce a
common "struct kvm_page_fault".  With a common structure to provide the gfn, slot,
write, exec, and is_private fields, this helper can handle the checks and the call
to kvm_prepare_memory_fault_exit().

And with that in place, I would vote to name this something like kvm_do_userfault(),
return a boolean, and let the caller return -EFAULT.

For making "struct kvm_page_fault" common, one thought would be to have arch code
define the entire struct, and simply assert on the few fields that common KVM needs
being defined by arch code.  And wrap all references in CONFIG_KVM_GENERIC_PAGE_FAULT.

I don't expect there will be a huge number of fields that common KVM needs, i.e. I
don't think the maintenance burden of punting to arch code will be high.  And letting
arch code own the entire struct means we don't need to have e.g. fault->arch.present
vs. fault->write in KVM x86, which to me is a big net negative for readability.

I'll respond to the cover letter with an attachment of seven patches to sketch out
the idea.

> +{
> +	unsigned long bitmap_chunk = 0;
> +	off_t offset;
> +
> +	if (!kvm_memslot_userfault(memslot))
> +		return 0;
> +
> +	if (WARN_ON_ONCE(!memslot->userfault_bitmap))
> +		return 0;

'0' is technically a valid userspace address.  I'd just drop this.  If we have a
KVM bug that results in failure to generate usefaults, we'll notice quite quickly.

> +
> +	offset = gfn - memslot->base_gfn;
> +
> +	if (copy_from_user(&bitmap_chunk,
> +			   memslot->userfault_bitmap + offset / BITS_PER_LONG,
> +			   sizeof(bitmap_chunk)))

Since the address is checked during memslot creation, I'm pretty sure this can
use __get_user().  At the very least, it should be get_user().

> +		return -EFAULT;
> +
> +	/* Set in the bitmap means that the gfn is userfault */
> +	return !!(bitmap_chunk & (1ul << (offset % BITS_PER_LONG)));

test_bit()?
