Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777572D9489
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112844; cv=none; b=RP2NFX6CynXwxmW3FCBb2QkRUTpo9WEEGsJUikGF/8+shGM7UJGrBGhUtY1QFTqxwminBlTuOvslRq6q0UtaZnyBxRUUqCUX9TqF8Yz1x0gD+L9pZyntauUqLcDfRzwaNoSM8f2bL4y9aeYqztBaI0IhWqKUqnhK6A5y5wPZXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112844; c=relaxed/simple;
	bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQyQBfSuBBWe7eGOrR3nEOHQo6rJlZTpQy133UYBhw3tvHJPViu6TKB317t/glm7VR9CaydEfiw9rZtheFeysq0H/aNsX1Kdviy4Ti+OSTm6SgXUdESUIKmaP38iQu1tCA7XzHyO36WuD+5cVBHhImArUFIIDfyF9DfTKW/o9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lGel9uE6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lGel9uE6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so4733193a91.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753112840; x=1753717640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
        b=lGel9uE6dWzOTnleIyLQtGlyYlWh6dF7t1oukHeuC+1hkNuhioIvlG/QOteOJ3vf3o
         OIp1l/Me7Ku+pnnJCcWLk8jDzPuTfPEe0D9GIGOjgYECbusz5B1UFk1rJRAz07NJuPb8
         AzYr7Z7Mcd3vzlN7SYL/izvhVPo2iXWyGIbOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753112840; x=1753717640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
        b=kwz4OXOFe1ngAI/PSaFoctSHkfcznKblSi49X+xq0DrGwnQQiNYt5mthbiEPCI5m9P
         Hz0Yyf+Y3Q3ZToZ4D0dnRP4VN4+w9XaaYQYcL9EFQ0WSaTRdkZv3qdr/Xz+9R+gfDAN4
         O42hQQA42CjAQY+nMjpfYYilIpd4kila1Jg2bRqWaUUrpVtB/YzMaVgJTP4ZxXUZ08Dw
         uwhPReITFfUOTyEaMsXUjRW96WoDnqojDJUl6c8U5P0jIvZd3Zt3uFpqaG75FYPMt2Uv
         919Z2hB2zKKNuv00eBiYMzUa0aJjxDCHorr6J09UJsWzbpVZWQNPnQuT1iDLGyW4Kl77
         Y+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4CXGEDE52pEdTIoef9nEINqK2563dQV6uMNMRKruvJrAhYC18vDIY6gzHTeezlmVsdzzLRyJebew=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlc8iVttju9P09hmiOB7nSkxxqoJ93IJlF9zzPJ5CR4ldspH0x
	TNa8iiJSuJKYrx64IimwyHpywEFsQJwqkPio67/9LZv9tIyyHXkUmue8+a1/cLtQPAqLI0GkW8a
	Acaw=
X-Gm-Gg: ASbGnctLGr0f7u1WqvF60RAFOMRUCFYbliOe4SkL5ZNteNPrUmu86rDCwj9gqx2B0BO
	ErTDhNBXYXDmcfRVa6co6a1LY/2WFyN1M5qWRXgBfbHFZLUptSYeJ9WF7iWww1Ha1CCwYfo/+MJ
	+I3CLSYuM5MzwMHM+b0xr+Ih6zMlJ7WhEPjCiereyVdQcDAoRI0ldttUk3+b/4BE9hTq5cms9Sw
	5gFU5OhVPG6qxjmhVWLEiBbgS9b+A2jIhqYBsz07+Yu0hl4RLIOVj/XJZqDTXH5lCI8HHb9W79P
	Z2RrYbBRtxwfMBGNMBbJ9jst2iifpERfDkQgMFbalo0ALbqhSvB4yFtRnbHXhc/BeU0YS6c4NVE
	Iq8XZUIUNrRaMKkInrU77FhpfemQ0RPkM8TaR0Ro5U5MBLFbA2/n9uyX3/7I+Iw==
