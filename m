Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437913;
	b=BxxlpSvEdnxTnilj8rlLsed2g5eJuQWnuy3DMJJSn2rTbpDtpLjxNpVkbVPKZX6q3fCm
	 YtC0QrhwUzV8zlR3UIcEmEYntnybxTiHF1hqScSxI9+UmtUTuJfYJdDhhfDaKjzY3/Egx
	 uzid57hLjoqq5HUMqhE2L8L6+A+0dMpl/H0pMGGcdTlRFlr2msvYNuj/qbCVgx5XzqekO
	 IHl/T7uc4wTB1/lIejf2TawBnKRjrDIXL1gG2KNVxbRHsynlDg7v+otek4FhJamtWeGlp
	 Iabz1AZCbdIm3Q1+vfSf/tDO3PKbhOoV8WFaOAdFMGIxvV/IuekGFCnfO0Lv0X90emQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
	b=Y6k5m2y6+uVrQbPicT5uMIxU5lj2Q/RGGZ9q9G+h3vrYA45sAh/TSY5DZKIt9GY7sx5n
	 4me6y7vn7xoE5BmTWPQWJKcv8S8uzXvGnPF7Yf+SHKZvHtjAojjm04yb0en2N5AOVUbk0
	 8FkmwIQA5kCxLhmYev26StCwgHzDDA4Bo/VPLJROW2iyRMQzOYuWh/LuOd46yg0WQ/EYA
	 XdBZHkmMpC0GPidsOoBMQxwbWjl88Gd3HJGieZEW/xrZtKfMxdx4xBQQwGZC+a21j/EZL
	 Lg38h6+8ymppeS+cG3eXgRJVHCDC2mS5LK8+bbQf6O9Xwwo7Wi9wvxzXAzRSkuGG1kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/OWlvIw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED7E606A32D
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED7E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/OWlvIw
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9210f2622ccso41500596d6.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 04:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795437911; cv=none;
        d=google.com; s=arc-20260327;
        b=s8i8abV/IJJ7K3ObkB/dugXyRbzyO3hOc7kLnDXZJ22mv+9RwdmQMOU85vMKaTWZyQ
         +LphzW1z95qjwx0aluBwCbfRlABT7UHF2pzoIDP5O6QKFkrub2iyGqK3q9/QFWSbw4/H
         1Ty+4fn1ydyc2R+8h/oJldWyQ06ePbzXdqQ2XQo7UPfHJlkcbwWfL7EJHuT2iJW51a8i
         m2rl2gi9SmYp2QRqG30/oJJWiVJ6JU1jEV5Fslt9HnGV9xSMuHIGlAICEcSd0fU/4kpL
         ARuCnKPUGfgIFP4RNxZfra5rAB4CEMh/2hjUIOu+5waMDYji1KDNEQ+6qOwsvXVcCYw/
         QaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        fh=mVjTJFFVrQsqrCk72TTtz65nvKdIcrggG4sU6S6kqVM=;
        b=sROOXHrsDjfdbnpJ30ohovmmYhsAsM3j/5zobpllvcUh1lTJNWjewzfzH2Vv5sTift
         DGg0ciG3fxNn6JxD9gcGm150qiVP9pDEQ7iTmgVUvOHtHebCO7Fi20Sc8iVaKuilqC2v
         zMO+QeBk0VTjPUYwSzd0q6b26htakS8d2DapDODUGlP6OLDQkA97igJ/Jd3l67QNuFAL
         8rTnvGKnISqwU3Z0LJEqJnpo18LIMNimU6rx8+1X967uukWkjFQ9Oe6fj8fmllK+flqZ
         w8wJw0nBcHujjjmOB4ubsT0jrISBay0cYqiExlwjHDFkrQ3ovyXIYyxv45+RkMr7YtFJ
         a7Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437911; x=1796042711; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        b=P/OWlvIwki7NIRipOUdk6t/vKOD1Jxhz8y/qb7dnEE4ruyiUIcDfinAGJmeuHLcTH2
         KXr1mqY6thscQxlC++Cqye6tsCFsEvOtslxbfYPWiHHse0ucW0B1x1NOgMCRaaSfjcu3
         Y0HinV2jM/CbqpPuBWCXee2JcovPumtZka1KC6VQrsPJkdrLX1eNlzGdz5RypenKlSpq
         MXHS7Jg5OrHpj1NjuQnuRjKm0bgcrL7gRSEBwxX8Wo+fvwiLmq94aYzfNKwD4hPlEWlY
         ofDYSA71bl4O2iWnUS5BYTnQTodEtJxNWVF31XbgOd3hZWTHgwWLfBkKP1/OSeAE243x
         TCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437911; x=1796042711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CAL2j8QXvL//pfGVziag+KoxLrraiNkA6FIwTqOpy24=;
        b=GNYJJfmKSp+ypBr+PNvobM4xzFLD0q4a2UZgoTqogTKQAhh1YhtASs9AzWux0wmqgW
         j7bPyOO5hmkZXNrYb84mUVdC5GEhHhQOQEi7wi4VvwVyby75Si+JJna0CKdmUJhYgktm
         pEkug5xq/8uRb1nJXmzePmt2q92RSbLHXldOFzeeUuzczCST0hp04SJtpWMmzwPSmlxx
         KT+yEq8e81u3beHXrS5S8F7t5SFeJaHdtuYnUqKJr/zjiS8i1jMov7bSSSRuiDJv/rJs
         fsPRdYWvY/73/qZZE087hWXCY+g4MWo3z7/uSyRQZ5pr30UcwxUkubMguxmmuP8pv8dV
         oXKQ==
