Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13932A3FE
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976989; cv=pass; b=J3bdO1L2CjBlWQSf8Ca4KDvkP7MJqU2xdfKrQDkBCWOxhCfMXi5NdWGuztqs7Osm1tiOgHS4F18429fO11M6trCyLt+Wx2bA9xeM/QPZPQFAi/M/tm8b63F3917J3Ih3TFN1IRFjMuXf2lXsqjqyV03SLdLz21Opcql25VAG7ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976989; c=relaxed/simple;
	bh=8EmbocqF6Vdb3h0BM5UKxGb7Zum+nJE7yig8zb0/EBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMalxtH0XPVTduH+IT//9VS4GTdo2c5+M4EphJoZgoHuF5ujWOUf+18I5Ozdv/V5VHie3PoXG/IBzoSUlhAsM0/9/+5eyvxTtaN8p2RStDEIfc7y5+G2xlSnGFVbrvBFHAIWBxQWOu57VuY76WGxuI0ds2Um4HwpPyFfTiFRjCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8BYpuSr; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8BYpuSr"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6055de93fa8so251783137.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976986; cv=none;
        d=google.com; s=arc-20240605;
        b=iq1q67AxAzDtPVy8HpgK9xEGEg135yTY5HC3xueRMbaTHd9/wO891NQhIMsVewdyWc
         SBd3p9wBy0qbFJM7NVEREYJZ3VKRgQF8llW1RqjvZyR6AIUsNFPepmndiq9SehtPfRCh
         HrMIOWH/K19ciIIiO3Opxqlg34P2JtQVWOYXtxkg9kwdMN0BdBKM3YdWszOHPW5XD9wp
         7y+HIJSeJKOOkkJXbW3HmVhhs1pKRi9p/BrNHBmtAJCgsGbQzPTcQmNEQJKIlcf/jwZj
         jaQ/ONa64t8PTZrPGu298trZuMczJ0NfiPMf/EDIY4E2WT4RERIkxV0hYrTiz5NNO3SE
         JqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        fh=Pi4d9bUMWg8EKvFlRJsbBlnbxc0uZtuZzozeBbeW+gQ=;
        b=jukXvjuM0iIFC/lZf8HClURPJKXwM63TsQ0mID8zQnKMBPqDLD6rFv5mNVoKD9TCcx
         EPFgp0GbZmfJHhmPU671QkjODxpf4OfqKs3NfZakUG3fMOD4Xv1YH4hJPodv+LjhpXkw
         GftmOohLbw27s+gdF8gAIzFNh/lgkYK9SClYfkvagwlomo2VgOORxIIi3eHK4Q4bOb/Y
         pzWM43IsAfsafd/7pg1WqxIrjKRarnBDIXF/noWLsPce9UZHDAamQQuaNESwONf3d2UZ
         KXWrVBpFlyJz+o3LIXdb+joT62WTgJ6teNfVkk/Rup+sejwtCh5AfAbYKRjdLnFgfmrF
         NZgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774976986; x=1775581786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        b=L8BYpuSrxCKO7vl2RHJQ2nJkDtNraPRvvjHo6hnF4Cwfzxg+6qE0iDNVFvt0bci5gD
         r5IdPopZ9KfFTnPTfjOJ5Ai1yOUmxYiwwqWX15jmx6vVrw6qMzEKSSpMZC4EcaVT73Gp
         i/wk9eiokYlTIG4oliekGAjaPmbtMeXcmXi3pDnmSN8tH2HXO8A8pbR/SXPuI0m+Q9zi
         oG5L9bOb0HAqu8LXRfOQGFouq+jId7otLl17GjB/Mk+aOnm4GRiLxZTOxj9a3ZCkjT+H
         AMscSiItcjRR4eKQKt6sNzHCjkQr5lLO+iXE+j/9nSWVEfqaWyjBfc41HrAp/gXZfv90
         TR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976986; x=1775581786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        b=OhnTxGeluCmekAebmyK8u8WMO5TJuNGhHAbs24WgQignbUJPUrUfiOGSRM9tNjfOPA
         KfFtBbh+8WQyQOnmNKn1CXEswDdmRTSr2YfVdoUL4EN/tBPT6w5A/yi43YxnFyqyyuzV
         rphb17jLscAiO0itUVYBKZYeuWbyDyov7cgb9mTswnNtVh7TgvIxo1xKI8ZnxtQxasj3
         hbqQzVIa5Uc942INAM0eIjfy6l1Fvf6Ys54ucMIME8zSjxAFawQOhoMzhCoZpua8vC5u
         qQZQxQeAVioIwDDBXhBztQW2v6bvZWww6UyJG0w3kZJc0mpbmNJUs1xEAsKHBRcJD22E
         Ws5g==
