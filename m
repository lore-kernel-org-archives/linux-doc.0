Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D347C0ED
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937117; cv=pass; b=hOn8YdjI37an9+IijrUIGNPSlF2pwZjUZO5oyM2G4xwPhYciPSGDE24xkGIpQDqW39ZmFOooUIZOR6tAX+f2JL2iRj9DasefWpSrx1bZwNKkvC9kLUnEmCKc6WHMeD6LWKODZ6L4/HkaLwV9nzSWDV3XDnNCTcB3IZpBcVPN8qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937117; c=relaxed/simple;
	bh=sa6cF+phhWeD9Aoo8fTq1BNxnw8+Twhmjz3xClhMO9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYHv79RwEfaQGIIHVrfZ1Vely5iZ573xNcgQgCTlhI3274SKmkD9S2PYzjfbe4fiLr51Vjo87vTT4at6WN2GH3cm0+aoFuLAv7sIgOAmmmZjNuK+JJIdRgBv1Rbv2Qky7u82UNUWbZiahKuVyk73Jc2rmuSdZe8fDdAVftJSM7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mErxwQfK; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mErxwQfK"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so10333621a12.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 03:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790937109; cv=none;
        d=google.com; s=arc-20260327;
        b=gv2axxfmNd353YiA39ih+VGiYuRHQ6oDg4lXV7Dc5k1T9T96QECIZMoo9YUrEbog/2
         fxyO6UfbqWe39sHdqz3rXPo4KXQ9W+ken2R4/HlYCGviadqcIEqAAcJLt0qkK5n92pwZ
         vA5rpKotP6t0AoAw9NSWzidgemo+CbA1+QQ3rb2NkaSvj+krvq88HgZUCoxySm6s9chS
         ee7gVGb6Igm1OPzwg3pY99cIjw9R/31GP+Gzj3+N1NHOZufeolD6ekifSIg5dSaJNEZ3
         e1CvqdxxVeElaeoAB6zlbwmIzXY68PxyZTEF1sapgPrYvHD9ZWjaEjwFum4YwVGSOstW
         i2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=64r7ulkEn38K4zwS5C600ZIxGpt8NqYtlKiQJ/l1vMU=;
        fh=4aLezTocuqckwuwHNZje0IPK8U2EgR3Vi78jJ47oUXU=;
        b=T9UotvzCOdf3mosq7u7xwEoHKW1lHYloOHZLLyyLt5ijVu7u22ju49xzBwSC6cbieE
         Cldw9WYUzDb5qlicrU1xNI7goV56ECQPfsQMc0ONwjJrkCgXnxjEulizyv486bT2ECKH
         KEx32va6f9SCTOkIByLmbrDYvHfJ4IiErTlKbXaOj1jylx4tkNoKAocix1jfpYfY38XR
         rKD+TqIdxp7bNRKcMNV5vJ7koq+d58MTxNHMKeHqkzIcdRMnD6Gfqh5khQLDHGoUoa2O
         4EW1EwaAp3AiGzHzM9VvL7S4UIcU7oClUIZk+2UdrSxd8+h1aPZzfLSqZxiQSYWT96A5
         c5JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790937109; x=1791541909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=64r7ulkEn38K4zwS5C600ZIxGpt8NqYtlKiQJ/l1vMU=;
        b=mErxwQfKcT0oPSsbpcBLFEMyvx5qZUSCYW0mmuz1tIGAmrfxdPa1dygE4eF/wROVID
         /OYGHT0OTV3EEa/C9WgQCvd85LwaD3F0QIRroZeTUuDUfcprRNVx/hRcVGmIL0As9Qfn
         r6rHg6DDCqOHPBUBLfCwEEwf0xYE9ElNE96U/qfF+/xDy6zlSVnoamAr1doQWnsR8KYM
         t8AYNTFTMFmTSR7Pe870QY2GhikFDmR1QrBbZ+Q2J+/MouldOH2xIMM7LvgQ2w8IifmO
         R10nGHGWLeI21slZRGi3SpU7yYxZ626k1+ywBKemoe1PXC9btN1eu3VLSmbF2omXFs5/
         IU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790937109; x=1791541909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64r7ulkEn38K4zwS5C600ZIxGpt8NqYtlKiQJ/l1vMU=;
        b=cNFtHjshENQDLM/L8oEKJeNxLUE3Ut6Ml9D3/0YHu05E2D3J8jQdDga/XNHFzYyzjc
         78ZLD1GY9GuOPJ6cvO0csu8QFM8CwSI5sqpw5RAnlb9wxoxIR2UOIqPReHHo2Z9l2oFJ
         S8ZiJN2dQb7G+DsYpQAfZZlnJElPQyLvJQOFAB1vSd8R0BtqLP7MVlYGHzPQokd1W46G
         sk316H2i1E/eYMQRnsAz7qamYzrRYjNvfXjaBj2Dtoxic+hvBMXdqYYkqT3GJadkDnuX
         TudxJJ5ByIJd20bUKGsC1+TmukLv889K/xfcA+GVj2hkEM3I2Qhm61y2DDHe/HpaKzBr
         wdcA==
X-Forwarded-Encrypted: i=1; AKwUvByliSfpo4ScmwwFlaOLiSS2g/n4rwz129GNqwexuYtcBU77F5kIT70HKth4unovW7kyBTRBN2OQOGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy5gA+e3tNRTFHdgPJSaf6wtyst3wkvVKv7p0Dgv/Ay/yvvsPm
	PkFGqSheracgi5hQDapRmwmQEUuONu08EW69b+fCkroNaVOGA12waN1CYaGuDJuBaH1l9A1GQ6/
	ZZi/ZbE9oPwnFpdDzdibGjE1c7pWw8XI=
