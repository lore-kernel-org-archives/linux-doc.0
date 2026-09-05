Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D970399031
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607299; cv=none; b=aqQcZNLzJjy4jX7cqsxXvgXhGVxqEi8fhuX3lCrkXpmTnpcgyeY6xl9YjQTtq3l5KTuuh+/Ig9izdHlwJ6XxIG267Hm2+D6TQbuJD9uyEEVJhgktysW5ifEQNJJsTUUTpblFozxRPszP2CE0Oa6hOopg4uE04XIGpFPaDlnXj6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607299; c=relaxed/simple;
	bh=YBXAo6X+FgRsRbnvQYwXf6sxV3/zDU7IVdXqxa9lUvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKAcdWi8BdcJ/4Wm4CAmQEpTxFoO3YiZguDCypA4IOY7bh33IRWCfC8oAaWnfj4+s7rmQ9FDribDXvAyiwhaZectxvcYgmdlUpifNYwUeVUO/8ci0xYHqCK+MFoqJxqDAiP2h14YB434+iruOPrLteW0s5vCEZkcID1E6MaPGjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dZd0mKg8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dZd0mKg8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so16941865e9.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 04:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788607295; x=1789212095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNp3/xxedzUk8nrqDnTl7Nzha/3pMiPjAKKXlTQyTxo=;
        b=dZd0mKg8h7NVHF45TKXHJKpkOfbvDm5yCMsf3tbfdfK6M8ktzMFSRhjtrrXD6kxvYm
         1Rx8cs1dpV8Ad4VOUaBkzqrd2wfeuA2pp4mhc/SRfBZBsFskXKQyQ69xuJgJRfAcSYjg
         iCJor+bmSXCdzRtJplT0cnw153eib/g9WBD0YM8Sg8Qrop9O4/Nu90+BfAa9PxXFUcOm
         xDAkyQ1fJSLxpM7wR6D39/BS8EJyLyKJi88WkiXAaeWiodzPQIvddaWlSw/IwiNIm4Xz
         wvFG6IgRA/FzSlSA0/JxDPAsTTlORDC/76HsxGlBNEsGMcqF2m5MZ6LPOVLy0qDcPwFZ
         9d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788607295; x=1789212095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNp3/xxedzUk8nrqDnTl7Nzha/3pMiPjAKKXlTQyTxo=;
        b=dIbtdFQsy46kWl5RRvGt7t4eDHcEX53yHeKrJFIuUHYuEYW9Rtgx4/SKl78RMk0092
         9N5kndSs8GAiJHb6dXIQ0sOqVxpninyjoMtukjtOkkKVY+Zjt15PZ4PZA6SygvinJKXw
         wBYvflOPIkusAwvu+mk+5zw9oKhooj3kTV6fobV2sF+FTuy2fzDsCd1d3/bHtczci+B8
         6kLU1Xb0BqkcKmh1oRf0xXhvje27UnOJuket/dwg80IXP9fZYBYXa2I0jnzqHciiB9Vb
         ilgGrF3JbTlevLyDLrcOCEHkJUg+pX7Ij8ipWy1ldioie6Fe1BKHzl8N3gg1h6RYjP5l
         /cxw==
X-Forwarded-Encrypted: i=1; AKwUvBwJlUATr4QY/QKRkJ4SvBg24z9Vdllrlvx+KhDQSNfOFkjNOtXjo7h5XRApDbCM3QpBUjRA8JmjK0E=@vger.kernel.org
X-Gm-Message-State: AFuF++k7tQEqoNCmINqpSLSoR53Xx/zAJ6jL7Ck4JEJiTNBFSuaVC+Rf
	Q6UqfePO9UcDT7g2jZqLzcMGzqfOrEYaFl6T9fgv2VhLNpKKtqimL5/y0dx/WxgCQ+g=