X-Forwarded-Encrypted: i=1; AL+hErGBeWNbqVgodpjG7+PL/61dP6kfmYBggtEO8XTU8JjuCQR5hRGyYFqy3bs9nezd6Zokzq7xFxS/XmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pHkeIRx0L1hMPpjxzJwmwmDrlOL+j2mJb5EMpESU8uCP5kAL/
	fYwV27oYo04b8PrgJWWBzWkNZlrYqfaPqfCQjMQOmBMMkQtA3JHMpI4aWq8t2ROFwL0eO+UilEy
	XN6gNAg6Jh1VGhzzndD7sl1FiS2ezm3I=
X-Gm-Gg: AZFdTZcXfC4CNH0ez2OvUoH6i58fpT6sm0kbVKEGGJn1FPxGjllO2Jxe0P2LjuXIALt
	1cqziLwgQ2VPfBmV3wAtJK6A2CquoVtaL3bkkquXT6gleOJF6/2Lo1S9otKlV3y7DPh5On1vta6
	9H4nHdDp9LurdT2HQ3EL3iGzfAtqV+5Q3LT/nug2YCqs56LQezBAieqF2ftJlUP6CHx2KFZkXnp
	/z2i8pV6UsVQbz3DQbZS6nh3F90qQmfZyNxDV1YulaZ+PY7zJSeQnvPcirbEZkE56mVuNmAOBOn
	qQ7owlKYOOORowhwLtkPWIK+V5E3b5AWnfHQI+/gJbaF+JMMBIt1N94CnwiTraIs1uaoQzv3Tpa
	wsu2vKqKDq+OBmRvjIoaa+hUvjouuPQF/ADA+x6wQJ1VmK7SqT2X783XoQakLWHz0AAH26s2mPn
	ks19HHq5xE/XS0lV9V+SxE4eWIyg==
X-Received: by 2002:a05:6214:440d:b0:921:1ac1:34e2 with SMTP id
 6a1803df08f44-92134aee700mr213563336d6.24.1795437911221; Mon, 23 Nov 2026
 04:45:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117084748.2387647-1-jonas@jonasjelonek.de>
 <df35e0d4-9f1f-4882-bc6b-257add4e9fb1@lunn.ch> <6fecc631-e493-4e05-aa3c-61a8b0d2d1cc@jonasjelonek.de>
