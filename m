Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C953042FCD9
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105261; cv=none; b=BQUGqb5pZ/AwPf5P26i0jtVKDimjpCEzvbqk5St2walgqFchDnmgoGmaCTH0QgxV7PwMYoeW84GjxEWtdftJ1TVudAVtI7LszxClijQFQqs7Ch0+lMZRNh6D/f9AOWHX74VZrUZuXcH0fhx+FJPN1paCQgFtzBcLGLtct1Rxjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105261; c=relaxed/simple;
	bh=Q77q9TvSx1wZahqyd+lGUmc8rPAr21GmtaFhn65s9RE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=f3Hn0tecSHZ41qPvqIJuP8qy0uwJy9dUur7tfZm0Ix6Fzkvak2RdTFQcqDLs1JBc1ALofQm0Yz1Pu1raWjXVl9Mk4OQjktrp0OmGeclBqExK9DTQ8rnYvlZnIIjLWes7yTd09kCbKDwCqgDRxj+lQohwg1qBoGWDhdr1uvfN+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q46mP9TR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q46mP9TR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so3698173b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786105241; x=1786710041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tG8zJDco0wN4AtuqRb9EhlwypKdV5rZoYmTq31XTTw=;
        b=q46mP9TR+IN25ksG159PAQfXkXuK2dDCckGPZxvd7At5+lyzH3OGWWXJF4YajdjgSX
         hBrWtw2RBdkxqHwMMp8YdjJVDaveTRJwraCFMmm2j8Ch6Joq4rDIJbpWybxGlMv3HnPc
         5+sb3k6lKC0gtZVMmuRtD8OlUvH0/vSR9Ph7VP/Yp5gY1YE45t9+hG8G45/nOz3zKbQN
         HBLBc6OUNoHb5Mhe9VqnLi0aVwJkvR00fSP6gkNPlzzEVVfOCiAoXM2qrayIoJfh9eqY
         YBF3N4Ak5njoyrj2Lum19drX1fnzKI0cyc/oEYAoJqAoxRYJVcvhK6cz90Cfr5e+bPTr
         LquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786105241; x=1786710041;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tG8zJDco0wN4AtuqRb9EhlwypKdV5rZoYmTq31XTTw=;
        b=M/Q58qIF3N6NSDkxEeQJQeEyZJaBqkF8Wpbi1KOuL4c4dnNn/+dBjHW4FAPALC9cn6
         qGqcdtI9hlxthnmHltPPBVaHSXxtatGPQ72sPIlrf9tsNHmlHkVhwaYYrVrFk1DQkdkm
         RYb8vIEI5kDlyC9aFVzVK14TEbp1g+3hOn9mslojNaRYgRoCavMpMvI1+4dXFLWFXIox
         u67QflIxmBl9DRciCPFA6Ut72qISfHQxi58fnaOWMzEu6hY/Z5eIeuduZ24bcQjsSKiE
         RcZ/dQko4SJtxldjk5L6vEchavu6a8fb+/QNFroFJeAmI+832h00i05zvY2Lc95HHduX
         P6Nw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3w2LWKyK4xUg/WYk0ZE91E9CksL83bXbdv9nYHhDtP302Do0vpHSOBpmbNDsHQNJ7ygv9cnngRp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOirVWwdz89/cmsNFLNRfy1oOSIwxWoUtMmh483OQFSSvh5NM
	TmX54Fi3aL0vbPvAlHsmsfe1WniXMReC+OncwhRNyTTfKyDS8LAMTmnz
X-Gm-Gg: AR+sD11BO/9sXxmBUQSMwqVz4RIIEvL5lBCZ8nRcvtWGTuIcHlJtfEXRPOMjzrE5MYR
	7+Z9B69O493jN2eyjqWm8ObJd6vBrZYR4JlOr0rQKDbZb00y/TuHv4YsO3WYBf73Nwdy+A8V2xL
	cBSfomybwbDZ04ZEY+te1Bywg1dcm3qcnxn+hsyg7pUlOn1VCB4sMXQDhq7CCKC2gstgIL7t9Gd
	SovFdtRrv9dJbMcC9ZtIP1vVyBL9TU9xaa3y74jLEv661qU+TYfqg2nuObCKsx4nP7R6UXx0XUg
	xXQ3IBKczuvLy27/my2aqWMqv9hNCvJ7UjZ5lLmuiONHZRC2vfUNjxWB1kM3GybNLEywB2TJQJ/
	VFieCqqNZO+rgvla6J0bCeIqv+H8TXv+XXSReEBz3zWbuq4OTEgw+tfwewSII2KTbCsqVT7QXn+
	aKcE1+rkkEM5N4kJPme3gRhXU2HNwL0hKoUj5X0cwj1qeOo8J3eAS1Qr3lhoG98GIUCBi2jKQ=
