Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F8412DDA1
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759501628; cv=none; b=d/HHXtl4xPQ9oSe/3hWk2AJEAl/2023n0x0S0kF0vEiVhnUkGJNCVnj/jGqx/E4UtUxP7dfR2Ddgfd/OKZg/WnK8/UdwTVtbLq2lwmefG4K9VCOaGICUAQtU++kVGaC969fU8vdsAQQJ6UrugziPLX14EKx/syUJskBR0eIdi04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759501628; c=relaxed/simple;
	bh=nr9X6FKWlufDJmWG56v4EBlRffFdXU/0gJIMya1XzSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYeV/fJdOEk5UHx3uzxNC/+PGzFSLfoLjd4mBpG1KFGvpB5UUXQWZ+G8kypedi9i4bWniF1DkzbdRY1lZzod2Sw8PNg/cBO7VrULJMsbwIlExv8pDL+B354ke691VcQsUQB33xnbD3klIQgzGGu6IS94pjnjN8JDmGqHWCp10W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMZ8Thfo; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMZ8Thfo"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b551b040930so1511080a12.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759501625; x=1760106425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nr9X6FKWlufDJmWG56v4EBlRffFdXU/0gJIMya1XzSE=;
        b=YMZ8ThfonpE3sNI9tEj3ohlrdbXYDM0UL3LnibAPfv9uRyK9PRc0BqwVI9Qy7PNmQx
         TikUiRmZ2rHiMcXXNS2bjQwX+r+nn5i2S2wc7pfobfF65++DFeJR+EmzCqDMYTKFN2uE
         fEpwiVFLBjdazcy9WcaJsNKiqGNPVB0zWJhx5DfK23/oKZC9ZIfGhYBP4a4eTJ8h1H+o
         OW1uvEnaOauZiSjKNJRjqaxhUn9J6KVaD33XzUGKyftD+faiuc6A6ZgXeanC9HEh1q/A
         oYkygTsyKFXrEg93/c5GBNUwm5AjN5vXhA2CGbZ6sBllz63RgKbEAZn1XbVkj/yAQwCG
         v9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759501625; x=1760106425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nr9X6FKWlufDJmWG56v4EBlRffFdXU/0gJIMya1XzSE=;
        b=j6ITEJebBAHPyYUY/H5JQqY5Odh4uHQCApssj6aVBRi7gQI1Ng4KIH38wa3rqP4259
         tPNhiB/5Hf74hrqvF1Ei4vcXfBRCs2DM7zJanR+9S6Wk4NED9dg3rh48ZYORgIYK6kOl
         UOfGAfn6imOx+Zoqbauef48ZJu4khw71hMk2ppSfZyvLwbaTyy5P0q0HwqmPpD/Cy6Ac
         BC7QYKJ2jfO5DkoQ0BP1WpxubdC65C5nB+CSC0/qd2Qm/8ZPkBNTyjF1AgPXScTrgib9
         g5Kj/xsNOyHOgXPy1v9wCzOkCgobFtDkRJaojAXtlGAFuXNxzhvdBNGeBlQaSwBOZuHy
         ukJw==
X-Forwarded-Encrypted: i=1; AJvYcCVqQwrktj2TpJg7vrlzHGuV42I1QknxgpyBeveceXMl6reRHopp5UHaEJDBGP9NxMECb+DWHKuHTIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDriKwBxICW+Ke27y2ZYYuNhvjZFnlOQ/6Prk0wOOTcBF7S/E
	GpOxSklRNNgj/Nl4tBsn5xuRgbups32Zs5ql4xcOyBn4Kzu2tv+Tk5EI
