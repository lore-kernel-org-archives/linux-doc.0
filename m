Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597088;
	b=opQYjZz64J37YQftw7Jr2VTlpjFdKQdYsHqlSDw8H+H+kGt0wB5U0v9kU2uIY8+rtv5w
	 nQ3uVfruPaUamqqEQoSbJoZ0ukUjYxHJlyjS5HcaSEyuInefaemDcyB1afRWmIB2M8XUd
	 3pS8NibXKqmFWbU1QVllTRmj6lf//VVgZJ41qsOkN5oud4eVTVx0uWCAHTRoLE3K2ZS2C
	 Ef8vq8yVtSWLqvH23p2ca8T8U8du6fLzipLcE6Q5qV8zDy9X4vFv+X43WnkdGcLku9P3A
	 fhxR/9pDDXLabaf6ZePFN5q3jTYVneLfzGje2YdSrCiAqgPYyxc4VOjTi+ENpKvnz5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597088;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mVMrsFYyFATOUmkvDDEKuZs5AfG2ET/j4dYuZDcY0kQ=;
	b=kpidPXl4SYjWd/guHjV8s4lz2aEptGBIfzaWaasDC8asrozLiWdbks7E+BCXT+MVaCwX
	 q7wk7xzQSTjl1NmPiXA+XMpUBuGaQDWOP5XQ6ZzsI8BvN/VKEACLHNGgCK2PK7YQAEyc2
	 lT5OjX31vJFu3AEulQzunm8jcjQiaZt8uBcQVZqmePbUlFv+YGceS6SN+5xhxQ0JnX/CE
	 J9h4v6DsQU9c0V5fp4HzqM1E1NnDo0ha9dX/aUhvUDetSVIA9LC4tKqBSiAtxjwARvBqF
	 IUxoOFz8soFACepw/LJKSZzyKxQ06jtFRr4jRTVcLmU4O+CU9DQyreeg7JxEdZ9QKMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF49606A323
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 08:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF49606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2b25786d9so2868725137.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 00:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597087; x=1796201887;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mVMrsFYyFATOUmkvDDEKuZs5AfG2ET/j4dYuZDcY0kQ=;
        b=xqFUTNTzj9RJebKITu8z2T0lSboa/0wWAZg5HVrwtb5EEC8jJnLKlgRD9my7O2dR7S
         FsLgSfB8VK3kGD2WXiymBMX7HQLbsb1JqorMpJvW4+p+sMFDKEYFc/cLEyYDM0ckvWKJ
         p8vRr8rD5zR+GIWUfbjDW6sFU7GUywg7XSNz5m5BLM2qF2tuiO7HIj+TZ28vSbeGwB5V
         5iA04doGSjkufJhbaHmmPd6YQF3CZ+ovLRZyOUfyHDYfdDgE9sxw2bUPMBirJLaV/+co
         MzW3r/mkTWfPhPzx6vu9v2q6sJoSujDso8W61F86vgWqyV0xTZEQBQBzu+SRUsKSNIPg
         uw8g==
X-Forwarded-Encrypted: i=1; AL+hErECZhPS6C9K1T+oroRL1qt7Je+2ldtj5HRhGjquQc3nAZpUYYJ+rhsZUMFb++EvHlXgQp2qKZ70bu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IupbNS5TIksLY0YwO5mfUplJBtmmCEX2g3yEwPmhBGT203Wt7
	Aqbu2CegzgTL5lFHbUQzxsGZ/pHlxvwhqMiZSIJkVWXJY2MO5ohOYBEmknwbajRv
