Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD63563FB
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470192; cv=none; b=UIbXwS4TjI70PJJQUKf9rE8r+WCzL5eAj5x0Q3JU0gGgf+Rns2ILWcw7Cc3cmC7yuXCeuHlp66uR22adfHRuGFhgpdofOI0rk2z1yRFp4ZbJ3XrQcAS+9tD7D72n8jwLQOIBM8xg6vGCX9T0txlfqx9vo9z6qbfHDZ4neHvknzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470192; c=relaxed/simple;
	bh=Et4GhLl62bOjjisY9hr1BfuzRFHFmkFTHndY8y5ixiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maDy9VmDR4xHM7uNF4G6JqJz1ymRtYMc+8GpF8UOH+hjsLyUjQctqjDfNhW77dMtwoAstrvFI0sjNKXypLHI950uxjkPK8Nlw7ZpaFAcK5g7pUf0tOqjsrVKdabl8MAqZIIC2/qRUrd64YKYl72Tx7hDt9yXqZJTxDHOCNFazNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5RnPI8u; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5RnPI8u"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a110548cdeso5246875ad.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 01:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768470190; x=1769074990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B19av4mnc7kdrNvIhq0YapiMCGFD/iRqYZzIDvYo9Qc=;
        b=i5RnPI8u1yxxl0YS05M92MJAuHesHoBi99dxyJkkEnBb4v4UqO2YbwDWCS6IyXKi4d
         nz0eqxKZeW0VSc3LrSL+1rZerXYMW6jSIdj6+jSkf+LFMZ493KYy/ryfHRQi6lF22Dhw
         0khbMB7ANAMeDrdsXJfXfjStR2UeCTOkxvTRxACMioxdo47AOhBMQh4jBd7LHAqWWcQj
         uLJ7HNVpTVJxD1NhGaEihEG/39Yu+wDsSobH+7jpBeWrmNm/oBM/2976PDuaG6Je1KE7
         Kn9dtP9Vi9Ji7OMRskxj3QO5VntXNF3KD+7zN/ni4TiZicNzxxW/cInUQaJcsaMMiUS1
         nx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470190; x=1769074990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B19av4mnc7kdrNvIhq0YapiMCGFD/iRqYZzIDvYo9Qc=;
        b=cnnmHKqP0bkGIFb/LIpjMxQeI2fUddWZEgQVQSnvfHUxwGC8p77AsjHQ/ZLifAHGWw
         vQGPaltKQDgUXlBNrgN5xLmupg60Eu4qd8z81+Ff3WhONpinFm91v5lzNpAflqfZJEXl
         Lxt3p38j3Hqiw43RE6KuiWSTcliQZ0LtC+UxYFrGJByuLpsdkqyyx9SdE1hc829oLrFQ
         Gt19r41oVZ4an7rNDoQHxBdD7YZLXsRB66UnLQxCzUCZUpbIznnKd0DRy/cwkaF3r+Qs
         hv/UQM3yAhltEYqWx9svdfBQ6gWQGQIOHsyYvwRWy2l1w7i82wWqcVsCeQlNhd/cwelk
         C6mA==
X-Forwarded-Encrypted: i=1; AJvYcCW74ALmmvJzjqByT2Swdzv37rQ3yU63UFp3vRCamxykU0jyE7AX4Igb9Rd0HpVvX46pOAGIYwp+bzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn21px3A6BhJDcNtYMdkdVz3Atq0Cnzc2op2b164elWxrnO2as
	xb9ELwTaWgqd9yswoo1I45nA29Gt8rwGGs1Z2j3Hs0dY2pFWAzRIoGlu
X-Gm-Gg: AY/fxX45QceLlF30V/MRjY0Ztf+WWLVOgAqQtCL2gr31AkZ7M/RkgtXUzD8yEcBmqlC
	vXqp7aZP0/dPa/WAiyNkHnqr4ID/ePao5KPFYNMf94w5VvBGVTHH9ahRhJGNA63kGPo8f9WypFg
	1PevCjQE4KqOxtZBg1YGQFwSYIscISV02MaT5MBTw0T4We2yeUlqthgC76k2AKHBdIxAnrRE6/L
	o4mdtGfCIJHyH2d5ySwSN9QlXxu1PqoJcns9OK7tSoVGf+MKASwuUqRAzZpkU1XBpIiwqhH+9nB
	JF9LbMo2qwGPB0CgYQPyVDnL/iz7oI+r/zalDB7R3kObaEir3A/8e6jSQpVtA2r5vUtmP9uYMUT
	Hsum1IFkCM6GrAUYlmslyJu+LcZMI/CA9/+bTzPbUnorBAbxk5OQi35gyHc9BwtsPUlQOHXJ1zS
	iwzIEjxaw=
X-Received: by 2002:a17:903:2ac5:b0:295:9b3a:16b7 with SMTP id d9443c01a7336-2a599da7559mr54911245ad.4.1768470190032;
        Thu, 15 Jan 2026 01:43:10 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a311sm252533015ad.19.2026.01.15.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:43:08 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C44E54114B0F; Thu, 15 Jan 2026 16:43:04 +0700 (WIB)
Date: Thu, 15 Jan 2026 16:43:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Daniel Tang <danielzgtg.opensource@gmail.com>,
	linux-doc@vger.kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 RESEND] Documentation/protection-keys: Mark as
 available on AMD
Message-ID: <aWi2qBOg8ApOzbW-@archie.me>
References: <3647894.L58v44csPz@daniel-desktop3>
 <20251119215038.GHaR47rlpLKZlu-m0y@fat_crate.local>
 <2728119.mhk5qWAgFL@daniel-desktop3>
 <45127739.pHGDlbCDJk@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QuWn6foRP77dmfFC"
Content-Disposition: inline
In-Reply-To: <45127739.pHGDlbCDJk@daniel-desktop3>


--QuWn6foRP77dmfFC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 09:06:20PM -0500, Daniel Tang wrote:
> diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/c=
ore-api/protection-keys.rst
> index 7eb7c6023e09..59e7c178af4b 100644
> --- a/Documentation/core-api/protection-keys.rst
> +++ b/Documentation/core-api/protection-keys.rst
> @@ -11,7 +11,7 @@ application changes protection domains.
>  Pkeys Userspace (PKU) is a feature which can be found on:
>          * Intel server CPUs, Skylake and later
>          * Intel client CPUs, Tiger Lake (11th Gen Core) and later
> -        * Future AMD CPUs
> +        * AMD Zen 3 and later
>          * arm64 CPUs implementing the Permission Overlay Extension (FEAT=
_S1POE)
> =20
>  x86_64

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--QuWn6foRP77dmfFC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaWi2oAAKCRD2uYlJVVFO
o+ERAQDa3HKnEA+bbc8EZZS4djclPlAdsNYCZz7i+KmNZX3T7wD/XszR+V8JWv+i
1f+UIbRyEQx8j0j2DIulVmDA1wSroAE=
=6rYl
-----END PGP SIGNATURE-----

--QuWn6foRP77dmfFC--
