Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648230;
	b=vkJAMLRHeP9QMpjNrIZYNxzy3kxVNaqXMy06ZodFoVlzxKuy8GTkJ1UXmiieQ6kxygal
	 io2TYNKq1DcW7FCvG/aMIsG4NDarvKqoP6oeP5qg2VQ1wQkFSDu4HtV12q8A7xC9AI9rj
	 BDFC+blO0Quyp5K0rfzxr3jDkvWgmcok4m/IzHzyDo5apBEFlWFvRVLz+cxvXaEM9gY0n
	 GKjnzn5wBd86KhMefTJwpLHxg4HPNR4T+ru4n2bvwnukwHtCTAsLi0BruOuDLghddxDWb
	 2okEpjgxKhiNQo2SXbawbuNO9u+Slt0IgrUN6jfZnsAP0MgUE3f41m++sVKKO9phf5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
	b=ErDZ17LDKTVtyXujFamrI43kRWg5DhCNqBVSiElMnd+Dbd50PztELtf32f86Fvw5pYMs
	 +0JrvzUZ0Jv+BRmME7OrcI8RWdyY6CjMAyFd4c9HiE+wuO1PIRC5lV20BLlvZg/YqnF8b
	 OcOsdQa94oH7NMxxctALqvBe4DPAxgxTNmSrZdvfZQDAfU/+tV/hi5LOJFM7qE2BA9cDK
	 OtGeMOW8qdcVwK90CUcaR1JLhKQ1umQLSXuDE/wttYJE1hv4LOiz8s6Gy+tYgis2C7QSK
	 /MupJV0G/Rye4XTEWn0xGpoK1rEhfqV3gkknSivgtL1A5iZNeLOVpV7Qns+xTNDsdNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A86B606A32A
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 23:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A86B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3061665a91.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648230; x=1796253030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=QiSPxi8Ruze1+eJW6+Da2Pb69jLHtjp5IOjJBHZJcfCiPL+nrAc/PVojTPm/UyFnFr
         2ToPnK8ovRrXR/aZZeKm9h6vS5pzLDPhzpjmuJqIQgCatKiLHY/V/nYzTPa1tUY8viLW
         HHQsqwosd/i0t9dlJU4W0+xtuayQqbQoW+3ExNQxi7m24WsrgIN4teF5xobePoU7/i98
         ptn05DfhDKV9mDYG2vp6RlRg7KE0UffcyutOQ0p3mu9OklqnnbBDA5e4zhg2rU8LLLYi
         B0c7T89jS1Bxy6HJDKtQ1FHLhdUT0g0G6U9EDRLy7nHRlnfHPRxUhNV6NfEGeetdzMvk
         idTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648230; x=1796253030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=VTO38ghcSmvjeY7OzEGDBwM9iFrJAWSgURC8D99zcsChcTc7QlGFLtWhkit3fbNr6c
         /Le1u0jm1eA7RPeNWuC9nf8AhzfBVvZA3Lf+U1Sguk12KMDxntLSR8im/ZZQtfra4hU0
         KzC1VBUOKa8DJoIOK261ZB/DwjgqRjrpZiN3wYH3SxUSSa+NuYhS9+GrjRK93EWcZMTt
         82YC0CARh560+fPMsRyxQ7MRFBDRZdub/EOnGhKt4IGw0/z/mnZKcCgAzygZ29eZrW+A
         4+TW+QuTPFIPEHzWUlMXQmOnkd7c9b2vBSgUt6/qa5nqiLy4rb1TLSNUn3daUrA/cC1I
         vaRg==
X-Forwarded-Encrypted: i=1; AL+hErEc3BRxKJGjEvze8UhMd/Y1xyBfYmAIFT5bziB78IP8pbp5BUcDk8qOTb37bLMP5UHg+p3Ut18AEc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a6PcrzTMN8uJgmcuaI9zBLUtFHn0vIIMefWLJYzNfl+lIMvOU
	+9yFRlg7ZXA79QTMq+uRLNv2YbCVvj24MBnQqGndkuIF8GBbdKr4DIit
X-Gm-Gg: AZFdTZewG4bpEB/hGlH/M3yuOgzErQ/KpnM4qQca7HAILT7H3HQHC211nh3iAd5K//R
	59cY74RXDYFCnN5fghRldpfmPU18uqK7l5HbdYE08ZGloaQlgt48p9zbC/+wxFo4kN+huqom4ip
	cBRkLdfjnGhdMNfo37P3u3SwgL1zAkZOxDZtoD1R3uYCSbQ1YCD85vib//Ho4lEHORIEsXOTDJi
	XzypLKk21MNROb8cSxoWlwutpCiE7iSfHjCnRhHMQDy8d6hP6zCwNxooA0IemesL/EeKhIcw+YN
	zLqJrcpBpql3BTwidr8HWaKPZ1Oa750uoxo/8j3MjVwPDQkC3AdYWRoXL9rDIvexQRVx8jVihQI
	JX4YlEwLlQQWulX4xCxbMRgL0bnmAHrr78aPrkeZ+hBqd6qiRBn+0dSxhzZzY8bB6AEGUuB3Z2Y
	UHmiAeCeEL/cqhxkYVpVkbm3oGQYYfWR047xxTcM9ASpy2NFS+c4s5wJjMn8CYE+c0KJRZUKg96
	HS/wh920bgcJgvxJ2Z+5Z8/NQZqCRn+vC3B8XdTulLwiqmx0a4M5Y0jAYF807bYEzUwwy1dDRlU
	quSL5ym+E4Zns7qGWeMHk3VkzHh0
X-Received: by 2002:a17:90b:2648:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3b41c95f127mr17871039a91.52.1795648229629;
        Wed, 25 Nov 2026 15:10:29 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm6822830a12.10.2026.11.25.15.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:10:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 19F1A420A76D; Thu, 26 Nov 2026 06:10:25 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:10:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 13/14] docs: submitting-patches: defer to
 security-bugs.rst for security fixes
Message-ID: <awdq4PpsF0BiBpBf@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-14-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="fXRipf5woL+m9ZeZ"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-14-w@1wt.eu>

--fXRipf5woL+m9ZeZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:13PM +0100, Willy Tarreau wrote:
> -If you have a patch that fixes an exploitable security bug, send that pa=
tch
> -to security@kernel.org.  For severe bugs, a short embargo may be conside=
red
> -to allow distributors to get the patch out to users; in such cases,
> -obviously, the patch should not be sent to any public lists. See also
> -Documentation/process/security-bugs.rst.
> +If you have a patch that fixes a bug with possible security implications=
, you
> +need to read Documentation/process/security-bugs.rst first: it explains =
which
> +bugs need to be handled privately, and whom to send them to.  Most such =
fixes
> +are posted publicly like any other fix, but their reproducers and exploi=
ts must
> +never be posted publicly.
> =20

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--fXRipf5woL+m9ZeZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdq4AAKCRD2uYlJVVFO
o6e0AP9gJNOsIP9zrW1e2mg+m5ED7Bg/2J+m6qHgcL361ELOsAD+JrY2Pd5C+/6o
IZAvI+CqACZ8YZPx9icO9xBREbGGQAI=
=9Bsp
-----END PGP SIGNATURE-----

--fXRipf5woL+m9ZeZ--
