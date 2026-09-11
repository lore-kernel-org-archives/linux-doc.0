Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F487434982
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160469; cv=none; b=BE5Mtz54WJtQHNWjFzwYrh/1+9niPIZyCNpbN7Udh6DoT9wX6GwecNLf3Pxm6QtLt/IjJXv/6YHzB6Ay/V2Z5l+bg/T6lSKt4/si3/71snp4Rw02X08Gkyg9NZcHCOcIYCzQA6fAdmaMW1i2tgUABRpj47qtm0v2FtEtc3RtNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160469; c=relaxed/simple;
	bh=/W6FCmv5ibQNEpHI4GROMvUWyoZn8nstXtz7Y5px5C8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjVVoOQmtTmunJPqbI1BfYRyixJzaiZyTy1igFEZjq7LjRPbx51qU7YHxaRvvUAQ1A1h2mjDKgJpG8KF6FJWQILZwdbaF4BMzkh+QryJfledwBVBED6k83its0N3oND9fj1SekuC2qPwgOjxjgoPeIVgREl/BRDED5RhKl+F9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNPwnScA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNPwnScA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so118753f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160465; x=1789765265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=KNPwnScAFe2jcxrIlyon/k2wmuOoT5Tqcqt5fuZZMQjtGPbaKL9kPFnS36vKd2iGot
         GpoqhZ1pU8yCcJ+iKUY/1halq3cgszxCSMC1xpTvTySZdLeq2/5xU3Y5y5fULjHKk3c2
         w4wjC4NMVktBNnbbrpicJCx1K69y31GvqkzbZn/O/WIkT8r9R6LfSeU5ytUq9R/t5q2B
         M5CTCU8NCW5yKpAdDsBoTxMTRUK6ujBn9J0qAb0Rr/lPjMUvxL0tE1i9aJPncbtWqN8L
         l2TAesbl7p4S3lqI6Vhft4rq9vpgv4MvrnLafSpnRg1VIoEz01aDPZP58+rTeNGhQBGh
         /Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160466; x=1789765266;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=YNLlzeCZVVCjKfH+H/1E+hcTn+ayxTrvGHfwYQjU6vJELbYqyDcjHFZHPK/KTOPUeo
         6kOAJMEHyxz3+eL9arEggtdYrYIq4YdrnSPBnWYVf0GmNGVyUgxVamV0c8gDtoBNrmE1
         uA4ikx/spA3RIvMTz5xPbO4uMP98EH/4OxkWghZsBagtNSsq7P8gm7lhrYwidH/uHFi2
         DIRvEqGDsULmMtlNCBXms3sIohEEmQ1XZfwcPieVD325C0xQNqSjRA39/FZob09H2I/w
         I04novAGp3lAn08jemUrGa/eodrA72vA9P7Ib/b4Sb5KFtXe2275i3CjQa+L/I1Q+HzA
         IzRg==
X-Forwarded-Encrypted: i=1; AKwUvBzIFHqsec9TMYiDvpykwndWMTpgtffA+iy+iC2WEvTBOdXUhpQjcgupfX9QQcym/ghbRVWnE7jTW/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mXQaxVgJZIL7EBJLdsvcP9WyOMmevWY2Ay5mcsS9M00cQui17f
	siw3nvQyvoJpYBgkeiJTdWKHQ7lkfsTDOa5Ed875fjiCrhqeJxwQutQn
X-Gm-Gg: AYBFou3oBBbJ6O/6dkP75ZIiVA5BL38CNIrvjZ9adPGc0jczTKWDB4ixmCNaZ4bz1QC
	0GUY2ZChS6tCnN6jbsGGOdUQuscOSsYj58qbw6EUa7ZzDH8F50AWEab/7O+VouQNyVOcCK/+X/F
	WMysGb5oJTqEYXwFaQ7WYsblhUe4pM1TlXo+meqCdUmJUMBu7KxeYuHJLmpOnRQ89tjBFRnSLeB
	8G+BNglCQEj8hhOg573swMyunRpi0bmkB1rmbD2BNCK6ux/5nsaioOWaPNitSSC6rRebLOKZnmO
	qg+zkV8ZL5JdSTAzGTP9HMyXsiiA9shE/2R3BdL01quLdqfYgTuyyks2j4EfoezEQkv6XzhNTfg
	dUWArCszK48BCT5pHv/dTtFx90z4/kQVf/wI5EdDWaToRI85wVTZdBS1UBm77qZTpMmIyb/Bk4o
	ekn5YuxUxrACBnCxOjAe6RuT1i2/Rr57xJRWMlr7eDoI+0kxJHLR/TTHjv4hVf9jAwDJ82tH+dS
	gaMLnbo1tdmhTiqHG9NLSx8m4JqH6RxKqga
X-Received: by 2002:a05:6000:646:b0:485:8ca8:caa with SMTP id ffacd0b85a97d-486eb34c229mr5448307f8f.52.1789160465448;
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm7798317f8f.30.2026.09.11.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:01:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911220102.1d3d696a@pumpkin>
In-Reply-To: <aqRGYXKDzXZMXmmp@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
	<20260911183333.1df0f2e2@pumpkin>
	<20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
	<aqRGYXKDzXZMXmmp@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 19:24:50 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Fri, Sep 11, 2026 at 08:17:57PM +0200, Nicolas Schier wrote:
> > On Fri, Sep 11, 2026 at 06:33:33PM +0100, David Laight wrote:  
> > > On Thu, 10 Sep 2026 17:42:35 +0200
> > > Nicolas Schier <n.schier@fritz.com> wrote:
> > >
> > > ...  
> > > > Yes, skimming through the patch, I thought about that, too.  Moving more
> > > > cc option checks to Kconfig will make building out-of-tree kmods with a
> > > > different compiler more dangerous.  Maybe we will have to make the
> > > > warning in Makefile's prepare (external kmods) target a bit louder.  
> > >
> > > One problem is that distributions have a nasty habit of shipping kernels
> > > that are compiled with a different compiler version to they actually
> > > ship as a compiler.
> > > In some cases the versions are clearly the same - but the version
> > > strings differ.  
> >
> > yeah, I guess you hit the mark.  
> 
> I mean this is a problem that already exists for any flags already specified in
> Kconfig.
> 
> Out-of-tree modules are historically something that we don't go to great lengths
> to support and haven't historically worried about breaking, either.
> 
> I'm sure distros can find ways around this if a problem were to arise. But I
> don't think it's something to worry about all that much.
> 
> I expect a _lot_ of these, in any case, would only require the compilers to be
> within a fair few major versions of one another anyway.

That is true at the moment when the version of the compiler being used
is checked.
For instance it doesn't matter if modules are compiled without 'asm goto
with output'.
But if you putting the options in Kconfig the compiler being used better
not be older - or it might not support the options.
It isn't too bad if the compile fails, but some are silent.

IIRC it is Ubuntu that has different version strings for the same compiler
version, and Oracle that ships kernels compiled with much newer compilers
that they install by default.

David

> 
> >
> > --
> > Nicolas  
> 
> --
> Cheers, Lorenzo

