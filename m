Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE25EEB5
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525901; cv=none; b=Lvx5Z1CD1jsEEslkgHfZMYasNL6xUfZ9Nx7SeozSsxKxzLyhkDtY2esxKQW5mUb/vU3d33hFe3QUKStJ7Nm2jJkSDpwthOcTK8LQ+2g5fvV+d+8F2tL44cnPjlzg7cWswESUfoy0RCvxKtbf6cDZOnS2spKGxFMNJTJEU2E/RKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525901; c=relaxed/simple;
	bh=bickAPlR7/NP79mWKt8/KneNlEYimMJnZ+NoqIvI854=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4SFmOcePoeZ78wPYMK8W1FJPR5wxPZLkiagSJOCW+pflWCzqcTeAsO/SnY4Q8FJgBFPg9jjgnPheGUoWa1yln8WUQhzgEIYlHt6qevPwtSNuPwGtRCSFaxhOvGA+ck6w7b9h7ilLVByp4etSWgFPg0f9nJnNq1JtM9FyMO9/GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=dh1tWdqt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="dh1tWdqt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e62619afso896845f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 23:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751525898; x=1752130698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uGKG5g4X2FtIIBBBni+nAn11AVuFyvfdg7Z2wu+7sP4=;
        b=dh1tWdqtB6NPRpo0/mK42wwS3VGH8FsFkNqIPeIBLmg2QY0JnNQYPvTHM1jVhMFlgE
         GzB2f+xQMNHHNfYWjtScja1t9a+QNdGQG9TMZc7eHL2qzKu9XgbFFPhZNdKL8tey+GWy
         WTT7UUPUJegTvHMkoI7HuC8xzcHny0hH36hPfjMFDEaYMl3u1VgaBKM4PKs7G6FNW8O7
         EBLSHSWkFMAF1Zu3cRCQWTCWrkNxVtt3C7zgBVG0oCLLoUR73tHtNWhM/32/XDzs+OdY
         +EmF4HdNtwnp0btOurmMHkZ+r5HQEJOVf/KpGbiwfxCz+jUYTG1l+PzElCNtxElkYd3N
         wpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751525898; x=1752130698;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGKG5g4X2FtIIBBBni+nAn11AVuFyvfdg7Z2wu+7sP4=;
        b=hBKu8tYXSNOOzRzWGtRwWPDLiaqLj99cdqLiyT3G4V18ARVHrHBUNw2RqaN43OaJHB
         mG/zNPrVcwSv3E9FOyyb8fr4LwM0+E+A2ojtQYhc6CuXF2UKbwMRecHZZoLpcbcLZ1f8
         +vCaqiK3vjnCYTi2/btTUkZd/ya15vGlHJ6UUcoExJLwixgGDpQoKW6Za7GRjiHwFNVE
         LJZQCEH4geYvW0tsisUjy9+D+TkZAp+uOp6tfrAdZEqoYFRq1TSgSUfzvkDCOl2qqXo2
         UopWvkRZIIO1GHV5arxukEUp6ZGHHTIDwLG6AMxRAAVRnh+fvuyrrmv4+ilqydC1wApL
         hcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ysfqbenGyZV4kB8rblZt83OeDHOCfqL1dOSNnM0L3ojYkFzANjSmclOlkllOE+e08Xw47swRgFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lMSp9YWqCxoDCuFUaWQFK8vrPpxSyV/7VNPKOp2dMC1of5bd
	inzdo95jlATfaUqWRtH1dBF4QvyfAELnA1k0DVZfa+MkLrMrTRKH9TyEQq9cDlM/NeE=
X-Gm-Gg: ASbGnctxxzNOufGM9vcjbmoFwbH9XLjWo+DL+/ai5HV2ujYOzrozz0PFKCOp4jE+t9o
	PaoGVyPaGmCGQ1Msm7FbGaEvDlL0R20LwsLkPmgwDxy5U1TIAffxZMSqf6DPKpy4rcNUFEn96Fn
	D7ZHzZukXURbzvFUZUyCnsd3RJZCB/MYG+QCKBNXlHekbMGpbGglKFFs37UEpsyT6ZZFTIYdZwx
	vjU0IJYJCaiB5WL/1444r6aYfKn3F0+4mtKnLPI+NZmx1mEzhqzr+5Ubs7y2dQQAobeEs+Sy6KA
	qOswyx1IQJSUoUikKE88e1jD+II3Sj+sBYkimQX3ICliy/87C/GBpNve+7nbRyPNSrvfVhDewWp
	1JyLq0WP6iA+71jmUZuvMyn7EVmty0keGizoq+Qc=
X-Google-Smtp-Source: AGHT+IFFoiiowVu/8wR0tlX292EVRJFeXC5GLN8cUKtKtyQtGsaIToPUA9LCF0OxS2wvlY0ljK8jzQ==
X-Received: by 2002:a05:6000:24c7:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3b20110b371mr1611335f8f.14.1751525897572;
        Wed, 02 Jul 2025 23:58:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:5568:c43d:79bc:c2ec? ([2a01:e0a:b41:c160:5568:c43d:79bc:c2ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5966csm17977144f8f.72.2025.07.02.23.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 23:58:16 -0700 (PDT)
Message-ID: <869cd247-2cde-46bd-9100-0011d8dbd47c@6wind.com>
Date: Thu, 3 Jul 2025 08:58:16 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v3] ipv6: add `force_forwarding` sysctl to enable
 per-interface forwarding
To: Randy Dunlap <rdunlap@infradead.org>,
 Gabriel Goller <g.goller@proxmox.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702074619.139031-1-g.goller@proxmox.com>
 <c39c99a7-73c2-4fc6-a1f2-bc18c0b6301f@6wind.com>
 <53d8eaa7-6684-4596-ae98-69688068b84c@infradead.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <53d8eaa7-6684-4596-ae98-69688068b84c@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 00:26, Randy Dunlap a écrit :

[snip]

>>> +static int addrconf_sysctl_force_forwarding(const struct ctl_table *ctl, int write,
>>> +					    void *buffer, size_t *lenp, loff_t *ppos)
>>> +{
>>> +	int *valp = ctl->data;
>>> +	int ret;
>>> +	int old, new;
>>> +
>>> +	// get extra params from table
>> /* */ for comment
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst#n598
> 
> Hm, lots there from the BK to git transfer in 2005, with a few updates by Mauro, Jakub, and myself.
> 
> 
> More recently (2016!), Linus said this:
>   https://lore.kernel.org/lkml/CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/
> 
> which seems to allow for "//" style commenting. But yeah, it hasn't been added to
> coding-style.rst.
I wasn't aware. I always seen '//' rejected.

> 
>>> +	struct inet6_dev *idev = ctl->extra1;
>>> +	struct net *net = ctl->extra2;
>> Reverse x-mas tree for the variables declaration
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-netdev.rst#n368
> 
> Shouldn't maintainer-netdev.rst contain something about netdev-style comment blocks?
> (not that I'm offering since I think it's ugly)
> 
It has been removed:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=82b8000c28b5
