Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9E480348
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881414; cv=pass; b=T7+Y/Pk6cDqxrME4LGX4T9OOO6Yxx9h4XPxo3VE2jGu8U/dAJY3Xl0fbCL7APRoRH4wqcQd4dB4FbgUIqolAsfPNIjjupxuE8ovo7D3vIuCQ+P3ViMqBr5909d2KWjVpIIHRzD3AzKKD6saTI/GTHnoRM0Lzw6eB7W+0w322Y60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881414; c=relaxed/simple;
	bh=YkKdPv86ApMrpTeTFnhz+IcSUQLsILOLPvJQz1PDFUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1tVOtfMy/apC0Qm+iuCeXOGyG7G9KeeJ7DZnxEXe5QBZCQ77HxaWxd1pn+EfCLoFdICiSzd/hPuh2s9I5r2SnTZ6d+Erxrs4LWmHfFI0C7sz39CN2+qVKic+R8L2uh/CY3Iq53+iYIEqKuUZGK1CECn6BEVMg8uBf45t9NIN8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rsWPBEQz; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rsWPBEQz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4edb8d6e98aso1158191cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881412; cv=none;
        d=google.com; s=arc-20240605;
        b=cyS4wbcugs0oYVfBhowDOwuBCNXJTJIG+xnkROZUw9Joh5zxjzFfUBcUHRw4ZGum2t
         V0r6Z43OczBMnD9znUtqkeRWDzc3CIwpAPDXPl9MnN3hfkdBAAg3U68KadopSetkIXC+
         6KfbprJeVeJVX87ggQpHk8+V8usWOdNMU/YpISPpcfoNBsFb/AgSKqDs0QVDUHzRweJc
         K/eS/NsOxeLulTWsHWfFFkeah9kwK+SQUGPSwt3LJsn/FlS0PIaTYmXcWeoIB5qGN+Jp
         iBs0F0lhTLIYJyZ0f1GfQrWc6zkCVLGKxUJMtwCKfiJN1ROEugAJZwCOcfPtaAos2shd
         oUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TGOhyPqsKhZPttb5gff3fg7ZFzXcVrSNwuwgJbbCpXM=;
        fh=mJmh2XgXYy6dLj/cHk5SvzexzpLzH4eKcP8JoRfkSzg=;
        b=KM0V5i/KyBm1SMbNRtbyWzs7pHm8rGfr6RDDOPKLLIQAN174XNDg0EsLkjQhqqcDyv
         ob+3dzMSq1IRMlxaHqZ6PjvJnxVlGhaA5wS+4+np2BgLBndm514E75iULgtbMe9ja4eO
         EZAK1HdneD7CRwdxruQ/JLDxUWvFTu4tnRUwgUExaG6/+Te5rzTMBnZ+MuZ2mG39rZ2d
         FWs4rLYuZYUMV30M3ijc+McGOHZYvVaqwOeiwBl8ePR37wGnCLFtB6/U+6DoBh1+02jD
         mUbdnUzjCNeEYPiPQKeJz/PWReotraaMurh/nSaTa9ODy5qZyalr8eUWzZ03hgTQkKRM
         Bu1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881412; x=1768486212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TGOhyPqsKhZPttb5gff3fg7ZFzXcVrSNwuwgJbbCpXM=;
        b=rsWPBEQzuQJbgZEbw2nJsvobXYIHLtcO4RUGusmhN6ZDpRkLIPqahbk/bTpyP+Jho1
         lpbfoA3x/ncOtqH27SXwPpc0kK4z4IHdNaFMsiqEYSS6hBgmPH8y/oTM4VOJYDUzDGkH
         rEHzHscGp36krQPVFgVJTEUAjHx1WcYrXwXa22ySvBikC7e1jVBz54NZxeIxLPGqQBJw
         j8m/1OSxudnIeDUbRmFoK+3q13mBujuB4Z0gxWF8knE9krMKgfj1RZd/ZEJJ9qEXwPtW
         Hqz0jJxk/IZsklTICh5+9jCcUjHKPyb/wsqCsXSbxaWaUMephbw40SgwK2//b4ynCOgf
         65wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881412; x=1768486212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGOhyPqsKhZPttb5gff3fg7ZFzXcVrSNwuwgJbbCpXM=;
        b=EssWwwLEJ9n5/dHSoJzdD9WURCdmW7h8xsO0GJ5d4Oty5Qk9+g/2sW0qWrE1KIzMEj
         7JXeU7rYjyB7DWabRwxgjwXOWEjFJK8NvkVLNQPRzuTh/yEG+XtvY5UC52s/aP7b4aZV
         wAaW5jAuJAyK3ciJL93cC8GemDMU57po/9AqfvoLIwI7FFO/aObq8EkuJG54hGqZ9Di5
         if58/IgwKJB/s3NmFNsXDy9vTzR2U1wUf3hQ8tTbhjR5xdPgZ7WoSy7pQNGC+Zhy6wOF
         5TxHU2hJ6QBdcT49bunC+ZNKnGG0M3xRMy1yaonEH9h4XuUSis4fRuGrZd7e6iqnEOTx
         CxKw==
