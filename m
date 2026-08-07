Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65193839BD
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 04:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786077831; cv=none; b=s5V4FHvqiV0XSt3M2Q17DAaLD5sdaUDRG+XNgGO3JTm/D3aqs6jfQ7YRdSZVZr8+vsOIViiB1Y335r1Y58cJYieC+u80vBgYQiR7LgOfVwx1JEY0X7y+dmpGcocB/z4Pmkgsl7uDkrW6UGPFc/ijgTWlXmM3r/vuq/ehTFAeKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786077831; c=relaxed/simple;
	bh=bXafEeRa/aBkiRSCWIVw0Sey2csmxtqoARR3l1ea9Ek=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=RrrCzOm6rERMcq0w0de+Iat3EcXMZZKxaIT7wjY0B8IKIjvoQsrx6xjNzU3hblRc2oXELg92P/xLqVDy6sphxTlZndpGVctW61RPXZADS0Xw2Ge6SRWazOtE79GcgYOT96Dlc5gJ6xLkqNxbx24pdhzDpyWeZEhjmGm3+z7sDh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyJvh7A+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyJvh7A+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so36138285ad.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 21:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786077828; x=1786682628; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QgHVsHtQu5HJOyA8OxcWU271rWUfL0isA+SyxkEMQI4=;
        b=SyJvh7A+h1vrmm4cYRQk3PNOeMHI7Qmx9zJ+I7ZQncbcAQbG2ralqDQ4lBbi20oItr
         auDyoKknJ+vl8GyzanLEfwNLq8cJm83YqDPO8Ga9EMhkVH1HwyO4QSscCNI4+NWHA7UK
         yLl2xLjZZrPIu29gm/O+qXKTOqTLkAihq7iihKUkX8kDPwAT0u7RQgHgMtopvhtahoFb
         VvMtDUmjO6WfNdzrWCS88djUAtXx+pfoLEtID5i7NNNIAe62gxMrRH0CdZ+Co72idWKr
         u4rVVIOoF8HL7jTIw7Zi7qvkTko2u7ZSLb7XvlkoH1rzmETXC5/wmL+rjZhsLZS7UOiw
         CHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786077828; x=1786682628;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgHVsHtQu5HJOyA8OxcWU271rWUfL0isA+SyxkEMQI4=;
        b=SUlg3vXscd0hjnyV9hCmM6wqVoKhWdG/x0zs0TFY7h9aL+mWdf37ikxUY6DOyYsBU1
         9u0SuxKR0JiKeaP8Frmwu4AAzUp1J0eVX/f7dj+huFq0KYAf9nhmKvnjwilnL+LDX84t
         UX5ajBgNovXbzSldHxYMT9Hqcyp4LzCc0dYonze9qlQcppnkuhlCXg2uRvz5s4fBWrQd
         oyJ/SFptI339c0DsTAwqpHZ3IhWq5bq+ib8XLwxMkGZCwwxc1zB5i3baaLSO85lkJq23
         nuSNZLeW0JflML9Ja/A7p2sYSUB5uklPvbHXMkaUwmDsfO4S/kicV7Q+6rveuinyJy8J
         y6wQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNGfWpZnS0Z33JI51zFst6yVX5aoHdKZrc7hKR46tPh4NJCl4liuY7ZYTjZ63YkU712I1Qw2KPGLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMl9juTa9Py+PdHTUfDWLIxSmPBRjh7jpDp0DrEQ2naFD/1Q6s
	k0IWEvm5/2fjKV04n8n3GQxB8cPiIdjqLOhockJfiEKo/a7KDN6F/1GZ
X-Gm-Gg: AR+sD10WSztyktTC9PKpALHlHseCxKsTDTAyA8wn3GIu2Wcte3dje3VXAG/vb+EEuu9
	jO6hBuOPURABmueI804409sZBERcuEOgLQbUbr88IhXwZk5Dw88G70HD9g1AWqRsiLCBosRwhHZ
	lXYBSrdz8pSfWZ7SPNjQdz/lKwabtOevOyu6FlunIVnf+knXHZH5lw2QQHFptkWip04gFcGkPW8
	BJWNIcN/IeFQ1F0Dy5XPx6mJMNRlbG/6Lv4MCWSG1x5bbbFdBLxtzdJLmDzpIeTzF4MvJD0bZ5d
	JxRbNXNrowsqyISsfruxTNf31JebLEEdnnjjljF9xN2IlbjXj0HilFEH0AqueKN+7LQUlAwgoru
	EboxkVk/Zv8cDHhY/RM8LzJBkQelDAf2+JYH0C4UxVT6MTJhsOupJacmS5H8UnURtDOHw39uR6J
	u/+TKtC4P7CIs6tnTlMnOBzNTAA71D8JTNjpZwYGvlMMKct7es/mDLTyK2CNU=