X-Gm-Gg: AZFdTZe+AkjS0d4CzqCldBjLmw1Sj2JlBOiR9vW2ZoMz3S0+LzZAm5PUk0GBmTs/o3i
	eBrdMJ4gTFRxc6yKf2h6vurAzFYt9fxJq/DYsLmfDDgtEM1fesf4f2DbO/oK4q5haseqAa3Vu1W
	xTZ4zDbn0D+DtFKNIY2YOHNcNmZuy5eoT5a6kvy95Rd9kINLj8SA8+bhJFgUJUTnzzjt1w8YKVk
	0Oy3aGbciMoixKvVTI56BmnkxLD3ihPNSapvUKm2wgI8qhWJP95zBk6C/vGdo/kELWQjRqT0KlO
	6MCmt52Je/azG5WLqR0ufYKuqeWVyT40EHd8BS59MpDWtxH8mBxM5bo3xmzy13+/9JaLUTafoux
	nuGdcQ26xoHPFX0wVT4npMXk4H17ujDbYmv2PBVtVPp+y66ZAQCtGHIPVRh6k3O4Y2jULzQ6az4
	EyRsBr62OvJSkbfxOlkOVtzukGfw86OHCnE8tewlxZIbjpWnD05I+8ntFxMtASeahJ0d4hCVK1U
	krjVoSmzxMQRcTVHzmBwzcXvvXxh/YF3v7fFU9M16mbZbtXriK8iaSYapuvloEfXPhQBR6RYhDn
	7BxKpT3xtMLOeaAutJs9HN7/nMX3SWjZmaTmGVXzDfG0aLVD0hRXRtV+9A1YLnz8pn0=
X-Received: by 2002:a05:6102:5112:b0:7d2:d1e2:c218 with SMTP id ada2fe7eead31-7d72b364924mr9615489137.5.1795597086677;
        Wed, 25 Nov 2026 00:58:06 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d819sm18263737137.3.2026.11.25.00.58.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:58:06 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-990703f817fso2840292241.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 00:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFTZxbaADGHWYYYctkLwf7jZMmYMC/xAcb0YHtb2mgwvpNjA9+JwCybp+IpahReowndzwKxKZEiusw=@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:7cc:2bb7:1335 with SMTP id
 ada2fe7eead31-7d7395e01b0mr9404227137.33.1795597085866; Wed, 25 Nov 2026
 00:58:05 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179558805924.3383392.1456615917266025706.ref@yahoo.com> <179558805924.3383392.1456615917266025706@yahoo.com>
In-Reply-To: <179558805924.3383392.1456615917266025706@yahoo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 09:57:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNqQCKFnpxzHVaFM0deF0VdyJSvLzmy6JT46sRA9kJow@mail.gmail.com>
X-Gm-Features: Aa3M54psEuOxhCRq9HluWMLPt6_pP0Ynh7Bge75tt4s9aGAJoNbnstuvmOdPM-E
Message-ID: <CAMuHMdXNqQCKFnpxzHVaFM0deF0VdyJSvLzmy6JT46sRA9kJow@mail.gmail.com>
Subject: Re: [PATCH] agents: add a skill to determine the target tree of a change
To: Daniel Ramos <capitain_jack@yahoo.com>
Cc: Sasha Levin <sashal@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Wed, 25 Nov 2026 at 07:34, Daniel Ramos <capitain_jack@yahoo.com> wrote:
> From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
>
> Whether a change goes into the current release during its -rc weeks or
> waits for the next merge window is decided by hand, and being a fix is
> often taken as enough. Linus asked that new development and test cases
> be kept on a separate branch so that they can be merged during the merge
> window, and noted that fixes for subtle bugs that went unnoticed for a
> long time can themselves be buggy.
>
> Add a skill that sends the agent to the parts of 2.Process.rst,
> howto.rst and handling-regressions.rst that describe the cycle, and to
> the maintainer profiles of the changed files, and adds the checks agents
> tend to get wrong: reading where the cycle stands, using the kernel's
> meaning of a regression, keeping fixes for old bugs, new tests, cleanups
> and new development for the next merge window, splitting mixed changes,
> and counting every added line when judging a change sent during the -rc
> weeks. The skill proposes a target; the maintainer decides.
>
> Most of the skill points at existing documents. Keeping new tests on a
> separate branch for the merge window, and counting lines that are not
> built by default, come from Linus's mail and are not in Documentation/
> yet.
>
> Point the bug-fix procedure in coding-assistants.rst at the skill.
>
> Link: https://lore.kernel.org/r/CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com
> Link: https://lore.kernel.org/r/CAHk-=whOCnAwXz-FMRdQEDJQ+9b2YXh9M=GHgRay0o4cxSmPVg@mail.gmail.com
> Signed-off-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>

Thanks for your patch!

> --- /dev/null
> +++ b/agents/skills/target-tree/SKILL.md

[...]

All of this seems to apply to humans, too.
Either this duplicates existing general documentation, or fills in
gaps in general documentation.
So IMHO it does not belong under agents.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
