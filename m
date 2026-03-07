Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E58D63CB
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 02:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772849732; cv=none; b=ZevVbS1k6y2xZ7i4Kf4u65k9qO0ozp55skdMQ3ld/3ERTObkperoRJb+7EdayhKPsF+jU6Zb3kCB1ltdCZtI8WK1AZJjVt3hp1WqnwBh1qLK/9U2shK2EoQAZBnPh6y5tyh+UAhIwTHlVSv5m7e022QfuDtwDEG+TmAWegIKgtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772849732; c=relaxed/simple;
	bh=uXG19vgyqc0vRsqQoQGiphZhjsSOgse8qk3/8sYdk4Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CsVeZj5IPqrRhywhTXLOGTmdJpTRd3JTKiwXCDCnupacBvHG+IylqLcfaulwFFi5wqWxtMkX3AMkwPRTGGHuKAMBmjpS7zcZUrph3y8YZKn94tGW99EJgv4w4vmatYZoEQZjeeCoNXbg4krD7RoH+ErkfdXmgKw7ZlZetVF/V9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r80h1+Z9; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r80h1+Z9"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae5031c6b1so56004625ad.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 18:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772849731; x=1773454531; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpHs4vUYCe8FUMxp12xFtu/nT5nIlsGpqATm6Mj9k5U=;
        b=r80h1+Z9+s2t65aoHNhpqg75Ql64gn5SNeuHov736rWVkSUIGBS8X8Gts1mbcxknsn
         tSrMJ7Hy+opny4bwleSM4a555ir1HR/CMFl47eZGFOsCFieTHlp2jAXQibikhpvfcyv6
         1a2uzpqOA8rwuSv3CDyoKkdmkqMrN5CXv4GoDU5fIw6GFdgq+7I4QrUV8A7npF293Vbh
         TtZn44HDdDh8sku/s29GZSHVxgpkjRpIaVYMQ7myAAe/OF4gJNCGbE8xCKYL0ljNbLjz
         WQNKjMLrjX0CwGgnSyeNkAEyZFeQV1Rq2E1IGtyLzfe7erq/4Id+utrnHbd1iyeYk+0I
         895A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772849731; x=1773454531;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hpHs4vUYCe8FUMxp12xFtu/nT5nIlsGpqATm6Mj9k5U=;
        b=P9vDyHYdchRegIRNPPRoQ1eDiwWKHxlK297tFz4K7lOGyCFkh7r0ygMWHpI/Yl+VKU
         txh63m2y55lzm/OCGHGhxOCJhfSS0fjlHTOH7Ovx1892dVFb2850bUMhJ6XdzOBsThPk
         6gD5WyqFWmcuoROcR7gNb38EN03Uuw6bEpjREK1owPI+/gK9IHXnQ0j4z7QZFhWuWoFo
         35IrbhMr05KwnRL0VnEwcufmW+9QzuuZsWGhrfkG+8mmmklnUIvBr1+B/2qbw+fRXObH
         q5M4Yr2g9ePlvKHKCYyNypuME2MIg4xJIjl39p7FOXIM2iliHFXuqyTlQyf+bzOqE5cR
         CGiw==
X-Forwarded-Encrypted: i=1; AJvYcCU7HTJV+1BXLj6ttzNy382KcBzPBJ7A85z26cPwelPYhkJL6yboUDbNVm2cMV93Jor11rT4DjWSaA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcYQP6U5tl3LayAyYXx/gpQrCLimu0WbfEaFLmzCt7tag9KG1Z
	J1UKvYPvYSFLACeISwkGrpNC58sNUwBxluzw0KbFho8Of4/f0OHXRBjotL1EdrHIZpqLp/n5hTq
	P1OHTkQ==
X-Received: from plbmj3.prod.google.com ([2002:a17:903:2b83:b0:2ae:3e55:f044])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef10:b0:2aa:d671:e613
 with SMTP id d9443c01a7336-2ae8245165cmr48752275ad.38.1772849730693; Fri, 06
 Mar 2026 18:15:30 -0800 (PST)
Date: Fri, 6 Mar 2026 18:15:29 -0800
In-Reply-To: <20250829153149.2871901-17-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250829153149.2871901-1-xin@zytor.com> <20250829153149.2871901-17-xin@zytor.com>
Message-ID: <aauKQSACQXFYvCCH@google.com>
Subject: Re: [PATCH v7 16/21] KVM: x86: Advertise support for FRED
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 29, 2025, Xin Li (Intel) wrote:
> From: Xin Li <xin3.li@intel.com>
> 
> Advertise support for FRED to userspace after changes required to enable
> FRED in a KVM guest are in place.

Mostly a note to myself, if VMX and SVM land separately, we need to do the same
thing we did for CET and explicitly clear FRED in svm_set_cpu_caps().  But ideally
this would just be the last patch after both VMX and SVM support are in place.

> Signed-off-by: Xin Li <xin3.li@intel.com>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Tested-by: Xuelian Guo <xuelian.guo@intel.com>
> ---
> 
> Change in v5:
> * Don't advertise FRED/LKGS together, LKGS can be advertised as an
>   independent feature (Sean).
> * Add TB from Xuelian Guo.
> ---
>  arch/x86/kvm/cpuid.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index ee05b876c656..1f15aad02c68 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -994,6 +994,7 @@ void kvm_set_cpu_caps(void)
>  		F(FSRS),
>  		F(FSRC),
>  		F(WRMSRNS),
> +		X86_64_F(FRED),
>  		X86_64_F(LKGS),
>  		F(AMX_FP16),
>  		F(AVX_IFMA),
> -- 
> 2.51.0
> 