X-Received: by 2002:a17:902:d581:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d0ca75b37cmr255853705ad.11.1786077827947;
        Thu, 06 Aug 2026 21:43:47 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec5aac2sm2577332eec.30.2026.08.06.21.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:43:47 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v7 4/4] KVM: PPC: Document KVM_PPC_GET_COMPAT_CAPS ioctl
In-Reply-To: <20260806170645.11892-5-amachhiw@linux.ibm.com>
Date: Fri, 07 Aug 2026 10:05:22 +0530
Message-ID: <cxvulf91.ritesh.list@gmail.com>
References: <20260806170645.11892-1-amachhiw@linux.ibm.com> <20260806170645.11892-5-amachhiw@linux.ibm.com>
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
>  Documentation/virt/kvm/api.rst | 79 ++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e3003a241d5b..22fedb0aa34b 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6566,6 +6566,85 @@ KVM_S390_KEYOP_SSKE
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
> +  E2BIG    if ``size`` is larger than the kernel's struct size
> +           (new userspace on old kernel); the kernel writes back its
> +           own struct size into the ``size`` field so userspace can
> +           retry with the correct size
> +  ENOTTY   if the backend does not implement the ``get_compat_caps``
> +           operation (e.g., on non-HV KVM implementations where the
> +           required KVM operations are not available)

Amit, this may not be true anymore right after your changes in v7?
Can we please update the documentation accordingly as well.

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
> +to support extensible versioning: if userspace passes a struct smaller
> +than the current kernel version (``size >= KVM_PPC_COMPAT_CAPS_SIZE_VER0``),
> +the kernel zero-pads unknown trailing fields. If userspace passes a larger

So I already requested that we should fix this. We cannot write more
bytes than requested by the user, since that memory may not be allocated
for this struct in userspace.

On checking Sashiko comments in reply to this patch - I think that is
also complaining of the same thing that it could cause buffer overflow.


> +struct (``size > sizeof(struct kvm_ppc_compat_caps)``), the kernel writes
> +back its own struct size into the ``size`` field and returns ``-E2BIG``,
> +allowing userspace to discover the kernel's struct size and retry.
> +``KVM_PPC_COMPAT_CAPS_SIZE_VER0`` (24) is a frozen constant marking the
> +size of the initial struct version.

Once we update the comments in patch-1 - I think we should correct this
documentation too accordingly. We should just simply use
copy_to|from_user_struct() style for doing this.

> +
> +The ``compat_capabilities`` bit field describes the processor compatibility
> +modes supported by the host. The following bits indicate support for specific
> +processor modes (using IBM's MSB-0 convention where bit 0 is the most
> +significant bit):
> +
> +- ``KVM_PPC_COMPAT_CAP_POWER9``  (bit 1) -- KVM guests can run in Power9 processor mode
> +- ``KVM_PPC_COMPAT_CAP_POWER10`` (bit 2) -- KVM guests can run in Power10 processor mode
> +- ``KVM_PPC_COMPAT_CAP_POWER11`` (bit 3) -- KVM guests can run in Power11 processor mode
> +
> +.. note::
> +
> +   The bit numbering above uses IBM's MSB-0 convention (bit 0 is the most
> +   significant bit). In the actual implementation, these are defined as:
> +
> +   - ``KVM_PPC_COMPAT_CAP_POWER9``  = ``(1ULL << 62)``
> +   - ``KVM_PPC_COMPAT_CAP_POWER10`` = ``(1ULL << 61)``
> +   - ``KVM_PPC_COMPAT_CAP_POWER11`` = ``(1ULL << 60)``
> +
> +   Userspace should use the defined constants from ``<linux/kvm.h>`` rather
> +   than hardcoding bit positions.
> +
>  .. _kvm_run:
>  
>  5. The kvm_run structure
> -- 
> 2.50.1 (Apple Git-155)
