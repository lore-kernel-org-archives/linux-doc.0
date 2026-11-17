Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794882971;
	b=zHMi1TgEA/udz89/S47vpzxkwr9fENqWzDZnbvTG6JGoaNul1+RHKD/riTwudzy8de/R
	 E5vtk2y1cfXlGjpaJy153DNDRBWW9W42zlI+z+9PH10jieWxqlHJxjlRnZOz4V/8r7Eaa
	 L7SRIhWB2T0nMN4z1q1En0+aWxpKNv6ise+Yj7Q7s85cvIQTGBj7i6yoCtpHknvOCPGZU
	 MJgFTphNneVKK6d1q2s8/XbKY3OlJW9ja9AEMLBxj/c6u/CiwXEbO+vszJHHTC3Jg5W/V
	 Wuqy8AyTrf4kE6mBaaFlFOG2FNnfqicTayXyxz7UhuQx/k0J0wzgRIiWUIAJ7sOjZvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
	b=iXZnmPDZ9WeYCEoTGVbLAN8VXsOvWzHpDU2DVYiMpRWj1HoxOyeTvYrjJvL6Xcm7G1Tu
	 qyWCHp1BuqniQ0mV+nyYEv7W5h+zCxwfzgdh/LZ4JgJZaNHVVdeATFEjHbeYjnbGTgszH
	 rvPj/OxC44DngmwjfLfDuCUzCECBXgbJ69ca62fn8epMmbFJls/5Lg+MjLnUPv5Gyybpn
	 Gmpt1eO1T+UYehx6V6wHWGZXTzqyAklL1sy95OGGS64P/yiayT31ybzL1RCXNi3QA3Veu
	 yGO3o38rp80N1+02X7UWwjSloYwrHBWSN4JfyzQMoLXv0BL6qtwJ8S0htbY9B5zfwXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfH85jx6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28F606A330
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE28F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfH85jx6
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc603a168fso1435308137.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794882969; cv=none;
        d=google.com; s=arc-20260327;
        b=FOjS/A/BDNfmjs85yqtm3YNYlXEKoKrgAWikm3GJMtSA+RbHDq7sH5m5b5RIkTJ8WI
         Gzp89ticen2mfDYlfGvYFNoF4nliLxMxzCfQf1/nXC7pz38xxhaGAh8WTbRYRVyIe32z
         X2GuutzYLpjUp1W1+pH4jmxM2gqw3GcK27ytHFQ9KuFUrSTClvI3NIFLGIpIJSlPhVsK
         hCNfe083S/M2+DEdlOhD9cQtxjTYmp/nbfQaCDO0dP9tA7QS3VwP5COm4NHpYkhvlAAa
         sB132m0zrkXvqXzQRbiEp29Mdn6CaZj1m8wLets/G1AW2etmoNeQNTvl2ZmDL43MFlX6
         mQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        fh=lcmI8GYTK28HukR3u8pcD1As5JMnFsVjkh90dHDp5Oo=;
        b=Wxx8LVDNyvsrUQL4kwncHBrwfnHGtW21pQnL84ixS5iRyH7/hXIY2zPL5vbVCEnX+U
         cfic+7gpwIxuzRPwjL3OX3haQkLEZ8uhLd+Nrxds/jIXIFSskH54tu71sH16j7EGG2CW
         ESQq1HubHPK9fHDIIA1OSwPqNMLcPVWhvYK31BG/9SRMj/F+kf7mq9whMovuE5TFEV51
         ZETrlQLnH4EJsmRMkZnxn9aL5TnQCtBSkDnImX/cvaHSidJ1ygfXj+AOHhLVg2k0mBNr
         RcCM1pfjlBPrDaWQ2H5GINYVBt6tw1e7CdgmkwGF5/WJsotyVQDQC3M5gixWLOG5btxE
         qUhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794882969; x=1795487769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        b=sfH85jx6UDOHVe/QfxY8fPLUXzDqrNp76LfpcusrA+iGe+RSnmlNIPSvZZXUmbcjHx
         yxQ0i4ret+BIx+nuJVVHLsbg1P+g/5xFbZpBqVR7V9pi4sVIAS7HAzJdwEYvwvR+VRX/
         HFINyp2Yl67AgenwoscipuqoUUGq8iUd/0mEbxT8zfEg9UTAviXlt7Ioj3JA2wufDaoj
         o+GP6/uT1/yc/3yn+w9UG2Z8MFYaYNFhn1hV+/Ju828W4K/DoX8Zr4AoyFW5KGYRRW/p
         S+qqZVzJDJrbP0FB+BFUHa9WN9+mEX35WBBpUVBXfST+p0DTDfWODiesu1wl+rAcrw1g
         2HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794882969; x=1795487769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        b=w4V75bNESNkP/OopU9CB3EHVH0UuHT+oz+DnlKIUP4wt2Ll7kkYPYnshiDDnmPo5Rc
         cw5J3PmpzisvynSZFvlj47YBy1FDu57e7dyPN0VsnsliHlvv5Mr1XSonTTDmNhV4Y+i1
         4EPdjIUG0oRBAume1ct6fdE7EB7JikL/M2ZrId61TH/GydsMYW/3DuqVUGmZGDD6a5vw
         9PRAYD1FmKQBm0OuMoguwMNhcSe8Ie8SXpVNgx+mFmZA/lGTcxADeF5Dj5dMkd+ppq/q
         Hag2pgKIDjuPEr2bElWEktQ5KJUYODziAzWirt0XPf8UVizr7TzVNrmhWVfnza8F0Mc/
         OWvw==
