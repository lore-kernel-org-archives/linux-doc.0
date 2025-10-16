Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC82D46D6
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611267; cv=none; b=djUL6KBv1IXoJKwJ/hAcn7urRC3Ijr+70TIVz7EBGCCyORczu+Vx+I2LKEAhs60H6GIdUyiM6mhoSK5ObPOaHHOAcHwRnkz8C/xu65NpVZoopoCIOX08K0YF8IxcJqDvjOGR9ZM45+utjD3tnkrLvYkJNHHi6gqdTVndw4IXbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611267; c=relaxed/simple;
	bh=jnT7eA0MwQzti6UldYfk9G+OiPEhUoWsNhvVPZmZfYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=All66bmRT7hk8SbpqRgO9R7OAoyLAWKEFu+yHLRn/HiWqDCoBzXW35wh2featCLqKzJYktuznKBpHt7Ysta1ByGproYwKdlc4VmmFbkd4oSmha9SeJxmG+4ceRaYct+dmOzJCCTAg7c6AUtzVhiw4el6FYXG6Z/36fHKtTbKKYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTTCzsA+; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTTCzsA+"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b554bb615dcso397753a12.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760611265; x=1761216065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVSu3v5hQ+mkImsLsDrLueW7tnWFr04YL/mKk3BRmmc=;
        b=RTTCzsA+54gYQ/CBNkEZDIsr2RZxIy+QRMua7OKLRo4utBmX8lVmaq0KQpPPYJyBxM
         X2BAAMrzv5QxaKsU6CICIkwcS25qTWGP7k1VbIEhqk2bU4D7n19ZJF6kw2hXs1SXFjmo
         jBgADgKCftajWdT1hxU8aIV3XY2GHfaUoIdEfXJ/2smuBLIe0ionWm6IviTzNmzQ4Z/5
         dgbyvI8LMupeP244ALuLcRcmUOpQMElQQof/3y7JKzlqhl9X8GVhX/e2wb3hNHnKi+Ma
         iUKWTUUcX2RNUyeQWZ7nFE9TBJbDAaUWX+cD9tgQFt729qMtCk8CzdYasW5Bfed25tYj
         r1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760611265; x=1761216065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVSu3v5hQ+mkImsLsDrLueW7tnWFr04YL/mKk3BRmmc=;
        b=nmdqsmdsIA9Uhx7pjZKHQuJZqeuxAiPS96dPwzdpNC8bxG7GMyfwTAFh60VFFPAMMZ
         bWrRwXI709Txb7RbjceXijFuj73NDjS2YyucXnXu/2lm4rSNeIQqJPMT51PvLzJNJ3Sh
         21V9QVs2QxbRi7WZEoRoaPcUuarWPr5gJpgTLF8s71dRxG2HgUNvf45GjGimVJqZvBUR
         K/FyeWt5xWR5X5MriH1muj+NIXvI3T4w42C9X8wdYM8bSl8KSaWST8aQIrEi88Rrfjim
         sKvSSOOgbw+W9HwwZEsye4QSefdpjZjoWptKwnJ5q02pN9G12N9FJp8QdsneF8XWkedg
         3Dsw==
X-Forwarded-Encrypted: i=1; AJvYcCUTxpnkSu3+spDgT8VJGmsO19aG9htrcTQCeeFFVc+//D4HKiU06pLR0Smvj4uHY2Ksnrr0i/mB+tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6dAOsbf64Us4CzDWlGX3idPlYBj43HNwKxwD7d8R23d4ZHub
	nkxLSvZQotIgFA69oZ1hkrpvHhYcAnBy1eD6UBMRWSHXcN3jk7MrWpfH
X-Gm-Gg: ASbGnctnTxvnpArU7Z40pUBjgrO5HgXGe28cWxf2MqpwbYLwJ1Hj09/5pKh4f6Y2iiU
	11RDVv1qtcPqQ8+YHFIYaRCAxT8xNoOB+wr4DVZ56m4XdCECWgU/mULxN/ScQ4vm0VKCC+m1L2B
	DwJsGXe8/CnzDScITlhhKxsXyYJ43Sxkkb5DwI+Pe2sz0w2e6VVERt0PvILlKpADE7zg7q7oo/Z
	i6DSD7OHCRorNt6ybri++BXOnx3jkYXxs9CqUKOFuun//bao40y7vRIJcouaWWbnMHs5mtUrqOn
	bZIUA3dFEm8Q7x18i/ZwI/ymfRET2ZU+VgGbO3WbFWnZ0p2gbIY6mydCboiHyLuwgCT6HVjJb3k
	PTY1Yo+RmC6gNCFMp9pdSOkJVq45pXmx7Fy/ompFDjuXPf5WD8U9CmPESetDq7xQp3yK+7gBTUV
	xB9Al2vKOKnahWxQ==
X-Google-Smtp-Source: AGHT+IE1H0Qo6arbd/0sw3nK8Wog5439Kuk67M2dNIEm8atK9BLJ3NAIUD/arp5nW0PclXPHJb8yBA==
X-Received: by 2002:a17:902:ecce:b0:271:b6b3:71ef with SMTP id d9443c01a7336-290273737a0mr409664895ad.43.1760611265161;
        Thu, 16 Oct 2025 03:41:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099385d9esm25928775ad.45.2025.10.16.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:41:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 02548400365D; Thu, 16 Oct 2025 17:41:01 +0700 (WIB)
Date: Thu, 16 Oct 2025 17:41:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
Message-ID: <aPDLvQaZX7M5D1tv@archie.me>
References: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldeZ5wTTs5GzBIeN"
Content-Disposition: inline
In-Reply-To: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>


--ldeZ5wTTs5GzBIeN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 02:09:12AM +0000, Kriish Sharma wrote:
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index a0979440d2a4..c0035dc257e0 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -26,6 +26,7 @@ following heaps:
>     ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
>     created following legacy naming conventions; the legacy name might be
>     ``reserved``, ``linux,cma``, or ``default-pool``.
> +
>  Naming Convention
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--ldeZ5wTTs5GzBIeN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPDLvQAKCRD2uYlJVVFO
o9hmAQDFQdWAy7dyIyVP0SLEEl2pGTkPA49V3t68gWb/RcemuAD9EEE+wGcnfP5g
y0D3QS10Sw9x4aNHuLSknmnEamh0YAg=
=ADLh
-----END PGP SIGNATURE-----

--ldeZ5wTTs5GzBIeN--
