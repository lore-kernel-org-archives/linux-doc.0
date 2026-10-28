Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180983;
	b=czQfvxrITwSncguY6SmdFuT7Mja/usHGhmGuXpg/OfnRqJbLFGXNI6FvGn6/giLJs5rM
	 FaErXYiXOdTh1cnW388jRrxI//oKcGk4XGWM3p6Ih6syhy0tIDWP46/gVkgi1V82iluSy
	 bxoKARbb3kM/pvRxVmx9vrmdO0FtwxDnCbBUz2nszg9HYeVjAQ2/LMc4AO2DLF7QF+dNI
	 GeEnKyER8CRZsewyh1RvUZUpGBuzwdwDki1qY21p6rNgdf5NaK4cE/bkMFkfh89dy1oUd
	 aWFn6b1rnun6cHOsMcfOxwk4aJNCd7rSencHGkzYFlN2vnJwPJ9GY8PAISSiU69RvsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
	b=sivogUljy0Qc4hr+xQAGyb8fw7xlokKdq+UxO3UjRDfVArvyiU5YeBGhgKWM0yfiLtRF
	 l7YBzKNABN8bv8YlWsMuhvUd/Dpbs6g6AQFrc5d5WblHqvqro51eCIfpNXw9GTJ2UjMng
	 3Mi0GPeHVqAqEEc8Tv9yybvXSaSn2wXHiZkvAGL/aSJUq+qFZ6fBVxG48MRRrc0l6nbXs
	 JtMGeIOZdbCU+qQjl4GCVl0t+EtYBTDgD1OsT6ecwu0eHYE2sGhKqsSXD9gy9r7a4wra/
	 0LAF5Cpt+Yk/6BR4IIXfWjcI1sjGuaE57+7sO9+6aNaXGKUNP7f5T6emVnqR9iyLn0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDWonstv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE48606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE48606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDWonstv
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c43373ae89aso99468966b.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180981; cv=none;
        d=google.com; s=arc-20260327;
        b=q2ydgfHubowZMeAOJL6iaBPrYPHo4YkzLzEjiHi3eBJHf+sisML5tiDIwrHMfiopGe
         Mdc2e95FUaNIcuiKzEhoIWVJnJnLw2DE9uSmVN6JiLywzdDzsD2zWhJ7Unvzo2SDtRzw
         ehaLUDg32siV1LQ5Mu85s6bVll94bRTSVizKPbiRTnCOIA1hLHwL0HDYcJ3GTb0R094J
         yzwWT8FGgRGnukqgsEJ+w8tmtXKBbj9wR7VfoobqSqddy8xhIzBhZUVpVFzg9Xm8xOOD
         tzB9FdSz9kuOIe/lzE4EWw0XjZR/sc8EAeFqglD3/5zgQyOuQ3uFw+7dW4YuB7pSL3Fd
         9j/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=aTKa5YNVXWYms0Ln8RtBs6FucS9E2TPZ3b/v0dClpEA=;
        b=ZlHxVUyAlKmqcx8RKUvJwvSTncH4KMkYFYATIq4Fln281NVgQVNlhXwfVnyVaveJ9m
         0nq/DRRWNywZgfbp1SsF8JUJomLYR1++rVuKPizAOWhoxVqjcr+GGt3SVUbu3+s0RQsV
         uGVt+n/uGooYtPc4c7fHTZS33Bd+S8J7th+m0cji7PYcWD2GYibkmG7xY8yldvQ7TQFA
         6rBOCrfGlZ/4Xa6e1ZLdnDi8xsAaDm1hHOPRHQOr9JgbWbgeNNnekXKomuivu63Csqr/
         dQyQm1VUKemNWkPuhG+trbpiZCkIEYQwJgJslj72aI20lj7wfyGzL1fFNR8LJoROPFdN
         GyDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180981; x=1793785781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=HDWonstvPcPLttzddfVvr3FgZgIj3VTyvAyBQZO+i5zbi2rECmhSDB1AdWtfuODuhy
         zbThFOJ/JjrdUK/lT1BtY5Mp+LgVPMkR4Qmb04x1Avh2AVbEsATe5lvudS7x0SEorpMy
         ReQIkPvkTLZqXSyJPrV9ZolsJmrPn6NOA+iUBn1Z0OyokcF0SAk+CxO33y5zGnKio9Tv
         cuJUT4+A+kWSsZ5MWECBo71XMwQC85PCyclaPunzfOsIAqOKjt00RM2xS3RmVMACwQll
         Lmk0EP+6mdeww5gNkgsAXctSQmF9/qTytHXp9TBcuVFEHzvtb+Mji/sDVnTmpnhvMOOJ
         3Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180981; x=1793785781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=mwID/KYXCSc75XM9FyNbowEgi7tnQg1ef+XgETNbLP97MEOZn30C63b2W0YkG7d53n
         +eg0La0Ehu1ywvG90/AktY1Su+FyFKLVJ2Lc2DKJzftRHPTwmFfuv9zsKU7KNcQHwNZl
         SLiNJyLnwf3dWAfm/tlYBGJkaLa5aMQH/0YImaqq/KyIghn/Uk5ig500jDoXHuNzH6qL
         X+LLruPtZb138t7aqyUQ/JRZQjrb58XYAoW4/GcD10FOLGka/mtMJJtt/xxkrJbVNuiV
         NJutepZJNiKklDxlCV+bw+MsMTm3EQpWe/TzLkLqag7TYXiBApop0LmSdkmjT3ElPARj
         NTgg==
