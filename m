Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E66C382F03
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316324; cv=none; b=Ap7iglzKTBNX2XsCLlgdxjLcfpgvJ5ReupLGCqmANKl+wLFYUUljMGhU3IkPyINN7ler9qdOnK+OyzXdkhPviX1LoZMhdkg/XqiWDsU9xg7gXPIHcsHzgsCjMOBjYzni2/JFq+e8fhwXZPaUunkl7bVIyzWNeF5Cg+2uXLzBrCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316324; c=relaxed/simple;
	bh=1tfKRhaJjdfZy38gZAanLVHmCMS7aHKIqtBx3ftd3W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh6QmSrek0Z+NGAdXktLPKb+5g8DJU9eJI+YnzAH2CHVVP+i7eDOHk0P8DpbrluhUqLD1JsbtmYq4lr9147UBzKOIj+vq6Y0wIIBLqw2OZhzUIGlg3A14WDPoWgTxM3ZAifV8ksox/ZmGPAuet8NUJenl6sVoYaBuTrd3u5VTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=aP37c3S4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="aP37c3S4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495437bb891so5693655e9.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1785316319; x=1785921119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kqRebawaW+R270ENqi7eByUr8cNF8X3bbKCoC4j9T1s=;
        b=aP37c3S4N3h61FwTq7ivW7bCrHai+dbbtEKqCspMYLM4evmUpYEKyM02y8RdbspXKe
         zJJSBaNBf1ssudK/5kqBsvJooW/UCWG32xOhz+xMhCpTFNiIfFInD+SWb5Tmpp/xKcWj
         OqzcGUj+gXoK3T7TwVFo/6Q07m6idkMh6lpVOg4s6Dt3+WDr2vS3/2eZ1cRlicc3utlL
         PANg29KTPwzxWAJpkfx4BW8FrByt/FDzhVzTLvzCCjm+HqxliOLhybIba9paqb/iGLxP
         TgHQHwq39RuUH/PhImKgDU9NxLBtjOkKl7A3uPx1c9o8scih+dDMF3biUuguGuaV1cT9
         aqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316319; x=1785921119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqRebawaW+R270ENqi7eByUr8cNF8X3bbKCoC4j9T1s=;
        b=ORTdkjeJ8RlD3BVqSNzYSru52ZWTKkrEr5XQxW6nfF2OIlsOh3TXk36+K5UBiJnfQd
         hueoTDuhJKPwCdaPHQlSCbdJ1+flSg6kxm7QdAbUOf/OZf9cYZidjheSGZmxlQv/Zstj
         yy04YqTPhVpWGMNFne+KoPEKlrKDzHySx3NW85y7EUYFPs7kjqTuVFGx4VP3MFBKKBEG
         K6AyzdiSPvCTN0jZHhZQNz0U01f2RPl9d+MwbxSPphiCN1hrwpLd2w8XEV6lhWy0rbsB
         sAlKXJ6UDNFAeBd7+vUH/R1agUC5MVlaCIDPvyCG+FMkFuO5BaSN3HoS2zLu3pOB6dk2
         9vEw==
X-Forwarded-Encrypted: i=1; AHgh+RrdGwdWnCSoNgt0ako7q0KFL10F/j5EgUD7tvcDl1xC4ady3GFeK+aJRcr4QXAIGdoY9aZ+R6qfstA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAWaGQNvI8IdUT737exrRJKgeE8zFOXUU+CRLwSyf5nysYDuO
	DXP8khYelvCJRfq+RHkA5hsrZiKlzv8kUlrUSGgjX6egzIMY5G3gWnj3h13Pp6mOyEw=
X-Gm-Gg: AR+sD10YqizPQ4w0W0toWCekccITy63Dj3AFkJQsIMot4VtJufxCtLhJzHy4H/LZKcy
	rHXp93BC5Lv6E+Jn18ytGA9cuy0a+FLPYJfmXpIhoSVF+Ihjr4w9+FQYxE6sy+z8WhCoDOSJPkD
	Vio1bDlHX9c3Pk8ePVl+Ps8PsOJs2EHMQTh0dwDyG+JXH5O+n1mAZcl9JGtUISuMZPh2JYP/Bf6
	90M64n2iQfkquk1Tg2Y5Z27LapNbKRlE9RE8dZb+rLJ0+nH71jrPXATKFJAMfiqbaf+jly9MBnb
	ODdQfQl9MjVb46SyA/2/pIECPDe9O+VQFd2rgb7vVuKo7w0HzOJZ6zNlu1z3Qfoevmw/kdwJA5N
	g8gcZByCohpoMBTNOYNdfCmJuRTzSgvd0QHDGRGPdo0Axn3bn/2kZZsBQWNy0WSySzz8SNEGZZB
	hzp7Z66tr2ZcikyqlOWX6afZJRaVNTh99mIYLaIOCe38qla+BqrgSI+W4ERQN2YBNdguHYag==
X-Received: by 2002:a05:600c:8710:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-497fd311860mr15174085e9.15.1785316318462;
        Wed, 29 Jul 2026 02:11:58 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4975abdca42sm40097255e9.0.2026.07.29.02.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:11:57 -0700 (PDT)
Date: Wed, 29 Jul 2026 11:11:53 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mark Bloch <mbloch@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next V7 4/4] devlink: Apply eswitch mode boot defaults
Message-ID: <amnDfSmMVzpiH2gE@FV6GYCPJ69>
References: <20260716084852.549909-1-mbloch@nvidia.com>
 <20260716084852.549909-5-mbloch@nvidia.com>
 <20260724161111.2ac47089@kernel.org>
 <c6c0d67c-d832-49a1-b62a-57fa6ee56a47@nvidia.com>
 <20260727131033.237f70b6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727131033.237f70b6@kernel.org>

Mon, Jul 27, 2026 at 10:10:33PM +0200, kuba@kernel.org wrote:
>On Sat, 25 Jul 2026 09:51:34 +0300 Mark Bloch wrote:
>> So I think you and Jiri have different views on the basic design
>> here. It's hard to respin the series when addressing one review
>> takes it back to something the other reviewer objected to.
>
>It'd be great if Jiri, an nVidia employee and a devlink "maintainer",
>paid attention to at the very least revisions of nvidia's patches
>touching devlink. We discussed this on a prior revision and he didn't
>say anything.
>
>> How about I drop the driver API from this series and submit it as
>> a follow-up? This series would only have the generic workqueue
>> fallback.
>> 
>> But where should the work be queued? 
>> - devl_register()
>> - devl_unlock()?
>> 
>> Can we settle that before I post the next version, so we don't go
>> in circles again?
>
>Maybe a middle ground would be to add a dedicated devl_init_unlock()*
>were we can stick such init? Slap a WARN_ON(!registered) in the normal
>unlock? I don't want the normal unlock to grow in complexity like
>rtnl_unlock ended up growing.

Yep, that was +- my idea when I suggested this, to have this in a
separate helper.

devl_unlock_in_init()
?

>
>* better name welcome
>
>BTW AI reported that we reset the mode on reinit request. Based on
>the code this is entirely intentional but would be good to document?
