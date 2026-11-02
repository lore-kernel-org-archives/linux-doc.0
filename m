Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637037;
	b=M+QMGaVLhZ78wsSUvgu2if9jb0r2yTNusi3QoRvQQ2LQYt1SRCNDg4CnKJD8Qg2YA7pJ
	 Puw0XF7N9i2dFXZQHOeoXy712C58w1M8jfGozRZhvLAQAC4K4kxLySY6M7SRylz5iP0sE
	 adeS3NvVWmPXah5v5h7OA9GqqfoTYttrmyUVuZe3vuQnyruPjLPK94dK2TQ+ldR1yQIum
	 fiU8cfTgw5soNrguHvsQNBdkwHMf21NMkU522KbWd+ilWFlbdLkR8/Y5WzbLnHHRkDrnt
	 sWhYnKw6J9NmWFf5D/SjRoc0LrFoY/Fam/4d5KmdUP9tJQDA9TYXjR/4OR2D6XStqoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637037;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=tQ/DNk7a1iTmjw2NtKHat2WmkFC7lCI9EiNUytx5K+U=;
	b=hRBFLPULmdmCOTtmjJNGNxwqJ6YfA5mWnDMZZ7sX5LFcyOMWigTn51xgtwLCFAYZpC9F
	 42x5EnZbTKJ52e3U9lHh/DipQno9oMQFBxztBxg/QcvocbNLxhoSPski6qggwX1zKzg7X
	 rdcK726KLTsW6RuJcac6RQRmOd6yItbzEIXUdDXfl6Bi7qi3l11bqeQJwHu4XwYPwgX+k
	 ZWOXJXN6nGObFYo8ri7LxNAXhU2EqulKO5ux6+uZH2aMbT55vznnPWcZcIDpvAZBMlF0T
	 7Y2fIsN1NDehEJQtn8BEZBB/VJQRm3YzLGKPn9vi3pS9l3MkNCrtStAD8z+xXt09syA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11126072C5C
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 16:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11126072C5C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c322cbc998so641925137.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 08:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637036; x=1794241836;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ/DNk7a1iTmjw2NtKHat2WmkFC7lCI9EiNUytx5K+U=;
        b=r23rOD8P9zcN6y8G6CAzAX2Ol6Ave4tjPRPArtvgqKK9V/jXzuckLivq/2ZRd0AYNy
         49/zBOTjo+TRuLS/8SUVANht1ZbkgV7LvKpkC1NSY3LCSp7udihOJXf1YLyUuzxlVA9m
         P4of4UNga10D1LrBDekrNSPYRtTapBGNHd1mcwlZmknE2qYA5QkMG0qFaIU5GxRdVkrm
         RPakbpMyjPM5LOzE+cdL+/OlYXn6X1smc91fYmqhzMQPHYxc8gghls/19cvgNWScW6VJ
         RxeOeK+aKOvGlVDDB7lxg0N9CTaKYuH2uSeqJ1uoHXuHwRp4m92aFWA2qxHZ3LqdHVQJ
         EYwg==
X-Forwarded-Encrypted: i=1; AKwUvBzh+TxgcSRQmGtp8iWRjuhC1nSD6rQscx4PuFcgS9GTgSUk+UX+7GcZ4V6zPQtTOP3+00pPug2m8tE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/14c/fVQyz4ebMKmXfN+gOE4GNsifMEoalcL9b7wEqVms+ye27
	LqFIHYfkfPcvseCTq6oqTZlSRuWZqWeOyKoyEpXAPaGyC9F5SSHO67H6NBFeovNtXC4=
X-Gm-Gg: AYBFou03uJL+VhXV7LTWv3FjXIkRgCgeDNw/BiI2Kyp5HbVZiMGk8oQcf1JJllyI6Vu
	+Fqt0GfFajY456ZLMh2wOsEqNZs2KgCyu85/nOO1M5dv0neKPl5PIuqlM4913zPRFQqDQOEnBQ2
	3WwSPl7IPzqOpVZ/1BP4yBkBLkdkQUDdqWV6foJqxAr/jSkcH4gvHAsLq88UDZmCPF/RKX8VwbY
	WtLakYnGcydB5aT3B+LFBS3M/SJq/GyJm2zhF7n20kxWq8gUkBaV2HlJhu7HyAwu0oi08dZugVw
	r0B8VgxsJ/F1FwgAYuxNePfkZuxPfQOKaYFh2CXV2h1Bo/ht89qMba6RzXAQmkHAZsQrKAS8/82
	OhGFOzVPosRhe5+606wv+mWkrhn61efcHxUY9eJHf0uQSxCqSlyEr284gEPFGVgINKKcB4P48s4
	yz926fGIlDSuA41VfGm3h9UrbB5qjDgDzInRfk+H4UVuP+iD8VIhIC22tItK7ae5eefRn28Hl7T
	1l6J2x9xZYQAF5Y0PCQXoXRddAkdYQqbR3jfHEQMgEG07GahU+xNKBxSTcn/F6ju4gNWkOmP3/S
	pF7tO+BuEydxcaxn0wgF0KWyHVFwJAW94LTULpsxmgrU1lXyg2+eoZ2OU8Qa3jnbAA==
X-Received: by 2002:a05:6102:6881:b0:7cb:288a:b678 with SMTP id ada2fe7eead31-7d0726b4e2fmr4074733137.19.1793637035699;
        Mon, 02 Nov 2026 08:30:35 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee509f58sm12189010241.12.2026.11.02.08.30.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:30:35 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso232607241.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 08:30:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy0Zw0wA98KriUOModgopgq9S13rjQ9bds1sLopJ/iZtqNpXZV/EAnSfIQ3nEx2sDTFv01Aeqc0n1g=@vger.kernel.org
X-Received: by 2002:a05:6102:15a2:b0:7cc:776:6c5c with SMTP id
 ada2fe7eead31-7d07261533cmr4465421137.7.1793636702714; Mon, 02 Nov 2026
 08:25:02 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin> <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net> <20261102150535.6c5689f6@pumpkin>
In-Reply-To: <20261102150535.6c5689f6@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:24:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
X-Gm-Features: AclHuK-8i5UubVSnw4SQFIo1lFtZYZ1lQPWaRR8ZSWJrkN6Qpqf7rWpkXGAuxvE
Message-ID: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 16:49, David Laight <david.laight.linux@gmail.com> wrote:
> On Mon, 02 Nov 2026 07:34:37 -0700
> Jonathan Corbet <corbet@lwn.net> wrote:
> > "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
> > > So it occurred to me that it might be actually better to stop sending
> > > messages directly to LKML subscribers and only make it available for
> > > download somewhere and as a Lore archive.
> > >
> > > Is there really anyone depending on receiving all of the LKML traffic every day?
> >
> > * raises hand
> >
> > Some of us crazy people really do depend on it, yes.
>
> I certainly scan it.
> It is also useful to have an archived local copy that can be searched.

Indeed. Sorry to say that, but Gmail web interface search is still
much more effective than lore web interface search.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
