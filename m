Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BCE38331C
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163261; cv=none; b=hKtHPdwirYnTgssuOGFgSk0XWQLAacGRDaQKpJ68B1eYda/0NvbeUu27y6wegquEtz8XVGZ1XsaucbeukpF1tPflPhYAmxKshmr2OYu9W0Mqr3jljbSCEQGGl9+RKHw4MMVV5xeFX8ws9ohhznLfvck1e2wXr917QRL0Fm956Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163261; c=relaxed/simple;
	bh=wvl91n51wxypXJmL8HGPrJwxT9qd4auGeVKT3kaht5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T888a1nIlqVLgYqstrm1Z3HqMqKQjIgPKwcCBxMHbpI2PGJjUdB47MtgDRkjpUy2O6aVVYmRnUAufQTKevjhormGEkQAjY3wSTH6CAn/xjEcLBtBxqoJVbV06CAupdvVl0oCNRtEXQIUmBDkfncT76iV0GdyhH8YhuvO3CNGVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R06I3Xey; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R06I3Xey"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso1572657a12.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163259; x=1785768059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xx+STKr/dBmKeham5t3qgpvsDfEAeS22wxKe0J4lUsM=;
        b=R06I3XeybnRKdn5YJF5l2zDGt/su7CVUFbsTYUV1270yxxqPqC9b2ODeH5YsdCWQJU
         N7vAAbkGzCQCAbPs4Rg0L3cCtkvsAgWzl6hh1tIf8M0XnodcOtBoAFlaR2xlnFzEA8kD
         U7VjQF4MeTmRzARkfCdRXkR6zZQx8I/j1qxt4Ym6lw1C/kd8ARD5zPrVsR16Bq7TuP5j
         6hnHmeOZowCBgYQ+WMcX1FfReuYyKqGwetKYNEbFq8ryYnE2ncYmhtk7P5vmofLypsqz
         o561ckb6tZa7C0AlHnLD1kXKoMK4doy7adyX2NMbJWQoELbsMrvTucxisUi7a5e/D+8v
         +7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163259; x=1785768059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xx+STKr/dBmKeham5t3qgpvsDfEAeS22wxKe0J4lUsM=;
        b=q5ihS7pbpCnErpo2B6n95D2Pl2ksX13hyX8QnGZIxnDQuI9FtAHwO0W/ws9DwjWi4M
         3CRWWYpOngBiVU6yM/cxuekxJ5gPf62rmAT75yo2+S/L2tbVO9pBarOzJQeqTOUxBsFt
         kzekuoSAy/2fzS/0/ZFHBfbVrKlu2vL6UiaFavGzw+de6YB4Ikvs46WaxrkdI7b/7fBP
         C+tvrBgGpBoASYv6Sl0JfyLlhLd6lagXp8fg3Au4ulGe70cCpEugTcuFN9TUj/wh6BlY
         mwdu/1UBh6cwr3HvcepBetNSVcdcL+nFn+2PoynfigFQPBcg791KQAv8YqlpfdTyTfjl
         mOkA==
X-Forwarded-Encrypted: i=1; AHgh+RriPBWodD47LVOQGCC/05YPl0t1nZaenfX0LP8JQDhE1aIg/XexJX01wkDTqwPyLRnvBktbQdvosZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30GbsxtuOgkXoAMI26lO/azinPK2tBPxAIT/beeednu7HVN4x
	dnFxGD65A+E6Ybn6o5lKt3wbwnfXyrExi5pw/J7NCi6WsyIppx9yOiJ3
X-Gm-Gg: AR+sD10wcxt2hwgyUm7v92Hebi4bH1v0rECaXp+bUR3sDA46P0XM7/x8pkPtKpNN03c
	4pDY8m8b4irnLDCv0HfYiqeLpf5qW5Eq8XrGO/S7w3sB5GR+EiCG6SlVR9JpYP5OG4teVMFs+72
	rLWW/TR2IaDpVZipVdPhhtBbbm27GRIUssYvJIV3CRqPioINA8bfVMfH/3ylXVoD7cIsUzWhLdZ
	FdINFeJEYRcUsU9mZZ/GNLdJCoLqmxOnLJgzzk4cmG/2YtjCxHlW3Cr0MZSnlesO4hsf8ATnKAG
	7R3I9D9ac+wTvPyFYa0w7/RVNpGMHq6ECpQp1On/TPPrpB46vPi2xdpWC1dub3m82lkVh4u/DZy
	u2Pn8h5FIqvRsqZw2K+Zao/3iiY4jflINC7GZdpUQf/FfTnZr2ulDesUkbDDB+rygzNmVIvx697
	CE3/SlZI9e955UlxU=
X-Received: by 2002:a05:6a21:d8a:b0:3c4:5f94:f22c with SMTP id adf61e73a8af0-3c67df2078fmr8871424637.43.1785163259133;
        Mon, 27 Jul 2026 07:40:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm53995972eec.2.2026.07.27.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:40:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:40:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: trivial-devices: Add Kandou KB9002
Message-ID: <62e18422-771c-45aa-b464-3fa34ec1ee22@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:38PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer exposing an SMBus target
> that reports an aggregated die temperature. It needs no device-specific
> device tree properties beyond its address, so add it to trivial-devices.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
