Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF823AB87
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764676710; cv=none; b=pnoJsGfq0mUXfxSH+RmeeXYJLhcJWoiIec1CX2BZS4RSkq9kl4ETDqdokm2HHwE9Hx/edLZcsNRfu0sfxanLnNCdfkCUnQ2dg1NjJJrCIYvIkAOB38m+vQ6F5g03qo2SA9JMc6V6YuaHeivbLFH5VRO/PdmrKVLMGWR2k+AS3Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764676710; c=relaxed/simple;
	bh=aqJ8QQ108EairxO0mjkV704ci9F+Y3nmozCxfRFjaN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ac5gQ+qGIIoE0cuz0iHVNsUfjqnoqrRvKgBoM9bReXJ7ligb9d/jjVB71kl7/ju5wGYz4znnJzNwv1KyRbhEdB7UWJqoirpgdupNVixWQeDgACU7jFLrDAHnLWUrK16AxM9IScDaqt13gElTg4IKmbrEk14cVjGrtRF9HNKCvOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=SfWj6FCn; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="SfWj6FCn"
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A59BA3F66E
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764676706;
	bh=wE4iFlrbbk1WUEeR2XMt0sKwaH2iq1N4l7Rcs8CpkDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SfWj6FCnHwGPR2IwQ+0dVRSK8mkA9hMjn3dClwxGY+12xwJttfjRoO7AMxObJIthp
	 ULaFzzN1QxSfexeHlTlNj7IL6Aqhm0sQSKgH7qpoHlBIKkb+TNsfj8mod1boO22/lN
	 VdAT/NF0T5e999e1WnQGsKyFWeBcELOPtATCnL8A2HVR5ksacsM6M+1N7FjEj++BHy
	 B6FtDJ2y65idtFYibupM22loyRtDsXVDF66z5aQL4gXdVH93pUXRivfiwx+5oWAUaw
	 gwOs3XnmipvDdYOYzGahvAD+5/nHUVfFssPHMoroNeMEMJe3GTSOMGc1tDs0dSC9vZ
	 3iXDvg8okuW0gChjI6TBgUNpkWTgKQ7NStCk4WqzJrhvxl2lbxAIMZ0z3Lx8LyDxN3
	 I16Yf8o6AfDPQHBImVT2u12KaB7nc254H6h+VcW/ZcbrA7P3ycpVYriZ/SAypcVEIy
	 SaKUyLCz3po75yFLa0S7/x6A8cQbQRLsuT7m1i160LtoKhB16MqKtMWGbuuUQIFRHa
	 +ve8lTUlBYeU74HU0jN4btxLNs63DqFzgjIUAzmVjNMJ3WclnAVAjNk5WgW1R/cPI4
	 KQxVk8XtU3uK2/ehixaMELyirMiqcCS3k5+YlnhMsDuPX11usZmWnlud1YAvde/l0e
	 YFjKHCE8t9GAB0trYwQ7tN1k=
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9371a5de3f0so6104516241.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 03:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676705; x=1765281505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wE4iFlrbbk1WUEeR2XMt0sKwaH2iq1N4l7Rcs8CpkDk=;
        b=rau1dtTKQL7t3GaivrtcvywOvKie+zmdSGC8IYoWpG8groUaSvvoX+G7NycNiaa2mX
         Dpva34vJKasSoohUDrmk9pCzyeB6P/DXuLvne8xDUjPsqU37Ca4Jzg0SPkOpvFlzx7bF
         lGKHMapAnNJjX4NMggMcrDtREmbKRkKCAQ+9CZtPAr5CDEt+TMOMiLGEOI2BKK1cQjs8
         PHidYHiz2CxdvTdxoSrkxXN2bAw1pli9Uh8G2p0HGMmZbnzRcNeV0Cvrb5YCGGn70Tle
         i8adO6jinFjF9Hy8p3Q5YqxuL9mf0hKGd2QrOuXDiuyK7eXYQIVXYO414aRiRGur6pCT
         y3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaNiFaSfxvrVlRbKqj/VUmVq7qwggMxsAjrrqeDxx7+0sRLioWiCmNpLR/kT0tOCaA35aLcCgwGEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzju/InuAS+jfEnLRW/0ambZjnQRxG3xB8txWixmrwalO3iwM/y
	7mpuNhO5QgdB02r2Ag20qXWDHUgv2nEhw0pM9oSaCtjyBGUU++QQqXAEt8OSyee9KnLao4wa2h6
	NJO1RusQDw7159Fmos1bmfYtWV4Abi3UJHkxsZldan5oTHPnsGKmoiuIbI+Vac95eOscoT8TEjp
	cflphQ9pf9sfU3xTVrXaAr4Nftpqa8PvTDZB8QQOoyAJ2XsBqR/z5f
