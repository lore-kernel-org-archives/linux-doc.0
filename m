Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174645;
	b=lcN+f/tw+lmEMWr8AJB0aG/np/Xhy7hM/lV6ylTCMVLKwgcLjAkgVFCNccnDxgvlRjms
	 6KwDxgF/KCKfk8C+EN9rw9jH67J/3aaJ4QEkcpDJ3JLlSsV5O+Umymg8PdGGtUyxICsVA
	 xst9YwEM4lA/98aSLph41urCV5U3MjpwfDBdD+LiO4pihWnGEcl9zOmxxtV6Inr6L2dt3
	 Tnd/WAOTHhG/7ib0zf6uBj9Y29OyxVa7aalAE3qDPfWPBnuppbk6HdzuiTTZ7V0MX/EEm
	 876xRL9VQxd3eOilwIe1gSrjFdA7HzKwmPlxcWcr/zOmkklyfH3Cv/dEOZGwLpBoVJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
	b=Oblg4ka8GGr8KGG7w+Sg03DybNYS0Do70ThRdv29+ASe22FrcWSWcNt5bns3atvE2nwE
	 Q4wwWUcdw/vGluz9NZmrwrnFXNPJhv64qsm489yY5bXkt8Km4cT1sw7QGjzORs6yFONHt
	 ijePQUpZ1RqZ6aksGR69BQPWuFX0EQO/igvDV4LZDGyjF2xcN1PdP4iQky4+u6bhIPXX0
	 1obrn2pocL3uH2yOSpIh8uVICCeq8Jlucx6gTF5v2Y91YDu/xfzxNucL2D5gNAlpmPxdt
	 x+cGHSaCIZsv+JF1WWHUTN5PdE+tOmZWyuCBsFT8i/DN4ZhsxmpYHVm5q2Wk3LzZP+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC4606A323
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEC4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5942165e9.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793174637; x=1793779437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
        b=VeacjZeXZ2H13/shN5QKdF0Sxcnm9lpHBcpJfpiq/VZZCzVqilfmiMnO6yd9HPmtP8
         TlP7YPN/+pGErIJoG9jZhviV59zAjTP3slB4ZYlffC2y4ybUKnDtr8VDEBowp1/236dz
         41VKts/axq7MozBdQ1YY2hKuPYsWiXs8pAQof3scRBNPlVaD+qoHb8JXzNRQjfvCr75b
         eBgkGWDxzyyYqgqqf32SsbL+4S69QKep2J7ckixHRyauW04C4j2WRVVeZugAz2hZXeqh
         j/n/IfrenSmA+1cUAixL8t72OKzbOqwY1WpyqJttvkxGfBv2p0MVLHQftbPotHpD4HrN
         s3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174637; x=1793779437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
        b=vTaixJ3qiduyBc0sR/At1OsQNAbbFmSzYjKcfhDGNkLv6Jg8SPcaq1s1NnOOcVtsjE
         uoiYgsxJBaWgPbUpElj8FvRLAglELeTiBpHXj2CfHdyepCmxrKAEKXmm3+AHcVyvR7aT
         eik34S1vrgAnauMjjwekp49xEIGI8LG7v60tmY9Dhixu8VJyBTvbuHtho7cfCRu2ViDe
         Ak4JMPGp/biKaZSD/C6DhnqsIqS/677lb0v/7uIvoPbB86FAMW8HIR1Gk+oUyFIz8P4U
         c2l31N5+prhLGvjuyDfoxfcR2yACx6g+FiqsZZUOC/PWvQBAyWsQqIbrynGm9FMkiOPu
         f2bw==
X-Forwarded-Encrypted: i=1; AKwUvBySPlTS28KEJ2MzOOpYqrfSRdGC/zU+PTzBefNYBEjT9gN5VxB9nmOXnpZMK8t2NYtjDGNJhkI6fGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPjAphEREoUvdx4g3fF2goa00w6QbwpgD2EJEUBkTi8HgAQ75R
	6lHONzJhuwHAwJxQyM8xFn7kILG/0oFKMkZDkldNlkEVQeymxt7726jU05kcl/ZcbNk=
