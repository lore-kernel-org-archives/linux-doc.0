Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5C037BE74
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776606401; cv=pass; b=bjV8F6fbnJh7u/fyQANgmGrQDjrDFD9ZQb7+JHODvDo9OKR52rCNXxBuYR25c/4sCH6+iRBm/fGHQaY6+MfwGTiIMzjyqVcEUiaGNlbDtfgtWQhOzxo90coI7zrhp5r7XTOCHo3vKZR5y0qpRkN4MvXZXxFBjIXRZVuS4SDT0rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776606401; c=relaxed/simple;
	bh=qFptuGNZkmWSENWkgWeSTiypA6pxk0Bss8JmWP01E2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFkhponIvQyFcQ/xx9XGr+VJbJzXG33voYUMzJjao6zVT3Utly112QHTIsCpuTiq9RzRJsVdZEJum1icLNpaC5LkMCRid4hCah641SpFd+5XSQIBtJ2MpcM4SG7S5GYVo7UBPe1a6ODXOMU8VdHWnLfP4XlmhuwQ47Sv8rjTD6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ217TpC; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ217TpC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1345380f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 06:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776606398; cv=none;
        d=google.com; s=arc-20240605;
        b=dH03SQ455uLvZlocxlu/kYhKLAZ2QjCIjPPl4hY/M8MQbKy8zUIiA2J+SkTo/IYOCH
         SVHySJrUo3KzijfHo1eBor3/QV0els53e0u6UY3cBVCFC/Ha1Y290b8ZuBBwTO8+pfkV
         eVMU43qoK/XeyP3RsEghJZ7/qhk1kTrtzEMmNpE5IoJ3AQ9FFlNP2geUKLuEiIEfna+t
         S2kOpw8ALse0mcWu7bSZ1YscfTuGXmzqaM4Snx2aS6NG3I+dV+TRt4pksXs9G1yrxTL0
         nq2+MEzVg1wKMM0Zvq1Ys/uKygWomLqJPAuLlBFIKIOKgzm/Zd/UFqmQTPfQN5csRH0A
         kcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsz5uA7mB3aQz6UuprfjwX+wOOHCxT6ua21vZZ7zV1o=;
        fh=+01uFByfAOPeIfkI9OcjZBmxXIM7Ez/ogCSosEzPNb4=;
        b=HmQbs5uW1yQDlUcYDd3OCdTYgYniymUziIvBA9G4JZCN/y5+yyudwD3kS0yg3mJQt2
         5IUkK8M4Vy61+bqorRKH5ElW8PrED4v/JAu4DYADtU3bm9nYSioHW16ItB1TlzF8mGuR
         SuFdmMMgoMBC66lt9DLN8lDVkDaxzDP2iJLBzVkdGRk2uJlnXXkuuA3vQF6w+xe2Ivh3
         646TJmc1XTXEwK4r/sll0lk/s14MK6Q2SmeN1ryRFCAITKKGjU38pHeQAUvZqQJZ60yv
         HQ5oiqOpkD3CMIH2r5o+khNPB7ZnohqHyszyFLFBCS6bqiEeUC1XRTzZu15UrMVx+n3k
         m4+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776606398; x=1777211198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsz5uA7mB3aQz6UuprfjwX+wOOHCxT6ua21vZZ7zV1o=;
        b=kZ217TpCkubuYMwnRHX511MtxPiavBgfcoPrPliI5XAUi4PmLXKRSuTrdZaNR8Mlt+
         gjzh5erYPTEQgBdOKsqRvGCq+GnFXWjG9wt3z6kRvyJAo3d9Q514xjWvEVaCQGdDllKy
         nwSEM8LkjTRiTRPRqLFk4bI2mv8om9FUY1Bq70Z67s26HoGPlvHUWAEpiybqr9bomOnh
         PQ3VyfmHvKus78h5Mo1MgAfbqerKT3axaQ72gzemIVXNM0oozn97PtoDZBhfczVW05yK
         7uflch10bugef1acDJ1+lwSpvNA973WkwtWNlDSQ+mdC8gSJ6uAEbuMzJT7/BJflt335
         Ia1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776606398; x=1777211198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsz5uA7mB3aQz6UuprfjwX+wOOHCxT6ua21vZZ7zV1o=;
        b=nUbAL7VNJlAbxs9kAAK3Uxfyi/mViMEohlepDbmTQWNZGwgVLp49muJiWtcKyWhHc0
         lIWPY0UdgJISaanAq3dMeUo+ovl5eoahFjUa9BnpiUTeE7dpMnWl0toBk4DbX0Mfz9Yu
         KO5Y9CxkYiVvum1uwkVNq7zL9cc1Q86bnC9L6dGqxR2x0gC2MEnbyAJyXm+79+Mm0kEL
         mbKjxfwlpC2yk03IZ9JIgdpn6qOBqzPW5B+eEkwygr8/YUaF2BkPAMKNVZYpTap8kKo/
         KI0p0N6tpUbLH9IGD3Y9rfKacTnflOQcymJfqMVCf8fsKNvHyiQCOuMKfSLtmyTySzK+
         DQsA==
