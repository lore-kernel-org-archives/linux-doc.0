Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49262253B0
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630122; cv=pass; b=buIeijH0CDrKLsCF68OcyouplFpoiVwemMxU4vpwPDBfd/fjNYJ2T/bMtADmn543v4UZTfyH5lBAyAFrLpYyAg8Z1fUXeM122QQPLBsAlb93UPiK1uXoU7U7EvUdFyt/SRt626wJB/jRaU8TFXDA10y5FNJXFoXviA2M/FQ0tac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630122; c=relaxed/simple;
	bh=GY4pj5xmpcn7UP2PeAYAwybK3ew5+HG7uoyXdtWG2wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZALddbmV9IfodmAmNRvmNJta0ziePTuFgv9SVsTGhAG9Grj5FuNfQU/i9bY/r8e3RZpQysmTfYjDL3TE3bQjNsWZB2VkELH9pm4QdVstEJhDO6Etx4kxxZViXQv76Hs/cBes8SxkTl0iSkYcL85gCuG0y4ZLzCP6nkx0g9zINA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQkNl8rg; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQkNl8rg"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-662ccb916c5so2627927d50.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 00:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782630120; cv=none;
        d=google.com; s=arc-20260327;
        b=fsG+nSqnIBYx/goRxmLGaxyNBd+pWq6KFtgZYtes/D5p61GgFBlCI3JPl2XaRSSoxS
         jSLUMIvUj23e3dmC1uC25vFX9UaRwa3RjAuaXrL78k5so/APAv1omy0hON2gXSsieaos
         IVOcKViBQbR/cLUDag9y4LE/vBX3m81Bh/67ZQ8pnr6CK7YuykjrTEQvkdfKqc4Ml3M9
         zKaC0piW3C6tcDS0hrQBsVn6YPIdEy4RV9O6wsDbRFQXO7+352mhmWtxhMqFQ/6yL7Wp
         ZuVbKUaIioM7I9OcOGy9tkWV/dfVJ3RdYTsMYvUS6dUhBJCipPiUtipjGOjdXqSyuXS/
         F4Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+OId4Ok77F5YJbguyUedoxMERWa5HS2eOIQ/JijyeTg=;
        fh=AYdgjWuWZR+M2zAz61KkvY99IR2J0uCpfzeTUJJqhk0=;
        b=PoWDgD1JnUi94g0owB/pBzjJ4WRiVBvVFDtsOJPzEZ2OJ3MTc8UGlU3K/JGwsnbsSD
         t1Xr6gK5lVFMk4lML7LIYuQXirrtKhsifXNDPtDYGWUFJss7ZVBjv0o1aB47UbKhKp7O
         8CO0Je29Ipliy2Sii4wcvJjDhRoZEWHERnqG7nNSIUIMcF5YGhU/+mUlQ4NGJL4mVPhe
         3D52glWR8jyo79R4q8frDmZiJ/RbnqqgJHyZuVugY3aEIKR7umpj9GxLJIdXnejgyvcn
         Om+YAKXGrvWI5GGEybzWwk5eAFnsWnP6gz6wOLcS6JNxWc4mAjPaWFxXTEPiN+FzzPhC
         7LkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630120; x=1783234920; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+OId4Ok77F5YJbguyUedoxMERWa5HS2eOIQ/JijyeTg=;
        b=AQkNl8rgTfKxMVSAtCN89DB2I0uds+ZfyykkNh1FuW4Ha5PIzi23m2zOXzdbZhISH5
         FcpHniGTt2t3q/3TrJ4X2gm7PAb27vsh1fSoJS6YkXMslsLjixrG4uZxCOFPtA0tUprO
         Ju0XmD8lPhg1zFVyCSP4ocqLTnEeUKwNxg/62T2vL4rT4E+/6cMTRc8BVaP18729+c/0
         mmU11K1CEfk3MyD8w/n+J7rh31HGnPbHPAnGLcM0UYmcFFl9N5I+hVPCu65ALWh7bPUr
         2MTbU4dGBzEAZexxx/dgk1vDRDCJUdrEcEgHcfvm/zQ6daWHpPzgpuVXjNWwFkSHZ0d5
         prYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630120; x=1783234920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OId4Ok77F5YJbguyUedoxMERWa5HS2eOIQ/JijyeTg=;
        b=UjR8oyUDdLyHUmuFbzEx42eDOXk0FuQFlfCiV11o14PKBI0S7v+etHBNn6JNOuLa4p
         g0E5pd9LixS23tEcMKMfs8ILN+qh+be09kG0dhhG6T3/e/WkC647tcixH3H9HAZU5Mi9
         wkHNjWs9gdwoxDYUCb1lN4f/tTZH2woOJdw9FBsSen1Md/hDfGAxhz5aZkUdloR/bYNe
         172FNW+rO72APVfrEp8zlOviuB2Q3LcAKN96tb1uPm8WPvwNHxNUH483rWYUH/OLzX28
         hn0FaakF8lisHPU5JWXLboXlhq+Nn8kwdQZosvCq+FfCMo6nuH60WAz0CAHonz6/FVeX
         dJ2g==
