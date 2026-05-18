Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF34390C88
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139787; cv=pass; b=QXU9rdvxlLm+JODytAbaKWIycAG8U17Kf8rVXchtNyxvK22TQoesMfYcI0JCgSKQkT1p5BH711RLykyQ6UcHHNR66rOtuCCOsBVK98KvoKF7tcnGAcT5nwfV4FKGkCIcpA+C0SYn7/ohIXayGIHuDgPbUvFRq9ljbF7M9gqhios=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139787; c=relaxed/simple;
	bh=SuhY8F+fm25ZqBW012AWqvqRGPFgtaMFS3cO7CL9vzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qzzk39NuKOPxxPS0ILrmfARdA5SycGcRYc5ufd9SX3v7PxDevjeZEhdKyMh1aeJbWTIC+V7jNOiuEBao9bJ+KWbXBxKaXuDI1bh6vAekjBcJQPtyAtoMBZoA9U0p6J07QLfi7Tq92iHqrmUo43x+a3Wq29e3rQ0x3fBS0Mqa+M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Wdf1HF9u; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Wdf1HF9u"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b4583f0a1aso17111415ad.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 14:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139785; cv=none;
        d=google.com; s=arc-20240605;
        b=Q28HZe9VAQ9wJCAJyNATqJ9nuRZDQM7QXFhc04RkGPTJh89h3i9rVCBfTyyrZPGeCg
         +9oM6IxAec/X7qIynD2dC99bPYPYXQ8dhSKPnF3MANGS4Ppxg59q1wcxKPuWoUNxmD3F
         +Kkz6OaPiPljWJCaYL4jK0zGihOwye42jOyCJVPZJx8VScfDCOSQuzX91Rak4iEMau3T
         ncnqnzDJrqIEMbfASqkEwGxlS9Gk4hgn5FTx8TKI49z84oUGUl2EmIkl14yM8ADsGwKw
         P/mzVzlxaOrwAXVa68GwgawkmhkURZly09Sm43W/Qf0RglDhZsTovOlgH+xudlh4R6DA
         lwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ertihrDnJ6gG2i6Oxoibdwkml/c6igydo1vaudMBbBM=;
        fh=t68kdZFg8DmR0VHWf8gevhyWI+MnDTKfuAUaJ1ONLLY=;
        b=H1GM+5tTvg1rrI+z3n0UUs6BUdR6eU2fO8MIexD5582jNgDukH8+p/W7fykKgNc2Of
         uD2LcDDAihzWEcjlFF3SVZ6lYMRTNJ3XPPnPhwYFUvtpTA9r3b9UGT6gru2ZDzSYk1/Z
         /x9AL0h+CPf3WGUezagiMR4DH8ZHamwl9ci8wuDpkTvtbRWi5oHWm94yv22IO094Fkc+
         4SjC5f5Tpy2jM/xx6pmUoL3HQVxAIsihGanUB09Ka5a6Ue8/nzzfn4MmZIHZkfkZzAc8
         JgwMmUCaday1Ja2s0b1yF+Kceoe5UshUoQlGZ1a3/yuRbCEfKQ/lnqQorD8bcivrggyM
         /Q3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779139785; x=1779744585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ertihrDnJ6gG2i6Oxoibdwkml/c6igydo1vaudMBbBM=;
        b=Wdf1HF9uaUpeeWtWX0qrF/cU171FPDzR/MyivbB2hjo6hdJwxJW0fp/uVgqp/spmNt
         70l1D7tIvIGcIsXT4Y3KiwGo+SXJOHFK2zMWjEyzFYpNyCw36RhtBPHp8iI8F5GUupfR
         R2YUIwCfFpCkfxhAwJoallS/sAxqyfeXPbm8FvWHtokcjJaDFE0GF39pWNaOCS0H9ocy
         IUTPtI0203HnIOs7Xw5opm7ruFc4ElAi0dI0qHPcSEpA1IADmzJh005TGO+TQZL2q1k+
         /EMtTwN53kA2si6qGqxAB92Ro3GAYmNpBFYbtECQEaVCTPMLeUCrW1/eFL3kAEWN0bCW
         4Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139785; x=1779744585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ertihrDnJ6gG2i6Oxoibdwkml/c6igydo1vaudMBbBM=;
        b=Zz3jdfWK0y/XNKjLsOoMTjOkAk8XO3hmzasQ2sieNs1+BYVBBeV40Mjg1G3kBN7zro
         kDX6NVHuHFAISCH1K7rpdn9H9Q0Q1C5mH/MPlbkHLa1BjeVqt8UR43/Xk5UhHsyrHgm6
         0SoY3I/ROi5zLrDQp5IZzeN2NVhiZGdaWDubYPStGTVNDkKpCwFX8iKM0n5Rmgrzf6o6
         xUTVQHwN+yrPgbVAMkptRkBWEH8Fh4Rh8xtqw99kdu5MwODBV6A9GpBPF0PWxGc2newn
         +vz0jaR5RylAZSWNrXe7/X59T8cBbMIQIBKx8AoeFvBEP7K5BKaafLaxU3cL/TrCpJZq
         kwqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+y1HnBUBkt1p9uNvCrptCxQxj7jSBDn3cb1DJRoo0gOLgkHmjSZ4NKiR5pOHIQJbeDYK0ZqJocubg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyku4qgY3ipYLo++cH65MboB+7ooPJjMcerRCWMzpNiPYMm+jxM
	fAr2922uXwKsdzCA+dTu8wS9HZ/7rZkMMvGUHEoYm9aoeBLpL7yyqOQndrHLjYElwf84bAK1paq
	aOOCS2aOlPYKo4/CrwEfHExerIya0UZ1/gS8nMIRI
