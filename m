Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA33EAC9E
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352545; cv=none; b=hSxtdcupx4vk2ekSHVdZYzOpFmS7LxWRT/gFXvNzm77FtpjP7DLdFZG334PUbgBKAhj/wD5XaITiLDTSUEYkeHZuct8CLXBdqee+7FaaSHqVVf/sgC9tyGqs7Ldpexz7IHsYzF+TzRDJ+3CxEXB+jg9rrTbBgieXKxdDsSTyb5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352545; c=relaxed/simple;
	bh=esc67us1UIomEqAcLAINh+D2RrHyu6uD2oj798DuCUc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LbDt+9qUlbRwHaM4vpGES0le92XoBMmWWWDzR1kJHhCcLRCBRr4hxsmGEBdCmPkukeDHHBCyDCEkj0BdY4BFJ1wuGgBwkJUMXIfEl74NrTMHiRImnxY9eW+aGBMqUg0lrGLBwIDZylhrVcM0Su0k/Eh2KbTUmet2gYJ1w3QVkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AfdgZwhh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AfdgZwhh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486b9675d36so43195945e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774352541; x=1774957341; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=esc67us1UIomEqAcLAINh+D2RrHyu6uD2oj798DuCUc=;
        b=AfdgZwhhHfXOtrXhS7F+7RnFd6Yq8q61WwxLGC9Vkx2YoRn37+UJzR0p39aSetr/0C
         e2Wz7ikKtbhSBJa4X/RH/wfVrKAcYCrRiSLf0AE4NqRGHXMRW2MaytNdM5IYzapSN+7Y
         YvFm/Ht8XjjzziAo8JOdaK+/9bWCnWApCi1waL+4pHlyis+F4bSoMkt3WEGaB9bnTQNK
         pSv6EXLDbVeFrEUy5RPeJe4AjYF665CnQj9HkriloN5hClKpj0xbjv2499H6M9uzKDGm
         jGlP2gKCcNhIxS7cBRZvjJyxRyz2rFeHgaao67oq6H9vQyxWVD1v8PDesweEZVdDKWYV
         BCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352541; x=1774957341;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=esc67us1UIomEqAcLAINh+D2RrHyu6uD2oj798DuCUc=;
        b=stSAtoK6cCTpuKPGhgnxCCPV/7vc/GsinDZN78BOYuXXoPJo2D9d+ellsjDHqtRSvi
         3/gXWAZzfDjBBg0a0Gz2c31LVyVpPnC3ktFk5FlyVDeXMqg6mfLdVYGeJbVc9pX+c6sN
         uJdRfhXEdmBGl7cdFNE8WKHcNBtsCdD+6BmKTOKtb251MNw7OXMYr4X66Cy/2Oz0G1aA
         yeqJO2EYawVIBEc2rZx4fwvTHGpl5nJXYlKWcO4Vj1fN+XUlm8LWUZXrhfzHME/ScDFG
         +HF+6bayJsRBi8UwuJXymnrO9njHQ8IDGs1slas+gLY8bGRRrkBwc+h3ky+7DDr2zkR3
         jqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn/+tnkbGCm7ZWpYoVIgxwOKfGJ4etsazxE5c1pd2MdQy6DicI/fAYuqxW3h2bTfW1rcCX6rN8SAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdvoJVKFM5kxWGHQRkoEySUsZvgNoK+bOzAIftM5u0kx3Gkuv
	MwPh46mbbOTwhmyh4iyfHhc7Eof0S2DpmjGEnj6cO4Y0JP/zCNbG+Tkbi0g0ZhA7h1o=
X-Gm-Gg: ATEYQzwxbrCkH1ndy8bjRatKhZVkeAc5f/eebBBg7pADGUe7iJ7oLm87fQACTba3cRd
	nVZcaQFjwgtYgLl2zKBT/pX6gcZLfHBecifmAMikSV91E5U00MQZGXJfyghk8X/XY6N6MbEwAVf
	z8p7A8b3DuEAnM0UhBjD+G8ETmPbuxLK6+dR7fyAfaxjARACnYetpIWfEYddpw6NFbSEc4u8mwU
	zg3E918LsG/LG7srfbq4UUqBK+ucuW9MUaNv37y3UHxBVU9lTtvlqJ6+hkYcSu0lci5PpC/ApqK
	0mnf46lEUqFuEJSO3mrBdRBo52fatwVoKXwtvftea3pSF/hOTGoVApGCKbGM+J6He4qPv7gN7qD
	qb1PbEfLU7mx1icDLRm21TPyJa+zVG/WqCAN7B5J4QaJ8UXHvZS9jOBoNF0dyddrP4gVx9GLENh
	IZYjDrijo=
