Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295973;
	b=WjsYh5Sz1EOPYmRexvomGlNq9LCSubSzTmNybROawof9V4A7twSoGzl21MZIe/lJzmER
	 jdDJTyWf1vQKBCEpV9sYjY+gPslrKLcA97tmHeKF8VJssyPLFelLQtJ3lrZdSxSCmsE43
	 /bgCtCavxszu6H9VhpUBVVOTS5W2U2yB05fIdzNnoVo+j+5IhoUrxdqvfQ0omWGCMBKHV
	 zR68IjdFJX7htf3x+tx+gbzpo/jyTYJx7hTJbCpYSl20PPY6/25QNttVPJ6WS4BoyIB0s
	 sm30zCsIzQZvqj5ABQ0KOpKB3M4a5b7ITCQJx20eWiqBofH153MtB832AgkZuRYFXYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295973;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TwRAZOxTtTXy+S3cTIsOYqmghOtnES71mWdup4rt0co=;
	b=txzWkB5g/sgHWEAzTEbJYIL7opmhxECK60uBGYaTvgdCW2FHVYkwqh+deJqY7m7J90yj
	 gW+A6FAuYGVNlHA/V7VZ0xSECqR1h5mjRXu28QB4mdOWNTrpQdNcBcdgYaykexJjAQeZX
	 3FGGR1SC8kthAj8NZruAacPWRQktIhwg0bomIJWVYm1Wqg+lVQUTTI/AgsCmpx5QHrnpG
	 54F/1PKmIzoLmVM2kvPaR+G/v8OihwpwFWigpZwqV9IICQEdvbBmNti04bMYZNdP3Dt3/
	 IiW3WrfeKmim2OK63Pi4UALt5eHU6l+Wkd3AzimbXTSDYaw6wWicxji6tOiKcVVjxkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhMdTVcv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8214606A332
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhMdTVcv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559D11F000D2
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795295973;
	bh=TwRAZOxTtTXy+S3cTIsOYqmghOtnES71mWdup4rt0co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhMdTVcv7hTTIDYEMkZDmUO3HkhrUrXxLq3vHaLlCKM7YzylsICoYIYrTJzEPLoo9
	 74m27GMvvah0DCKBWuQ6PrnTPtuQi0Mj5HochkXuFFLwSUgkupkE8pd+D4gi6l8yMY
	 WiUsK6auPbm+CABDYq9ad1u8O4HV35tHtAx5BB0lbe7E/mMLpijZg+MBBW/og4WDVH
	 PnrfIXeF49zLuvj/Zw5vW+24lreUmuBdqsnfKXERsHh8i+AdH9+H6q+Pj+wwBVoq9c
	 4qZChs2Zy+IC0Q+zSRy0r9qNqwm36fY+aC33daLbfWwMzTKC/LoszT1mf+BmYgeGrY
	 KtJv2l90OFpxQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso2531642e87.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 13:19:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtNaha5kAmydoVytz6EmwoKL5juOerCYMj74gkJnL/vjjMhmUQ9ze1QwmnypbLUvpPQeGn+7RlEiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a2+groPogPHc1tCeM+b1YM/2ofRYMIk8sEgh1Hugyb59cr5+U
	VCeZSdRyw+Fa0IZk+GhIpvk8ElAgERWEEpmxWvimNtR0wRqJfCTAmUZyZJyHOXXJWFfsKsd8kG3
	uKfifmlWdFQCrIC63UfxxzzCiqI3OVMo=
X-Received: by 2002:a05:6512:2c90:b0:5c1:7c6a:fefb with SMTP id
 2adb3069b0e04-5c1bc822245mr1829531e87.5.1795295972116; Sat, 21 Nov 2026
 13:19:32 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-2-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-2-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 22:19:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLma8atXB=eT8TvvYfKMg=h6YGPY4THsYhLCeo2VumeJrw@mail.gmail.com>
X-Gm-Features: Aa3M54r702fjHjrynCh9jy5iyOc-dutIFRI6s0mpbPcKoEHETe8434E7oYhGyyA
Message-ID: <CAD++jLma8atXB=eT8TvvYfKMg=h6YGPY4THsYhLCeo2VumeJrw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan, Jean-Philippe,

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:


> +/**
> + * struct cla_dev - CLA device
> + *
> + * Immutable state:
> + * @cpu:               The CPU this CLA is attached to.
> + * @dev:               The platform device.
> + */
> +struct cla_dev {

Don't abbreviate compulsively, cla is fine, I would
call it cla_device.

> +       unsigned int cpu;
> +       struct device *dev;
> +};

I will argue in other patches that this should be a proper
struct device and not a pointer to a platform_devcive
&pdev->dev.

Yours,
Linus Walleij
