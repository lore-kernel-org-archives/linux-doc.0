Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04330E858
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 20:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727741; cv=pass; b=D6hiqFhTbuwICj3rVci2p/oo8OyliZaZuxLQSZ49MJi4eLswyIS1SMRIyOiF3DB2BWMlbbCyaP/XtUr4gxwrSnILogdPzftw0oHAxsgNMisfkEeDbHiqVGKD9v3F458S1JCym+kyMOp3SAMh/rsiB+SjsCTm43dNF9+k+Z1tki4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727741; c=relaxed/simple;
	bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/DktgWgvN5c0b1ELOvvgFE9+l0sx9CRRnOyBq6pq7+vBPmFER+febIysHQcESBXiDS9BrDSetUW0ey/OY1sCcJjyigocnQtvXxSMKZbLkolmiyZFzy1QpsO0Ulw4uktQTTu/h6n5bxIlwpk37qL0iAZxQ+3TmDR8HRNrWTm210=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZk5KDXz; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZk5KDXz"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a2e9851ed7so26930401fa.0
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 13:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727738; cv=none;
        d=google.com; s=arc-20260327;
        b=aFvKIZ8t1CxqiyBIDl2ZVan0VgVL8caXpHjpPIvZcoqHs9ezL76s+21MXyIlmxy2Pz
         S6Ao+zPcksF9E42M/oEVnQGZOj9sTBLv19hw3qQVnbmMMaX0kPORLQeLKekX0TQTvo5J
         yLve6uQmjjaW9AnWMrs49kMWDKIyu4Em7zMVMtxLPHhzZgpmPz5PocNrLAjKlKpL6RAt
         JBsrfzGwTCC7zmJyCTQz3gjpLLe1v6lAz5EnePbZ/LlLKlyQgWbBi6r2s+AKUXXnaPmF
         SR6tZjogTUPC5NFGgigIVQQAGPohS57w/g5zDe6SLC568m6BbdoNhhqOlfYykwJ9PmpR
         Urjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        fh=+puaS1sqXc+67B4bQDmvpRkd0+RdztoKWzcUInSX630=;
        b=WhmRAE5/XBrN7bKxVCrqzS6F0xmX40Y+vdmqsR8L+uSw7iH7eNg4uqcl7nMPffBUee
         6+RIdShb7PENbXpkWpgGY0kAUjZI572pzLpbc/8dRQVKqAgTHFZs78rMphFfayVfUmgC
         4d4DEoJINuaSV0YzTbdD4E03+4YW1Eva0kp8x+KO3sJWqlJMHVXwkBi1UjhqbZOktEJZ
         TtjhulCcWljNxEMAVBE8jfNo2SUsZmSMWbZT/44avAE4sW+hpuU4Qe+kYvloEZFX4DxU
         y/hU7yekYZdZ32skEVRrPhBXRxswO3E/nzapqDH4Rfhj2N41cgnijVcsRdi9cFpTmZ5N
         dBiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727738; x=1789332538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        b=cZk5KDXzUETzj8RP8JTI9IkiZEty11Uz/+7XcIxIdfsEdrw4wen89Gvqxcjc26irGP
         Fon3+vr1MngpXMTwXeyjEcQ/OIjz/vDjLR4EvT0P01TeWgBxnT5Vw8YMqu4W0H/jhdvQ
         NxR581SALe6XyO0zhxuz4HJsnq684Pa3R8coRqaEntbIVbOsW3iGgpACx9bWFpW7sGSA
         tm8x5uY55U6S9aHUX8RCXDpAXtzWEZdtW5POhbJn/VNYNBs2ulN9Rk6Igx6Fdr/9CKMR
         sZ+4lZxRH+JwaR0hpUYqpxWgS/rftIxaeGgUwjgDkNUUuhuuXe3xLtc8KpIjPlEPwZY/
         GSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727738; x=1789332538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L82HQAgQ+2CVzu0Q2LDItaAOLTBjlX7/PRc0nX33wE0=;
        b=hHc7b+nrRYpyC+R1Z/MIlDZQAKAEk4VBc5gFE8GJNZLCwNX4q9kn1lHLAAio8IY5e+
         7zcKSAUjAN6SIEHBIG12A3vbEGhwLQ6hBJbkPBEDcMcSj9i0XfCbJruirnTHq++1H2+6
         oOvPgZQ+FX5UhUAuaKbU9XygXrZ1uG9jGgY7zSxYtaBxaRts1JCKjGOWRbMbXGPENzMJ
         65/ilXNm6JeMrVXJ+mTHlxqri70MWQz/QfCG99F73zw0gcFFGR0Nf4KAvd7YxVFWXhil
         3BQ6Zk4i6Q/vRE6XLGjiUPCpB2fv/7gw3G0JIBF448RnxxxXT/U3jFyIMpyzAGv5GkZB
         uRhQ==
