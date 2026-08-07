Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030CF3ACA6C
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088607; cv=none; b=DNVqtt0Yg+b9VJ4U3i+6toaZczYKTywiBhDBM6qQYtZ0s7VBMosDV59+V85kgwoXhdfYJZIndd8hqDsvNwwxxM/qAzUY7Gpx7wxdWpT8MEl+vRoVhXTDP05kanasexWHgJ3vv9K4RQTVHT+K3JMigTtp/IQWFQbMU6hYrD+AjAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088607; c=relaxed/simple;
	bh=HT93MLPjdFzdITLOmgRvUp5/FHCQZOLnlDELM49i7Jo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DNxtuSzzLZDDwQxbY6sNobBeiuW7iVlag4CXAWPzQpCrr9OmMQapiLDhC6+W9j80IXYOAZFFt7381oYodCFOrF7UMccMiIl/3EGW7zOvG1FGw+B5qWs6ZZwouiOvZEQ8re894wkLE/IorG2qOHs1HBjtAb7Jp1LaCy6BNC4kqnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=wZ4LPbL9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="wZ4LPbL9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1570514f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088603; x=1786693403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=;
        b=wZ4LPbL9SUv+MFlFcHWbpAJ/ZS6KunkLvW9eoCBJ2JrASaS0msBiviBi+p6HqL53j7
         Ushc6xkKbvZwOmsVpI/ZV6Oh15X0g6ziehlqA+aH6qX+QfBMfcjMwHuBKF5z9Cldhsrg
         jF+OgQI/5CDFen2IdJQIrxg3eMU7TCc/YyexXxyN6yppY0MV/JOefmsOyJ4465izkVLC
         epGAZTJFTsJxOn6Tyb/dMuQ01BoWeUEUlJPTcBHhnvm0fqFUVunEKO+o3sQf4khOFL6M
         Cl3jObJvs9j5Tc2gg/cwZ9ML3hsHZbqKCsNeW2/XgXd5hWswBlFJjvl+sRohvkxY0VqN
         sgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088603; x=1786693403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S8dBK6YhaGNGXZXuOaaURDNFzX4xHQ7yoGCrlFysFs=;
        b=iL9htnTC+eFHIgM8rHNzHTszb1WuMACasPiFpj4TQ35bfDp1Dj2VpA6Rjm9p3WSOmO
         sSQhI2pooUdEYDueZ2/7YELRshk68Mj0nM/h8Jj3puomHSVWKJPqA7PxrO/p8ddVQPAT
         ZPnjp0Pxm1Wz816/tAQTk1gatlQZTYUaiguldEVUo7kGdAIJ0SJS/UJfnE2s2AKPOrjA
         2jDIF/+csAHtxbpi+RZKLJbzRNwvZmPHxx8onrHwn6hr9NUQn10uEjfOkJ1Mg6vuHSHO
         lkK7HUcOyUy1zuBGvLjAjJ8VeJRP5MU6mN9rSZzxjJNzkbpiWGTxc2Cynf5P29CTOGkv
         tADg==
X-Forwarded-Encrypted: i=1; AHgh+RqT0lnowjeLl3CbJWV7208yHGdvDn+2akTklteBen+5I5tAM5WVWG4ciR9tln6KbBrFgiXz8HsaJdw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TbqkK1BmwiibNFiY3fWU+bZqoKxlAgexEiE076riFRa96n4t
	lME4u6BiuT+wH9ONBC91s/ASICZp89C7J0n94/7gDnqTlLeNmrpEcDmBXVekvzxbsMLz
X-Gm-Gg: AR+sD10vtWi2hta88iNeKoT/m+A1u87gfJabYSo5ZyPPgikWB8pgVhEbaaDtdSiZbt3
	WM9RIUP5NbsOEXuA/eiU5qKDdhwyGs+5yNC55Dlvl/EIMXmA99ZhJvkWgKUUZbYYpOvy53F1yzA
	xlLsYgvsFkvesM61vqN+TZ+kvFpXxMxYgUcok3iaO+5QK4kAvoWtXnnJYbbJveGCPu3FkiIDgqE
	6xUqm1cmF2z8qUCXhac2k0v+U4NgUrYuFhgYaE5ZBUGAqzAP/XeYqvFyo4S3TtczryIZMrG5R11
	j3uBcm1wWngHaTe+C0qJqmTRxEUzxL9gTtmnUubCcuLvDfeRD2FqU0gymbDoYyBjgiU3QpgKlFB
	dNKARQ3euJr2E6OBqAT/iw3pDw6enEwau0E6zG1de5pTuLjxhEXw9Y+BhvHEfx6pgjsLqVXhGzE
	bo+3SBJL551ofiezF/5oIsl9FkvaJ3ww+lVDlyGcFs0TrGIO5QQGo4+6zn5n7xm6Sh+2xjAvgm+
	RYcpKG0YBbMZOVUQ7XO3d+VBa8JYP3vZveo7dgzwGt7
