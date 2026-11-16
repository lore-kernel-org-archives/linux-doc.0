Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794863382;
	b=NxYbYFXpjtFmlYbmOSfb2QcmF4krW9A052cBlzFnMI6y/gOD6yC0JRIvA1d6M/PAa2wH
	 qJp1CeiAyvAb9/PpeVY60/8LPidbQkykZsUHXystkxwkAwBxdhQMEPf1WOqVZ29bPLU7m
	 AWw/IgfKtddYxDXEdjlA+ufanCQ8fXDchCiD22JY8dxwSDrrh9ekpKbLUCzmodPf37dk+
	 c2ACafvytyXbzItC4O20lBnSw+noWLcz44QL1/PgOUeKE70SORnBGzz/Qvyimi1E1tzcc
	 TpfG5WEfOkXR+7iWX3JNYJH4+03NVCfVqr2Bqb7d+2BPAj9fEIlj++RGT5LLiMYP55w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
	b=olcS72gQyMrjjG3KXIZfg2OKtEVtue2Wyzv2fjeOPTli1K8AUiHpvO/aJxk2wdao6h5a
	 vsX/JN651w2oezEi0hIRyTwCBjXrruqR4gq86087P8Kr02JRWsIfK7EG7enW8uBQFkqhN
	 UdPaLPJAo+sQbUtVGWoFJtPDkDFCo7IpEi5vrT3LRPNQO3kpVi9pLgv3n3nCnn2W5Y4Ni
	 Aj0KWN3JBuP5xma8rI4v99mKd53gzS44fX+8/sgb2wNaSpS1qo3p/FIt1mcmqX9ddzJeM
	 i2GQv4NJsJYLvk7O2y3Kcaah0RRlCAAUziPIZWVqh109l1ueLnDtL5Wqhr7f6SBhHsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rL4/+C5/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFBF606A32C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 21:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DFBF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rL4/+C5/
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so4357500e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 13:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794863381; cv=none;
        d=google.com; s=arc-20260327;
        b=E2AC723AUcz04ocUdUD4gbjzmotGA8I8nMTP7cEuM4HSvrvv2RRgHogukYoRSWVpU3
         5Oc3l7sANhqYdKn6Rc/9ZEiRFs3dvWUqe1UqCLTQ2e4NCQWAlAG1T0LSexBL7Y7z3g8O
         l+Dte3jwsn2fIdrVHHCTCj3/cH0mJ0ZklRLkF332VSPt2JgGnl70PABbYJm+zYF/EiRg
         /TWLyo8sT/M8bZvB9ndgXVi46PtEUACNjAbdY7uF+CkZulpFCxlnc/sStNHdMcQm1maR
         9kZS8RInJozhvPNvJ402X4I21yav7Vi48a1mOczTgQ1CLe+/rrO1M3z14qcIxdsWGCkP
         eEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        fh=3YGEEZalvo8hPA+XncF04qtvZuOp+CrlpUdiPMiQTHc=;
        b=Oz09VTPhmPbt7Guk6hz/CVirbEQ99uNr3blEjNwFeeJen35L6aNCRWZfj2+HEN4g/4
         xuxFqy8jweBz+uMi/ht8+8J9swPtjE9eSCb1mwOwMcWPFeIXgFZsOj7r9IgeVwIJX2YS
         BiuzeMsijbKE4fct42sGlT+R+T78UoRa5onPZUMbsROKsdUChu8ksi6ehdceSesIa3c1
         h1iNd8oW7UB53TTAsOG6edKUh0sm+JQj5v+Jca5Ud45DBDpcTIPdDAcGAxzQsrJ4fa25
         fQFOl9K/NLcrFobgHcVjzqHAnqBfRnNZaW20wchdcGm/mGPjHPo++PEL4Gjt2C+4Hv96
         BozQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863381; x=1795468181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        b=rL4/+C5/mHNlyuAP/2smxQPn5aM4Is8Ha2rYS7F5QWHpJrhZo/a43OYQ2pd5l/Y0Jx
         pLLG/1X8tcjuUiHOhA4i9kWJ0IwR1gWVcMSxXNRVlNJGCzXuiIqi6YwhCYSzg1qTwK8B
         TI3QljCV/yU32/F8TjMIhOVXdg4NPKCoF7q9wj8+QVqqbNiWfcUDCd8eBxoVT+vIpQtI
         aCrA5gRi76p4VSPLTB5VndE3cdHc/8ef5zJeAYgsf9Kb3b4BKdG+e+EDS+VgKipaBrus
         qp2cQ6m2kJ7R1Mhsn0wfOrXVi11e68EZQpWQQO5iXZQLyhW78n2Oypu5ms++WsY4m0ei
         kPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863381; x=1795468181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        b=gZlfPo/9POOTYLteSkPhEXcpuqSr9J5Nt4MYGPg/SCK6wq2cb0NWtBT4KMkViHK+ZR
         MdVjRYXk1be+Me3NQslzOYDL1jM7JagPD31k5epl6y69jQX/QIuA9oK421xcGtVvDZaP
         yF9TD+gDL/7KHcYugufPKWl3EgLYfehclUUnM72kcgNATzcOPYfeR8X13PPUM8vM0Mg7
         qSSzgoXvp0jDhNlU2yBpYCCIGolP+Ztbae8tqM1O9PIpZ/n4XJReIbxCVdyzaUlGagXg
         aiW/SbhnDbJmP8GCK2hQOWd/+oGj35rdcdXwvBS/xF3MMwYR/cbtvxSzqfJ1/e71Vmm5
         P9Lw==
