Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA63081A2
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 04:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786077173; cv=none; b=Unqy78aiauH2rl0tqMOY5WRyuaPCk76+jOsJx0yUHYGcn0sdf2zQXbJvAP0LH+5rkCDV1KO4fWesidaV/5qM2mxoWujxJEO0GSbFOsj6XMFtfan0QVVkAIZIyoVPNQ8jXoQKdxP6QWJD1pyaHy09ZaLH/31wW8smWbDCahaHyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786077173; c=relaxed/simple;
	bh=M3Lxbp9rzrBW5TCqXW/t/Ptj2VwgFqJHT6weFnFcgEk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=skV+8YSGgEPvpvgP9nEH0yiLhjdpWtoQvJihb2kGt7AaA7aYk7UCk99GGnGibVUWnNmjaUR9BYePPgx/gxow0csEuf3FYJSm63JioLgmhFtFZVDKdumcX+8WdH5IzNih0k/5HNLbIWhuEnYh05z6iZvsVk7LJi9e6Mf/b1h6GHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW9/78tN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW9/78tN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cace91f112so34143245ad.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 21:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786077171; x=1786681971; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vkqjg35/cvh8GomrXzxAYhQLuU0mAPIeu9aJpH6Zlvc=;
        b=IW9/78tN9BAiO31trfDNiSFhqIiAI2IxSE/U8vcPevtcygNJeSkHRnv4Ht/WpJPSEW
         BGl6jyWRJGyk2msDmjB/8IJu2Y4EF+Mjrdp9XddAm9Wbg3TPkdMW74GW4QCuvmOfnQhZ
         FJlKCT0dL3W05frwPqri+TvN/VQXnURVK2lFgQMT3O6W6dZ91FZO3atN/+zn/jVr2T/F
         GKM5rFxkxr/T6UhTrKJCWaUIDbyrwexubEz40q0kqtJyLHvuIx9bD9HeBWZihT4/0s8c
         ZqXsn0NlS49A4AsVwnz/SIMu+R2Glso1H5VVw94nf4kcAFfEwg6QIwSYhc47tYdkCmNu
         0h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786077171; x=1786681971;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vkqjg35/cvh8GomrXzxAYhQLuU0mAPIeu9aJpH6Zlvc=;
        b=RNVfPOM1EYMMMtYl95FA4yxN1vdfOWk6KGmox1yHNiC3njpqn1nrPifi9nIps5DZje
         /4ITkQ9CgG0FHiM0BREqFjbzXk9kfuKC2di9IQyIPgDY2sgb8e/ZEDpzfrf054rfxF6n
         7kpp5FvN7zZ9aYHWF7OlSSxKDQuy/ETBVEfsFosv7Ntm0LvStTNdsHzzz93cyJevruQo
         mnLMndcMPsyFRmw0geAvFv0OvYK6YuX7bBk3ouU/eK/TVlTw0rm9jl2YaWQrNZgG3JdS
         dLweA4tuQ8jx74P6K97xaebWMz/9okVueGBPUFiXwGhIl6vnqkGkBZCWEr4HchfXoNiQ
         6H7w==
X-Forwarded-Encrypted: i=1; AHgh+RrgxPqVU21EaBpXYoDK2HcKAlUfqmmzRTfjFQUBgxCP/PW250o38QG4UfUcZuSd3Bk13VHhtljQnnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yyfhHJFbosc5f1qd07A6R5GlfU8PvkQnORmTpyXwzNzJQaSd
	KOHbvYOhMOVJbMD0gxxoUiBgSBSUxEY7zUGBYV6Yv/B17xFDSB28aahx
