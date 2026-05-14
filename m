Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57BA306749
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 03:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730899; cv=none; b=IbsxevhtC6mnv9op9OZNBPMC6qoq2IZF4APwphlwXfaWvTJ17nbnEbjCNMw+mV0PwCCx+jWjUBynoyXTDpqTGfxYgyG4Z7x+Xts+bMQKdBV/nlmnWh+4TXIEmkaEsub/sdsrlYFca0uJB8RFJE2IxFl8aTqcg3QA6hFiy13nzkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730899; c=relaxed/simple;
	bh=fsjYLSWcc71c+iOmkcD/Wk13v5fBkksJ8/Ir0dWeEvU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=WvZR6+TNZPQLNdK8Jxci/STXRutOW8/JR6LplhM6WZEOazZWV1VyxS3NbBiurNOiPFJEXtG0lljzmn2SYelS7JCTlZVt2tIFHX9O+7NIdmpAAMmc8oWQUpdbTZEn8ikoNodrlD2rdhsm2WXh5beqxunr1lFJCFlCbduJWUMOeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JACkQY5x; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JACkQY5x"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-367dd53815fso3144679a91.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 20:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778730896; x=1779335696; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PKqV86kcIyK48A4gK3vO7m3hgwBILm7DPz49r+DJUUE=;
        b=JACkQY5xKJCZGQs26Zykmd9Lg1tJcQ4rVuepEZPfSDc4IJarKYmg8sBekobEEsBY4A
         yt2wdD7rVKFHhm00Ew77pL89nD/neAkT54oCT5Ey+ssxK3wSiN7gsgeXEecG4XLpMuf2
         4AK4Lvzt2TKRLWkUNqv1t/A8+JY7YC97NfDsx8PxuUneJowAHOHMC5lWOToOKVpjgkZJ
         IFCs/FLWexHIgSCIyXaRivY48dYSff1D2B8xv/acA+KoMNCKq5o02B3yF7psOgmP1DBO
         /94hkgxFEfWAfX8+rGk8wBrqkDgx704r+C7okeAD5de22NkfdrsOSCQHiElfURs12dD4
         qEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778730896; x=1779335696;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKqV86kcIyK48A4gK3vO7m3hgwBILm7DPz49r+DJUUE=;
        b=pu4IdsHK+A3OtXw6BzKvnjgZ4ALtA5opTu15n1++rCPxuX0X//vZVTHV8kBdDeBBfR
         jklxq8t3ZnCzAYtx/7H1KFhoyGzyo3LcIb1xWYZE1UYZ+EWfVCJyJ5KwiqQdzcse39PW
         6s5DW8EBGT+JrlAUcMWZ6JMguK/BMjqVjcjlK+lAZBMUU/WIaY4UHcpeck86+6cWjYVj
         pm+WEDhfSsy3lM9q3QVOXuZEp4xufxrQSVcaXxsv5QIg8onyZJuP38kfHaLHDCBaGTYn
         lkqxvBySmg482gvMK5aoIOJzNwHnj5gpt9WHAzW18UoggOqxlCwlybJHHdeU1941g4Le
         9s2w==
X-Forwarded-Encrypted: i=1; AFNElJ8kpetEuqVxf1ZCxdZ8jrIQHzg8xeU3Gb01clyJNAFkE0VqkJ6QWiHNpD9kENXnTJt3QaapOnCMH5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84r17rjlyLUnbHD3gGAT4NZ0ZYCAby/jud8AdOu3QwxW+/9mF
	Q+KA28ARD2DwTEo/Zdzq+9s38sRBqI/+d6n38VjMNp9GbKXD444YehRu+3sPQw==
