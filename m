Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B946426;
	Wed, 29 Jan 2025 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738113152; cv=none; b=C0j7ld7cndShqmZredjLzwpUcs3cthWk+uF/v/s+auTT8JZboz1cZpOFFYPs8Haq5emd0YKQrdhO/VN7B0WjCY3lucb2e/3leoJLdWu3UFyghv8UFxWZVjcY/m5lVB9pa41jlCSX8hR7mXX/S24/VBvKfRIArp+xZRZdPH/n1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738113152; c=relaxed/simple;
	bh=cJ2nmLIKOdsKy2rNECH5EFU1PuBYko/O+ahsc6qGDjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/jzI4FobBR1O4qGgk0h1nPhOGly3+D/P5LOJ2nI+VK52DPAcQk5JlAO20ZS3/TN8W8Gs0QBBBIpGXJtpl4IyG9KMVeeYRb6S3CB/x4KDIXXSmuo6kMf7uMuWy0rdJvir4P4tZpTYvlUg7XKbfjrRyQLYd7fcChBjcp5odmmSKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XddiDXoP; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XddiDXoP"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eb98ad8caaso3603839b6e.0;
        Tue, 28 Jan 2025 17:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738113149; x=1738717949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEPeXDtn4TbiK6m4aDC/PX+v5i03vmxhW6zJE8V4eOs=;
        b=XddiDXoPsbTMacuZT6Qr8/jAQgMHNWiVK7OhJ8SyW2dBTsGNf5azRUY7vJTXJGHgcg
         zc9/G34XK8SHOtQte9vPIZ42ZBn/fSFY+8NgbwzVGhKnkvTUeKVBW8roF496flQxsjSr
         OsL28pgxPCSDGsHz9531I0RGVRUTR5b58ewuaLSfXFkVeqEwO5idFO4Gt0jK81eHBLS0
         BL/Id/UrUxux4DKldNCFXS17+3+hIOqNU9r0UiobqmrjV6GwMeejb+zKJDSnLDgdKEPi
         os6uCrIYqSYiY69gaFWbafmsYbH83rksRqcZSnPkTuAoDYHnDB5tcYIN0FVSHl1TBxbI
         RE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738113149; x=1738717949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEPeXDtn4TbiK6m4aDC/PX+v5i03vmxhW6zJE8V4eOs=;
        b=SraRfUCNwjMo7JgyiOhZMnN3WpwqY3EB5jDcz4GW10oEKl9Hv7KZk4uSXpwGH87p4u
         9B5R9uJT4MXey2rXid44AeFBlGOwHut6Ao0eQ845vov3pNcpilRLZrc1AspjwI5mhOoC
         WLkzJBI2GWfNwQFYAPLgXddsJnIEvF336Gd6P6do4YP0DiN0tNwEBjN88Spn9i7WzOpn
         t8fGUw0Sx+ATZlPLgSCnGX1nkAzC6NhDXa9Gl5rt4Ttz8ZmqcJqQlyr7ZFO5KP+3o39G
         sf4Bq/eDkgohbtHy2GqmuHWK7VHB7TLgMf7qcTIB5eG1zmxQDloq4ryfIRVgHahIDNkF
         3Vwg==
X-Forwarded-Encrypted: i=1; AJvYcCUa3qugIMFLTAF79Ruf5gZvruB+MSTmIWED2G6SP0UbzWc2jI4l/9HmJOKXTJVO8Y5HXBn4Lc1WRJRZ4PDB@vger.kernel.org, AJvYcCVj+u6Oy8+PBNqrMf+W5FmzDcS9k3lrM0Jlwu4SsVtOzrJIGHZJvKuOp2uScaoMQrHpEPfBTLRoWNI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuj55zxAkAk/NB79sugMKZuvl953vCVgWF4F2tQcoht2Vlab+F
	BsTnniuDN9k+qwKlXO8+WVmsSIiqVYDJ8OBDi0YuOm3aKxjWhXgC
