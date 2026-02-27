Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6730596F
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772161417; cv=pass; b=eZ+Bw/65eay4Gz4EmKTki6wqKWEKt/29UBzNThpJz+2ocoNyZbrKyNmx6EHx5UYaDKAWoaEXJWFEGqbSUd6pu3d6OFh6b0yH9dSDNHjhgbR9AG2TA2mu0pkRpGzH/Rn1BE6er88b5Mmc2rImj7P6/d1RIvnDl0sXidw18014d84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772161417; c=relaxed/simple;
	bh=rAeXGz9RgUBQrbD5iu/kr7xRar9M1wNTZIyHsZI+SD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HppOV6ZSTeQ8NIR3w8gQIAaf02Eg/S7FBwQAWeLeY9SEbQ6AI4xYFU5Q3QFzo6APUNY8ReElHlTTexZxPlR8vhOyDFgGgmqj3jVOfQ41xMa/423lwa2KOSA11JdMxFaaQi7US+vmrXHST6dWZTYCNA2l4fSm6OSukHNLOERnUqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IskQ4GnC; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IskQ4GnC"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89549b2f538so26400956d6.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 19:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772161415; cv=none;
        d=google.com; s=arc-20240605;
        b=T47/Zdj4RPVS4xkky7PrcahuZRb/d8+ydvAfOxhxsytkG1dl6TOQnoADCnkBT7B17n
         0TnBfm1GnIGRA42L+4DjL4WoCar7D0iKzgtWwWItti404vmbnGJwyvsJvR8pWAUQteQA
         t2a0g1ajPkSZ9cUOccWC22HJweoEFEr40i4kaAMkxGKxQLlOPCDh+I5NhBwMx1cFdqRe
         ICbvwmjH/41G3v+JAQlSCyRoyJzr6UzU0eLz8U+lHjaHj32fb/e0I+01SpmnueTRP2mU
         ZckgRFmpHv14HihOdzt7rtEgoz/kowkLANHJwWwFNV4HmyqOKMYHpMF7npMzlRQTXz44
         S4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v3X6uNvjRgnyqwPAC6LYHkM/Dk2cAc5WKIw3orsrsKs=;
        fh=usIai0udaL7N5WECcil3ibkfJDrI06A4krGZ/3i+z5E=;
        b=MkCthYdq3OatxWiyrQwLkYrLgs12ppLQqwRNW+Ll6Ri8I0yc3DY/KV+Wt7QyQTGqzw
         CdMMkbo8BDKHv1/Qm8BCZnc+H6gCe8pn0IuifXj2QDy3+ckkot1kQ6DBvVNVlDOM0KAw
         TNufl+Pt2XpSHxv/ZtuWuaHeqyL/kLkIxR0PsZq+3Yp8b5mWMSwjFVzKrqTxOd7UapEV
         DJQesxjXTM1D5XkKK/Gy53K1KdERb9jB5y/09beNZoF+4SzsReZzypE9t4jKAbEZ8gc2
         COZvTbWc67dIR2s43FMXZgWFleaZvMqXRsaH6w0BKQmytT+I8GaC9sGp7QLap6W+IG2m
         QIqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772161415; x=1772766215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3X6uNvjRgnyqwPAC6LYHkM/Dk2cAc5WKIw3orsrsKs=;
        b=IskQ4GnCXHidoiMfLG801vPgULQJyI3i6yr8xBWHODKKkVnSQT3hktY2pmBsXdTodl
         wU6d+JNuywryIbOegZ3GPcyDUgeFj1kp9oad6PhAUVvsAu/VwDoP2r2ADh1okSkYwWjt
         eqSyf4+uSopiXnZv/ZOFqcUC3ihC/OvLwELOZTKyoCtcJ3cR5duVgUL72EpB2i8IS7sm
         xTeeNBSXAB+ImDEiu8dvGr+SaTLDqYvmmtgdpOWStvHdTilpmHs10fW5o+BvzOkF6E0I
         KTtY7FQ2m8h6uv1DR6kiHHzB/AsxStrx+qdHLXZMK6TC/akt2V8j+6tO8eLqrd4tD4yW
         yxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772161415; x=1772766215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3X6uNvjRgnyqwPAC6LYHkM/Dk2cAc5WKIw3orsrsKs=;
        b=ic6yVPgVESCm3icp8C94YcDXc/upB1KqBM3Fn0UBvU0r9AcRzDH738cvjiO2dXRC46
         10w47zpbVwWlC4r3G4DH/J+ybgidAt5I3qpb5K0hNMpSH9jHl7r5HyE/OcFxBjnaeRZk
         9guRjzajjZmt0YzaCMatPq3tevVRXpP9nTiOaqI2V5CgVfP9XIXTxUBH8gcxUizWsdZv
         zxS202jx9kif08gP8Oyqo7OiabSueN6V1GMnaU6OVvXu2IoUenlAjivNZqB8gzzpKGzJ
         dphbGqGbpkK3ud3KCrFQLBiFNcMeJDaylz0XQo4MmFj5F0XdDawhpSkPkoUb+wiNRHl7
         njFg==