X-Forwarded-Encrypted: i=1; AJvYcCXyDK5mImCqLKFWTZcWeynPTrCnp9NyUwperbrX/tgpTWoC3YNUqjMhGw06qANBKUix4LySzOpqckU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBt2emJp6O/6Kul2F6udtXnjQyB3IVfbeQHA9iXSftOgRdQWZ
	bm9vlO3o6zjr0503tWirL8NkjhPQ/d5scitCxXUHGNwdFfPkBzLyYq61hHSC4Hvkc24+w98LWDi
	+Klf2HPoAZPRe0EreMvNR2hBmbDVqWD+FrKd9djVD
X-Gm-Gg: ATEYQzxLX2QM2jpGq0NYOoIkPjo3MWA9S4UEKGJoO2kSvwF4shvsgqMhjchQb8whaHI
	ZGEFnzqnZYyb12EG5/TnuCUpBXjQ2OiUnJUa2A/nPr3mJ8IDvWBTkIreIgVDlCbpBozrZMmBlc7
	jybrfMghzYpcQYOXTVyvp6COZPbqXBhmHl7K/r2X3bY0thlcktD22kREgiGWF1v5g06/hhWLH2i
	RHShdXGIle5pofmO1jHyUHHFFu7culIPDfq8U1lZB6TG5gyXcZm+TL5MKAaMhZBUNXZQ1+9Dat1
	J3Tv5qY=
X-Received: by 2002:a05:6102:c92:b0:5db:dd12:3d16 with SMTP id
 ada2fe7eead31-60567cf5e34mr47219137.6.1774976985230; Tue, 31 Mar 2026
 10:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
In-Reply-To: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:09:33 -0700
X-Gm-Features: AQROBzCWRSbSGajmdyoAKTTcnG8_jXsUZoBJguhEnhg_UEbHXmjODVo4uOcztkk
Message-ID: <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2026 at 10:02=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> >
> > +/*
> > + * Optional: only supported by Clang with -Xclang -experimental-foverf=
low-behavior-types
> > + * passed via CONFIG_OVERFLOW_BEHAVIOR_TYPES. When not available, defi=
ne empty macros for
> > + * the trap/wrap annotations.
> > + *
> > + * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
> > + */
> > +#if !__has_attribute(overflow_behavior) || !defined(OVERFLOW_BEHAVIOR_=
TYPES)
> > +# define __ob_trap
> > +# define __ob_wrap
> > +#endif
>
> Should that have `CONFIG_*`? i.e.
>
>      !defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES)
>
> In addition, since this depends on a `CONFIG_`, with the current setup
> we would put them elsewhere instead of `compiler_attributes.h` until
> they are promoted to be "unconditional" (i.e. without the compiler
> flag):
>
>      * Any other "attributes" (i.e. those that depend on a configuration =
option,
>      * on a compiler, on an architecture, on plugins, on other attributes=
...)
>      * should be defined elsewhere (e.g. compiler_types.h or compiler-*.h=
).
>      * The intention is to keep this file as simple as possible, as well =
as
>      * compiler- and version-agnostic (e.g. avoiding GCC_VERSION checks).
>
> However, thinking about it, why is the config needed?
>
> i.e. if the compiler is not passed that flag, shouldn't the
> `__has_attribute` simply return false?
>
> Also, I am a bit confused -- does the compiler flag automatically
> recognize the names like `__ob_trap`? i.e. I see the docs mention
> using the attribute,
>
>     typedef unsigned int __attribute__((overflow_behavior(trap))) safe_ui=
nt;
>     typedef unsigned int __attribute__((overflow_behavior(wrap))) wrappin=
g_uint;
>
> But then we don't actually use it?

__ob_trap and __ob_wrap are defined by the compiler.

There are some examples within the documentation additions of this patch.

Kees, is it possible to make it more clear about what we expect of
kernel developers in terms of style? Should they use keyword
spellings? attribute spellings? only use custom types?

>
> Or should this just be like the rest of the attributes, i.e. we
> actually define them here?
>
> Thanks!
>
> Cheers,
> Miguel

Justin
