Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804999;
	b=subApPd78qT2MuT19nScKOzY00iMaxrSwD9GCSFeeAiBrR7fg65EMQrMuQmDrXoS3V8U
	 K82+M41R0xm0URksJyzQl/hGPj47Q1xC04PG3DFrTfDewF5ixZgXgEhLV8Jz51IQVB24c
	 JwSnoTJS3RtW3p2LeS2leMgZT+QnUqU3cWnb+8qlxVcZ6q11PtYc2hoqduQ1FHcj/in9V
	 NsgZV3+onjozJQ5Wd8N14dBF4lmivanUioV0IHjz7gLEm+Xd6NhJQl6e3+g3R2VSQAiB7
	 Pl66+tjJkLscLX9GcSvn3Kyev9AVL26F7scXz0LwRwqFvq2DaXVYA7ZcgmiarhOfW4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
	b=nQJKQIOJ7rrtd25foL8HSQxw1nhiSHA7s2GeCmNnP4+2WRO96bBsoU29QCF2Y9EHuoVF
	 Hq2CdSfKz/u0sDyzJxWCrcWGP0Pm66LDYx54N+/CpiBrOFowkNteV7uZ3aA3XjCBDcVsp
	 hiJJm2C8z2mTQ5pya+8tdgTojkecIXnQhrnwBcxiGMOANCA+DgwU1jcHkv+wZvwHUuMPI
	 m/6TBOxYpy4k6Vv2EAhWPwnnmlMGFtHKkSwXcFnR/nycxzb5fh/vBHo7qckbV0a5Yr+ho
	 eroKyXTfewNb5p7avxLoVdD3UhNt/794msbKgiVdJjMsPViKZO/FEXB3MCjUJv1WFfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1zJ5RDQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93841606A31F
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 04:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93841606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1zJ5RDQ
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso655565241.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 20:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794804998; cv=none;
        d=google.com; s=arc-20260327;
        b=ess3JBpEsJuKRwDWKkuDWxL/TtQ7gnihRfbATFRS1B3LcvQQXL61bdopiM4OyduaDD
         07l2GAILJ/LDs9VHssVkOV2zFMP/Ekq0QIlkD5k5CuhUw0dOszyBSM8a9TQZJ0zgW2Ta
         qpA0UuH+ezB+QStZ4rLqCRiFGkYfmHhWKgdjJZiyqAuO+YdYjALOQE8fTwzczUvaG2mq
         z37sA0RWpzO7FO5g46M5xFsPMqWRNuYpt0pK878U6gUTHZd7D7y+kfkcQuHZii9edQDY
         nyL9UnC9Bt+cRiRRqO0Gl1DOExOsiXhVM0N8e79DQYBBkiyhH7QF09oMo845BfD/p6Kz
         NIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        fh=rv5kt2HUKw99Erl3+h8dkPOiBHxoULltNFIq8jTTBRQ=;
        b=spLU7rpXwrJy8lsCKSiVNrnCBRSeFgi8kceIqp9Vod3B8D7wYpdyOjglq5V080pe0/
         LdLrO69BXBcFrWkBqkdsfQpzCGlj+Dmh6x1Q8P1i6/MIxu2Cfl6jfeGhHQbsOUlg50Mi
         WIXEaP1qC4t3AL/mIrjbz1H0kZb3gKEuBeyqmYKyqO84/hl242RPHIw1kb3O21V85bvj
         Jq7EIfVz+p4ICXjnXxS4Ai+4BKWccXbJ3eNlOUXzfQMLmQ4Lmu9clynH45ggFIFidNtO
         s6F8692dZcEMAlbcD/4enz+5LR995N3MGbw+RaTOI8sKRF58x8N3J76XfA9P9ASTg3Nq
         gIbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804998; x=1795409798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        b=X1zJ5RDQeUFDdGphkWM10fgrRC2oV9rjQRtmNdqgmqHFizwwAWCJepUCRD3U+gWzZ5
         D2t/kh4W5ZyJQhMXltCOoJCkiLC3xwuN9rRcX0YSjuK5K+5XEq313NsYPeKJdIswB46Y
         oENFL6IkfhC6ya4ZdfzbMzCjfPw3/gEzl80e2+gdRcKuF1fJLNDJ9Tc60WvjaV2nZzJR
         Mlq1viJaqDPNbbHcCDd7Ty37h+it+P9ki8kaGstWVYuMIhzUR2m2lw+c/K9SijlmRsiu
         Ib0ACPMAn7DUyW4fNs31OcmXhAY6/4YSnGnFh7rsH3W6N+v91bW2AWT9KunhuO16PM6X
         SYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804998; x=1795409798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        b=CCusJbRhIWnWbNe0Cf9Y0RX28LpX1QbHvBJxj+zP5Wb7odvezkYwA3Jyk+BL40uitj
         zhzdN+mSGJe638Vtwuwdb4jNinverDP5742EGidgHZHOHCUk2aD4oUkhlLtGjQzJScFJ
         met3tPV8HStgR49UVaIhO4Ycuczz2SY1j3k8n6fCAJ9XWe1Ubi6kbfZkKRkzEAEVj0XZ
         uaKlERDfhyZ7qu2V+CYtjNfLyV7LzKaJb9NMCCppuDZA4jnVDk+ICiQksfQQbiSSEIVc
         WITN9uzE05ZJeF18880bMt2UYxF7wPtcvCfHVZLcw4c8Ns5/xDgSy/b1YhfTfLytZjor
         aMHQ==
