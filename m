Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A4A2673B7
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767889216; cv=pass; b=c8aYPybRiJ7EkovMNKqodRpYBJEm34KxoKfiuO6XtnBy00yYBVpxjhMgWFvl75vL6FaxHya2e+hl3xkY7LXRbLRn1ozKVBbFmC6sLRTXEgqT2D/Hxt8OmBe5ql2cCbZElRjVlNrwd9B8TZV5aG7i52vKSB1wIZAK1WhuM4jxXJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767889216; c=relaxed/simple;
	bh=PQslf1nBWkAECYlPx7V6ROJBsVJ/orbrweZgGpC4pu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSoPEDfbRqKrGXiQcziQsun3BqK79mmePPxtpXFdHh4GXebx4dBW33fX5sUY5Puqcb0G1nbSi4O3+hhWqa2HiKPRWWSD5yiGBe1FPMlsGNrwCp4zYvGJck4GmD0/MZv9MVR73XgWJRn5UTntJMPyu6xXybYyjhp1ItePVWoro84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUCD2KUW; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUCD2KUW"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ffbaaafac4so823981cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767889212; cv=none;
        d=google.com; s=arc-20240605;
        b=hsWpV8UUlN8IpK8+fKZqVKEM4YDGsmM7023JNoBDEIUsaNZxiWyRh4EoUbKu1/n3mR
         P4KZdFfMHGogNsxSb6326Y4O9kejJD04t3RWfQi8yiP/DH5m1xlWV4fxXkSz2R9FbTVm
         NkG8UOafWwESDvS9V6AdIsQmOYVl1bTc0NtnEEOqkVsrzkYHqow43Dq4SWrz65rmstPJ
         nRwSp5TtbhS8X//lHSr/Bm1D1PzKFH+WEaShHdsCvkZ+pDkodYJmCUzCDgUpF+mGu8fw
         zBIjNx2BeEv1BnMgLN6hGj8lWa6N592GWju/rOGQ7ilYw3YCaOQtYXER+u+C1vNUNitZ
         WYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vwmKkVXSip/S40O81aRXL9QdzJwbud5lWPyLOxwiQv8=;
        fh=XYqcsYIR9m7fonFNJToQqgNMalu9l7614uPerbHhn/0=;
        b=NB2JEmP3mm2WVdm+aiU287y+8tNNniBi2kw/miDaRuVnfZa+lvtoAKAppHRA0RyJkz
         qxTw+VvFBaqEJeBEO8x3P3U50FRIHSlTj1+/dHJXF3TgG75paHtIStoqtC6oDhfS189F
         bcO9OFOyFfZDW+fSk0NisHS7kAQ95YiyuEoL18F83jSUtqyVCBzNpxmZNosQCWBQmmk9
         Z7cdLbmP+lmMrn02AgWTuZdIJRqPnIHMlZrXsLlNmUff2JMgJjaiTUD50vyfbUmZaySV
         V4+C15H/KhqPUgullEeQ/krFx6IzrXittnAjfat4perXSl3f3stgJ5wJ3sMD/dZWuTAA
         3Zmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767889212; x=1768494012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmKkVXSip/S40O81aRXL9QdzJwbud5lWPyLOxwiQv8=;
        b=YUCD2KUWQ4gi3ViEKGVqn8QQurG0EaBKakVjCsHQRFz9y+LnNHgek/2bI8KUQmufbK
         vWn4NH62pDYycrDT6R+DscBEBkwNG82FHoJIT3WNWMQwKWmXDx7VPPIu+NE8L+BKJJO4
         mtB/nZUZ5L9wjpV+pDntfH/g7w4C+h9rVfGbeorDaq4bQ5F3M2AyCEvLiX/fP/o9IkmJ
         xK2fQ0Q8TUi5C+PaX5eSnUR6ssKmgHuCKSYLm1XAnjn51ld1MPK2M6Ra2DUt1+wMFstN
         gyfgZbPrfrGwyHNHRRR4kl6EF/3G64Ol6b/gaQJgKNBk07tChniQWXXFW/+8Nus7j3zM
         vtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889212; x=1768494012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwmKkVXSip/S40O81aRXL9QdzJwbud5lWPyLOxwiQv8=;
        b=Y/+qZ8Hc29G/w1Hq9wwrIIRgEdNFgOdVHcSqEa/6wem+SDQHAfi7JfKhww0edkZplp
         gdLpxBQj3j0/35zWhPw2EWIsjbkJ6j8sqK9MzalbCHvaizlNyE4qonpT4J6UcKRL10Ay
         jZs6zFTsltqBs5k6mp22xsgOFgNqtpWtBzrTXvpVXPvB8lxNx2RbaeNcRPBz/a7EcJ2I
         W7FpMFaF2HbTqPvJVV5+pX0UxOgRCmRbUnLGZxJUI8PUejK0zqn/k9VB/p7QF1iDJGWF
         GtvIlzoGY2bZL2i3QqYpGpILUtmTQoRjlXKboHk5/j3JhwDVktZpkQmVkDTkmKp39psD
         8dag==