X-Gm-Gg: Acq92OEEHM4XfJ63ktCxVPW29hqJll7Ic61LiC2cKL/GZ/ycTv+kxRiG/uzwxtvRxZH
	lBLmbTND6m+VtfR39Gdt6fMGCcNlRVbqfVti5HnYgqnp5G4c4iOsAiQTOEJ2QLASKkt/+iFMecn
	lcOLtKMSs7uyUnwZJeBWaZnBOny4Z3orfxM8RGe6ehu5ZA9yRzBLFgOEsFRg/MG7tuWM5epy8US
	hDPpOc6vmIVcQSaaNtL0fglFjZDzqVCTkeu0XYdt37bTdhm+MgWiVr+yohqiUvPALKG1MM2yf+N
	QkZcruM9KRiv4+A0t2wFy3RHCNyHcvwRlTlQc97O2JXSmYhL9icklkJW60lkMdyBTpaPfzfD/3f
	z2zvVpm0tAw/iiAq/UDsYiz9YuOs/iFz11gdnWiMLbsTePX1hzDgHyc3/9SgbdyLasLbf5hbqZm
	GQs86Hr8IypnF3mEXpDs2MHQ==
X-Received: by 2002:a17:90b:56c4:b0:366:44a4:ab0f with SMTP id 98e67ed59e1d1-3692346f997mr1680017a91.4.1778730896205;
        Wed, 13 May 2026 20:54:56 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ede20a50sm4803643a91.3.2026.05.13.20.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:54:55 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] KVM: PPC: Handle CPU compatibility mode for nested guests
In-Reply-To: <20260513100755.83215-1-amachhiw@linux.ibm.com>
Date: Thu, 14 May 2026 08:49:59 +0530
Message-ID: <o6iir82o.ritesh.list@gmail.com>
References: <20260513100755.83215-1-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>


Hi Amit,

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> On POWER systems, newer processor generations can operate in compatibility
> modes corresponding to earlier generations (e.g., a Power11 system running
> in Power10 compatibility mode). In such cases, the effective CPU level
> exposed to guests differs from the physical processor generation.
>
> This creates a problem for nested virtualization. When booting a nested KVM
> guest (L2) inside a host KVM guest (L1) running in a compatibility mode,
> userspace (e.g., QEMU) may derive the CPU model from the raw hardware PVR
> and attempt to configure the nested guest accordingly. However, the L1
> partition is constrained by the compatibility level negotiated with the
> hypervisor (L0), and requests exceeding that level are rejected, leading to
> guest boot failures such as:
>
>   KVM-NESTEDv2: couldn't set guest wide elements
>
> This series addresses the issue in two steps:
>
> 1. Detect and reject invalid compatibility requests early in KVM to avoid
>    late failures.
>
> 2. Provide a mechanism for userspace to query the effective CPU
>    compatibility modes supported by the host, so it can select an
>    appropriate CPU model for nested guests.
>

Do we really need to add a uapi change for this? Tools like Qemu can
read the device tree info of the host, isn't it?

> To achieve this, the series introduces a new KVM capability and ioctl
> (KVM_CAP_PPC_COMPAT_CAPS / KVM_PPC_GET_COMPAT_CAPS) that expose the
> compatibility modes supported by the host.
>
> The implementation supports both:
>
>   - PowerVM (nested API v2), where compatibility information is obtained
>     via the H_GUEST_GET_CAPABILITIES hypercall.
>   - PowerNV (nested API v1), where compatibility is derived from the device
>     tree ("cpu-version") representing the effective processor compatibility
>     level.

See there you go, for PowerNV if this info is provided in the device
tree, then Qemu could as well just read that info, no?

... yup, kvmppc_read_int_dt() can do that I guess.

So, my request is, can we look into this to see, if there is a possible
alternative to this? maybe we already have a mechanism which Qemu could
use to get this info already?

btw - I haven't given a full read of the patch series, but reading the
cover letter, I felt  we should atleast add this info to the cover
letter on, why a uapi change is really needed here, why can't the
existing alternatives work for us. 

-ritesh

>
> This allows userspace (e.g., QEMU) to select a CPU model consistent with
> the host compatibility mode, avoiding mismatches and enabling successful
> nested guest boot.
>