X-Forwarded-Encrypted: i=1; AL+hErHrAcITJ1+L/CK8EMrJCl5142pl7CtvCFbWbKzb3PzzW8+2OhMoketVjKP+PICwPZXlpDaX9q94RzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YE9ql1B/d4xBt/kziuRimWDsCOFleAasoBY7Gz99dFgYWkGzd
	ChjQflXRvLIda57GDXCtmvLtpLoLzvSn5JxvvWR0VIanFM7nHJxS7xQv+ClQix3llRd0nxOYADA
	VhG1ZhN//qp5iXgoD/deNjPkg7RezaUDMievt
X-Gm-Gg: AYBFou37TSZDLDhM3M5sDgPg/grCikDfJcRBjZ2LLQtrrqyi0t6alR6OZxMhTXBkhWQ
	x2E4YizQ/gleiT2LftOjbTi8iCUgGx8Q5E4Thx/qpbyDiWiG3lgJEOacv7Do3vZnlDU/73avFR8
	tCfgyr4wlxH5c1riBZxfZg4X2sgJCyUXO1tq21SpwZDxqrLNGmjqkN1AMuewv0u9lGzQmtIUQjh
	LdQiBp7aJ/VUvkLSPJoCkOPrZKRWJEeG8psw+Co3YPobFf1TBgKqeXkXpBwOpnQEAM7NrwXWWYn
	DjUh7bh38moaigCs/8ZbaXSLhcdMS+9n2BmHCRPPvRTM0N+E98ZDSq67IV6qTCIope1RYGKiHU5
	nkOphzKvXW1CsD6eKMIQN2DMS+q1POAkqyDOaiUoTq9o7p8OUS0Xtdyg4rUFMslIWM0TZM/eqHQ
	CuB6+nkEdiKajl9uCG9e2GJB/98EALq0R8mR8lHkNkO+oXsHAlELqgSpCbCWTejUs6gwgjGOa04
	q7kUKBbN8zJTfMbSjWinDcLcTPB5w==
X-Received: by 2002:a05:6102:3eca:b0:7c3:6466:3155 with SMTP id
 ada2fe7eead31-7d64d8da06cmr2426406137.33.1794804998470; Sun, 15 Nov 2026
 20:56:38 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch> <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
In-Reply-To: <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:56:26 -0700
X-Gm-Features: Aa3M54pfgPpl22QOYcS9U-YpyBuFQlb4VrEZUDEBvkJV5vCHfNjijzrmfafBS4A
Message-ID: <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:39=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Nov 15, 2026 at 09:12:35PM -0700, James Hilliard wrote:
> > On Sun, Nov 15, 2026 at 8:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:
> > >
> > > > The generic PHY receive-byte counter describes successfully receive=
d
> > > > traffic. Some PHYs instead count bytes in all received frames,
> > > > including frames with errors.
> >
> > That restriction comes from the current kernel-doc definition of
> > ethtool_phy_stats.rx_bytes: "Total successfully received bytes".
>
> Yes, i found this.
>
> > Should we instead clarify the existing rx_bytes definition to include
> > errored traffic and use it for ACx00, dropping rx_bytes_total? That
> > would leave the existing packet counters unchanged.
>
> What do you mean by errored traffic?

Specifically, frames with an invalid Ethernet FCS. ACx00 has a
PHY-resident CRC-error counter, and its received-byte counter includes
bytes from those frames.

We checked this using PHY loopback with MAC FCS insertion disabled.
Frames with a software-generated valid FCS did not increment the PHY
CRC-error counter; flipping one FCS bit did. These observations came
from the PHY registers read over MDIO, not from MAC statistics.

>
> Think about it.
>
> If you don't have a MAC, you don't have FCS.

There are existing mainline PHY drivers exposing this functionality.
The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
a phy_crc_errors counter separately from phy_symbol_errors [1].

This demonstrates frame-aware diagnostic functionality within these
PHYs, rather than something every PHY necessarily implements.

The generic byte counter need not require that functionality. My
question was whether rx_bytes should count received bytes without
conditioning the count on FCS validity. ACx00 could then report its
hardware byte total through that field, including bytes from frames
which its separate CRC checker identifies as bad.

[0] https://github.com/torvalds/linux/blob/v7.4-rc3/drivers/net/phy/qcom/qc=
om-phy-lib.c
[1] https://github.com/torvalds/linux/blob/v7.4-rc3/drivers/net/phy/icplus.=
c

>
>         Andrew
