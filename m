Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF371FE44A
	for <linux-doc@vger.kernel.org>; Sat,  8 Aug 2026 01:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786151365; cv=none; b=vE9EtG04TdgMCrtxjb4N+KSw95e7q7S5syAl4AYp34Pdeu19ZH/R1ggex+yi/S8VJQBMMvkegQadBBqmOvhS0vntCbB28dTrweKyOn2lK/svVJ/5v7I9mpjKWKyMfmfFfTrrngjbxuPLqcDMiWN5xbygZjE2PoVny2HP2Ht93WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786151365; c=relaxed/simple;
	bh=MhcB397fB9fZ8OKdkEZCupInxArvrZSMIawSJHA8+Ek=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=FU8yyYsOiwlexiQX8MnRCqnuuExjzdkzicb3U46Z7gfJMU5C3iMvfTJR8lWrs+BY7UizO0rq8aUKiBER/rjkBUFWiTE2g1C/jQ6FgKPXaCr4PsujlCXhmNc7sIVjpWAUy2YcqbQciK5T3srgMGEZA2ch9ty4YNt1VDjZ7ZEwR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfhBXpjE; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfhBXpjE"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84830c774a0so81313b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 18:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786151363; x=1786756163; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6xF7Vf0vsAzDGiN9uOUXdMTijirUIpfVi3ov9/6Fs1k=;
        b=mfhBXpjEtC/5v1cIVhlw3L9No97b0YVNag6MsCfrnY85xpM/Lb5pm4ns/lUFssCfvZ
         1bogLjY76QLabrpeVvFfTid2AUtgrxnIU9+tPYvk31Bsrdgdck4XxDRCSZT20X5zp8hA
         H1i/c7Lm6XKc7sOTHqfzl1PlO1z5WXdGW7jCLrcnvaEq6ibiJXRFPmRsB5iGd16ChAF8
         1XuT+NEWFQ+VvU1bTEQKdpU+Xr5Mej+35eptTw0Pydy8q/hBDy/pkHYTlVK327l8dnHp
         ww8BgvCKqzXtGLapHlXkkDiTx93lYGpm4uLlkTUvOrQODngPx93P1QsNxnu7sVfLHRRu
         Du1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786151363; x=1786756163;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xF7Vf0vsAzDGiN9uOUXdMTijirUIpfVi3ov9/6Fs1k=;
        b=f3R61ekM76e+eVgi3v2iLAClU0KjCsR7YhBcKc8GVVjcgxiynR6sk73vbOVj+s8gch
         L6n8cztpblReXCwsgMspBUVrWJf73q/0L3MraFWb0FdC6QqAloSfuuzpzmh3ImfT/LcL
         fCy9eQrPYB+MRfH/mU1c2qMQFvuObgCPs+xpQGjS2dC6vN6VbFMcI2aXDcPi42WkaB0n
         Eq8rSsuhLdwXUHhRbD/4aVp/qz2vy1mkRQZB3InfJgjk2CBiBC06c5FNFe/c1fBFOGaE
         L95JAUMbKp0CEVnDOkFW23O3Zqf341P1AsAI+pK25Pb/Yl0yJ/sAM5SQOqQI5jwwtCsi
         JpHw==
X-Forwarded-Encrypted: i=1; AHgh+RoE3SEW3fFUdmRWpFtI+zK3C+AKBfmonWdtXhHRYcZU7vRDz+zB1BD6rpiC25A/Q16b+1CpKdylK3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQnRSyploIBQGbur3H0l22YalflQT5tK/hOqsqp9WxYtFqDMw/
	Z8w3Wnpj6krsknGT3ZYG46a+UTsz8rhR+Qeezy4jwaYUGS/TJgmRlvoz8q1p4A==
X-Gm-Gg: AR+sD12ONDZMkp1dMRn5uY3rzXTK3zd+f0CDW4599rvqPyyJjp2qz6J/xlks4OC3xPH
	XbQW2LVcaXVdQyw+hDrC5Yhdf09gwopdWs/LdW1sVhQLtwhP57BM7Vx/p21oDiBcRtchheMq0+z
	bAqkWcqFkTIJfhW9MrV32uXuZp72ptry20UXYeb/+MqzwOLm/XfNFbnkmB9dbGpf7OFrewxGBp+
	ZBqmrpGPQlVhkV5GfFJzX9z0Vd1cu7WkFWmvetw5iYeY+QpRVOxRI/uGLBPbd04KcbC04DB2bYN
	8j4H9dT9Payxtibbt5gWm+U9kmF+Vw2V2fcwctR40Y+ZaAcUEfiCcrhSZQV4kbzzmnYFmY8S9UX
	eFGIHWtfXkHyQVqrH0/Q6AtATVC9gop5pDf1uEcIHMPWj1Tl9eoq3m4tAg2jcg78vrdJamH2HiU
	scAfKZNInl/aairzlvVBXFwLvwv9vrerrGICQl9oB9kZg6c22wxUIwr5g5fWM=
