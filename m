Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663510;
	b=aTdmKHy1VD6TPsuORUD8vfjIK1dpSb8KwK3KARALWpaXkxdtC5KO93J/joRkcqJwdgMH
	 ucwQbkQjQpvrj45afSoxsj2b02keueVuoNW5M8J3Com3uuPHQC7hX8E2ouTOaahGjkvPM
	 Fjuf0Bv1+gzOLsQ2FzeDjoI7Cw8p31Fa7Oqg1EvzCinAs9i5gXhd3iWrvNuXfdo+2HNc8
	 fwBSJJPlJsxklwKghF5sGh7z1cviCVBLSsTJusw7BaTIozxJOCjhd1wulGXUnlh4it4ms
	 j77tplgtHTyuh6owR2DKjopaMslvSx9ra0qazfD0kAQ2NnTI9U5JDtGyUxW+cBHOVKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663510;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AmtBa+LxL4SvVmJcPn57Ipgp4NVdoxGD7DbFVBLBg0I=;
	b=17fPbtjhS3QcxXZD2/GQeu/UqAt/zu542jv7qZPkz0rm5bmIQOmYxPCUmCUtU426L4B0
	 R4XwKMJqkH9fyR5T28VdfXQpceefLF1XUGNxXJMZNSEUtf8JfsY3/wI8reTU7WpbShjkU
	 w8tpA7S9CFBDY7hWDDlZNgvBuatp/hB6i7G1Xgd5Stbv/1iSuPcxDnSKFPwLXxMz6FSQ6
	 Lgubf3WcjAHlNYjWlPbGyonotHbEs0CfrIwSV9DEnZuXtrs1MFNO/3Yl/5c12qSNjVeks
	 DcZYYzQV0ToNeRW3J/gBYFIxxqdVAwMiOwbag3YXvjDteE6ilPa2kZFV8MKqzuDfs2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E6606A31E
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 10:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so926750241.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 03:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663509; x=1793268309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AmtBa+LxL4SvVmJcPn57Ipgp4NVdoxGD7DbFVBLBg0I=;
        b=BfzXI218UxGL0gWXV2tKQlaiq1flgShbvNKQF7Q26oyW3PTa/2xcjMTIAOnhvsqrh7
         HbNBOR/1qMfbZBldmT/d8vYCo29BM+3TWgF3BNY8NMwY/WBGoZIYrt+1ABvCUv8Jx7yN
         GyXIibmk6Z9L8Kia8blS9qBPyD4kGBgXoXST4/UzikQY2Utw40bvpRkiEqCb5vx1PDAW
         at/nThsI3VGM2Ij0dsoSBnCLN9KdR7WKVZZAYXQyZ3La5F08l4N+PgBw+QtJoBfekMGv
         iX2bKP0SACuA8gHHvHLTYVUTKBzUOmL7qnhNyBsqfAooiEtlDXEDsl2HaXtw+kvPGaW8
         CsPg==
X-Forwarded-Encrypted: i=1; AKwUvBwpZU8MCZu16lL8O2VmtSudS9A84qA7o9fX7Y23kiwtEMIF3Sof7DpLjfrOLbfBjlCtHT7B23C21dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0A+AMcWHcpKqhHMXbQz97Mddj61CnxxjO14fybNNiMUA8p8aI
	6izEjGSa9Tap2bh0S/6LMTTUph4yC940CpxZZHAwnCZ7Sbk70e2ep9Pi5zen3YUZ
