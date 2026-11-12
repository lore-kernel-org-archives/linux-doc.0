Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500816;
	b=2PFB3ZYEbQcgD6MwhpfN1aUSkQVLMbFhRVxGJBCgLkS6JAPhsJ8Xx7KjmA5O11UVEzpT
	 ODmRq+iqXTEDjXhre7Ai8a0tGQ24PAmUy31odbt27bvNbK1AmRa5E05oy2leFwfaXztvR
	 dT5OMiJ6UyyFDBj4DSH6UqTbBo5QtsbPSZCsi61wJwksqM7ua2MCXxGUMvXtfPBmF/p6T
	 LUPXsvZKErVhDIYSXTZ+6cyKqVUTL0y0tIwrZJLzdYSyxFW95FhPVemjWS15A40OGhGpR
	 YSJVqd/wX6aXupupwUhbKUt8RssOOMDQIXpPiBCn4Amk89wiN/VA1MZIiPQL/uxcjuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
	b=4SH9bz4/NOcyiKaG8Sex5/jjcXGRx4NFZdrkNAxbSqmwnfo02ijWlyJNx06Hg4Vi4zFJ
	 +NqquSKklljAhPOYOmIRyvpI/psrY/PtLfwFgpeX5qqzl8nUw0FhDN2m7d8e9ZZyVv6j1
	 tzdxnN8Ke+xfG84BfBo2gCnf9TI2GKUuJIXiMufIgpsFaDOC3/AXyf9b4zllpMi1t2B7x
	 mZkHaqIUtPOEqyejt/i75ggO/OxdWLTUYsqRGlX3Ii6iInudiJjIy7pnjmYqc96y6X3bh
	 J+gk/n4SPGbjzFK1gqmmhonBv0J1lOlwwiTEEjTkUtkun7Q6JYusBU8xePj937vICIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b="EtFg/kC9";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB234606A88B
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB234606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=EtFg/kC9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so2859795e9.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794500814; x=1795105614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
        b=EtFg/kC9y1DirVvA9yLbTRagqhSjkLk6ziYDwHAP1xD7Xmb6LsmwWC8mOetg+tDeZh
         xWqqP6oEWPZigH9h1x3dDWabH29oHWXXy8GyR9+grcWK9NGsuRdMLxx+2jW5MXAnBZ+b
         H/lsp0vaUjFdhS/GF2SD93gAx8GKeho3HqXqonlGauq2eoZZ/MrWpHCfCZ3KE4KEYOUt
         fqiTFrUhHUh8TyyYD+ozgnb4Vl8qqidvow3BWLG4cR49WWZCTr/lQPU+eMqBNf3k50R3
         sT9Nx29c5j6NPlP/T/8cZnAXmYTOw+p/EfAeODvgcT6FR3gbNvbFp0tzEYIJwXmERdqj
         v7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500814; x=1795105614;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
        b=kwIW03lWV84v1A0aK6PjxpoWu49AXyRXtvwAh2e9azW3LXN3J/oIT757OKB26JaMwV
         VRW3UIcNoJu2jOpOQQ01WSkEIUR0ag1OfUqAjPidC5ZFrnV31m7sc+ZtBz3J0zowdSp9
         /Tb8uI7psKta/7DyZT/4yH5F7fzfU3JYt9Gw2K8jOgm1/6OKNpr0t9E++aK6sKgDA94r
         M6AkTRg9BaUUj1br7jUidGhaQV7gg/7Edrcyx5VitEWDgX21SCBkxoLJYxNP0+BL8BOv
         3G4Pj/u1Nfl78pbcPvRWxTx+iP+5y4Vqqko0i0j8MbhmRRtFlDq9hgO/PcxOjAWHy/gP
         +0LA==
X-Forwarded-Encrypted: i=1; AL+hErFgL2cw7qCjWiOk2b6WF/YiRb0nAxSyOZc6ZztyM4ILE++7x/XMXncTVz/Wq3q2399RnjH/3kUjGZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XM7ruRtx7SPOlQcsU2Qsy8A/Pw+JmfehxaU3K/E6ncyLtvegh
	odo3lOJtVbHma1rWyUNrqjvMphnZIE9eklN+vYBmrps+b10QkGlPEJBUFy+ICDbxiwQ=
X-Gm-Gg: AYBFou3Fmn3pIsLA9p2x7QqWLL2i1E+sJvHZCkpbkfLOpebS31is8O7q1b7A1PldNxr
	L/FeNAo3B6U+cgWQsRdFhdzendzxp5WTbQeB0JKlHwZYJ8KAsMCCm7jHdxWMYevECJU2GuUn9hw
	Ih7aH1zzqdwW8lmxtyZjDMRF4n/rTjvomOGqxF4opPHDPrGuMmkc73RJAbt/i3WUxn+61WrTkL6
	oGFnLiOXFCtL2iYOJgOy1TPfLm6m/QuSvcwrtEklm95Upidtr0SqqSgkM565Z03+DgrCG8iIJjB
	od7On5sLZKwtStK1n4QkEta2mfo6Xx8veZV9keo/0PG8K5TCpsNlxRwK4m0X73SyhCaMzNU//Vr
	K2kwdlILUqVY8YoGzivJPqb4h30TL3cvTfu6Rs7XlBwBMiFi8IYlT1ad3XAoviEdBeK41a669Yl
	fOGVvhxfAdmB9b2OjkLm5MvEW/zhjJunZjM+6udXjkoWjU6jri+KF4GXfLk5wkMKWJXm20Xa6IB
	NET/BEtlITlY3tQOcqbb2l63f1H4PbEZI/PQW/MpfPBzgw4DQ2VvhDela+VjOPLo5YwKBOZe25a
	SPnmFgmWqh8fxRIdebZWzzS7tOs9x1gLQxoRQUI9+fdnCukAz5rc/a9Y5KIWn+UNw7S24aE4nkp
	HOkl1kg==
X-Received: by 2002:a05:6000:1788:b0:490:540:f95f with SMTP id ffacd0b85a97d-499c92284d1mr12368002f8f.5.1794500814316;
        Thu, 12 Nov 2026 08:26:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm84484f8f.41.2026.11.12.08.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:26:53 -0800 (PST)
Message-ID: <bac47e7d-2982-47db-bf97-d8c1d832704f@6wind.com>
Date: Thu, 12 Nov 2026 17:26:53 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next] ipv6: always apply all.force_forwarding to every
 interface
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 12/11/2026 à 14:41, Gabriel Goller a écrit :
> Currently, writing to all.force_forwarding updates the interfaces
> only if the value stored in all.force_forwarding changes. Setting an
> interface to a different value and then writing the same value to all
> leaves that interface unchanged:
> 
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl -wq net.ipv6.conf.dummy1.force_forwarding=0
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl net.ipv6.conf.dummy1.force_forwarding
>   net.ipv6.conf.dummy1.force_forwarding = 0
> 
> Apply every write to all.force_forwarding to all interfaces, even when
> its stored value is unchanged, matching all.forwarding. In the example,
> the final write to all now sets dummy1.force_forwarding back to 1.
> 
> Also match forwarding's locking: take RTNL for every write and compare
> the old and new values under the lock, rather than returning early based
> on an unlocked comparison. Send netconf notifications only for actual
> value changes, including for default and per-interface writes.
> 
> Note that IPv4's forwarding does not behave like this, but we won't
> change that one and align force_forward to the IPv6 forwarding.
> 
> Fixes: f24987ef6959 ("ipv6: add `force_forwarding` sysctl to enable per-interface forwarding")
> Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
