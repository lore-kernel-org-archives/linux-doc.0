Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29663A168D
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559906; cv=pass; b=qsxQ9POI7CnFCEtB1BvXO8bAhKHDC2qZu9IyOKhGD/Id9AE3c2kQ5+qV2iAiaZdbtpFLFTYlAGvxZ8VUIyWXLg6SALLLmLOcWT+rL9cnM+qE1DR/krb/mFiWJGyRUE3cqN8obgiEf73I63QT0EXjJHmUBpCnRQYNRdbB6mkFYIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559906; c=relaxed/simple;
	bh=X2lhb7WZ9JiIxyS3liRr9wVJ8T8tN41odtpTMaYK0sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTVQFcLWEMxv5SF/k6guTzdXZMgyOhpwrPUpJ9N/EQR2pmRHigOIghaXsBAv69FnUAihWfL/eFUJhmm50nBz7Z2nWwns9sGJkqlnLhqlZN2FrH4V4Fe8FxvdZosxxFgMXCB/1fDVbfDqjECD5PcBPsS/QwmUGX91Eqk3btD9nmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4PD9Jzz; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4PD9Jzz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2bd236adbso5618465e87.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 04:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775559903; cv=none;
        d=google.com; s=arc-20240605;
        b=HiK9dJDKjHJR35zOPOEIirnhqI65Co6b+HyPqz46AWQZSRNjdihR0A115NxrNbL9Un
         mkZT77VTXpeJ1VLNSPq4xm7cXS7m8L7tLOXikBS2D6fhj43KAcNdadULpadrPwcjxzqZ
         RcM7MyA2r7GoLGtPopdVrkYKAunkNY9zYM5CAnMrS4nmfPC19TReQwxxcGtd8Xt3j0Vs
         N+A/2yOrAAxw7mylk5x4CjJKWca+WQIUo2NEzY87G5eGzDL3xibfrm90m9UL5YZV4zkI
         OjrQPJMNmM0PLql37U8VSZJRHyWBLfsrDZE1cXN7x6uRejwFOvG41YFPQ+3UhtbrgqwC
         eebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gnkh39HGDOfEu53B37sG9rZrTd6+G3tEl6/Y1gTIgBs=;
        fh=XyKb/7DgHGJW0nQLxQRjTWKC/uCi/UMwTZhBPKNlkqs=;
        b=jZN3fmFN87FSY5rrhcO0tXrk8x99eXLT6gnuGsZY5lVO3S41bxM2Bl0tSYd+Xhr7s6
         5WgmRkDOKNJhHTjQxSR0LVlYwB61sABlMzYQrjOHysqUHyeSH6Fs8C3S7njUfvZ4LNTE
         tOiP3Sb/RTR+MgC3ghkwgpEa0GIVp7qkvoguwR88hMQIRocKjYyWtpxBoP1IgNvayH4c
         lxJcNKrtxBrR5S4wq2CCfC77d8ISZ03lFzpbWVfygWzW8by2D4FCGXhnzz9vsauYqKDj
         phF0LYg2E/ceHb6uOQ2bTeA2boqUHkduTUM8z6ZGYGmJbar/hVMA4L0D/EXJRilQN20/
         MNkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775559903; x=1776164703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnkh39HGDOfEu53B37sG9rZrTd6+G3tEl6/Y1gTIgBs=;
        b=J4PD9JzzqlCMY7oLbWViRJjmOadiZ3O1tfn4jHuWw8wugbIVv13vkACniYNZZVPYvP
         kIeLOXUbWoB1QQ1j61QUtvkBF/AnbH1+tERQqVUpPxQvxeJwf8Ty7OMgqGfbdR0lCjF2
         9CgEqb7A7u0XhOxV4IOa9+YyemNhoBzVrgIokDWB4teVZsHykTTeJeHyQu1wMBMTJfwy
         vTlaIcp7usz1vlBTrhIVm27VuBv5gaEqP3SwdwrJyNCFM+MK/SgNZmygSodfQc7YR4jy
         nPdOCs1npyJPcY6vSaDNR0HIscifLpqqwc/N6IbCH4UomlCFQ1k7u6d2Hg/Vfabnc8gO
         bLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559903; x=1776164703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gnkh39HGDOfEu53B37sG9rZrTd6+G3tEl6/Y1gTIgBs=;
        b=VAp3xY9MuDsPMrqZkMOrOuSNKHwNFKPhcrODTDuZL18XDWb+LOsRtn+Mh01zDUJZdX
         ey1fZOWbr0T15dUMwGNyKgn6o1LWPIyNXteek+W3tYk7ivBDBMCDZ7Qt2q8M8DbqW02P
         jCiLQWN561DM87xldKbuNWA5oLlu6ODVkKYPjWDV1LYHFAtRVYHMBJLfQRJE0WeiElGb
         HDnUTiHtn21nFRofDDO/Hk6XBhID57E1jomF8VrTK8C3YLS9keGq0tDGl23d2TBLc7kO
         gGAms+tylbU7CW8vC1ZvSkmYO93f7Xw6aCS+NqthnrEtTrRO6QeHOg52mGiaEPJojv7u
         CxHw==
