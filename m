Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B481C84DC
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137134; cv=none; b=eXqJV4yaAbaDsYrWhvZfhbJ0gc1HKgjphvq3GhYJC9ilEQY358NnbDMZNk/xo/Om0XOQs15H4ZPbx0Ui9Fem/niAooXzcccvPm243hnvUWN36CKbV4TCUijoLfqzBflx6OvPGLBwh51wetCMnQzDg3+LZxRYIfqDKE7D6N6eC7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137134; c=relaxed/simple;
	bh=l2e/ujWBSDuB+2IVgledu/+gXbBeJ8pUNmh2h0YwJ4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQf4f9HalPEPFRJqsxGioAdoFM0xNUVd2oiSxzVDJdnROTY9nufOvUiFYcTFMaQZj0EukhTl6375GHmBwika61cm9Sr/wYPa0nWpuQ8Rdr/dXEBVWV3YBazOCbelqdF0HkMoNToU8fnHCCos+VoF3wFGI1in2XXCjcSUpEQ0IFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwV6B+x7; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwV6B+x7"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so9846167b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 15:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767137132; x=1767741932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7F2kJGHYqDpZ+Do5YwTgmLErhm5dkAEvqgtyJT7OYfQ=;
        b=WwV6B+x7LKH4Os38JmxmAIhRCXL1+8jxAD0SIrE9oE86mArf1POPQ9qGQhNsDaCQxF
         hTi8pYprSVW6+UtEllZ4yysZxATqMIopCeABB4YDliu9Pvw1aSL+HW949s9B9vqwtmYS
         UiZxxfVFCfWGORFtGEXYKZmvqZ4UdgWoQJOpOHBHpbyoe8AupeZ3Loo3sskovzFfiYNB
         BZi0u5TGcryDXR79OMYSIW55GP8v2Z7PqupCr8xp70WyMMuKziy+30e/j3RPfSS0PE+Y
         ol29cdhps7uOFP6aWblBgONQEe/06Axab1woDCJpC9EBKvEIBjFweullmJf649Nq6V4E
         34kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137132; x=1767741932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7F2kJGHYqDpZ+Do5YwTgmLErhm5dkAEvqgtyJT7OYfQ=;
        b=PY7sQEylr9K6O6doj3JB4Sjff4HhKnn5meATC7oCwkblc+eYK6lKR0fZR4G8/dpNDS
         C3U3qrHWOhuxkUF24itqwJzI5g5F8T4SvgpDFRf/qcuVNxRL3eNPftx9DagdjL6bxnaM
         eugF0JNgJkRnN3LKi1FouF2oyexTsSKQySiGS3HEy2yeunN9UjUP4c4JKm3sO+RBGubS
         3xM7uZRVzzlr9jgX07zCfRbxcgWk9sIgmSEKiwFjwHKl8MPkQRCbtOfQ6wqzRvv6JWp3
         r7j1wFiMK1lgu6DirpZdTvsgaUyO15ssrNgSRdSMwl78hfona+rVNUMcboDjwd7zXJ3H
         Jnfg==
X-Forwarded-Encrypted: i=1; AJvYcCUzP0NfSiCHAqyTjynQWwV5PXd8pBsM2tVnRvn+n6R/HCltSC72FfqE2QGmG2ziK9UzlNVmfZE5SJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6eY34PMKYvl0FAiVjGMaU+kq+SdYIW7S/iK+ZcglX2/Inye/N
	S9Akx0BuwcSOeuumWXS4wGi7ZIxwZUIlyr+1n6vgxzv4OECoWjklNJ5Y
X-Gm-Gg: AY/fxX4tpRWzmfO61hhG/D3nKs5oB1jkfZdfTqzE4n51N1tstBfBbntBJCu+Qn71yiz
	hq7fLfR7qw9lUxTe82KCtFVOoWmk2TZP19OeQJY6dVuJSDj8v7yuKmL8pxQd4TlKQP+MOJovDDQ
	lDtDeV5C0w5aN0hw67a4gXQBzv/ZUNitOhH5LI3FMQrRr1ftr9wRAr+sA7mPj03nlXIniTbiY2N
	xjaBUGHBKfR0g84CwM99fe59cmbv7d2vQS/GJf0oNgON8Va0BmHsmgOIdzFrpsWQiaUS4usZNzv
	20CMEZwWwCfS2RcrpV7aiT/zdvAmbZsa5owzVtSdGpmG+rMW0eWjFpxkXgw6NBLXqK87teO6xKG
	bW6jK4iiXRvZhWQF2R7pJXC1CisZaWmTfwRnFq2foCY3fCiRB4PJug7TAIBBq6VIy91N5fpNcgw
	vPcvbWgTNQbwU=
X-Google-Smtp-Source: AGHT+IEPZzDF3HvHUqckaD4jfdHp16buEoDVpGtUVIOkATh2YAL6gS18F8DLgVC2ZQ/mDsUrcAK3Zg==
X-Received: by 2002:a05:6a21:9997:b0:35e:86d3:88ca with SMTP id adf61e73a8af0-376aacfd817mr36203306637.59.1767137132106;
        Tue, 30 Dec 2025 15:25:32 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c2e20a646e8sm14197124a12.11.2025.12.30.15.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:25:31 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5D5264289545; Wed, 31 Dec 2025 06:25:28 +0700 (WIB)
Date: Wed, 31 Dec 2025 06:25:28 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Akiyoshi Kurita <weibu@redadmin.org>, Kurt Borja <kuurtb@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: alienware-wmi: fix typo
Message-ID: <aVRfaNBv6r4rXdUa@archie.me>
References: <20251230213431.656106-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fvB2anBiOh2iRjDp"
Content-Disposition: inline
In-Reply-To: <20251230213431.656106-1-weibu@redadmin.org>


--fvB2anBiOh2iRjDp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 06:34:31AM +0900, Akiyoshi Kurita wrote:
> diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Docume=
ntation/admin-guide/laptops/alienware-wmi.rst
> index 27a32a8057da..e532c60db8e2 100644
> --- a/Documentation/admin-guide/laptops/alienware-wmi.rst
> +++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
> @@ -105,7 +105,7 @@ information.
> =20
>  Manual fan control on the other hand, is not exposed directly by the AWCC
>  interface. Instead it let's us control a fan `boost` value. This `boost`=
 value
> -has the following aproximate behavior over the fan pwm:
> +has the following approximate behavior over the fan pwm:
> =20
>  ::
> =20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--fvB2anBiOh2iRjDp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVRfaAAKCRD2uYlJVVFO
o7yoAP4xgxlf6WfXwJkO84WghOA9SSdfFfNAcwWdQF0QVl+LDQEA/cR9XIgV1pkF
hwSzjt5T6wS19FhR5FE93YU7mcTlfQw=
=4Vkb
-----END PGP SIGNATURE-----

--fvB2anBiOh2iRjDp--