X-Gm-Gg: AYBFou1nsrEfATlDwox7lqAw8T6S7hqWkyTaubw4zsB+K37tNBToyNIdW5rT/Llj0Df
	PAuFMPgf+6luqgxi+3H4wkr+AsW2OEZLYN+y7PshXC7+8pOcV62Gvmjt4wl6PddoL5g+bvVmuAW
	RVxAeT+0ylwYplfYre7vEfTzhzb3jciSQuF8axaYyQM3NKO7xOx45p2NKaG78Yn6vsiC0aoZ8mM
	yW7zy3ouCcAF0eoZFrakPE2Vj9QBA7scm46j6GvUbWFY0rrROepxtRudsQSbB3QK5H1dVx2lV1T
	9Z3aedLF75rRbxm1r9p5odYg3kq2wunjmI85t9QS4tpRrSoUPmBa347tl1nZ1PNTJHuI7WvSrha
	RWwwHFUJtQictV7CsfRX2Wuh1CrNL9J9LApha+LSOBV6Fsp3KG1nIWlIp7Wod4D/vn5qCIBNiww
	19ZYG0yKyJmOD3VVhvjJ7Ib/dtb+Y/5wkAIhAl6eTgvYPUUuhFGWvvcjUOdUXo6wK+AR8Y0+HNC
	lr2ivJ2ric9jamxp87CNRhoWE03mIfBWNmQmSNPgeko2XJxZGFQZexgOR8eNFcw/UUpJ1Bh7BOh
	x1wBvQBHwsDt5KuJaV+p02JJ7TjmF5JjYXvDvCXR7NspybkLPKNpeGJwS/omGvOYXNN0A+DUVug
	yfctcNgzX6tSvpWM=
X-Received: by 2002:a05:600c:c117:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a9672030cbmr23350005e9.22.1793174637584;
        Wed, 28 Oct 2026 01:03:57 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d6besm25792835e9.4.2026.10.28.01.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:03:56 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:03:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
Message-ID: <auGsNgw50hDIdm3R@monoceros>
References: <20260908070031.32833-1-kmehltretter@gmail.com>
 <87h5jq8gia.fsf@trenco.lwn.net>
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
	protocol="application/pgp-signature"; boundary="oh5zvfs3ycvvg6bf"
Content-Disposition: inline
In-Reply-To: <87h5jq8gia.fsf@trenco.lwn.net>


--oh5zvfs3ycvvg6bf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Karl,

On Tue, Sep 15, 2026 at 01:24:29PM -0600, Jonathan Corbet wrote:
> Karl Mehltretter <kmehltretter@gmail.com> writes:
> > Most structs that were defined in <linux/mod_devicetable.h> before were
> > moved to a bus specific header. Follow the movement to get the struct's
> > documentation back.
> >
> > For the list of device ids in basics.rst use an explicit list of all the
> > headers that have kernel-doc annotations and that are not described
> > elsewhere (i.e. pci and mei_cl). <linux/device-id/acpi.h> is left out on
> > purpose, ACPI_DEVICE_CLASS() is not a device id struct.
> >
> > Also repair the referencing in the zh_CN translation of pci.rst and
> > don't duplicate `struct mei_cl_device_id`.
>=20
> This one adds some new build warnings:
>=20
>   Documentation/translations/zh_CN/PCI/pci:98: ./include/linux/pci.h:3: W=
ARNING: Duplicate C declaration, also defined at PCI/pci:3.
>   Declaration is '.. c:struct:: pci_driver'. [duplicate_declaration.c]
>   kernel/Documentation/translations/zh_CN/PCI/pci:106: ./include/linux/de=
vice-id/pci.h:3: WARNING: Duplicate C declaration, also defined at PCI/pci:=
3.
>   Declaration is '.. c:struct:: pci_device_id'. [duplicate_declaration.c]

Do you intend to address this?

Best regards
Uwe

--oh5zvfs3ycvvg6bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhrGcACgkQj4D7WH0S
/k77+AgAlbsTSlbn2W+qPf7ANkGol57boWPL2S0I72TOezIPXND8DYud1c7YRtKB
PhpKb65OvxBNMec8fqyAFR6akXoak+b0LjgivWXWCOLrQOVwd96tYscMz9T9Zo5a
iRhWUg++SffuMe29/9xFDsjM8JgReW0CUhMfsySfbQm/TSFEl5H+4cCJJsGGtfL3
D1yiIWAQh24ef4OCHJjVjXkWufmtZitqRhecerzr0XU23WE5HyloUqa5j9rMKkiL
0zhPpQMkyPgmas+RNzxq8PVExFJdmjzr8D2BSNitOhQYuzUl762KznuCur+bCurI
6r+fdfpC0jZ68DsEx6a7fNVLvdalZg==
=tz1o
-----END PGP SIGNATURE-----

--oh5zvfs3ycvvg6bf--
