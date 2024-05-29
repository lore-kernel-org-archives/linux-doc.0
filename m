Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B32869A
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985756; cv=none; b=SkH3Z+RPMCQ9ZbaWnxh03ZDLM7FkRoQaRqxF3MzKd6u7nDL9NLn0tC+771CvQGf0sAYbZybtfu8VO2N9+tk0RIDHhBRsoWRigEAL8jdFCzVEQ+vz7lRbLUq9vuPTcqwwcMVh4tDAhOsf1VCmBCNF7qEEeNQSvAnBw+7ndtadUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985756; c=relaxed/simple;
	bh=idIfNjbOL1qD0ETg1hT6YfT88MOe7waFfNRjHCRqyJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHRiANyZg8oUD4J0hmzgnZOhPo0ys7nhhxI/OgsJBHrvourmBd0apIgA1c2NBSngo2Ag2jrkit+Tl6gyanqSQSb37sWDVJA9vmOxtcj4PvQiSQ7R2ewI/SdrNcBrAY3fPFN0jmYXe4GvxkXcXPpXrChwIbTxdqcbYg2kuJSNZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dsHjE0jo; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dsHjE0jo"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a62614b9ae1so236322666b.0
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716985754; x=1717590554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGOEscTDwTYqe9co9+vKadCnOa5+j3XpvvU3cG9r11k=;
        b=dsHjE0joBJ+pINsd1aEDha8rBVzEkpvitdyXLo7dwKlw2lgPXQ5uhB743UYcwCkCZZ
         h4P9LYTAM/Cev2OmYo0eeSucugyHn7x/XxHP8rn6EsHlIxBhKxdTzQKhK5ivwV66HPyN
         mT6kvcttDvRlVKRcMyAgqBhcQstk7TBAfy3O9zBXDZiK6tpQbdcbOpyCu/WK27aDbJkb
         noriGWhgky95jdcVtszZxReBt/gaN+xRcjdmjFhLGjWGfbIalKxVufzl8UFB3IQPMOLa
         WPWSnzcWBemAQ9dPfwLh2pABMvp+8tCmX8ZqGw8qNSnau0MFx/4g9uw5JuAXV5sR/LFs
         J9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985754; x=1717590554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGOEscTDwTYqe9co9+vKadCnOa5+j3XpvvU3cG9r11k=;
        b=D3FXBmIeXCE5y+aL043t71Shp5YgKlpFUnwQ4dtWIPfKML8BCmiC8mCoOaoVwq4sBX
         pQf2+v+DfNG62Q0WL/r1kIZ7v2uNyT0SgYYBlndySTXYNyZVCTq288ZpwlYwUt1I0Ggj
         Y20+ZP/gJ0oohuwDWdZ61acV81xhRxD2GmZ5pS7M4pjknwmtwVDB7bH7IRCHiDHr2PfW
         upurf3JRFnW48X2qk1zXSkJ2Gy2yzdfcQ8Tq9vCC4RqyuPPYvz0DeBTHWEuIBh/Y68UI
         tLr2GPVyEceilL0f+zULmwjxUqMqsFgIXOnmF0YMSyIORIws/bIGvfgxm0odLwHCIW4Q
         BLrw==
X-Forwarded-Encrypted: i=1; AJvYcCVwBiVwqnwIDUm8pkSg7YVCxJ1s98WW56LQArCjysPGJzcmgLhyTw49C01coqbSo36QArK0O4ik7MxVkWloCZZ23Nje7W26fS3S
X-Gm-Message-State: AOJu0YymkdfnEayeUPHj8us1HSuv56SR2vHkJYbOvWERadq40YXeWI/d
	mjvUgnjOJucWORRsZj3o4os4O9CMIXYSqRdjSpUBGVTLlTfl1uDPCXwyRj/bwgI4YG1D/QgYLwk
	a3cT7HbLVr62l4GktOqjwRp1KJK+hsCQ1Eo3z3w==
X-Google-Smtp-Source: AGHT+IEQgikhsrsUYBnaJMpD1uGbxEZ77OxlR6yJ2c4VtevK8CwBEfxhj58UbW9AHXXHwN+zwIK7XfHdcV5UtsKrn0U=
X-Received: by 2002:a17:906:a455:b0:a5b:53e2:519e with SMTP id
 a640c23a62f3a-a62642ea4f9mr995846166b.26.1716985753806; Wed, 29 May 2024
 05:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-3-alexghiti@rivosinc.com> <ZlZurXUUUfXHZJaX@andrea>
In-Reply-To: <ZlZurXUUUfXHZJaX@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 14:29:02 +0200
Message-ID: <CAHVXubj1RpN80f0vNQwFtaNKORnw2F3yzA1_0txa3A+9-usdFw@mail.gmail.com>
Subject: Re: [PATCH 2/7] riscv: Implement cmpxchg8/16() using Zabha
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 1:54=E2=80=AFAM Andrea Parri <parri.andrea@gmail.co=
m> wrote:
>
> > +zabha:                                                                =
       \
> > +     __asm__ __volatile__ (                                          \
> > +             prepend                                                 \
> > +             "       amocas" cas_sfx " %0, %z2, %1\n"                \
> > +             append                                                  \
> > +             : "+&r" (r), "+A" (*(p))                                \
> > +             : "rJ" (n)                                              \
> > +             : "memory");                                            \
>
> Couldn't a platform have Zabha but not have Zacas?  I don't see how this
> asm goto could work in such case, what am I missing?

Zabha amocas.[b|h] instructions are only implemented if Zacas is
present, as the specification states: "If Zacas [2] extension is also
implemented, Zabha further provides the AMOCAS.[B|H] instructions."

But the code you mention is only for 8 and 16bit operations, so I
think we are good anyway?

Thanks,

Alex

>
>   Andrea
