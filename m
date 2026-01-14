Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD62F531F
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358028; cv=none; b=pn4Ca/H3L+RXLZB8GI7A2vokvyLxG6L43VnZHQzX/pRDTvPzYU91H+m11lEwRkWZHzNv1+x9Y0bci17GCrzMefWojIrx5+Fj1VL9C5QFggypGuaMM7VKMH2D3zigwLgx1vaOlLg9f2RSjMRdqXHjKKs+eYLVVKb9dwDVj2kYvAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358028; c=relaxed/simple;
	bh=3Y2xwxnB2VY5O7Wn7NdqLZLtOkwceaDGP163hwmg6x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyE+zpRGNn7MQS3b8KgYuA6wwlw9Q4QojN1AtCMA42Qw5CqNLqRqjX8cl/JH5Xw85mZ1uRuNzDOiQaBwwxpz8LvuwC/Aj51F6cpgpjxE+r0TBdiLAYO4k303V3ZlCxrKq0+d1VESOqb7AMkNgOlQ6MHJXjdM94DQkiPMQacARZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=l9SeaGpX; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="l9SeaGpX"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fba1a1b1eso7639337b3.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768358025; x=1768962825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=l9SeaGpXNcz1fbo4zFU2Xcgud9fEn9AS5gsQm5hGrx1PuESljXqEWZ+YDjcmQypaKG
         3kZ0k1cvIPsggLAOrGgKXnMIai1pDZCBmh0a6CQ60b9skiyCht/jPNq5YSqyc+E1IBxH
         APW/vwDlD68X8rlFtChwnxhWI/urgQ9fsrtkAiqCkfYEHUGg+bYrG6v12chZ2sYm6rqm
         dUHQQiBgW29LIikoVh0rohjGnUflzvhgafjJYjExsauzkrIfDnGHbCcgbA3GX5sSML6P
         9Pjgs39AjXhUYX7tIogk3L40ksHN+TUjKb7RIKD0bCGzyrz2MLaigjrVfkCrC6EiQroo
         ht6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768358025; x=1768962825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=NFDMDqK2W89G8CMUo/fRtlyf/jL1ojm3FZMq5fsYq71N+wGkelMbLjeKnlW0/orYXB
         MCellQBbRSPuTI6sjQUiNWy7R7280XNHwOmnU3FH/htchcNzOHPxqMCASjL4QHabIbgO
         2M62aHn0w7jW7SQmiq12urO+5uZE72R8A1yfqABjY212fB+vsMu5WHkcghDs45I4jrw+
         yvHHCu6rauog19oZH6sJd73AOkBzb8KhPEXILAh6nKqrXe0xGu18VMn4AyS6MRPZBVyt
         Gnk7GIIRqhSCQJzO4ghoZN2hUUfXEj4Q1mfTWc4v05KGkVasCsrRLPVV4j+OYt5yknSC
         rx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3ih+6VEneB2jaLeus7RPJ8uKodK1NL17zrWykzbIObuk1I1SPJJhisKgZvBP0Fdb4/C2cpOIdsxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0sAPFo3nam8V5TNCjKWL2tfK7sL97PLLF/vWhPI5tusVHgoS7
	ADpK/DXQtRjnPiA1VkKKf0Wu75JGH7y1w89jAX3nvZEUGhpQNbkf0mOFGVZzUnnBUBhDeRehkcP
	aaoCiPeVmPqSibBwkid2/FFEgIJ3JylbnP7oUCgt01Q==
X-Gm-Gg: AY/fxX7J9CiCe0EFfn+NXdnpRvdc25IqNfIGoPKEcPkY1HwIBgAKviVnOcCF9Xh6vzf
	OVmZTK1wzFHGznTHxNa2BJY/iE4cyaIO/3Jg2ECJX+Erx13bcrno4gNJ2U/zkie+OID3S6Tfgg1
	lQ8+LfuXbfBamuKJl45VmQIAlDJlA0A2SVUOcu/EU7ocM/a1hJCikCERoDxlGcXYMFbE4zWXHCu
	C4X945ejEvDNJUnWDkzcT4afzrQOaovDqt2IWwz2t6bMoVa1kAtCpPzAzEsFd3k+pKa48vUP+Cl
	5peypAug1YlxzYoRl/oPFiT90Gya0jJVMklzVg==
X-Received: by 2002:a05:690e:d45:b0:63e:1563:4801 with SMTP id
 956f58d0204a3-649023ff038mr916948d50.22.1768358025225; Tue, 13 Jan 2026
 18:33:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
In-Reply-To: <20260113075339-GYA25466@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 14 Jan 2026 10:33:34 +0800
X-Gm-Features: AZwV_QiwlJO3ZADv09NVm7VZL0Pi5fI-J1pRA-OmeKisX5gdDwuQlnWQ0Nwjwhc
Message-ID: <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor, Yixun

On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
>
> On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > checking rule is now enforced, which requires that when zba, zbb, and z=
bs
> > are all specified, "b" must be added as well. Failing to do this will
> > cause dtbs_check schema check warnings.
> >
> > According to uabi.rst, as a single-letter extension, "b" should be adde=
d
> > after "c" in canonical order.
> >
> > Update existing devicetree files to conform to this rule. Line balancin=
g
> > is performed where needed to improve readability.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++------=
--------
> >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> >  3 files changed, 147 insertions(+), 146 deletions(-)
> please have separated patch for different SoCs, so they can go via

Understand your concern.

> their own SoC tree.. thanks

Conor, is it possible to take this as one patch instead?

It fixes the same dtbs_check warnings from riscv/extensions.yaml across thr=
ee
SoCs. Keeping them together maintains readability and clear tracking, IMHO.

Happy to split if needed, but wanted to check first.

Thanks,
Guodong

>
> --
> Yixun Lan (dlan)
