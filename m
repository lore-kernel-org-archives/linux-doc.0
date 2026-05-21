Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC54028D3
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374415; cv=pass; b=AD4LTlFDaCge3Gj9aw1LvUxCkWunKRf8nWGkORK9EKCVcZqOl352pv6Liv0AjjpJFiZSj9g3KeRc5qZne+BfOo8RI2DSLaySOR8x1wIb0Wkty1hs9vO5dnHnKlwvEOLchZ2AlRWzx90IBVuC+uhQ6tYRmCxIUj6EBqNWTXoxvKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374415; c=relaxed/simple;
	bh=RPARozcT6UfC6sMpVhy6r4Aiv8XaW0DBJyjeK/ufCb4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpH5eG+gCcMJ9hilPohU2DtqlkxMWL8VxL3EmhXAKXECl6UHUNzL9tXSAOB3aUzIgNCRoKhjO5hyOiFt3zjPrzgLqxmmyKk3KFrdVb8LcPqmt4G3JCpviCelyoBxLJdpMhbeIywEBs8IrZxLPCMAlWnfJR7isVrsMQVSV4zO7KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V9p0GPMM; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V9p0GPMM"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-636970cf66cso4698994137.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374412; cv=none;
        d=google.com; s=arc-20240605;
        b=HoDfkxoApChmzc7K+qbqwrxk5RR9qAOnluW2H6b3/nK84ZYUspgnGRo+JHfaexYEfu
         iHaCIV5Hob0Ae9lawRQgtml4mFPx+BujgkPQ7PcbVC//PFVMasV4kh/5A9i8owtth0yK
         zyAHqUr4am+ILR8rdf70/zEahA8DJlfybMKNJw/v1Gi8cywYw3LsGI+hwgs5PkNgAQPR
         O9IDo/7ylqRNURGdZ53ySQS/I4DjAXOxiUXJWgTI03HwJSYVb0vWlQxzf4EJHAPGNp91
         CqzhJu/uu+OjGlwZ8XYzdwq7dPQDO++81nda2rz1HQ25CTWj5/dyjoIk4bjMKbbCw/Ea
         uRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        fh=eP7bdccHzCPy0jRWcl54TchSOUEGI3v6LGLiz7roYD0=;
        b=C8GQAu9F6RRBQybZrEo1z/eJnPxOMz5JwLVXGEt77bihDhdEO1T2pv19vBvM9/UAB/
         XJr3TBlG8F7bMy6PPGeDrnR6bBBKiL9ym5RWoaXBWq0rijUFQ0FOhiG3nU6rLJWIcmLI
         nFu8slkH/S9CQpjmQmH355dzoKinUapvF6pptzLDSNRTZnZU9PLpWDD4rUdKvJQkbnyF
         IptfJOsOSoEKiFRs4CoarzkjuYWDVKhyQy4SDo8un85hsQdTtXljsszxG9HKT5lYCFO8
         JRTBXAIx7lZx2j8qvSe0RRKKTwrB5qCs3arQ3ztXhTYjwyISyGf0zRvXO5C9yA66Oh+P
         tX1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374412; x=1779979212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        b=V9p0GPMM4JoAoxY0vDgPfychMd8I2dNla96qYqWgPvlZ0DjapntWlKuDNmOjfW+/XW
         +IMGiGnTtURerCqRqPJQrpRxyxBf/qdaQIONZqce1kHnH+9efXUw0bi5zweZjavzLg53
         DLSTVoI/XsPLkgdTjBzww57u0BKReUP3QNqC6y9NxCJ4uigCAAqF1xD1Ckt2XEbuX4lO
         i9MRjTpHgb+xv7cdKHe9yZJ8ko17HPICKtxup56MY8yixmjhhW5iItr94mePc3x+Dpm1
         KM2Z+jwV41cHy6IulePecYceVwzzuxIUO1BCOuDRt+se4qKkmsh/i9pwQ0urySguHFzV
         GvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374412; x=1779979212;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pETZ8fM2HZBGp3r6phdANPEwcKJJ9mevi9pfUImaGvM=;
        b=IxRxzAjFzCs0ZgtgBz0UHKkwYcg2UUBJ65Ur6unziMcntbFvb6pcuPsIhb2avO9qWE
         Izf+VXMUlsHzutotQUNlF/7sQRzXMi4Klfo5TlTJu3k80hgEXM236FsptVOeHG2DHQof
         SwIQFEDTgX0M+BykKA3RaoDOjAmTxza3MuDtBUvRshm+qb67p79wc9H1Hmkq7cjUiOEn
         RRfX0+NbQfjNuJBVS5vmQRbgzKXNHWIziryDIlXeWwpZ5qLwJmA1qhAiIyK6nxjRr0g9
         lhB4NyjBxcaCpbqGbzWB/l6djfjZP5Ja2Ddo7vkFdWD2Ukqlup/XLrcKv8oTovLgWZqr
         MH8w==
