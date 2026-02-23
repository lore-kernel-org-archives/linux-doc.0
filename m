Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7128A35C18D
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843344; cv=pass; b=dzXm9bzuDuHQUdvQGn+4DIW9af96jYdLgW7qtuUGbF0qi9mQoTBMGENbJxCZjk2cKyYMRAX9VezFmNiJ6bIm/mRjRrdr2DrXzFY5HW2dAR1FkiPhR2zphgz1itxavxVLY5NM1f+PMoUhBlnF3D4q63VuGnr9RcPruHLkPTg3kjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843344; c=relaxed/simple;
	bh=P41ECaBtVGR0u+MMMSObmf7Jb+y0JD0AdOXmIS3DHAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKDiiWSq7fg2S4SSRWVeht68Yo1LDbiKRt/g9pYnP5lHF8y3EN05mT6XJZnB5d+/qhf+ir3peE+Avx11HEG9XDRnVlxpPUfIv0UasOZ+SO46vnSZmXN6G3Ps3ulHa2HU5S8KZZSaIKQ9X6n8hPx86yYn4b3b7n8SWTMOkY4ZCAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1cjsye0; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1cjsye0"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so602663666b.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 02:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771843342; cv=none;
        d=google.com; s=arc-20240605;
        b=U8yUC7lhcFApf10M9aikejwZlXe3cXJeCeauFmwXOiwAlXf6S51pv/wQI0qbH+y+AV
         /QcFDppfdnawqa8JexN7oGaa2Luw3AxmDjGnEak0dKP6g6t+STrELWyctlgLNVvvZBjo
         maNQff74LO4uU4Kj0yMOxoXDBWsB73YFY2EQmXvEvu0S6llXZBt+StdDjCamWD+fz2Y+
         AyeWRvQeS6+yWlQcVa+p/ff/4aacnuf7VzgQekMOlyGU/bV3iXsZTh5WTvetcRacPlLV
         io1wlei7BPdUenw4kNM/UEya7z0nRLQomS7hv0FvuMSICvTfQatv+IULJSngBCGFyIXa
         AsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P41ECaBtVGR0u+MMMSObmf7Jb+y0JD0AdOXmIS3DHAU=;
        fh=CoBfIVO2BoTLtkURivGAobwf6BZ3VmdmR0CtZcJultQ=;
        b=PhDG8Tg9JnL9/NoTh3XGK3WmeWdtiKqgiQrlML3ft72uCvIF02JmYRKncL0H7zUy4I
         ivfAHwcrrRsROZOAcRl/fBHXamtfoD9ym6Drfq88965EMNW4J1utqeZ3pV38fKZyUrtX
         TvZDekIcldHW1awIzCKF2KfRmiX0O6ixKkSL2wXc6f0ElyMbURMPYcSDuC1Vl+y46hgk
         wDVtxpqpJAc4MnThrLZtH51Rqb68lKxXSO1drdsT3fwG30qVcSUbG10+tCjxZJ9C2FH9
         yer1J2FDZphvllWiOQKf7B0MKvIgvXd1hrQa4CbIjzU5ruHAC/3RpQKJLW59SlMMvprS
         dclA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771843342; x=1772448142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P41ECaBtVGR0u+MMMSObmf7Jb+y0JD0AdOXmIS3DHAU=;
        b=Q1cjsye0K3kzkv9EFEJ3OGVamMLTrJOqSkc1o9x7sRzUESbN/Kehs51F1ijM0J3kQ5
         TP0PfvBayxozaHAwRggwzWY7dD1o78gd/vsDIuBGPf6TrN80c6rZSOosjYtuXXbW0lHu
         wakRTH2ieQ2BCyM9fD0MhrOhqnmyJV48xJflt39UyFK7G+Mn+5bCxrl2l8zCjGiDrKMC
         LJ3PLVJKK2beVg8LwSq8PZwUSYJxhrRoSepk2ivbOu9epjidcoCFuXxcYqIHHSD9Hrd3
         e1hhMHpdFXInJl+sBxO4IDkB1yQVi1QSljZvm7okbg5OJ2i+AsxADmwXqnmgPo0CbqOy
         mP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843342; x=1772448142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P41ECaBtVGR0u+MMMSObmf7Jb+y0JD0AdOXmIS3DHAU=;
        b=ocu1tjPKgOmT9xDNYc/gdI0INUELCTmJvrxyypzUDkIHfm5i2T+GKP94HLZ4utOAsw
         8Qxikl/PR9QCL7tYhUWvNEf/Y/xeAQflaXwpi1rjUByj+LAI/PqW6tUMsk1L/d4hCCg+
         qR+1eheVoxTOGuy82326Y7RK9F75BNptDqjb3+OlvumXM0HOMUoqhzhE5YnrzX3plvX3
         wSFrAJns4AdVrvIgR+XgFQGbcXjS6gx1hwylxoeWK+24HrvwKmzPwV/TJ0huP/TXWwUM
         gizjYMrzTxVBNx4BOyNMwZCoAsjBOlqTEDNS2Gs1vdTmycE9XFnIRs58/1wrHLmRnN8S
         +ITA==