In-Reply-To: <6fecc631-e493-4e05-aa3c-61a8b0d2d1cc@jonasjelonek.de>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 23 Nov 2026 13:44:59 +0100
X-Gm-Features: Aa3M54oKzn5UdFFwG51i21B9Z58VromwpMQTF5kRSx2z_fy0ELZVeYW8tGG_qX0
Message-ID: <CA+_ehUy2UYqELMFhh7Gf0JZ2uwVHFg4kGFbz03DosfgQC5buJA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 0/2] Add Realtek XSGMII interface mode
To: Jonas Jelonek <jonas@jonasjelonek.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 23 nov 2026 alle ore 13:36 Jonas Jelonek
<jonas@jonasjelonek.de> ha scritto:
>
> Hi Andrew,
>
> On 22.11.26 22:24, Andrew Lunn wrote:
> > On Tue, Nov 17, 2026 at 08:47:46AM +0000, Jonas Jelonek wrote:
> >> Hi,
> >>
> >> This RFC adds an explicit PHY interface mode for Realtek's proprietary
> >> XSGMII transport. It carries eight 10/100/1000 Mbps ports over one
> >> 10.3125 Gbaud SerDes lane. Each logical port remains limited to 1 Gbps;
> >> the aggregate serial rate is not a per-port Ethernet speed.
> > We should be careful with naming. We have already have QSGMII and
> > PSGMII, for Quad and Pent. X is too vague. So we should somehow
> > indicate 8, Oct.
>
> In principal I agree, the naming doesn't really fit the others. I just used
> Realtek's naming for now, they use XSGMII everywhere for this.
>
> > But...
> >
> >> Protocol identity and naming
> >> ----------------------------
> >>
> >> XSGMII is the name Realtek uses for this interface. Calling it simply
> >> "octal SGMII" would describe its capacity without identifying its
> >> protocol. Existing modes such as QSGMII and PSGMII already distinguish
> >> multiplexed MAC-PHY transports; the PSGMII introduction is an example of
> >> adding the generic mode definitions separately from a driver user [1].
> >>
> >> Cisco USGMII is a relevant comparison, but equivalent port capacity does
> >> not establish interoperability. Cisco defines Q-USGMII for four ports
> >> over 5.0 Gb/s and O-USGMII for eight ports over 10.0 Gb/s, using 8b/10b
> >> coding and a packet-control header [2]. Linux already represents the
> >> quad variant as "qusgmii", with its own control-word decoding [3].
> >>
> >> Realtek documents XSGMII and O-USGMII as separate RTL8218E interfaces:
> >> XSGMII runs at 10.3125 Gb/s and O-USGMII at 10.0 Gb/s, with different
> >> hardware strap selections [4]. The SDK also distinguishes them in
> >> phy_8218e_macIntfSerdesMode_get() and applies separate initialization
> >> tables. Realtek's O-USGMII is therefore the candidate for comparison
> >> with Cisco's octal USGMII; it is not evidence that XSGMII can be renamed
> >> to USGMII. Compatibility of those O-USGMII implementations would need
> >> separate confirmation.
> >>
> >> This proposal retains the vendor's XSGMII name rather than assigning an
> >> existing protocol name to a distinct hardware configuration. It does
> >> not assume a particular XSGMII line encoding merely from the line rate.
> > https://deepwiki.com/lotusmomo/airoha_sdk/3.1-sgmiixsgmii-drivers-and-apis
> >
> > Airoha also seems to have an XSGMII. Is it the same, or different?
>
> Looking at the referenced code it seems to me that this is rather used
> like 'xSGMII' - an umbrella term for SGMII, HSGMII and USXGMII in the
> SDK code. Probably the deepwiki side summarized that incorrectly.
>
> Overall I found no other usage or naming of a real XSGMII mode apart
> from Realtek switch SoCs and PHYs. Those PHYs (mostly RTL8218D
> and RTL8218E) apparently are exclusively used with Realtek switches.
> The RTL8218E might be used elsewhere too but in contrast, it explicitly
> also support O-USGMII as a separate interface next to XSGMII.
>
> > Adding Christian.
> >
> > I hope we are not going to have vendors introducing there own
> > variants, and we need
> >
> > PHY_INTERFACE_MODE_REALTEK_OSGMII & PHY_INTERFACE_MODE_AIROHA_OSGMII,
> > etc.
>
> Doing some more research on this, as already mentioned in the patch,
> there is O-USGMII: described by Cisco, being compatible to SGMII and
> QSGMII, using 8b/10b coding, 10Gbaud rate. Though, this should be
> totally separate from the proposed mode because it uses 10Gbaud
> instead of 10.3125Gbaud like XSGMII does.
>
> Apart from that I occasionally saw some vague information about an
> extension to USXGMII, allowing 8 ports and reusing the USXGMII spec
> control word and format.
>
> There is no detailed documentation about XSGMII, so assuming it uses
> any standardized frame format would be risky and very likely doesn't
> apply. The naming of the mode - given it'll be accepted somehow -
> should reflect that and not conflict with variants like 10G-QXGMII.
>

Hi Jonas and Andrew,

yes I agree with Jonas here... It seems to me any vendor after the 2.5g
""apocalypse"" (2500base-x vs HSGMII) just decided to use random
naming as xSGMII with anything that transports 10g traffic.

Also from what I can see in the datasheet, they don't really declare
a specific standard they follow aside from saying that the xSGMII port
can be paired with USXGMII and 10g base-t (following the fiber spec)

Honestly speaking from what I notice, xSGMII is more the 10.3125 fiber
spec than the ethernet one...

When configuring the the PCS with all the register, clocks and rate
they all gets set to 10.3125.

Maybe someone from marvell can also join the discussion searching
for pattern?
