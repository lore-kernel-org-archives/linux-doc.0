Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DE62F068B
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033704; cv=none; b=pfWXta87fqQoz/fVBjCJIW7qW/xIYSfcT+PDRgb1bPjgp+R64RTk6Age3sK5S7hcJTkB0IGZaED7zbGlENNp9b8q4QOEIOi1G38iZ5Wd7iH961zQ0FVbR7C4vvudCSDqOO7fGPCHfXDsQemz+Q7y1ZTzaAeiz/g8ifwm1C840Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033704; c=relaxed/simple;
	bh=KqF1+a8WUFgvPqtIqYyoccSpDuhuE9yeOyjDi21Oxzg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Er0sRev6dloCYQJ0p7a7Tqp0sL9aUS5Z6e05IdzASxGiBIzmo5HwK+41ly1eUFHs4nIh4yROiVSRN7GmIFA7D4VrEQvTS7VYwu6dFpKl+uI3VQUttoXrCGds3QLgRUdYkOWVREm+g6vXQ2b3I7ipGt+QXot9THufXTxlO+1Km+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUeRwOPb; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUeRwOPb"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5393aa55adbso1673991e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755033702; x=1755638502; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=udxgLZsMuBzujZsIgKOrBNufSGgIZhNCZ/oU/YBNGMk=;
        b=EUeRwOPbbiIcpoMaVSGHf2ZcQZQAyq0DBShPdRkRLZGtomRPEKZI8YZle3Z9IKTdKP
         b0bPeFcPWud4owS+uCscpycatfmZUzLKPVH8XLU6jGfqXJjiDERsxZtic4dAgMgQrYUn
         zWuxTnzBzCRj4z4TbtPZEBKLr/m/bNYvskvVkyD+nVjr57Xqbb4uQW2jWr9FAJUloFD9
         5UVVb70sh00gXc5VsZrxijFEvhMcmS/9kvw7c6hbhzvz6bjsPMSviaVkh4ME4fxTkzuY
         VRs+Y4uP+vgNOD99K5zVWw6/o6k7Fs2UvNZ6WlezY2NnYqegNShiTJ52Donv36Ak+SwX
         kaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755033702; x=1755638502;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udxgLZsMuBzujZsIgKOrBNufSGgIZhNCZ/oU/YBNGMk=;
        b=YdASFNVdwrQrEdZYILew3wBrVrYNlkStnb/ykubeCuDFPMm6lGJ1HzTa/5fZ+bPe47
         5eXJ2R0Ir4G+reeQvMLUjQa6T5PmTBMgbIMvY9aIyty6TuWArqRtbqKqLFF1vqJUEubv
         COfpgCiVtpZqsNnzcgRe0GiWbGx38AJDCR0onmUuFEJXqVRdjjBlwPDmniDbLk6vbhj8
         RrbJznVRuxI8XJfKp+tLhC72AkJqOmxN7j42dkHZefSNr7uIELcTcqFKKcpOOH0sk9nf
         FQIMZBMX4m5Kh13zEkzkjS8IMVmECs5WCpm2Ua/bLgs8Nhbikwf5wsH0vQjk/5N1f8/x
         tKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnrNbuUsrkKb3X0BEN2QTURIIP/gtlcarc1A4QseSPJAE9cExaJBQTMBxJJJqwxEb5Kx7oX4huDIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxcsET/v2V+HZEIoiPhz0NpxAdQkaXT0l8fp0PhdjgSz4PVOm
	MFpXNNxzRcVy9naHp3c9vE1vmaPbVJxDrtZqtGc6LgxJTPdmAa0x9wB297m5BA==
X-Gm-Gg: ASbGncvCh00BvYxlg362Cw0FC/18z92+hMsAId6h+tc08Q8x35lbfJgsNKqIu/eJZyd
	Wduzj3H4bqQO1av2uATbjQQQn93sA9Ts2WS7vxQOh//3bFDoZJVNPYxUIeVA9F/biYzegy7AHFY
	tH5WLq8U0NxcFIqznV4HgMoInz5syZqbKKlfIEIWbfCdUOUGCcZ+nyd0XFl/WiO8Q4QBPUBhhnn
	RMth01aYPFz07DVu6aAgJBJO7uWyFVwlXVWGbEIxjpKvodI9cX5VnFzE2ZAuM8Xo9cotmlzY+Bm
	0t2rDUm8x0vS9RgOsddBv2lcaWbBKMGXwHscmRICtmh570GU80UY9Nh6mlTkxug5O87cSB5LfrN
	ujhnz/y4pwH+GSutiraCmEizN2hFF
X-Google-Smtp-Source: AGHT+IGnPp2/44YsSzEf8sxiSHYkjzBax2N3c6jST168cqIocCR2nQvG205s0Qd6vTXAnNL+PDwdRw==
X-Received: by 2002:a05:6122:2a49:b0:539:3bb5:e4c8 with SMTP id 71dfb90a1353d-53b0b6aaaaamr186917e0c.12.1755033702194;
        Tue, 12 Aug 2025 14:21:42 -0700 (PDT)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0189327sm3561356e0c.7.2025.08.12.14.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 14:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=e6c26212d894e6c9b20640730a7c399655843bbda54a5d3d14363671ecb6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 16:21:20 -0500
Message-Id: <DC0RIMIRP717.345GQONQFW4HI@gmail.com>
Subject: Re: [PATCH v2 5/9] docs: alienware-wmi: fixed spelling mistake in
 admin guide
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Soham Metha" <sohammetha01@gmail.com>, <linux-doc@vger.kernel.org>
Cc: <linux-kernel-mentees@lists.linuxfoundation.org>,
 <skhan@linuxfoundation.org>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
 <20250812204952.73136-3-sohammetha01@gmail.com>
In-Reply-To: <20250812204952.73136-3-sohammetha01@gmail.com>

--e6c26212d894e6c9b20640730a7c399655843bbda54a5d3d14363671ecb6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Soham,

On Tue Aug 12, 2025 at 3:49 PM -05, Soham Metha wrote:
> found/fixed the following typo
>
> - aproximate -> approximate

Thanks!

>
> in `Documentation/admin-guide/laptops/alienware-wmi.rst`
>
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Please, Cc this to the appropriate subsystem and maintainers. You can
check MAINTAINERS or use ./scripts/get_maintainer.pl.

After that is addressed:

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Docume=
ntation/admin-guide/laptops/alienware-wmi.rst
> index 27a32a8057da..e532c60db8e2 100644
> --- a/Documentation/admin-guide/laptops/alienware-wmi.rst
> +++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
> @@ -105,7 +105,7 @@ information.
> =20
>  Manual fan control on the other hand, is not exposed directly by the AWC=
C
>  interface. Instead it let's us control a fan `boost` value. This `boost`=
 value
> -has the following aproximate behavior over the fan pwm:
> +has the following approximate behavior over the fan pwm:
> =20
>  ::
> =20


--=20
 ~ Kurt


--e6c26212d894e6c9b20640730a7c399655843bbda54a5d3d14363671ecb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaJuwUgAKCRAWYEM49J/U
ZgSaAP9wN1duqeq/VX4VtgM7EedFHRBwZtm4CSeYtL8GDqXfWAD+Lkv2rH/yOBnK
JwG4tIJxpBW95pBY1qcOscbGY5vS2g8=
=ueG5
-----END PGP SIGNATURE-----

--e6c26212d894e6c9b20640730a7c399655843bbda54a5d3d14363671ecb6--