X-Forwarded-Encrypted: i=1; AJvYcCXNhTLBwSxBSZ16qFZ2RSrqSNEpUuyM0edgzolVZNv/lEqu+wkwkMwudve1c+IS/M8SyGxRNgxovTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVhSDQ5ee1kTVQNuDCjiYhcX6zOTQOmC4JUOGC3FYNE4PoV+rd
	WrvlRZshPcPSuLfLp3ranadBD4wTLnD3wSUIfiylfag4EgXcXXaKpZi3IkXHYdujHxIyR1tQPh2
	rf2Xzi8QDvAgUg32+9hs3D5/xQz3/YOboDZ/RqbE=
X-Gm-Gg: AeBDiev9tOC0O1PtszuOKWu7uMdQytV2CD/chxRqsagb3Prd3fWL4Na26DPyoEy8dUJ
	9kn8Vhu/28Btqm8B1E1bZlpAb5rotg673hSkTvrE2y5lORy28yrtKeTfLbjFdBuD/eM9jgy7fSP
	M3hISQtJiI/zQwDZhtNjSLinfV/Vp51Uj0BbGsyyrNk/nXwpIoqL6Xlh8fgu03lS0m/JrrNN8tP
	UmM3wfsv41HICURpbQAZDn3xzPq5tGNCpaXpIybGK/h1Djkj9txGTDriArEXrk+/6tEK2TOQtfU
	uGbxXOZX4g==
X-Received: by 2002:a05:6512:3b1f:b0:5a2:7d48:8493 with SMTP id
 2adb3069b0e04-5a32f7e207fmr4520864e87.12.1775559902286; Tue, 07 Apr 2026
 04:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407052317.2097791-1-rdunlap@infradead.org>
In-Reply-To: <20260407052317.2097791-1-rdunlap@infradead.org>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Tue, 7 Apr 2026 13:04:50 +0200
X-Gm-Features: AQROBzAF7r1sNcMVAm8mUA_sNj8fb_R4VWDPqgICRGiUehNjauki-azP4Z050o0
Message-ID: <CAP8e=sLQ9HTy1Wu7TMcrae8w9MD7-eC8Wu-4rLSe1hoLF3buBA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (yogafan) various markup improvements
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Randy.
 I will incorporate these markup improvements into the next version of
the patch set.

On Tue, Apr 7, 2026 at 7:23=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> There are several places in yogafan.rst where it appears that lines
> are meant to be presented on their own but instead they are strung
> together due to the lack of markups. Fix these issues by:
>
> - using bullets where needed
> - indenting continuation lines of bulleted items
> - using a table where appropriate
> - using a literal block where appropriate
>
> Fixes: c67c248ca406 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion=
 fan monitoring")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Sergio Melas <sergiomelas@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/hwmon/yogafan.rst |   55 ++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 24 deletions(-)
