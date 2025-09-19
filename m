Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE830E820
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758283948; cv=none; b=DH0iDNMUUM1uW7UYdqWeSdo2bTO9JlCgCupd4HaAK24TKBccarrilq1rb+1bGrNyvw2uZgAXDWkEgTgeJRlFyj22Kw0Zo/LSqHUItu1xr5an6pnafVLFK8GPYUU5IzH3O11XjWaQdGqGFY7Gg6txCevUTnR5+29Pm6yRin+SbTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758283948; c=relaxed/simple;
	bh=40LHT+10W2MVoOVX/TuobAQ0nf6X5e/oMpwW9iNer2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsB3cT2JS+GWSUk0EATXzmCNfCoVW6aMQeQp+LpXsKqziQV8ijvHdS96Cn1BsI8riZzSOoWFw96Lundaie4hcpswaFF+3U9Ne6IfzVNtuHRLjNmhK5JjC74IxAARoWJqRHumW3BJhgzR0/n2YXZQVU8SLq5ngq6r4j4MpSj1+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=i3L5hTO+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="i3L5hTO+"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b54c707374fso1422849a12.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758283946; x=1758888746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2HMMNKqDgzt194tG8vLKUMKuY47t2DmDtqHxNeA0cA=;
        b=i3L5hTO+OK0u16+FMy8g/o/GtRBwoIAWTx+0t5TyjL2n1ZnFuFaSg+ag/W0sq9Ods6
         7ZROy0ix55Pwfo5EWpUQQsd+hFmWAfnKKcK2d4iwGwOOzwbZgJr7enaZNgsAmta3ApYR
         cVP9Q0rLGKcLmiPm6aXPABjzh2uiFLsit79pAP+6hEOykLypQz6UfZl+fcyaArJvBRjQ
         rddxlzns+YXwp/e59lBVfjTf5bnDzjCWAY87bGQCwlx4qnYPiXOW4zxUIbeHJTXT5A8F
         iUvpEvozC2b9xMJh5Skr2rDn9ColV4103N2r5m7huefr4L2LtR1fjd3qN3ttXo1sUs9T
         9Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758283946; x=1758888746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2HMMNKqDgzt194tG8vLKUMKuY47t2DmDtqHxNeA0cA=;
        b=MMniif1xkIabUiae+qXTGgriLHb0i0oNNs5kCP2S98GU5Akt1J786NHpaxD1Sib7zy
         BiEpt12Pw8mYNlQvagRiqTGZJ5/8/MYqH2q9KRonojUyFRRpXZc8UIDGmWTmaIdq6b8u
         ntYvAtmFaxpZTrjUgztyS52k2jMC9ngeuMmk8rnnOB23BqVPLLXdM9X0PCiBv1SF+5VQ
         cc5v3WElCQv2Qlfvm/Ajg4XxiILOGZIqZl/2jgBt0bd/6KoL6/2xI4SY4jeybmxuOoyS
         n4MLy5hLwUpZ2utcdN7eTfW9kR73eb0Nkp2gfNVp4dbB7aH2YNjh0o6Cmband892yYhe
         /clQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+rxMzyyRPF3UTDSJXGbtmDRbs8KzFpz74kk5IT2sAPZnrCr0XpVOw+PZ2ok1t8+B7v9lUMeqQ7DI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw2Mi2ph5i2UuGdrntkeXMR4j/afUBNq5qWpNs89ZaY+Jreudf
	Iw0ooe5O3x/j4tRoh0dmCcyUi/xso9on5e2fEIokVvSfasd6+qp7L2BIHiYpcM/UdVTIxdJdi0E
	X/YAT8BNam0nY6W2hqTa+GJr487mcBmEgen9rNSCQDg==
X-Gm-Gg: ASbGnctyvqBKKQ4VPSERly5syiS6BeyyZSbm3ytk2iIuWrjEnTxkT1/DupZ3W697vsH
	esy/o+qTpnjT7Jn7X5TSBEy+77zVaGDx8p4yNjHZ1QGrC8kMi9fguRazjUZ4ffIHBn8UN1GZDWy
	oU3reK5tY+yD6V5Yx9lY76norTOMb1b3u4DCaK686Nv4H/QngxUDcbp0SL/zmeu/QCSRuUWwBcL
	z4qFSv0ExZ5vQo3i9z8Nmv2Ck8/Tw1+1gCH4YJGgZIbVQYCVocp
X-Google-Smtp-Source: AGHT+IGm4y1poVxGUSiB4FXU7penSJROWpZ9IBJ4RsACGtjYuoj82wxnXamn8PKPxeWN3xAf3wDL9CKqcfW9WQHchPw=
X-Received: by 2002:a17:90a:d40d:b0:32e:3f93:69f5 with SMTP id
 98e67ed59e1d1-3309836a969mr3636748a91.26.1758283945619; Fri, 19 Sep 2025
 05:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
 <aM0qlTNPiaQRY2Nv@andrea> <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
 <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com> <aM05J6FU0xG3SBzR@andrea>
In-Reply-To: <aM05J6FU0xG3SBzR@andrea>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Sep 2025 20:12:14 +0800
X-Gm-Features: AS18NWC1LrBbaCsNeBFlqUXUWaqY8b6JknWKL06v5j39bQDtG4KDuo4wYFErj1E
Message-ID: <CAPYmKFunbrughXdG9Fpum6bxHVu9jmjQdgLVSJ_JA9z+GDsZbA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com, 
	mark.rutland@arm.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com, 
	shuah@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 7:06=E2=80=AFPM Andrea Parri <parri.andrea@gmail.co=
m> wrote:
>
> > > > (not a review, just looking at this diff stat) is changing the fast=
path
> > > >
> > > >   read_unlock()
> > > >   read_lock()
> > > >
> > > > from something like
> > > >
> > > >   fence rw,w
> > > >   amodadd.w
> > > >   amoadd.w
> > > >   fence r,rw
> > > >
> > > > to
> > > >
> > > >   fence rw,rw
> > > >   amoadd.w
> > > >   amoadd.w
> > > >   fence rw,rw
> > > >
> > > > no matter Zalasr or !Zalasr.  Similarly for other atomic operations=
 with
> > > > release or acquire semantics.  I guess the change was not intention=
al?
> > > > If it was intentional, it should be properly mentioned in the chang=
elog.
> > >
> > > Sorry about that. It is intended. The atomic operation before
> > > __atomic_acquire_fence or operation after __atomic_release_fence can
> > > be just a single ld or sd instruction instead of amocas or amoswap. I=
n
> > > such cases, when the store release operation becomes 'sd.rl', the
> > > __atomic_acquire_fence via 'fence r, rw' can not ensure FENCE.TSO
> > > anymore. Thus I replace it with 'fence rw, rw'.
>
> But you could apply similar changes you performed for xchg & cmpxchg: use
> .AQ and .RL for other atomic RMW operations as well, no?  AFAICS, that is
> what arm64 actually does in arch/arm64/include/asm/atomic_{ll_sc,lse}.h .

I see. I will study the implementation of ARM and refine my patch. Thanks a=
 lot.

Best regards,
Xu Lu

>
>   Andrea
>
>
> > This is also the common implementation on other architectures who use
> > aq/rl instructions like ARM. And you certainly already knew it~
