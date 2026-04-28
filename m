Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1B2388E71
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419659; cv=pass; b=SGRvQR1o5fH8qQfuZYEXvBDpZOBo7lcoFht0oSFepGXKJcG+dMlQWOg+3zlJrrJyDyQPSIlE+Td6Cykd77mkZmibtzV/cN2RGk/Jsz7e0ULcTCQZx5lD/D6nsNIjSGSfUGKuMu61dlidPccOG0FK70sdCNeqyoBXt09FUtbBfpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419659; c=relaxed/simple;
	bh=U3ahQduobNenu2MyiCXv14Q8IImIIVCNH9OIRKPH1FY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXN73pzUihUPOWfacmEQ1yFSnM/NoqBRNQMxye6dPs9l+czhPPeAn14cXDY/wBZVc+GNIUPX44eqXAcY1/Mmsb/Y+izIEUb1uCbN4EFyn4XLT+/EopjhshIK/Hpk+IUaYeElNS5SlJmvckVog0QSZbF+2CgrMZKYXT4wWCF+BBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hsmFq7DF; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hsmFq7DF"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6120528b8b4so3507999137.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 16:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777419655; cv=none;
        d=google.com; s=arc-20240605;
        b=UxkTia0IH6MO5kum69zzd3fQKRnka3lHfE1ghyTM22/kguwzQHICVPIbjy2yPZ/K+z
         0XvWbC0IvdY4LO5ZgGLNRYErqSZdIXPK99t5Wrhjd/XgqspYy/Qksm+jbj7kVSNL7AOv
         iZ0nyuBRJqqZyi/it5dxUNVz+2VJoYevnNnNYwORVb0QNiUqhYuAHVLNieVQ758cs9Ek
         kRFUNlY8jSwZwKYTF7hjoVLBhnQwlmoQGZ+4zvPXT3ZcPa6NZuqxUXbxeZijkW+2lMfc
         i0aMN+3Ds4d1l12YihqdEV7GFPpS0y7/srSxLJnzrVwD/BDU7xgr3M1X1qicIAcyT5B3
         WBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        fh=Kk6ucfmuz4IIVei1kqNWo7LueSTxX3gMynZDfOmalcg=;
        b=AswcfiKkP5GTtgii09p9NSVFfa/XAg0QzivKDyeli4rp9oeUyoLdjqRBFmkmWu4fj5
         Y49DeSaBc7qHkGKnSwLpcn3NS/aVj7z6fXt+mFz9Sc7HZPhj9cCTwSu/Tmv+u8OKMV+v
         eajO/yoLuDeJ0gyf98sKrn6Rrb5B6ZVo7sQxExidKf1oTiY2IpEa4AKVgq/NBef7KeCh
         0cUPKC6VSdziGrR/aF1b4ASR+psfK56evfygS+z5/d5RvjpDOXjuk4EN3dcwqODdwjkM
         KL8DmVXZZTQfE59IwpHu1jub8ZGJdKgEk/7VpnpBOhH09q9WVG2r1EkysWFSzeiLiJs+
         UVsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419655; x=1778024455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        b=hsmFq7DFMBfAwtb1IZ6VAuUFHbYwGJe7T0YGoC2CKhGIdjx03B6Mtva/uC62TfY3WS
         MmLL3e6YwiFrJZCe2ef7t+xrcR2XxghUK1J9+MA+2/7GY0Kv6SiMlyXY3elQUFAQeYwh
         +TT3HVmfTWZ8OgqvASfAFZ5JbpMU+zuyrahpa3beA3dcT/5NtNlmlhNTUvuQRi2tPGGt
         m0X9RTmx7ze8yVGzOECOZQOaP+HaBZpOrTA9MBKHH7H7dIwkWZ9xYfeHKrj2OLaQm6sH
         177ukz6mlxPHpdy9ilHl6aV/WYum4uGcKUbdHIrqTCVwaxU0rQX9FIolN1xsa3CdA7+E
         PeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419655; x=1778024455;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        b=GXbeer+D66OD4KYNCk+c446veLT+1HFEJ+Suwbzuox1GJS4tYRvI17djuOt+FDoSx6
         HyKZ2171FRpc3EsP7++5cjxmcz4XbXttq9g5VoXmydcgPj+O/kGehB7QRhNQQ9epvGwc
         UqFJ2D/vRgyIupXQbzrSb4Bk+i6kgD8gng8Q5WSG0eNnPYIL7+YJVlkaR5RBPQ0MIV/W
         XeHqmD1q6e1QVOWT8fk4Udax3+qTwJfc4Yjnly1j5ZioWwD/z8ZtEo0113cgndgHLOaT
         ejZoVvjUT9mKvd+QRX7aPZ/WnSk/8IUo9pMLPQhcLDxRjgocmtgRqoNlBZKDJAx57cHT
         CICA==
