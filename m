Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C62248BB
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824815; cv=none; b=IiODp1P53mu0jpwoYQlZEssBWrzsoPG349XW0Ha+oXzFC26Y1BsulZhUftFYITk8znLUgeLa7M3N5N1P9Kb+CUi3pL7IgQOAPOhU/D45kmEfpux/QMO/CojLJEMmufvj0lI7DcpPQFAT0EG0EdTO90ZgXbtOdvrO7PPonturffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824815; c=relaxed/simple;
	bh=QFOprhmkYAckDmLpj8OaQpl0QIRArOwxk2YuENHmzqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWlOQAMy909A9kM23fut2WfuCgSs814zQTSkbZ02dCG5BVNJfJJjNx0zNGU9NbtLSDcDfSnDzZEiGbGeCJhYt0Z/lfUG6Tc5EwHGxHlRgfZQlwnKEFhpIvG/R5rFN4XbPGfHTVyU7GbDmtz2jDLjcbDa/HsfoHSn0L0c0+0waUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=F0mlw8j/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="F0mlw8j/"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9c3ef6849so996075a91.3
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2025 22:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738824813; x=1739429613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfPzJgqGwInu62D/JbABqcLSTAUY1ivE7x32/lUlB+s=;
        b=F0mlw8j/AG0MKEBcdJHMFfXXcLJ0ZHP9/2K6J65yteNpK+qdNKxi18sDLlaF6onQnk
         7c70gicAMlBwDxssr+lPqXbLewbQ61RYZzGZA9AY1cZ3ojHEeFqPVvWp2W6wq6PdJ2bE
         dhHzIGyD5t5vvHpYQ2LULeZ9rPFAIDAly6LNqJ5wLvylIZqJcjCrNgEQhbCKjwhNjzji
         MMKSGqxhTzGYnejgMhOTdphd7HLFgxNBm+LPWbpTPy2vL60I1iVcWsL+XvNdoH43xudi
         lGe7fCgaaruH+etviHr/ZmC0t4qH7k5F/h9dOxCCLMbehoxwPncy/r7dWoQ1vnfqnb7E
         DR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738824813; x=1739429613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfPzJgqGwInu62D/JbABqcLSTAUY1ivE7x32/lUlB+s=;
        b=sbCTo24Hp4I+GaDlOY2AkR80K6IGz6LFbHuaaP1Xpk8jdecSS1/Fnt9VU7EdcLrn8B
         eZgJqKyUMUUQfL8ZGeXrSKcYIpg+qiOyPRbRuDpCKdLkUoOWtmDqpYOtoa3pEKCBHIwi
         a4EEAaw6JRqMYfKwFkFYjSjXoRoL9d+vHTLzUxQ0xi+9cSA/sD8xFTWGGZiPRHEJmehx
         4FuvwVPrfP5hGzemPIWBkjIvm69UkOYod13ukl3Fm0L5L1YrE/sgXiJWZjlW33NiRgiX
         Ce6IQ1U9tRAll/OqxNFTZkKADbLrTu3AANaOI0FIRINXS6IQuWdbd/I7xtVXYTk0QzNP
         pQCw==
X-Forwarded-Encrypted: i=1; AJvYcCU3fsVUJ6VdA+r6KWne93tH1QC8pk5WgVSrunOypNvzUy2Ql5frDM+UzwMHSn/3Mbw9p3ZsGHiqXzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIiMRjzDtiG+olS+GYHBVwAmxb7HvLNGOPkT53JLCqh7erW6W
	4vAuc4pI945PC3szj9tzzZqdNHTos5KriIS4F4vhEHxEy+Aa9cUxpZJ6oZwfASE=
X-Gm-Gg: ASbGncuuQ0OejWFxefq+4rh9cLoJ9E1XgrifZ2QAskrtIN5j9F0R1+G5m2ScaQoNNaV
	TDj44yuCh05lE077i08M4yAFqazu7CUN3NBoFvjYb0fzBMLXzGRWz6XYPeWmh6f2BNYLtaG6wtf
	6isx1ALsOlq3rYmll32qWjcn1K04YMNC4XM7chXdqj2pEd3uvJ1Ssy6nCA1T8gGALQPSlnTr4q1
	0kjxaaDEWZmRR5myXmAod1ynd3foTmiCBf5TgkeJmx4KUZ6eybbWjKzRYAr4QnubDqgPWjPM9dD
	/oseq3JB9ksaXPhnLQLQVqCl1v08
X-Google-Smtp-Source: AGHT+IER8psjFE80ifTWvoXn5WHFoV2OjIRpn8B020yOLPR0qnk21Bx82Mdy+x+4gwZSwLApBeX7OA==
X-Received: by 2002:a17:90b:2d8e:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f9e0767573mr10783588a91.12.1738824813210;
        Wed, 05 Feb 2025 22:53:33 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1e24559sm2800958a91.31.2025.02.05.22.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 22:53:32 -0800 (PST)
Message-ID: <12dbfa5e-32cc-4355-89e4-6c1cd4e12d1a@daynix.com>
Date: Thu, 6 Feb 2025 15:53:26 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/7] tun: Refactor CONFIG_TUN_VNET_CROSS_LE
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jason Wang <jasowang@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
Cc: Willem de Bruijn <willemb@google.com>
References: <20250205-tun-v5-0-15d0b32e87fa@daynix.com>
 <20250205-tun-v5-1-15d0b32e87fa@daynix.com>
 <67a3d2efbba32_170d392944d@willemb.c.googlers.com.notmuch>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <67a3d2efbba32_170d392944d@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/02/06 6:06, Willem de Bruijn wrote:
> Akihiko Odaki wrote:
>> Check IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) to save some lines and make
>> future changes easier.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Reviewed-by: Willem de Bruijn <willemb@google.com>
>> ---
>>   drivers/net/tun.c | 26 ++++++++------------------
>>   1 file changed, 8 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
>> index e816aaba8e5f2ed06f8832f79553b6c976e75bb8..452fc5104260fe7ff5fdd5cedc5d2647cbe35c79 100644
>> --- a/drivers/net/tun.c
>> +++ b/drivers/net/tun.c
>> @@ -298,10 +298,10 @@ static bool tun_napi_frags_enabled(const struct tun_file *tfile)
>>   	return tfile->napi_frags_enabled;
>>   }
>>   
>> -#ifdef CONFIG_TUN_VNET_CROSS_LE
>>   static inline bool tun_legacy_is_little_endian(struct tun_struct *tun)
>>   {
>> -	return tun->flags & TUN_VNET_BE ? false :
>> +	return !(IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) &&
>> +		 (tun->flags & TUN_VNET_BE)) &&
>>   		virtio_legacy_is_little_endian();
> 
> Since I have other comments to the series:
> 
> Can we make this a bit simpler to the reader, by splitting the test:
> 
>      if (IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) && tun->flags & TUN_VNET_BE)
>              return false;
> 
>      return virtio_legacy_is_little_endian();
> 

I kept all in one expression to show how different variables are reduced 
into one bool value, but I agree it is too complicated.

I'm adding a new variable to simplify this. The return statement will 
look like: return !be && virtio_legacy_is_little_endian();

It means: for tun, whether the legacy format is in little endian will be 
determined from the tun-specific big-endian flag and the virtio's common 
logic.
