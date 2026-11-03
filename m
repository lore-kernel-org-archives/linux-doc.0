Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688111;
	b=S+QxwvfXUnNb1Elk0nJeswWTY+S+LYae6ka7Z4FUPPE2/uIiOdVAdUupLEwAG3NlUguJ
	 FxaXIXexK7DDksjmOWq/jXFwWmuHQ9s468kqQB8Sw2lpAjVFe+Z673ZzQKHWLLrreArJN
	 tkOvFA+H7Z9dVDdLH+NHhF2HAiDTpfh0g0IPb4lAYN4UHKTyxoQxJZkxg8cRuyfy4Is70
	 44vyytGngBofLOuXgJttwgypDdObrC/Sy7AJVkkeWFv0OlXPGZOcL2DFoW5Qsb1LcI1uV
	 qI4PskfKjNSiOC47SBA8vY4x/tYs7SjB1qb5xNjEatv4b3LBIgkgmIScsgH78M7uH4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XZbFiyKP41aFFQ9gy0xVXRe5kyE6xQOvIotkPQSuTqo=;
	b=gjOvPbA8NT1BX9gq/8gmATp6smaKHOm8Yc/wRV899SiMGIFdGcK1ncpB1IU3KizeZePg
	 t/gPHPOxMPqr+7DDqewBlF8BeQK98s3rANlkC+btBS6efArGhwSI4TyVkVW2HQtsMMoCz
	 4i4RLi+WukzP77qX+tcBMY20/5MB+bQ3bvCLkupGv8pNWTb6oj8A3BmbfJlBnUisz4JtC
	 G8j9xoNRKg2hVX62vQq4I8N49g4Qg+ai/T8oOGRaXnM9rquBAJ4+LhFFB6Zr7CwAEWwIa
	 O4MHaHCp5pHXurpYd8PxdttUafrztJ6dP/5NAA8k03F5Mxhg6PCJ55QaGZdjNl9rETw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oluP6zyi;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDF2606A32D
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 06:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDF2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oluP6zyi
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so28743055e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 22:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793688109; x=1794292909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZbFiyKP41aFFQ9gy0xVXRe5kyE6xQOvIotkPQSuTqo=;
        b=oluP6zyiXVY9kgI2Vf/ouNfKZtMzfELewZ1/UdCsAmA4IaIYYA9oFhy33tOcWN5jCh
         Mm1Ky/FhuxFAqUTNq5FU51Or/apgIuRHipx6NIzTFHTWsS6qmen0tffq21jUhZ183rux
         aFYASSvrM8X5eHcXGYTIJmskC95WgDrc90fOtVgTug/hfJLkmYp/q0A/Z5cdlpo5MtZP
         fq/CHGGYumh0QHxJx45J0TaZ01isaULs7dCdTn9fBjAxEvoWV/LwV6UYwdYqR0RLdRfc
         +kVKTESs1ocbnIVwJFH+oZMS1gd3U0PkyY92RFt8dyOzQFvlJ3bA2DPdPLVp/HCzT7km
         jB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793688109; x=1794292909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZbFiyKP41aFFQ9gy0xVXRe5kyE6xQOvIotkPQSuTqo=;
        b=Hs3hjkjgrDFOqMIOh51IGSWifcelGAlwApWrVgHJFW7XMtRLAnpqFZ6/ze3DmRVqxO
         Bb9koZuaoqd8+N9NPurlHfV/z0vAxPXBBK/8+4R5VJBkF2j08wLC3cbsbp+/X4Bxtoix
         Ri0/9cStUma2pHI+nvuTcIMR4khBNNIKv+dvkoFixOwVgkIKJOAuplsVLSEL7NI3g30U
         Vz1T+VZtZFXpMXXVHqRFC1oYt91IiT/3atBSu3RDA6PzqQv0mntwoT+6dMdPGl8Ytbt3
         0sGosVANrsO6JXo1UVKFNXLH1e9BcF4eMyas6euZzcL+S4xPcugYIwzdNYs4+GmReaq4
         ypPA==
X-Forwarded-Encrypted: i=1; AKwUvByIZzJcAgrPPk/z4H4+jB8yY14p5+9Pc0fR1cxKwhdZlPuJSZ+zdmzmKfSC/Ygev6OppcKOrissTGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lwF1JaKZwrW8fids7XpnPpR926F5QOJizjbSdlx7TyPwm63W1
	oNr25JPcccDuWcDJYvkOPiv07ifdHM3F2DiqEX92ihykjrZwJIASxVtXtv4c4IW9EsM=
