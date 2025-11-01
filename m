Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBED34D3B1
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 23:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762041298; cv=none; b=SBfYhnpQ6ip1JhreDe1p+NUrze/Vh2aipGgozFaCLtc5ArRtqzHQAoneAfgzjyZoABOEMesnei4C2S1pVA6wkRnuRhncCL/HHg83N00V3lI9CY7s8w+dPykC3kSS51B4SnL7uHaNGPgLlkR/QKrbqvyCMRVPifNsT4LNB5HslVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762041298; c=relaxed/simple;
	bh=xgmMHnJE9nyGfUW7qSuFmTJU4ryqeC0sODpQqSngQZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=od/p+bqMgHpR78riS8tdxloUzFIEGk4snraxO8r3ujQymQ6jqwkR8kUZ2o/oy1PXXqtA3vDyz3jSSYXBJF+F19sxImmKZlEn2TX9hgYBNzrl2CEEQMPrSYUxFsluMZVWR0ZLTCGf8coBVMVwFfkfbuMqP4jRWA7f+aS8OGWjgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwmTRJ66; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwmTRJ66"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso319315b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 01 Nov 2025 16:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762041296; x=1762646096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9hoCdewjF0s6SpozCA1ZdHeew40UYH9BAWlJjuRVuo=;
        b=XwmTRJ66PHIEe2k93n9txEt/hqE1bOCWPIXu6Pku9UaL2oGlL4S9+Oie67ou6aiPBn
         j2f5eKPvr4HfFrPzK+qRObLPZY1oTSxlrEwkHbTSN/BUp+CxbIAG/WTb2Xk+ZcLNhI5e
         b1v5OrRbAJ5YZarCuhA+lSLxluFnTP5wHL4VyrmWiJADVOdHqEbftdhRFCnRGVWEvm+V
         5BK2fF/+F3bJHe4zDDcfLSmXSgWTu4OIkLL0hjhP73HGLSgpxhzQ2Lngcg79Y18RgbAy
         nQ1Bi5A9+1LRXGn6T1QjBoFdSxlLqqnHRR+aAuk0hwx2vEldR5qQRsHyzIim4Zk7l4R6
         XTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762041296; x=1762646096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9hoCdewjF0s6SpozCA1ZdHeew40UYH9BAWlJjuRVuo=;
        b=H5gmdlwVwDja87j47afxRHdGP8ueRx3PJwFfv2+lXPj39fO48wl+wZHErlW82pFuC4
         0HzA1ALiu2MgkKJY5ia58V2TB3vF3YdBrzotWZxOrN5lBQ5AcPedTXpx8rF7PCP49tbI
         0A15q1MRmmRbgoUGDh/J+pnCYivAVc5sxv9Mf+K3/zlNaNpT/4xPnHnuQBLkdWDIjDiH
         CMG5B0Wt/F0+ijjgYj6H3xIEc3JKNHwz3U1SeA21k0GTeUUAmhhrHv9+JK4vCAVPqGOB
         VqNco/sHxEVjCPX+MMr3IUAjWHnzeJDvELW1zUlMNVFjyVN9RrPXPmgW3xrwXrfrAMJW
         N0+A==
X-Forwarded-Encrypted: i=1; AJvYcCVqNuRo9UIdg1NuB70qQPkXNZeF1zIP+3T/OAMv49V2vWMN9m9VBc3Jsgc0b2peO4ww9anVGtVmDPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb/HUaWwvdPOZ/XhtiOIGCb4XHfpuNioKB+rCpJvdWCM0+Z4vp
	Em8wo1nPYz2Jy7ERD3lhGY8UXqzwIP3Wej/0iDdFNL16DmtUGK0WeH2x
X-Gm-Gg: ASbGncuRwqD/VNZKY0YnOmTgfqg0ymCfCe2BXFQUXJL6euH17vBEYsGjsezUZAolNAy
	2mP2ZhNEVBLlGT1kqRtSlawK+UC0bitJ9IoN23jRJUSWP6lXDOn2vn2M0yG0WoNZEEuKLdTNsdA
	VyHDcKYejggQRs1LP3C58D0rt3ywS60fmbfnBssdVOwRbt/9AQ6HbjmMmbRUhDTvob1hQj9fA4V
	DNE3jB+c9ul0JBzojSVE1nE8+bAzeRLn9Nbd1l8OgP0Q7OmUI+oaDCmgxfIfLqnuu2Eg30HJaIa
	ybMTfDmyj5DMsIQsilhlEe5exhFkqNxug30VB7bwk2Bm85NM8GbuTRq0Cjh1dF3iCt4UkngHcrx
	huz5wjiLp0yer4oI2o8YoiTxMLWVAGWsG1H6FrrIQEHnHytI1MgOKUDHaFqa67+P0d98oJRvXo2
	yx+keTuYJQNtM=
X-Google-Smtp-Source: AGHT+IETQALuNkc50yjdgSemgMAnaSbNIMYW/a7SYG7aVvrdjhVmCDIYPsGxrnhq1+Mmjh/q9Xu3WA==
X-Received: by 2002:a05:6a00:4f90:b0:7a7:2a:2ec9 with SMTP id d2e1a72fcca58-7a7790db385mr9055615b3a.23.1762041296277;
        Sat, 01 Nov 2025 16:54:56 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aa20972e6csm589226b3a.18.2025.11.01.16.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 16:54:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 773904206924; Sun, 02 Nov 2025 06:54:52 +0700 (WIB)
Date: Sun, 2 Nov 2025 06:54:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH net-next v2 0/8] xfrm docs update
Message-ID: <aQadzN8IvCUWWHsF@archie.me>
References: <20251101094744.46932-1-bagasdotme@gmail.com>
 <c3ee9b5d-62f4-4c7f-b6a4-9e0dd8290edc@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EQI/Pwj3uM/nLbG9"
Content-Disposition: inline
In-Reply-To: <c3ee9b5d-62f4-4c7f-b6a4-9e0dd8290edc@infradead.org>


--EQI/Pwj3uM/nLbG9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 01, 2025 at 11:58:37AM -0700, Randy Dunlap wrote:
>=20
>=20
> On 11/1/25 2:47 AM, Bagas Sanjaya wrote:
> > Hi,
> >=20
> > Here are xfrm documentation patches. Patches [1-6/8] are formatting pol=
ishing;
> > [7/8] groups the docs and [8/8] adds MAINTAINERS entries for them.
> >=20
> > Enjoy!
> >=20
> > Changes since v1 [1]:
> >=20
> >   - Also polish xfrm_sync section headings (Randy)
> >   - Apply review trailers (Randy)
>=20
> Changes all look good. However, there is still one header that ends
> with ':'. Not sure it is worth fixing.
>=20
> XFRM Syscall
>   /proc/sys/net/core/xfrm_* Variables:
>=20

I'll also fix it in v3.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--EQI/Pwj3uM/nLbG9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQadwgAKCRD2uYlJVVFO
o6m6AP9q613RsOkDQM3bSTu3sb/4AXQrQAJW65J31kF1tRUVVAD+Mh0OQatN1NSk
Gu0DwhO1Oi833StX4eC1TLlq00RClgk=
=3dB/
-----END PGP SIGNATURE-----

--EQI/Pwj3uM/nLbG9--