X-Forwarded-Encrypted: i=1; AKwUvBzHw994wcLbIBBCvtflQwNQiXCF54L99hIXTKX7pNb27uocOLL2ADcAmPgA5s2zTgryvyCaPGDNhEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd3E7Mk2KHT2BB/RmIyNm29C1WayCwKEopYDVGIuLTSK4I5p4N
	xs17onUQO7JcT4GnldhWdKY6Bru/dJNhc0arNy9JkAzpwWX4JSb2YV0UC8Dw6/a7WU5l2jWtteo
	+XskJjGyktIglwgnwnbHVV9QiyQJyyvg=
X-Gm-Gg: AYBFou3yvWBdvey/VyBZZ8024tDAuTgPfuK5K5WSqrv7YtHIl2bYqwWsIJm6FjyaTq1
	wDdpfm4FCoLwjnGsREAC8vthPTCz/zNr8GNItvR9UOP2xiM1sx5TFGFCYtdEieLONSNX/qgiMD1
	OUvfw0gBBW5mKql/Hnsd0lUzp2QzWoUJlioxOeXGEF/dDjaU8zcruL0k1c2S8iGK3Auh5x8luLg
	pJz+Ik2lAdIsyEXhd/ULTKM9s5MlFsFZt5uORyBoi1htHBk5nLQFWNk3Ir04WsoHs0mrih0tO94
	Yy58vQcmq4XWOjQip3hoYbeFA/7b5TULYiHrRVYz1xvIx3+Fo2GjFL1alqz9pOmtQLIVRFye9hE
	6RnqLL/N+Y6B1TpuQfo544cb0DeNKPItaXXRrs6z73LEMyLLi/11m/fZjGg/Jw42pgRkGYon0bM
	/0i+46nzeW/gRF7VFj4k2kGLhIs6OCvjwDLTNdlM31K3CY+ZknwuL/ALLWe5klvUKjoCN0H1Oz8
	Bpl+m9YT0iU+gCHt0jzzLMkti0=
X-Received: by 2002:a17:907:d48d:b0:c42:82ac:b6a9 with SMTP id
 a640c23a62f3a-c49bdf7de97mr167322666b.29.1793180980909; Wed, 28 Oct 2026
 02:49:40 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:04 +0200
X-Gm-Features: AclHuK-kwXGKz5n7QFXQ4iO49tQbUX582-rj9xJLuSYR3NDY9XFvg2hsu7UGHjc
Message-ID: <CAHp75Ve71BfcWr++PfQPiOc=OURNn1-cdJey=M1xBVCb0HhHQw@mail.gmail.com>
Subject: Re: [PATCH 08/10] leds: pwm: Switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