X-Forwarded-Encrypted: i=1; AHgh+RrxqoFgq7UN6oOVpUMyJeBYWaUiZ2WU1URdoiyIY38r3ReXQMv2Zy7yQ/nxm76ieFLFZcr7NQDriz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPvJf+5QzMrIVVnBbWKwxlRXEssLiRogzQQAjBr5J4mCBhrf8
	kT2JQHlYXm8AUFWJLGYhM4/BgfPaWGcqCzdvFoK/gfa80QeReTbqFBufd8HMszvFK0cFpVUsyvZ
	dc4/A08OVislSH/nQF6iq45necmjf+uw=
X-Gm-Gg: AfdE7ckqyvZvutOLFw/5/NHdRjwk6xjJ4Ucm7rf5UHK52277QuFd+JX5niGfy7Xgoft
	/GRg2yD2fRAKj4wWQjxZHC7uRjC6H4Bxgg8jc4vOU/ledpgpMe/WKh1DLNG/FJ0d84hRhkNxzON
	L0yGZdVi1JqqgJMb2EJ1JAARajvrD8ITDrGHcPisetbOF0u+liJgkKFcOAAgOs75onNGAKdxWJB
	jpUrXSJMwYWcKAoUa/8Vc9ZiZrSJwzdklq8TFIhDAXNuwZc0vb6yJz6MELp+wTLgw1cURK0aQ==
X-Received: by 2002:a05:690e:4384:b0:65c:4b71:e6b4 with SMTP id
 956f58d0204a3-66488152a26mr8488609d50.20.1782630119792; Sun, 28 Jun 2026
 00:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622083046.3189603-1-tmaimon77@gmail.com> <20260622083046.3189603-2-tmaimon77@gmail.com>
 <20260623-ochre-spoonbill-of-security-a4bc42@quoll>
In-Reply-To: <20260623-ochre-spoonbill-of-security-a4bc42@quoll>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 28 Jun 2026 10:01:49 +0300
X-Gm-Features: AVVi8CfRBhsj1pRWdOM2CE0sqTqASlUrWhsQBJl0HJjSQATVDmJtM7eZQvBwA6g
Message-ID: <CAP6Zq1g-dBdt=cgqfxn=8qVX=UBs5-w09YqDvHfi1y=h4H9DKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, linux@roeck-us.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, joel@jms.id.au
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 23 Jun 2026 at 11:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jun 22, 2026 at 11:30:44AM +0300, Tomer Maimon wrote:
> > Describe syscon property that handles general control registers (GCR) in
> > Nuvoton BMC NPCM watchdog driver.
>
> Why? Well, you try to answer by saying something about driver, but we do
> not add bindings for drivers. Instead hardware should be the reason.
>
> Anyway, why is this needed now?
It is needed for accessing the reset indication registers. I would
mention it in the commit message.
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> > index 7aa30f5b5c49..4f00f099b2d2 100644
> > --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> > @@ -40,6 +40,12 @@ properties:
> >    clock-frequency:
> >      description: Frequency in Hz of the clock that drives the NPCM timer.
> >
> > +  nuvoton,sysgcr:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      a phandle to access GCR registers on NPCM750 and NPCM845 watchdog
> > +      instances.
>
> Here you write also for what purpose.
>
>
> Best regards,
> Krzysztof
>

Thanks,

Tomer