X-Forwarded-Encrypted: i=1; AJvYcCUcKhpj24ucf1DBZlcjIEeF/9AZ7rdsZJw5xNna6rSkLvafT2ihLsqebleiujmoi9QI7jm9YGhV92s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEw2AakbgReJKBoT5gWJnSrTeRR9MtW6szz2WAItJ0jjZxmI9g
	z78Ox+vsTjz7PQsS1Lfu+0frdCO/NzydcQ8oYE6gUw9xlJeQhHiPL7KiqPypgFlyLLQr5EeSuLu
	C8xmmlT4GK0f4y4x73/RMtU/k8ETAYFQk2QC1W9sl
X-Gm-Gg: AY/fxX7IuAowjwCJEa1EEOQCfnXk3rLT05lGjSRfKFz/SezrJ8iz07DzwAYgMfE0iPK
	3ZZJZFu+N8i9gUmpj/v+qe0tPN79j25pptwj2KLJQPqQb51ty6ncdL92QP0PFpcNoVHXo5u6zJh
	NUtYp7gdneVkxy7XAknySX5pkxmmENLQTUTCTwU51FRs8NtR0EooURqFdWOPjaLta5xZZ3uX7H/
	3EZojQFpuGfBNk8/Hx0j/EPF20F/GLZYp/qGfVWwZnQJjMuyxwCfnhSzzs9xxrl3LZkb0xgkWD4
	NM+EMo8=
X-Received: by 2002:ac8:6a1a:0:b0:4ff:c103:49f1 with SMTP id
 d75a77b69052e-4ffc1034cd3mr7852131cf.6.1767889212251; Thu, 08 Jan 2026
 08:20:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org> <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
 <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk> <CA+EHjTxLkLjPj=1vwDqROXOUXi2LhOQb90WP6dFaTiYG1nWovA@mail.gmail.com>
 <e50b4923-ee45-43de-9d4e-344546c635bb@sirena.org.uk>
In-Reply-To: <e50b4923-ee45-43de-9d4e-344546c635bb@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 16:19:34 +0000
X-Gm-Features: AQt7F2qnUAAJolhK9_-R6BxIXN3MEwPRzr3Wsfe1tbgWe2D8WrIhfrxwTrYHhW4
Message-ID: <CA+EHjTybF+aq2b2vhcEqi6U_sJjtt7ngzMZ9UcJ15G-Kqj=A9A@mail.gmail.com>
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

On Thu, 8 Jan 2026 at 15:57, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jan 08, 2026 at 02:09:34PM +0000, Fuad Tabba wrote:
> > On Thu, 8 Jan 2026 at 11:54, Mark Brown <broonie@kernel.org> wrote:
> > > On Wed, Jan 07, 2026 at 07:25:04PM +0000, Fuad Tabba wrote:
> > > > On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> > > > Should we also preserve the remaining old bits from SMCR_EL1, i.e.,
> > > > copy over the bits that aren't
> > > > SMCR_ELx_LEN_MASK|SMCR_ELx_FA64|SMCR_ELx_EZT0? For now they are RES0,
> > > > but that could change.
>
> > > My thinking here is that any new bits are almost certainly going to need
> > > explicit support (like with the addition of ZT0) and that copying them
> > > forward without understanding is more likely to lead to a bug like
> > > exposing state we didn't mean to than clearing them will.
>
> > I understand the 'secure by default' intent for enable bits, but I'm
> > concerned that this implementation changes the current behavior of the
> > host kernel, which isn't mentioned in the commit message. Previously,
> > both the feature enablement code (cpu_enable_fa64) and the vector
> > length setting code (sme_set_vq/write_vl) performed a RMW, preserving
> > existing bits in SMCR_EL1. This new macro zeroes out any bits not
> > explicitly tracked here.
>
> The behaviour is unchanged since we're always choosing the same value in
> the end, it's just a question of rearranging when do it which is the
> explicit goal of the change.  There won't be a change in behaviour until
> later on in the series when we start potentially choosing other settings
> for KVM guests.
>
> > In terms of copying them over, if they were set from the beginning,
> > doesn't that mean that that explicit support was already added?
>
> That's a bit circular, with the new interface if someone updates the
> kernel to set some new bits they're going to have to update this code as
> part of that.  A part of the goal here is to make it harder to make a
> mistake with remembering what needs to be updatd when.

Fair point. If the intent is to enforce a strict known state and force
updates here when new features are added, that makes sense.

Would it be worth adding a comment above the macro noting this
difference from sve_cond_update_zcr_vq()? Something along the lines of
'Intentionally overwrites to ensure strict control of enable bits', to
save future readers from getting confused...

Thanks,
/fuad
