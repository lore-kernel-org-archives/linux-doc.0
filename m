Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8883A0E81
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533752; cv=none; b=YlrBxtl9vtWDqEcHSp8jO5lAwj4QQhiIsOzFetwx5mBlot5YSh3TkytI4aAMY8eKdx6Cgx83avuRGGt0S/gnDih7zf8dDRT3f7NI0wqKxJJfpWHnAysOxIhvqrrnkql7ZK8oo2KAY0Y7Mcv9NuPp5rHbTyTvOYrkyGf5gsDwsls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533752; c=relaxed/simple;
	bh=sC5MVFkAnZyx3mcfwly5Dgffg29w2p4oxdEcKWACiJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVm6x22kIOXjGPblsGoEgo9viATlRPZyEZ6WFsMVnGCfrtpya+28rOjWuJlStelkAlf90GJD4qvjEYfHg9smDJWxYriP0KqVscs7P2DbYm1VE/7aD7DOrNfYvFsCMdacnH9Ri2AZgxWBY6IeqxqgZU9RvA/llO1RVwmfvFXdX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso1488352e0c.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 00:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533749; x=1778138549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp0BgOGCYFNvjRA6ZumN87R8na6iqe2i6++f2ynASA0=;
        b=ZxBrbZsGcj8O3aDRZvMBwHtwNTHXrBWdR6moSHH5rCjw1+FL4ajm9vpM6GQaJcLOzr
         bu1VKdaiteNfPb0stzzznDorpi1AkmMeJ0dm7ypgnMEtkCSTIBLas84K8Pj/ACPfUdOw
         o21ok7FuUUbyzWL6sB2/1zhuonUdDCg2ph3lZ/iu4wY/VzGqjTSKfiBfvdOWgLREFE9A
         Wu6vZWL4ng9ZHuNEgxZV+wh7NhOUBGxpTAiRxxhAQ660XcHRVUxXzGXPJ2CMnf96K8f9
         oLGIJA5c5QKkQKqtry6+OuRZh6KBTJQSeu03PPaOQZVcWghg5+o1aYQjYv4A1srpCoAh
         Y5FQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6oijU6KJ/5kpHCpVWkjvOSHqXcy+6hKWZc6PC+wHdxazRjXNXLQz0BebWiEBz3t0OLjiUNAHbjgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOrlAGkBJeTH8DcB8sGu9fo53GfXrXOCIi3KzIzy5x3irZNzc
	8ygsHEwiiCYqJTNA4EdyXVXWuLGh2uw8SIT/mP8ehp34b7eBDTwc6JPFVjCruQh0XEo=
X-Gm-Gg: AeBDietNB4m2Oj9Gke0fRYjHulqpW3XP77oxPLTAubBgQ+ThR1+w9vZ+qQAsXJjqnpy
	XOWDI4e3k4HARNiXyG2wW3L3JeHH0mjJRaFtQKKrahEHuFAimZBjAs03P1mEpaaPiK5kVd8FhzT
	om9VfC45iRvVInNsku8J9ubE/1ZAAzUmrhwKMPxladlW6DtGE12POl3xm3ipJj/iKNOt8EWCqRd
	M5GVBYfD4ehEwXlO43s2211jeouPEH7K7NSMSm0pzkrJhCK+djiZ+yvHaFnEpjDHprvQZ1MypRW
	LX5lAvc83hWc9JzOXmdiEmQOnyonFVp+tSOI5y/KpR/xMGvxLruXdPicswbdRZl7ycqGdDw/8O7
	IDpOl2zFbhY+WMB+ZkK9pJ8UWKDJuQl5/pMtPpPtwkETXA2+CE+Wj6/t0hPTZW/zdffo1NjqJVG
	EC/2UVN6O7TmU9ru5luDVhLvpt35Ako7WSCKWSq45ne+hR4wIBEWoVnSdDhTr4I3+tP3V8h5g=
X-Received: by 2002:a05:6102:5489:b0:602:8894:b76c with SMTP id ada2fe7eead31-62afd003f36mr325713137.5.1777533749325;
        Thu, 30 Apr 2026 00:22:29 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62984335909sm2531424137.8.2026.04.30.00.22.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:22:29 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-610f4cf6ddcso1199107137.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 00:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7Eh4lEE+I1IMrte1TMeh4T/xj6CP7UxYK7ZXnUrMorRPWoFJeELiP7jp1ImT3dR/ih99e4v6FkZo=@vger.kernel.org
X-Received: by 2002:a05:6102:5489:b0:607:4fe2:d33f with SMTP id
 ada2fe7eead31-62afe60dacdmr375755137.12.1777533748960; Thu, 30 Apr 2026
 00:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429145624.2948432-1-arnd@kernel.org> <20260429145624.2948432-2-arnd@kernel.org>
In-Reply-To: <20260429145624.2948432-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 09:22:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTafaCe+M5GEi-35=92eTJ++U+TfUShw-aV6uifnkgTw@mail.gmail.com>
X-Gm-Features: AVHnY4KVIcY2rUp9jOsemm_MlRAb0mCVWFgMZJUFzGZGfCliMz66tg3ZVORjG4o
Message-ID: <CAMuHMdUTafaCe+M5GEi-35=92eTJ++U+TfUShw-aV6uifnkgTw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] ne2k: fold drivers/net/Space.c into ne.c
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Borislav Petkov (AMD)" <bp@alien8.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 16:58, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> drivers/net/Space.c is the last remnant of the linux-2.4.x driver model
> that required each subsystem and device driver init function to be called
> from init/main.c explicitly, before the introduction of initcall levels.
>
> In linux-7.0, this was only used for a handful of ISA network drivers,
> with the ne2000 driver being the last one.
>
> Fold the code into ne.c directly, with minimal changes to preserve
> the existing command line parsing.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  Documentation/arch/m68k/kernel-options.rst    |  24 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

> --- a/Documentation/arch/m68k/kernel-options.rst
> +++ b/Documentation/arch/m68k/kernel-options.rst
> @@ -244,23 +244,7 @@ drive (with "root=").
>  3) General Device Options (Amiga and Atari)
>  ===========================================
>
> -3.1) ether=
> ------------
> -
> -:Syntax: ether=[<irq>[,<base_addr>[,<mem_start>[,<mem_end>]]]],<dev-name>
> -
> -<dev-name> is the name of a net driver, as specified in
> -drivers/net/Space.c in the Linux source. Most prominent are eth0, ...
> -eth3, sl0, ... sl3, ppp0, ..., ppp3, dummy, and lo.
> -
> -The non-ethernet drivers (sl, ppp, dummy, lo) obviously ignore the
> -settings by this options. Also, the existing ethernet drivers for
> -Linux/m68k (ariadne, a2065, hydra) don't use them because Zorro boards
> -are really Plug-'n-Play, so the "ether=" option is useless altogether
> -for Linux/m68k.
> -
> -
> -3.2) hd=
> +3.1) hd=

[...]

> -3.3) max_scsi_luns=
> +3.2) max_scsi_luns=

[...]

> -3.4) st=
> +3.3) st=

[...]

> -3.5) dmasound=
> +3.4) dmasound=

So that's why you should leave numbering to the tooling ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
