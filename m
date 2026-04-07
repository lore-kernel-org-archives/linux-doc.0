Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD237C903
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775595105; cv=pass; b=N1+x4fS5zP3fefW5rnOVIbQE66hfrrF2duy+Allfg3YVl/1RXuy7d/6tS7VNwcgLOkkAaUwe9vG4YWHmPJzHTbNTMmXqeAeWTI/8opjwFurPrQhR+tbvkbgvg060gmPuJugP1+gtqtNfmK6Ym5o2O+YV08BRNq7vV3N/MB6ULQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775595105; c=relaxed/simple;
	bh=UKFKl2K9g5nLNYroyFHhTqW1OKJRRkzZweDAzieN/TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEYgWSV/SbTJP1zJMZLw3p3bmjQTc4FOxXT5Tcw/4e9Q5fyDyZh5Z+0Sz+NDDqL4kiJlaA76qN55vX4KgqIb5L2/f7G9tpQ6jKJjwJOcN4kfZJhbuQahG2TOYrdHpaHKt1mYg7YMhvi0ScZcSNQLOgs56W09UtMIbK9BpqJRQ9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hXP0526t; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hXP0526t"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso1213a12.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 13:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775595102; cv=none;
        d=google.com; s=arc-20240605;
        b=gzbOt9Uy4eiphZk0JGYhRawQj+raAgN2DmaXAc2/QJppX5g3s+CgNdPUrftEzyz6UR
         N9illiSEummnn911xuIoqPbLIRyDDz4Bn8chTBChruj8YM45gmcXe9Zh6WZrrgval239
         3r2qXE14RI9MwlZqQk0NQbbxjmPcM68ZKj1pgF/u4eiXYlFrRE4WjxJrhtx2fiBBM+Rq
         NyzltzerHm3rVvTeOOYhhQJJzBoyaCa5fKV3OSevXoFDFnXVhgQ3FmgCadEyVSPupQEy
         mPEMUhUh89LGbdoB2MMfEvZaEZm/LrMFJvlwzfXAVR/NorX49lTtERA6k/KZuKpcvG11
         4gEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dd0gkp5i82XLUviXzsklqgxc4prB+yOLI4RE0RGdmk=;
        fh=cG7OuoC/bdsO6veMriiEyC+/pRpFvxXoygVk0+kvnyg=;
        b=Sna5bb0tach1uZd5hS/ORj+UakzH+McYdijksvVDowNjN8Jp0Z6MAmxN0IpCTEDZr7
         goZIEjXiLZ0bco1NHU2xpQ+fGeRB3NTSj9TLLh1x1fITHXaPfy9ihmWR4lOCcIZc37/Z
         hKYn9M2O1Dpt/tPzG35CVOwOC7j29ds9gV0i8eSl130KkajBvtGGf8FDmM8nYbBo3ivh
         ZCLTivINUqXfIaBPEYLmQBuWtvnqbnUVLLwSNnGLot8ZV9dEb1r3B+N/Wa3MGeDIU6e3
         vNCF9J3eBGI9VztjTHVZq/hw/o/PhKmm/zi/m8ZtLe6BsiuIT3dZmvyvYAq0OA4Ltkqy
         e0FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775595102; x=1776199902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dd0gkp5i82XLUviXzsklqgxc4prB+yOLI4RE0RGdmk=;
        b=hXP0526trW3C3w4WklAEDNcGPccrqGBJe+1c0pNp1RGOODgLAsdk3Vmj4Unf3Wn+Rq
         tM7vG+xbAKAtQ1q2nsBFZQcm7MulAtdPTRrB6/QSJnLt0TaL6OZtzWuf0rJ0ddq0tSE1
         PO6KSBPSGepW2xcOpOWzegRfe5weeM6XEkQfoU/XqkZLBPIjpsyTVwEy0VpDbl8J+0W4
         8+eSNZyEMB1WpCTlWdQSfURGfp+lpC/rBFmyjTPEMmx9xob0g2Kijhg120L2hqU8cZZb
         l5UnflRDVv6tomPCBDeGIa1rsw/jmPEyHHejTKTKUcq9CyK+AagLkA82lX4t109tBGD6
         oDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775595102; x=1776199902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dd0gkp5i82XLUviXzsklqgxc4prB+yOLI4RE0RGdmk=;
        b=qLW9YVw3+j6vOszOeTRqd+zU/UaS5DTQ6H56XGOhN87Fy12ZhsaQ4OlpPu51kBYgSX
         LfuXjL9Qi7GfvNYRbOWoybnp8THfJaIKhj8GWLaFG4YnWVCVUcQgKFDBPpZGpC1PTj4K
         4ly3irFQ+3NXvi9936I+GK9f9FpTOphd3NcCS1v+pg4eqQlB2UKI17zSBoYdbLxg3Xfq
         6+pBEkuuhNd5hktVAVIY1MVab8tTORezfqpKooEpw8qQSeNRURIXrM7FvnIO5k78jSeS
         c2kFAlaW0232ulAjbgSov/3rb7aJmVlW2dtzvCtE6xp0Z3a9ouMipT2gwW79uzkXhQkT
         nnYg==
