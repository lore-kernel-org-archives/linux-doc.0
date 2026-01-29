Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2931E5B70
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769658947; cv=pass; b=D+e23So2t7whVADQEhTc2xwPjL4KCGUB1JYRPArQ3JAcR7AGW6E22C1UjjfOHcADe2uuHx6pcemmVS1tFfaWZJ90U6TlQeMTCzCB+TGReQqc8jHslh3P2/2J8cf2Hc+3nXzO1vro5Snf44LB4TVcEQuAso88GOXqFfeE69JYT2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769658947; c=relaxed/simple;
	bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nr4hOa+8pe2H4GWTKoAoKnLzpEJjklPQtit68UpWrfOiqOAw49tn17HQSqX4ENT23sI8HSpoStPHHPPULSRy5rwjG+C5h0GByp2sY7V0ozA+jnqiJpQsWUznDYQZ8yeJfpsDWmSyny3o6UqEXvQuQgf0hYJvmPEk4PgDOzG5jik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb5j6+FE; arc=pass smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb5j6+FE"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-88888d80590so9380456d6.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 19:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769658945; cv=none;
        d=google.com; s=arc-20240605;
        b=L88VHCne9YkfRzuouGPuz+FTu+e24JBA5UYZTiunLTaQ15OkqgFdxhJOLnTGen3cLM
         Hqd5VM0ynjHNP8sxp0wkYP7ISOuz6Y37yeuEevkedEaXNm4AfBeRClgM4VJcwnosr0ka
         qq0R5fmtT8ZfT2AF3uh9uH2dC84Qj8RFAn6JtyOPReANlGsHdzSd1SO+0JUCTqqxyjeF
         MWRsO80fd71xh6/WKfcxPD1MsXK6MoBruBswWnrnbTefS/C+6ehJZ8VLARlWS4JcTvNA
         4lqOeDZUA/KV7wjLhxuhO3cVqJqCoZzgxbXj5y52/NjIOo69ejDla1KPsvdjf/LBAcAF
         JrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
        fh=CXHjut8y6Ys8Dc0uRseGV8lOOnWLLEuJcIIR7Oph5Ik=;
        b=OZOOwC/DOCKyeLRYs/WbhjH+HsAZjNY7YHB+Jlf5qKb4XX1sznAv/vckgUnQgT0+cR
         DFpv2+vBoHZTjN/+x4jNMZn3vURQAUKr0iGfq1lhKogLP64ldOMeQpYxJmvGkcOMJQTt
         9kUEg625EtXnvrgaiTaz3moG98zp9DDVPF5ZbflCmb3yKKBPvxz9VyKubEEKoK1DbB3G
         HM7OQ7Shi8JAFLhc2vuaj8d8XlELPUD55T6VjZz7DwhK6eU8OIiNrREqcPtNcfC5yc62
         +ST17iX1BG0vq4CVGVZPoeOy0DfW8RV7tJ0+VChJN/gTPWNykNZcP2pOZLF4HffYft5i
         JOBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769658945; x=1770263745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
        b=lb5j6+FE2O0Pl62pBEhMsNfLi2bWioImX+YbzHIDJk4U2UjdvonV9hoEojHeu1HDGU
         ba9+vJKWf1JgciuIV0brHuUb2cXLpY+i87GPeZ3NzF2nlRluwxkLtohrda4B2cyDQmuv
         QKBBR4tT++0NpInsKX2COkILgZq4+SO1iCr99j6B1qV8SSxithPR44AxSL9unhlsMynZ
         WvZxyvrSYf/7P3kQ1uEPugknX2eFqjtca+Q6W68zkBAH2dcFkWm7rkGxxuJp0ZME/a28
         +Hcmnnd1SMohD30jCpLbPFXK5AnpHyZz/JP4CVz2Kz4GBOQSSW1rOFr3rDLAQ4IfnJa7
         6dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769658945; x=1770263745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dreyxwAadnjRw4GmLNjYV9KTAhpZn4PH/bUL/r3ljrU=;
        b=ultCE4jPKzI7JbNR8aBuQp5U+3ZtS1aW9vR7NqsWnM/o8Zd69u+xW4JVIlVTVUIr/8
         Wgv414BHo+JydJYREfV7LgC98uptiAZ91omgTXPUwV1VzsGwMhiHF9mRX6loFbOPlRYB
         A9LY0QDKLGIpTOUbJgDIkpzCW3QOb+uBbkOmytOAehM8Rv6ukVLMZOJabJMmfeZKqz2f
         QrLaOu1lXGrO7UAzxl63jdocbMURFxpqL8iAuQ1hkwIYeK/SSm8WVrhdKOibhmG6MpcN
         eU6zzOrppFD6Pqvb0H9E8NKqQqmuu4FGBhQBKBP4TkQiCzQB90ZagTckJSAiEWi1rrQa
         GM2g==