X-Forwarded-Encrypted: i=1; AJvYcCV3ERt2ChplsNp4E4UodqAtGyTLZRuVbjRyWlcM7A3mSWj61IjxSuhZ7hU5k2URld38qLtClsUg8xk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm0RZuUL2lUSFj4+5iiMrFYdj2eU2Bjm6d2IIwfRMhWu0QlUre
	WuwfcNGGNKw6abxrtvX1RADyyuvyzQW/v5uczBXGaeXR13yEZluHIxlt+zgLWRtMxYWkycXHDhu
	XliKOR21g9Ld0Y9kPAm6W2CD6FsZ3jow=
X-Gm-Gg: AZuq6aI0fWL0ON+yw5rM+MS3IfzvZC/usGF4dzbbPBM0mxFp8Vt2kno0x1DHpbYlBHS
	IFzTSOawkL8I1FWcVONhzICdpeQnTo6Y9w2FV1DtmieMkdObPNWLdZ4CHG7VKcU+zx7XZ//IemN
	b58eRgFVra6wqxqelikXnO5yW+C/8BODFjU+gueHG4X/InBi4rSFePky6zR9BRyzzCKt+/i2evc
	yKdj9U8vVQeUryrAGk1aRYzECk6J+pwj4e1paaVff/W/3o6xNTyCh8KKzVpGKPTBO/qKj8x/AsY
	PDcnSqJ7l2XCPmXKRBUNR9Sp8K5HUYudrev3fY3z6D3dtIkePLdo/XNZsqzx0iRXmxkuda0yzmU
	RZ+82CwE=
X-Received: by 2002:a17:906:ee8e:b0:b90:3593:654c with SMTP id
 a640c23a62f3a-b9081a2aa1fmr456630866b.21.1771843341409; Mon, 23 Feb 2026
 02:42:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-adf41513-iio-driver-v7-0-b0ed387ab559@analog.com>
 <20260216-adf41513-iio-driver-v7-2-b0ed387ab559@analog.com>
 <20260222172912.60a103c0@jic23-huawei> <aZwYshRxNgSh3CWk@smile.fi.intel.com> <zb752y7tnjzsc35na572o4sip6efwv3i4lha4ls6fhdrr52h5v@bfgy65cmae4p>
In-Reply-To: <zb752y7tnjzsc35na572o4sip6efwv3i4lha4ls6fhdrr52h5v@bfgy65cmae4p>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Feb 2026 12:41:45 +0200
X-Gm-Features: AaiRm52vOvWGhar45YMmK2bKJVNTzdmE6K0RIepFykMpsJ41Aa0DMBAQ9J054Sw
Message-ID: <CAHp75VdSV2QDMR0DueCuP=Ds-5A1NsNjqPWtmRbG4NvoJ=LjXQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] iio: core: add fixed point parsing with 64-bit parts
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Dmitry Antipov <dmantipov@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 12:37=E2=80=AFPM Rodrigo Alencar
<455.rodrigo.alencar@gmail.com> wrote:
> On 26/02/23 11:06AM, Andy Shevchenko wrote:
> > On Sun, Feb 22, 2026 at 05:29:12PM +0000, Jonathan Cameron wrote:
> > > On Mon, 16 Feb 2026 15:02:17 +0000
> > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kern=
el.org> wrote:
> > >
> > > > Add iio_str_to_fixpoint64() function that leverages simple_strtoull=
()
> > > > to parse numbers from a string.
> > > > A helper function __iio_str_to_fixpoint64() replaces
> > > > __iio_str_to_fixpoint() implementation, extending its usage for
> > > > 64-bit fixed-point parsing.
> > > >
> > > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > Hi Rodrigo.
> > >
> > > This looks fine to me, but given earlier discussions I'd ideally like
> > > to wait for a final review from Andy.
> >
> > It all depends on the series from Dmitry Antipov.
> > Can somebody help reviewing the patch 1 there?
> > https://lore.kernel.org/linux-hardening/20260212125628.739276-1-dmantip=
ov@yandex.ru/
>
> can we push for the exposure of that function to kernel modules?
> We have discussed that in v6, and I understand that:
>
> EXPORT_SYMBOL_FOR_MODULES(_parse_integer_limit, "industrialio");
> in lib/kstrtox.c;
>
> #include "../../lib/kstrtox.h"
> in drivers/iio/industrialio-core.c
>
> is not a good call...

Yep, because it's a temporary band-aid. The proper solution is to have
shared code provided by the lib/. So, the wrapper to parse 64-bit out
from the constant string literal should be part of the lib/ in the
result.

> > When it's in, we can continue on this one. TL;DR: for me this is on hol=
d.
> > But if you see the need to have the driver being in IIO, please add a b=
ig
> > fat FIXME to make sure we will get this all being sorted out in the
> > (nearest?) future.
>
> I could add the FIXME into iio_safe_strntou64() doc header. It explains
> the context:
>
> > + * The implementation of this function is similar to _parse_integer_li=
mit()
> > + * available in lib/kstrtox.h, but that header/function is not availab=
le to be
> > + * used in kernel modules. Hence, this implementation may need to chan=
ge or
> > + * removed to reuse a new suitable helper that is properly exposed.

Up to Jonathan, I hope we can move the above mentioned series forward.
Without that, as I pointed out, this one sounds to me suboptimal and
unneeded double effort.


--=20
With Best Regards,
Andy Shevchenko