X-Forwarded-Encrypted: i=1; AJvYcCVITc4+tbzw3TCMDz3VXM+PdZN2WXzre84WudRlesobKJQ7eEhHIlUQnLAaeQU4LDZ3EATEJl9SbQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CSPTtptSscAvQwO2Hq+lgH46RooQ05kD1che0NdeA43gMnZD
	K5Be7dJgSEVpPVpe7vtqkxIX5/Huge/NvuN9KfmQe4PGnV+gFavS5JyIh6bmx0Uq6bAfRH35ryg
	lpdUGVzxZ0aYty7kf0Rtotmg5vRqje3Bcxf9HVz4D
X-Gm-Gg: AY/fxX5O5osv2OtvkggOvnhISgrN9SFYR1AwaekvrZW2Gu3yocuJh7QuVs1QNscl/t8
	wI4aa6BKeomyTlTB5wKCSyIrmBx7vkf8f677TGh7xUtH0XWznyiOuqC4tdgfLwMvOiO4vVHO7EN
	nLDKwlBtpJaBvLR1+9Z3kl2ZS8MY2bMl+MUZPyX80SGgte27fvFQFlWOPsvT7mPpTPfRzd6YjtK
	J6ONrs7T/58/TCBk5OwCa+ZQDtTJ0/qPpY/PV5nLasBURLh2N+BY+A9qnjE4EPF5Q24PAFa
X-Received: by 2002:ac8:7d45:0:b0:4f3:7b37:81b with SMTP id
 d75a77b69052e-4ffc0a80347mr7952831cf.18.1767881411175; Thu, 08 Jan 2026
 06:10:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org> <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
 <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk>
In-Reply-To: <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:34 +0000
X-Gm-Features: AQt7F2rujxIGY5_NcyYbFMLNUJyJwV68zqszeu4LHx3dTWaBmmJ-A6j-sa3_670
Message-ID: <CA+EHjTxLkLjPj=1vwDqROXOUXi2LhOQb90WP6dFaTiYG1nWovA@mail.gmail.com>
Subject: Re: [PATCH v9 02/30] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 11:54, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jan 07, 2026 at 07:25:04PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> > > +#define sme_cond_update_smcr(vl, fa64, zt0, reg)               \
> > > +       do {                                                    \
> > > +               u64 __old = read_sysreg_s((reg));               \
> > > +               u64 __new = vl;                                 \
> > > +               if (fa64)                       \
> > > +                       __new |= SMCR_ELx_FA64;                 \
> > > +               if (zt0)                                        \
> > > +                       __new |= SMCR_ELx_EZT0;                 \
> > > +               if (__old != __new)                             \
> > > +                       write_sysreg_s(__new, (reg));           \
> > > +       } while (0)
> > > +
>
> > Should we cap the VL based on SMCR_ELx_LEN_MASK (as we do in
> > sve_cond_update_zcr_vq())?
>
> Yes, although I fear if we've got to the point where we've ever got a
> bigger value going in we're going to have bigger problems.

Yeah, but I think that we should be consistent with the SVE case, at
the very least, not to confuse the next person (e.g., future me) who
might look at the two and wonder why they are different.

> > Should we also preserve the remaining old bits from SMCR_EL1, i.e.,
> > copy over the bits that aren't
> > SMCR_ELx_LEN_MASK|SMCR_ELx_FA64|SMCR_ELx_EZT0? For now they are RES0,
> > but that could change.
>
> My thinking here is that any new bits are almost certainly going to need
> explicit support (like with the addition of ZT0) and that copying them
> forward without understanding is more likely to lead to a bug like
> exposing state we didn't mean to than clearing them will.

I understand the 'secure by default' intent for enable bits, but I'm
concerned that this implementation changes the current behavior of the
host kernel, which isn't mentioned in the commit message. Previously,
both the feature enablement code (cpu_enable_fa64) and the vector
length setting code (sme_set_vq/write_vl) performed a RMW, preserving
existing bits in SMCR_EL1. This new macro zeroes out any bits not
explicitly tracked here.

In terms of copying them over, if they were set from the beginning,
doesn't that mean that that explicit support was already added?

Cheers,
/fuad