X-Gm-Gg: AYBFou3YR4NfOCigqVvIlYICUOA0aBL5gKoJBIyCWgjaATiG7GQ7e0GTbhmx5oFa72I
	PxKARjX+ruS+B3FJHglvdYTMCAHyeaT63zow+mHfdCQP0hMM3SAdg6TNFUpJru3tzt8s5V+7BD6
	hdRepiuVg+DBvyF9LBXZTRmg3CymbQy0udiHTaRd5TrYypfeTJCe8rxNf58FzbtODxWVYRnJv7d
	38odVsWDWERGfinpHvny1le5lbWqrJBpfg5WQs/BcFW9qXd1PAtfLVvNun+QRgLaYiGndIUqJbw
	uGsU0fyPQBQu8mSHp7eIAgRj0NAMr/VIioEbwKFRJ70h/K/oIP0a2M0=
X-Received: by 2002:a05:6402:350c:b0:6aa:9f93:e991 with SMTP id
 4fb4d7f45d1cf-6af9e04df50mr1455052a12.3.1790937109250; Fri, 02 Oct 2026
 03:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001195847.141192-1-maximpedraza@gmail.com>
 <20261001195847.141192-3-maximpedraza@gmail.com> <5c92c6f27b0778124d2365603374f70bd9b69b8d@intel.com>
In-Reply-To: <5c92c6f27b0778124d2365603374f70bd9b69b8d@intel.com>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Fri, 2 Oct 2026 12:31:37 +0200
X-Gm-Features: AclHuK-AO31UUSmBIVotodEDTlpk8vgR8uy4aHoyOWv0oRmO6rDUZemULA1RRgQ
Message-ID: <CAEUXW=GKRstrsZniQSU0un6r--a2VrRjpZCe5meUyyxunJ-E7w@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/13] efi: bgrt: export the BGRT table and image size
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Francesco Valla <francesco@valla.it>, 
	Mario Limonciello <mario.limonciello@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, 02 Oct 2026, Jani Nikula wrote:
> Data is not an interface.
>
> If these will be used more, perhaps it would be better to wrap access to
> them in functions? I think most of the time it will help with
> maintenance.
>
> And you can add stubs for CONFIG_ACPI_BGRT=3Dn where they belong,
> i.e. include/linux/efi-bgrt.h instead of drm_splash.c like in patch 11
> of this series.

Agreed, and the same goes for your comment on patch 3. For v5 I would
replace the export with accessors in efi-bgrt.c, stubbed in
efi-bgrt.h for CONFIG_ACPI_BGRT=3Dn:

      bool efi_bgrt_has_image(void);
      phys_addr_t efi_bgrt_image_address(void);
      size_t efi_bgrt_image_size(void);
      u8 efi_bgrt_status(void);
      u32 efi_bgrt_image_offset_x(void);
      u32 efi_bgrt_image_offset_y(void);

The splash client then drops its own wrappers and stubs, and the
"static inline" in drm_splash.c go as well.

drivers/acpi/bgrt.c is the only other user of bgrt_tab and
bgrt_image_size. I can move it to the accessors too, so that both
variables become static, if that is wanted; otherwise they stay
global for it and are no longer exported.

Ard, this changes the patch you acked, so I will not carry your
Acked-by unless the above works for you. Both variables become
__ro_after_init either way, as you asked.

Thanks,
M=C3=A0xim

El vie, 2 oct 2026 a las 11:37, Jani Nikula
(<jani.nikula@linux.intel.com>) escribi=C3=B3:
>
> On Thu, 01 Oct 2026, M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com> =
wrote:
> > The DRM splash client reads the boot graphics the firmware left behind
> > through bgrt_tab and bgrt_image_size. Built as part of drm_client_lib,
> > which can be a module, it then fails to link:
> >
> >   ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bg=
rt_tab' undefined!
> >   ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bg=
rt_image_size' undefined!
> >
> > Export both. They are filled in once, early in boot, and only read
> > after that.
> >
> > Reported-by: Mario Limonciello <mario.limonciello@amd.com>
> > Closes: https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b97=
8696482@amd.com/
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>
> > ---
> >  drivers/firmware/efi/efi-bgrt.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi=
-bgrt.c
> > index 1da451582812..746a8fb3a337 100644
> > --- a/drivers/firmware/efi/efi-bgrt.c
> > +++ b/drivers/firmware/efi/efi-bgrt.c
> > @@ -17,7 +17,10 @@
> >  #include <linux/efi-bgrt.h>
> >
> >  struct acpi_table_bgrt bgrt_tab;
> > +EXPORT_SYMBOL_GPL(bgrt_tab);
> > +
> >  size_t bgrt_image_size;
> > +EXPORT_SYMBOL_GPL(bgrt_image_size);
>
> Data is not an interface.
>
> If these will be used more, perhaps it would be better to wrap access to
> them in functions? I think most of the time it will help with
> maintenance.
>
> And you can add stubs for CONFIG_ACPI_BGRT=3Dn where they belong,
> i.e. include/linux/efi-bgrt.h instead of drm_splash.c like in patch 11
> of this series.
>
>
> BR,
> Jani.
>
>
> >
> >  struct bmp_header {
> >       u16 id;
>
> --
> Jani Nikula, Intel