X-Gm-Gg: Acq92OG+Wuk2plMEI/Uq0LfzoD3M5x5JJRP2lJBeYHnO1FRC4nZn5nPhsuAX4Tv0Qif
	YklXbWj9z0xmRnyzpP5HV5yOr9P623lnTiP3UtqSoB1zcV9S6YnGIsP/Rc4c7o0ArlNNhQ1lI4B
	6UZgDKzMYWP2Q3GlXhmac4jcV/rWkgyEzg6D5cF3FvUqBJ28dJapF8zAS5oG4TeSGsoS4LO36+C
	xZteaP052LnWsmSwUy+fJJCFfEhNAdXi1tMkxprdeIWIoX/wBYrsa6BZdVQGJqGCTXZQF1Zpry2
	ZsQ7zL4=
X-Received: by 2002:a17:903:440c:b0:2bd:9a27:70f1 with SMTP id
 d9443c01a7336-2bd9a277240mr137696455ad.30.1779139785139; Mon, 18 May 2026
 14:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
In-Reply-To: <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2026 17:29:32 -0400
X-Gm-Features: AVHnY4K9QZ4YPNWpLLMqPoTdx466aeLFSTrB50F9KkmmJTYtgqutlvfudC_975s
Message-ID: <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Song Liu <song@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:31=E2=80=AFAM Song Liu <song@kernel.org> wrote:
> On Thu, May 14, 2026 at 8:48=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Thu, May 7, 2026 at 3:05=E2=80=AFAM Sasha Levin <sashal@kernel.org> =
wrote:
> > >
> > > When a (security) issue goes public, fleets stay exposed until a patc=
hed kernel
> > > is built, distributed, and rebooted into.
> > >
> > > For many such issues the simplest mitigation is to stop calling the b=
uggy
> > > function. Killswitch provides that. An admin writes:
> > >
> > >     echo "engage af_alg_sendmsg -1" \
> > >         > /sys/kernel/security/killswitch/control
> > >
> > > After this, af_alg_sendmsg() returns -EPERM on every call without
> > > running its body. The mitigation takes effect immediately, and is dro=
pped on
> > > the next reboot.
> > >
> > > A lot of recent kernel issues sit in code paths most installs only ha=
ve enabled
> > > to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vs=
ock, ax25,
> > > and friends.
> > >
> > > For most users, the cost of "this socket family stops working for the=
 day" is
