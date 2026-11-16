Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794802368;
	b=0fIZw3kx3/zDEzstXS6r2TWYn+9NrvQCAEaAUGPbRGEa+SpuRfMR98l1Sv7gE0buiNVw
	 zmFSZqFm2uC9OEDEZu+25zkKtLjGdNau7CWFJdoRIn/1sAlhee8VIA7S/Cq9TnsQ86wiG
	 HylCB7NLQCd/hHJvxu8ndvcwSwrhSWJPlCMrxjYQzmKo9j4SrerYfI4mpwMY2nKvCmC2J
	 TOy5/al85Cv42Et4dBQklL5smKG6etgdpqqvQ3HVnGEFJhVHfU5uZo6CRXcrHnHYW1z7k
	 8XTDlhnOjVUDIocKVusNHcG9LcHRWjZn1JPGZCJPgSGZRXvBoIoX+0kf1K+Qh4wnJbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
	b=WPTCJK4NC+2pFH+ek3/gwsHLZp25w97XQN41HpWXCazl9aNSyPNw7kY/9nVysCBygnBn
	 GkYHulcFR+T7maMCdAa5kj7Vh5mRJ+tymZu1wGR5GvbwiWlUwo/tBsGKQH1efglPFvOFb
	 BXE2QlzvlS8aApo+LRHjMkkXcZ5g3dUK8fL2MWgHyY8fRuDeMztzUau3/rQUum9a0tj69
	 jTOPkTSxyBQdNsPsMyRpOQGlma5948nuZ28PAceVQ2Qh7oqkzDg9WYJaRGDDp0F9rcatq
	 HetHMJcYTf6w/rRRV2nfQD8P+Z4UayVeI7g1d05yvPbT6Z2yldUVFTsS0RD2M4d9bIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXuPr6SE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA55606A323
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 04:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA55606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXuPr6SE
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so4213596e0c.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 20:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794802367; cv=none;
        d=google.com; s=arc-20260327;
        b=jPIx17zFxRZ3/dJQu4/TLa6bhe1ADAgDKelpGtHnUhq/cE1xLLaUlHB0cl8wIXMk3h
         Ipi5HiDtwFjILnRA6hPfCPBsojLnXrSwFFK0tj90aF7uCOK6Jp9ALl8+d1oxXiXTaU5i
         6zRI9zxUtVPipy/HpCyJTNef61KtSKJLh4edRS5TENzvbZZUJKjOHntiolTJzWZY8vjV
         GfIag+cP9tDEWLcuJjpiHKSkKyQWkREmYBB0eVtfUFA90ED2k6RBH+RrZfNXWe7WJMMN
         U7ZD86Pz+vurkErqm7KMKOCihC3fc149HvZ3XroZFFoA2hMqKBC40qcDh4jIaypEyXvb
         bpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        fh=gy1dDRw6sMYOWNjiHKwsdADDtOFteWH3pJZPvPV6fUs=;
        b=VcQsD9qoVr0Sa8xImpTd9HdPIrKYgl4NLM5ZzmelO+hRynoY3pPUo+e1HpRXZwgvmB
         62VudGQXZIScGiFEwmdMQ7hQAvvANS403i540VFK0ETJvgQWFYob9d30EeTUiPg9Qb9w
         NbCUcO5L1BcDEARrHcl8vZbO6ywp2OIMPNLDv2Q2s5L09r4r9DqzCVvrK6sMrIzy6iLk
         s3BAcWM2ZPCN+NS4qaIiHU+4uvyHbFDjsF7iB2qVdCzxwh8JoYKH00hUvDevJ2z+Z1+w
         N6TAbzWf+KNd5xo9Tv3k3dSegoYtMNtIR/hYuGtkmYF7waYTzZwnPP95Qv3OIzNni+pv
         D5bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802367; x=1795407167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        b=TXuPr6SEkNx59MeEiBxkERt5f4mWr/KLQDwLa2jrvJYieaT+qwMYtqe9ZaojTHhZHG
         AJ7lHgR8xxpjk51JCJIadB37QGvLRiP0FBhk3yEvDf2lPtFkkJLF90wQu2Nb4O6kIf4n
         zZTlOkFImdMHRYpm3Uy2EfdKdMtJfA/3jteb9E4VGVwYJMWXf9j9hzcoPZu/AaDp2LFa
         0cDrWZEbL6WdhqLbjlTg/btbj0ILHRNIJZJYgX0J7h+us/HHw5W40QvqwH9YTLQRNAfF
         fTZ2SCX5ooqvF/KXBuYoINgxOHsrXPaKwcKZzhWOjTqLOZjq+6bIkxVBjdmcC8NhevmQ
         qkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802367; x=1795407167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        b=CcaHElhannOqq9dNQjbqrif4UhVfZnNTdaZLepwUe2Fwp2FZCt27JxGK0E7O6CXwuN
         8BIH7MZHT/NdQV46c4VqlskvpI4NGCMuu9PXCbuL+aRHfahQoYTIDvKpnbj2X8x7pbT+
         foqVoEr0gN63PoNFFVPUlav2kP+sLjOEE9OHNqn0hpKtkv6cLERGb/ubYeezhn8RmgAL
         YMwX/lR+wXySqUxQupqVG95OMjI9C2aiv7n3SwXQSPeFdjKKD9SAmQs7pml4pyCKWGvy
         +W7aeTeZzmkWf7z2SJnmovlYknuzTWHY1fMAIsAFt/oqhlEyklM8oght9PRzmMiy6GdD
         yIsA==