X-Received: by 2002:a05:6a20:4321:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3cb85e6689fmr24988534637.18.1786105240838;
        Fri, 07 Aug 2026 05:20:40 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a706fsm7279585eec.8.2026.08.07.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:20:39 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v7 1/4] KVM: PPC: Introduce KVM_CAP_PPC_COMPAT_CAPS and wire up ioctl
In-Reply-To: <8q6ikvqo.ritesh.list@gmail.com>
Date: Fri, 07 Aug 2026 17:45:18 +0530
Message-ID: <5x1mktyh.ritesh.list@gmail.com>
References: <20260806170645.11892-1-amachhiw@linux.ibm.com> <20260806170645.11892-2-amachhiw@linux.ibm.com> <ik5mlj9n.ritesh.list@gmail.com> <20260807161434.73dfde8c-36-amachhiw@linux.ibm.com> <8q6ikvqo.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
>
>> Hi Ritesh,
>>
>> Thanks for reviewing this patch. Please find my response inline below.
>>
>> On 2026/08/07 08:38 AM, Ritesh Harjani wrote:
>>> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
>>> 
>>> > Introduce a new capability and ioctl to expose CPU compatibility modes
>>> > supported by the host processor for nested guests.
>>> >
>>> > On IBM POWER systems, newer processor generations (N) can operate in
>>> > compatibility modes corresponding to earlier generations, like (N-1) and
>>> > (N-2). This is particularly relevant for nested virtualization, where
>>> > nested KVM guests may need to run with a specific processor compatibility
>>> > level.
>>> >
>>> > Introduce KVM_CAP_PPC_COMPAT_CAPS capability and the corresponding
>>> > KVM_PPC_GET_COMPAT_CAPS vm ioctl. The ioctl returns a bitmap describing
>>> > the compatibility modes supported by the host in respective bit numbers,
>>> > allowing userspace (e.g., QEMU) to select an appropriate compatibility
>>> > level when configuring nested KVM guests.
>>> >
>>> > The ioctl handling is added in kvm_arch_vm_ioctl() and retrieves host
>>> > CPU compatibility capabilities via a PowerPC-specific backend
>>> > implementation when available.
>>> >
>>> > The struct kvm_ppc_compat_caps places the 'size' field first so it can
>>> > be read alone via get_user() before copy_struct_from_user() is called,
>>> > avoiding pointer arithmetic to locate the size field.
>>> >
>>> > The ioctl is defined using _IO so the ioctl number remains stable even if
>>> > the struct grows in future versions. It uses copy_struct_from_user() and
>>> > copy_struct_to_user() to provide forward- and backward-compatible
>>> > extensibility: older userspace passing a smaller struct to a newer kernel
>>> > gets zero-padded trailing fields, while newer userspace passing a larger
>>> > struct to an older kernel (usize > ksize) gets sizeof(struct
>>> > kvm_ppc_compat_caps) written back to host_caps.size so it can retry with the
>>> > older kernel-supported size, after which the kernel returns -E2BIG.
>>> >
>>> > KVM_PPC_COMPAT_CAPS_SIZE_VER0 is defined as a frozen integer constant
>>> > (24) marking the size of the initial struct version, used as the
>>> > minimum floor for size field validation, similar to other versioned
>>> > struct interfaces in the kernel.
>>> >
>>> > The 'flags' field is reserved for future use. The kernel rejects any
>>> > call where flags is non-zero with -EINVAL, preventing garbage values
>>> > from being baked into ABI permanently.
>>> >
>>> > The ioctl returns appropriate error codes: EINVAL for an invalid size
>>> > or non-zero reserved fields, E2BIG if new userspace provides a larger
>>> > struct than the kernel knows about (with ksize written back into
>>> > host_caps.size for the retry), EFAULT for failed copy operations, and
>>> > ENOTTY if the backend doesn't implement get_compat_caps.
>>> >
>>> > Suggested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>> > Tested-by: Gautam Menghani <gautam@linux.ibm.com>
>>> > Reviewed-by: Gautam Menghani <gautam@linux.ibm.com>
>>> > Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
>>> > Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
>>> > ---
>>> > Changes in this version:
>>> >   - KVM_CAP_PPC_COMPAT_CAPS: add hv_enabled guard to align the capability
>>> >     check with ioctl availability; a PR KVM VM on pseries now correctly
>>> >     returns 0 for the capability [Sashiko]
>>> >
>>> >  arch/powerpc/include/asm/kvm_ppc.h  |  1 +
>>> >  arch/powerpc/include/uapi/asm/kvm.h |  8 ++++
>>> >  arch/powerpc/kvm/powerpc.c          | 71 +++++++++++++++++++++++++++++
>>> >  include/uapi/linux/kvm.h            |  3 ++
>>> >  4 files changed, 83 insertions(+)
>>> >
>>> > diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
>>> > index 0953f2daa466..169ea6a7fbad 100644
>>> > --- a/arch/powerpc/include/asm/kvm_ppc.h
>>> > +++ b/arch/powerpc/include/asm/kvm_ppc.h
>>> > @@ -319,6 +319,7 @@ struct kvmppc_ops {
>>> >  	bool (*hash_v3_possible)(void);
>>> >  	int (*create_vm_debugfs)(struct kvm *kvm);
>>> >  	int (*create_vcpu_debugfs)(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
>>> > +	int (*get_compat_caps)(struct kvm_ppc_compat_caps *host_caps);
>>> >  };
>>> >  
>>> >  extern struct kvmppc_ops *kvmppc_hv_ops;
>>> > diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
>>> > index 077c5437f521..19e53d5ae540 100644
>>> > --- a/arch/powerpc/include/uapi/asm/kvm.h
>>> > +++ b/arch/powerpc/include/uapi/asm/kvm.h
>>> > @@ -437,6 +437,14 @@ struct kvm_ppc_cpu_char {
>>> >  	__u64	behaviour_mask;		/* valid bits in behaviour */
>>> >  };
>>> >  
>>> > +/* For KVM_PPC_GET_COMPAT_CAPS */
>>> > +struct kvm_ppc_compat_caps {
>>> > +	__u64	size;			/* Size of this structure */
>>> > +	__u64	flags;			/* Reserved for future use */
>>> > +	__u64	compat_capabilities;	/* Capabilities supported by the host */
>>> > +};
>>> > +#define KVM_PPC_COMPAT_CAPS_SIZE_VER0	24 /* sizeof first published struct */
>>> > +
>>> >  /*
>>> >   * Values for character and character_mask.
>>> >   * These are identical to the values used by H_GET_CPU_CHARACTERISTICS.
>>> > diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>>> > index b6b83fe3233f..e64b3cfadd3a 100644
>>> > --- a/arch/powerpc/kvm/powerpc.c
>>> > +++ b/arch/powerpc/kvm/powerpc.c
>>> > @@ -703,6 +703,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>> >  			}
>>> >  		}
>>> >  		break;
>>> > +#if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE)
>>> > +	case KVM_CAP_PPC_COMPAT_CAPS:
>>> > +		r = 0;
>>> > +		if (hv_enabled && kvmhv_on_pseries())
>>> 
>>> I think sashiko is just complaining in the 1st patch because we have not
>>> yet wired up the kvmppc_hv_ops->get_compat_caps() yet in patch-1. I
>>> think it is expecting..
>>> 
>>> if (hv_enabled && kvmhv_on_pseries() && kvmppc_hv_ops->get_compat_caps)
>>> 
>>> But either way is fine.
>>> 
>>> 
>>> > +			r = 1;
>>> > +		break;
>>> > +#endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
>>> >  	default:
>>> >  		r = 0;
>>> >  		break;
>>> > @@ -2469,6 +2476,70 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>>> >  		r = kvm->arch.kvm_ops->svm_off(kvm);
>>> >  		break;
>>> >  	}
>>> > +	case KVM_PPC_GET_COMPAT_CAPS: {
>>> > +		struct kvm_ppc_compat_caps host_caps = {};
>>> > +		u64 usize;
>>> > +
>>> > +		/*
>>> > +		 * Read the size field first to drive copy_struct_from_user.
>>> > +		 * size must be the first field of the struct.
>>> > +		 */
>>> > +		r = -EFAULT;
>>> > +		if (get_user(usize, (__u64 __user *)argp))
>>> > +			goto out;
>>> > +
>>> > +		/*
>>> > +		 * Enforce a minimum: reject buffers smaller than the initial
>>> > +		 * struct version (VER0). This allows old userspace compiled
>>> > +		 * against the original struct to still work on a newer kernel
>>> > +		 * that has grown the struct with appended fields.
>>> > +		 */
>>> > +		r = -EINVAL;
>>> > +		if (usize < KVM_PPC_COMPAT_CAPS_SIZE_VER0)
>>> > +			goto out;
>>> > +
>>> > +		/*
>>> > +		 * New userspace with a larger struct called an older kernel.
>>> > +		 * Write back ksize in host_caps.size so userspace knows which
>>> > +		 * older struct to retry with, then fail with -E2BIG.
>>> > +		 */
>>> > +		if (usize > sizeof(host_caps)) {
>>> > +			host_caps.size = sizeof(host_caps);
>>> > +			r = -EFAULT;
>>> > +			if (put_user(host_caps.size, (__u64 __user *)argp))
>>> > +				goto out;
>>> > +			r = -E2BIG;
>>> > +			goto out;
>>> > +		}
>>> 
>>> You anyways mentioned copy_struct_from_user() is taking care of both
>>> forward and backward compat. Then what is the point of this check?
>>> shouldn't we get rid of this complete if logic? I don't see a point of
>>> this if we are anyway using copy_struct_from_user().
>>
>> The pre-check is intentional and serves a purpose that
>> copy_struct_from_user() alone cannot provide: explicit kernel struct
>> size discovery.
>>
>> copy_struct_from_user() returns -E2BIG when usize > ksize and trailing
>> bytes are non-zero — but it gives userspace no way to know what ksize to
>> retry with. It also silently succeeds when trailing bytes are zero,
>> which means a new userspace on an old kernel would never learn the
>> kernel's struct size at all.
>>
>> This design is different by intent: when new userspace passes a larger
>> struct, we always return -E2BIG and write back sizeof(host_caps) into
>> the size field so userspace learns the exact kernel-supported size and
>> can retry with it. This explicit negotiation is verified in the ABI
>> extensibility testing in the cover letter ("Newer struct on QEMU, older
>> kernel -> works"). The explicit -E2BIG + ksize writeback makes the
>> version negotiation unambiguous.
>>
>
> yup, my bad, should have seen the comment in the code above.
>
> But isn't this a bad design? Tomorrow, say we have a v2, a larger
> version of this struct and if your newer Qemu (with larger struct size)
> is running on an older kernel with a smaller struct size, then you will
> fail it because usize > ksize even though the userspace has zero filled
> the rest of the trailing bytes... 
>      if (usize > sizeof(host_caps)) 
>
> Instead wouldn't it be better if we do something like this?
>
> 		r = copy_struct_from_user(&host_caps, sizeof(host_caps),
> 					  argp, usize);
> 		if (r) {
> 			if (r == -E2BIG)
> 				put_user(sizeof(host_caps), &argp->size);
> 			goto out;
> 		}
>
> So, we only fail if the userspace has passed a newer struct and the
> trailing bytes, which are unknown to this older kernel, are zeroed,
> otherwise we return -E2BIG.

Sorry made some typos in above paragraph, what I meant is - 

So we only fail with -E2BIG if the userspace has passed a newer struct
and the trailing bytes, which are unknown to this older kernel, are
non-zero. if they're all zero, the call succeeds, since those bytes are
safe to ignore. We also write the ksize back on the failure path, so the
user knows what ksize this kernel supports.