> > > much smaller than the cost of running a known vulnerable kernel until=
 the fix
> > > land.
> > >
> > > Assisted-by: Claude:claude-opus-4-7
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > ---
> > >  Documentation/admin-guide/index.rst           |   1 +
> > >  Documentation/admin-guide/killswitch.rst      | 159 ++++
> > >  Documentation/admin-guide/tainted-kernels.rst |   8 +
> > >  MAINTAINERS                                   |  11 +
> > >  include/linux/killswitch.h                    |  19 +
> > >  include/linux/panic.h                         |   3 +-
> > >  init/Kconfig                                  |   2 +
> > >  kernel/Kconfig.killswitch                     |  31 +
> > >  kernel/Makefile                               |   1 +
> > >  kernel/killswitch.c                           | 798 ++++++++++++++++=
++
> > >  kernel/panic.c                                |   1 +
> > >  lib/Kconfig.debug                             |  13 +
> > >  lib/Makefile                                  |   1 +
> > >  lib/test_killswitch.c                         |  85 ++
> > >  tools/testing/selftests/Makefile              |   1 +
> > >  tools/testing/selftests/killswitch/.gitignore |   1 +
> > >  tools/testing/selftests/killswitch/Makefile   |   8 +
> > >  .../selftests/killswitch/cve_31431_test.c     | 162 ++++
> > >  .../selftests/killswitch/killswitch_test.sh   | 147 ++++
> > >  19 files changed, 1451 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/admin-guide/killswitch.rst
> > >  create mode 100644 include/linux/killswitch.h
> > >  create mode 100644 kernel/Kconfig.killswitch
> > >  create mode 100644 kernel/killswitch.c
> > >  create mode 100644 lib/test_killswitch.c
> > >  create mode 100644 tools/testing/selftests/killswitch/.gitignore
> > >  create mode 100644 tools/testing/selftests/killswitch/Makefile
> > >  create mode 100644 tools/testing/selftests/killswitch/cve_31431_test=
.c
> > >  create mode 100755 tools/testing/selftests/killswitch/killswitch_tes=
t.sh
> >
> > If we made Lockdown an LSM, we should probably also make killswitch an =
LSM.
>
> I don't think killswitch can stack with other LSMs. In fact, killswitch
> can be used to bypass other LSMs, for example:
>
> echo engage security_file_open 0 > /sys/kernel/security/killswitch/contro=
l
>
> will bypass all hooks on security_file_open.

From my perspective there are two different issues here: should
killswitch be a LSM, and should killswitch leverage kprobes to be able
to "kill" security related symbols.  After all, are we okay with
killswitch killing capable() and friends?

In my opinion, making killswitch an LSM is more of a procedural item
that deals with how we view a capability like killswitch.  I
personally view killswitch as somewhat similar to Lockdown, which is
why I made the suggestion.

The use of kprobes, while an interesting idea, presents problems as
allowing any kernel symbol to be killed introduces the potential for
security regressions.  As a reminder, some LSMs, as well as other
kernel subsystems, have mechanisms in place to restrict root and/or
enforce one-way configuration locks; while many people equate "root"
with full control, in many cases today that is not strictly correct.

Yes, kprobes have been around for some time, this is not a new
problem, but killswitch makes it far more convenient and accessible to
do dangerous things with kprobes.  If killswitch makes it past the RFC
stage without any significant changes to its kill mechanism, we may
need to start considering more liberal usage of NOKPROBE_SYMBOL()
which I think would be an unfortunate casualty.

--=20
paul-moore.com