X-Forwarded-Encrypted: i=1; AL+hErE1OY1jS1E0wRCoPQ9r4+c0WPc7yukTy6c3/6TERMiOoap8i0MTGVMOcD2N6q/MBu30ak6iYhGR5QY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T9wYN5K057hRjKu4L9YqkWm1XoqFMibUdd9LoK6TBLbcWkWE5
	aJMpZkB6Lo5nMSoFDuoNhZXcU3tPyoDAsZqDBpb1lFexztUeGyKXVI9P4mycJPii/7o5tFQ818K
	wI7QjShFa0bKkzzMcUhNxgbtzQrQ3Chc=
X-Gm-Gg: AYBFou0dcncOdiDst3/x3CUsOB/2gaVlFdeZWkz/AypNFFVi5WE1XGYXES5ArGe8C++
	XxDY0Xmjce6Z4zXRYbtN4oYkuzYo7Azui6RL/A3w8ENlfteUw6f4wZQ/SIrTcXfPyqM8P6D10SX
	eMkzImEIo4dZbOttVsfiJxf8N30JbS3orNh6E/+MX9sEAtGoQNWvZeSTUu+ui/lk2Pw2z0gN2+p
	CcZXu99AUkVXFck0cRuOoylmpiHvghbuqpCTbsC+otG26m+pppK9wNtORt4J6div87c5thGCPhU
	vtGHiodmB8w+XnPWiQH48QXRYxP7u5R7XBhHNXpLnfkkQvOK3iTksr3aBiyzVtcEX/gcUPJ+Tw3
	qaIsYq5sYk5VTBFQ+glk6V20RKZMD3ZweG3q0J2v2VMtUmaCzptnDKbEn6B3Dtn6wPk9lVtEs2U
	H6H8zarqReGOUq/g408fiXlr4nnnp/L5SmiYEC5iFtfIqCOjPndcPaU5jqAvrsn+CAI/W+B6Rtp
	MRng7QlONwi0vLO9xu2TeTFSN4ljw==
X-Received: by 2002:a05:6102:6050:b0:7bb:64cc:1362 with SMTP id
 ada2fe7eead31-7d64d727889mr1664247137.6.1794802367378; Sun, 15 Nov 2026
 20:12:47 -0800 (PST)
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
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com> <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
In-Reply-To: <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:12:35 -0700
X-Gm-Features: Aa3M54rSYwnxbv99PItlCP4qZptsSVG-Nk2eGb_2dwgIzFKw24XwIBCbb3Igc1g
Message-ID: <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
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

On Sun, Nov 15, 2026 at 8:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:
>
> > The generic PHY receive-byte counter describes successfully received
> > traffic. Some PHYs instead count bytes in all received frames,
> > including frames with errors.

That restriction comes from the current kernel-doc definition of
ethtool_phy_stats.rx_bytes: "Total successfully received bytes".
It was the reason for introducing a separate inclusive byte counter.

I checked the PHY statistics callbacks in net-next and couldn't find
any driver populating rx_bytes. The original series [0] introduced
the byte fields, but its initial drivers only populated packet and
error counters.

>
> In the general case, that is wrong. A PHY basically does digital to
> analogue conversion. It takes a stream of bit from the MAC and
> converts them to analogue signals on the media. In the opposite
> direction, it recovers the analogue signals, converts it to digital,
> and passes it to the MAC.
>
> Thinks about SGMII. When running to 10Mbps, the MAC has to duplicate
> the bits 100 times. At 100Mbps, it duplicates the bits 10 times. The
> PHY then puts the bits onto the wire, it has no need to understand the
> duplication, the boundary between the MAC level bits, it is just a
> dumb DAC/ADC.
>
> In order to see frames, not a stream of bits, you need a MAC.
>
> Now, some PHYs do in fact have MACs. Those that implement PTP for
> example need to reassemble the bit stream into frames. Anything which
> does MACSEC. Or rate adaptation.
>
> But in the general case, its just a stream of bits. And the byte
> counters should be for the general case. And for SGMII, the definition
> is a bit more fuzzy, does it include the repetition or not?

Should we instead clarify the existing rx_bytes definition to include
errored traffic and use it for ACx00, dropping rx_bytes_total? That
would leave the existing packet counters unchanged.

For ACx00, the byte counter includes FCS and bytes from CRC-bad
frames. We also tested at 10 and 100 Mb/s over RMII: the byte counts
showed no tenfold inflation at 10 Mb/s despite its repeated interface
cycles.

[0] https://lore.kernel.org/r/20250110060517.711683-1-o.rempel@pengutronix.=
de/

>
> If the PHY has a MAC, it can additionally fill in the frame counters.
>
>        Andrew