X-Gm-Gg: ASbGncu26Qo8rnfZmiH3GFVS5vJC79xI+BI/LmZqGGiVvDUXrQBK8hWqBd10cR/VMF/
	3+jCWekNKBKZZFHUeo0RWijz2dtPmv7h/WKC9Ove9TUIsAtxhxy4+Ck/9vjqWS8xIMIdCSOM2cV
	xAZ11Oj02zm0wvKlUWffs7w7fsCsRH7zeC5Xn4eAGeHGJBAq8vHhW70VP74BssdUw9NJN7nUxNi
	w4Yza+7aCRWAc3ZVXIAAX+fjFzkm9SKzQpVFrjeN3LH/7OalfYIgini70TsM4OhhjTAZSDXiIyG
	WXLHkstIgTqWpRF0mpqDgw5i2OXUg/E/J4qleN5UBBH6rNuhAPzez/cXDTTk8BBW4niZRbezLsR
	tNVPbB1W8Lr4F7hSovIzryHU7CHV1sCjNVn8E7TEWMflMEHYjOQ==
X-Google-Smtp-Source: AGHT+IHy64D4Ksfh4et5sm9wJxuRHJC+w8F4lzSiShR3Mpq9ZsO5wcXCG40jHNmvsYuyoMhEMJ49Pw==
X-Received: by 2002:a17:902:ce88:b0:28d:18d3:46cb with SMTP id d9443c01a7336-28e9a54660fmr32869215ad.20.1759501623851;
        Fri, 03 Oct 2025 07:27:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5358sm51793565ad.103.2025.10.03.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 07:27:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 37CE04233431; Fri, 03 Oct 2025 21:26:54 +0700 (WIB)
Date: Fri, 3 Oct 2025 21:26:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Anselm =?utf-8?Q?Sch=C3=BCler?= <mail@anselmschueler.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Issue in Kernel docs / Admin Guide / SysRq
Message-ID: <aN_dLVPkwvxGM9R1@archie.me>
References: <7ca05672-dc20-413f-a923-f77ce0a9d307@anselmschueler.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NEpccGRzVAYWyfhV"
Content-Disposition: inline
In-Reply-To: <7ca05672-dc20-413f-a923-f77ce0a9d307@anselmschueler.com>


--NEpccGRzVAYWyfhV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2025 at 02:32:57PM +0200, Anselm Sch=C3=BCler wrote:
> I=E2=80=99m writing here because I don=E2=80=99t know where to find Kerne=
l docs
> (https://docs.kernel.org/) sources and submit patches.
>=20

It's in Documentation/ directory of kernel sources.

If you want to send docs patches, please read
Documentation/process/submitting-patches.rst for how to submit them and make
sure to Cc: linux-doc@vger.kernel.org.

> The page =E2=80=9CLinux Magic System Request Key Hacks=E2=80=9D
> (https://docs.kernel.org/admin-guide/sysrq.html) says this:
>=20
> =E2=80=9CWrite a single character to /proc/sysrq-trigger. Only the first =
character
> is processed, the rest of the string is ignored. However, it is not
> recommended to write any extra characters as the behavior is undefined and
> might change in the future versions. E.g.:
> =C2=A0 =C2=A0 echo t > /proc/sysrq-trigger=E2=80=9D

I think that the second sentence refers to writing subsequent characters in
this context.

>=20
> I interpret the command as a suggestion of how to properly use
> /proc/sysrq-trigger, and not as an example of what not to do, and I belie=
ve
> many will share this interpretation. The command as listed will write TWO
> characters to /proc/sysrq-trigger.
>=20
> Either the behaviour of ignoring \n should be codified and explicitly
> supported or this section should be changed.
>=20

See commit 39ff20f5fd4481 ("/proc/sysrq-trigger: accept multiple keys at
once").

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--NEpccGRzVAYWyfhV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaN/dKAAKCRD2uYlJVVFO
o9BkAQDgvUKKHvPahn4XA7QFvX9fXWeDV/sJtftcEbTPtzBgkAEAsV1Hqu83m10w
ltFcQ65RHOzQDSGS7QGEgyVCiMfaxQU=
=SRxw
-----END PGP SIGNATURE-----

--NEpccGRzVAYWyfhV--
