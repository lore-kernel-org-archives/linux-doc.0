Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C61A681C
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661808; cv=none; b=ItjXErC9+KkWSnSt36/XLcb9ZQ2q+ra10KJedwPR7rk5wn1aHAFV5/R0uMABNCx5QEsU7ZVZvSA/7Qc/Xb1v4HVXn1L+totZTHorOeEoV16nt58wQ0DgXgg4PpkTT8N35P2TDeGeHNyOQ1D1gyHgmy1vpDdHBYyJ+2Tj64IAPkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661808; c=relaxed/simple;
	bh=Lss/xyomWV9YSVNcUq2gi9/28MwQM5tgApMiY9ZSmsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alqR251sPaJZ4UES9dn1KQe4pzlYgiHXuSEAk5N4VDvE/ipLhnsv1jB9s1LeRXhoI4nNWFQAbHcswCSoBy7VsxEfmBHzaZ2XzAE9FHurN8zaSw/PCmht0b67l9UWCsA2zwliqxmzkmRb8zwAnAb0t2tlIDVZTBTgIg3j1QL7wEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=H7UV4QSx; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="H7UV4QSx"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-486304fa184so1462102b6e.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780661806; x=1781266606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96c2yxvNjI/CF5ITi40jfuTNVzbxXBqb/WCnE2f85ds=;
        b=H7UV4QSxD265HGxI93qicJwXeM+Sm1W2G8PjAAuqmHngPByyQObpGpraPsPcQjmMIq
         h5Mw7/bM8jTTwgBPDlUjNGtU7LL/8fEEAyW5DSsmCcIqHdnZ9+ttC4y8AeanplnmK4M3
         EFWRh0BE5+kjr5LpM4wBSi0tTlt1K6jEV6/Ta0FEoqtkvVIejx2/9WDFssIE2kOeiZKS
         JE0udvflJGaQMbC26CWl3/2pabOA/XG0HRmTeLwdBC5SQ7pPejQVyOGt0eMWmC/71QNw
         uvK1A6WqEjzaRV7TFyMvY6+R9ZfKcBBo8Bt7BhjpzPTk//0k2R2bDxVCdXoCohkp6Kff
         rLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780661806; x=1781266606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96c2yxvNjI/CF5ITi40jfuTNVzbxXBqb/WCnE2f85ds=;
        b=gbIU4ibhNkf3sJ/X3okMAfYDgfgDy8X7AdLdU3Z4PGhJ+5yWX0iru72mv3XSeOndSn
         IqNj2OtzMMK3bjqD2FWyedcygNPnRKan1Nk8wV5v+YYXJPyy9+sBGIS1vYmPUO83uvrP
         QP3qvjRYM1kFd1PSUdmuqt2GX/5IA8nC3eRPewnDUs4zBT6KtrjTxrI3zOGcO5Q9TIrw
         ULTXxgpovz6KAbu5novHG0KgxC3QBxLcHvNTuSFdltfiXdSXan+GI0jLsJZMQKAEqjcG
         3/nT47DLXFfoqWNGEgAC7Txqo7Tg5/c+CW3vmQ8T1m8TzJxlCPOI3V0RSV4bOAgFS5Am
         jnwg==
X-Forwarded-Encrypted: i=1; AFNElJ/QcHy1aalX/aL+7uDSikzKDo/9nK+6sRvm2lI1AyceNzXiynAiuRuc5K4a7f8iszmlt+jOAl9L064=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUt2t3IRhPn9uieC9jhxTKJ616GuKh55JSHSSq3LOo91EuSTpT
	a1BD4SsBFLnTMwib2CBj0qg3dLvMdVnOlMGMvyRcnt0Y/4p34akE9z8NsH8qT4I6YqI=
X-Gm-Gg: Acq92OFWwNpjYL/ex829Wnss5RGcDZwZlq2QcQPvVUxLrIdXx3HxE8SMFJRiLn1LZM7
	1ErbuUf0WWvMwf8bswU1wimW6juNyHNL6mNKFYUdXojjPNG94nbSTAqlj4LfJ7hGb+bIZ2g70vo
	3H4IJrraKuvTiuddeY7+HyMuUVG4/1pfZggq1a9oN1XLqspDJC0N0L8Yc7/yKuvBN9CUZaFYVFD
	MLnxLgaxYxxvn4K9fWqZKBkVsiQUQuNe2CPebuZ0g5hWPqvBT6NCCZc8m0TLp13LYc2MMh0uF1e
	xJWjzjaixyMOC2N0km1jHpkFGP4yqhzwlGGTyYaP/yrjpE384LoXW6TV8BXZeFv2PYqAjYJxBru
	uLcwZ9uvEWlIda9aQ4XY9gr93q3ICoczBBil7xi56Q7oLDrTQNhEmYhLW6C4WqGgHaPltuEzZm4
	Qyam3jE18VYiRAUJRGWp/RCetM2FadTKYkVi4=
X-Received: by 2002:a05:6808:1388:b0:486:7c50:6fa8 with SMTP id 5614622812f47-4868df59fa1mr2090018b6e.24.1780661806213;
        Fri, 05 Jun 2026 05:16:46 -0700 (PDT)
Received: from [172.22.22.234] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b760799sm6712943b6e.7.2026.06.05.05.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 05:16:44 -0700 (PDT)
Message-ID: <82990361-baa1-4930-9efb-1141c67d4517@riscstar.com>
Date: Fri, 5 Jun 2026 07:16:43 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htmldocs: Warning: MAINTAINERS references a file that doesn't
 exist: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
To: kernel test robot <lkp@intel.com>, Daniel Thompson <daniel@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202606050946.JGkrxO1C-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202606050946.JGkrxO1C-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/26 2:15 AM, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-net-qca-qca808x-Add-regulator-properties/20260605-091912
> head:   a2cf643cd5401eea03d3f1a49d81e7d066ae6047
> commit: b6d9c722ce11c43b1e14ca3a15d993e470299502 dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
> date:   6 hours ago
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260605/202606050946.JGkrxO1C-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606050946.JGkrxO1C-lkp@intel.com/

This issue was caught once I upgraded the "dtschema" package.

It will be fixed in the next version of the series.

					-Alex

> 
> All warnings (new ones prefixed by >>):
> 
>     Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>     Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
>     Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>     Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>     Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>     Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
>     Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
>     Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