X-Received: by 2002:a05:6000:290d:b0:47f:f42e:9715 with SMTP id ffacd0b85a97d-47ff42e974fmr20538949f8f.12.1786088603193;
        Fri, 07 Aug 2026 00:43:23 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002150952sm2814778f8f.15.2026.08.07.00.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:22 -0700 (PDT)
Message-ID: <79d79806-ceda-4e79-8e9f-6420265c8efa@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 4/6] virt: bao: Add Bao I/O dispatcher driver
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-5-joaopeixoto@osyx.tech>
 <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
Content-Language: en-US
In-Reply-To: <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/26 20:32, Andrew Jones wrote:
> On Wed, Jan 07, 2026 at 04:28:27PM +0000,joaopeixoto@osyx.tech wrote:
> ...
>> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
>> index 35658f37e1bd..f04e6cd33fa9 100644
>> --- a/arch/riscv/include/asm/bao.h
>> +++ b/arch/riscv/include/asm/bao.h
>> @@ -14,6 +14,7 @@
>>   #define __ASM_RISCV_BAO_H
>>   
>>   #include <asm/sbi.h>
>> +#include <linux/bao.h>
>>   
>>   #define BAO_SBI_EXT_ID 0x08000ba0
>>   
>> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>>   	return ret.error;
>>   }
>>   
>> +static inline unsigned long
>> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
>> +{
>> +	register uintptr_t a0 asm("a0") = (uintptr_t)(ctx->dm_id);
>> +	register uintptr_t a1 asm("a1") = (uintptr_t)(ctx->addr);
>> +	register uintptr_t a2 asm("a2") = (uintptr_t)(ctx->op);
>> +	register uintptr_t a3 asm("a3") = (uintptr_t)(ctx->value);
>> +	register uintptr_t a4 asm("a4") = (uintptr_t)(ctx->request_id);
>> +	register uintptr_t a5 asm("a5") = (uintptr_t)(0);
>> +	register uintptr_t a6 asm("a6") = (uintptr_t)(BAO_REMIO_HYPERCALL_ID);
>> +	register uintptr_t a7 asm("a7") = (uintptr_t)(0x08000ba0);
>                                                        ^ BAO_SBI_EXT_ID
>
> Using the experimental extension ID space would be fine for an RFC, but
> this can't be merged until an SBI implementation ID for Bao is added to
> the RISC-V SBI spec. Then the Bao EID would be '0xA000000 | <Bao-IMP-ID>'
Understood. For now the RISC-V backend uses the experimental extension 
space,
and I have made that explicit: BAO_SBI_EXT_ID carries a comment noting a
permanent EID must be assigned through the SBI spec before RISC-V can be
considered stable, and I am marking this revision RFC for that reason. I 
will
start the process of getting a Bao implementation ID registered and 
switch to
'0xA000000 | <Bao-IMP-ID>' once it is assigned.
> I think we'll also need to discuss whether or not firmware/hypervisor-
> specific extensions are exempt from all rules in chapter 3 of the SBI
> spec other than a7 being the EID. If not, then this function should
> just call __sbi_ecall() and the Bao hypercalls will not be allowed to
> modify any registers except a0 and a1.
>
>> +
>> +	asm volatile("ecall"
>> +		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
>> +		       "+r"(a5), "+r"(a6), "+r"(a7)
>> +		     : "r"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5),
>> +		       "r"(a6), "r"(a7)
>> +		     : "memory");
>> +
>> +	ctx->addr = a2;
>> +	ctx->op = a3;
>> +	ctx->value = a4;
>> +	ctx->access_width = a5;
>> +	ctx->request_id = a6;
>> +	ctx->npend_req = a7;
>> +
>> +	return a0;
>> +}
> Thanks,
> drew
Good point, and I would value your view before I respin the ABI. The Remote
I/O hypercall currently returns several values in a2-a7, which does violate
the calling convention if Bao extensions must follow chapter 3. If they 
must,
I will change the hypervisor-side ABI so the call only returns via a0/a1 and
move the extra results into a shared-memory region, then switch the helper
to __sbi_ecall(). Since that is a hypervisor ABI change I would rather agree
the direction first. Do you know of precedent for hypervisor/firmware
extensions being exempted here, or should I assume the full chapter-3 rules
apply?

(Separately, I removed the redundant input constraints from the ecall asm -
the operands are already "+r", so the extra "r" inputs were unnecessary.)
