Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C1C3F0A94
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949983; cv=none; b=aAcbc90BHwF2u8yt2VACdM+lwgrHA8O6kLkf0toAZyACQhdERNtCba6qWbal4/DdsTq+KccT8Xbk3SuEUb5871ZdenR7WmaqFkradaNDvU9xYagBME0Vkp0AwNqw0YRQ5AqFAueFXXYje9lQNJ0Ilev27r7NnhdYcuxsKUpO7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949983; c=relaxed/simple;
	bh=OFPsVUKTkkJPaSLrVoEdb9zPLdAMuapXjHJIMHyQpqI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=opthv4JlJKbnwolYYikJpJqSSTRXWjoYv7/uqHohni3pGIlfNuW72SM8d1NBoebmeNoszeuS4iSs1IeSJFuIKjNZHJvenzziGsS4W2Di+EfhIwmyp+5ec+/SZudv/YLrCmO/9YWo4K7HU6J7DafQyBPEr3676VhdvM985I5kmTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ph4tBiup; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ph4tBiup"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso3797379b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776949981; x=1777554781; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gKFsUpIcJrOZ7JV012cOGqmLlLh75Tdbz6kdKZGcdk=;
        b=ph4tBiupjuLp6t/sTgxD1XKl1wEf5iYcYhvGnRrqD4t1vCR6kfvWJKwW8NFxZKOg5A
         YWOgnN4RlxtFofD33JhSbYF+ttQQlRuC0XMpZF5aLlUIpjpG8cgAvch59hv0of20jvIU
         lGCdY3mei3SBG69+W5naU3Spr8cC0ThfxUh5xA7NXp6jiyeWQOHVE/rWzePhgoi+wQXR
         3THDivfKBAAirFeT+zGeHqmemtiLtP2IfFlQ8ra033+J9fdp2viVLgsXs2YyzZqQBK6x
         oKacUrNjZJ86LwU2h6Ojh+7NfbOmriJzJ6KbnhXs04VSHsdDCtAu+IUWpGAzMajY5iAi
         HTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949981; x=1777554781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gKFsUpIcJrOZ7JV012cOGqmLlLh75Tdbz6kdKZGcdk=;
        b=j8z6IQrNAdzRTODPdY26FkShW1xQccgw5jXNqLoyzCuHcQdgDbeZlLBDGrkYA5wFwM
         cFDK09lfgOfl3AaJ5Fvvd8uczC93qrbzgxXK+8r3/wSSnNEMfubk3uUQSidrEW6dtasE
         /yhp3yIjQ3OQVARji7YzekVVxNaKmivDrRPAcsDQZ7dUAiX9Fg0CaHoiN8beSmf897Nq
         gQg4J3DtSkD0OK84+8rk232v0PHWVFPrCy5RypWL1IXTk2HHP/xOiTq9dNVRV6xQix8W
         xYRKoLQUdT9R4btuKpi5N0bST2HDlgVOZj1E+FEhwF2Sdrw1eVs1rRpcoPC9DRUnSPuX
         pHvw==
X-Forwarded-Encrypted: i=1; AFNElJ/o6hceumOx5WX+EgrAZQAg3X/CijCmHhI261qNv5w77NaMJxCfe8Z9XI7ahT3bljPxfT44zb6d7ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIBil7bCd6hl1m1iGRwubUniqXZ4XhoBlDou3vfVOIN7GTlaG
	HudCd2AiTNRJdixZa1H93JLnbHOS6aeU97kiPIK1KAWET6Yr6LNzIxLbiZEA73XtrlBqwb+ZFJ9
	lNNIatQ==
X-Received: from pfbiv33.prod.google.com ([2002:a05:6a00:66e1:b0:82f:1051:621])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a883:b0:829:6f7d:3093
 with SMTP id d2e1a72fcca58-82f8c9ece1emr28281470b3a.48.1776949980819; Thu, 23
 Apr 2026 06:13:00 -0700 (PDT)
Date: Thu, 23 Apr 2026 06:12:59 -0700
In-Reply-To: <20260422-vmscape-bhb-v11-8-b18e0cf32af4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260422-vmscape-bhb-v11-0-b18e0cf32af4@linux.intel.com> <20260422-vmscape-bhb-v11-8-b18e0cf32af4@linux.intel.com>
Message-ID: <aeoa2yM2gq8Llype@google.com>
Subject: Re: [PATCH v11 08/12] kvm: Define EXPORT_STATIC_CALL_FOR_KVM()
From: Sean Christopherson <seanjc@google.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	David Laight <david.laight.linux@gmail.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Asit Mallick <asit.k.mallick@intel.com>, 
	Tao Zhang <tao1.zhang@intel.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

Uber nit (don't bother with a new version), please capitalize KVM:

On Wed, Apr 22, 2026, Pawan Gupta wrote:
> EXPORT_SYMBOL_FOR_KVM() exists to export symbols to KVM modules. Static
> calls need the same treatment when the core kernel defines a static_call
> that KVM needs access to (e.g. from a VM-exit path).
> 
> Define EXPORT_STATIC_CALL_FOR_KVM() as the static_call analogue of
> EXPORT_SYMBOL_FOR_KVM(). The same three-way logic applies:
> 
>   - KVM_SUB_MODULES defined: export to "kvm," plus all sub-modules
>   - KVM=m, no sub-modules: export to "kvm" only
>   - KVM built-in: no export needed (noop)
> 
>   As with EXPORT_SYMBOL_FOR_KVM(), allow architectures to override both
>   macros (e.g. to suppress the export when kvm.ko itself will not be
>   built despite CONFIG_KVM=m). Add the x86 no-op overrides in
>   arch/x86/include/asm/kvm_types.h for that case. To keep the pair in
>   sync, EXPORT_STATIC_CALL_FOR_KVM() is defined inside the
>   EXPORT_SYMBOL_FOR_KVM #ifndef block; an arch that defines
>   EXPORT_SYMBOL_FOR_KVM must also define EXPORT_STATIC_CALL_FOR_KVM or the
>   build will fail with a compile-time error.
> 
> As with EXPORT_SYMBOL_FOR_KVM(), allow architectures to override
> EXPORT_STATIC_CALL_FOR_KVM definition (e.g. to suppress the export when
> kvm.ko itself will not be built despite CONFIG_KVM=m). Add the x86 no-op
> override in arch/x86/include/asm/kvm_types.h for that case.
> 
> Architectures must also define EXPORT_STATIC_CALL_FOR_KVM when they define
> EXPORT_SYMBOL_FOR_KVM.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