X-Forwarded-Encrypted: i=1; AL+hErEmJD2abHvIypmFO+ig4v7eOVXRPySTV3jNiT9uaMWD4aTbXgDxiaZ9aQIdueHKTLsZhscWxd/RtiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yGumgq44WoIMbmpWu5EJiDXoLCRFUwIedgqyKoL6EDihtNC5R
	Wmd+trPN0D1gGln41X1ZK3PEiZYFuNtzwZKWdCBig9+AWJVU3s1V0ABzy4/b3OXLgpkld8f6rR6
	yhq0jOoXEBjSmRLI2D6+bFrigkb8K+g0oQ32/9Wo=
X-Gm-Gg: AYBFou3xLSg/gLJGTMi94YWEQgO4CJ2il4gAqUdikX2/ZuRCGzRtgNq1es0+SaBcl4p
	LqXavjtZFPWGBGeMGLUlSrNBbsuCQdzTlSLSdl7UCEAPvsasVlKJTtWoeDmVgLE2+R05y/4Yiru
	YM4MnD3/hVoOSBeacYjn3zSk/F0cgJZsVb/a2f/Pc3BJy1GH4JNcRV5mv43I4sEGpoLaWjNuDnQ
	GN4gME6iCYPMuaFLUl2rnnxzp9gYLGnwXSnZbpegIdQcXe6Jo7DV6OM7lsfX4WJU8piEMU2fW6c
	1NyIRHbV5K1u4AXWGaP7IO+pas9beLadlcEBq9/+pP5ZrifgLAmhLOdL73felra1ojLxKIaSEVF
	0Nt9KYexJ9pqVPv/Ffv7mFcPDIXTGkYzwiPfhzVkNa0Qnvt4pMXJ7DiEJ6lnsZKYVVgWAdRL0wA
	XIdTLK0EmAUHvHqan8bDxxVuXbxJZurmglYLFAOTlpSeRvVGBqeJMTr/XLB6wtWe2BxnwBE5RYY
	t5Mrp/31qYHsz1CnryYaodQHDKSaA==
X-Received: by 2002:a05:6102:50a9:b0:7cc:2c29:54ef with SMTP id
 ada2fe7eead31-7d64d6f7105mr3309563137.19.1794882969366; Mon, 16 Nov 2026
 18:36:09 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
 <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com> <avsBVtVgsluPNpVY@pengutronix.de>
In-Reply-To: <avsBVtVgsluPNpVY@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 19:35:57 -0700
X-Gm-Features: Aa3M54pBz4tT0t7JeZwLsOLmzXp6qqOvkWqH1XF1WpTw3kHr4oh-FwmKwJHq6L0
Message-ID: <CADvTj4qMgKrRZ_uq3K4t2+w_3eai4dwuCPod_vhEKEOsO85_Wg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 6:12=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Mon, Nov 16, 2026 at 01:59:58AM -0700, James Hilliard wrote:
> > Some PHYs count bytes in all received frames, including frames with
> > errors. A successful-byte count cannot be derived by subtracting a fram=
e
> > error count because the lengths of damaged frames are not available
> > separately.
> >
> > No in-tree PHY driver currently reports rx_bytes. Define this existing
> > counter to include bytes in frames with errors so drivers can report
> > their hardware byte count through it.
>
> I do not think we should change rx_bytes.
>
> Comparing PHY and MAC counters, for example to find frames lost between
> PHY and MAC, only works if both count the same kind of frames.