X-Forwarded-Encrypted: i=1; AFNElJ/pSqvDIGaCe7R/lX4xL4T2r75pcMtEUoAouDcTfigUrt2TeMvPzAawYejzoTjklNdW0hEXpIId5g0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXaD7+cXSoUtVDGyvaUaRiiMUHUi3FhN1X6Kyrj+9Gcv7jEEXa
	ltaepEUqVdme92JGtPRbtLUzSW8hI9w5jykDIOsAdDQMqs4vi6pvmZiiVrbfvRho+UzSEBrqq+Z
	/rKDIQKXjZF6kt4YygPHGQFNnXEXV3XE=
X-Gm-Gg: AeBDieunqq1Dm02mcVvIorA2R5+MPzTqh3uk0rhKQhDNFbKrvIL6z+MzCSfT/X+Xe8L
	0HdOtJXig1qA+4V4mF8Xl0J2tW1IaNMBmevuzveH+SXF85PZXTOfa67oGct3Nd4qzNHocsvvNWW
	WX0Uny/XgtachVScXx0caW92tz7U/ocn6E7TVjwYRTr96l5tsTotP1wcfoUzgFzfev80g+DJsD7
	ZplZzBK9yrYqrnignDF2MPiODAHmNmA+A/0ipZKJFRPBuIvwHi+O1Ia7RNwU2zkOGuSAW2asQq6
	T8vd72Peg2fNhdf3iX8=
X-Received: by 2002:a5d:584b:0:b0:43d:300b:2285 with SMTP id
 ffacd0b85a97d-43fe3dc5c58mr14983269f8f.11.1776606397785; Sun, 19 Apr 2026
 06:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419083125.35572-1-clamor95@gmail.com> <20260419083125.35572-3-clamor95@gmail.com>
 <20260419143751.11ec0b69@jic23-huawei>
In-Reply-To: <20260419143751.11ec0b69@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 19 Apr 2026 16:46:25 +0300
X-Gm-Features: AQROBzDHUz7Bq4Yx9C52FIvc2ZHcHpmYflBENb0J-YXx8dYIQFe3jx1jZbIQtS0
Message-ID: <CAPVz0n048kPMAnGQpOk0_SPtQ+hz=-p6jdyRYPB5d+CD9i7_Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iio: tsl2772: add support for Avago APDS9900/9901
 ALS/Proximity sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 19 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
8 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 19 Apr 2026 11:31:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Avago APDS990x has the same register set as the TAOS/AMS TSL2772 so
>
> A Sashiko review comment makes me wonder about one thing below if the
> register set does match.  Maybe it's a bit more subtle than this
> patch description suggests?
>
> > just add the correct bindings and the appropriate LUX table derived fro=
m
> > the values in the datasheet. Driver was tested on the LG Optimus Vu P89=
5.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/tsl2772.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
> > index c8f15ba95267..8dab34bf00ca 100644
> > --- a/drivers/iio/light/tsl2772.c
> > +++ b/drivers/iio/light/tsl2772.c
> > @@ -127,6 +127,7 @@ enum {
> >       tmd2672,
> >       tsl2772,
> >       tmd2772,
> > +     apds990x,
> >       apds9930,
> >  };
> >
> > @@ -221,6 +222,12 @@ static const struct tsl2772_lux tmd2x72_lux_table[=
TSL2772_DEF_LUX_TABLE_SZ] =3D {
> >       {     0,      0 },
> >  };
> >
> > +static const struct tsl2772_lux apds990x_lux_table[TSL2772_DEF_LUX_TAB=
LE_SZ] =3D {
> > +     { 52000,  115960 },
> > +     { 36400,   73840 },
> > +     {     0,       0 },
> > +};
> > +
> >  static const struct tsl2772_lux apds9930_lux_table[TSL2772_DEF_LUX_TAB=
LE_SZ] =3D {
> >       { 52000,  96824 },
> >       { 38792,  67132 },
> > @@ -238,6 +245,7 @@ static const struct tsl2772_lux *tsl2772_default_lu=
x_table_group[] =3D {
> >       [tmd2672] =3D tmd2x72_lux_table,
> >       [tsl2772] =3D tsl2x72_lux_table,
> >       [tmd2772] =3D tmd2x72_lux_table,
> > +     [apds990x] =3D apds990x_lux_table,
> >       [apds9930] =3D apds9930_lux_table,
> >  };
> >
> > @@ -289,6 +297,7 @@ static const int tsl2772_int_time_avail[][6] =3D {
> >       [tmd2672] =3D { 0, 2730, 0, 2730, 0, 699000 },
> >       [tsl2772] =3D { 0, 2730, 0, 2730, 0, 699000 },
> >       [tmd2772] =3D { 0, 2730, 0, 2730, 0, 699000 },
> > +     [apds990x] =3D { 0, 2720, 0, 2720, 0, 696000 },
> >       [apds9930] =3D { 0, 2730, 0, 2730, 0, 699000 },
> >  };
> >
> > @@ -316,6 +325,7 @@ static const u8 device_channel_config[] =3D {
> >       [tmd2672] =3D PRX2,
> >       [tsl2772] =3D ALSPRX2,
> >       [tmd2772] =3D ALSPRX2,
> > +     [apds990x] =3D ALSPRX,
>
> This is different from tsl2772?

yes, lux table is different and made according to datasheet,
tsl2772_int_time_avail differs, ALSPRX configuration assumes that
proximity sensor needs no calibration which is true for apds9900/1
while tsl2772 needs calibration, device ID is different 0x20/0x29 for
apds and 0x30 for tsl2772

>
> >       [apds9930] =3D ALSPRX2,
> >  };
>
