Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0688E2E8DFD
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893238; cv=none; b=f4tYYBydu9M5NKsi2xHqd4UjiZqU5tKkNZwbNFWtsKhHcg8agD3qB6yqLYTGKBFHVKCYa+gG3SKyNb/fOSpIB2IcwDvpTiM3C66IriFvO99mXcVMmhdLOOlaIwEronwLqL46zamW+CsWeF405tzZLJ9Um8yXnC7JmTI5D/TcmIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893238; c=relaxed/simple;
	bh=UuWs+AQcfzSvQQdbCVIUO6Cvk23u2TuuOA7e50MTg8c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TBpmDQUuVLoTcYObE4V/3l5qg85VqPOudl4YwRQJAI38xs3UrTHAXKnVVfh4/y3g5WefS53AixXI+aJcXNSh1IyI9vSFjgYYNrDNnXgrmk0sdBz85kozq15HPl05cM4juvVlDO+pEJ7HZfBfojTf1UrWqjela5Uaet6WjTzmL1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=RJaQyy+t; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="RJaQyy+t"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so4137367e87.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Sep 2025 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1756893235; x=1757498035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=of/TMza8DXLLcw13zP+oJVY9jz+//j+5z/HCt2Y3hqw=;
        b=RJaQyy+td0dFRDZuc22Rn4xSzHSz38KAZPPceV2xS4PnOmtXBVwkpl420IIMpBycAN
         qcxxJlVPR6n+RaemzYd6KPGZw3AhhL3/4NwYMha3s4aR0JyjCW3R6+5ajQ4v34USjLYi
         MUsVnZdMcXRR8CIXPbhARim+vna+qkObdzJ3Vd1+nlu5zIvIkIxg9uQUshW3Y8+X54bt
         gYBaLwSOXUK+9EBJ21okaUaV/OjIGXm7bh5ddnRfDlQjSlELxAyhg0EJg9lpQ0cVmk8X
         /U/z8nKzxu6r/lNNFsVAwT+T9Whxsi6wNeW5w0mbXANTgAgCNNC+AapPe9AVnHrLwHzg
         XR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893235; x=1757498035;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=of/TMza8DXLLcw13zP+oJVY9jz+//j+5z/HCt2Y3hqw=;
        b=KAwgrtmnBy8tr+gEUvTWkwHaDW8JLCJMn4B8Ki1WSdAsw/elagFIZSEDO36ZIGTvQ0
         y06WKi/bdS2PzBsPzNdJHBBpKvCyO7Bgjgmr4AwvOwpZPqF+nTk89RNwfPS1xIwBHWI1
         831fqasRrxMBHrQ+KJ1c0FhvfyBs4F8jgDPxdNtBE6w/ePv9975El193SjQoidAtjBX1
         W4YuEBRyA5IWBDr+IhcAzJorymhJJA84PokODYK9msoi0sIJAl+/m//MOBGFD+ARnrD8
         jeaiKI70zNM0gR4bJX/UFZ3L5KG/Otgz0Cto91/xlG+NEKvsFUqKSYha7/WtvuO5fYvB
         sLtg==
X-Forwarded-Encrypted: i=1; AJvYcCX/kA8mC4vJg0q/kOuDSB19jVfOgplDdVDpfCP+S0OVylktqeWDIZOgBhlx2WPwKIU81oQgl/k1qqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuadDu+gX6ubr7ETnM8YfFCa3Ja4zNxmyWuYts6mG32dMFCMmw
	cLk5DPThP7EumLekO9xKeMYL3FQffs1HpaLltKIMvoBEyoVRptQ2i01rdbhmA98VMso=
X-Gm-Gg: ASbGncsJEsgOmm+ZZjXhFkxBBwjCRmJJ/WEtD7jDK3AtLrSd8Dj2GY2yPn6tsrh7lQN
	LIl0zlpxvtIdXSqHKvDZgGSBzkMnYzOGKMqkYA2KuddkHuN+JlJhBHEdVWKwOPA/IkmDNlY6AGn
	EKHZ+k95ZfAXhy9ycGjZLMwglVv8VHL6kDLfedSWovEI/O/f7BsC/P1zmrXvTr++recONrGYv6i
	Z+QVozSsaLuhMxBTFNqqasL1D7yvV46Mn1Zk4cbp+EpKfLyluj/vb0YYMVTCaYwYjAVbIF4zOs1
	byL9UpUWBT4F4takb4GMrmyKv4wlknuezt/S2hlNvu1UMI/mQcdz6HZdgn7xy71SQkrVAI5zf3k
	zxGUgKxnq0tbhWRefUiMg6stZanrfB+/CMtRSBhD8xxcBeDqsRjIFfCxK+rUSRNQ5+/g=
X-Google-Smtp-Source: AGHT+IG48x+ooORPlfTQpo60UY/5/CTgUJh9KKBR2i4ALQZzGLl8WyJZYd2JL/ViVeH+1jRNB818Yw==
X-Received: by 2002:a05:6512:4020:b0:55f:5c3f:474 with SMTP id 2adb3069b0e04-55f708b18d2mr4931403e87.16.1756893234703;
        Wed, 03 Sep 2025 02:53:54 -0700 (PDT)
Received: from [100.115.92.205] (176.111.185.210.kyiv.nat.volia.net. [176.111.185.210])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfcd0bsm411249e87.106.2025.09.03.02.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:53:54 -0700 (PDT)
Message-ID: <8e40b97a-ceeb-4f0a-87cf-801520217916@blackwall.org>
Date: Wed, 3 Sep 2025 12:53:52 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] bonding: Remove support for use_carrier
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Stanislav Fomichev <stfomichev@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 linux-doc@vger.kernel.org
References: <2029487.1756512517@famine> <aLcXNO6ginmuiBOw@mini-arch>
 <810b9e10-9bc5-4fe3-a4a4-f45c6c13b8b4@blackwall.org>
Content-Language: en-US
In-Reply-To: <810b9e10-9bc5-4fe3-a4a4-f45c6c13b8b4@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/3/25 12:50, Nikolay Aleksandrov wrote:
> On 9/2/25 19:11, Stanislav Fomichev wrote:
>> On 08/29, Jay Vosburgh wrote:
[snip]
>>>       return 0;
>>
>> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
>>
>> nit: any reason not to return -EINVAL here when the new value is not "1"?
>> You do it for the module param, but not for the sysfs file here.
>>
> 
> bond options code already returns EINVAL for values not described in the option's value
> table, after Jay removed "0" from there it should automatically cause -EINVAL to be returned
> 
> 

Still fixing email problems, I see now that this is an old thread.
Please ignore my reply, sorry for the noise!

Cheers,
  Nik
