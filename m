Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B592D63F4
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893143; cv=none; b=P1+8vQLS7NTmpUBMZRVQM3UjBnscxH1gJbWMupB+mU3Ms3hdBDUjOFr91fUchOoGLCujW3YP/XOYhMchgfgi8oQzMkiUABt1pOPi6h4Cj66Ge5N/6GfaOsX0M1My+0WImBtOqUhvgg3dbiCt0vx473D+PZWVDH4wjhQmtRirx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893143; c=relaxed/simple;
	bh=IHI4Lh34DnlqQV1gz4FV/jeN9W4c6fRBK6GzmhkmVDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHkwQrjW7F2oUHQ9bPPbsIYvmTtXiBC5VzqEvOZ5fyYouteo93kYDDI0ozBa4ieyan7soTErsQZ3Gv5iRkVigCTq8k3w22+e0h8sPhwAM+0x+9O4Zn3CRZ2FghRQvGH3d5Mtp++YjvYjvOnNlr9ZpvgeyZAK3RO1o9ypj7/zG2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=ZPk3arVe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="ZPk3arVe"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f76454f69so3320326e87.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Sep 2025 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1756893140; x=1757497940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkOh6GiVRIhhvdDnammQLO/YqbaXC/eAMSSkjGecmSE=;
        b=ZPk3arVeuo2XzPgHaB3GFBQzFeXS1fTC9NdqpN4F9NdA8uBM10t/PEeq9DKFUE5xvd
         dTNOhGSuN9SUnpz3gV+8BLGWmMA6jHOz7A6AVtvfTqnvysFH8ZKjiILMfC6NovUZ8RJP
         uPsiKceNOKxG9qMeEzDIPDrji1ApSMxQkRJpkxmLMp3TAshlwxQfYm6lWfSXYPkuZG+O
         v05XsFwnwV2g5oUhvNE4eNkKAkvmuyuARyfFRpFBA2EkrRHAOe5jjLxe5OWpx/MX7jAO
         u4Pld7u4HX7IdnxPfQd5bC+pYKyPBH7FShSio20h5Jw1PQkkzOG0Mtuk0GZ32mk+FQrP
         ax6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893140; x=1757497940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkOh6GiVRIhhvdDnammQLO/YqbaXC/eAMSSkjGecmSE=;
        b=jyFwcv7KWt14Ns+IW+4nIIrNKZDl1134Wl+AHJ010PEzcTBupQOCmKxbq9Y+nd83dB
         Nz/DpxjuHBqpEO0R70aR7jkrnMjeRo/It2VlB/zr2/ux6+6bCTRvbaE+fFLeR0kJe6eZ
         1OKI02LvZ346dk+n3WxnYskIHFKgUyLla44/yRI3Kh1BQqxJrAXkio1Dj+/eVq91qjW5
         SjIzX2E0R1IsCYQpdoqBTckApvYHSsjNjPL+jRWt/ejR7J0FDGsiCcPleMwHT4gEZnNu
         Ml7Pci7AgzbATj1IEkVx/LFvQilVnkdyXrYyNE2mQF+ulTw8yCS4tw0o2aapaLzYLj00
         ZL2A==
X-Forwarded-Encrypted: i=1; AJvYcCVEnv0g41J0YwREnICmGyJY0VL7/JtWWS89VEQA8RQFsoJ6VqzKbCR8FM9hNgy7bPCr60UQBEJ5/DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXkLTOLaD4RrB7+/2PKhx681/MfWRc4YWEPITaqiIILYILdv3K
	YDz98Eok2ikOVM1a/nsm/S2vFcxFRm6kmnau/J1jQ4t97oVVIu6vrJjl5NFrHicpVLw=
