Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08D28F4A;
	Wed,  8 Jan 2025 01:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736300791; cv=none; b=p9ZDYmOrMIoCfxRwWwFgbtZY+HgAvhNoH1qFr+zfv/BZJw/eyP19zvRrp9VLZyg9wbM4aRSQx2kDMCDMFOMAOkByuKCygeUJrU+zzTnifBLGeoJc32Kzeo54O7hsOdmETvYYg+YrQCe2uiXwWDkr70Kl9NCvC8+h8ZnsSrQaHYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736300791; c=relaxed/simple;
	bh=Yurbj2PMhy1yO88Pa/Xtx6KwuDgRNVk+kLVhXlTBlHw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKQAHkNLUgPM9sO5xMxfqIu0B1h1wMn43+c3ul5RtZqqPCCcFf+MV6JZARKMKEj+DSZJfJWaze9CkT5aVIPZZpAenTTkL+1MZBlSYz8KUlu9Lq+wNWH+W4EQCzHVMveACtbDBYPSQyZZSun7Oqo4bqvQEsYaexlyHrKORvzikdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KonVrlTi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KonVrlTi"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f441904a42so24208458a91.1;
        Tue, 07 Jan 2025 17:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736300789; x=1736905589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wV6pE1Ynq78r3cD78eI3n1UoXdOB2tUqu2Vyy6FlyRU=;
        b=KonVrlTi76kdW5rLi1sNd04NWYVaGAZMsiqTtuJo/9WeBw9sAbcK9Nn7pCvsMqkrov
         cQuhDU2ttphyCT7X73thllSzG4cA8kK7YfxZfxYx/m4boElRSlJinClEb11mPacFRssh
         sC66Knwxr7B10fEcTdqPQhGStWgmB4lfHXAm8tcqXxCmd+XDxuQsoa/BF6Xii3S3gKiQ
         E0pD3Bx0mTx1CdrPDd3KMHTORoE48tVwYF6z4joe5veMxZLb6i21XbnYIYCcpq7prnSX
         19q+IPPhJE7jRPwQiwLj5CRq0QxqaM+UeTMxB05TPq9fIUuPtOrUJyLoi/EiJ44Zf0qQ
         Iq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736300789; x=1736905589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV6pE1Ynq78r3cD78eI3n1UoXdOB2tUqu2Vyy6FlyRU=;
        b=KylRl7YaXSVxSkGF4xu5+CMC/O1mqB0kQDdB23OLfH5FXzC5FFqTf4ZLBInK+3PiD7
         XALCVA1NV8D2EqgMlzg/E8KjDwwDw3xg2h1CKra5vKsUtKkJvsgxqMEYRR5nl1cvXuuU
         MRRRThjgSOLjFTWP0ObcpyTpBAu3V0iXaI3H9qRNBXlOUETUIlTiNTXS8n8b3/w9Y79K
         VGH2aInPD6aXJncUenpTTs/CT+QXMPxqtrvG2gllX9oVCcsRixQ2xwInaAb3ElKsK9gn
         OVM57sIQrtOR+pFJGHDMXPtGz7FqBNmnLI8g0rJBK/6a0+JrA7VbXXj13S2UEhhrTkGC
         Pd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2kC8oLWQ9uk7HMaox8i2bV2KT68Q2ZGIeIi0WE+K7agbocNN4qvQ/aW3i/AfHHcg4GLFLkWOfQGw=@vger.kernel.org, AJvYcCVuqUYpjbG5t4cnDUlvBF10NzZNU+cBkcojrtnycO62xmvuOJYZq9rOtu8++HGF/Wn2hnWl0mqAfCNW0m0j@vger.kernel.org
X-Gm-Message-State: AOJu0YyIT1RyJ783zdWoWgqDiYHBzSs0IEuVph+6W8pXOMZvZba3GHis
	mf931rgInZaKEAFI1ITzW0WmnDKJe9tp3nCpezBVXKdTU6syZ3WFhCYcOA==
X-Gm-Gg: ASbGncsqNEnklujFz1G2fe7cWylWCm3euLhktPmjc93puJ1ZvfH3dk9PqTdUJvlDbNa
	RPdxKPe3zuKBsC2X0KxVdiDEjGtbvdpAjYr2Ohc5TE2cmjAz6KNigJs16Rii5Eep19IYMI99zUi
	4JdnP8of8D/xOqdlRCHDg5LsgXw8uwojsZP9EhQLHtSAZR6kw7KMtvZ14bCl6t90T/+mzYfE0fB
	9z1+Hrww8p78ACHDRdv5S3nyTiZM7mzX/sV61MDicZlqFZUzRvnTP/f
X-Google-Smtp-Source: AGHT+IE2BpBDpyFaNHsHulzrrt83PaJ38m1kQGCHnklrVknDAVFqGg8P1Fiiz3RRlDyKASWB31y0CQ==
X-Received: by 2002:a17:90b:4d10:b0:2ee:b0f1:ba17 with SMTP id 98e67ed59e1d1-2f5490f4ba8mr1512258a91.37.1736300788650;
        Tue, 07 Jan 2025 17:46:28 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2c506csm243138a91.30.2025.01.07.17.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 17:46:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EC623420B892; Wed, 08 Jan 2025 08:46:24 +0700 (WIB)
Date: Wed, 8 Jan 2025 08:46:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nir Lichtman <nir@lichtman.org>, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix x86_64 UEFI outdated references to
 elilo
Message-ID: <Z33Y8FRqVvPycCgB@archie.me>
References: <20250106223526.GA877278@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebxt8B7R8t2H4k9V"
Content-Disposition: inline
In-Reply-To: <20250106223526.GA877278@lichtman.org>


--ebxt8B7R8t2H4k9V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2025 at 10:35:26PM +0000, Nir Lichtman wrote:
> +Refer to <Documentation/admin-guide/efi-stub.rst> for general setup guid=
elines on usage of the EFI stub, the following are setup specifics for EFI =
in general on the x86_64 platform.

"... for how to use EFI stub. Below is general EFI setup on x86_64 platform,
regardless of whether using EFI stub or separate bootloader."

> -- Create a VFAT partition on the disk
> -- Copy the following to the VFAT partition:
> +- Create a VFAT partition on the disk with the EFI System flag
> +    You can do this with fdisk with the following commands:
> +    1. g - initialize a GPT partition table
> +    2. n - create a new partition
> +    3. t - change the partition type to "EFI System" (number 1)
> +    4. w - write and save the changes

I see running paragraph instead of numbered list in htmldocs output.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ebxt8B7R8t2H4k9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ33Y5QAKCRD2uYlJVVFO
o507AP9edvNPwE8pEoHJIFqJ1/23zJUucm7EGzwiH5KCkjtC0wEAzWDD0m5rMtgv
uOp8D+0q4bTb/UPQPysraWNQQ/Fuwgg=
=Mvrd
-----END PGP SIGNATURE-----

--ebxt8B7R8t2H4k9V--
