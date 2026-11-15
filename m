Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785283;
	b=ByOt51auBfupP28nnjk/qGTc/5p6AaKqiTjCTv102qOQVTqsC0mgLY/oia9sSzHAS/ag
	 i+PfAZ6nFTBCWAtMf9RIkOF2LR25cSSrq9GtE8dpin6KBGsIQgLr2sahosxD2ow64WsPX
	 ad1n7YCNpL3i0rljkCXHWi5hnHUcteb1P5WOkem9TMz5l5WV1GkByoIpbm3XHHViCs7U+
	 u4jpIkM7OoHIV5n6kYbNLVXqGK5MXb1sswrBKBMSm5bcKPRz/FnI7dfTDd3PNv3pFKk5X
	 I8NKS/5jSX6X2eKLed2qZHgsD6kWHH+iINho+e4jsW0QmlrssHMBdxzXITGFi+s2t2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ikuO6XZ63o6Rkdfbgx3+eT7WxPtGqnpZ8RiBFboTAg4=;
	b=GskBg++jaBPzvaZutwiRc7SvEp//5xZroUL+YHr4izckMsTheMPIzcbbzhGH98NYoB/2
	 jDFCzwvW8xN+vhvWTQX9Vxyzg18wnGc0dRcKIEFLrHcjk300rh3LccL8afwl85dBOd4lt
	 SC2LJe6FpWAwCXbxv1JGjL6PthrZe4SzDd3lY5v0MG0sXdomMlPbDEpPC+YkKm/b2Wv15
	 Na8AuHnW2oKvLOlaOr/N70ODsa4vS7RlAaeac2D4zU68vg7D7YWRyzqLv8WDi49gDLuws
	 vAkBO3HVnruMKk4hIsjViloB7GXhd2gr06AlFGTT+R5H2m2njETpQ2NXQR6z2SGpmzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHfTjm1v;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE40606A31F
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE40606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHfTjm1v
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37f14feca60so551563eec.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 15:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785281; x=1795390081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikuO6XZ63o6Rkdfbgx3+eT7WxPtGqnpZ8RiBFboTAg4=;
        b=uHfTjm1vA1E+yPk48DwVkwJaSYq/k198BXL0V4yP958CTy0daoxtkgjnRWJlsyO0zx
         RP1fFU5rWi/blmvh7O7tz1h4QfgEp/1DJo7Y07kc2CKpogNHLdQkzewbMDvdEznhhr+2
         TLL3zpwXBFFhz2yHsevVKxpQeNvJ8wGNkmLUJtqiF3E1BpB6/IJ0qEMeIlOkBdNymBnt
         SJ+dc5rLCkpJKmI+4JEhd3w8PB1RHGxHLl2f+YevAYDd15UMwx91O2dTkQk0ZCydDP9E
         9XcpIYN6uF8DRDB3WJ6nzc1tLe4LdCmGk0Mx71a27JVxBy4NLw/8IQ3mETuAv/BvyLtX
         DUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785281; x=1795390081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikuO6XZ63o6Rkdfbgx3+eT7WxPtGqnpZ8RiBFboTAg4=;
        b=geYqyMoihfjQHHuBHETGrEo1FdYNsbBBfGjwRKCBcTWXCAsxB4AItHdKU2vRtFhV3G
         JijdcG75HXd0qBZibzYZPJW5ktuqMgJPbsfhkaUokMx4kC9DQTftIee004I7tngoYCcW
         GC5ZHyEhi2YWsXZqzzef39xkh1aAz77DhaZWsbC4y1EmkZr3khjcXChThRhwR+j+56Tg
         ps1AMyKUXxdoUyYZjNPOoeX8g1y4wp4vM92QAgDi52AWFUP7ZZ/zXP2VagJjUUq216J5
         h4+E9EmHQys1h6pdDXrju97H6PeVw/irhjing6Z03QesD1mqaLz0exfuU9g//wJQnArZ
         jACg==
X-Gm-Message-State: APuU4Z+L84julISptCbwk+uVP0ujlGTE3O2z4y47/e1EY4lz0x4tLebt
	xwN7NObUQeSrG2MV9LWiT1jjrpjTRwMLN4ska3tGnTAQVeAc/6gKUCNz
X-Gm-Gg: AYBFou1Tdo4Yj0bAu9qPCCREH3o9haz5ceqFQCvKU9hs3nMUVtU8tzUETQ+kNJB2y1m
	zIr6F4381w4YDtnT5Vf0AsVUYuKHfn7L0wV2/iaLilymjjIIrWUFNtWLR6WNYYf9IMNnB8NXfBG
	7aiWlWpJic4nmvF8zMVOD7R/Vcv9tko9p6GCG3dd6HJ0UpDrvuMvL1BwyUnBkV5TwfBHYDrcB+v
	GLMEp3PPWb/Lr5ZrPjicT8ezgG8oI7vy52TbkaKRe/rRCDy2xrpWr8qx/5vJFTlOk0SD+2O4iGO
	Xl8Dj37SwJyw5IM5Bm4vudjIXPKbTPs6az7djwr+it2AmpaOqIS/65ii5lHIVGzzzFOMtJyUdTp
	sWQL5jPhsVd25bHcrz1ukOY5ujVFamivlXXa3ZkS/+wgQgsSz+lh4NV1HRdjf3/XK3sBUJ/VtZ2
	uWX4Lu1KNyYl1R36/ruA/na+uK8Q2jE5/RAkts+qO1jGe86SHIwuDcmN7FlOKZ1q7UfOsgqu7Ov
	iwZbXZhkDodx3s8Jvp0kll9IhsplgpVySTxG2ni0XSwWxhoL7ZbHvEToDr3yc3gLSOqsSnlJjjv
	2WUawmGw8/m8UweucVs+epVu7Wc=
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr8607588eec.37.1794785281144;
        Sun, 15 Nov 2026 15:28:01 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31852284eec.24.2026.11.15.15.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:27:59 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id ED86F41FFB1B; Mon, 16 Nov 2026 06:27:56 +0700 (WIB)
Date: Mon, 16 Nov 2026 06:27:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: doc-guide: improve language
Message-ID: <avo_9xmBYyPpAUZ0@archie.me>
References: <20261115210423.1089716-2-manuelebnerli@mailbox.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o/YRrtN8oc6+tiqd"
Content-Disposition: inline
In-Reply-To: <20261115210423.1089716-2-manuelebnerli@mailbox.org>

--o/YRrtN8oc6+tiqd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:04:23PM +0100, Manuel Ebner wrote:
>  This guide is for contributors who would like to improve that situation.
>  Kernel documentation improvements can be made by developers at a variety=
 of
> -skill levels; they are a relatively easy way to learn the kernel process=
 in
> -general and find a place in the community.  The bulk of what follows is =
the
> -documentation maintainer's list of tasks that most urgently need to be
> -done.
> +skill levels; they are a relatively easy way to learn the kernel contrib=
ution
> +process in general and find a place in the community.  The bulk of what
> +follows is the documentation maintainer's list of tasks that most urgent=
ly
> +need to be done.

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--o/YRrtN8oc6+tiqd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavo/9wAKCRD2uYlJVVFO
o6zmAQCPre4O/d+K/W4Ct4ePFRlSQMdksLea2MbK0amcmxtUFgEA/nNdQdORodlB
wMnhF5aBDNXUXEEmrONy7SRfB1m9swo=
=A9RD
-----END PGP SIGNATURE-----

--o/YRrtN8oc6+tiqd--
