Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C804F31CA54
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368622; cv=none; b=O7puSBnfegw4yGc8W06KuwdHdJ2ehwOmoJWTNaXB27Fn5Y2XO/dHqJT48TNd8UcLC0MhO+7hrGQR+fmB239VPLL0vivx1KT//HyRUznkB5xLFzeJoBQILFPuQqdlLFx15y4tfAwOQiZrQmyTDEIrLw9rKadOj9Q1zyXwIZYcvFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368622; c=relaxed/simple;
	bh=jEs+PHPYbJw7U8D6uJYIzwCTNaKJLPOsD13HrSyQVcM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GwYyUk72pWrl+Me2a+H9E+V9nz783glHokCoXspwhoAcfqoFQMEq+KravJtk0xGhJ+DOCzFml28tc66GA7lWhmEVmHbHrW9sIADbXBLHIZ0Ce4UkMkeBKIVC5mZxzsFQriXdRt+bvlicJ+dkFvVzfOQffWUIIqS7pe8jfvCSQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8F73YWr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8F73YWr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so16981645e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 00:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763368618; x=1763973418; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jEs+PHPYbJw7U8D6uJYIzwCTNaKJLPOsD13HrSyQVcM=;
        b=k8F73YWrhIGHL0elago5POwDwQZn+mUaiid5y3j2qijqDAbM5qLv++swCI+hJo+RRw
         jq/A6KY6gSSDYO8rTi4D5nZ22wRfKjr2JMlDm8WSTFwsJ6/3g9G6RdyKcyfSI11xk284
         UsTzAqZejnX96XIKOvu/mCPvy8t/Znm0nXcLUtlp1W3GeoxXndSEJsFv5+wi/GKI7sVW
         dsp8ajXuNgpu7VwNapN7G5DJ47OLj4Ueg0DojdXygVeyM51YYZd3uJOoh8B5XdPYdycA
         NGLMWt8Zo1jaItdRnxIHNNELxJ1x7Gx5Cbc/aMIDAKdOsUFWeFIQNKvj9PENFC11o15/
         T3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763368618; x=1763973418;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEs+PHPYbJw7U8D6uJYIzwCTNaKJLPOsD13HrSyQVcM=;
        b=PZQU3qwAZk43V0u1LVj6um9CbJnJ4InEncJZe+G6gRKWca1GyMCMKetJhY494p+JHi
         0bzOqHNZmroKC9jM2BA+fNA+Np2b/dOmmxuzgA0m+7qKcHyQKz0QnagEmpE9vWFLewsE
         GAk2GcYKZkAVcP/3QoHSkVm3uCBZTNXk/sLS5tZZ+DPDw6+MtJRhKfpfbpbrOjFwOm9+
         FAnR+PB+kYkJ8uuQfgNAruV2+B7Kq/vP+xf0+bNJMTC2FqRSOxOC43tiHpQQC9IMoAkK
         Vq5RD+SgP7KlKWnH3qfkRGzs5iH9zBtWMU+4VM+NGqmIZk0XxM1LwefTpq/nsExZKNRR
         En6A==
X-Forwarded-Encrypted: i=1; AJvYcCU9/KZIb4ciCFHl8YU/5kncOnR6hIo/B8RTjVdei/Zvk5MWIEdP3shjsd/ozus3htb0hZB1PPXr16M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxobPIb/83g4Gl6zeHeb0yGiSe9YWN7SuVrcO9OrY22kmTi32Ke
	Cmc4abXhZcmbgPpuPFsYim5aSxiJBPBPBjE9w8TdW1p1t3+Rj4fIG+lU
X-Gm-Gg: ASbGncuBp1nlFSkfv+CuzCF1dxQoKiLzR1mynZ/v1mXORa/CUglFUj9vBVxQrl+XG0+
	DhAcDMGVyvjF0x2lpcjTBRBa6E8JHzqjm6UA7l6uldufURixtLNJSIeJmyAs977WnafWY3CLz0d
	F+B7ZKNTqN+zbBI0f5eLQbOMyVYU8evPKDFE9cQBwNyXFjIOn+sTW2ZSNRp0hOb6lycksdosYXy
	c7Oj8Mp5hh89rO6I7kzy0va06qOvUEeFHhLPVs4sjS9A1i7wELSAkbBViYIcx0rpWfFu+3LoZN2
	bcyXE0qZghYQNVVAEnIL6s/DfNC8QgDbcmxHr3vwQO+Ga31G45cyvgoKPZwcfPxnE5vSnqxzCcR
	Zsv2PR/GAfhVyaMNhq2sAPGStQmBbIibYs0JcpO8wkYcEtS3CCUF46FyfJiuK2RasLbGxfBwav9
	2WmvUP7JEu4lGkawdxbxFOTPpq1n2M5wdpXlt3dQk+NOTaHxOn
