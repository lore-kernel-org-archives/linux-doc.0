Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084191;
	b=ZPcqGQoyb6VcWmtE697Kwet4jujNSpNUhTTjTcg7YBV+WKA3QpfZICBFH6zesvyRO4pP
	 jKfKj4QQU9+NUsEouKtrSsU+7R32auC75OWb3y9accg79nRtR4FQeF6A14+Jm276sTWZQ
	 ZezFeOxqWMKaRbRfwg1vRmyraUD1niOFuQ8IL0UJqsQSnBoSscrurs+nPgAW+D9Xf7NsJ
	 P+NOWPl3XNX8rrPmJS/8kHlI8L75CDVIpqlXZOiAYhOvygY7rHzPRC2ZHJ1RgyKd3tlK9
	 jEVB3ApmIBy7vsR003d5C+GF1xros4fFwMzYxLiGISpLtYpzsTIpKeDG8ik2l4m9GpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084191;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=0WpfOI5xeWJOkMh3kbT3N5kNiSFKYr6MVMM+doisFww=;
	b=z/Q3hOOHlGtvll35qIh3ycmHkg24c5ZZPvcXWhaS/eWzChfpI254s1JUKZxViGYaajfD
	 vZHDXtsQ7AnSL8t8SJqIwBvWpzrtgaBoTCMaHuDFDH3B37VqRlGfIJzqX+Jy3CP9vUX8+
	 HIYfOg5MnELVEy0MTjWMjH9XyYkD3IaKZ2+2iFTLib02RlcM6fkqEXGELQFMOiqpwCSbV
	 U5eU7iH6qm3iqjL5sCR5iHXg52Vn1nv2hRvMZZFWPBPqswItBkrPYD1ZQZaX2WYOeSXUM
	 2DHpgbkzIksJ/Md7URK24ShPe6WEGqPiBERDRKQpZINSazvcOd43xCAwYV8ffVULOCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206E606A32A
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 10:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0206E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2da1667b2so1160820137.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 02:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084190; x=1795688990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WpfOI5xeWJOkMh3kbT3N5kNiSFKYr6MVMM+doisFww=;
        b=db0jQnPh0Ka0rOzKhEMXbdk5T6BjvD2zxRW8cwZYVilsC03X34P0Wc9oDKyL9Hohrq
         jefRozqrHb6tfkM7o+nxQjDlXc0ECIF2v2Eadenwu12hLlkuuptCGyjEPWEFrC14Dhyh
         pQyySccWtxGBf2C3rX6phb44Qxra3JTI2nz8V+I5ZIxStNK+FO1ZRT+HU1Ml+W3dZawT
         xD5L/MjWg//3PaS2bbUMsU5hd0PkLIpJahN951JJhYrJEFC/2+5EcbWyCowiqyodsUcy
         2XP0aF4EFNZtfEo28/Q0YrIKaGbFI1vkc6AQJDRO7uZbtMzAyNaioYpKSbpT/uXVHN6Q
         h11Q==
X-Forwarded-Encrypted: i=1; AL+hErHIIGOBLYiPXxUWNviE71RQ9/ni6xoYlnQz6IQhBCuqFf6Nl9JWKzQEoewyU0IRfNP/z6qCO+mr7eQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4dvO7lxqz1OiF3z0QYcQTKHz/6C+a7Xm/iokQwAVhyCv02Wa2
	Kk4IgRLdvqUpDB1nb3DsOE/v1Sxn20aLWoGTAnGwSYf5JQ9nLpxoxn4XgpQADHNw
X-Gm-Gg: AYBFou2PwHk1H/UeSVFPCXdn88+voAMaSUXQ8x5NcBH2ccIj+CJx0ZhbXPv5YDdono3
	gRjOnCAASWIhaTJ2pj5SiE9Fdq0MdO/9uu2RWREe8e7jWCFHeULr583H96hPCrB2mqGG8iaoll6
	j+j6RpoGUacPVE8xVgL1z49Upqnms7iepbA+R0tBZtLnQvERLcCB01CQE4zwEMHARxfPz+LP4JP
	/h4kAgyF9zU8/vdNdKFh5LGa0RDDEL4t4jH1PrYz263SoWvgzolvf2/i8GGTl3D70bsuqCLUlYH
	ydtCMbXWZ+Q8XkTX0qqLj6OOBDHkQQ3Yj91x3BJTpDCOpybqBK5LMug/r7d/vW3dvd1sORb4sKT
	qYCLX+FrMjaBfuXSkBSayxNTsvsNixLLDlr7iafz6e1n0MD9wTrQilahvuVzaemUVtd2bXr73ie
	eCJjHgCb+AzS9L5huM3Vlbg8MioB754LpW20NhpSjjWTim4YP+mBDbGZVjvmkAH8PRtUfeg/j3m
	RHwAhNaw6j6SC6iITMFq+Jo6Y9yi2GbxvUrQGphAgErKtuypixOYL2473OFNxfv6L2y4yeam23y
	9P05pKECl2lv5sbrExiN1rwZOjNxdIhemFj1vwGmWy7h9Qf6F3eg3XWhU3nsElu7LH8=
X-Received: by 2002:a05:6102:1499:b0:7d2:c786:5a95 with SMTP id ada2fe7eead31-7d6ba3bf996mr2407851137.13.1795084189965;
        Thu, 19 Nov 2026 02:29:49 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b914e10esm3870882137.3.2026.11.19.02.29.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:29:49 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso1098207241.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 02:29:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFgT28npTsPV5gr4RLnhV99X7pRufQzUjwIzqt0GXzGgoyq+b2EcLWv0yeQ0Sf9yhfCAGerl5ILSwA=@vger.kernel.org
X-Received: by 2002:a05:6102:5695:b0:7a6:85d6:84c3 with SMTP id
 ada2fe7eead31-7d6ba17d7b3mr2441645137.3.1795084189032; Thu, 19 Nov 2026
 02:29:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116200515.352387-1-sashal@kernel.org> <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
In-Reply-To: <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 11:29:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>
X-Gm-Features: Aa3M54oHwNvpgtGGkx_hv66KseZDPeTjivSHlg9HiVrcMy2kadRraoCGcLtBLg0
Message-ID: <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	David Hildenbrand <david@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 11:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 17/11/2026 10:27, Leon Romanovsky wrote:
> > Since you're already making changes in that area, could you add a sentence
> > asking reporters to provide the full dmesg stack trace?
>
> If so, then trimmed. We do not need all addresses and registers and the
> [time markers], but rather the calltrace from decode_stacktrace.sh.
> That's often review feedback, btw, people just paste huge bunch of dmesg
> without thinking what is useful there.

And full build logs, to prove their patch built fine:
https://lore.kernel.org/all/tencent_684DDE3E94F7C2470E5E02BF79AB1A1DB906@qq.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
