Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D4E37FF6A
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 05:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776231671; cv=none; b=bEuIyEI35m9GB0tiUInWup+jBhcE8g5d1EMIslWuLmkJqREwCVlJgzNQzH3d0xOggCag4HRHjpaR80ZtvYQ5Al0sEtmRNJdQBlxZPddwy/rfUU9dtP/Wf22+gWW37rbCVkClC8+/XLbnVRNPjTQozAVDFg6gRSoB7Lm4iBqbFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776231671; c=relaxed/simple;
	bh=eCKwA+qiIqZQlfpRKzHylf5F6sp/2pJwdf1EC9B0u+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgdAcN6ELh18/7JsOwHVuY+Spxdz297dkFnxOfImHyDA729pwZlTpTpV07z2MCdmfqbOt9U17OsLa4P9SKZEUYVRjtltWk3YM8wWNeeeY4QWevDzCOuf2emnSqRWjBdbiU+pyKyZVrFf0EBUPcRv207kEHXe4BzPHa/vot3Qts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvFZqfAV; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvFZqfAV"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso4107489b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776231670; x=1776836470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuVV5te/UoQgVIHGlgzu/ETtLjtQKCtAInlwfOwxg8w=;
        b=IvFZqfAV0u8C0uYS9jKNSXCreVAWAAFQCZJX0tQgJDf8LcFHgAJIt6Z19sfS98Ad/A
         nB+0ACgV4lmQ2E8D8w4DBjZn5Q0NIngalv1ilTxKWUqtadFxw8IE2+M6TuDiYMTWXAib
         DIZszUgghkSocQH/LLY6Z19FednB+KIEkgQ6/giNb9Xvgpd4B6LMnVaVnQLRzjmRwGvF
         n6emK7gp0Scw4/lTknO+FgcfyC945VDnGvm16dd7OyXKcsFPurHogI/vPlCDpfp8iPAX
         Iyx2c6Ab3x7D7Pqa1LPdbwSfCnAGbSZfb73MPqrTEPokitgHGIy3M79MJvWFAAtzFvF2
         22Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776231670; x=1776836470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuVV5te/UoQgVIHGlgzu/ETtLjtQKCtAInlwfOwxg8w=;
        b=lwqg1EaWyEzcYtP0EvwIQXlalvcoY5UTqZORdsDjFDwwpQhNxQa0gOjcemC9ZdeTtE
         QNsG0j1B3BO8RgZAqqWp/slO675pf32fwbWxukPM/vQiSODt+7FUpgPUKH62QxKzfq4I
         mnA0w41YTv1Qvdnmwf8OzBT73+NeKWi/cn0mo285VE2QmcLgZaRB2suBWEaSZUBtB/h2
         ss0jeAjr1QyjRiWNGknN6260wj5ouDE5sH63ftO/yHdEyTM4EXGJfNr9sdLDvWyR+jbo
         PX4a3yQ/StVovcB8i+i5tx84kJ6Ilf8dMOPEiSSUFjXGdJE3MF2kLRENKQWNEoP1ccBT
         1Dnw==
X-Forwarded-Encrypted: i=1; AFNElJ8Y0k6IXAr2Ei7CEN9YUt0hcl6sKSjIJU7zIktKIQMJq71JXW5hSFbIqAtSim32YWnJz4ivaYvTyqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/guLJcGJL5t2V2jakQwpLWtBgyZ4zmfZ/xLyqWM4zL0b2bgm0
	RRoH7ZOseBlKSKxSwN2E+ZfqEAb5C+kfu1bXMsuuCWtasNw2hVAjTXrS
