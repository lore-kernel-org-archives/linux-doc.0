Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7313288C25
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571467; cv=pass; b=iyt678XuoLoNTBno3Jc1MKdQzSwNSdYqj75BPnXuCRHz0DitH2lNNQVPT2RLCnjN7NsDix029VaiUj/LyRKTTU2o+cCFfEQfO2d9jETYgcE98mUcEGnQOKgaQXZkh4A7gGv/XB9Yp4wc39No0Vy9uGMPQZhluAgT93D19Y5Z/+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571467; c=relaxed/simple;
	bh=0imWy1cM2Yh3ijKRNIflaY8vhnL/+2L4VY5uCrifH/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGlar3ceHQ8rs5ahntBzul7ea0NCz/44gIyQAdr5+lm6myCGz4CT/R37pgaqL5RPeAazWYsyQgtDj0JDgwEE+knu4sImYcMDmO8NPg5hFGUcLNK1vHNzyJr+l4gBbJq/6TJgehHRMNCbUY5KHopMlIYvwSVBfc+fA0gYndaWm5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3WslThW; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3WslThW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8010b8f078so342643366b.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 05:51:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768571464; cv=none;
        d=google.com; s=arc-20240605;
        b=kxgNE0RMdYfgNR0ZFqAttBmLzAnyXsceHO7xhiS1K4l9218QX9QW236c9wbN4NfggT
         peEFpC+T8XLeqWPiC3uyzLmIr3DCvn9q6Jf8AFuPu2qEKG1TZktxkvR3d81Vsl5AYHSB
         gHHHKVG8N65TR3xjGeLhX5jsjtIZ0YUOY2pnu++ZK93P5fmz5zUSHp3P3vXctFSEi0Hy
         mxhT6vSzlThRZiKajkNgVIx/XvFWaWdr9+ixIWq/Fx0pCb768snf5Bi9FNEFlOkr6PiY
         mltfQL/U0+Z+xaDJ1EYqQAobbVg+Uk6h0Ojrd5Zc7ZaU/t3rrX68vAdjGGhMDI6tBQoH
         QHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vP98g39yyougRsxlmtaspRwBSt2K8dov2JxcZQzReas=;
        fh=CrcdBghdStfGLHBBhs4/L4K19C7vt6a0fPxK5N8BeXQ=;
        b=GcSeJK2kB2Rj6us33QEK3ZJDQgzKqVcvem3Qg4acAyBv9iv/XPpk/YeSoKjyZcgMq8
         snyLYh/Gwtke+9waKrc/d4L7ptHH550AKQNWNlF/n5+pKLtvKBNlBAr9ac3+zwFfM3rd
         Awk8gPPnYV4KibKHd0R8orvHMnhxSuvbPUc05vxfkl+vLvHOr1B1kbuk2CzCZGk6aYTO
         3cmWZSIxIo16gYveDSv2TnvM63mvQHbmxSbmSwHOpkOjp8FOHEFG3FN3ywv3/i2VQ5jn
         A876RmmDJglMVav5UpGoMivVUsiqX1Bfl7ooE0fFv7n4qN3fbDI2//H6riE6uu27dkx6
         0olw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768571464; x=1769176264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP98g39yyougRsxlmtaspRwBSt2K8dov2JxcZQzReas=;
        b=i3WslThWc1Xd+/crfe/XdxS+0Nsp58RaMSbabGhjGVY0L4gL07QRI8Mfn8Dqoz59Ll
         ZXOMW/ekCsToVc57Lc3ryRXxw67yjHXtS27iCkxHAs/5SSxEMRkTIYVCjA5keU+HDXJh
         c0z1Sc6EJmf6LVp1j8a+PrYLAlIzh6hthujW67yci8qW60cEBd1fXU/sspn82dpeWNm6
         mD32OJgg/yDjIbKmcG4ZgsqG0YuOR+l/9t2hRzfz/Qb/DLm2c1w/QaeCzg0z23w2iXJb
         EhEUwyKbcs+HNF/4xQDmhnU+cDfKlSo7dWONZHX4X4eJ4WBwdEnJ+kWijmiHp5LJUEQ7
         l5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571464; x=1769176264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vP98g39yyougRsxlmtaspRwBSt2K8dov2JxcZQzReas=;
        b=pLpzAw1JW9E964oPKqErZHV2eo7UozKtXdo74nJH155Au9VbFJpGMA0jnFPhPunATU
         u9B2XJV3HdgPspdt9af7rd2ezBhr1a7gg2xgRLZZi/YXf2a2NdDszVnnYwLkT1nxQ8Qp
         JMeJYnD7LmbDy3QkfLX1u3rRENHQYzJDdDrwLI7ldeqsQ/DC+Tnxt5rCD9Ff9mish/zw
         nlYsdngTrSptGf/4MPxen+2gtsjLIchf+h3lKIg6a7ftmO4qsQoIZb430RfI+2HpP4VB
         kJavibCgBHHdw/23qXbLzoTsmUqLLRVsBQ3Nvsh4cb+HIUUWx8ujlJJCx541TrbyG4eh
         lkHg==
