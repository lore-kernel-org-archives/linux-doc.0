Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323AC32D0C2
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710886; cv=none; b=YFHePZE0wkgOsVRinJi4nHeNxA3zj9MaEs0s1f5TIjYKde+PAC7CF+JhrRHNLzwND6qIzBVtNbcfgNFoJTmiYa22jMCFFb42ajB2RGDfcyHb/NWf37JvJp9gCzeKzIDufmTtE1KcUwMrdZ+/efm8yfEoILBsUo1Gsl3PwAJfmtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710886; c=relaxed/simple;
	bh=FCzIrtyhh7fPA/dw9YZK4XCoQvYOyJniQgX3yVqjUbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeRa6vDC806wzS9+HklcFSZ32ppqTQK4ehvXUhwbhBt/BR79E3h5dKKFTaFH21cHXEg/XvHpzWC0o1lXn9U4+BLXcoEtcbhhVz9+6a3EA2WlFs4zTlkk9s1Z8Klaue1U2EeTV5KhzsYHOzGZdtrsCku0b1OIqi29ybbxrqEfnag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-55b24eedd37so716990e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710884; x=1768315684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJJUInj/XbYBOmFssNzAphx4WQGD5E9g7yIXL8sfIgU=;
        b=pNmmFbzRVGqfLdF79XawA2Q+o+8JSL63DG07hYnYG974QpC6AbWBn6iQX8OyAdJ2Pf
         cIGh1ls5pT3XDP/CPJ/DT2Hzd8yBh3p9AxK31Y1EEtVesoUcRF0mSGDcRuzrWdR+PAHz
         xQKvjsZyGVwkiVhjbfFjiEsFkEfSrB7WfQBo0o3Qywcrfg2mty8Ah3L/LTSkoJpGG6o8
         vxPRa2iuk1iElPYA1lAvOCq2cBsQcIO4p0L1lujKbi+TVkII1+dR82tlItw/O6cbY+5B
         wGGkzAAxbUCxmiQ3iqWEI8ne4YlNvRyUXeC2wNfRpnaAVh2WSnK+KTNj9Taf4EtXUQdk
         oYZA==
X-Forwarded-Encrypted: i=1; AJvYcCWO3zK/zPZJ/yBjfudApsI2qQjSzlwNnfQDghai6Rz8BXNdy/WJ3xwTuF19omWB3f1Esf5c/sAYACc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ThyM5UchjXgShC9XWg7WR9olfclcCFrkC1tbLQqCjLUPWipa
	HnW8Uo3xsRnN3F+WeY+9GqaqnJapD8NitkjCX0jkaI87X4EZeoVWapikhLdkDIV8
X-Gm-Gg: AY/fxX4SX/4CWXDno+JpMqXn+trAFtFGVZkz2PRcW8JOwbBoG8mGvHjBSu8QcJy7mGD
	nLElyQzgsHIFNlZsRDW9w2xJ/9i2nspz8oVxl+FUft9bA1+l3mR5Js1rsWGRiJThbjsY5mmgSSD
	Jw2XJHaLhek6rtgvZOF9O3R2lR13jvsUE3xohbDz6RU0+nvpJWBrycD+Ksgd2ZMwpcAlSpGHLeX
	VCd8ceLxc2ex7rBvSsZX9PWDZeLsqvUZzvTHyp3iqEyoCfp8Dco4+LO6b+lHmQklC0tPjB6K6RZ
	xIHq9MFeu7H2H4YKWqgvpWpyGSO2xJiv+oLTNTULlKl/1MeSksuvijMxNKjA8ozsmYiZoHghaP0
	lD4nAqUCuQfhhasCmc595hCYrSe940CPC4Viehkaaf97bIE6jnsUwt3TaYdLZCC6rVcGh209HOL
	qsJrVSvKVPJ2One+rN/fq1skIkre7FIzpK8Cv4hU5JGJEpCIvVzNAW+9QGjXA=
X-Google-Smtp-Source: AGHT+IEVsK6yi9zj14n6J3PRLUsMWoWe7giq1jFQ4oXMiu+ZcaLPVwdH4zznadFe9nfZTcfaS3PoRA==
X-Received: by 2002:a05:6122:8291:b0:559:6e78:a44c with SMTP id 71dfb90a1353d-5633947952dmr1004043e0c.1.1767710883514;
        Tue, 06 Jan 2026 06:48:03 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633ad02b3bsm614426e0c.2.2026.01.06.06.48.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:48:02 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93f69720a7cso607303241.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 06:48:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbs6qMS36aOd9C7gBYoMccK4c98KII3eFI5Te7VvZSdmrhNBVbxCmQ7miI8jNw987s5PN88vurpGI=@vger.kernel.org
X-Received: by 2002:a05:6102:1623:b0:5df:bddd:b590 with SMTP id
 ada2fe7eead31-5ec7451df5fmr1123054137.34.1767710880890; Tue, 06 Jan 2026
 06:48:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it> <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
In-Reply-To: <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 15:47:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
X-Gm-Features: AQt7F2qsB5hg2NX_ZI18pHFrsB3JeydqfV6kNAMxXv_CqeMBbwVEPLSuyAomQME
Message-ID: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Franceso,

On Tue, 6 Jan 2026 at 15:26, Francesco Valla <francesco@valla.it> wrote:
> Add a DRM client that draws a simple splash, with possibility to show:
>
>   - a colored background;
>   - a static BMP image (loaded as firmware);
>   - the logo provided by EFI BGRT.
>
> The client is not meant to replace a full-featured bootsplash, but
> rather to remove some complexity (and hopefully boot time) on small
> embedded platforms or on systems with a limited scope (e.g: recovery
> or manufacturing images).
>
> The background color can be set either at build time from a dedicated
> config option or at runtime through the drm_client_lib.splash_color
> command line parameter. Any color in RGB888 format can be used.
>
> If enabled, the static BMP image is loaded using the kernel firmware
> infrastructure; a valid BMP image with 24bpp color and no compression
> is expected. The name of the image can be set through the
> drm_client_lib.splash_bmp kernel command line parameter, with the
> default being 'drm_splash.bmp'.
>
> Just like the existing DRM clients, the splash can be enabled from the
> kernel command line using drm_client_lib.active=splash.
>
> Signed-off-by: Francesco Valla <francesco@valla.it>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/clients/drm_splash.c

> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)

There is no need to protect this block with #if, as it does not generate
any code.

> +#define BMP_FILE_MAGIC_ID 0x4d42
> +
> +/* BMP header structures copied from drivers/video/fbdev/efifb.c */
> +struct bmp_file_header {
> +       u16 id;
> +       u32 file_size;
> +       u32 reserved;
> +       u32 bitmap_offset;
> +} __packed;
> +
> +struct bmp_dib_header {
> +       u32 dib_header_size;
> +       s32 width;
> +       s32 height;
> +       u16 planes;
> +       u16 bpp;
> +       u32 compression;
> +       u32 bitmap_size;
> +       u32 horz_resolution;
> +       u32 vert_resolution;
> +       u32 colors_used;
> +       u32 colors_important;
> +} __packed;
> +#endif // CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT

As per [1], all these values are little-endian.  Hence they should
be declared as such using le16 or le32, and accessed using
get_unalined_le{16,32}().

[1] https://en.wikipedia.org/wiki/BMP_file_format#File_structure

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
