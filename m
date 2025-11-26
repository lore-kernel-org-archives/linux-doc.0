Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D6A30DD39
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764127681; cv=none; b=jkzg/i09QnAMqgrtelPucsuMtk1iajLe7VIci2GRrsgXVvqsghBkbzn7jHQ+C4FcNrW9Kvx8d/FiD9LZXFRZdcKzCKV9AVexLPF7bXfwtuMK9mBohevmHsY4MQ0T5VFttLhznVZZqNN21iAeNuaQw1Lpv3ah7iHNIJBGOHPS1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764127681; c=relaxed/simple;
	bh=8qfzksOJbbTsCAArgtKRpDmbL7H3emUXbpVOCg00fyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y52LqWaUxlX5HSDngkukU44bM1daX76jaeozlA9jMJDloE5yRc9XtrkL37bQzPdMxgkkgESJS3mO22LDmbruVJikRJzLw9YzWG32Td1zE5LRaEsp4IxFUUrdZYzMyv+YiklN5fi67SBT2sZBTHJZhWGGC9QGAzxmzdseM5CpRlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaD6ScxF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaD6ScxF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b9387df58cso9843599b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 19:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764127679; x=1764732479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51lFxwZazAf8fla+gakTIRMJxAjLqhU3wJI76M1NFic=;
        b=VaD6ScxFrp8LqX177cp8V4uvnkz28jm9DTx60wfOLF+6DBTfKAjV1ry5Tiv1X/Ap6v
         797K+rURgSnvAO5ah1Qgnl8zihueUy5HHs5HTRYtEGzFS2zMEYf927le/Wx4Eq2Qp26J
         nQMmVJFLEIX2YwIkgWFas1rmEwfwW+44WXba3hfWt/svnEzDSV9OVEyAcN/ktP3n3zN/
         Usy/hNF4uUEm+ehzE1T31XcoEHNADBJlDs0QtfG+vEajflcLF0CCi0VpeNtlr9Y9FsQR
         il0M4mdviputUnW/qBdBgSNV1NAz60Dz0dXDFtHe2wk8NH7tlcwpk9HpHcUT90djkIp8
         5N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764127679; x=1764732479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51lFxwZazAf8fla+gakTIRMJxAjLqhU3wJI76M1NFic=;
        b=XJEGEHSoboh3Bj47WKyianbZs5E5/iUGMDsZFJjQt5Yv7EcP580QwCsRt6bOu+QR7Y
         tLZvYyCtBICY+EH0tAGrTpBw1LlVbv5AbT+C65zzRmmYngqRgPaDKIiTXAhT+FK6yA7N
         rG5Eay5n/5MYkrgfPNo/7a9qa5USx58fqQ+n+kiHuIX2we3NFtMKn0wewiJUonizwT0y
         OkoTe1mJg/9I81WsFgn0WcxmK6o/OVoR5JR6HMgYh1C8RzckV9z5SW1NU0id3j6O28BY
         KY/U4IHn+WJKW7ZQH6ix55f0Z/mHvrMqC5+XN2tM5s/S4DMQ4tmt3xmea6LGrSrHwpGK
         UIbA==
X-Forwarded-Encrypted: i=1; AJvYcCUSe/rZcf2d7+wItKaLBUeXoUpMryi1KuHI3PcLU6uEvlHXnMi+jnqZlsoByUOw9nbTaf2HQdhlddc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Jv3qkkh6K/v2kA8KeEl2zsRuAZTvxR8sLLXQyLnH5XcGnCWX
	OLPUe9SAohUAOI5cR3w6MkJ0mtNbCUZOZw5k4JXYcS3XB9aOPF6R5d5j
X-Gm-Gg: ASbGnctDhKb3aQ0BCvLX27+CsSe1eLPdhkrjK1oLjKAJhvdh1SZ651lzRE0VqwagPAy
	5dAIfXgPkkXw0Oq2oQINCevU9GYUzpR/R4Oa7yLniD5O0N8MW0TCiZ8bumWkmRdAuI3nBvYwPln
	YJYy/0I3ODmW+SUKERECclmcc3yC0eDEPOhEmuu9et5Thm//PWNlMvI7FBrqW59aK1CQNMvg1j8
	/gwEBoBqKZ1Rs0Jpx8DH3P5wTYzDH7fzQCLUZDSsiSKPRceqXNRd/oMluMVNFqWK2b3MNA87NXm
	AEW67EKbFKwZNGgBIRWyZomGhZopeWsQ9EyedGqjzAN70cqScFqE+w748mLXMK9t87YM9aRCh0m
	/bUStOIyKpYirb3LR/zdiAROyx0SNqoSVWL47+s253OAk6jF9DwpgzG412PgY2U7JqNToCWV+WC
	4/esBSs2IRfHk=
X-Google-Smtp-Source: AGHT+IG9xHzrSQWvZCXHCGOpqvWXyFnbV+8dBSEJrT3vhP/mRsbjw5OciOtuksf2l1kJH+WCP8MtWw==
X-Received: by 2002:a05:6a20:3c8d:b0:35f:84c7:4031 with SMTP id adf61e73a8af0-3637e0d3593mr5748425637.55.1764127679511;
        Tue, 25 Nov 2025 19:27:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471060sm19640415b3a.15.2025.11.25.19.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:27:58 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CBEA845A3F83; Wed, 26 Nov 2025 10:27:56 +0700 (WIB)
Date: Wed, 26 Nov 2025 10:27:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] docs: dmaengine: add explanation for phys field in
 dma_async_tx_descriptor structure
Message-ID: <aSZzvJ4zhEm5jCYd@archie.me>
References: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U9VBp7oVmCj/Mqtc"
Content-Disposition: inline
In-Reply-To: <20251113064937.8735-1-bhanuseshukumar@gmail.com>


--U9VBp7oVmCj/Mqtc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:19:37PM +0530, Bhanu Seshu Kumar Valluri wrote:
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentat=
ion/driver-api/dmaengine/provider.rst
> index 1594598b3..f4ed98f70 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -411,7 +411,7 @@ supported.
>    - This structure can be initialized using the function
>      ``dma_async_tx_descriptor_init``.
> =20
> -  - You'll also need to set two fields in this structure:
> +  - You'll also need to set following fields in this structure:
> =20
>      - flags:
>        TODO: Can it be modified by the driver itself, or
> @@ -421,6 +421,9 @@ supported.
>        that is supposed to push the current transaction descriptor to a
>        pending queue, waiting for issue_pending to be called.
> =20
> +    - phys: Physical address of the descriptor which is used later by
> +      the dma engine to read the descriptor and initiate transfer.
> +
>    - In this structure the function pointer callback_result can be
>      initialized in order for the submitter to be notified that a
>      transaction has completed. In the earlier code the function pointer

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--U9VBp7oVmCj/Mqtc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSZztQAKCRD2uYlJVVFO
o3iXAP9hXC3MnhskzYfaAyFleh+Po17o9hELn1Mf7RwHDBrknQD+LKtDpNOsLJVe
M+AIvBjSO5AFnmkh3L8D5e+INwmlcQA=
=XV4N
-----END PGP SIGNATURE-----

--U9VBp7oVmCj/Mqtc--
