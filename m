Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300754BFA
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 22:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708380248; cv=none; b=ICGBQZ/XUl8m0xSDr5s7hbiMt52Be+fQVlRitSAQCM9ut3X2nLKlJoFxhvqNNtfy8kUL6uX8FcMz5aIIgqjUIWBwgJKIl+4Lk6vDiHPpYLoAYcM4TweII/dt2jsasJ0jXjzOK/HM5xaQ2EWu7yKP4XKt4chs3pxVe8HBDako07E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708380248; c=relaxed/simple;
	bh=J03aD5uG4DZQRY96gYjBmSEDE7q4ck4AQZKwQK9AIG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d3dEtg5lXy64PdaGiufUzDPjOuB/5IRTfNSHx1t/WcwJ9E5cTPxL+isGdWrxTilomT8hvARxdrUOBRklQrCe6XYgjHQ0BarIRAL7mBvyAwy5yS6ww8eF4gQx5Uf0QuOag7C8YHa9hUM+6X8NiE5Rhh83i0vf7TWjBmuHJpO2vK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J+EPFUpE; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+EPFUpE"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6e41d856114so1636013b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 14:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708380245; x=1708985045; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIoAxWg2Rgxh0wBAnGtn0nTSmvHTWVcMdwCyHzC/E98=;
        b=J+EPFUpEHQ3akYJ89Gq6TMqfdrq3es23hlmojB0yE5/qQqySfBJdRxU8IV2vi5a9uU
         +gwqVXf/PIdIu9qg7pVrNV9yDKwK94xd8eh8sz3N+X6AKujtH+2bQoNmBITcrg6mIXgd
         BjR0JSEQqqsaB9Df2um/O3hY16ZbyfWF8ewFEEYnkvEHo8J9e99mfTez2AGRu+Se2kQ6
         hkwJF2uS+uxIT39DmALg5Dx277sCVgCBk+O1juyprxJl0kQ3vcRsXqURChQyDfZC7q66
         oK2wK76sBDUH4rxruhRXZusCJxNd7v/Lh8Yc5yFxY8JPoj1NWv8IIzBJoiMkTEaRhtNt
         Imcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708380245; x=1708985045;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIoAxWg2Rgxh0wBAnGtn0nTSmvHTWVcMdwCyHzC/E98=;
        b=UQ3wh4cSCnXOxVvHssxTdv+Wd0H0S53JiYhbGCpZv176D3zXxqoBg+Mf7ywkz7reuQ
         tNC8y10/Zr8H/1NQo5Am/zAsgrQOz5qbttChvGpAPgov/t/Ex8XUXbICt2ldT/o6WIvV
         lBjwvjUQRvGTWRW0tZeQ/Jx6+n628NEBhNkwiY3VWZlV8srbmc54Ke49sraR23RhX4Cu
         4XE1XUmYtoVpe2yiTKzauHS/Ad1GdBLb9FpUTqlIXhcFnCyI8cvrxUOSARvJB53Kx24v
         5zuhtbYURIaNHdVWXMOfpU3rV8+I1Nk3F/jadvyFxYFAm0xnhRQI55XJbio8qdm/Or79
         PqeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0zGYqB+o3sXcg/afmG3drucnN33QLcNoTFq8+YRMjV/Hu457ImVTSiyOuOIcVIMoo/DjHYE/w9JL0WqFtFq3zz+2H3nHZrGJz
X-Gm-Message-State: AOJu0Yxooxv+IWePMHtanL4OJcVq4wCOx0tIUvIzf6QS0nXH1yG/eJ0u
	kW76suCVQ+lE9U5kaoDNNN6/GwJ+hG38+HhUrwxot5SYWK6YkaF68jU6ghgNsqohePfiH3Dgb7Q
	eSA==
X-Google-Smtp-Source: AGHT+IFDY1i11uY+A1y4zwyNJKqKjSoVvn1P9MYoGw0JshSgaam3+Hf2ZL2FiASqjr3f1ToaCJzxJgmnnPU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8890:0:b0:6e3:6c21:5fd9 with SMTP id
 z16-20020aa78890000000b006e36c215fd9mr187512pfe.0.1708380245606; Mon, 19 Feb
 2024 14:04:05 -0800 (PST)
Date: Mon, 19 Feb 2024 14:04:04 -0800
In-Reply-To: <20240215152916.1158-19-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240215152916.1158-1-paul@xen.org> <20240215152916.1158-19-paul@xen.org>
Message-ID: <ZdPQVP7eejq3eFjc@google.com>
Subject: Re: [PATCH v13 18/21] KVM: x86/xen: don't block on pfncache locks in kvm_xen_set_evtchn_fast()
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 15, 2024, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> As described in [1] compiling with CONFIG_PROVE_RAW_LOCK_NESTING shows that
> kvm_xen_set_evtchn_fast() is blocking on pfncache locks in IRQ context.
> There is only actually blocking with PREEMPT_RT because the locks will
> turned into mutexes. There is no 'raw' version of rwlock_t that can be used
> to avoid that, so use read_trylock() and treat failure to lock the same as
> an invalid cache.
> 
> [1] https://lore.kernel.org/lkml/99771ef3a4966a01fefd3adbb2ba9c3a75f97cf2.camel@infradead.org/T/#mbd06e5a04534ce9c0ee94bd8f1e8d942b2d45bd6
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: x86@kernel.org
> 
> v13:
>  - Patch title change.
> 
> v11:
>  - Amended the commit comment.
> 
> v10:
>  - New in this version.
> ---
>  arch/x86/kvm/xen.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index 59073642c078..8650141b266e 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -1678,10 +1678,13 @@ static int set_shinfo_evtchn_pending(struct kvm_vcpu *vcpu, u32 port)
>  	unsigned long flags;
>  	int rc = -EWOULDBLOCK;
>  
> -	read_lock_irqsave(&gpc->lock, flags);
> -	if (!kvm_gpc_check(gpc, PAGE_SIZE))
> +	local_irq_save(flags);
> +	if (!read_trylock(&gpc->lock))
>  		goto out;

I am not comfortable applying this patch.  As shown by the need for the next patch
to optimize unrelated invalidations, switching to read_trylock() is more subtle
than it seems at first glance.  Specifically, there are no fairness guarantees.

I am not dead set against this change, but I don't want to put my SoB on what I
consider to be a hack.

I've zero objections if you can convince Paolo to take this directly, i.e. this
isn't a NAK.  I just don't want to take it through my tree.
