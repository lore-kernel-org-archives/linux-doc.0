Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA33730C618
	for <linux-doc@vger.kernel.org>; Sat,  8 Aug 2026 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786152521; cv=none; b=aNrTOeMezn6DtZShUCNhdUgdHfXJbACbGyvecsJLI8Hp9XSiRqwVEIMTNlpP7kdi8+2WlnlusOx8I/Fd+PaK7arov7FnT8iUXt8AJRGSzGIY/wA8iD6sRuOmQ2pkkG2DzhHkJQeGySTgHDLfduBijF9nZwPUdPjasKoDSrXzJis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786152521; c=relaxed/simple;
	bh=FSwcfVfrCLSphISRqspECOEiAYI0t60lZFQjnqG7Z6c=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=i/J4BuakA0M3iNo3VNGNk268ORxqdjhmu5Wv/824AVEMuXy04aGROsEqW9jOr04ddDoLTYl/XgjlzXq+Jh7gJOuzyuKRi16LR0jYk/2DLgX2OVFGdP1S6UC6MDwaSwatgTCRlW6ZaNVukFRsE3twQY+tB/rUPg8NAze59wOuHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5HAUScF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5HAUScF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf50c6f235so1735765ad.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 18:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786152519; x=1786757319; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gV4/f4i3yCF3yK6Yu68MBc1aKGo1uWVG8UkP+jo3PLM=;
        b=l5HAUScF8ptRuIqrW/3a4SSbaJ5loRPRkZMfBR+PcMgAe6ZSM/hOJgjDsDuFPhrQU4
         FpANcsIEzAztkzY8OQ72GPKYcpuG33GgM6yeoEFGq3e5XTc6CbIArCX7g4XFLc8r5L8u
         pF+S5TtKIbi1Ly72bWMf3e71Q16FmcxR0II6oCa47iQADOvQWh0s0sHSAH0Q2huHFmHn
         CWQM3TJn7acKjL+FivXzRYAzzHkN/UeFMlRhCmKK9IJ1O0kWx8Mw+k2djNNw/Mi5Tmlb
         zxeM5Nthz619ZWxbwCy2o62ulddiryjuJDsfbuv8UX9WrSFOadC/tFexiv+mRF7+9uB3
         0cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786152519; x=1786757319;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV4/f4i3yCF3yK6Yu68MBc1aKGo1uWVG8UkP+jo3PLM=;
        b=bBjIRCa7Zl8U10WUv3yfW8aAXRGUb6bM9DlUHeECu2mCiwcsx26qQ/fBa/LKNsRPqm
         EcKHneQyjU4JKVtg4kuI+rhf+TBBRszwSLd/kGUwabW5ChIPlCxE4lhyYf+xJiAmpgKv
         GbNobixciVDGpYmLyUvLW90NfZKxR8q1gCD8NKGcKdUef69Q69W+a3GxutxF/nmbofUp
         NkQ52+HiVem8I8UqF3zRdE/dWf9uwG9h/WEwxkvcVepdu0VCVLqJJkbv+lBmutNZyPrh
         17JO7A3DLg78aoW1R6N3WZJUAuES9CJ03HrNVNwEPnSg6rM9lr5TbaaQjU23W/cXFVqP
         8R1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqDOR62XH2T6fZQB2ZPORLjSfvKNwd2mK9X8Knr4OxKO4dDU/XKDgnjDpSIshThpGAHR/RHO38NGEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWG3ryQ+K7oAVBRNZ64I7tcKmkhgnq2ZeBamM+hj5VKp/PvO1
	+YWNMWbzEQ3PtK7B3pIIurx4dkNu+WZKhaDZpCC3aKvrmXs5PtzeQ69+
X-Gm-Gg: AR+sD11AtE+i0v5QVnEggoVIXej3Wu3C4XE9iCG0As8hi9/bD8CmHj4oznVx5r+OIR3
	jLoEWoOSJZiPJC8BOSqDF7R4wEqxhGmlc30HZg/d1YhJ6jEhEyzC1+3wKPI14cG2npChYpqTge6
	JKF+TOv436Tf+edDKrNYoE6VpwcX0QaTkZu9xA+DcTN/qNX2izZ2ScDN9oFKoDdJPpgo/xIrzLf
	A7yWk8T/ny0wcSWHvn/0sd7t8Qu+HVhEVuQbwkxLS16irw/uio/+/LlWKGSxUa6uLaAxtTfksHf
	FVhQXjgfAl1fmypAmb8vTr8Lt68FHzHH6mBxPYS18r3cLZcWxrlPGg2vMxFAyCUBPLCs9wimT8K
	8iUQpPrCbk8su85pIuLv0GyQxwGJexPpNxBClUbGwfOzRzfQiUtRZPdNP0ylL0pMWNJzv/nU6P8
	QOz8KGl9Q9hnSQ+jmgyCr8igvHd56nd2KrGjEAHW0xv32nqOCL9nsMIxRiYQth
X-Received: by 2002:a17:903:2d1:b0:2cc:90aa:8787 with SMTP id d9443c01a7336-2d0ca7b54e0mr347379485ad.6.1786152518599;
        Fri, 07 Aug 2026 18:28:38 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm12374806eec.0.2026.08.07.18.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 18:28:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v8 4/4] KVM: PPC: Document KVM_PPC_GET_COMPAT_CAPS ioctl