>
> --- linux-next-20260406.orig/Documentation/hwmon/yogafan.rst
> +++ linux-next-20260406/Documentation/hwmon/yogafan.rst
> @@ -7,8 +7,8 @@ Kernel driver yogafan
>  Supported chips:
>
>    * Lenovo Yoga, Legion, IdeaPad, Slim, Flex, and LOQ Embedded Controlle=
rs
> -    Prefix: 'yogafan'
> -    Addresses: ACPI handle (See Database Below)
> +  * Prefix: 'yogafan'
> +  * Addresses: ACPI handle (See Database Below)
>
>  Author: Sergio Melas <sergiomelas@gmail.com>
>
> @@ -31,19 +31,21 @@ deterministically via a DMI Product Fami
>  eliminating the need for runtime heuristics.
>
>  1. 8-bit EC Architecture (Multiplier: 100)
> +
>     - **Families:** Yoga, IdeaPad, Slim, Flex.
>     - **Technical Detail:** These models allocate a single 8-bit register=
 for
> -   tachometer data. Since 8-bit fields are limited to a value of 255, th=
e
> -   BIOS stores fan speed in units of 100 RPM (e.g., 42 =3D 4200 RPM).
> +     tachometer data. Since 8-bit fields are limited to a value of 255, =
the
> +     BIOS stores fan speed in units of 100 RPM (e.g., 42 =3D 4200 RPM).
>
>  2. 16-bit EC Architecture (Multiplier: 1)
> +
>     - **Families:** Legion, LOQ.
>     - **Technical Detail:** High-performance gaming models require greate=
r
> -   precision for fans exceeding 6000 RPM. These use a 16-bit word (2 byt=
es)
> -   storing the raw RPM value directly.
> +     precision for fans exceeding 6000 RPM. These use a 16-bit word (2 b=
ytes)
> +     storing the raw RPM value directly.
>
> -Filter Details:
> ----------------
> +Filter Details
> +--------------
>
>  The RLLag filter is a passive discrete-time first-order lag model that e=
nsures:
>    - **Smoothing:** Low-resolution step increments are smoothed into 1-RP=
M increments.
> @@ -66,8 +68,11 @@ Usage
>  -----
>
>  The driver exposes standard hwmon sysfs attributes:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Attribute         Description
>  fanX_input        Filtered fan speed in RPM.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>  Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is rep=
orted
> @@ -78,22 +83,24 @@ immediately to ensure the user knows the
>                   LENOVO FAN CONTROLLER: MASTER REFERENCE DATABASE (2026)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> -MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH   =
       | WIDTH  | MULTiplier
> -------------------------------------------------------------------------=
----------------------------
> -82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS =
       |  8-bit | 100
> -80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0 =
       |  8-bit | 100
> -83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS =
       |  8-bit | 100
> -82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS =
       |  8-bit | 100
> -81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0 =
       |  8-bit | 100
> -82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS =
(Fan1) | 16-bit | 1
> -82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S =
(Fan2) | 16-bit | 1
> -82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS =
(Fan1) | 16-bit | 1
> -82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S =
(Fan2) | 16-bit | 1
> -82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS =
/FA2S  | 16-bit | 1
> -83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0 =
       |  8-bit | 100
> -81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0 =
       |  8-bit | 100
> -*Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0   =
       |  8-bit | 100
> -------------------------------------------------------------------------=
----------------------------
> +::
> +
> + MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH  =
        | WIDTH  | MULTiplier
> + -----------------------------------------------------------------------=
-----------------------------
> + 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> + 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> + 83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> + 82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> + 81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> + 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS=
 (Fan1) | 16-bit | 1
> + 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S=
 (Fan2) | 16-bit | 1
> + 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS=
 (Fan1) | 16-bit | 1
> + 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S=
 (Fan2) | 16-bit | 1
> + 82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS=
 /FA2S  | 16-bit | 1
> + 83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> + 81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> + *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0  =
        |  8-bit | 100
> + -----------------------------------------------------------------------=
-----------------------------
>
>  METHODOLOGY & IDENTIFICATION:
>
