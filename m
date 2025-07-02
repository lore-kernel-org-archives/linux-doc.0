Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B562D3751
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469287; cv=none; b=M70EP7Qhh2QWRMUzVrfaThcgZ5SU3mQRNJajuaw2An4XksRBY83VswHyP1s/uudbeC7w/jsrAiQ5EMeaoE61F/rsHOE3ZoJETZkzFV2G1aUUIr7NjqO5blWDqPIg6pwozPlhkwHzZRO3QPiWn0W/se6GF6ARfL3JNS+1KZMIbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469287; c=relaxed/simple;
	bh=yaVBx55pkpJNbZV76DxOYDdkdg83DTB4UJfRN30uAUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FE5xQc1aejsIMs0KL89poq3sSxlfz2vcAmk28mgycwLN+yYvAQvbVopYhqOESxfBVtouDeBscs0TidS3RBSSapVKOlY7uTVmlyq/5Qwl4JdoveX1UsmcK9L/5zO6/9dfTSa/6aSneI27i/dxEq2MV/hgmnbX0k7abkcphGv1biw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=hgj7CF5X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="hgj7CF5X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45364971d62so1103265e9.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751469284; x=1752074084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UEoVGeWwa967fvIBUVo89T5bXVjlB0iBy8jqhf/tJrs=;
        b=hgj7CF5XM/KkjRz2zeqbsKGjecfDV6rgAUAqvMUjJnQQ+Ik20mq+aMIMnhmeF9ynPv
         hqk76fVLs8p8tzlUIz0j0x0V9jpFxxjtNAgs7mxVfhlJfHZWmh2q39ZX7DjZlB1QtvfQ
         UJSioHVgOc9HvQngqscbJPXWrX0YH/nDJ176Xo67USXuuh9HStoiusVBrd5b8UoJwHku
         8Vvw0xXYvUVgO+xPQYxPfqB2TeeqxVS74IVo/CnQpliuTsRvGQ/QrMNaWNampRPB7jhQ
         dVU6kP9eegKJF+iGo91AyWJ4nV5Y3IoyIzHZ46K5WHkpGiib3+HmVx/TzPjSPQVizJ6D
         iYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751469284; x=1752074084;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEoVGeWwa967fvIBUVo89T5bXVjlB0iBy8jqhf/tJrs=;
        b=COosS33ecgKtGmG9tleOIqz03fn2ev4OTL2TyyDyTI02rNqsQKthARk4XYynJQHBiS
         AbHWL+Uulmgv29kP/pyFlymAMVYZbLf9Q9jDA0/po7iNLTQ581DwEbQlo02fJTYjOpk8
         5tMCgPmfQ+V5dFP6PNkZjJcg4YIXTEI4RJRktJa9kmzz6f/FOa4yU6mZrEQ3lod+Cbo9
         PukYuLlD7Q8Cd7o06GZ7hat87N5HRqDECG/PnzIM43bed13uY7ftD78LndHisjs1qMDV
         ll1QOwREKTWnnQMzN8WIUJ4OaPEmmol2s1AVC0A0q5r8uNn3zCIH9MS44KepZjW1+AnL
         dweg==
X-Forwarded-Encrypted: i=1; AJvYcCX7PjJaEj9GkhH9XwqOb7YvB1sldfABMyY3K3vQ3LiEoH82zQpwIRuv40GaWbvzutNP20R9pxZN6a8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVN5fF73PsBYZHZM76nCg7dJ7VfwIt5gFMlpfcsBit2YMGnoWS
	CruTxjs8ovKLUxGpB5UfzNwE0OMtIh2JNbCdL7pGj+zNY45FjjeqKxY4wZglObk+clI=
X-Gm-Gg: ASbGncs9AgzgbTwvdsjVzr2uGQtQqQWPE2DrZmwOkwkPx5BIZmY7ocUrMHRnQwwkc5F
	E9MAaQSWTVu4MdSJp/8wSx38gabNAa+T5AfnKRDwmGofS4Zs30jhqEwyWDMm8iAvx2Lx377PK2J
	x3xhSw4mBfEE+D+Fjt3gS7LLDZwXhDJh8zZe/b86CKbTr958kyiv37IOusEJBk5pmmvs9bEzMDX
	8DBNA/LwZA5wZIWlEdVCRMQfM/2DZIyoiPDvyUqdAKatVjXcML2EzjwxxEqtCeRPea/9sZZUUD8
	CGYlr2o6FguPx2xxCLLz6RcKHLivx72I56r1N62I385q1YrCGHmW/x/yCk9kXgw6WN5k9B31kJk
	VSbG6e8Y2Z0BsUaNiI865VIKHKFDtxi/itNLA4dTaQY9WS198EA==
X-Google-Smtp-Source: AGHT+IFuleqdyS0khXY7Uz8FGznztsWK0eHC3JXALUeyVBqdO7v0cvafSoEuAYV4iYOGyHxNKvOhVQ==
X-Received: by 2002:a05:600c:8685:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-454a4ebf6e5mr7212645e9.6.1751469284075;
        Wed, 02 Jul 2025 08:14:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:5568:c43d:79bc:c2ec? ([2a01:e0a:b41:c160:5568:c43d:79bc:c2ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e78e8sm16736852f8f.19.2025.07.02.08.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:14:43 -0700 (PDT)
Message-ID: <7c47cfb6-c1f1-42a1-8137-37f8f03fa970@6wind.com>
Date: Wed, 2 Jul 2025 17:14:42 +0200
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
To: Jakub Kicinski <kuba@kernel.org>, Gabriel Goller <g.goller@proxmox.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702074619.139031-1-g.goller@proxmox.com>
 <20250702073458.3294b431@kernel.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20250702073458.3294b431@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 02/07/2025 à 16:34, Jakub Kicinski a écrit :
> On Wed,  2 Jul 2025 09:46:18 +0200 Gabriel Goller wrote:
>> It is currently impossible to enable ipv6 forwarding on a per-interface
>> basis like in ipv4. To enable forwarding on an ipv6 interface we need to
>> enable it on all interfaces and disable it on the other interfaces using
>> a netfilter rule. This is especially cumbersome if you have lots of
>> interface and only want to enable forwarding on a few. According to the
>> sysctl docs [0] the `net.ipv6.conf.all.forwarding` enables forwarding
>> for all interfaces, while the interface-specific
>> `net.ipv6.conf.<interface>.forwarding` configures the interface
>> Host/Router configuration.
>>
>> Introduce a new sysctl flag `force_forwarding`, which can be set on every
>> interface. The ip6_forwarding function will then check if the global
>> forwarding flag OR the force_forwarding flag is active and forward the
>> packet.
> 
> Should we invert the polarity? It appears that the condition below only
> let's this setting _disable_ forwarding. IMO calling it "force" suggests
> to the user that it will force it to be enabled.
Not sure to follow you. When force_forwarding is set to 1 the forwarding is
always enabled.

sysctl | all.forwarding | iface.force_forwarding | packet processing from iface
       |      0         |           0            |        no forward
       |      0         |           1            |         forward
       |      1         |           0            |         forward
       |      1         |           1            |         forward

> 
> Nicolas, how do you feel about asking for a selftest here? 
> The functionality is fairly trivial from datapath PoV, but feels odd 
> to merge uAPI these days without a selftest..
No problem, let's do it right.