X-Google-Smtp-Source: AGHT+IFqvqIxI3ITQD5zAT/7ZzMljZHFUVUN0MqCI6bwlrhpUcItCKNOlBNAb+KExRAYyeuF5CjMag==
X-Received: by 2002:a05:600c:450f:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4778fe4a05emr117954545e9.16.1763368617743;
        Mon, 17 Nov 2025 00:36:57 -0800 (PST)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d? ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779527235esm154459915e9.8.2025.11.17.00.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 00:36:57 -0800 (PST)
Message-ID: <8c81552eefe30cf191d1d422ab9a5d949284e7ac.camel@gmail.com>
Subject: Re: [PATCH 0/3] ADF41513/ADF41510 PLL frequency synthesizers
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rodrigo Alencar via B4 Relay
	 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org,  David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet	 <corbet@lwn.net>
Date: Mon, 17 Nov 2025 08:37:58 +0000
In-Reply-To: <20251116161023.7a4b1b6e@jic23-huawei>
References: <20251110-adf41513-iio-driver-v1-0-2df8be0fdc6e@analog.com>
	 <20251116161023.7a4b1b6e@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-11-16 at 16:10 +0000, Jonathan Cameron wrote:
> On Mon, 10 Nov 2025 15:44:43 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.o=
rg> wrote:
>=20
> > This patch series adds support for the Analog Devices ADF41513 and ADF4=
1510
> > ultralow noise PLL frequency synthesizers. These devices are designed f=
or
> > implementing local oscillators (LOs) in high-frequency applications.
> >=20
> > The ADF41513 covers frequencies from 1 GHz to 26.5 GHz, while the ADF41=
510
> > operates from 1 GHz to 10 GHz. Both devices feature exceptional phase n=
oise
> > performance and flexible frequency synthesis capabilities.
> >=20
> > Key features supported by this driver:
> > - Integer-N and fractional-N operation modes
> > - Ultra-low phase noise (-235 dBc/Hz integer-N, -231 dBc/Hz fractional-=
N)
> > - High maximum PFD frequency (250 MHz integer-N, 125 MHz fractional-N)
> > - 25-bit fixed modulus or 49-bit variable modulus fractional modes
> > - Programmable charge pump currents with 16x range
> > - Digital lock detect functionality
> > - Phase resync capability for consistent output phase
> > - Clock framework integration for system clock generation
> >=20
> > The series includes:
> > 1. Core driver implementation with full register programming support
> > 2. Device tree bindings documentation
> > 3. IIO subsystem documentation with usage examples
> >=20
> > The driver integrates with both the IIO subsystem (for direct hardware =
control)
> > and the Linux clock framework (for use as a system clock source), provi=
ding
> > flexibility for different use cases.
>=20
> For v2, provide a little more info on why we need both interface types
> specifically what you can do with IIO that you can't do with a clock
> driver.=C2=A0 Also +CC the clk driver folk and list from MAINTAINERS.
>=20
> We have evolved to this dual interface state drivers, but I'm not sure
> we aren't in a case 'If we were doing this again we'd never start from
> here.'

Yeah, in some devices I do think that we should likely only have the clock =
driver
(for devices where we only control the channel frequency). For others, we d=
o have
offer more control through IIO which adds some value.

- Nuno S=C3=A1

>=20
> Jonathan
>=20
>=20
> >=20
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> > Rodrigo Alencar (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: frequency: adf41513: driver impleme=
ntation
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: iio: frequency: add adf4151=
3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs: iio: add documentation for adf4151=
3 driver
> >=20
> > =C2=A0.../bindings/iio/frequency/adi,adf41513.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 268 ++++
> > =C2=A0Documentation/iio/adf41513.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 377 +++++
> > =C2=A0Documentation/iio/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 9 +
> > =C2=A0drivers/iio/frequency/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 11 +
> > =C2=A0drivers/iio/frequency/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0drivers/iio/frequency/adf41513.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1435 ++++++++++++++++++++
> > =C2=A07 files changed, 2102 insertions(+)
> > ---
> > base-commit: d16d1c2553248f9b859b86c94344d8b81f0297cd
> > change-id: 20251110-adf41513-iio-driver-aaca8a7f808e
> >=20
> > Best regards,
