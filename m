Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F827248F47
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764619100; cv=none; b=rQRipVSNUdg5P+5k5TdW1EE/wb+4+Bt5Sm2SLJ3R21VUh7axxLqPP8ittkIIUzrkfc9z+v/66C6nbd2TH9DFuoK7ECPF6RX9hFy1mbak8jy8j7Y47Pb+tm+JXusk9Yt/ZKNwKg9NqsGUKZoHtGGzIGLXOwJyAjQL1o2kZSb83a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764619100; c=relaxed/simple;
	bh=RvhQJ/RxnP8LMHIO2HlRZ/Evc3IhzrJOD7HOCowMNBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn4uoWOKoUctyPTuiGLD7m+YjIJvrdOVHxEW63qmVzAuCWW/qrYj3bnxyqDqDIIsPrxawEcgD5YeUVXTUiLPmqm4vi/FN3/QoEDHQEeQtCq5GUd6pI4zVTHEV++fJcofMkYhFU5FfMXo+WEEgM33NpkjHepnCo/AFoMt24h9OQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jC+WLgz/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jC+WLgz/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7370698a8eso447911466b.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 11:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764619097; x=1765223897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9NAUitM+MSWweUnE61BNoObWF/ar0jw0l8Av+72afE4=;
        b=jC+WLgz/NKVIWkZSxDLR12ri66xd3Kr+C9viCTNrImUa/bbj0MoDDpVUhE3RANmVCK
         gRWi1E1YO7uWZRkP9oANvxfBmTJAoj54ZwavIjC5bZVhNdhg7SSJeZRznwHxedWs7qZ/
         S269gcspefuhac2OTEd92rEZRpowhwBdh/Kj4HaQtkAQioa6fZPDdbL0bjfO9qnCa4dn
         GblfSvklyk/Ed2Vrby7qX2PCjYClxbNo68+RfociQn56AcaAUiWqWRJu753GAFNjhMdT
         VsJ1245dX9RHbMYU6TkGL2s/tlPczfUXRe2LSzuF9djPqW3mxkmgiRpO5IvQlzuYmkIQ
         hkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764619097; x=1765223897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NAUitM+MSWweUnE61BNoObWF/ar0jw0l8Av+72afE4=;
        b=T+EHYvFYGkjUw0c425vvvBlP3gAaHyuFuivmIhT7cPQoUGtzXpXSaBu6ukyw8g8OWA
         l2xheEnmqgTYptT2/iobv6owMrC54gqQU6n2FIysL0aFFCecJgYQypESknorIANvObEy
         bJa3It8SKhs8WGEwlPE6riJhOTFVFxk8qAi6WOFoB8vkK/QW9kuNBRkrKAyZW2vJLDb/
         GmPfGBmjWzGssmKdOAEPHqKWOAFdX++J7p9qI7/xo4VuN0dkM5Tacj3cbgivX5Bc06NF
         8P07N2wINnbRZudGvlvasWBisUy8j39798/l2/9zJsd6egZbPaSK3kbVneUCDQnI+64s
         G+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVV90eY0/2lWZO2K/HfYKtdZeelm9AIotWdTxVHEAdPfI53UwUkWYJSFNIRMox9QRmllOb1xMEEUzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc8UarIQYMTtrxpa49wvcFCcLQHKqS8kPw4/59rGTPKuT6H8PG
	CMp6nKGRY0PpxOa8/HIf45kCjgAruwSTBTLicPsKWxJKatcrrmocqOJ8aQUCqNAwQg==
X-Gm-Gg: ASbGncu/f4EegHHbe2FYYAcMX+kYcdYdWQhvSU9ZYvx8+QsYjjZqG3m6hjthmsu05T8
	3oGP6PZJhvUI0a/T53QKC7+XuC5iyX6tgxcPL5EGTJadRTrPKsJVqhzVFOWWvZNL51du8iSJJRo
	gAV4XJo46jiwFqu81WQFgTsvBMjY9yMkrEJDjJq/rEWZ6t1HpnnSgjlmmOqkjRHasxePagRcK8M
	/g+aE8cI0qKISmxOjblnXM5lGS2oV2scNGLmutPp2p+UW2mJuvJo1bG+jq9yJyeJsNDeU+FMO6F
	reN8kE6lGK9YgLsRIlc/QMPYsKIu7/FR712lzXUw0WwnBI2eozD+i0DtI0l91TVx4zGYkeZ/Mbg
	Zhxb515bn5UniYz2+ybtUv52QZp1jMPDxbWUZhdJ8nMbHDyuRmhbcHfaPz8yo+z/CGqchrXzbZM
	Ufnjq2b0Ys/RrtMaJu4otFAUilN0fBu1xN7WCugJ+Jx2Tbdcxz9NdTRA==
