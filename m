Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A273F9FB
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 00:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761869550; cv=none; b=C2MgZ7P/4CKroiD7s0M3OwqzVpjXdi7iEjbrn6SomRprrtjcE+SyaR8SGERPj+4SLGjNSM6X5Alv2NDkivyHvD8lJzUIL0sHrOHvhKf6mTDpGRslEPLhEpbgB8hnZndzOIrRLGEgDV3ehxHx5zQtJvR8fougogwUxeRgVXx9qWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761869550; c=relaxed/simple;
	bh=OYK7bpF90lUBkVSRihAcXGkmo5r7+CiEUhECu7W7zAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvlPUZkr+0FJjg7bICWaTXueWNpb2L9zofD0SB3L4pQ1h3DACJNNAY3PIw1a/8HjanJ1RXUvG8V5/Jlmhi8KmAhfZP0pu27y+KwLLkpsrxxqzf3mu6DUJBk9TmccNcXexePmMcZ6IBbMKUA71DaVVZBF9HA7q2w3Y9QLVZzx27o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L636SIob; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L636SIob"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781997d195aso1217293b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 17:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761869549; x=1762474349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OYK7bpF90lUBkVSRihAcXGkmo5r7+CiEUhECu7W7zAk=;
        b=L636SIobdL2UixK1IuXhxEmq7xtobqXFvSWEFpLDY3aC+0duRTEf+QCaZoglEVPVAZ
         j2qvkc3vZVuLnhAVSZLUKiF5I+q0l+NmrhnzDWfesXwPo8oW2b5vI9WVhBqjpSqTJxxf
         qDYFBGt50p6coNPWg2Q8XfMFxRbmaLnqmR945FRjHSMrFD8pei5nXomNhdPz2p0UaIvl
         4icEKdboffpA5g9G4fezmBCbybU2gkVUKxDAcd0wME393v/kcRyOr2gl5Hnrtbwy1Q/P
         e5+MMrscHOuTkxj79t6VjKMD5bPHJQfrfTCS+eEstcxVQSUZ+k0QNEoem/Afudf4TG2x
         A/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761869549; x=1762474349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYK7bpF90lUBkVSRihAcXGkmo5r7+CiEUhECu7W7zAk=;
        b=P+ngUFuo8f3/y9VLk1k/SUoJ1G0j9KPETNWapJVrE98F9byJWk5HcEKr6sk40kSsED
         Ye1zWuPwgPTnGYsHXxk0OGB3Drf/hy9qIsYj4HTsADArpHA62JGGWk6REknfrUn4UUPF
         hnJDKIuOr/1LPjxuwff3MstV3PX9Aes3JEnOsNPnnAC4xseYZ9pzfazwwW19lkmWgNxq
         joGGvs9Vyv5ZPcnnUdIVWfH/h+9T1IUlZVjf7UQqgFxulDwQkBkWagad8TozPCD7PiW6
         87sfp0GDNkpZuSF6dS8QH7C3fifCQOnp90VozkKgrl+O4u3iWGBOwN5doxCd/bc4f0hv
         /KKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaCn2MWpQZn17PLJFj5HscIZILZLEQAuWbxkrDtZ310EWzockEB5D6AJBJKI0/upG2ulXUQwJeXu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xLYf5EgNCK8sam2Botegvf2ZcpGSX7x+CoKtjZzcGoQqI7xK
	eFh156bqnQRVCs1FJI8Ea/jOlKIFbCuj3pRHKE6K7WHBdwVCjIoxTg/y
X-Gm-Gg: ASbGncs7rNujxjrFXJXY/FV/abP3ZILex9KxfQrlpgGaRZ9i8x0mhF2xxUxsnS0ffKO
	7ATED1wz/Nuvf9/S42aRotqV6qHrXdujkeFQBGdCcJo8iC3xx782OvgMQDz27+0KVglUw5ZRc20
	emniGYM7Y5jGjuNBcaKNye1Fxy+oA3fQZ0d7bXUYjrYC1g1HC0/PeIya2o+1TnL2O9cE4Jy88Rs
	k5oZzqF5nl8rAB5B5fybmcl161+dtdyjDLMWoGYwGy4bdm+4rZ/Dpuxjt3q/5OIBShs98SBEWCT
	Mjgh7UhVPSQMPdeks9/xAiHkzClRm602ociTnBE0owqMlcr7JEc9IdY3aWJlhbpuj+PUmdG0O4n
	xpZx6uYvOilVqO84b5lURYd6JfsplRPGfTjKuGHOodPXlybpmc56ensNuLDhqri+TFcKUO1ueCl
	DYnFeBGHz95KQ=
X-Google-Smtp-Source: AGHT+IELexDJlzNWfGl/5+vJtbg1Bsn4ue6Mg8eRWqqle2QVF1oB4UwzGk4VnwtZwT73neTtyqbuCg==
X-Received: by 2002:a05:6a00:4f88:b0:77f:50df:df31 with SMTP id d2e1a72fcca58-7a778fdf48emr1109262b3a.20.1761869548554;
        Thu, 30 Oct 2025 17:12:28 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db86f0fesm52953b3a.60.2025.10.30.17.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 17:12:27 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3242D4209E4A; Fri, 31 Oct 2025 07:12:25 +0700 (WIB)
Date: Fri, 31 Oct 2025 07:12:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH net-next 6/6] MAINTAINERS: Add entry for XFRM
 documentation
Message-ID: <aQP-6eQdFIN1wjNe@archie.me>
References: <20251029082615.39518-1-bagasdotme@gmail.com>
 <20251029082615.39518-7-bagasdotme@gmail.com>
 <aQMd886miv39BEPC@secunet.com>
 <20251030084158.61455ddc@kernel.org>
 <20251030084412.5f4dc096@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gb1uviwcsJe1v/2q"
Content-Disposition: inline
In-Reply-To: <20251030084412.5f4dc096@kernel.org>


--gb1uviwcsJe1v/2q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 08:44:12AM -0700, Jakub Kicinski wrote:
> I take back the "Awaiting Upstream" part. This set conflicts with=20
> the big ToC tree reorg patch. Let's either merge this into net-next=20
> or wait for trees to re-sync?

You mean this one [1]? If so, I'm happy for this series to go first then
I can respin the toctree patch.

Thanks.

[1]: https://lore.kernel.org/linux-doc/20251028113923.41932-2-bagasdotme@gm=
ail.com/

--=20
An old man doll... just what I always wanted! - Clara

--gb1uviwcsJe1v/2q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQP+6AAKCRD2uYlJVVFO
o3uiAQCn2eApnNdhBoCFHbk7RH6C5AfjOnHJrOx3QrAwPi2Y0gD+JoziL/V8KP3c
BLsmoE9RWhrc7eMxcBlNU7LoiJxtaws=
=oq6K
-----END PGP SIGNATURE-----

--gb1uviwcsJe1v/2q--