X-Forwarded-Encrypted: i=1; AJvYcCWLJDSVjI2eWIFx3bU32ZGhKYgDqBtAftRdDga6s/1B3L0mkFi/RSQNMORu/VhYAmteT2O7zEhbXqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoJLhV9B/WhLJBF/YNJVo5XMGKfNNvvUgfsg1IJrV7RopdKJa
	rZADBHjQ08MNfajtvmemYVBXXpK/7s7drb7ZXg5STLmeSS7kr8kYKRaWqtqE/3K9Ybe/Hv5reus
	CJbP+y3RrNGNxyvXxo/3GkCFetrHRD5U=
X-Gm-Gg: ATEYQzz4iw7+dFInmHCnDeZQP6UB9hYXiKz4qAW+cbZPtZVCh0y+mdN9JuRy3GPWX57
	kMJ08taVmjZO0wZZfWXu2fyIxnfvTKwszzwYTy9UyN1daDAp5gXTr+GWzmHPxwrhAJg+F/A+UFn
	pYqcPy58uV26jtWUjjupLvKmg8/cAg7bJg1HqjSjvkAGf3os0oNk0tHuTD/VJaajvo/IuasSL+d
	coSc+70Wisym3hezuU/Z/470HdiYlX0maFEywZKQVHae5+tgfLwLCx8y61jGRltVO4PJMzpB3kF
	3ij+q2j4zgEcfiro6q8MJ378setx3rH0ZukAFj0ol8uKi+4dJ8af2I7lOH8EzQD6nQ==
X-Received: by 2002:a05:6214:c63:b0:890:2480:f02e with SMTP id
 6a1803df08f44-899d1dbcd78mr21240946d6.28.1772161414781; Thu, 26 Feb 2026
 19:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
In-Reply-To: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
From: Cryolitia PukNgae <Cryolitia@gmail.com>
Date: Fri, 27 Feb 2026 11:03:20 +0800
X-Gm-Features: AaiRm51jiSEOtXqiq0eTnRlTH5UjdvlVETUOt09cjpD0MjJTxVl3jMu9YL60NhU
Message-ID: <CAANcMPkoWsXmEqD4U6THzi1Euk_MZYO5TAcDgHZOcYAEs6P-oA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel ec_read/ec_write
To: Morduan Zang <zhangdandan@uniontech.com>
Cc: devnull+cryolitia.gmail.com@kernel.org, CoelacanthusHex@gmail.com, 
	corbet@lwn.net, jdelvare@suse.com, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, 
	marcin@stragowski.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Morduan Zang <zhangdandan@uniontech.com> =E4=BA=8E2026=E5=B9=B42=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=94 10:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Replace the custom gpd_ecram_read() and gpd_ecram_write() functions that
> use direct I/O port access (inb/outb) with the kernel's standard ec_read(=
)
> and ec_write() functions. This provides better abstraction, improves code
> maintainability, and ensures compatibility across different kernel
> versions.
>
> Signed-off-by: Morduan Zang <zhangdandan@uniontech.com>
> ---
>  drivers/hwmon/gpd-fan.c | 37 +++----------------------------------
>  1 file changed, 3 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 1729729b135f..c44957b7fd91 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -19,6 +19,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/acpi.h>
>
>  #define DRIVER_NAME "gpdfan"
>  #define GPD_PWM_CTR_OFFSET 0x1841
> @@ -243,44 +244,12 @@ static const struct gpd_fan_drvdata *gpd_module_drv=
data[] =3D {
>  // Helper functions to handle EC read/write
>  static void gpd_ecram_read(u16 offset, u8 *val)
>  {
> -       u16 addr_port =3D gpd_driver_priv.drvdata->addr_port;
> -       u16 data_port =3D gpd_driver_priv.drvdata->data_port;
> -
> -       outb(0x2E, addr_port);
> -       outb(0x11, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)((offset >> 8) & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x10, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)(offset & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x12, data_port);
> -       outb(0x2F, addr_port);
> -       *val =3D inb(data_port);
> +       *val =3D ec_read(offset, val);
>  }
>
>  static void gpd_ecram_write(u16 offset, u8 value)
>  {
> -       u16 addr_port =3D gpd_driver_priv.drvdata->addr_port;
> -       u16 data_port =3D gpd_driver_priv.drvdata->data_port;
> -
> -       outb(0x2E, addr_port);
> -       outb(0x11, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)((offset >> 8) & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x10, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)(offset & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x12, data_port);
> -       outb(0x2F, addr_port);
> -       outb(value, data_port);
> +       ec_write(offset, value);
>  }
>
>  static int gpd_generic_read_rpm(void)
> --
> 2.50.1
>

Why do you send it to my gmail, using uniontech.com which is in the
MAINTAINERS file please.
Have you tested it on a GPD device?

thanks,
Cryolitia PukNgae
