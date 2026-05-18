Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6A93C2788
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088639; cv=none; b=niCE/QI0sxtSb2T0arJnDeFUrfwieQ+9o2r97IJXPS8jsVknYQgMhbfs9AEUa93681KPK5IKSI8FZ+c6piyCsqgRw5O3sB4KLg90XK7Hm+ZxBQtgNquhqgwG8CqMsMVpOoJpsBAQ02tBShaqmuMmaTpM6UWrh7ZkQX+9lAtT2j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088639; c=relaxed/simple;
	bh=cyWuVwLRQLpT7xz29PUQuHjEYuN+4ZC70xzc/efPtS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVEtF06jSlyjHMnpRne2bXsHLuAKW2eltrwq+oWTuNefPBuHKifoKb2YF7go2VBn9t+tZWjl7SwlhsFpro8pX/CNyqsqIJEYxuh8kIqzufydtcpb0IoqRhYfI72B0d5DGOXKx/z7MymXF9TyJbD1f9EEUEOUFl2o3c5IxzgpobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-834f1075805so1494279b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 00:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088637; x=1779693437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIGjfBvuROVNG6/dQkUTLDceab7IJyeycExzDXofB30=;
        b=Msf6iPhTGagxQJvBLa1CxYm/YEcUdLBcfhDHISucNEsY6zKtYU+u1RBanOgYMsO/qs
         jZ3ZbRkc+uo67lrFHp7IROhoX80NDzB9+n/OdOl2dTxgXsJa9FKlQDjPHtxGFYv++Ise
         ggQf3jmn0AoFpULhi6YWthgdEa6zHuYGqjKnDsXN2y+RLwPJbmblaeKPJq6K/4K0MoqS
         uj9yghqMc0cJhBRIXlc4y//m/DeC6M8LTLVG/GeJ7+4J9njXg1AgLI7jwqDuvM4R9eqU
         uzv1Md7qIxBOEq1DbocsZDi8M9Il5R5c1yR/7fbJx1n35S0D8sZb2UdY3GIfMrsdFkQE
         14VQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YobOZKCLEtM0z+qoxUwrPMFAaKH+NeP+NCQJZzPzOMXopHab/datsds8kgnAcBtKi8/gwNt0h7ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX9ieKyQWIbXbo8kDUXs05yXeQpjBhXLiFQI+5DlUZfm1yQHc7
	KRRfnVC6ARkCU2IBBzN+PwhAP7G6bHSf+maI/9EUt/cUk5qFjlGzWvfOXsic37p/
X-Gm-Gg: Acq92OGb7xKPMaqwTsiEVV89PvJk9qCFuVnYw1SPh/1J7b4q8T1YgD2hiONJ8H/jj64
	ppdPvY3UrDdgP5W2kBbM2mdjBlfPa37V7mObEUG5jdTVl9Xh2fIG62vRchw0Q1X9dBa+DGPmcdp
	sMIzIMz/yW9543Uf6F6evJ9N8y+Qwb+lswnyKRXi80RTckdSl3OVY4hJT3NXUlqstL0vgCLThjY
	B7LDluengeYicrHvDIdiyqcukypyCLagxQwTaaUv4wckCRZ+lHDHQPKP23sHBYyakvbWsVcCqXi
	um9D2PMycqKvypK0gqWDgUKO7hzV2LT4upLj2/DGxSAj2SRWYAx7VtO0gRj7REI5oRiV9fFnE9j
	Pz3KteUZLvAM73iQGfpBjySw0outYukQgWYPBN2OZbRLKlTuphAhantm4QBQAw+s//DlA2yTWPb
	oi6tRzT022UiHaDsxWl4QjSX8PQi2whHHh8fBebE6f7D1yG2ojwbwVH6C9vGdKT86pjXy70wxOz
	Uc=
X-Received: by 2002:aa7:8895:0:b0:82c:2555:b9b2 with SMTP id d2e1a72fcca58-83f33c4d954mr14629840b3a.10.1779088637123;
        Mon, 18 May 2026 00:17:17 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm16634317b3a.53.2026.05.18.00.17.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:17:16 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba4efedbeaso14280115ad.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 00:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/cZC9S8dyZ5oiouF5D1J51A9OAw0n691dMwBVqahNa+SMgz80h/kmkAef2D47lFRKEs+OVLRwGAEc=@vger.kernel.org
X-Received: by 2002:a05:6102:6886:b0:631:4580:6a3f with SMTP id
 ada2fe7eead31-63a3d6298dfmr6188657137.7.1779088275779; Mon, 18 May 2026
 00:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514162652.107714-2-manuelebner@mailbox.org> <202605140931.913048A68B@keescook>
 <20260516152819.14597A76-hca@linux.ibm.com> <20260516173524.498984d0@pumpkin>
In-Reply-To: <20260516173524.498984d0@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:11:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
X-Gm-Features: AVHnY4IbEzWMc0omNdrAHsjpA1BjY_2vqo_EEYOf8Iom3gzLQpq_q79rQP695-g
Message-ID: <CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
To: David Laight <david.laight.linux@gmail.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Kees Cook <kees@kernel.org>, 
	Manuel Ebner <manuelebner@mailbox.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sat, 16 May 2026 at 18:35, David Laight <david.laight.linux@gmail.com> wrote:
> On Sat, 16 May 2026 17:28:19 +0200
> Heiko Carstens <hca@linux.ibm.com> wrote:
>
> > On Thu, May 14, 2026 at 09:31:46AM -0700, Kees Cook wrote:
> > > On Thu, May 14, 2026 at 06:26:53PM +0200, Manuel Ebner wrote:
> > > > add strlcat and alternatives
> > > >
> > > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > > > ---
> > > >  Documentation/process/deprecated.rst | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > > > index fed56864d036..06e802f4bbfd 100644
> > > > --- a/Documentation/process/deprecated.rst
> > > > +++ b/Documentation/process/deprecated.rst
> > > > @@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
> > > >  attribute to avoid future compiler warnings. For cases still needing
> > > >  NUL-padding, strtomem_pad() can be used.
> > > >
> > > > +strlcat()
> > > > +---------
> > > > +strlcat() must re-scan the destination string from the beginning on each
> > > > +call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
> > > > +snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
> > > > +of the arguments needs to be taken care off.
> > > > +
> > >
> > > How about just:
> > >
> > > strlcat() must re-scan the destination string from the beginning on each
> > > call (O(n^2) behavior). Use the seq_buf API or similar instead.
> >
> > seq_buf API for appending something to e.g. boot_command_line seems to be odd,
> > since boot_command_line is usually "just there" (depending on architecture and
> > boot loader).
>
> Indeed, but ISTR that code uses strcat() a lot of the time.
> The lengths are all known, so memcpy() can be used.
>
> I don't really see why strlcat() should be deprecated.
> Clearly there are many cases where there are better ways to do things.

https://elixir.bootlin.com/linux/v7.0.8/source/include/linux/fortify-string.h#L346
already says "Do not use this function. [...] Prefer building the
 * string with formatting, via scnprintf(), seq_buf, or similar.".

> The only problem with strlcat() is that it returns the 'required length'.
> So there are some broken uses.
> - fs/nfs/flexfilelayout/flexfilelayout.c
> - lib/kunit/string-stream.c (although the preceding vsnprintf() looks like the actual bug).
> There is also some very strange code in security/selinus/ima.c - but it may be ok.
>
> In reality the return value of strlcat() isn't really much worse that that
> of snprintf().

So we need strscat()? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
