Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6B3815E6
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152327; cv=pass; b=CkBZO3T1IVT0mrx334Ct9d7MIMK/4oENiFPt+95VE1sNcxJGJw4saDppDT2EIa1CtlAtX8a488E9l1n5cHoyFRo3gKVG2EyfC0EFYQKufeUdx9r4wGgrTg76hrkh6BdzZagvMjICcjxNROtyDDPhRSVBcsW0xLYXnexdaL8S8sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152327; c=relaxed/simple;
	bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMaWIqIbpR0Sm+PuL6Lclv5eBdei09khOrX+EkOxWBdqK7JMbOB9BPZgdEOxSmyE5+MEHq7LQ5wtH16re3jhkgkz8ns4yUvOiG1fuOXwHZ1XvhdS+PASTaHwVmnPngZyM90vUMu1qbQbmzkQM7LMNOEKb/OZUUxGKlPfVmE0GJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NttemEvV; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NttemEvV"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef19aso7629321cf.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 01:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790152321; cv=none;
        d=google.com; s=arc-20260327;
        b=D0LE7Umk2X94oWc0I1j4y2LAB2kt43rcDFrH8yCabRS/0C3yg4AMMAdXRatoLtrVgh
         qY8ZjeyYzsNJ1FAc/xL2VQPD4AhbhQKKHJZXP6Zmq+8b/jzHj5uGgP25VrvTi+xLL1kV
         Zho+JdSztmjDNwOEwK2/SeobnC2DxAMKq+JIPOdPPaEvKDa+w1iLGQk1IaAGbQHmUDmx
         ZHBsRhd0YD16gktgG9BaYg4JZYIwt4dkJpXzNlcO6c8alPym2bsflxG2/015cWOACrZ+
         9z3jtr3ulx43lSWgFQnfeakENoK55ceavppe7laYUwYovPLJmMqjZCW7EuVdPBedmHVo
         cNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        fh=ras3bz9s1kNpJKhWV5ssSPZc9HB9bA7ABtlNl753KM0=;
        b=g2R2ANGSaGLpHJVdXKKttYdgP3gpnE7U7LjefuGesySICDMqgZJuQqoMbenJTMKiop
         7lnloiMzG1XWHBTbnBDx7w7uBN16Fq034kzZ38CNSF6+0+h3HExJeDsP5xfJBb10hshg
         Q9rHv/bCJc08Y8qPSJZhluDfnuBQh6cd3o8UfSSoXEX4433NFWHK+UE4j/Roz6vC4ikl
         RawGjkMIpKWsVyMHwnv57lQwv1hNMkDdeypPCkPIgt5Afm4xdh0yIEq606TZU68hd7tl
         suelpfOhGI6iJmPLH+exELzdZmnaYWG2oVtpilzsxoobMSgoh6mwJRmyliDk+B/Jmubf
         VOBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152321; x=1790757121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=NttemEvVe7HFiC0/n/2XEDffB6Gz9Bwgh2IQ+eKH8YlZfzHQDCt97R0Pf0SBqu7J+B
         x5TAnZ2nbcGlg5c0V8jzgCQ941hX/sSI0Fcq+hf76CdHB2R8f0ghVDmUecGAYgN+G5KO
         ZKEEX86kmYGOxsXxn3cXgCwZAT/Vmw/BurKFRF8EdBV1qaw+UZVzYi5uFyUTcs83u4re
         cqobkZO51m2W0kNcd5dWweVPDxm9Peqc98eG+dPHQB8MPGsIIrNJillu25v5nsarat3U
         sjnWGQfyJKfCOj78G2xLuE+o7Uo0+OD8HxiyUUFok0zmvmcKNsERfHF8/jM15bBzsZWv
         O1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152321; x=1790757121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=plQxnx3aZEo70cDLRPWjQl01T8C7l6w8HLsFMz7mXJk+zAJJRpgL0ELIufj1Gn0I8e
         y9MHbO0Ug7pV6FL7neAocQV+fZhFP0JjKfjqIYXGNKEepqcp2X06wzpu3qLAx5D7n90v
         /Bl2ATCiNGFYKSpGhrP4AbGjku6wkZ5PP8SAY2nqpXorIEujwKOHxerCGbGuP+SuJGsK
         A69d4ASlA4OLrbyoJR5GYUM40NxnzEGuYlvlrNB3Fg6GPzV7UcNWIOgm1nx4hKw1E7+4
         LfgzYTCGWyzGzMug5QbtBpN0rcpAvFcbnyEabyNhy/feaCJziI4hP9acPy1ZowXMI3Sh
         FrAw==
X-Forwarded-Encrypted: i=1; AKwUvBzNfzAY+N78OAYnkqhLws730L3CWQEcG1EdG5I+qt4+N3/pcWGMRWWyaKtmC1Bd9WU9k603Oot3mDs=@vger.kernel.org
X-Gm-Message-State: AFuF++mdAO1kzB+Oz8bLGY6CZvuS0ALH1cy/FTSXc6+noBWVGpawZ4MS
	t1KBDookE+7gt5zRpvzp/ge4DTWvAg0ua8OAknyKiJJYkr1+Mi7M61TqwhPuOmtBtywB0aVPg6g
	81K0GIgsd4htdTB+Y47VFgFCWXDC2etI=
X-Gm-Gg: AYBFou0T54Y8XxtydZFa74o+nRPbxJkGJSp/VBZT6cjc9Q/hqLk26FgSUy//qoYP2cw
	1i5DdhMJ1x9Ozyt1KAfw0LyTo4ncWnBA+0xGlxAE6xVuBehz91/hjEAvBtzwQtFDhtg1h9RGxoR
	53R7MjRF+3wzNHhvdQq+pYm3mQfn9KQHPxtWXT8IWrQJl1SmI5qZmrNdrUdBQL/uE3aY4FdtSxr
	2UZ560+6GfnDGEEcOEKF5/wdLBC6uv1r1tYjRUWBXco4nV7w/eAhEbCcZW3DmH5bg09ebNMWh97
	HDwL/3IjNFo0BRI6AKOpJ/FUOkLubM25Q1AtopyplAOhyw//4EbrEC+6t3hqVb3e
X-Received: by 2002:a05:620a:6017:b0:93a:2d15:f84 with SMTP id
 af79cd13be357-93c2511c2b1mr290767285a.33.1790152321118; Wed, 23 Sep 2026
 01:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <20260922172514.7feb6e7c@kernel.org>
In-Reply-To: <20260922172514.7feb6e7c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 23 Sep 2026 10:31:49 +0200
X-Gm-Features: AclHuK8jGec2XT5CWPXvYVvV1bFvl8hmA75zakqIakpr84shp0cAZGnoi6_G1Gs
Message-ID: <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:
> > The remark on the fwnode patch are invalid. The driver is expected
> > to return those error as probe defer is not supported.
> > (a notifier and late attach/detach is used to align to phylink logic)
> >
> > For the specific Airoha PCS driver it's really speculation from the AI
> > but HW doesn't work as described by AI.
> >
> > The only real comment that is valid is about the alternative way
> > to give supported interface with the .get_capabilites OP.
> >
> > This is currently not supported as there isn't any user and it will
> > be implemented as soon as there will be one. It's really to limit
> > the patch delta of this change and to progress further.
> >
> > Maybe FIXME might be suitable?
>
> FWIW no preference here, I defer to the human reviewer.
> We can treat the AI review as a hint if human reviewer thinks the code
> is fine as is.

Soo should I send v17 to fix AI that failed review?
I think I didn't got this detail.
