Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4043637D
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563900; cv=none; b=sVUQqzLDqTbERHrDuVTT06BhYJpZGzKptKUDRSrUlCvEj7WJbrCKvQblyWaqA0rWqEaTFE0dPAXkh1t12GSfwrKYsRPq9Tw1hNgdYvw72NkBJ/65uqj0QFQgJvJ6RnNdVu1EfT7FIOK4735g/RHxMijZwSdboJyVoj1mLHr1oMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563900; c=relaxed/simple;
	bh=RUE0wRnDSulogZaSv/Phdq6tG4EVlY/e2/sK/FRA2lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+5ko7KOjT7X2k7b7BmMnAefHsnqfUVVTNVvJRCqh9A8Mh5x/VWhZU/B4I4e9HJ2CG1ID5OHBls68IGNNG5oKNge3Gzs50EcQu9Nl0y4OTm/0a/v4EBp86TjS+0Tc+BmXuN797u1Wrd7sFEk5KzdwiQLcbXvVqCbRf/IE1u59v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=kIVovgty; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="kIVovgty"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4493cf2f982so48833f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1777563895; x=1778168695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nVdkXGvjipVBSYbCT/dFGYanP9qbDtxjNRTDheTpI08=;
        b=kIVovgty868XFtEfPeoHV5DB5ZZXqPyEvjft08k376aiPD3ETBi0iiahiRcDAmGjQE
         07nsaK+WoWWxpfYJgOUZ2BPC+VlYMk3DLAyrfqeVAqFVWbAKcFadIEDqNTjq8iAO3kl7
         6Wb/uKRGSvGzwnTigQRGQ69RO3oeJavhGaTN/wSrW0ic7t8Dd+W+cqVM28+KDqtOTMez
         Qj1r39hVVgI1wqPz3Gc4a8Ldq8zkUcsx+6fcfg2nZSC0vTWli3r2tD3amDLZ/pUVEczp
         /qD/5BLRwNAV/dYiec+0oWCNVfnXmGSMQ7V6tM1yIF7mjvBfFWnbJI3MzZ5/AjC4Mp2G
         duuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563895; x=1778168695;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVdkXGvjipVBSYbCT/dFGYanP9qbDtxjNRTDheTpI08=;
        b=BrGiqApy/CNjTyCqiOoSbqN2LfOyPuGiTpVoBCI5TmRE3eZfTVof24nzSxANe3SMeO
         BtQ7ASLyq64eAh5hI7bXI7kksHRhiC1BRBFxvF+2OGusxkQ71bC4bUPALI6sJtYPhfnB
         2eNB+qycZL/unIO7ENFYM8zeluYM+/xAyKKEKnxIAFGnNlW09Behc4Sr6L9CipWJ8Wv7
         S/vNBT4FXTMVAEnCxftSJeSSbKQGEs/vPiLS1u2H+MTAdeEj5go9rAIpFAu16WVl3BkZ
         zAw+n8CEE3jPs8tcNY+BW7s59IDsga7XGw+/6Lyj81Ke24rqaNOmDJKEepdDThWF0AGh
         8vJA==
X-Forwarded-Encrypted: i=1; AFNElJ//aUipkp1fMsnBXbb2vJfWUNJKO/9qgSQc52OwVyBf5o3sFI3M46X5BIhMrXYcIu9K4VSgQkIh8bE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/SLbCSTLBnRjgC6W+a7zC/JSKWAp/YzjmeJQVTnwPg4oVpdn
	3Fzxuzs5TuYTuhGxOz8/kzIlYOFzBeUpznKmLeabiHK0lYbuYyA7PAyftmQNzOcdeKA=
X-Gm-Gg: AeBDieufA5Q5YFKbz4uPgcyB1rKyyuvW1Kh5ZyPMU0lR4A9NOPDaFMgI0+4zfbKmKHn
	UDd1WjoLT2dKFg7SoiOiP05KnHswkRLsPk7fnBz0cYFWJB8oYpRTbL1WQpBc9GN+Wk5L69OPNmO
	V6EDpYFUaB5mv4EHXPHJLiEAZFia4EO0S6UWZWPMz6I0prHxbnWrurOnqJjtsJF5fVsuf/9OutY
	SjLripRPcgrc2bFazUjs2LQYtG2SDyHS/lRKnWnSs/IfxIFvFG7ftwDEX7OrmZN0zeKKXYOy3re
	ZV0jU5hmwjReUnDqeECXn6MMl0Yrx4V3/p0oKbHkr95Ow2pbl5E4ilZRdE+IFgSA8dJXKYGXulr
	acSrgNGVCXE90v3S4xpcn1wZyyebyXyGUrSK+6dAdgFdDQidnzSuC5uXgPf59SUbO7oZeXf0JAX
	iM7RcR61Alqmd0qnDsnMyb2q/fKttlLRgAUC1rQv1A6gSUkLrlyrSqq7BdDP3l/9TvI1IWe3Eyy
	tn+ZX584msGBDo=
X-Received: by 2002:a05:6000:2995:20b0:43d:1d3a:b60a with SMTP id ffacd0b85a97d-449403aa04bmr1985624f8f.7.1777563894613;
        Thu, 30 Apr 2026 08:44:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-449c576d0a2sm3615047f8f.31.2026.04.30.08.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:44:54 -0700 (PDT)
Message-ID: <3f8d63a3-e39e-48f9-a0d0-517be7c05498@6wind.com>
Date: Thu, 30 Apr 2026 17:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [RFC PATCH net-next 0/3] netns: optionally inherit IPv4 TCP
 sysctls from old net
To: nmreadelf <kong414@outlook.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
 dsahern@kernel.org
Cc: horms@kernel.org, chia-yu.chang@nokia-bell-labs.com, idosch@nvidia.com,
 ij@kernel.org, brauner@kernel.org, jack@suse.cz, kuniyu@google.com,
 jlayton@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lance.yang@linux.dev, leon.hwang@linux.dev
References: <TY7PR01MB172057C053E8D550485A29A08E0352@TY7PR01MB17205.jpnprd01.prod.outlook.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <TY7PR01MB172057C053E8D550485A29A08E0352@TY7PR01MB17205.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 30/04/2026 à 03:30, nmreadelf a écrit :
> a new network namespace starts with built-in TCP defaults.
> In container-heavy setups, operators often tune TCP sysctls in init_net and then
> need to re-apply the same values for each new netns.
> 
> This series adds an opt-in mechanism to initialize per-netns IPv4 TCP sysctl
> settings from init_net at netns creation time.
> 
> Behavior:
> 
> Default is unchanged.
> When net.ipv4.netns_inherit_tcp_sysctls=1, new netns inherit
> TCP sysctl from old_net.

There is the same kind of sysctl for net.{ipv4,ipv6}.conf.{all,default}.*:
net.core.devconf_inherit_init_net.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/sysctl/net.rst#n401

I'm not sure if it's acceptable to use this existing entry to control the TCP
sysctl.
At least, putting the new one in the same place + using the same template for
the name + the same values would be nice. Something like
net.core.tcp_inherit_init_net.

Regards,
Nicolas