X-Gm-Gg: AYBFou19AyMnJzO80tcDYB3ox4SP2G8GWwnq1glom7xq4VsqdAT9x3WHO9SGBBnuIs0
	Mgr51m722D/j1hJ7v0FMqFvYTaq+dlqvAKPhCVW5Vcz9nB/NI5kPaUV2dY8bhH5yOV1y+Iyk437
	cYrq6lW5Q3mpLIT3fauZXcwQm72S1k6hAUs8NZAqZqaSCZBo06WVlhID1ivx5yTqzOdmQj5w36G
	/UdGMYQJBC7R0pP+Nr+xLDo77ynKNOHtOjuCKMpYYoKIYpx00TYG8cyf8OwVO7g7IWOO3KaEYHt
	CXivN52ZPDerjgxAZHMUpcFQcplfaaFMY1D75xfrQxBFgti0RJ6TLV5HoNKlZG9xor2YHCmDos0
	oby6vII2YnW7/ssDhnEWS1dxUZddPrXrlOXx7MY0/Aa5GV84Rsktx2TrDKQ1hhfheG2t3ZLutjU
	Z9cVDn9b+Qlr4r24PtdvfxJnR/VY+iAHlGM5GfENLLHqmQqpz7nqM8IjDPcOiNOxODBbCzxZ6+Y
	I85tWkXu6GcQGIogGGe7szeUIQguSXQQLLX9VJ9khcgp1uvY/3jfXDd1NbfkOTxXnInNIjaf6HW
	iad0jMKQ/2PlmltXXlBmnV8GdCKEcHEUBA==
X-Received: by 2002:a05:600c:6211:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4ac17191046mr289485365e9.6.1793688108839;
        Mon, 02 Nov 2026 22:41:48 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b2aae24b32sm33736825e9.12.2026.11.02.22.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:41:48 -0800 (PST)
Date: Tue, 3 Nov 2026 07:41:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Arinzon <darinzon@amazon.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Guangshuo Li <lgs201920130244@gmail.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Dawei Feng <dawei.feng@seu.edu.cn>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: ena: Fold header containing PCI id
 definitions into driver
Message-ID: <aumBQIUAj0qhlB0e@monoceros>
References: <20261102110907.356621-2-u.kleine-koenig@baylibre.com>
 <179365616498.28818.15452478866037209509.b4-review@b4>
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
	protocol="application/pgp-signature"; boundary="fmbssy6xzbjtangh"
Content-Disposition: inline
In-Reply-To: <179365616498.28818.15452478866037209509.b4-review@b4>


--fmbssy6xzbjtangh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] net: ena: Fold header containing PCI id
 definitions into driver
MIME-Version: 1.0

Hello Arthur,

On Mon, Nov 02, 2026 at 09:49:24PM +0000, Arthur Kiyanovski wrote:
> On Mon, 02 Nov 2026 12:09:05 +0100, Uwe Kleine-K=F6nig <u.kleine-koenig@b=
aylibre.com> wrote:
> > The file ena_pci_id_tbl.h is only included once. Fold it into its only
> > consumer, simplifying a bit en passant.
> >=20
> > Note that I took out the trailing comma from the expanded value of
> > ENA_PCI_ID_TABLE_ENTRY() and thus these commas have to be added when the
> > macro is used improving readability.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>
> I'd prefer to keep ena_pci_id_tbl.h as a separate file - ena_netdev.c is
> already by far the largest file in the driver, and I'd rather not grow it
> further when there's an alternative.

File size isn't a relevant metric for me, but I can live with it that
it's one for you.

> You're right about the missing definition though, and I think we can fix
> that by adding #include <linux/pci.h> to ena_pci_id_tbl.h instead. Would
> that satisfy your check script?

It would, the minimal header to achieve that is <linux/device-id/pci.h>.
I'd stick to that for v2.

> The rest of the cleanup can be applied to the header instead:
>=20
>  - drop the #ifndef guards around the PCI_DEV_ID_ENA_* defines, nothing
>    defines those names anymore
>  - drop the PCI_VENDOR_ID_AMAZON fallback too, <linux/pci_ids.h> has had
>    it since 4.18
>  - keep the trailing comma change, that's how the other drivers do it
>    (mlx4, e1000, cxgb4, qlcnic, ...)
>=20
> Would you mind respinning along those lines?

Will respin later today or tomorrow.

Best regards
Uwe

--fmbssy6xzbjtangh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrpgicACgkQj4D7WH0S
/k4h4wf7BnWnpyFdy5t4kYuzGwH0D4hl5r6jwwVpNlRESO2NGcbD42sXBuT1L79v
GSMzWDB7jllHfMen947CoYaPAb5N5svMpDw9TjY1MO8hiTnzwzBCvIjaSvI6+nfS
SOTcbPkPoBLrdHlwk45oaFZ1CqCYYmud16tIkvA2G/Rrp+S9wQ6I1h0wZkWZ5ncC
37KbLYNcuhRRYQli/XCeIrQ6nKTF7f59q01bJdrMQWXrcHrNmMzYLxkxKFg3FREu
jBYBvuX44fxKZHDGcH09Uy134k3yQ+I+JoXGh2v8ylG42xzQ27jGjq/UEXz0iISz
uuuhFvyoIGTp5OBOsDhGMkb5UntSGQ==
=I/JX
-----END PGP SIGNATURE-----

--fmbssy6xzbjtangh--