X-Forwarded-Encrypted: i=1; AFNElJ/Ax4RqQGi/UI1wngpShgEt9fsTbKs9ZTdSDhCtOL3NFvmSIzQnFrAEEbyU+u1h+EJJYPdY0hv4vhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hxReihS7H5VTTQbD4YV7nzMB4BsrEePjFfFrtApYRgxaaKFT
	GpD6W+0LjnpmPt26CFORbEaGBh966LpfQ6YsmpN8RaeMfYgQXU4uFeeAg8TQS+UqCEBHheCllXc
	ytmr+6YHigwWi1NIuS/6U65X62YXRFMWpmj7MJvvt
X-Gm-Gg: Acq92OEpLqTTC4jC/Lc3NTZRdU9qgIxLpXTdwF7FE/JYCrzMf32Cg4NIH7PRSs9gy7x
	0tV5wV9lekZzbblNQBMSiU/xCkvK/FEZ3U6Nal5SJeCJj3AJOVDu6kff0TqrkmutBlUVZTaQwzA
	/tEeEsw87Uzcv4lmM0czjb/sWHcOCWvUCTKMK9pXZhjVPNBis4TBe8czeYh7cNVRPmZpaAXhiOI
	8rXJ2etPVupVeZrv296j5TyCDob5WnOLawjEVK/Uw/4dPSIImuvHaf8pTS77cqt2dGGjfRofZF0
	DxvXrie5Eu8pOyprfi2l5cRAj05S3hVkRensFJ2IYRe5uvwPhg==
X-Received: by 2002:a05:6102:52f:b0:634:248f:bc04 with SMTP id
 ada2fe7eead31-673cbd0ce21mr1147276137.10.1779374411627; Thu, 21 May 2026
 07:40:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:40:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:40:10 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag8BmtzxTlcuA_zy@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
 <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com> <ag8BmtzxTlcuA_zy@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:40:10 -0700
X-Gm-Features: AVHnY4KEEzPCaNbBUek3sDUc3FN_Enrlvw5CRgr6BoNKh9-pt1QUYC334HSuCXU
Message-ID: <CAEvNRgGDL=_XO3z=h2RLqb_gZFe9QtxwiMFJHCzQY3HEoaUfHg@mail.gmail.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -640,9 +640,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  }
>
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -                 unsigned int fd, loff_t offset)
> +                 unsigned int fd, u64 offset)
>  {
> -       loff_t size = slot->npages << PAGE_SHIFT;
> +       u64 size = slot->npages << PAGE_SHIFT;
>         unsigned long start, end;
>         struct gmem_file *f;
>         struct inode *inode;
>

My mental model was:

+ offsets => loff_t
+ indices => pgoff_t
+ sizes => size_t

But looks like loff_t is more suitable for places where return values
(possibly negative) matter.

Good to go with u64!

> [...snip...]
>