X-Forwarded-Encrypted: i=1; AJvYcCVXqtLnllwxFnLzHAv2Z+5okrD2s5bp8RsZNkfgGADSADwrx49Epv6z8Ldhq5GAvrAh+HOdqQtFoi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC7saIrqzd/kdMlXzjjNCzQhQE4iWrlzmVlJaQhrWXihDLNahs
	qtVrw/eK58I3lP5VJ2bozE9dNsgOPVTZp9Zy5vtaaLo96JL5LrRfuOaXthBztuBrq7FLHHnJ2NM
	s7cQWHTWSEe9GDhGyz3SFAHcvcEzJW9k=
X-Gm-Gg: AY/fxX7Gy/0hPy6i5zE2ue6I2edHGsM7scG4Vh/DfXFPZtV1WomwKg/+5ZXK8ZYP05c
	V9Am1ua/rOZKbSly3qWLND+TPqe+BTooAtqPHdTl6JsvSO+Kp/lU5YTBBvdkjAxnQVBXWo1eB91
	e7/coK2GpwZRG8yQJyIpLIgkM3G/xllc47VNVr95QFGqUVIChP+z60zPxu5qaAZvyG24OebyCKU
	sHG/twNyhrsbO+Oc1mawmTil6jLLlFc5LNYVqP23sRmXkR6jZ2jXFYaQUMTmS3u6ATBLSJfARqQ
	M9fngxIeikAzSVtRwAV4bdkQ76xPFhelXZ2zzbe4fm+Gm/pintmXzanTOMMAHOg97en5DGA=
X-Received: by 2002:a17:907:1c10:b0:b87:1b64:a63 with SMTP id
 a640c23a62f3a-b87968a9716mr191242366b.6.1768571463652; Fri, 16 Jan 2026
 05:51:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-adf41513-iio-driver-v3-0-23d1371aef48@analog.com>
 <20260108-adf41513-iio-driver-v3-2-23d1371aef48@analog.com>
 <aWFPEa9HI4wmYLpn@smile.fi.intel.com> <6hcqrcy3meskddrklb3jtlpca2snrs4upwms56lhq7mkes7krm@vdiaqkfc6lgg>
 <aWTTs1n_N0dVjpbV@smile.fi.intel.com> <lwqhf3pm5xewtx4hhq7ei2yil4skmtkstqfifif74u4e5jmtzh@wedhpibvjepw>
 <zgz6g7pvzijrt77lwdi6q23lgkscm33imcdfbnu7mxvzarygst@ve3wi5l6dv3d>
In-Reply-To: <zgz6g7pvzijrt77lwdi6q23lgkscm33imcdfbnu7mxvzarygst@ve3wi5l6dv3d>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Jan 2026 15:50:27 +0200
X-Gm-Features: AZwV_QgMV3VtbpdpsZAd3s2CqQZWxMYfJmVw_nvg5Cuzp2P6oYGHfb6siqtNym8
Message-ID: <CAHp75VccDF6QfkZ729qCTQcd5bbnTO2SX+FG8QNPRSC9=LneMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] iio: frequency: adf41513: driver implementation
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, rodrigo.alencar@analog.com, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 1:32=E2=80=AFPM Rodrigo Alencar
<455.rodrigo.alencar@gmail.com> wrote:
> On 26/01/13 09:32AM, Rodrigo Alencar wrote:
> > On 26/01/12 12:57PM, Andy Shevchenko wrote:
> > > On Mon, Jan 12, 2026 at 09:56:25AM +0000, Rodrigo Alencar wrote:
> > > > On 26/01/09 08:55PM, Andy Shevchenko wrote:
> > > > > On Thu, Jan 08, 2026 at 12:14:51PM +0000, Rodrigo Alencar via B4 =
Relay wrote:

...

> > > > > > +#define ADF41513_MAX_PHASE_MICRORAD          6283185UL
> > > > >
> > > > > Basically I'm replying to this just for this line. 180=C2=B0 is P=
I radians, which is
> > > > > something like 31415926... Can we use here (2 * 314...) where PI =
is provided in
> > > > > one of the used form? This will help to grep and replace in case =
we will have a
> > > > > common PI constant defined in the kernel (units.h).
> > >
> > > Any comment on this?
> >
> > will adjust as suggested.
>
> I am finishing putting the V4 together and I decided to leave as is.
> doing (2 * 314...) might lose precision, by not much (maybe negligible)
> but it does, as (2 * 3141592) !=3D 6283185.
> And that it is part of the reasons why PI is already multiplied by a
> power of 10. I suppose there would be multiple constants defined:
> - pi in micro radians and nano radians
> - 2*pi in micro radians and nano radians

The problem is that we will have off-by-one errors in plenty of
drivers. Depending on the driver the PI may be floor()ed or ceil()ed.
That's why I think it is best to use 2*PI with the precision you like.
In this case it can be as simple as

((2 * 31415926) / 10)
But you might actually want to have the maximum 32-bit PI, as
314159265 for the same reason.

--=20
With Best Regards,
Andy Shevchenko
