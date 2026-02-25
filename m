Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673112E7635
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045643; cv=none; b=IlUroD85R9HaQ0uARMTDC2U2DkyqdL40Pc73691aCtKZoeTlYqcTHKVLcntILjtUPj4UHqkuotnuCbMAPAIJW/2n8JTQd8fGGTyrjxOIod+rYAoETSSL+zZ7qbMnEpV2Kztra/XVRFlS43zXiS+43FeL9esVPQsYCZ9YkL4xhfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045643; c=relaxed/simple;
	bh=IYfNgJtBQ6RbPAHveRA9XcmzjH3CHVpWjJuPVOZDjb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpgrJ4EmIcnyRVvHeWx4SGX8bQ3YqQyu7K+XJcUZo7/8xA+GGHNav/LCk/COtsTs9lgWvhU15609CfuApkslTkhF9TikTkeLJNRCC93W2OTiH3Tqx5PxvMi8vnzkkP8DkKtjPHLGGaz93YebRpeCiDN//5P2ha5L6EIszyT1xrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM3F5sqB; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM3F5sqB"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso878605e9.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 10:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772045641; x=1772650441; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m0v9eecdrDlKKkRsI8AJc9LWKKGXVn/oxr4SUBFzAKY=;
        b=XM3F5sqBj50+0X5mw+JusqQTCwHKXeJFBn/xTlz+o+F+mAmprSAJxoIlo/fMqYMEml
         wcL/r/crRzJnH0E5V4tZAXWpODV9KCTTJ3BxM4wmyfrE3BvJb42EHuyhSh7Ho4DnFTkW
         xJocbFNoRvhYuzGMGWQob5jokv8Muue1XhROJjPYPh3OkGyGzxjNHb1V2g8cDlulspVS
         YWJ1trXhV9TAlCZXtdhE6RkHXXUkzTJqw9B/8XBH7pwbq2JeEh5S9oXJjbjzu+qCHfgS
         s9hTaVIrRHLM4NhQOKnJ7T6vOUxmOayegXMZdEpGxK0/lUWwBN1VIpfDznNTwG3HR5Sr
         UVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772045641; x=1772650441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0v9eecdrDlKKkRsI8AJc9LWKKGXVn/oxr4SUBFzAKY=;
        b=MUChPLd6AQ5PEv51g/JcDn3TdaCJtD0zfYuhlnbBn0Hu7PigA7S3HbdJYMRdLKWqA0
         T5JiVhWbCecAxHiymKypZ/58PNK9f3FT66QwN6ddr/ZTSJyhIJg9PorqMGNrd3mzEqck
         U6+lPhU85m4JlzbcNvKSAgYQohB8ztURYA3nHvP8ndJLC/l3DN8KjZOWnSz4byWrFxTM
         +7kSGHm/ULtryhvpYx20BehTZuHwfBvTAeAd2CVbBVXr3TWvEFyqjQY3w8x2ZJ7L+Gz9
         O5D4fo5IoksBtuJ/eIeHJMapxNhbP87bT6IDBANV4GAgeatRSU9jeFlCvSEAsXXm1sCj
         ezUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZzleLWIiIsgs9Qq6FgmjOR7gDCTz1Xiv3LVY0rAgMzjbSxePGck0nKzT2qGmWQeHjjBp0vqX24Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcVBdCCMGT20rnpeNBs9zE2C/rgMy53GHdX8ZP7v4TivBGt+SR
	0a0Aew/93BWT8blCrYvnMIx/spqznWtiviQnh3RTdYJDKZjIuAt/+p8xnblYxKbbn84=
