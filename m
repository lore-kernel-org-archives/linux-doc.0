Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B036AB4D
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088569; cv=none; b=HaT8f+yQOxHH7KnKzCzmht+KRjS4RNxPg9VQbNGcLjbPvFZeLxP68jWDYSL1P323HQQ66aV8xTc1Dp7Znxhtj1sjcoGPhR4Sc18nWVpeX6BmOM2cKkXMWkaCoqHSI3Xo4ztE8BYZvONX0ZDSHIoOU2wHvq8txj93CYDV60HVOJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088569; c=relaxed/simple;
	bh=5JeEmtsguDHXKCG6/FSGhr0jj5zQcfMVjdea7DqcvmE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ax2ouMq7YYHHJIRulU87+ENG0I2CFo0X/qsEkD60rB23YVEvPJDK4vSf5z37hc6USKl8D6ushTjaznLwDDcIP9Iz51ASDIPnCI8uRS/p9QBl/uwRtHEy9DCGbuEZt6uI5ak5mGfznRsRBI6gyCV1KtjH+y9rHjkvfl23bFU7mX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=FdOLxL3v; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="FdOLxL3v"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f84023916so2795265f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088566; x=1786693366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=FdOLxL3vCGIlvl/g1dcMiMn+Sgka7d6AGoLSX5hqtfh3HAsDTa7lcOFMKjDVXQlOO6
         2LHd7k+agH4usFmyGmHGIVSME2SWe7qbh/znbWafE2XEBX2n6pCDubvB4hqpFwiBDACo
         MI9Ix1ybs1kh4hoTJ0Jp09nJw1+GFmRxRxn3DYMfGVs6o3ET++3s3lsgVgTprKt18vZ7
         Mo2GR1bCT0AVKF+O1XhBB8/0gQh69DFbivC60YtUPmi5dBW/hdDedaI4X9Qz7KM/icDg
         tfjYqfy2zO/oKe76cRVgyPHbGOY9a5V4q7tL4JrhUgs47qC3301Nh8oC6tUbeJs0WuX0
         x6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088566; x=1786693366;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=Z6JF0fQLZa9U7DJymNGDw7NbirpWSEVqRdoX1XvSVnlRN8YVbamqmqZf2x4O73IMzm
         htdH9yszvZauRKHLR6jF3DfnD9d+hTnc0cVvmof3xOswOIZXWsWEk32eTjw+eG12HmCQ
         eQHh9TBLwPyORmAzNqyG0Kmsq4WNWUbIgfDrWQ7busTAykPGgflxmP3TVCEZaSgOYIm4
         DRj3twATBcW6cneBXBXfpE6pSJRtpsDLNAG0v/5M823Xx49uSCnMdc+uGG6ENPv4lxc6
         SyiyxB0iMgfDMJa0tF9RUxPjQNW7Nx263qbviSku0pLTF9qEIcU5NwH1ASdoNtcm3NjD
         LQUw==
X-Forwarded-Encrypted: i=1; AHgh+RrMgnDbjj871qeQzqza11qU9e0G897pPkUuG1D9ZYvPQcsExq7mQ5vctuU01cfyMUDLWm0Gzx66VWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3+1ZAiKiRaLw39aJAMsmWNGk0Mho9A0KrnKBuEdHQA20MtYU
	774ompQlAdKXfzny/sWa8sOzpMZrIcVf1vIyZJmKehMsJWrV4gLbWqwk5w4SJs5AD2bX
X-Gm-Gg: AR+sD12ndrQ+0XpkBgsVSpmU55p46cmJ0FAoW/vMaittzHQjUfRW2HxElWFLn8BwEXh
	DS5ms66cbwNJwAxiS/xS5K+SArVLvAaIbJyh+atRh10DvuKGxePW79fjHRHQoe/X8LQd3ZskHl6
	uM9dGjtDlS+QT/XacNkDxYHTJ9JQY+K5mKeeu/fUE4KH418Z8PM4bJBsZJGpDplAk+DkvEE0YkU
	/hOEqw8hsILYHaNTpYsMnudprmhQtglLobhMbpI4yytiT8GkSJADE+kk3cyW06VZ8M1Vbmtn+EA
	EE88wRRHI9hwh0X2xOtPtXrcbIBAKXKDQcov6PlqX4JZ3/TikX5dWLwwAp55LyngvnRbFNK5bX5
	FLXiVyvdAFgfC+A3AJjo6wbLbhKZHpWguG+D8ecnFb5E8VcfrTMynerggbaCUt7MEScCI37GrI0
	6P0o06eFoqOzfrBzyXT4XccpITk5pAwrzNxD+G/XMq48LiCfQFG2t4GybcGqdat2NFuFBAru06J
	j9KQ0vbh3zMbQ59RzBLRFUrWpUDDEQJ8A==
X-Received: by 2002:a05:6000:4704:b0:47f:6b9a:9d48 with SMTP id ffacd0b85a97d-47fec507a4cmr33818000f8f.13.1786088566064;
        Fri, 07 Aug 2026 00:42:46 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506desm3339493f8f.10.2026.08.07.00.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:28 -0700 (PDT)
Message-ID: <402b7510-d695-45e6-b39b-e0cd2d61657f@osyx.tech>
Date: Fri, 7 Aug 2026 08:42:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: Randy Dunlap <rdunlap@infradead.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
 <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Content-Language: en-US
In-Reply-To: <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 18:54, Randy Dunlap wrote:
> On 1/7/26 8:28 AM,joaopeixoto@osyx.tech wrote:
>> diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
>> new file mode 100644
>> index 000000000000..966bb75aa495
>> --- /dev/null
>> +++ b/drivers/virt/bao/ipcshmem/Kconfig
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +config BAO_SHMEM
>> +	tristate "Bao hypervisor shared memory support"
>> +	help
>> +	This enables support for Bao shared memory communication.
>> +	It allows the kernel to interface with guests running under
>> +	the Bao hypervisor, providing a character device interface
>> +	for exchanging data through dedicated shared-memory regions.
> Please follow Documentation/process/coding-style.rst:
>
> 10) Kconfig configuration files
> -------------------------------
>
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.  Example::
>
>    config AUDIT
> 	bool "Auditing support"
> 	depends on NET
> 	help
> 	  Enable auditing infrastructure that can be used with another
> 	  kernel subsystem, such as SELinux (which requires this for
> 	  logging of avc messages output).  Does not do system-call
> 	  auditing without CONFIG_AUDITSYSCALL.
>
Fixed in v3, the help text is now indented one tab plus two spaces:

   config BAO_SHMEM
       tristate "Bao hypervisor shared memory support"
       help
         This enables support for Bao shared memory communication.
         [...]
         If unsure, say N.

Thanks for catching it.