X-Gm-Gg: ASbGncvbBRwuBHSneWevHqzvTHnSSzHwn7e9pCFGm+dK5aFeqZXIUg3q1THrPjBYhaJ
	4IpFQy3J+qNnX+3om+J9OjMYszKjxkJSzTtBLjygExqfT0eo8mbpDy9slvB6KNbopSOOIs5wsZb
	WeoUYGOaAybr1e2Fjt/gGZQ5uqjNcZzU6v1KNZltPsBsFzfzp+ye5DI0br6Hv9eyqiJgVMdI818
	QvqqWIaCH5RJ9MimLK4JOrM
X-Received: by 2002:a05:6102:3a09:b0:5d7:de28:5618 with SMTP id ada2fe7eead31-5e1de008ce1mr16378927137.5.1764676705639;
        Tue, 02 Dec 2025 03:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBaYkvJgVhOjbuJBPmDQs8MvVZQEgoTPFSuk8ULdZ82NbPlzEAqVRg2q3Z8VxvIvMd4dXxdDztwWZnM1d8qcA=
X-Received: by 2002:a05:6102:3a09:b0:5d7:de28:5618 with SMTP id
 ada2fe7eead31-5e1de008ce1mr16378913137.5.1764676705376; Tue, 02 Dec 2025
 03:58:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
 <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com> <aS2lBui4JSe3uI3m@tycho.pizza>
In-Reply-To: <aS2lBui4JSe3uI3m@tycho.pizza>
From: Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date: Tue, 2 Dec 2025 12:58:14 +0100
X-Gm-Features: AWmQ_bnBQJZ99tuA2Ffa9OYl69H9PpHkC8YAQFqvXrgHVYkOgMb8ljujAUIP7Ug
Message-ID: <CAEivzxeMG=+_KmmvksZtgeVePcXPx7SO=fDekh5fU=F0rHvdGQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] seccomp: prepare seccomp_run_filters() to support
 more than one listener
To: Tycho Andersen <tycho@kernel.org>
Cc: kees@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 3:24=E2=80=AFPM Tycho Andersen <tycho@kernel.org> wr=
ote:
>
> On Mon, Dec 01, 2025 at 01:23:59PM +0100, Alexander Mikhalitsyn wrote:
> > +/**
> > + * struct seccomp_filter_matches - container for seccomp filter match =
results
> > + *
> > + * @n: A number of filters matched.
> > + * @filters: An array of (struct seccomp_filter) pointers.
> > + *        Holds pointers to filters that matched during evaluation.
> > + *        A first one in the array is the one with the least permissiv=
e
> > + *        action result.
> > + *
> > + * If final action result is less (or more) permissive than SECCOMP_RE=
T_USER_NOTIF,
> > + * only the most restrictive filter is stored in the array's first ele=
ment.
> > + * If final action result is SECCOMP_RET_USER_NOTIF, we need to track
> > + * all filters that resulted in the same action to support multiple li=
steners
> > + * in seccomp tree.
> > + */
> > +struct seccomp_filter_matches {
> > +     unsigned char n;
> > +     struct seccomp_filter *filters[MAX_LISTENERS_PER_PATH];
>
> Maybe a __counted_by() for this?

I thought that __counted_by() only makes sense for flex arrays, while
in this case we have a static array.

Kind regards,
Alex

>
> Tycho
