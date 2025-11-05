Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E49F50F
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 23:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762385560; cv=none; b=n/wlL+ltcY9R1cJtL8gCIiLNyPRJMUClyCEOixY0GFyir1nlDAFgQ65XgZ7fzm9ZwtX8uGOZdpw6mKqg8s3+dmFYwd9jGZoeoTRwNKHBe0g1mJadh59wAumoWO4H1Og+Sm4rAeZpzXnWkXQejNJLDKj2679tjmS5UdAuIs0mABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762385560; c=relaxed/simple;
	bh=vnTm+ozSRZaCK9bpPSSeJvTXgMs06nW1kYwVBeO3ndE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYocUDVBDd9AxUN2kexkLaE2Fj74S2sgGRzpbjm/ry49my/hyMJFRRTiHp4aG3XD57vit8MFMbkX9FfFX4OmMh6Ml29czVH5pXyfrNlcUOVf2puzmvaJyHFwRtheNXk4k0E3R82Cl5Aub3Oc+V86ePW61wNGS3VB7YpNhmScj/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWw1J20y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWw1J20y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-295548467c7so3987105ad.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 15:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762385558; x=1762990358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vnTm+ozSRZaCK9bpPSSeJvTXgMs06nW1kYwVBeO3ndE=;
        b=FWw1J20yRloskHdSuQWug5keqgd/8WSM/HclUUIknagWX4nXL+HnS9SzgtDPAhTiTA
         MfxUQoE4wh3xS/TZGb/eMkxvuzI9RMOR23MLwdJgevFkv6obOvbUnA/JgX5FTgOTqOVH
         B4ULf/UgKoE5kbXlQ/y9io0kOwJI+ZFhohcY9mdc2lNwY37Y0Z6rbimuOQCnGKlwhuYA
         TgEDHAxCR4AcFprtUMwUAf46Lm2Y02V8K32mpfXIcfVhfmQHSgpzRnxOmhXIBCLjvi6L
         ppQOj80IDomIQiZ2dQvGHJ+MgoL84yuFJOvGmIxY7czD0Fa19/p4z5Usms35sBGNcX0j
         berw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762385558; x=1762990358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnTm+ozSRZaCK9bpPSSeJvTXgMs06nW1kYwVBeO3ndE=;
        b=ioc/AYg7sg95ySF0CV2tdHH5rMaDlmIpt+UQki3YshWSQRlBCa5YFxqNyelWdzjnbV
         nlAyWBrnl9yPYE5Dd8jCnI4JZV72TgVbQGcao5NiZHwi+J5pEqjVrjlMYf4CFFIRN3l1
         VpaLVI1OsOfr/tWqmEvE5JI4ZtN9Gi4cHLZ7yft9cWGHqXUKd4DX3SarrOcc5eKO3gLW
         yAYYXSBVi5/nJ41CN9sRxBkbG1LdQ+5NHJeQrhe3fIhE/OBUN7JGOR0LhUFoJPYzs9k3
         ob0p4UaFpoqtKxqC9e51iwClzVFh3lm2vyZXtClIbNwx0QW0/+ceIQwsPKz4xXdx1IUV
         DTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsmsAH2BqJ1TF2ixOiXJKtBcCeoAg3psAuRcr++dmMSEzZKj091tRIz7m+Q+rLxOWcIHnL79lH9Ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YymaMiRIVHrW+CAb2rphT0VLuWX4pBmVmivN72MYGmddbPIThDK
	I/bRwELc4QbMA8MMOV2ynkteRnwDvuTWQDRgZcTQWPVcYicBHkXUt8orBAFnBYBh9ZY=
X-Gm-Gg: ASbGncsvZfYteRXaJ60JOCMzzCvX82qVAiCz2nPWHVygNeP8GYQqi1DvaebcPnX8Yct
	x+M0vLRCJzbkIDcZ2LwFV16d5HLEozMwLB8ynCBK+OIjiuHbiNZ0D1hjS2vJ/G54pBrY26xpvvp
	zgFlsLnQbwXqgoG8OeiP6WLT16LEz/dsGQYbOm8VPqbSrRZyCinVl/TS/PD4jUvQvP7SctHIygR
	BFdpMXm/0lBXUgXtanGedTK0hpWwYQACq7WXu3vzQFoMMGXNcnzE2ObJgFtTjjjQgHJph0pCB/F
	qVwXuAE0MCEhNTZxfmc6vDV1lD8zpI4RM/nP+YkpKLoR3lkrqH+acXC14Kw07AlAWK+be/EnPf5
	pot9yinss3YlEhTXeIyAaAhZhM4Y+da8Yn+lf+23OWLJs8Juiu+BKv4wZ2kGGIbJ8IZ+9kTxP5T
	CBKC/THsmg9F4=
X-Google-Smtp-Source: AGHT+IEhPmuR4erigmmxR9eFUPzgSmw6sxAsUVA7h4flt4tHbzQCGMOXFc5w95RmdKQlTP3Q4hRRPA==
X-Received: by 2002:a17:902:d4c7:b0:292:fe19:8896 with SMTP id d9443c01a7336-2962add623emr67834225ad.52.1762385558111;
        Wed, 05 Nov 2025 15:32:38 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c7c5ccsm6499405ad.57.2025.11.05.15.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:32:37 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id DC583420A685; Thu, 06 Nov 2025 06:32:29 +0700 (WIB)
Date: Thu, 6 Nov 2025 06:32:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dmitry Skorodumov <skorodumov.dmitry@huawei.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andrey.bokhanko@huawei.com, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [PATCH net-next 01/14] ipvlan: Preparation to support mac-nat
Message-ID: <aQvejbf52_GDs9vn@archie.me>
References: <20251105161450.1730216-1-skorodumov.dmitry@huawei.com>
 <20251105161450.1730216-2-skorodumov.dmitry@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aE3/3REKYeQ2PROd"
Content-Disposition: inline
In-Reply-To: <20251105161450.1730216-2-skorodumov.dmitry@huawei.com>


--aE3/3REKYeQ2PROd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2025 at 07:14:37PM +0300, Dmitry Skorodumov wrote:
> +4.4 L2_MACNAT mode:
> +-------------

Please match section underline length to the heading text.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--aE3/3REKYeQ2PROd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQvejQAKCRD2uYlJVVFO
owVcAQDm0PZzhhqLqUC27UoEFbWfodx6ifxImkkq/tQWbG9OwQD/XNmP5oJqoktv
FtqxdYVTu3c9wN0sp329mXF1ZLKppAk=
=OcFx
-----END PGP SIGNATURE-----

--aE3/3REKYeQ2PROd--
