Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AB55D888
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930377; cv=pass; b=AgGss/Pc5IlHeaT/HuNglVlivCX9x3Jv12ijVWEBjf/MBKzY/N6c95SnAH/IldjMZZhSwdarYEKt78dcKja6Yk/b6aRTySYwdymXgaLm+JkrMGuiYJOGGzQChUCPjnXlNXeTUNHZCVIpiIFG+7Pszi7KVYP3MeqIWpcOXP6m68g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930377; c=relaxed/simple;
	bh=LHKyaN6WUugoUSp5MeLqyUxtlolwPgBXkaD5KlRFm9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCtWwfPgcnl/vGY24fIOhLPR9KoBULnqMNVleS6qdcbW4cTMAPgZXxEaPvLgSPPXeCC3hL2LPV8lpFVrF3L60VIUbwqCOIYphkxnzG3udc8AmQrrIJBZIvuxFBX1gzdnP+ur5E++wpN9BE+6jrxiTPrG1L/TGb0jdztQRuIm5iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C4/6EXUW; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C4/6EXUW"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b06c0794cfso4476077b3.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 15:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930374; cv=none;
        d=google.com; s=arc-20260327;
        b=nHgXZfXwSHMagEocIeTi+sjzbOWovMXLliGKZzhjI40tc9Wm8FcslzglnTPGjbGpI6
         a3EGY0FaIJsgWVS3UK3sT5+mEWKFiQOLcESs/GyHNxo9DvCqOOWhB1Di4U9LZY2+PpFF
         ldNisCGT+4csGPEhptraPH107jbhD3UTN27XIRcwBdFWSw6Dn9gDlqfI3BZfkiHP7R6Y
         U6wuusecWQphe34Dhm0oNUBY7jfpzWBdcR/6CBz9Mcq8/AtI58elgJBgQZnw0swfUf0R
         1ZRgBqfM3DXN6cWpi52oyprtTfikd7uZduMXXlUrD2m19jNJTDzqE1RBF22NIVynqLFF
         UaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        fh=zhS1rZ96NK5TEh81BksHDk2fiUwfw6QV96DWRayieJY=;
        b=TA9MbIg6OvxS7Zu5c2fSQ9v9X2JXM18X1JGFK0Uvyd/iYIjbiOuVQg+KN1MDc11C2z
         zNn/paXTIM7PwTkPJm1jHuvRSgdlCDYicTjSunR+98XdGYrzRak9KLFto7OnAkTY4ShU
         tvz07ZzZiOGMcZnf4OE4YnhzIpqVwht0XT4lPfwMXa4YPRt7Kqtp35sIJJuXN6UeVms+
         pmdPQkPRhC1KUSCqf7ySdGg4Clzq88prCh5tKKYzTSQ1pDv5I2tfNhNCPVXIR3SAcQPD
         Hn/wLP2/Mr4pEHdGumU7Nsf5+nQmqHEshC8XtCbaaKOtVU3FDN6UEZM6plBAjXqnxDoz
         vUIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791930374; x=1792535174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        b=C4/6EXUWLqwBThAGo1onKkHW2BxZrd15xJmVGIULHYLY1nPFF5hv2mrrYcUkuA7RR8
         IhUjXjBsCxcolz6CV0dg8XhSVmMve/TAn8Iev1d7tXkENPi2R8sDAr89/T1YBI130YKh
         IcS6Ly+tY/cTuvFj2Cbai7MhyVANyndbphs84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930374; x=1792535174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGIvE55pEcxzd83xA7rFdHteLp03z04heYvMOT2YxDg=;
        b=loMXpIzS2jN/grBZDyOO/Bm6drCwbxCUU/hAAVIubvcFuROqSEbWk9FEnKpJigfZvk
         t8Oga9IFNLKbJCngsgALJw4IAKmg9V8IsxKMs/IR5y3N/pNkfNQaGCP16dV0K4JMnQ73
         idz+yuKTlVBouDRz39oDXtjZVPPpbAfCyYquVxzqOekvd4UBrJojqkuCO03zVGVG1crq
         B3cP3jYo61cYYa8xhornAnkamfbFQZLaQlyWnP2N4R6O86IkDWrXPSY03J/EOq7W1+rJ
         U0Mr1w/Mbw2bZx8UWEW4g5Z1YDD/74oXAR6p9AqYj0uFXlQ6aeznapqphKjXg4edYudd
         CG6A==
