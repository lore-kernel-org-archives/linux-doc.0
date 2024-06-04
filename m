Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C32145322
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717539659; cv=none; b=Iovk7d/SVdCLiv7OnGlMcfXCFMzA/IAVJ0YepEBRMLlY7Wcmn3nV5Hie9MgcukB2SCdPx0XjMa7ozFJO4Oz16RVCv6PTLvvlJ0UoCqf5+Bk8iFIV26chCft91YrrtyLnFpBdCrBXt3NG89ygUacxDuM0VfJvDLEr2tJK/bJyPLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717539659; c=relaxed/simple;
	bh=PEwtsHuB5I4aiO3jiKouMVnFQZ+bv8RQ/fbI3oGiDcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/S56oATL2Nqahp1ACSeQC/x6C8zFh5BCCzGnt3aEj4BgvUKwfmP91DuKsg9BanonWfL+kZo5trzBuLVOOe9PNAmuOg1iDmR3hqyeTqI1IUl0d6eZk5/4fVWmXIjPuq5yHT7NrcqwNqDeWDkt+CZ0fNx12oxfc3Bp820xPFBnEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IjcSrKxf; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IjcSrKxf"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44024f5271dso49751cf.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717539657; x=1718144457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIBmj4SOCWbNZTcEJ36wTOG253WABX8+/zZKq57PG38=;
        b=IjcSrKxfRJk3uZywjOPMuQgBJZZkaAq6MrvZuqnskMXBmUa9mLDxqK58Y7ke8j7ZKS
         ZfiYkRHdaQ3i4HdpuRBVljfjCTCkovMFIVHIvU0nufnjTu3knKYur4rJX/ydnt81GY2Q
         fObE8bR2g3LBGtIodjNa31tMSEq/DCpcRBUO73yg/d40v4HpT9dJ9WR9pN/f3zarcEaL
         1UzsBXyClrBRkm3LFrE1MX7q/Avph1qFJXFTi+ZKMVLpib6FVS6oiah6g1O7W0gf7/Yn
         iaqsqP8wGBIQpqaJNbtZ2Pqqzms0RIprG2xECWh6bHmU2xKLkWuI1hXo4+fV4+V8E0Wy
         oCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717539657; x=1718144457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIBmj4SOCWbNZTcEJ36wTOG253WABX8+/zZKq57PG38=;
        b=fQLMdSCQxv9Wc1bffFgzAsYZnhRPVPCVMhZzX5co7DNW3pjCSbucf5Mt6To0hBIm/a
         CNUb0o7mcDYiZnmfRk+/T9aqa8MT/cMHW+XMe7X4BYJ/hMTohCsw1lqzBwhIkqH6zJ28
         197igpD08DRIeJiCi1GG/Ogu+z46s0nIHJCcB6vv+WtyEqVAeitaRGD7ZgG5kJhc/QAz
         eHTCIFYiLFQoz6DbHUjWF1zu8K1mUvu8FiX1r3ynK5WkH2WV5+29lw61N+vXXO734ks7
         2MdXkpy/cmCyY2Y8VjygWSoIeweA+8mzwwL0URkIpOHkwmNY3PY9apmnk61t6CRzs1m6
         wJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0muNvdI1ugpCrJcj/fFwSFvPlVnV48ctYewrVOhwrUIkhhYh1vsiIuuSEONcwY8MnZOdkbhAv9KSnSrPUsqnFUcEEk8hD+lB
X-Gm-Message-State: AOJu0YyJQjU5Ak5NC1xfBMBf2a2Azk/SIsuPFG9uFcEJGc5GayBD6hqS
	g9fgN3fhagQgHoVmE1rqeM90aO7FnPtUT8FCJYCYQmCYPvj+ICctFaJHm59vFqw0+70rrh9RHQO
	7sUMl0jcFZrQ/LcWVS7Fh7CY0Kzi7AqQkOjQm
X-Google-Smtp-Source: AGHT+IFqQR6wV0ldEWSB61hJVaO5R3FbfhfGJ/jL2Y1RO1QFt4uPcpp04yR87XJA3WIv/pXl4si2o71lLJw9aUuCxfc=
X-Received: by 2002:a05:622a:5a98:b0:43d:dc3b:518c with SMTP id
 d75a77b69052e-4402ce13c55mr332451cf.11.1717539656344; Tue, 04 Jun 2024
 15:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com> <Zlog5Yk_Pjq0jQhC@linux.dev> <Zloicw4IU8_-V5Ns@linux.dev>
In-Reply-To: <Zloicw4IU8_-V5Ns@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 4 Jun 2024 15:20:20 -0700
Message-ID: <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 12:18=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> On Fri, May 31, 2024 at 12:11:33PM -0700, Oliver Upton wrote:
> > On Wed, May 29, 2024 at 06:05:09PM +0000, James Houghton wrote:
> >
> > [...]
> >
> > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtabl=
e.c
> > > index 9e2bbee77491..eabb07c66a07 100644
> > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > @@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_=
pgtable_visit_ctx *ctx,
> > >     data->young =3D true;
> > >
> > >     /*
> > > -    * stage2_age_walker() is always called while holding the MMU loc=
k for
> > > -    * write, so this will always succeed. Nonetheless, this delibera=
tely
> > > -    * follows the race detection pattern of the other stage-2 walker=
s in
> > > -    * case the locking mechanics of the MMU notifiers is ever change=
d.
> > > +    * This walk may not be exclusive; the PTE is permitted to change
> > > +    * from under us.
> > >      */
> > >     if (data->mkold && !stage2_try_set_pte(ctx, new))
> > >             return -EAGAIN;
> >
> > It is probably worth mentioning that if there was a race to update the
> > PTE then the GFN is most likely young, so failing to clear AF probably
> > isn't even consequential.

Thanks Oliver.

>
> Oh, and the WARN_ON() in kvm_pgtable_stage2_test_clear_young() is bogus
> now. Maybe demote it to:
>
>   r =3D kvm_pgtable_walk(...);
>   WARN_ON_ONCE(r && r !=3D -EAGAIN);

Oh, indeed, thank you. Just to make sure -- does it make sense to
retry the cmpxchg if it fails? For example, the way I have it now for
x86[1], we retry the cmpxchg if the spte is still a leaf, otherwise we
move on to the next one having done nothing. Does something like that
make sense for arm64?

[1]: https://lore.kernel.org/linux-mm/20240529180510.2295118-6-jthoughton@g=
oogle.com/