X-Gm-Gg: AYBFou3PeuDhTgz/YxAmtrYzFTD1JoYzfikPt7WjQsxbXmMBEEqIAJcNz0Z/Ms/y73b
	0mUyYXGwB8ESAT/6VK1WCD02trblQjdCEZ016IaxEDpkvdfkbgBzo4PCjZMu0iqmXETMTmwWIJY
	SKBOMnnnqKuGrsn4FLcDkhPzR7VmecQ/74y3cJqaI907YeUXB60Kdf+2Qowbx7u/JUfyurQGqRK
	jTUvgTCPcJ4Ov4bnmq8X1xNHLdRI6YCxJolQu9Z10OczEETCyXsmKdRnVhM0IiRuD1tTfU6i4Hx
	V55loKiH3wwvNnqBfzwKGkwx/bs5ykT4nSiPec8ubZA0Cg8lOWw+3l5peE9N8oH+WChJmr6yOo0
	7lGOTo1wvJ/VMxqEJPktnhE7Q+So8LMzJ723kJ2uA0BJ6/wAcyl7IRgjrcJXKrMYxXJaux2mcwK
	Kadge9QV19xWPYk8xGfAG/MgaULIjba2Q3aBHi2QUO2rFvG7maKSVef6TPG5ysWaP/LsMheFqj8
	VsJtBIq1ftQDNkxD4cc2jOdlty+qBRdtPu7z5TO3JchPivEfRUfTQYRXwnrLww2VpC48FPGnrfD
	F01LNVEU2vhJ1CSn/lRNl+P5UyLFc66gNSIUo2E=
X-Received: by 2002:a05:6102:4191:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7cc92715565mr2098695137.30.1792663509083;
        Thu, 22 Oct 2026 03:05:09 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d0e0ba56sm6026053241.1.2026.10.22.03.05.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:05:08 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so949685241.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 03:05:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzZzSWUQQoRGWew4Q+64s3+WlI+a+XeX2mTJAjRQFKCPZHDvYlgSbZYaKg4UR6lrvAidjYj2gBEqA=@vger.kernel.org
X-Received: by 2002:a05:6102:4410:b0:7cc:2946:7f80 with SMTP id
 ada2fe7eead31-7cc927441e4mr2229849137.35.1792663507671; Thu, 22 Oct 2026
 03:05:07 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020212235.1143086-1-ebiggers@kernel.org> <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <87y0br3zln.fsf@trenco.lwn.net> <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
In-Reply-To: <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 12:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
X-Gm-Features: AclHuK_CDyU6-9WYZXLSnQ7yP-CtCllBONPjh-ERk93EX-FDKMuOE4BuJWpX_k8
Message-ID: <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 21 Oct 2026 at 18:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/10/2026 16:19, Jonathan Corbet wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> writes:
> >
> >> For many of my contributions base is obvious and not needed to be
> >> explicitly defined. For all the patches I accept, answer is the same -
> >> base is either obvious or if not and patch does not apply, then the base
> >> does not matter.
> >>
> >> Requiring it is just bureaucracy without actual benefit.
> >>
> >> The only benefit would be if maintainer COULD change its base to apply
> >> some patch with odd base... but this cannot happen. Maintainer base is
> >> fixed - it's the HEAD of his development branch for given category of
> >> commits (e.g. DTS branch for SoC maintainers).
> >
> > I fairly routinely get docs patches that don't apply to docs-next; when
> > I'm in the mood, I'll try to figure what they *do* apply to, then
> > cherry-pick them over.  Base information would make that process easier,
> > and even automatable.
> >
>
> Some maintainers do that indeed and I propose not to. Every two months I
> see one of my or other folks around my area patch which is being changed
> in incorrect way between mailing list and Git. Change is done because:
>
> 1. Patch did not apply cleanly (a lot of simultaneous work, so base is
> obviously old the moment the maintainer applies such patch)
>
> 2. Maintainer tried to resolve that by applying to the correct base (so
> followed your process) and then did git rebase or cherry pick to his
> final development branch.
>
> 3. Maintainer is overloaded and has no time to investigate whether
> rebase/cherry-pick from above is truly correct, except building the
> code, so every two months result of such rebase is wrong.
>
> This is a real issue because it is very difficult to spot - your commit
> is applied, but you never verify whether is applied THE SAME way and
> maintainer thinks everything was applied cleanly.
>
> If (1) happens and patch does not apply, the solution is to ask the
> contributor to rebase.

This happens a lot in DTS-enablement patches: multiple people are
working on different devices for the same SoC/board, so half of their
patches insert new device nodes at the same conflicting location.
Perhaps we can teach to git how to handle DTS addition conflicts?

So your solution is that I apply one new patch every day and publish
the result, and ask all other N-1 series to be rebased? Obviously this
not only applies to queuing patches, but also to applying patches for
build/run testing during review?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