X-Google-Smtp-Source: AGHT+IH2zdDJmxuV1Kx70hy1xujwpWhYPpBA15ctZSpVUkxE7sUPJ7uI1HDSh04+fVoYPr2+q+18ZA==
X-Received: by 2002:a17:907:6d13:b0:b77:18a0:3c8b with SMTP id a640c23a62f3a-b7718a03cd2mr1349980566b.1.1764619096714;
        Mon, 01 Dec 2025 11:58:16 -0800 (PST)
Received: from google.com (214.44.34.34.bc.googleusercontent.com. [34.34.44.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519d883sm1298814466b.17.2025.12.01.11.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 11:58:16 -0800 (PST)
Date: Mon, 1 Dec 2025 19:58:13 +0000
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Prevent FWD_TO_USER of SMCCC to pKVM
Message-ID: <oim4q3obyy7jh2juw2qngl4xti6hjg6pavfnm3u3fppa4ao6dq@x7sanj32ttsi>
References: <20251201-smccc-filter-v1-1-b4831416f8a3@google.com>
 <86ms42ox67.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ms42ox67.wl-maz@kernel.org>

Hi Marc,

Thanks for your quick review!

On Mon, Dec 01, 2025 at 06:48:48PM +0000, Marc Zyngier wrote:
> On Mon, 01 Dec 2025 18:19:52 +0000,
> "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com> wrote:
> > 
> > With protected VMs, forwarding guest HVC/SMCs happens at two interfaces:
> > 
> >      pKVM [EL2] <--> KVM [EL1] <--> VMM [EL0]
> > 
> > so it might be possible for EL0 to successfully register with EL1 to
> > handle guest SMCCC calls but never see the KVM_EXIT_HYPERCALL, even if
> > the calls are properly issued by the guest, due to EL2 handling them so
> > that (host) EL1 never gets a chance to exit to EL0.
> > 
> > Instead, avoid that confusing situation and make userspace fail early by
> > disallowing KVM_ARM_VM_SMCCC_FILTER-ing calls from protected guests in
> > the KVM FID range (which pKVM re-uses).
> > 
> > DEN0028 defines 65536 "Vendor Specific Hypervisor Service Calls":
> > 
> > - the first ARM_SMCCC_KVM_NUM_FUNCS (128) can be custom-defined
> > - the following 3 are currently standardized
> > - the rest is "reserved for future expansion"
> > 
> > so reserve them all, like commit 821d935c87bc ("KVM: arm64: Introduce
> > support for userspace SMCCC filtering") with the Arm Architecture Calls.
> 
> I don't think preventing all hypercalls from reaching userspace is
> acceptable from an API perspective. For example, it is highly expected
> that the hypercall that exposes the various MIDR/REVIDR/AIDR that the
> guest can be expected to run on is handled in userspace.
> 
> Given that this hypercall is critical to the correct behaviour of a
> guest in an asymmetric system, you can't really forbid it. If you
> don't want it, that's fine -- don't implement it in your VMM.
> 
> But I fully expect pKVM to inherit the existing APIs by virtue of
> being a KVM backend.
> 
> > Alternatively, we could have only reserved the ARM_SMCCC_KVM_NUM_FUNCS
> > (or even a subset of it) and the "Call UID Query" but that would have
> > risked future conflicts between that uAPI and an extension of the SMCCC
> > or of the pKVM ABI.
> 
> I disagree. The only ones you can legitimately block are the ones that
> are earmarked for pKVM itself (2-63), and only these. Everything else
> should make it to userspace if the guest and the VMM agree to do so.

Sounds good, I'll limit v2 to these FIDs and the "Call UID Query" (unavoidable).

> 
> This is part of the KVM ABI, and pKVM should be fixed.

I agree. In particular on not restricting {S,G}ET_ONE_REG to a point where the
KVM uAPI for SMCCC filtering can't be supported, as some experimental Linux
forks might [1] have done! I couldn't find the corresponding patches on LKML to
contribute this feedback to, so something to keep in mind when they come in :)

[1]: https://r.android.com/q/I1c7bc93ebe0bfb597cca5c4284ceb7fd53e4713c

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks!

-- 
Pierre