X-Gm-Gg: ASbGnctPlKqyNwYL/UpW7g70yCI7Z48lY6mY2xitm7fiixSEo5dtOulShiI87uc/2aU
	G2+jaloXI17KaOLRWdQ8zDtTGiYHAy8DiLa1AwjFILM/PTnYNaLgFUlB5RxkdZUwzo7A7+d04sF
	avigN4mFS2nxW1yOKLntJd4+9hzjbSNqDwu2QY6IGcJukx1YfKbfnNUYbT6Gp+wc+APISgPx8mq
	YaNMp5fvJjqO4lIQVyl/KiTOVHBxNGg1ujXmbWbcrG5vN6GXkhCv8DHrllp6O/jWl9UKa5JrARL
	KNJYF6P/tICU8kchmQANXq4T7P5l1X0Kf+zkUBC+f7QkM5df9V1+YDQVERugfXl2iJblHS+/oTB
	xJiY=
X-Google-Smtp-Source: AGHT+IG72nySjMZwPnzhlxXFx8qEUOllfkuEYp4d+sOSEIzFOC0IH4I/nt7KMn2/k67vps7XAuMQWw==
X-Received: by 2002:a05:6808:2e4a:b0:3eb:7774:9531 with SMTP id 5614622812f47-3f323b69657mr638676b6e.37.1738113149273;
        Tue, 28 Jan 2025 17:12:29 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f1f085e816sm3537641b6e.8.2025.01.28.17.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 17:12:28 -0800 (PST)
Message-ID: <5fd7b4d4-6c47-42e7-a256-764d488e0c44@gmail.com>
Date: Tue, 28 Jan 2025 19:12:27 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] .mailmap: Update incorrect entry and my email in
 MAINTAINERS
To: Jonathan Corbet <corbet@lwn.net>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250125154721.1035737-1-carlos.bilbao@kernel.org>
 <87tt9i7fx8.fsf@trenco.lwn.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <87tt9i7fx8.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 1/28/25 16:05, Jonathan Corbet wrote:
> carlos.bilbao@kernel.org writes:
>
>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>
>> Update .mailmap to fix a mapping and my email address in MAINTAINERS.
>>
>> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
>> ---
>>  .mailmap    |  1 -
>>  MAINTAINERS | 10 +++++-----
>>  2 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/.mailmap b/.mailmap
>> index 83837191affb..0768824e9d19 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -139,7 +139,6 @@ Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
>>  Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
>> -Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
>>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
>>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
>>  Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
> So I am getting confused ... why not just send me a correct patch for
> this file rather than expecting me to apply the incorrect one followed
> by the fix?


Because the incorrect one already made it upstream AFAIU:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250128&id=ed7c0f5395e05057ae6459fdcfe229fb9aaab5b6


>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4006434e0155..f7e70513ebff 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1077,7 +1077,7 @@ F:	drivers/video/fbdev/geode/
>>  
>>  AMD HSMP DRIVER
>>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> -R:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>> +R:	Carlos Bilbao <carlos.bilbao@kernel.org>
>>  L:	platform-driver-x86@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/arch/x86/amd_hsmp.rst
>> @@ -5793,7 +5793,7 @@ F:	drivers/usb/atm/cxacru.c
>>  
>>  CONFIDENTIAL COMPUTING THREAT MODEL FOR X86 VIRTUALIZATION (SNP/TDX)
>>  M:	Elena Reshetova <elena.reshetova@intel.com>
>> -M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>> +M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>>  S:	Maintained
>>  F:	Documentation/security/snp-tdx-threat-model.rst
>>  
>> @@ -11228,7 +11228,7 @@ S:	Orphan
>>  F:	drivers/video/fbdev/imsttfb.c
>>  
>>  INDEX OF FURTHER KERNEL DOCUMENTATION
>> -M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>> +M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>>  S:	Maintained
>>  F:	Documentation/process/kernel-docs.rst
>>  
>> @@ -22018,7 +22018,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>>  F:	drivers/media/dvb-frontends/sp2*
>>  
>>  SPANISH DOCUMENTATION
>> -M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>> +M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>>  R:	Avadhut Naik <avadhut.naik@amd.com>
>>  S:	Maintained
>>  F:	Documentation/translations/sp_SP/
>> @@ -22030,7 +22030,7 @@ L:	sparclinux@vger.kernel.org
>>  S:	Maintained
>>  Q:	http://patchwork.ozlabs.org/project/sparclinux/list/
>>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git
>> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
>> +:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
>>  F:	arch/sparc/
>>  F:	drivers/sbus/
> As Willy pointed out, this last hunk looks like a mistake.


Yes, I can fix and resend if we're good with the rest.


>
> jon


Thanks,

Carlos