X-Gm-Gg: ASbGncu3YzSZ0hO+w/3ZLJv7JwAeFwFp5/mb14cd27YIsnsTEhv7h1+8HiOZNPgDX7f
	gr3Xto3wmcomC7wTPCCov1581/0S5+gGeHM2hto7tnhfzPvZpYnapuvVOJjNxUFXro117WsjOW0
	njwlcsSiRdHB2IldeOXnqu1QdxNGPp27mH87Ct1ilek0OdJIb0LqTcDDpA+UuGkUJiTXRcK53t4
	rmFGY0OsHegD6oMLcaGh71/3dpaI3FKH0x0gtz0HlPB7HIWBSE+DAyjL5A+fKHDTBfi+jBxGfdc
	NKsdMM3qiL1CthH5blOVW59K18C03gDbMXgyfj7/OlNUaIvB5Dmx08+MRnmhN1BRgl6UZ9NjBkJ
	epGNKqCmJfTyISjBliKB7FyrqtcdR1Vf2rt1IdOB7PjDCg5kjG3WrnSUFcB4Oein3KPY9zcOSNS
	ZPEnnq73Ol6XyW
X-Google-Smtp-Source: AGHT+IFbPqnw2qqkEXRE6VRi7nCMBHnGUo+2xz9gd3IMDxcdGmvZmcVa6xY9xV04WX/LLw/gqjYd5g==
X-Received: by 2002:a05:6512:ea2:b0:55f:6831:6eff with SMTP id 2adb3069b0e04-55f708a2b27mr4806509e87.4.1756893139495;
        Wed, 03 Sep 2025 02:52:19 -0700 (PDT)
Received: from [100.115.92.205] (176.111.185.210.kyiv.nat.volia.net. [176.111.185.210])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad0718fsm397194e87.112.2025.09.03.02.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:52:18 -0700 (PDT)
Message-ID: <b25f0337-5a7d-4632-a022-facc477a8dce@blackwall.org>
Date: Wed, 3 Sep 2025 12:52:17 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] bonding: Remove support for use_carrier
To: Jay Vosburgh <jv@jvosburgh.net>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 linux-doc@vger.kernel.org
References: <2029487.1756512517@famine>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <2029487.1756512517@famine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/25 03:08, Jay Vosburgh wrote:
> 	 Remove the implementation of use_carrier, the link monitoring
> method that utilizes ethtool or ioctl to determine the link state of an
> interface in a bond.  Bonding will always behaves as if use_carrier=1,
> which relies on netif_carrier_ok() to determine the link state of
> interfaces.
> 
> 	To avoid acquiring RTNL many times per second, bonding inspects
> link state under RCU, but not under RTNL.  However, ethtool
> implementations in drivers may sleep, and therefore this strategy is
> unsuitable for use with calls into driver ethtool functions.
> 
> 	The use_carrier option was introduced in 2003, to provide
> backwards compatibility for network device drivers that did not support
> the then-new netif_carrier_ok/on/off system.  Device drivers are now
> expected to support netif_carrier_*, and the use_carrier backwards
> compatibility logic is no longer necessary.
> 
> 	The option itself remains, but when queried always returns 1,
> and may only be set to 1.
> 
> Link: https://lore.kernel.org/lkml/000000000000eb54bf061cfd666a@google.com/
> Link: https://lore.kernel.org/netdev/20240718122017.d2e33aaac43a.I10ab9c9ded97163aef4e4de10985cd8f7de60d28@changeid/
> Signed-off-by: Jay Vosburgh <jv@jvosburgh.net>
> 
> ---
> 
> Note: Deliberately omitting a Fixes tag to avoid removing functionality
> in older kernels that may be in use.
> 
>   Documentation/networking/bonding.rst |  79 +++----------------
>   drivers/net/bonding/bond_main.c      | 113 ++-------------------------
>   drivers/net/bonding/bond_netlink.c   |  14 ++--
>   drivers/net/bonding/bond_options.c   |   7 +-
>   drivers/net/bonding/bond_sysfs.c     |   6 +-
>   include/net/bonding.h                |   1 -
>   6 files changed, 28 insertions(+), 192 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

