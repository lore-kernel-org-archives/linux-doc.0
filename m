Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871007;
	b=UjWkyaW/8nb5nRi/RsMTkvuwEtcMsVp8XXHGGwEd1MiIKCNztdefitJMbFd7d6nlx34L
	 t7YIGCgvHiDAF5QmzNT2d2XnER/Gp8oMi06s4G+/0G3I91dRGtePSg3dFjozvzYWVFrhQ
	 K7i410zrW9UmF17M8BUN3nMR1pOBm+y5HVtB75DkSDrsJ+6LOB9QLS4U/psgtnpCn5KOa
	 aN5BtoZMhqZzvNL/5MJInG+PEAaQW+JKSZ3QAfd3R/2Ctc5q5eX8tHeyEtAx69zvLxK2i
	 RSP9Rdnvc5JznGYifd2iLhYwBQIbVkal02rfNm1Gm+DylrzuRXUL6Fb6VgxZzYbc4Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871007;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KjEnga27/tEerSydp7sFOusMCGvk8cn4l0RbuqweDp0=;
	b=xSIC7p5Clhq45JnXoQVdZ5Mc6WCt+MsiEvsy6TBnJCrEwP8m7QmmWifrj08UUwbti0zZ
	 mPomMCcUCSDYgGgTghdLBnkFV0AmPUE9boaKgvyPZaS7K79u9KhkHyRTBxdzkcp2MWRym
	 W1OPkMyGMWl5iK8qgJv0PfiyFU1nWawPoS1C0SkpSERZM6OQ027+ru4HkQzAig7VlMYW3
	 GsG0Ly58q++YGh7NbUM4zLRIUYlBjfy5vqrzytL0emGUDt9ZoqQ/fBxD1hi1v9hISwtP2
	 OSu3GEQcjUjm9X/5wipO/uJfamagRtbC01x42TrNj5toG8FOgIxYrSBw8sWlwUdDyDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E8606A32C
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso872861241.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871006; x=1794475806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KjEnga27/tEerSydp7sFOusMCGvk8cn4l0RbuqweDp0=;
        b=Fuc/t66GDG7HknUZlwoWpTf0Sly76wvnb1H3OG7/mlC4UdYiJs5FPtdzkn/baIopwG
         ugLrwRXzSoz6jbBPYbpO+xiHfwndIrI+ymiKm/GOSi/ZgGmb0BTqPI05oNKqxpWsqt48
         nMeVuV+2AZOV8KlIYvwaUN3Dw1q+GTYHFzisBBhtsHfT4KZM1+TkewgReCE8Zt6h7ckt
         O3sO+tzGEQu8YudjcyI8Gci8hAegz1u5Ihyzb4hNlksG3cJm4oOaGBZC8aag32L/ZBJ4
         C9sfsfjiNCqfQMrpFvoSO/ZiuP8mEeaJGgDOiNa1EUnvpZsEOAeZ2KPWC92hiwJUAEBp
         CeJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7wm0tHQEs1ufj0FCX8T0e/7kjftMTQBOUK5LzT0H5xlqcaBSd9K6/s8aE7gz54rM/tvIN+wH32vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WXQnSqpQDO7JQgtzXsem/PUhqG3excIOQhQJsgJm3XgEek4zZ
	EEfgXRJp+bpkvsN16dtyOHQ3e/q41R+zXKxgIJFqKVd6so+/nV/vthSHUzLS65zy3T8=
X-Gm-Gg: AYBFou2jBF+v000bgApSvMr30tdv4P0tsnSW5YMbFvgXMKooJn3BGuohtjqxszxuoDM
	iU5GcEUC21Bs8zv5oztt6CbkR1pYmip2Xat81Asm59vg40+gox49HcvVNValSeMuQaquCtgubpU
	mH+vAIGgU68Ejuu17YMRpWoFGoUOVyB2vu1Mw+t5mTx3TysQulLImm/VQ1yKZ9Eve5UlhjbH7pd
	IW8G5qARLQ8VTeqSy0JFcq+Ho9nHpf3dE68ILs6cpfEOXfQnXVKKUKMfERSyGlejM3o80Uzt8qg
	jQgXkQk+ZxFKGnv8A9DVdBKiHuE1xkKM8EKcxIVU9PGpYlPhtR9ZgflprD/DK1fDxH5ZN259ZT7
	e7E7Xj03RLqEPuhM2wtJq84UhJgTmd/bajVjLG7Q2ULGlXfqF9nkC45jhe+m+tvom/TXYHC8Khe
	qHHEzw6RPcm/8JY9uiTFic9X0m7b8Tex0At1pN/myfJMhz4mIRJzeqOpSi9iy05f/hstbg67yxj
	ygD/taja/+311rYiMcqy2pXK5mkhQxyV2kAbKlC1awfkHsPldzcW2HQTmg1bn5d9OY8aF+tsqwa
	XvUaVt7N8JE5TR5TmowRmFcxrn8D9nQekxv4KA6M9EZZZ9PDoFX0ithCxu/JnsPxYA==
X-Received: by 2002:a05:6102:14a3:b0:7c3:1395:a090 with SMTP id ada2fe7eead31-7d0726152famr9970540137.6.1793871005913;
        Thu, 05 Nov 2026 01:30:05 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d212bsm4195367241.6.2026.11.05.01.30.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:30:05 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc365db987so1069151137.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:30:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBysYC1/3aJ2yVE+FfK51EsWht0VcGltIdqh9e//HozzVMMHNuFap8tSeR3wOQqvSHuKdhGGoNM4JQM=@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id
 ada2fe7eead31-7d072270da8mr8474506137.4.1793871005148; Thu, 05 Nov 2026
 01:30:05 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro> <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
In-Reply-To: <auxHASG78dTviSz8@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:29:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
X-Gm-Features: AclHuK_4i6VsNysO9pD5FTt2GxVJKeNES2GdHJyDSBq2xm_0fur_LQOmKg8OPSw
Message-ID: <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Reviewed-by even with the "# subpart" still appears in person's credits
> > and reviewing entire patch of 700 lines of diff code (like Frank's SPI
> > patch) is not the same as 10 diff codes for one driver.
>
> Yes, if you want to spoil that, you'd need to introduce
>
>         Partly-reviewed-by: ...
>
> or something.

With a parameter taking a percentage or number of files or lines,
to serve as input for the Big Statistics Calculation?

Doh...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