X-Forwarded-Encrypted: i=1; AFNElJ8215owjzOzgSFZ9sdss5zNXV71b8aq3SO7wkHgE2KWtRu5LIFrgbH/jIDE+6nAnh3K1J0k8iGAYtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlB/7hTIKZpd/ZT5vPMLEbisZOqPk3iVmm+LWvbP4Iq2AEx3KX
	5WccwD28yGXdAMS7qclYNs9Vb/gPgSWbWKwkVbEdtZBzIisSCLY06UITfsfuoNLC7A7Cjmv315M
	BenHFQtEswUGbd0dXNXEeNe0uHIQJQQzEZt5BeYDJ
X-Gm-Gg: AeBDiesViNivMoyrE6LfiBngarx/13NUNJFcSb7xT7kkMwPVM+oi9juZjm1JLXjsn+1
	orTQN1kuaf8rEYP6jwbX3RLFG8x4x+BhxRMmo2mEwlChEw1HJ58oTJ0nupHFffJic3mcB6yy6gu
	65YGpjdSs3J6UBJJcZplMPrrHIvPoQajKOmPeY5h3H2NnPPFLzFkDNfpmipXw9a4D2WqQvrBDnP
	diHenNJ6Nv6XoaLagLOy8H84Mlpzjpo4hNwTHvo0oFpnHcjKHaWJl5OxH+kuxnVAFoNAvkqj3PW
	Ml98zsLMgqla8KfjdH5l+jWYWpieyRyaVn7aevF3JcdgJEUdPhxorz0/VnXsMt5e1VKblQlMaj6
	2OePk8WsqMnAZKLw=
X-Received: by 2002:a05:6102:809e:b0:606:49d:183f with SMTP id
 ada2fe7eead31-6280b1df187mr2828068137.26.1777419655062; Tue, 28 Apr 2026
 16:40:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:40:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:40:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260428-gmem-inplace-conversion-v5-24-d8608ccfca22@google.com>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com> <20260428-gmem-inplace-conversion-v5-24-d8608ccfca22@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 16:40:53 -0700
X-Gm-Features: AVHnY4K8zc89tOubY_FIZvJs5RqMpzsyiDSJNy3Ts6m6f6GRhz2hBKqCaZ_7fHQ
Message-ID: <CAEvNRgGv3RZipinpQLCGUfBCAfS0PRc1mCx2yc3JgjfEu=QhdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 24/53] KVM: SEV: Make 'uaddr' parameter optional
 for KVM_SEV_SNP_LAUNCH_UPDATE
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Michael Roth <michael.roth@amd.com>
>

Thanks Michael!

>
> [...snip...]
>
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index c2126b3c30724..bf10d24907a00 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2343,7 +2343,15 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  	int level;
>  	int ret;
>
> -	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> +	/*
> +	 * For vm_memory_attributes=1, in-place conversion/population is not
> +	 * supported, so the initial contents necessarily need to come from a
> +	 * separate src address. For vm_memory_attributes=0, this isn't
> +	 * necessarily the case, since the pages may have been populated
> +	 * directly from userspace before calling KVM_SEV_SNP_LAUNCH_UPDATE.
> +	 */

I dropped the #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES from [1] since
vm_memory_attributes is #define-d as false when if
CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not defined.

> +	if (vm_memory_attributes &&
> +	    sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page)
>  		return -EINVAL;
>
>  	ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);

[1] https://github.com/AMDESE/linux/commit/7e7c29afdf3763822ced0b7007fc0f93b8fb993d

>
> [...snip...]
>
