Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F80367B82
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846664; cv=none; b=J+t09rX9f1sS+IPSd7BOpQsiyA6LUEZb4UuhaK30HTJz5nmTC3h4m1uLVYK0XSdj5CGslMaa0jg8mHw9U2knSVG3GfEWrYzhTL+0++hUwnM/xBRfn7y+C2whMcig/LfqL/7sML9xTr2ZMdjb3ePIiQiuobYXnP64PvDMYpNFdiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846664; c=relaxed/simple;
	bh=+iRc0KXxkbXguWVThGJM5lnYBxH6dCy4DIlD/DoU4G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbzQAq5s/wyZnrElfVme16/e69AD6MCn/MhKihl0E25jieGbmIGKYmwrqzOx+yMuTAmAozxIgRHH7M2huShYKO379Zg1vEB8JynMe01qXd/VsMp/mQmauDvxfi8RKLh80XUeVcB0rAcnYwZyQdTs6mlRFOagCeRolOk4g/yVXEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1JpLfEB; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1JpLfEB"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1384ebe7a10so8748178c88.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782846663; x=1783451463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Pb6EgwOhUOW9mey+1XzyhsjFFsvwyaC6pGLNvcAjI=;
        b=i1JpLfEBEnCqwPEed1Uz2NEEAKiBpUpdJsgZVnN2bPS95UH5O+6C7XeoXpON7Bdagr
         zQKyK+SkMiK/eYcNaK5HkKZgdwGjx3Y26OWw94qlLhdtJZzjufkHjVAfVgHCl2T3MQ61
         wz+YREq9PFxmdp7ViDAbXhNu2P2beUgyeo+DthiZNqcMGeLXZ4EZpMuJa5M9MhvcEiEa
         VX+Ih/qbygMtz1W+NYQ/cbkV+6ej0dO5W9GBKkgK2N3I91ySPEkFgrhZl2+s8jvAobsd
         jTryLnL7eWaHOWaOh+MiFZcaAqf/FG6bCuDc4xIha9sEnjpu1AjDwYamBPkNaKB/41Pi
         OQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846663; x=1783451463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9Pb6EgwOhUOW9mey+1XzyhsjFFsvwyaC6pGLNvcAjI=;
        b=GfUEMXt9D2ohyqdVF0k/T2vJHeNfzGDlAaW6nwZUGjEHQMiyQwcbuNE1BjVT4LtBrl
         zAXGWc0DNPtsyjrdsUJb0MiU+3fDJAg352rIqp4b40X8q2sun/OEJjr3Grji3IBvi3xI
         Q9fFkt8pVpW4vU6uBk+HNScF0tj/rmNjl7FEG8zBCE0y+PvE8DeZho6iG8N0xfwHv7NF
         7SXIzVmML7u+Z3rwAy15HXXrSvDivVOJVRV7YmuB2lO3C+MeZdwNbqcx4noLS53qCTS7
         ozMupJZrxEPF5WibFaaNwQv1+Wojw2IMgBv8uLqox+gF97bLhtt/ytbrwaVGg9RQh9RI
         /ubA==
X-Forwarded-Encrypted: i=1; AFNElJ/sdOT6S+t+4Jr6nYySavdiGWMsOtl/xHOE7YimsUF66ia3kXYNtTvqjKZz6ZL9eYnte/L1Cw5NTWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7fxL6q65iHcB7ugJ+VeycKEBC4371VAFy5WgywwcEp3cjoS+d
	TPN9qgFMkS+u/x0x8NzjHKlKKUfZOsMqwqxdXVRIz7dCsoKBlqy+Aek2
X-Gm-Gg: AfdE7cnp6lowYY2niWfhOL3lwCpXtZIaJCDrYfF0KA+vJCe3M2R8vwLuIQ/1gxYx55A
	DSVrBXPwBZvkmAuCejKLFVWfSvp/JaiSwS75Yde56d0GJH6Bu88JsFAGoRU2I5wQTsHITljlpBQ
	9zTJlYwr9Sr/atMyfJrYdhRhxrTwraCuxTZ8ENYgPidi3s+C+4ECLlcoEHsIK/948Lt/nbj1VxW
	HuSSFZCUeg5/eiSjvdJRAEBiZieyEO3lecopsD3myFNWtrrjCbmlaHPakeaPwN8sXjIzKYZTdqL
	HQIgqihO6MfaPtgSEwzWUKKoIiy0tLPb/DQGMcufv4N+4DrpTCsUEyP10siClsDPiwoZvOXgA+x
	SgewpZ1Yx2rR+Ab9arqTYA+eNaVVgmNCK4dCVQdF6G1q2zSyCgWrktPasISi5aqSqQ7qwkNtojp
	rgH5NM4yEqIv6eA5hrJ9KoYLhlaws25tsFBjKKAIfsgxq0vkICOYhE+KM5Dgl0IH+8CopNxquc
X-Received: by 2002:a05:7022:48d:b0:127:33e0:ea44 with SMTP id a92af1059eb24-13b2a1b01bfmr3021449c88.29.1782846662495;
        Tue, 30 Jun 2026 12:11:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abcd5edsm14491264c88.15.2026.06.30.12.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 12:11:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a764b97f-39bc-49fc-972f-e345de5a8446@roeck-us.net>
Date: Tue, 30 Jun 2026 12:11:00 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: dev: convert to kernel-doc comments
To: Manuel Ebner <manuelebner@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260529212024.2119204-1-rdunlap@infradead.org>
 <20260529212024.2119204-6-rdunlap@infradead.org>
 <6edf96b1cc0ead6654b23f2d2b74353cbed621f7.camel@mailbox.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6edf96b1cc0ead6654b23f2d2b74353cbed621f7.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/26 11:54, Manuel Ebner wrote:
> On Fri, 2026-05-29 at 14:20 -0700, Randy Dunlap wrote:
>> [...]
>>
>> @@ -659,7 +659,7 @@ __ATTRIBUTE_GROUPS(wdt);
>>   #define wdt_groups	NULL
>>   #endif
>>   
>> -/*
>> +/**
>>    * watchdog_ioctl_op - call the watchdog drivers ioctl op if defined
> 
> Maybe this is better:
>    * watchdog_ioctl_op - call the watchdog drivers ioctl operation if defined
>   
>> [...]
>> @@ -732,7 +732,7 @@ static ssize_t watchdog_write(struct fil
>>   	return len;
>>   }
>>   
>> -/*
>> +/**
>>    * watchdog_ioctl - handle the different ioctl's for the watchdog device
> 
> I think it's plural:
>    * watchdog_ioctl - handle the different ioctls for the watchdog device
> 
>>    * @file:	File handle to the device
>>    * @cmd:	Watchdog command
> 

This patch is in the upstream kernel. You are a bit late.
Also, the scope of the patch was not to fix the text but
to convert function comments to kernel-doc format.

Please feel free to submit textual changes as separate patches.

Thanks,
Guenter