X-Received: by 2002:a05:600c:3514:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-486fedb54cdmr221400105e9.9.1774352541482;
        Tue, 24 Mar 2026 04:42:21 -0700 (PDT)
Received: from [10.76.209.150] ([151.35.203.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f66f309sm30303835e9.0.2026.03.24.04.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:42:21 -0700 (PDT)
Message-ID: <46a937ffd470d190b8e7da2bfc78dbbb7ecda94c.camel@baylibre.com>
Subject: Re: [PATCH v8 2/6] iio: Replace 'sign' field with union in struct
 iio_scan_type
From: Francesco Lavra <flavra@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
  Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron
 <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>,  linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-iio@vger.kernel.org
Date: Tue, 24 Mar 2026 12:42:19 +0100
In-Reply-To: <acJv1RNLugS0aat9@ashevche-desk.local>
References: <20260317150316.3878107-1-flavra@baylibre.com>
	 <20260317150401.3878294-1-flavra@baylibre.com>
	 <4723284d-1e18-4a13-9ec1-878220af257e@baylibre.com>
	 <af2128c68d2a14e1eb664ce9dc075ed02b640407.camel@baylibre.com>
	 <acFvHgTo-3cxH_UP@ashevche-desk.local>
	 <5c780b1be8a64f7862a421db5a1f5be861cb197c.camel@baylibre.com>
	 <acJv1RNLugS0aat9@ashevche-desk.local>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-03-24 at 13:04 +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 06:37:38PM +0100, Francesco Lavra wrote:
> > On Mon, 2026-03-23 at 18:49 +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 23, 2026 at 05:04:10PM +0100, Francesco Lavra wrote:
> > > > On Sat, 2026-03-21 at 12:22 -0500, David Lechner wrote:
> > > > > On 3/17/26 10:04 AM, Francesco Lavra wrote:
>=20
> ...
>=20
> > > > > > + * @IIO_SCAN_FORMAT_SIGNED_INT: Signed integer (two's
> > > > > > complement).
> > > > > > + * @IIO_SCAN_FORMAT_UNSIGNED_INT: Unsigned integer.
> > >=20
> > > > > We could make this proper kernel doc format with one comment per
> > > > > macro.
> > > >=20
> > > > Actually, a set of related #defines can be documented with a single
> > > > comment. I see a few examples doing that in
> > > > include/linux/gfp_types.h
> > > > and
> > > > include/linux/fpga/fpga-mgr.h
> > > >=20
> > > > > > +#define IIO_SCAN_FORMAT_SIGNED_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0's'
> > > > > > +#define IIO_SCAN_FORMAT_UNSIGNED_INT=C2=A0=C2=A0=C2=A0'u'
> > >=20
> > > ...or use enum
> > >=20
> > > /**
> > > =C2=A0* ...kernel-doc for enum...
> > > =C2=A0*/
> > > enum {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0IIO_SCAN_FORMAT_SIGNE=
D_INT =3D 's',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0IIO_SCAN_FORMAT_UNSIG=
NED_INT =3D 'u',
> > > };
> >=20
> > There is no standard kernel-doc format for anonymous enums.
>=20
> What do you mean? We have such in kernel, for example,
> drivers/pinctrl/intel/pinctrl-intel.c.

The kernel-doc guidelines at Documentation/doc-guide/kernel-doc.rst, in the
section that describe structure, union, and enumeration documentation,
include the name of the struct in the example, so I thought they wouldn't
apply to anonymous types. But now I see that anonymous enum comments are
processed just fine by the kernel-doc tool.
Anyway, in v9 I switched to one comment per macro, as suggested by David.