X-Forwarded-Encrypted: i=1; AKwUvByLhpJEsTywNWByfkqrscJvYOXfFcstoQhArMiGwg2D4Sc6PfvoyWuIDnUUa2QW16DIsK5K8GNBK9o=@vger.kernel.org
X-Gm-Message-State: AFuF++k0Eh/iAfTj6Wf/rLeUHpQBd5VeIIBZ1h8ozz/RXUqWMWWnPCJx
	bZh26L3vQpBRpHkt7z6HN/rMaLidvxwVE6VUvrY6eW4Pnbyf9Tnc5PbdeP9m7cjqyCqJWtDb49Z
	tU/UL3wgsuBdPuJxHEGTYKvYOWOMgF30=
X-Gm-Gg: AYBFou1cYwlx0qbZ2tasi+MDcL5OL/cr+bN4m87MRACfUg0ruNrnjX927OrSRnu/iRa
	iGvhFe+igbD5rQH3xwkhJOCeP2wTpbiruvsynnbrjDzVoYvBMwPM7dBzfjU8b3morugzlSDB39W
	0Ct/78H81+ONY04D80LwC3gq3vfUzAkxCtVL18RdvCbSRe5PPDPhTcAxRPOnHaoV6p6i69rukM7
	6+LOUkj4NtGjqXHezvHf8gu3BRAPE46SEMEoUQ60y0MwWEqg+lBmCIc0/gMD78GLlUkvvcguCoR
	tjaXEbN1mRbDyVeb0AxOpnV0vWGtwxRqsopVmip/TkHK9sMwHNKAkjG+E0bl0n0gPiFe/6trgCE
	HKqI=
X-Received: by 2002:a2e:bc0d:0:b0:3a1:5172:c287 with SMTP id
 38308e7fff4ca-3a371b1c774mr20550341fa.5.1788727737292; Sun, 06 Sep 2026
 13:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
 <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com> <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
In-Reply-To: <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 6 Sep 2026 16:48:45 -0400
X-Gm-Features: AcwNN1XRBHy89Hz-biLi2GuAv1p3kMnxoZpJdzyZFQd3kQ2qcC8_lvRB8_pS3ck
Message-ID: <CAEdQ38F9KRFWj4BuzWYvbN9xf5brhwfUZuj2DC92iR-b+2fhFw@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 4:44=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Matt,
>
> On Sat, Sep 5, 2026 at 9:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
> >
> > Implement the perf register sampling interface for Alpha. This enables
> > perf to capture register state and user stack dumps with samples,
> > supporting --call-graph dwarf.
> >
> > The perf_regs enum exposes the registers available in pt_regs: r0-r8,
> > r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
> > in switch_stack, not pt_regs, so they are not included.
> >
> > A switch statement maps perf register indices to pt_regs fields since
> > Alpha's pt_regs layout is non-contiguous (unlike architectures where
> > direct array indexing works).
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> I think this patch still needs kernel-side work in addition to the
> matching tools/perf support.
>
> HAVE_PERF_USER_STACK_DUMP makes the generic perf code obtain the user
> stack pointer through user_stack_pointer(regs), which on Alpha returns
> regs->usp. However, the interrupt SAVE_ALL path does not initialize
> that field, and do_entInt() does not snapshot USP. A profiling
> interrupt taken from user mode may therefore attempt to copy the stack
> from a stale or uninitialized address.
>
> The proposed perf register ABI also does not include SP. A DWARF
> unwinder needs both the sampled stack contents and the corresponding
> stack pointer, so this cannot be completed solely by a later
> tools/perf patch.
>
> Would it make sense to drop this patch from the current series and
> submit the perf support separately, including USP capture on interrupt
> entry, SP in the kernel perf register ABI, and the matching tools/perf
> support? That would allow the rest of this series to proceed without
> waiting for the perf interface to be completed.

Yes, let's drop this patch from the series.