X-Gm-Gg: AR+sD13NN2PcjXtcRDA1W1o5dk6kWRDcaSdyJMfCLCijVCtZip2fh5jdPq5UMO8mklH
	X4zugLMOF7iXWUxvWP5jO+KfcMqoNFZMbJBZOY5oeKwQiQtn6rtU6E2xIOkZyVXG91YK2Uz/6lE
	v/HUPaseLoF+PHHJngYGHp0+Qa4CQO+PYI025EtHMM77veOX2aW6jKr8JjXZUTAvNIXsfwAbN7o
	1iGXKa/QwwV4uN1gF5U6808LFAEDs5B92eXH4CvkZAr4TjDW01IKgleQez51YfzPDychCxDaYaq
	lPeQsqF4rLzSOp7OmJfS2UIN6QXzEF5/N9c3jNR/RGgv9gTaQ85dBaTZsegnVwZPSfT06oSlWBc
	hk0B1BknMDuixpOKRSUkKxJPXoxTy7jkdgcKl8AxPgy2hzbh29hP0r/Xv6OLoasO36v40LKFTbi
	KTc/pPP6WgWJI1+nEL50wpRTkM/VWXGIylllRB7rdSUcBOvhAGzboXsOEBaJ+0XYamJAhr5A==
X-Received: by 2002:a05:6a21:685:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3cb85e99243mr23742133637.4.1786077171329;
        Thu, 06 Aug 2026 21:32:51 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm2604158eec.23.2026.08.06.21.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:32:50 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v7 2/4] KVM: PPC: Book3S HV: Implement compat CPU capability retrieval for KVM on PowerVM
In-Reply-To: <20260806170645.11892-3-amachhiw@linux.ibm.com>
Date: Fri, 07 Aug 2026 10:01:58 +0530
Message-ID: <h5l6lfep.ritesh.list@gmail.com>
References: <20260806170645.11892-1-amachhiw@linux.ibm.com> <20260806170645.11892-3-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> On POWER systems, the host CPU may run in a compatibility mode (e.g., a
> Power11 processor operating in Power10 compatibility mode). In such
> cases, the effective CPU level exposed to guests differs from the
> physical processor generation.
>
> When running nested KVM guests, QEMU derives the host CPU type using
> mfpvr(), which reflects the physical processor version. This can result
> in a mismatch between the CPU model selected by QEMU and the
> compatibility mode enforced by the host, leading to guest boot failures.
>
> For example, booting a nested guest on a Power11 LPAR configured in
> Power10 compatibility mode fails with:
>
>   KVM-NESTEDv2: couldn't set guest wide elements
>   [..KVM reg dump..]
>
> This occurs because QEMU selects a CPU model corresponding to the
> physical processor (via mfpvr()), while the host operates in a lower
> compatibility mode. As a result, KVM rejects the requested compatibility
> level during guest initialization.
>
> On pseries nestedv2 systems, add support for retrieving host CPU
> compatibility capabilities for nested guests on PowerVM. The capability
> bitmap reflects the processor modes negotiated between the Power
> hypervisor (L0) and the host partition (L1) via the
> H_GUEST_GET_CAPABILITIES hcall, but is retrieved from the cached
> nested_capabilities value populated during module initialization,
> avoiding repeated hypervisor calls. A WARN_ON_ONCE() flags the
> unexpected case where nested_capabilities is zero on a nestedv2 system.
> The implementation defines KVM-specific capability constants
> (KVM_PPC_COMPAT_CAP_POWER9/10/11), masks unsupported bits, and exposes
> the result through the KVM_PPC_GET_COMPAT_CAPS ioctl.
>
> Hook the implementation into the Book3S HV kvmppc_ops so that it can be
> invoked by the generic KVM ioctl handling code.
>
> Suggested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Tested-by: Gautam Menghani <gautam@linux.ibm.com>
> Reviewed-by: Gautam Menghani <gautam@linux.ibm.com>
> Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
>  arch/powerpc/include/uapi/asm/kvm.h | 10 ++++++++++
>  arch/powerpc/kvm/book3s_hv.c        | 20 ++++++++++++++++++++
>  2 files changed, 30 insertions(+)

Looks good to me. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