X-Received: by 2002:a05:6a20:c79a:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3cbce7d128emr5049089637.16.1786151363483;
        Fri, 07 Aug 2026 18:09:23 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141018f18d6sm12260170c88.0.2026.08.07.18.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 18:09:22 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v8 1/4] KVM: PPC: Introduce KVM_CAP_PPC_COMPAT_CAPS and wire up ioctl
In-Reply-To: <20260807172433.82045-2-amachhiw@linux.ibm.com>
Date: Sat, 08 Aug 2026 06:30:40 +0530
Message-ID: <33wpl93b.ritesh.list@gmail.com>
References: <20260807172433.82045-1-amachhiw@linux.ibm.com> <20260807172433.82045-2-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> Introduce a new capability and ioctl to expose CPU compatibility modes
> supported by the host processor for nested guests.
>
> On IBM POWER systems, newer processor generations (N) can operate in
> compatibility modes corresponding to earlier generations, like (N-1) and
> (N-2). This is particularly relevant for nested virtualization, where
> nested KVM guests may need to run with a specific processor compatibility
> level.
>
> Introduce KVM_CAP_PPC_COMPAT_CAPS capability and the corresponding
> KVM_PPC_GET_COMPAT_CAPS vm ioctl. The ioctl returns a bitmap describing
> the compatibility modes supported by the host in respective bit numbers,
> allowing userspace (e.g., QEMU) to select an appropriate compatibility
> level when configuring nested KVM guests.
>
> The ioctl handling is added in kvm_arch_vm_ioctl() and retrieves host
> CPU compatibility capabilities via a PowerPC-specific backend
> implementation when available.
>
> The struct kvm_ppc_compat_caps places the 'size' field first so it can
> be read alone via get_user() before copy_struct_from_user() is called,
> avoiding pointer arithmetic to locate the size field.
>
> The ioctl is defined using _IO so the ioctl number remains stable even if
> the struct grows in future versions. It uses copy_struct_from_user() and
> copy_struct_to_user() to provide forward- and backward-compatible
> extensibility: older userspace passing a smaller struct to a newer kernel
> gets zero-padded trailing fields. Newer userspace passing a larger struct to
> an older kernel (usize > ksize) succeeds if trailing bytes are zero (the
> kernel reports back min(usize, ksize) as the filled size); if trailing bytes
> are non-zero, the kernel writes back ksize into host_caps.size and returns
> -E2BIG so userspace can retry with the correct size.
>
> KVM_PPC_COMPAT_CAPS_SIZE_VER0 is defined as a frozen integer constant
> (24) marking the size of the initial struct version, used as the
> minimum floor for size field validation, similar to other versioned
> struct interfaces in the kernel.
>
> The 'flags' field is reserved for future use. The kernel rejects any
> call where flags is non-zero with -EINVAL, preventing garbage values
> from being baked into ABI permanently.
>
> The ioctl returns appropriate error codes: E2BIG if usize exceeds
> PAGE_SIZE, or if new userspace provides a larger struct with non-zero
> trailing bytes (with ksize written back into host_caps.size for the
> retry); EINVAL for an invalid size or non-zero reserved fields; EFAULT
> for failed copy operations; and ENOTTY if the backend doesn't implement
> get_compat_caps.
>
> Suggested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Tested-by: Gautam Menghani <gautam@linux.ibm.com>
> Reviewed-by: Gautam Menghani <gautam@linux.ibm.com>
> Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
> Changes in this version:
>   - Add PAGE_SIZE guard after get_user() to bound the check_zeroed_user()
>     scan in the usize > ksize path [Ritesh]
>   - Drop manual usize > sizeof(host_caps) pre-check; delegate entirely to
>     copy_struct_from_user() which succeeds on zero trailing bytes and
>     returns -E2BIG only on non-zero trailing bytes; handle -E2BIG with
>     ksize writeback and -EFAULT escalation if put_user() fails [Ritesh]
>   - Fix host_caps.size on success path: use min_t(u64, usize,
>     sizeof(host_caps)) so new userspace with zero trailing bytes gets back
>     the number of bytes the kernel actually populated, not usize [Ritesh]
>

Thanks for addressing them!
The only remaining comments from Sashiko now are because, it cannot find
the implementation of ->get_compat_caps() since it is in the next patch.

So as for this patch, the changes looks good to me. Please feel free to
add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

>  arch/powerpc/include/asm/kvm_ppc.h  |  1 +
>  arch/powerpc/include/uapi/asm/kvm.h |  8 +++
>  arch/powerpc/kvm/powerpc.c          | 78 +++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h            |  3 ++
>  4 files changed, 90 insertions(+)