X-Forwarded-Encrypted: i=1; AKwUvByD9PrkuN0scq4VKTSupyhffePY5bi9pzpeIwZpPuL1iNlFFGbCLbpC01dKnzudrShUyH21SP7kr1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7c11qWI6aByYBxghyzWdTt7nDuu+VgiRAf07/QPDqzXuJaaUJ
	ot/iIE597mMpw7eDhLXR0en9il8Y3QxOUM/Hgb9wgy7EB65TkJx53zFhg2bN21s06N41MiR1rRA
	QP5hnTmRjuqEpqCwitTuFl2Ncm+Uay4z+6DOvLJWS
X-Gm-Gg: AYBFou0biFIkO/l8Jw0skRrAkV2zesH3/9KnzatMA92pBvasOdGTaplo23ZEZYLDHbr
	uPS8TnwwwsB/ASor+beGBOKTj95cn1aCeHdyHxIfdd2YZOL+MDaos+QrpMnNh3amciL5sHyjLzN
	ti9B+M+9scTSCpfJRHMmkiqoutuPaKlluUXdw7WkIV1lEZIuODFoPwuHenW/Xg1awdaYEGoFdpn
	Brb+/SR2Cmsxhd9ZfM2vXk9K5D+2cp3U6DM87sCczEChaocSvC9s6vF8kpc20k//Sr8SXqgMb0p
	LEfdFf1MRJVIC+TEPW3RJF0r4BrnK9HIMu0Fs270gnMrUA3Cj/mGPyXuJB8N/4XM0O1fPp8xqIb
	CBhJ3ijcizQ==
X-Received: by 2002:a05:690c:39a:b0:8ae:8877:9ef6 with SMTP id
 00721157ae682-8b07edcf6f8mr55863427b3.10.1791930374515; Tue, 13 Oct 2026
 15:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-8-384af01da3ee@chromium.org> <aszWnnc6RR9d5SYw@monoceros>
In-Reply-To: <aszWnnc6RR9d5SYw@monoceros>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:26:03 -0700
X-Gm-Features: AclHuK_tyUehVA205WXB_Og5y1P8AMIMPFMlhjQ2Y9FOhmh_U9e-FbL8LEin36M
Message-ID: <CAEe3GZHB_mDcdz3gcoAzOu6mO7ua3muESOJcaZi6Z45Q8J77rQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:49=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Fri, Oct 09, 2026 at 10:25:33PM +0000, Jingyuan Liang wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/spi/spi.h>
>
> Drop <linux/mod_devicetable.h>, the spi header already provides the
> needed *_device_id with less dependencies.

Thank you. I will drop it in v6.

>
> > +static const struct of_device_id spi_hid_of_match[] =3D {
> > +     { .compatible =3D "hid-over-spi", .data =3D &timing_data },
> > +     {}
>
> { } please

Will fix it in v6.

>
> > +};
> > +MODULE_DEVICE_TABLE(of, spi_hid_of_match);
> > +
> > +static const struct spi_device_id spi_hid_of_id_table[] =3D {
> > +     { "hid", 0 },
> > +     { "hid-over-spi", 0 },
> > +     { }
> > +};
>
> Please use named initializers and drop the unused zeros.

Thank you. Will fix it in v6.

>
> > +MODULE_DEVICE_TABLE(spi, spi_hid_of_id_table);
> > +
> > +static struct spi_driver spi_hid_of_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "spi_hid_of",
> > +             .owner  =3D THIS_MODULE,
> > +             .of_match_table =3D spi_hid_of_match,
> > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +             .dev_groups =3D spi_hid_groups,
> > +     },
> > +     .probe          =3D spi_hid_of_probe,
> > +     .remove         =3D spi_hid_core_remove,
> > +     .id_table       =3D spi_hid_of_id_table,
>
> Very inconsistent alignment of =3D, if you ask me, just use a single spac=
e
> before a =3D.

Will do in v6, thanks.

>
> > +};
>
> Best regards
> Uwe