X-Google-Smtp-Source: AGHT+IHctIyD6i2LvwVaw6xGvxp3nJ1r0fziUFPXJazaEBUMei+1WjLIa418c5ppgOCES2Ot8bk3Ig==
X-Received: by 2002:a17:90b:134f:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31c9f43748bmr30766617a91.28.1753112839814;
        Mon, 21 Jul 2025 08:47:19 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288071sm10135646a91.29.2025.07.21.08.47.13
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:47:15 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so4733051a91.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 08:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHLe2zxPQWkVRRN7wSE+mtgZfGsCnoMipzgE7j6kBAeAZ3emeZbXywvN79rJRlHoBza4xLRHxnVKQ=@vger.kernel.org
X-Received: by 2002:a17:90b:224c:b0:313:1769:eb49 with SMTP id
 98e67ed59e1d1-31c9f3c570emr31120725a91.8.1753112832610; Mon, 21 Jul 2025
 08:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com> <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
 <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt> <DBGPVFN5DTGU.5UTP35ALYS2Q@brighamcampbell.com>
 <73686985-27c4-4a4f-8b75-18df112367a7@tecnico.ulisboa.pt>
In-Reply-To: <73686985-27c4-4a4f-8b75-18df112367a7@tecnico.ulisboa.pt>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 08:46:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xbijn6j9Oxc88k3iq+wSF9bV76X6uw4ADWWxwR+q=o0w@mail.gmail.com>
X-Gm-Features: Ac12FXwZOEsXzYGcRcET3f78cuk2K33ah-CaSaDSzBavG_qBk9uaa3AvVsHX2XQ
Message-ID: <CAD=FV=Xbijn6j9Oxc88k3iq+wSF9bV76X6uw4ADWWxwR+q=o0w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Brigham Campbell <me@brighamcampbell.com>, tejasvipin76@gmail.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 20, 2025 at 4:19=E2=80=AFAM Diogo Ivo <diogo.ivo@tecnico.ulisbo=
a.pt> wrote:
>
> On 7/20/25 8:50 AM, Brigham Campbell wrote:
> > On Sat Jul 19, 2025 at 11:10 AM MDT, Diogo Ivo wrote:
> >>> nit: can just be this:
> >>>
> >>> struct mipi_dsi_multi_context dsi_ctx =3D {};
> >>
> >> I am not an expert here but I was under the impression that this is on=
ly
> >> valid with C23 while the kernel is written in C11. Is there something =
I
> >> am missing?
> >>
> >> Diogo
> >
> > You're right, C23 was the first standard to bless the usage of the empt=
y
> > initializer, ` =3D {};`, but if I'm right, it's been a GNU extension lo=
ng
> > before C11. At risk of being pedantic, I'll draw attention to line 580
> > of the kernel's root Makefile:
> >
> > KBUILD_CFLAGS +=3D -std=3Dgnu11
> >
> > The kernel is technically written in the GNU variant of C11, extensions
> > and all. In fact, the first patch of this series uses optional variadic
> > macro arguments, which aren't a part of any official C standard as far
> > as I'm aware.
> >
> > In any case, a simple grep for some forms of the empty initializer show=
s
> > usages all over the drm subsystem.
> >
> > That said, I don't know if GNU extensions are formally documented or
> > where one would look for that information. Importantly, I am by far the
> > junior as far as kernel coding is concerned. I yield to your experience
> > and I'm happy to change this initialization in v6 if that's best.
>
> I found the documentation here [1], and it does state regarding designate=
d
> initializers that "Omitted fields are implicitly initialized the same as =
for
> objects that have static storage duration." so I take it that no v6 is
> needed :)
>
> Diogo
>
> [1]:
> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html#Designated-Inits

Right. I think the key here is (as Brigham said) `git grep '=3D {}'`
shows countless hits in the kernel. :-) ...so we're not introducing
any new compiler requirement here with your patch. ;-)

-Doug
