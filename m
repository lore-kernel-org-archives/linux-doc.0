Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425459;
	b=opcJ8yGVzHK9O/hTqmzNwM9zElQv8a6Reckqn2oTKieoSNkKxA5nbARu/IZ9AW21q54D
	 Th8Fq8pY16qRmDSV0Nj3tUDguZhKiZEdg6yvSCRYbclz9Fo7pFkVeNfZgisXqMbq3QLcz
	 7Q9oSLQIPYH2v0UfPCu0sy5FaaD0ksW9+j6kU1EQ9lX2/v0VARfQL/qQUXqeGnrVtevnU
	 sGPNUEcLJbqdNLUvVEpiWYFBtJBhJE7vmHGuIUjaop7OMVQPwYpAE85zVQOKKeqoKLMEw
	 iKmHYvj2/f0lKzVUj5ByqHUO/uTtKWawHmqTxmDuHDWITuvRkqEHZGTwBpKDS93GxqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
	b=NpuwZgCvp+f7Uaf1aKSLDShvm5Z1XbPTsrymx5ZSgbaQjAQ46ADGOJmUaYwqC5C7Ohg0
	 4jqGR+Lga5sXqUOr12FRgFO/GjxZyiqgLmBk5ZqfWjSOsxKC4SSiaII0NNLfK/bivSiFf
	 eR/FhXoD76o5pzyX64iIeh8WjaNRp2yBRIcwaPotPwfoUWOqaQbpBR28kKtWJKcTyrF3l
	 MZSBxeqWfVblStWFN9A0bH4GB6ddo47mvFiLFgSbmZBSp8pRKsbkn3jHKsGeUBAczI+Vv
	 PGw5dRAckLZIbOKBTVdmH5GEg+ciIhN5f+rLjTE/+4Jvzl0tswfu65rfgGQsIaOdChw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MjgPBNgH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFEF60A381F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AFEF60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MjgPBNgH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25542145e9.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425458; x=1796030258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=MjgPBNgH02xQwwlmVT88dEKqXLmkOtxBaiUolaQXrr+yWHJYso0rq5H3V5cMGxLZ4j
         4A2RItLr1Sek84a15jzHonWwk1i+lX6hrm7p24UH3BIVH8u/GLz3xMWZesQ53FDWA+dG
         x2x2jR4ERMEhavazR0qcOByOsQ2qCtCO2KRjD5X4T6FvMjY7zuG6fmRzqAPu/AUqV92V
         3zRAjur90G2sULFJ+iQ/xXtaDgx1eTPqGezZVhpjaWkCUtP1ZjTSJ27EpBZSLQkbdNSp
         w+okTMvneu+NyL6uX2WegqtYxcRuAgKYFanr9LmWTOiEkdkqf5Pi0yPw0QbSbOF/v2lF
         Cgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425458; x=1796030258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=humJptttbwXEKs8S1Aip/4B7UtaezlOLNVwePykCGXrNQdpo4ABho4PHlQy0yOjfmN
         qXqVURO07QsFRn2/Q5eR5ta+GCTGWoHQdli44k3zVUC9SsInhDeTY5Jdlgmk5ebor/WK
         iu5E8FYbIduqLdN4AYTDkfeHV3kHhZbrQRhKmFU3xXHvb0DRNcWBNHsDTl27UuUQKz9k
         oqsP5Eu4/MjGcCalnH1lq4Bz5RcBmlTshE5Yogh93bQ8D7MyjljynKQQ75qc6BRrQpTj
         gjb1yCPgQJMfX6EcrjiW7AIqV/8m5NBLYJhmIdELWyzdDKMZeQeDFiAejzz0KBB6oOki
         KFIw==
X-Forwarded-Encrypted: i=1; AL+hErG7eQXCONSc34yCAR2ytdNeC5lDwKffmI2e4gN8Nd6+zH1SeW9ePDNKVrEPwcwK6QwK6wijx8IswG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oo/+GrWPl1oi85y2wqhmJTQaADzr+iQmoUmt/e12CZzh7Ks4/
	ZDmT/8QS3kiVE1+ZBokb16Fwsb8hLlVPb12DeD/Ot3BQ5AH/TOpXTL0BA4ZsYjN8Q6E=
X-Gm-Gg: AZFdTZcUAq11b4v1ZL5/4OS3OjdHVAvk1w1tsChTj+tsbKHF36DvArIEMcuzsmSSvcT
	7fGlDR4Ep+zcBX27jOGeaKDxUoHutgKbg/Amfku0csBBadlhagCEF/NbAdo+FI+HDgCKCDER9j+
	O2R5+7IhEKBWc581lPyVpXDE78BLYQl8cSs0vCe88AhcqJIGcJOym1zwAJICJM9GKwOlBNDsBf9
	pKM1hJfRegJAnGu1vRS2BLBS2E8qyfO1W8YSlLE5mxV3fUAkksO38zRWAZPAtbULsBvLXMuB/fk
	yWsBL7bFjSSfk9GBXbPHXGxhfrQa1ZbanUB48RR6LM1OzIzSXiYpyYUxK8L5U6476AKvz9hv8Km
	oIFCPN8C1oPVKNAJ/Ed27NfOsdapvGvSk9889jPIVlCx1R+YOoYpdSa6q+MtXeXrDLlMSDWksoZ
	6480TVjWOYI6w3XyDeZEozo9Vbj5wgknrq9Ac3cq2l51kT7K/zEz9EiEpelb7wLOak+2+tZd5Dx
	bnCk9FPL1f7iHyoPovOjf9Dr4gM5XxQ5IGg97ZVaLAY8KB4HmmUWGNHK0q1Dt728Cfde1e9r7VS
	uB44pwB0AeeSI28q4QUPmaUiDUH95uMr9fOStlgmwDW/EDHX2sSaY7sAZNt7/Xak/KIfns+I+jL
	aCgjXwTy0cuhzgdOQW4eyrO0vv+b5jkfv3LV4Og==
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr224342725e9.18.1795425457707;
        Mon, 23 Nov 2026 01:17:37 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906e4ce6sm162891895e9.4.2026.11.23.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:17:36 -0800 (PST)
Date: Mon, 23 Nov 2026 10:17:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
Message-ID: <awQEjpz2572Y9wsB@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>
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
	protocol="application/pgp-signature"; boundary="53xo6eipu5xw5r7j"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>


--53xo6eipu5xw5r7j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at550.c
> new file mode 100644
> index 000000000..11c9de0c9
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-at550.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivalence. */
> +#include <linux/mmc/host.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--53xo6eipu5xw5r7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBK0ACgkQj4D7WH0S
/k7hOgf/csj9IbehNzv7kJ/jSWUzgb6r4/RUEEbwtHDzllOp2mTN98xOQkRXzRr+
kmuM5eb3Prkbs0qQBPQiihfmm0Jo8lnvB2N8uBswWQM42XQ1o5YmtZx2RIs5cp4a
M0FFz9Bz2fH6rmOr5ETS3FRjnZ8CNqQnaFBWD9lGusUfgppfoyqvFwbXBZyQd45Z
KCR1pIqN6sWoDMkalLwcL8/M72VapgfDtPpmNp4qxYjf3m8WbJJZGT7uK2Mk78DG
WWybLbbeuHCv72ICgMdJArlShc5E7A8r/LZSSpXjnNPBCxOU5AeW1Fa/7Ma+TYWI
G0UtaE9KZSsmGdqMVovJUC5O5/MnDA==
=R4EF
-----END PGP SIGNATURE-----

--53xo6eipu5xw5r7j--