X-Forwarded-Encrypted: i=1; AL+hErE4lrVheoxSHwbgDcOdnDGldwyf39jiJRy1gZWxdHKDRGZCJGI3eDpDYSjycKGsxH6zA8Oe0YX4Ptg=@vger.kernel.org
X-Gm-Message-State: APuU4Z882JryoLVJLt8SvtQYhwKDoZMsjKwdsh/67fhhhsopBh6I36Ru
	+Jzl92T9GV/uL5wlyiDxUQvIdOo1g/lX+c7WPkeYwUfl9fkiolxfYfQFam/WzXcuDTTlbDerq+g
	GqoPhYxnvXIj8jI7JyQMzJTCeCAtKvI4=
X-Gm-Gg: AYBFou2RJlA4WCxl3TizC3l3LhQFCixhe7q8GMyZL4i05JqgGT5YjCAnePNfN847NLw
	1dWFLVMoZqsD1kZs2L0gvpfQ0UFjuKrW5gHJTQ+wBqGJALlAmEdjMOcyYGgoPg4aJ0WaRIaTg8c
	6eXF+bDeT5t5Z20bvH88/exdBwTXwKWdcB2Eh1LqNKYaFAFYYwh3JNqKo3dxu3lOym3Yss7UuKa
	JjBAhNfezv9mPEE7aBG4B+pGQiXCdU6B+WB8/Ctk6kJzaWK/ZFm5Eg3Kljr8IBBKXRNu5vLylI3
	z3zq25Obc35gzl4uJlvZKRMypzBzCt7IhGU6XN3TGunE6Ofug27PTTAY3GALXOB6m+KZMqfgdb6
	jM4SNCGJhdoVGS6STJGOdFTLYCi9LW39DoGxQ4xgZsLBAed77AqWVNzQpmuKyTfQsM0mhzP2EGh
	T+PyXORh2kQrhkaOWSE8QObjRjsuSLOu2HYlOH1EQYJhlcGUBYu116fFC3vSGqezEz7SPzIJ2uh
	nBnx/7NMlByKSOMo8gnJoXJnF14IQ==
