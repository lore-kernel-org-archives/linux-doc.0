Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94619CCF5
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740643552; cv=none; b=G7e4OLbHTvihYW2RdYXQjRSRypgSy070FKTIzel0NZj0JoEUndDzqdAs4IpvDpjbFnHnoZ6szV1Xvj6EuKA0Ov02+lgBjWYmT/t4ylzESaAd7ux+EzSKL8vTN6qUEJ9eoTnRBZkWDadkprwSCF2dnkyBZ8dElXR4RJsWjTFzIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740643552; c=relaxed/simple;
	bh=VIoFTx+U6F+5OaVugrsB0/QX6Wfu2eDdtKC7ZARhDXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIz0deVnrky9Eyz5djazP4pc33zp3/DXJap2vMURBMAlzdTqLro8aVtj1nBNmemuhO3Yaq4Xm+q35EkWZ4yepU2Z7hN7pk2rtAVpBoM9/0Mh0huDEXioD5k8ilapseM7lOqM5O9LkHuxdHHNgnJ91uPnpkQcubumZNGyLRYxp+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSIDoBwx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSIDoBwx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22359001f1aso4247335ad.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 00:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740643550; x=1741248350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIoFTx+U6F+5OaVugrsB0/QX6Wfu2eDdtKC7ZARhDXw=;
        b=iSIDoBwxn85nGQyDtGlSuzt0hJMagWBz52RLRu0QmEmD5uwDw/8V/lmDHzgRXfOj3U
         saWgpWTCT88H2Db2zZyfkexxShq1J1UCufuD/PddNgj6eZkhdjlp4cI9J/hzC0h9JWqp
         67l37gW5Zj/0A7fQh2jBTinNER2T5kgIUxAEnXHNFTLl/FBWiBNzvsJ1ZoLheSLObrv4
         alYTCUJPrPQ/E7jvwsFH9Lu+0PVFFGu7qUTGJ52oVI8ABxeuhrebcpy0bHE2ghrUJTXW
         MOa7TNq4KShzj7gv8eqKyKZRWZC1plDdLwYdW1ThIYGIcb+8GIsqaHT48WuCvvwMlWuo
         IqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643550; x=1741248350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIoFTx+U6F+5OaVugrsB0/QX6Wfu2eDdtKC7ZARhDXw=;
        b=OgdmVzzOdxRXHOSrYCCAfLVAQnN3VzFX4K93p3qB4gTLPZs4YmV2NKER+FiL8dpxW9
         h2pKiwqmlj7pr1ExRb7iLMyhVYnN1qfpRWdTR/X7UH6FdQlHkIw5EZjPEfpDiqQu/kxR
         Q0Nikr9JZIMl6J/k9r38vpxLPdyPGUMO0VyyZIyiAAK2DOxpq0Sp/XUlc71+nRaPft3a
         Ka+oVtw8q3N7DafPKu1iFM+rVZ2ZA/j6WupGTvtzFE5jisu0QUUn4ljlmqmkue0xGTCT
         SEnO1XsvI7BKQs/ckIoF9UTxiKBHTmXXd3MxM2xJocdcfPlc2IeljYzCuaIizA+D85EP
         rFSg==
X-Forwarded-Encrypted: i=1; AJvYcCVQvG/+bz0JK1lSudH5Ct93apA7l/qhCQBBL5fU3GQ7WPFlO9XE6Cg/hXrMZbtwN/1epcjKHOyyOUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJToy7Oafl4eFShw3nRSzfyJRNH/sfNKoAk9YGQ4u/YddyIJCL
	J+Qm7mwP74oriu3WUVFqB15z79gNwuGBtsTAyD62qu6MEAA54QaK2EQzxA==
X-Gm-Gg: ASbGncuR6HCzAOeV/qBx2QgSjNUg8L5lC1o/VeSjYEH5xXFSxq2mrrt9hO99qxsog2F
	0+gsYe30Pw9dWV1Pnw5YbBSIamXv/Vvo7MKlkhmBS9bLMC9uu2Jkx83zU9UCaTurOXpYfZHb2m1
	IWU8xG05ZogmlNw6cugdzhcjj10jKsNt0LfV2HCwl08Qje3+ccxlQbrYGeJmuxfpZQRmZNsrtdR
	dSTctAn/4TBcLwLT7OpiwNsVjIkVMQtgPH6ObOktFwkePAgxnCnjtKll8c21Vpf5uxpoMCZrMAv
	BRcqHUjyB/Txwu3LJXNv/IFW9A==
X-Google-Smtp-Source: AGHT+IGAgjnruTPJPlfpofXPpAz3eQO4tYuYC5DuXzU/GwgG8fkwrXBJL8KRoTbwwwrV5Oe+Yt2z7g==
X-Received: by 2002:a05:6a20:914f:b0:1ee:db80:77b2 with SMTP id adf61e73a8af0-1eef52da0acmr42956427637.12.1740643550325;
        Thu, 27 Feb 2025 00:05:50 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19c14sm774811a12.20.2025.02.27.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:05:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 9C79B41296D8; Thu, 27 Feb 2025 15:05:47 +0700 (WIB)
Date: Thu, 27 Feb 2025 15:05:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jelle van der Waa <jvanderw@redhat.com>, linux-doc@vger.kernel.org
Cc: Jelle van der Waa <jvanderwaa@redhat.com>
Subject: Re: [v2 0/1] reproducible sphinx docs
Message-ID: <Z8Ac29_ZzwAadhZR@archie.me>
References: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
 <20250226203516.334067-1-jvanderw@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9FTdBtcCrSCELMFU"
Content-Disposition: inline
In-Reply-To: <20250226203516.334067-1-jvanderw@redhat.com>


--9FTdBtcCrSCELMFU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 09:34:50PM +0100, Jelle van der Waa wrote:
> From: Jelle van der Waa <jvanderwaa@redhat.com>
>=20
> James Addison brought up this patch regarding reproducible kernel
> documentation and I volunteered to re-send it as they have issues
> setting up a MTA.

Thank you for forwarding the patch! I might have to send my own version
otherwise.

--=20
An old man doll... just what I always wanted! - Clara

--9FTdBtcCrSCELMFU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ8Ac2wAKCRD2uYlJVVFO
o51AAP42k8Yl09ZQi/2d2poMKbwYiTvq5zArBQtj7g3lncHnkgEApTXOY99J+g7N
OX26UbBKnFxY09sM9DW1djH/sFHixAQ=
=wqQq
-----END PGP SIGNATURE-----

--9FTdBtcCrSCELMFU--
