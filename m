Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3D1DDA8
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716987372; cv=none; b=SOnX5IcbQ0ZYEG60WnXstWv+xhKWDKBzsgTTW+QUB8dhV+KmB+7HYgjk4Cy2Pn4DVYyboAumem9Ew9oEm/0V7HE52O/R8NgejR9LPG12/ROyfkS7gvBjL9A6YQlb1MsCKay2FQ4vs7W9efMndq7AF9BMrM3p+JCnHKtbSk7Cel4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716987372; c=relaxed/simple;
	bh=ZswRo9CCBUa07cVg9bCL+lMt2x/W4xXLb1fAdy1GxqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufpJb6wT14QRekWmfODrPCZJEhDeK+sXA/Z8bbckABGYYR0AQfFsdEWROBcpBXfqzZwPWKfrBl/tjc23Zi7GxhusyUcUwidtDrqbVcv0qXqoUea2kdeMJvOZ0I3QDBmYFglgzBC3Rnr3d9K/sCfrkxUtWFMIXRizsI4AkwDzOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O4vT9H1X; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O4vT9H1X"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57857e0f465so2607481a12.1
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716987369; x=1717592169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km2JkQ5ctJj0MJYq+rdmwY806xDsfrDcZz255+ragDo=;
        b=O4vT9H1X/9QI2rjcgwoD/Ne6NQsG1Oo2fFf0jKWAkvIKmZulIPQBz4avzgaBeuKqdy
         phM0/nCcytGu7PbvxIhTwCvs55Z0cd/ym7m/1LCtFxwDHrW5HBqdvBFmyiPtFnRC7BfG
         gj9hg0ao5IyEET7jRl2FWhKDqpmwMafmHE7phc6kY++NEmMgiQd0he/w/o1VOYPJDw2T
         saGvytSH4ygLQJib8l0/rcP0dbWCjwLJcSWxCFfoH81jpYe7eYZ4hAQxcHfach1Mku27
         nMjdDFJY1hIrWxC0HXOJyPXkUPwxRs3kuuJGUl8foOpZK1ovmWN+qsg11SjulH+6XB2W
         F/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716987369; x=1717592169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km2JkQ5ctJj0MJYq+rdmwY806xDsfrDcZz255+ragDo=;
        b=Gz75IxDRGEXwNcS39mqKDN5peaNMObyP+tsEh3yicjBBaf4hkMjzg6RDyJ5ZJ8czv8
         76TcSFuDDvpUOFRantr4XLK9bbPrDIx2raayiCBJTs1Bzp4d+9/EwuFjpIC61vdId4rR
         HB8eAHSRJFpxJZOp73RvYqt189fNld94MqzEEKdcUEL9dwI5ctZlXE5sLutawYjJpZEZ
         oXKlwKK4znF7kB1pnADdqk1/pcAvdDFxLMzOY5jKbqRW4Kj21AESXJkM9O/j0+4T+hZo
         dA1u4LLvDwbn/JtInV3Nois+OfF//6lQnfd30yiWS6GKWNNozOruwqFslo8yH/2GOWVB
         nH7A==
X-Forwarded-Encrypted: i=1; AJvYcCUDPFf3aUDWXn0XffXYrgXA31mtuR+5RRX6gml2iFVm4vINsjosHPnjkdIWjY/WcJ/rPEBZxxPBvV8ZsBnH2F/AAihqS6o7tN0M
X-Gm-Message-State: AOJu0Yzr8XPTHlmBL5428h7n1JLg63Eq2JZGMLCc23E66fzdM/yUSC/G
	7ZnsVUi8UmqHrfM5snl9lyI30eJUXIuNgNpSFy2SZom+FpTnS+LrkBdlj/ZqT+WuaTKY1oAyE8s
	G/iqIl73SG3IHfR79Eo/7umZaqMfxOzvtqQyabg==
X-Google-Smtp-Source: AGHT+IH0vOZfyMkMWjnkaaZK40pKjAqSY52a2HgHvxw27fqLFne63Zuz6Oyl4uIA4uXNRiyl5WY3rMhK7Cfm5L00l5U=
X-Received: by 2002:a17:907:25ca:b0:a59:c833:d272 with SMTP id
 a640c23a62f3a-a626417a32amr1191230666b.13.1716987368948; Wed, 29 May 2024
 05:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-3-alexghiti@rivosinc.com> <ZlZurXUUUfXHZJaX@andrea> <CAHVXubj1RpN80f0vNQwFtaNKORnw2F3yzA1_0txa3A+9-usdFw@mail.gmail.com>
In-Reply-To: <CAHVXubj1RpN80f0vNQwFtaNKORnw2F3yzA1_0txa3A+9-usdFw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 14:55:58 +0200
Message-ID: <CAHVXubgGQ1whBsAVbfZryqxzTu+uNaUQoAs_AUhM2ofN9h9BDA@mail.gmail.com>
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

On Wed, May 29, 2024 at 2:29=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> On Wed, May 29, 2024 at 1:54=E2=80=AFAM Andrea Parri <parri.andrea@gmail.=
com> wrote:
> >
> > > +zabha:                                                              =
         \
> > > +     __asm__ __volatile__ (                                         =
 \
> > > +             prepend                                                =
 \
> > > +             "       amocas" cas_sfx " %0, %z2, %1\n"               =
 \
> > > +             append                                                 =
 \
> > > +             : "+&r" (r), "+A" (*(p))                               =
 \
> > > +             : "rJ" (n)                                             =
 \
> > > +             : "memory");                                           =
 \
> >
> > Couldn't a platform have Zabha but not have Zacas?  I don't see how thi=
s
> > asm goto could work in such case, what am I missing?
>
> Zabha amocas.[b|h] instructions are only implemented if Zacas is
> present, as the specification states: "If Zacas [2] extension is also
> implemented, Zabha further provides the AMOCAS.[B|H] instructions."
>
> But the code you mention is only for 8 and 16bit operations, so I
> think we are good anyway?

And I was wrong like Andrea noted privately. So I'll fix that too, thanks!

>
> Thanks,
>
> Alex
>
> >
> >   Andrea
