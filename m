Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97503B47F3
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132352; cv=none; b=YD5HGVG0z6SHU+m/7i5mIyMES1tBKFuqYdfzty1lLU8V+pVAK4E7gZqDwBKRwQYV4gtCITgrQnPJatua/06n0+EZIB8iKphjd2rFrkNb1jsF4OffJGdl1Hpo0glEHl/ISV/RZp3ki30VwQhLNPjTJnT5RdJPti5HFAVKHCmXesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132352; c=relaxed/simple;
	bh=zlErMMR25SYOsUd3S/0AwpVYnof7u7gBjzWgLBfix9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdXuSCPNeQW58cJP4fZ073UW4DYaqE7Kwl6t4TlYt8JGBQcRsUwpIqiFCVHvuvD+lXG8Lje2o/a9cpwRk1lQDLHAwJiml9JmMWXx5S6C+waIgVbSj/poJc/FqSmwpiBcvrzEFz6XURLkCdzKZJHAgSAGwSMvVD0s0/OkgKx4z5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-969524c1aefso245950241.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132348; x=1787737148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
        b=e9kXgBCYekh9mR1slCNxLBBDGifrUIbfqViXHEjlXDxilU2BDZ9QR6C0tfnUyJiRJD
         fRkoJ8SO9l+cFulHUMOJybKphzDz/r8TcI2uHBtWK308OG2Nda2ivGdSy6xo2KPc/J0p
         ql78rUGj4VlYYshtRSVhxvQAysUOnoSh5VidvLQ2sip2bGbnDMoCfQidr2p45HoYbXY4
         m9Ib1E1TGrnZgA14mglCvvFismt7Wj2f+Pqf03kqFFXtBupR2QaFg6NATxtSj+2gAKGF
         13j3oy2G4F+7ZiA8uSExZ0+MlnatGYRP+6etq6NnFx4XpzK6EaNI1SUzbDm33UYMfttL
         YoDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWc3UMCkpm2E/pHM7GPcAIsKkbqY6QjmLg2UIZmSzPSsoiOgaoNt7OSYf34AqSD/fY4Ygq2NgzXBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qtL2oqXrQmOiz/szAIGiLLbmh3TNa6vUw7v2tFv4KgOe1Sgr
	3xvOCBrk6B3zqPgVwZqdRFseOdy1fA3Xq/tDirMITP9jgKiL0s5FO2jdHOpPxdYU8Fs=
X-Gm-Gg: AR+sD12plWCQI7Ew6nlX/l6BggTEFKdwPosmhMJ31dplU+bbkMaKEG0ECP5smdV/+XK
	EuYJWV8ISERI+EovQm4I7fLwphoe4RZQ7bJZMhO6OE+ENb6z9Lj1YAnUQ0Pk+KSNzB9Ko1g/n/Y
	EvachGIIi6rVwgliEW8uxREbPH89qo/rLM/rhwcHmK/P+/vkQuNZxpIYU3JqV6CC1ao8npv9WtO
	nYqw+o/tUXCT1+Fh+txib/3QneoqaqXEnA8k2XptV9ANVnRBUxYxJWqczQqYbNFJ3hLpk9WVu6r
	zWO7bS69B7xje2Stxs5P9joMhXxqhVKLQJVhdVaNyWLdiZ693hnJTaztCAPdbC/Am0zabX+B1f5
	UkJAWYOSvKofPWzCEpZqgftL+zw288gBigABGQj/v8d/pCKvPnRYkPaCotzfAIUk5V/gfn8UnfF
	t7kS3Jcoi0AscFZD/5KKIMTrT3JompoJFycQUfoLVW4gBaeNnF8lHz9SATebFeea99SIDeZAH6l
	quWnSiqNLwb6TRviZAljZK14w==
X-Received: by 2002:a05:6102:8086:b0:738:d6c:7104 with SMTP id ada2fe7eead31-777f5a51c97mr981929137.0.1787132347929;
        Wed, 19 Aug 2026 02:39:07 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e981584sm1516863241.13.2026.08.19.02.39.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-969524c1aefso245941241.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxwDaNvwWU25WFoQgZcScKYY4+7DmRzUpRuLu5Ts9A93n1wF3bOWTqASR/o/PaltrRPTSGCIgvHUY=@vger.kernel.org
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de> <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
