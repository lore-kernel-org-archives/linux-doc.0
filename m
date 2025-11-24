Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19712D5C7A
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 23:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764027376; cv=none; b=ZAwfXQoabI+OS6P/DtvqqS304MuD2LhMXpV4V7tQOe3JcQCznDh2faBf0oxPEv/v935SkHFkfTeNsJfKFt83hkwrxt3ctcHCHqaZYb/3/drJS9OBJpaXbFEDi+bZMtMWeIWigTnyvMOwM6u1DA+jhJtf1NTUI31Ty9cGbVceOZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764027376; c=relaxed/simple;
	bh=UGDTE1zIjgVXgb2udlm6bjj0SaXznJcoEb+UkIEWurc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7sWjJft/IK+/XxpX9zXAvF3STqhu/2LVObm/lpXutMdeG/32BsHw8I9Vvbe6fF05oyCGbNCPOpmtLefstaXLTkvEpQNgCIORib0YS26qleiNpMqr6P9vnDsuBNxNXv3nwX6e75rqlDjFLqJSxw2h5Yeo5jTDJPqyzExU6rf+5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=R5+WeMEH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="R5+WeMEH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7370698a8eso635972366b.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 15:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764027372; x=1764632172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlci1y7yuwyEjVyvyPpVVR5+2jh2b1xf5fgy6sXkeBg=;
        b=R5+WeMEHW607aI5ynKHcZyr7aLvUSsnkRlYDht/nctS9EIR9S9AsEJVe4TLebmEVzZ
         oOkx3ZHEkzEIk3jh/fdjSXsT1G/N489fG4zrfVqbETpiDrgaFPlaGO/eT7IOeNMBal41
         OsBjCHb3P3Z/21CbtG5bQHi7U/aERD37X4Xlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764027372; x=1764632172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rlci1y7yuwyEjVyvyPpVVR5+2jh2b1xf5fgy6sXkeBg=;
        b=PQ0KYF9s0fAkbFwYTSXc43UykG/8No2mFasf6rbixa3JyLq1mU1uPV9wZX00J6dkna
         +lbEcvrsHKHmCTt4jPXY38VON41goSRrxsKzPzvzt48oH5uYQMiE5cRPrEGnXBQMZITF
         5RKltKrpwwtq0K90rCzK5iOQHmtw22IojyXHrVLKkzmtiYdLzttXxEOycdh8TcviafTe
         14z6RVY/mlIuZxGZJ3kZCe6HJpqpnfTz2RZaYIDzliIxy9ZT2vKX+xSb+6fqIahz7hn4
         Ta3u7f/GYRI5L/uJ3lrpr6buzEUOug9SH6dsLcQnFeB59F705ydxzcDfvSP4YEB8oF2u
         k6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCoGLiPb9YWsB1zgRqh6CDtgKQaB0yKVuGWOrplTcRsua3cq/hCX2p2zIwfiAmJLqEPnFYuYHBIk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHLxMqeSIyO85NTbOV93Ce1yya/kjZHJnRbK8DSTCjfawCi8NR
	xIW7XbpkgH66RnFrU4ox16Gm5/F88Q9B9fRcNtGVhDxIQ8GQND2JpRsoPMKw5va46+MahCfxGvq
	6My3+0pM=
X-Gm-Gg: ASbGnctjF/NzNml4A6/OQl2gw5Q5KZdVInhVz/bg8WSV7UjkBye3n+0hx00ifFienNb
	Lb9BWkj8oc4Io+zdOxJKGFjIl2ORuwOIGZcOQ7EA9NqHqRKyIXWzHeYMBL9ln9Eok7ORwig72E3
	8i+tFbzEjwvOYa0cuT/UhUhDKYTzzOKkRCKuboyJSD5FNSRGjipQp/Wc13/H4UxNMP9PmW2wyfu
	XHif5xWobnA4UBJtz6Ufx+Qr//Lm6eYWGxOKSfoa7YlASof1eFpTrR7apAMhJNTEWhdLqjG9uZ5
	bXeWv4630+CiEQhKciU0pv6V988sPZBTTPd5fHmzJ+zxAZi62lx609QzBEVniPofd0JEOg/NPSR
	B8JZz7CdFQkuEWHrdChLDdcXfdOrsL5xfqjW6JfCi0sJcQ8SDTsiaAx6rLgw23+QnLv/hKp0+Jt
	gpI9Lkx9HxPBQiE+jPT7MIVVvIvmYxynZ0cHDAw3HKNGegCChHa70dijLPqBfD
X-Google-Smtp-Source: AGHT+IEal2Llh0ZkzTZ8JzkgZjxI7sdWOJ2vllOZfetqN0CRatpzXG0mnvBYOsvO1ntov2+aSjcXtg==
X-Received: by 2002:a17:907:1c28:b0:b73:3ced:2f59 with SMTP id a640c23a62f3a-b76715dcc1bmr1536396766b.27.1764027371565;
        Mon, 24 Nov 2025 15:36:11 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d7a0f4sm1447330566b.26.2025.11.24.15.36.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 15:36:09 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7633027cb2so888572966b.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 15:36:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6Mt7ESAKhw+WAzch7pZsdVeWAE1zjn0hvUS94bUqk34aZYqvkSoigRwjmDv07hh/NKgiJ25jk79o=@vger.kernel.org