X-Gm-Gg: AeBDieuU6j9CE46CJF+W25I1CxJ0I9g7QhodmZS4oRnfhe5OFhgWvSDwvcCev/BZPpI
	zbyL4YHUZi8qN9zjYNOUdoBaCl4wqa4lHpq5HVkVfI8tmCn0a3BXJ6gazZk0QLEPLQOaDTyXw3U
	5uNkyuMIyJ6AEGzxlFpAd9VshSRxuaKfc0FNNX6mjpHLuGIJ6v15YHrKVOpGZLNiTG3b4EsMysN
	3C3vkTjlXDJznSOkOQakd+wmTcnJ5gUSBV6LvHP88jiD5qaqYE/bRvWUmA/bCDHnEzKeOhk0n/o
	YGCyplwyj6JH4GK15lhKOh1dH0CcsYr2AnloFJQnFk2pwSKzqXriXs5Q8KZ73XowRz5PL5vH1WF
	z9W5Fe7EaLIgpJaqVJ9UX0dQnKIhKpU+StsORUmRVXYX92wLhqcgCmLZ2d0Hv3QG74/t6hSAZRk
	Plfy89sSN1kaVfDYS3s6UiyE+HhSScJlP/58PrIuzEyCeBN84TlpDr5opBJFoXgHzuOetZ76NLM
	GwxwvqLSED+dCz7ahk5
X-Received: by 2002:a05:6a00:1947:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-82f0c1d9e1dmr19993166b3a.6.1776231669692;
        Tue, 14 Apr 2026 22:41:09 -0700 (PDT)
Received: from ?IPV6:2405:6e00:634:7891:2b45:7371:96b8:aba1? ([2405:6e00:634:7891:2b45:7371:96b8:aba1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67411135sm804502b3a.42.2026.04.14.22.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 22:41:09 -0700 (PDT)
Message-ID: <d525b70d-ada5-45a9-be5d-2377a1707aef@gmail.com>
Date: Wed, 15 Apr 2026 15:40:58 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC net-next 1/3] net/tls_sw: support randomized zero padding
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, "kuba@kernel.org"
 <kuba@kernel.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "dlemoal@kernel.org"
 <dlemoal@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "sd@queasysnail.net" <sd@queasysnail.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "horms@kernel.org" <horms@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20260309054837.2299732-2-wilfred.opensource@gmail.com>
 <20260309054837.2299732-3-wilfred.opensource@gmail.com>
 <abQOGm6BqAE5eEln@krikkit> <20260314073919.2f92b966@kernel.org>
 <9e9f6eb89ba95e9fbb764e2807420e98b566bf37.camel@wdc.com>
 <20260316180355.37d45785@kernel.org>
 <8f29d43fc1fd7e6feec4c24131eb2c0292a8c0fd.camel@wdc.com>
 <20260316183023.2fb38d84@kernel.org>
 <64cb821cc09226155059807cb0bcdbc51ae8d0d6.camel@wdc.com>
 <49513ee4347536e7c8419e9e65b8c619a8c665bb.camel@wdc.com>
Content-Language: en-US, en-ZM
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
In-Reply-To: <49513ee4347536e7c8419e9e65b8c619a8c665bb.camel@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> Sorry, I realized when i hit "send" that I phrased my previous
>>> message
>>> poorly. When I say "potential" I mean someone actually presenting a
>>> PoC
>>> and a CVE is issued for it. Have we seen any of those?
> In 2014 a group at UC Berkeley used HTTPS traffic analysis to identify:
>
> "individual pages in the same web-site with 90% accuracy, exposing
> personal details including medical conditions, financial and legal
> affairs and sexual orientation."
>
> They used machine learning to help and that was over 10 years ago. So I
> suspect modern day machine learning would make this even easier to do
> today.
>
> Obviously that is HTTP traffic, which is different to the NVMe-TCP
> traffic this series is targeting, but it does still seem like a real
> concern.
>
> They talk about a range of defences in the paper, with tradeoffs
> between all of them. But the linear defence seems like the one that is
> applicable here:
>
> "linear defense pads all packet sizes up to multiples of 128"
>
> The linear defence seems to reduce the Pan attack from 60% to around
> 25% and the BoG attack from 90% to around 60%.
>
> On top of that the
>
> "Burst defense offers greater protection, operating between the TCP
> layer and application layer to pad contiguous bursts of traffic up to 
> predefined thresholds uniquely determined for each website"
>
> Which to me sounds like the random padding proposed in this series
> would provide more protection then the basic linear padding used in the
> paper.
>
> To me analysing TLS traffic does seem like a plausible threat and
> something that randomised padding would help with. Leaving it up to
> userspace to decide based on their threat model seems like a good
> approach as well.
>
> 1: https://secml.cs.berkeley.edu/pets2014/
>
> Alistair

gentle ping. Are there any further thoughts on adding this support?

Wilfred

