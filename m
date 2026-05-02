Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBF1A6808
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777732347; cv=none; b=uLkrDVy6yg/fTGEJu15bgeiSbf4AvVMGSx2OoFt5c+jiZy2e9/Eo/yHR8m/dCjerkTuO+cyWiHDbqduy4vPHqgH1sXp6Q6M4IhtlYka4szGzMGPQvaWUheP0JeH2lU49Ih4svwtGcZq1Di1fGPvVYfNx4jCqG5yogzuoblETeRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777732347; c=relaxed/simple;
	bh=N/XPMInqv5OZa0Fvk2VTuDxWNnjkJZaKdeU93sEOsAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eETbVlqcbJ81GjJCVSEnyVsJeMpDyq/O1LJxsfk4zA10O8x2tRJRVy8VTVhzOwWgWi48hLucwQ+h82S1y61tG5ueUELD8XfqnGEQhRBH5tTR+vcDOB0haba54yOC6Q1fHs5d6DQ+TQL0Rqh4OLww/tE81wX//ZozZXS9pHwjlyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSqXWXEh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSqXWXEh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so455184166b.1
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777732345; x=1778337145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNukY4PmeCg7FKGx81K7eNPEaOWs4PcoTd8UP3BQrGc=;
        b=lSqXWXEh/oxOO38WZb03jhT8SzBlaDVYlrWJFv0T1vsOCRMEUSifXNem1TkVmseM0o
         amy0R9dB3IM7TMAu5nbQU4ZH7nUs4I8P1FFQ6Ij0Ffbzt4PF4g8HPK949wS7Sc/UuQZl
         uANw3NeBIxLBnhTFI64zfXzZOpuXtsWFqrCk/W8vzP9FqIbm9wW1uIcQaKVFhhB6H7ap
         Jdjr8qONgWLfVBlWqOqqLxbgAedozRcOhRaqWEJRRl7pcnD6vQ1Lh/+hXYNXL8ZieHbE
         ynwr7uEulSnMQnhYVjX3RKrvsAFQ5D3TiNOpcUehaylRCUETwRrhLtJ+2ZVuh+75q1si
         5gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777732345; x=1778337145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNukY4PmeCg7FKGx81K7eNPEaOWs4PcoTd8UP3BQrGc=;
        b=eMzQk22KiUFcFd8siYal0opBUrT5fbe237GTTfD4kuyxRq4vlgDkMpwVSewar4zNdM
         l4JH4A8ytc29rM/xczas9R3MxRO9morMGESVOEiABI+WpLDRDe4/hVvgBczo2qgay7Cs
         LtHMwX06Uk+Moj8So5Rah5o0zslQU38rjsLSz8P5IpF6Pwt53jZ83k0vmbybSW/7vF52
         pL2zITxIZBgS/iAXgq2v9l7ifI8vFenVJsF/NL0hHNnB5+li2nFutVn28Plhbgfb9W6T
         VQGIn7mqRgvy8OC3yeYtjEtWJlYrOE3iEtb4g/Kt4xlHFtNhWdg5Y5EqJyPOibvnWk20
         x65g==
X-Forwarded-Encrypted: i=1; AFNElJ8S+FhBSf0mny+L2IwJTJCntYeA0XBqKLXuTdRjeQ1jF+/sgvMxprO9c5efezcD0CsO6HZUVESSYS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRnjFkBk2Twn8RUGbSNl9nzZP8pHKlEmhEHDXEzS5AmJdBjur7
	L3/hvmZUOa/1mtUS/OUO7x8y2tH8l5JRk+UGkRe0niW/d2MfxIyRF76n
X-Gm-Gg: AeBDiesFwEGQswB3ayv7Mp5IV6cAS+UlNkx7JOL5DGz7El6hYubq2DD0UYg8KVw3wK0
	hTi3VEsTwcWrgWsmL7Rg3KRjFsVC4iYOrzt6LpRMmAtyOUachglKtPbChxa60xDAvvGI4Fe2y6p
	Inp3KYBZYn37HD7RWsJgfRn4qh1oG9v2OvReOIAffqdrmuK7+JcfNvDNCaW9XKPegP+pAoxwGcu
	5Lk9BkEIHZ+hD5QhpP0Lh9NxFRy3DEwgiMwQchjBy6xW0FX16EfsaKGmjUbXrUEpxCIo2eB3LW4
	XwZx9Recf21SXKcJkl53z3VQNp6LaGm93/oidTk7Xz5I9Gly8paaL7WI9lGdNbqr3qNq5Cj4LuO
	vdRfDAHHFprAhIPAPq7GK8G2HNFhqTq1EB2duCwvE1X7N26la/pb/zWwQc1Rvm4mA7Cb07/AaRx
	8f2N13vQ4FnXle8xyxFAKW3dmR6tPHi97I7J2T6c/jp0Qdkeeb3/e5UFENOooPejNzo/wSyLMFz
	kQzRIKyXHtgNsQx5KXOpqIHEXw4eNMLUnZFEwdW7IZ0jI7d8zbLeOaRO2fec6Pxyyi7zAHMbN4Q
	A78dsMce
X-Received: by 2002:a17:907:c02:b0:ba4:8288:b464 with SMTP id a640c23a62f3a-bbffab330eamr157929066b.6.1777732344365;
        Sat, 02 May 2026 07:32:24 -0700 (PDT)
Received: from [192.168.0.2] (dslb-002-205-016-203.002.205.pools.vodafone-ip.de. [2.205.16.203])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e292adsm1732314a12.6.2026.05.02.07.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 07:32:23 -0700 (PDT)
Message-ID: <e3d96025-550b-4268-8e13-ec45d25b0f31@gmail.com>
Date: Sat, 2 May 2026 16:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: switchdev: fix duplicate word in documentation
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Bj=C3=B6rn_Persson?=
 <Bjorn@xn--rombobjrn-67a.se>
Cc: Wang Zihan <jiyu03@qq.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, kuba@kernel.org
References: <tencent_93F8CA2FB714A80C571AC978F39E51D6E506@qq.com>
 <20260502132446.5b2c51cf@tag.xn--rombobjrn-67a.se>
 <a5482c59-2a35-44ce-b112-9c07e8ca7892@lunn.ch>
Content-Language: en-US
From: Jonas Gorski <jonas.gorski@gmail.com>
In-Reply-To: <a5482c59-2a35-44ce-b112-9c07e8ca7892@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2026 16:09, Andrew Lunn wrote:
> On Sat, May 02, 2026 at 01:24:46PM +0200, Björn Persson wrote:
>> Wang Zihan wrote:
>>> @@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
>>>  monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
>>>  bond will see its upper master change.  If that bond is moved into a bridge,
>>>  the bond's upper master will change.  And so on.  The driver will track such
>>> -movements to know what position a port is in in the overall topology by
>>> +movements to know what position a port is in the overall topology by
>>>  registering for netdevice events and acting on NETDEV_CHANGEUPPER.
>>>  
>>>  L2 Forwarding Offload
>>
>> This change claims that a port is a position. The preceding sentences,
>> talking about "a particular port's position" and a port being moved,
>> make it clear that a port is *in* a position *in* the topology. The
>> port is not itself a position.
> 
> I assume this is a fix to make a bot happy, without actually checking
> if the bot is correct.
> 
> Maybe to prevent a recurrence of the bot driver not validating the bot
> output, a ',' should be added?

I'm not a native speaker, but I think moving the first "in" would also
work:

"... to know in what position a port is in the overall topology ..."

Best regards,
Jonas