X-Received: by 2002:a05:6402:278b:b0:640:cdad:d2c0 with SMTP id
 4fb4d7f45d1cf-6455468d57fmr11542593a12.25.1764027035833; Mon, 24 Nov 2025
 15:30:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
 <202511241119.C547DEF80@keescook> <aSTKLsRNiEKtDqPI@casper.infradead.org>
 <202511241317.516BDE7B@keescook> <aSTRsIUPeT5EC5An@casper.infradead.org>
In-Reply-To: <aSTRsIUPeT5EC5An@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Nov 2025 15:30:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgn-2ieKtaHAXLLge1UFckLKa88vo3XOdLz+fP+DLpHGA@mail.gmail.com>
X-Gm-Features: AWmQ_bkk3_N4a125249CnpAkBAwWzpKOgurGjUm33RHuFAzjc01J9LWjmJhIWds
Message-ID: <CAHk-=wgn-2ieKtaHAXLLge1UFckLKa88vo3XOdLz+fP+DLpHGA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] slab: Introduce kmalloc_obj() and family
To: Matthew Wilcox <willy@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, 
	Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Randy Dunlap <rdunlap@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Nov 2025 at 13:44, Matthew Wilcox <willy@infradead.org> wrote:
>
> This third one is interesting.

Why?

> include/linux/jump_label.h:126:44: error: conversion to =E2=80=98long uns=
igned int=E2=80=99 from =E2=80=98s32=E2=80=99 {aka =E2=80=98int=E2=80=99} m=
ay change the sign of the result [-Werror=3Dsign-conversion]
>   126 |         return (unsigned long)&entry->code + entry->code;
>
> static inline unsigned long jump_entry_code(const struct jump_entry *entr=
y)
> {
>         return (unsigned long)&entry->code + entry->code;
> }

I'm not seeing the confusion. 'entry->code' is a signed 32-bit entry,
and we're adding it to the address of the entry itself (well, the
address of the 'code' member of the entry, but it's the first thing in
that struct, so same thing in this case).

The next function in that file (which uses "target", which is *not*
the first entry in the struct) then makes it clear that we actually do
all these relative offsets relative to the address of the relative
offset itself, not the base address of the struct.

But that's actually just a random implementation decision.

That all a very standard thing in assembly programming, which this is
all about. 'entry' is a signed offset from its own address.

And yes, the exact thing you are relative to may differ. When looking
at instruction sets, sometimes the relative address is relative to the
beginning of the current instruction (I think m68k did that), and
sometimes it's relative to the *end* of the instruction (I think x86
does that).  It could even be relative to the actual byte *inside* the
instruction, although I can't think of an example of that.

Sometimes it's relative with a shift (basically all fixed-size
instruction CPU's do that since instructions are all mutually
aligned).

So that's whole "exactly what is it relative to, what are the sizes
involved, and are there maybe shifts" etc just a design choice.

The whole "offset is relative to its own address" that this code uses
is probably the simplest form it can have.

> The warning is ... not the best phrased, but in terms of divining the
> programmer's intent, I genuinely don't know if this code is supposed
> to zero-extend or sign-extend the s32 to unsigned long.

What?

A signed value gets sign-extended when cast to a larger type. That's
how all of this always works. Casting a signed value to 'unsigned
long' will set the high bits in the result.

That's pretty much the *definition* of a signed value. It gets
sign-extended when used, and then obviously it becomes a large
unsigned value, but this is how two's complement addition
fundamentally works.

This is bog-standard and happens all over the place. We have things like

        unsigned long xyz =3D -1;

in various places, this is not some kind of unclear area of the standard.

And for all the same reasons, the programmers intent is obvious too.
'code' is s32 and is signed for a reason - so that you have a +-2GB
relative offset. And this is not some kind of unusual pattern when
we're talking about relative branch targets.

Now, if you don't know about things like relative branch targets in
low-level assembly, maybe this is code you have to look over several
times, but this code is literally ABOUT re-writing branches in
assembly language, and this kind of pattern where you use relative
offsets is traditional.

And yes, the offsets are literally smaller than the address space, and
the signed offsets get sign-extended as part of this all: that's very
traditional too.

Basically no 64-bit CPU has 64-bit branch offsets (and few 32-bit
CPU's have full 32-bit branch offsets - x86 happens to do it, but most
RISC CPU's tend to have branch offsets that are in the ~20 bit range
and if you have big relative branches you need to do those with a
separate constant section or something like that).

So honestly, what's the problem with this code?

The warning makes no sense, and is garbage. Are we not allowed to add
signed integers to unsigned 64-bit values now, because that addition
involves that cast of a signed 32-bit entry to an unsigned 64-bit one?

There is NO WAY that warning is valid, it's; not *ever* something we
should enable, and the fact that you people are discussing it as such
is just crazy.

That code would not be improved at all by adding another cast (to
first cast that s32 to 'long', in order to then add it to 'unsigned
long').

Imagine how many other places you add integers to 'unsigned long'.
EVERY SINGLE ONE of those places involves sign-extending the integer
and then doing arithmetic in unsigned.

                 Linus