X-Forwarded-Encrypted: i=1; AJvYcCUHNMQ25ou+KHBWCSmKmr9Bg7RZPlX/3v63Fj2lMU7dWOU89hyeOmQbzwNu+7WvBVT7ReKPOl0gHEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEd/vvaz0TeS/YQZJa5SrUBrqFy8kBFZxqHoclka43+84CE0tI
	iGP/Dm0fI5BmCtsiWFsevtkcR667rfElnKXnEU5OxItSvzdce0mW9c15JPHtDoeO7p/ex+wWnfx
	ZhIQvSGBDzqXi8pRzuSCQrP01XfmvvTg=
X-Gm-Gg: AZuq6aJ4+p3Hbpq5wSndq0eWlOSGaJyzCKX9OcitrcqssHIAnSxSUK9c2jOJs4HwTs+
	G0C1/wNmj6N2M8wuMKmBNLFVKqTVh/gKy3KC96QJXmrSu/U+K0TIOyva4hw7Fg+34qFToUq7Plm
	a/jaDdAj/jdDRXAvAMxbevoCs6bYpi4MkHnWFQj58gtt1FuCOgTiVLG2Mdwy5G+hsn9mjn3yPag
	yc97DMzUvEr9HxtsVUKcD1TwCWTOmxnYigY4zTaX9UtI/YGPECl0k0nJuMVtTbYYADMqUQozhiD
	rLqCQ2av1C+bf07n7azqjFE/F5oDE6wTyyZ1yM+UCj/VTM28SynO3eBF
X-Received: by 2002:a05:6214:d47:b0:894:2d44:509e with SMTP id
 6a1803df08f44-894cc821c27mr116372646d6.23.1769658944665; Wed, 28 Jan 2026
 19:55:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126031352.22997-1-enelsonmoore@gmail.com>
 <alpine.DEB.2.21.2601270110590.40317@angie.orcam.me.uk> <20260127155607.3f80ec99@kernel.org>
In-Reply-To: <20260127155607.3f80ec99@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 28 Jan 2026 19:55:33 -0800
X-Gm-Features: AZwV_Qjhl5q7xOvj31R-bM_rs_0zlvr3v6oaj-AmWEWA1eTbTy2My24hcAGKR1E
Message-ID: <CADkSEUjfBQLqibc2zrcWHhOwu7kUf8FceYDfevAFHV4rCqsUUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: ethernet: neterion: s2io: remove unused driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Takashi Iwai <tiwai@suse.de>, Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Konstantin Shkolnyy <kshk@linux.ibm.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Dong Yibo <dong100@mucse.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Lukas Wunner <lukas@wunner.de>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 3:56=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> We deleted the vxge which I think(?) was for a newer version of this HW
> 3+ years ago and nobody complained.
Yes, it was for the newer PCIe version of this hardware. Since no one
complained about that (unlike when fealnx and sundance were removed
and then restored on request), it's even less likely someone is using
the PCI-X version. FWIW, 64-bit PCI and 66MHz PCI are even rarer than
PCI-X, so there's basically no way to use this card with reasonable
performance nowadays.

> On Tue, 27 Jan 2026 01:19:34 +0000 (GMT) Maciej W. Rozycki wrote:
[...]
> > What's the gain from removing a driver unless say it's broken and
> > does not build?
It very well might be broken. When vxge was removed it emerged that
someone had reported it as having last worked in 4.1 and broken
somewhere between there and 4.4 - see:
https://bugzilla.kernel.org/show_bug.cgi?id=3D197881

Ethan