X-Gm-Gg: ATEYQzznGyBCWoj56nCjA4wI6mRJW8amVJdjWNYLSKHkhh35SZOxD65/sgae/xHfMln
	WBdAvZ86e3SSH36CnGH4pxLbxIaQPV8R3Zfr0ytSncCst2c27TXkOCVAUn8Wuj4F/+mRcUBZtx5
	dUcBXhGPQAYYQoJGs67TzgtRwaGTPI3G4gx9dj4B96sX8yNb+O5PICf/VpXEAFgcIdu0fXDrbeO
	NurM85CnRfjZts0Ey770/35RRksADhhwlZGaSnNIioHKpBZE8qIcFnGNaVvLdmOzEp+m0SJFT3+
	N+60hbnqCiLgpYhhiMs+YeX/VRdUvVzJYF1f3EnXGU8GwMNAdQP9M14FpkH90IHoAw1AYi/FSJU
	hBdsmiVev/vwEsILnN39iPqW7k8uvSXI23y2uKJ9apIF7GHPsQsUPfvAo2eC0USSZcynmrOgkLV
	p7NoIkVlJjH7EVqSx962uki2MquQvhaGOIq7bYXNZOrAUI1h+M
X-Received: by 2002:a05:600c:c4a5:b0:483:7783:5382 with SMTP id 5b1f17b1804b1-483a95e6b64mr263650605e9.27.1772045640610;
        Wed, 25 Feb 2026 10:54:00 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm99932735e9.5.2026.02.25.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:54:00 -0800 (PST)
Date: Wed, 25 Feb 2026 19:53:52 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: "Panagiotis \"Ivory\" Vasilopoulos" <git@n0toose.net>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] landlock: Expand restrict flags example for ABI
 version 8
Message-ID: <20260225.617b52a2bef0@gnoack.org>
References: <20260221-landlock-docs-add-tsync-example-v2-1-60990986bba5@n0toose.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260221-landlock-docs-add-tsync-example-v2-1-60990986bba5@n0toose.net>

On Sat, Feb 21, 2026 at 11:12:25PM +0100, Panagiotis "Ivory" Vasilopoulos wrote:
> Add LANDLOCK_RESTRICT_SELF_TSYNC to the backwards compatibility example
> for restrict flags. This introduces completeness, similar to that of
> the ruleset attributes example.
> 
> Additionally, I modified the two comments of the example to make them
> more consistent with the ruleset attributes example's.
> 
> Signed-off-by: Panagiotis 'Ivory' Vasilopoulos <git@n0toose.net>
> ---
> Changes in v2:
> - Fix formatting error.
> - Link to v1: https://lore.kernel.org/r/20260221-landlock-docs-add-tsync-example-v1-1-f89383809eb4@n0toose.net
> ---
>  Documentation/userspace-api/landlock.rst | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> index 13134bccdd39d78ddce3daf454f32dda162ce91b..0affe1c953d61a4b32aca700cd262c49cee6304a 100644
> --- a/Documentation/userspace-api/landlock.rst
> +++ b/Documentation/userspace-api/landlock.rst
> @@ -197,12 +197,18 @@ similar backwards compatibility check is needed for the restrict flags
>  
>  .. code-block:: c
>  
> -    __u32 restrict_flags = LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON;
> -    if (abi < 7) {
> -        /* Clear logging flags unsupported before ABI 7. */
> +    __u32 restrict_flags =
> +        LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON |
> +        LANDLOCK_RESTRICT_SELF_TSYNC;
> +    switch (abi) {
> +    case 1 ... 6:
> +        /* Clear logging flags unsupported for ABI < 7 */
>          restrict_flags &= ~(LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF |
>                              LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON |
>                              LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF);
> +    case 7:
> +        /* Removes multithread flag unsupported for ABI < 8 */
> +        restrict_flags &= ~LANDLOCK_RESTRICT_SELF_TSYNC;
>      }

Thanks Panagiotis, this makes sense.  We overlooked this.

I'm slightly worried that people will copy-paste this example blindly
if it does not have a big warning in it.  Unlike the other "backwards
compatibility" example code that we have, this one actually changes
how the enforcement works.  (The other flags change logging, but audit
logging makes no difference to the process that sandboxes itself.)

Could you please add wording to the comment to state more explicitly
that below ABI v8, the enforced Landlock policy only applies to the
current thread?

Thanks,
–Günther