X-Forwarded-Encrypted: i=1; AJvYcCUwJqXQ19gUycn6Y7QBCLpeX11eJz7dTf4SDJi+Sd5rIxAKleOdguG3jviG5bskJYIbBFrTOrI/ukU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGhyNoKwl1KMm8RmOexBa9bK6UT71jJlQ9tCqYsTkBHm7oKUe/
	oeFFy6XPIHGFXUy9Sq9mZxDiyelxTczy9RCyhypA/x4Iw9bJRCtHV04gH2NuFqqQGUrZLK+f3jL
	dHsBCQs5WVjHhJtvZGByW04BPc4YNmYwrT9n44Z4O
X-Gm-Gg: AeBDiesSXZdbC8zEj5QeodGbVCjzkPu/zd96ZSvmWQd0CUHtWTYTHoe6ys1qsGYLGXc
	ZQZ/nI44LacLqQy9BJMNKN1FX5L1zh1H4ilFy3eRCsLLSS+toS+A5SJEcntKM9dpA4gTtsOxZBL
	oI8Fb88YJeKQzawsDG8TX2V64UxmFnwn03pEDuC/XJYW6cLHXepSlZleIo96z46V4yk+DXFug9/
	fR913RT7nYxNMAF2x0Y6Rs0eNUPdE3T7ocCqwASxPaL4mPTOupZJ0LKrgCOI+StNANXqLsZfvG1
	9flYYtU=
X-Received: by 2002:aa7:cfca:0:b0:66b:ed69:a85c with SMTP id
 4fb4d7f45d1cf-66f9f2d5956mr111a12.7.1775595101713; Tue, 07 Apr 2026 13:51:41
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407190343.325299-1-jmattson@google.com> <20260407190343.325299-6-jmattson@google.com>
 <adVZ7-EiekghvDMD@google.com>
In-Reply-To: <adVZ7-EiekghvDMD@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Apr 2026 13:51:27 -0700
X-Gm-Features: AQROBzDnmmB-4MNzWe1dBvIEm3CwTAGcs8zn3JWqymGtmB5CgLW7VbbVHZEmPDU
Message-ID: <CALMp9eS+XiJ=u2618Hke9ePyzeTuChU=dLt+e=x2nXLTMVH5mw@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: nSVM: Redirect IA32_PAT accesses to either hPAT
 or gPAT
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 12:24=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Apr 07, 2026, Jim Mattson wrote:
> > When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and the vCPU is in
> > guest mode with nested NPT enabled, guest accesses to IA32_PAT are
> > redirected to the gPAT register, which is stored in VMCB02's g_pat fiel=
d.
> >
> > Non-guest accesses (e.g. from userspace) to IA32_PAT are always redirec=
ted
> > to hPAT, which is stored in vcpu->arch.pat.
> >
> > Directing host-initiated accesses to hPAT ensures that KVM_GET/SET_MSRS=
 and
> > KVM_GET/SET_NESTED_STATE are independent of each other and can be order=
ed
> > arbitrarily during save and restore. gPAT is saved and restored separat=
ely
> > via KVM_GET/SET_NESTED_STATE.
> >
> > Use WARN_ON_ONCE to flag any host-initiated accesses originating from K=
VM
> > itself rather than userspace.
> >
> > Use pr_warn_once to flag any use of the common MSR-handling code (now
> > shared by VMX and TDX) for IA32_PAT by a vCPU that is SVM-capable.
>
> Changelog is stale, but otherwise this LGTM.  I'll fixup the changelog wh=
en
> applying (in a few weeks).

Oh, crud. This was supposed to be 5/8, but I made some changes after
checkpatch.pl complained and then tried to just regenerate this one,
but I totally flubbed it.
