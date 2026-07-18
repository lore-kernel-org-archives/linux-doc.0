Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683981E98EF
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784416568; cv=none; b=sXPWVKBgR2w8j6Z8CZL85WcYR1XWbE+DSPSyQ99/EoaWppvSijCvZI+3Yt9aFsa6katxJiYBfr/aOH5/UJcT0Q2nWO4Gzhm3yssvcVchbnatowv1SwQEk2QkQtmVyrdFCHw9tv6nQEbeU6Q1CfOyiI17iAPZZmOPVm315gTwSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784416568; c=relaxed/simple;
	bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1zILrxC6U1p4LLgxlWQEjOE9uj9Fr+qX27v0bGYdha5ixwSXQJhIFFXlJPwlMKuDn+Q2fqPgY70SYQ3soCcGd8ZRpvxeyOk585+/UHhNQ6ko9K2iQ+1MpV0NIW6gRcMvt2Yaerx0k/oQDio4fEJoKNcrw5YdSqo/eziOzwgI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=K4D68k/8; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="K4D68k/8"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f186025973so100141126d6.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 16:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784416565; x=1785021365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
        b=K4D68k/8SxVenT4xZI1ts70pz89i3H2IqaEK+ww5XO8dYYYJCOyetLAKKd32xDrxSV
         o6O8RRAd5k3Xci4A3HnOXkifv6CX3vFjQ1ByAYCYQLpm8pV8pM0YUdDIEnqwAPWnvvuz
         K6GsUBBtuOKBaqoIE+mEh0+zjijD7Z+sGbtfRKuWr0w6zJP0qGD8o4paoSo15dSgxP/s
         wjxZv5bJBwnjsXdaD3ejToiB+A9xNkJvj+Im2AreAhT3OInnrmbzd9rbiIlmlvNJ6+xO
         JZJLeRqWvX2DRqMOernngAkFVH0Tawo9NEyNyHqppcBMMw4Hi/593PvtG9hviM07LkhS
         AGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784416565; x=1785021365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
        b=aJrIMZF+w1WMBWZ4JPSUFy8m4HOsR0elVKWNmY073IhHM83JcSIomTMUAYn5szJPik
         nKGYgk4iWQlApsmriRlA0L5s2wCWnvP0fq3vc4RQ9CclW/x3RQ3VRzd9EC20NZ6itWsN
         dn+SPVTJLhRGZBWf8lQQfQ1XEJOyZlvu30m2EaN48OIBKQ9FSDkpKLWIu1zAWvkLV7MV
         nywrAcXz5r/xioK/NZxVr0h1ADtXsPi5FAXaNMA1t9d8oEN8FoJAhiKumyATCKrIPfyn
         NhS42S5TdpAV5s6m8igeN0GtS8bMIa+BNK/onKFAT6DasPIqzL3QO8+N39OnwNwz3Fi+
         jf3w==
X-Forwarded-Encrypted: i=1; AHgh+RrCxEYIiwCZKvVs0DHiO7cSh52Gpehz89LkP+zVmMBI5g0fFzCxazA2ZXGKeDSb0LkOn4f41mQxEjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Aox4W0j9nFiSMxcKtc6zmYjz2nNsJEq73j7NHAEpCErPsrUN
	n65yuxlijygwWADeLDpMJzKtPwYM49b8fdSxNr1zr7yvEcn8mWUL9uWCCzMpEvNMah8=
X-Gm-Gg: AfdE7cluo8VrtjTzLgwPUvrc+g/3GfpwgYcLT/VBg77TeelICnMjjjrThsHs0WAT/8E
	lDp3sRN1PAkIx3o4TVGpANts74L9J+N8XuQONJvnUcbC4yYUgcZrYz5IUERDanocmhfpJHcpkb8
	S1Z0in7xZu9a0Jeswc4VYVoWgCQ8pOA9UPx8QZanJ6aYD19gOudJrmOO0J2fJIRJ4yqKJCzt8XR
	k0mzpeEwR5bEMTDkok+oL80x2Tf8NTpsW4zpTE5GZbNHxhIMqVSlDjfVLyvQWO2KwupIZmmG5OZ
	qsKs9m0HJrIVbPOumnGXnmpnIMu2JZBnuNsFQCS3dHBOIncHGZ/nKcVJMSI4NVTIL66fhnUU2q/
	evMyXDoVTEn5tFVL1O14S56aMnrG76CEiJsMv2Lb+sdOciwr0D5lXo5bryBA5
X-Received: by 2002:ac8:59c6:0:b0:51c:18e4:38ab with SMTP id d75a77b69052e-5213ee7eda4mr74584161cf.66.1784416565170;
        Sat, 18 Jul 2026 16:16:05 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214fae3268sm40901021cf.24.2026.07.18.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:16:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wl8Ae-00000006ef0-0ssw;
	Sat, 18 Jul 2026 13:45:48 -0300
Date: Sat, 18 Jul 2026 13:45:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, catalin.marinas@arm.com,
	will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
Message-ID: <20260718164548.GI701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-3-amhetre@nvidia.com>
 <20260717201841.GC701389@ziepe.ca>
 <alqbxaKVYFX1BZR5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqbxaKVYFX1BZR5@nvidia.com>

On Fri, Jul 17, 2026 at 02:16:53PM -0700, Nicolin Chen wrote:
> Given the use cases on Tegra264, instead of patching the iommufd
> path as this patch does, perhaps we should simply spit a WARN in
> arm_vsmmu_init():

Nope, in this case you need to make the errata discoverable through
the viommu info so the VMM can validate the right DT is used, or apply
the WAR itself before submitting commands to the kernel.

Some kind of new flag in the viommu struct I guess

Jason