X-Received: by 2002:a05:6122:793:b0:5ea:b972:1403 with SMTP id
 71dfb90a1353d-5ee346766a6mr4625862e0c.3.1794863381379; Mon, 16 Nov 2026
 13:09:41 -0800 (PST)
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
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch> <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
In-Reply-To: <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 14:09:30 -0700
X-Gm-Features: Aa3M54q_Tii21W65owc4nMI0TRPC095pgsqSNf31IEYTxCFkefhvfgxKPUvxAKA
Message-ID: <CADvTj4oGZ1hwBqrcXp9-M4zhoG=QbVWuyqNV=1xogqL-pJ4Kbg@mail.gmail.com>
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

On Mon, Nov 16, 2026 at 6:14=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Think about it.
> > >
> > > If you don't have a MAC, you don't have FCS.
> >
> > There are existing mainline PHY drivers exposing this functionality.
> > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
> > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
> > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
> > a phy_crc_errors counter separately from phy_symbol_errors [1].
> >
> > This demonstrates frame-aware diagnostic functionality within these
> > PHYs, rather than something every PHY necessarily implements.
> >
> > The generic byte counter need not require that functionality. My
> > question was whether rx_bytes should count received bytes without
> > conditioning the count on FCS validity. ACx00 could then report its
> > hardware byte total through that field, including bytes from frames
> > which its separate CRC checker identifies as bad.
>
> Read 802.3. What does an 802.3 defined PHY actually allow. That is
> ideally what the kernel should support with these counters. Lowest
> common denominator.

FCS validation is part of the MAC functionality defined by 802.3.
Counting received bytes at the PHY need not depend on that validation.
The PHY CRC counters I mentioned are additional hardware diagnostics,
not functionality that every PHY must implement.

The original statistics interface also distinguishes the IEEE-defined
eth-phy statistics from the additional phydev counters [0]. For
rx_bytes, the common meaning can be received-byte activity without
requiring the PHY to determine whether the MAC will accept the frame.

> So i would say RX bytes does not differentiate between the frames the
> MAC will later throw away because the FCS is wrong. I would say it is
> also O.K. to include the preamble, and the FCS, any padding up to 64
> byte frames, etc.

That matches the ACx00 byte counter: it includes the Ethernet header,
padding and FCS, including bytes from frames with an invalid FCS. It
excludes the preamble and SFD.

The separate counter was prompted by the existing kernel-doc wording,
"Total successfully received bytes", rather than an IEEE requirement
or a need for successful-only byte accounting.

> Since this counter is not actually defined by 802.3, i would also
> allow some flexibility in its meaning. Different PHYs might have
> slightly different meanings.

For this use case, documenting those differences is sufficient. I
don't need identical byte boundaries across vendors, and whether a
counter includes the preamble does not change its diagnostic value.

> Look at it from the other direction. What is your use case? Does the
> exact definition actually matter? Does it matter if a different
> vendors PHY counts it differently? Does your use case require cross
> device compatibility?

The use case is the board bring-up and networking diagnosis you
describe: exposing the counters already available in the PHY to help
locate where traffic is being lost. It is the same PHY/MAC comparison
described in the diagnostics work accompanying this interface [1].

For example, in our tests the PHY byte and CRC-error counters advanced
for traffic that the MAC discarded before DMA. That distinguishes
traffic reaching the PHY but being rejected downstream from traffic
not reaching the PHY at all.

A common interface is useful for inspecting that activity across
devices, but exact cross-device byte totals are not required. The
important point here is that received traffic remains visible even
when the MAC subsequently rejects it.

[0] https://lore.kernel.org/r/20240829174342.3255168-3-kuba@kernel.org/
[1] https://lore.kernel.org/r/20241221081530.3003900-5-o.rempel@pengutronix=
.de/

> You have not actually said what your use case is. For new board
> bringup, debugging broken networking, the exact definition generally
> does not matter. The PHY RX counter is going up, the MAC is not,
> something between the MAC and the PHY. Neither the MAC nor the PHY
> counters are going up, something between the RJ45 and the PHY. The
> absolute values don't matter, its that they change which matters. But
> maybe your use case is different?
>
>                Andrew
>
>
>