X-Gm-Gg: AYBFou37K8EKAaf6Ig+3HZGpbgDPWr8zRdh8jIdv/p2ww7gtgi/SzGoFaxDRNTmP6DE
	ZDwqyYyb+RnQy5RtlR4XfWvL8+w3JP4dgXo1+rCkCqpH8AqR0BvTCNm/4lLVLZ1FUApY2DzkzFB
	+LLAig4aVgse/R3y1kQn6rNWVuK+epke0y2lnDCCiQJeBEhdLnyVOajnRESx9sDN4rK7XQMOVBZ
	d/K3AvJ7kPDDGEhNVl04ojWca+nUZtLp0xQKIhKqEt+Z/jXlao4sUr6HT3x0t1cUV7TEo35MmUz
	bu+ER9TLyWgBiCcEX5LxzvJBLAkROY3X1btqoj16COOMSPMU2ceNpvs6z7KZrpti50J865hyOCv
	86WrmrnszqGmyx5hgORrVjrdKGUQHG15PosqwDnP1VCJqygxQPBkaX5wNJCVla2bfXts3iH0QnF
	klDIUvwK2JP8iRrNK63fSO5rO38A0PVqkAIGaLf7GQ10wHNI459dxmlX7vjT4Q0Qav7jfOT4Cxs
	DZwog==
X-Received: by 2002:a05:600c:a0a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49cf81e6cebmr195801445e9.4.1788607295265;
        Sat, 05 Sep 2026 04:21:35 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49d084d62b0sm3656995e9.2.2026.09.05.04.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 04:21:34 -0700 (PDT)
Date: Sat, 5 Sep 2026 13:21:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: PCI: Point the pci_device_id kernel-doc
 at device-id/pci.h
Message-ID: <apv6yQ1U-HhNglyV@monoceros>
References: <20260905084916.40196-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbu3z3ocjd6m4xtu"
Content-Disposition: inline
In-Reply-To: <20260905084916.40196-1-kmehltretter@gmail.com>


--zbu3z3ocjd6m4xtu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: PCI: Point the pci_device_id kernel-doc
 at device-id/pci.h
MIME-Version: 1.0

Hello Karl,

On Sat, Sep 05, 2026 at 10:49:16AM +0200, Karl Mehltretter wrote:
> pci.rst pulls the description of struct pci_device_id from
> include/linux/mod_devicetable.h. Commit ad428f5811bd
> ("mod_devicetable.h: Split into per subsystem headers") moved the
> structure and its kernel-doc comment to include/linux/device-id/pci.h.
> Since then the directive finds nothing and the rendered page no longer
> shows the structure.
>=20
> Point the directive at the new header.
>=20
> Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers=
")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/PCI/pci.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
> index be35e9a1ee75..71c42b0bfa8b 100644
> --- a/Documentation/PCI/pci.rst
> +++ b/Documentation/PCI/pci.rst
> @@ -84,7 +84,7 @@ initialization with a pointer to a structure describing=
 the driver
>  The ID table is an array of ``struct pci_device_id`` entries ending with=
 an
>  all-zero entry.  Definitions with static const are generally preferred.
> =20
> -.. kernel-doc:: include/linux/mod_devicetable.h
> +.. kernel-doc:: include/linux/device-id/pci.h
>     :functions: pci_device_id
> =20
>  Most drivers only need ``PCI_DEVICE()`` or ``PCI_DEVICE_CLASS()`` to set=
 up

there is prior art that can be found at
https://lore.kernel.org/all/ede7ce64f20e10660ebf6bc1b41836dad750ae3b.178334=
9758.git.ukleinek@kernel.org/.
My patch is more complete, but I didn't respin yet to address Randy's
feedback and so it wasn't picked up yet.

If you want to take over caring for this patch that would be very
welcome, there are too many open threads in my mailbox and I'm happy to
be able to close that one.

Best regards
Uwe

--zbu3z3ocjd6m4xtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqb+zkACgkQj4D7WH0S
/k7BRggAsL6XKZ7KcpoHaZTbEXsVy9y9uzc9908uC5QqxX7b7ymECOYzZrFnGdhm
GJmJ38TlFT4vi45GP/UYGI26m38phCC77pkh1qvjv6gpF5jPgua7qgADMIca6+dk
FG+N/1g7Tk35A+ZuQdKbfLQJTs7/Em2OfIvIIHElUq8qYhJOImnpC5hecRnBJygj
WuibK6f+5NlXFz6m28cgzb6uqPvuf6NTCbn5bDGrt/1brAYSSm4Pj84Wc+fWz1l5
P3ajyep66LzLljrx+T+xBZ8qDgE8bHZ7H77m4LWzWmNOgOyyoUK63v4aQdkwErM0
kqSsETRSIJPwll2XReU3382w5w/7eg==
=+L2D
-----END PGP SIGNATURE-----

--zbu3z3ocjd6m4xtu--