In-Reply-To: <20260807172433.82045-5-amachhiw@linux.ibm.com>
Date: Sat, 08 Aug 2026 06:45:07 +0530
Message-ID: <zeyxjtus.ritesh.list@gmail.com>
References: <20260807172433.82045-1-amachhiw@linux.ibm.com> <20260807172433.82045-5-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> Add documentation for the KVM_PPC_GET_COMPAT_CAPS ioctl to the KVM API
> documentation.
>
> The ioctl exposes host processor compatibility modes supported for
> nested KVM guests on PowerPC systems. The documentation covers error
> code descriptions including E2BIG for forward compatibility, the
> extensible size-based versioning contract using
> KVM_PPC_COMPAT_CAPS_SIZE_VER0, the rationale for rejecting non-zero
> reserved fields to prevent ABI ambiguity, bit numbering clarification
> for IBM MSB-0 convention, and KVM-specific capability bit constants.
>
> Tested-by: Gautam Menghani <gautam@linux.ibm.com>
> Reviewed-by: Gautam Menghani <gautam@linux.ibm.com>
> Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
> Changes in this version:
>   - Update E2BIG description: document PAGE_SIZE guard as first case;
>     -E2BIG for usize > ksize is only returned when trailing bytes are
>     non-zero; zero trailing bytes now succeed [Ritesh]
>   - Rewrite versioning paragraph as three explicit cases to match the
>     corrected copy_struct_from_user() / copy_struct_to_user() contract,
>     including the usize > ksize zero-trailing-bytes success path [Ritesh]
>
>  Documentation/virt/kvm/api.rst | 89 ++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e3003a241d5b..e656d117cd0b 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6566,6 +6566,95 @@ KVM_S390_KEYOP_SSKE
>    Sets the storage key for the guest address ``guest_addr`` to the key
>    specified in ``key``, returning the previous value in ``key``.
>  
> +4.145 KVM_PPC_GET_COMPAT_CAPS
> +-----------------------------
> +:Capability: KVM_CAP_PPC_COMPAT_CAPS
> +:Architectures: powerpc
> +:Type: vm ioctl
> +:Parameters: struct kvm_ppc_compat_caps (in/out)
> +:Returns: 0 on success, negative value on failure
> +
> +Errors include:
> +
> +  ======== ============================================================
> +  EFAULT   if ``struct kvm_ppc_compat_caps`` cannot be read from or
> +           written to userspace
> +  EINVAL   if the ``size`` field is smaller than
> +           ``KVM_PPC_COMPAT_CAPS_SIZE_VER0``, if the ``flags`` field
> +           is non-zero, or if the backend fails to retrieve or map
> +           CPU compatibility capabilities
> +  E2BIG    if ``size`` exceeds ``PAGE_SIZE`` (pathological input guard),
> +           or if ``size`` is larger than the kernel's struct size and
> +           the unknown trailing bytes are non-zero (new userspace on
> +           old kernel with non-default fields set); in the latter case
> +           the kernel writes back its own struct size into the ``size``
> +           field so userspace can retry with the correct size
> +  ENOTTY   if the backend does not implement the ``get_compat_caps``
> +           operation (e.g., on non-HV KVM implementations where the
> +           required KVM operations are not available)
> +  ======== ============================================================
> +
> +IBM POWER system server-based processors provide a compatibility mode feature
> +where an Nth generation processor can operate in modes consistent with earlier
> +generations such as (N-1) and (N-2).
> +
> +This ioctl provides userspace with information about the CPU compatibility modes
> +supported by the current host processor for booting the nested KVM guests on
> +KVM on PowerNV (nested API v1) and KVM on PowerVM (nested API v2) platforms.
> +
> +::
> +
> +  struct kvm_ppc_compat_caps {
> +	__u64	size;			/* Size of this structure */
> +	__u64	flags;			/* Reserved for future use, must be 0 */
> +	__u64	compat_capabilities;	/* Capabilities supported by the host */
> +  };
> +
> +Before calling this ioctl, userspace must set the ``size`` field to
> +``sizeof(struct kvm_ppc_compat_caps)`` and zero the ``flags`` field.
> +The kernel rejects non-zero ``flags`` with ``-EINVAL`` to prevent
> +uninitialized stack values from being silently accepted, keeping the
> +field available for future use without ABI ambiguity.
> +
> +The ioctl uses ``copy_struct_from_user()`` and ``copy_struct_to_user()``
> +to support extensible versioning across three cases:
> +
> +- If ``size`` is smaller than the kernel's struct size (old userspace,
> +  new kernel), the kernel zero-pads the unknown trailing fields before
> +  returning, and writes back ``size`` unchanged so userspace knows how
> +  many bytes were filled.

I agree with Sashiko comment here. This para is slightly misleading.
This sounds like we are zero padding to userspace struct before
returning. Whereas what we intend to say here is, when we copy user
struct into kernel (copy_struct_from_user()), we zero pad the trailing
bytes in kernel's struct.

> +- If ``size`` equals the kernel's struct size, the struct is copied
> +  verbatim.
> +- If ``size`` is larger than the kernel's struct size (new userspace,
> +  old kernel) and the unknown trailing bytes are all zero, the call
> +  succeeds as if the sizes matched. If any trailing bytes are non-zero,
> +  the kernel returns ``-E2BIG`` and writes back its own struct size into
> +  the ``size`` field so userspace can retry with the correct size.
>

BTW - I anyway feel this is too much. We can get rid of all 3 points
which explains how struct copying is working. We have more than enough
documentation around how copy_struct_{from|to}_user() works and we have
also added the comments around the code. So I think this is just
unnecessary.

We can just say:
   +The ioctl uses ``copy_struct_from_user()`` and ``copy_struct_to_user()``
   +to support extensible versioning.


With that taken care, please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