I did some additional tests to understand where the observed differences
come from. With MAC error and runt forwarding enabled, a bad-FCS
63-byte frame increments the PHY packet, byte and error counters, but
produces no MAC RX descriptor. At 64 bytes, it also produces a MAC
descriptor reporting a CRC error. These lengths include the FCS.

MAC-internal loopback reproduces exactly the same 63/64-byte boundary,
with PHY loopback disabled and all PHY counters unchanged. Good-FCS
frames pass at both sizes. This shows that the MAC alone can produce
the observed filtering; the earlier results do not establish a
CRC-dependent runt filter in the PHY.

It also explains how the PHY error counter can advance without a
corresponding MAC software error count: the MAC can discard the frame
before providing a descriptor. That difference alone does not indicate
a fault between the PHY and MAC.

> rx_packets counts good frames only ("Total successfully received
> frames"), and so do the 802.3 MAC counters aFramesReceivedOK and
> aOctetsReceivedOK (30.3.1.1.5, 30.3.1.1.14). With this patch, rx_bytes
> would also count bad frames, so two counters in the same group describe
> different frames. A PHY without a CRC checker cannot fill either of
> them. A PHY that has one, like ACx00, should keep them consistent.

The original implementation reported the inclusive hardware packet and
byte totals together. I changed rx_packets to subtract the error count
after review of the successful-frame definition. The hardware does not
provide a corresponding errored-byte count, which created this mismatch.

Subtracting the error count also does not necessarily produce the MAC's
successful-frame count. Valid-FCS runts and frames with an incorrect
802.3 length field were counted without PHY errors, even when the MAC
discarded them or reported a length error.

> A separate counter for bad frames, as in v5, does not solve this either,
> because "bad frame" is not one thing. 802.3 counts symbol errors at the
> PHY (30.3.2.1.5) and FCS, alignment, length and frame-too-long errors at
> the MAC (30.3.1.1.6, .7, .23 to .25). A symbol error points at this
> link. A frame with a bad CRC can also come from the link partner.
> rx_errors already means different things: mxl-gpy reports its RXERR
> counter, qcom-phy-lib and dp83tg720 report CRC errors.

The v5 addition was an inclusive byte total, rather than a separate
bad-frame counter. Its purpose was to expose the hardware byte count
without having to infer how many bytes belonged to errored frames.

The ACx00 tests confirm that deliberately transmitting bad FCS from the
link partner increments the PHY error counter. That does not imply a
physical-link fault. Tested valid-FCS runts and length-field mismatches
did not increment it, even when the MAC rejected those frames or
reported a length error.

I have not isolated symbol or non-octet alignment errors, so these
results do not establish that FCS errors are the only events counted.
The proposed metadata could express those distinctions without treating
every driver's rx_errors as the same error class.

> Strict definitions would need a counter for each combination, "include
> everything" would make the counters useless for diagnosis, and moving a
> counter between fields breaks existing users. Also, few people have the
> hardware to confirm what a counter really counts.
>
> I suggest metadata for the existing counters instead, similar to how
> ETHTOOL_MSG_MSE_GET reports the scale of its values next to them. Old
> user space can ignore it, new user space can use it, and it lists only
> what is confirmed for a PHY. Andrew should agree to this direction
> first.

The tests confirm that the PHY counts bad-FCS frames and their bytes,
including FCS, and increments its error counter for them. They do not
establish whether that error counter also includes symbol errors.

Should we return to reporting the inclusive packet and byte totals
together, with those confirmed semantics described through the proposed
metadata, rather than deriving a successful-packet count that still
does not match the MAC's acceptance criteria?

> For this series: keep rx_bytes as it is, report rx_packets and rx_errors
> as you do, and keep the byte total driver-private for now.
>
> @Andrew?
>
> Oleksij
