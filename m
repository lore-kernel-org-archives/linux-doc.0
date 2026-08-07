Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC93DEAF6
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088664; cv=none; b=mD5aLYT6TdsNyAkGdtG38jYTa7Hbh6g7H8koOwwj4nUBrR4vO0vJd6P4eimUiOe8Ni3R/sSqLgMjmYTdqMrNBbTHkLAtusWKu7xPcjxoMG+vG43uxHeI+u15Yq9BURq3+KxUae3+BxmWpZ3NSDb18QzoaocxAHYnYe/ljG08/w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088664; c=relaxed/simple;
	bh=etrns4rvLf3EOz0+RqkrYzp0Wo0n5y0a6T7oB7iFRHo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HvUqiedxFFXibKXaPYg1ANjISgaeSxpvNGnYiUXT4fueGGyUqJV7hhC8enF2iy0EWNtxiiUE5ioFTQNkTql2RzOi8BJH5MjG/0+d6LkoJ72PFLcQoFcj/VEcFds6mu05X8Rtmdui7bfVg27OgeRg23wZVExF0AThnNlo06wcSL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=KUH3ZgO8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="KUH3ZgO8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso22218525e9.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088661; x=1786693461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMXlhNjfgEVVavursvLkrVBWqQ3YchqAgG6nIZuSJdI=;
        b=KUH3ZgO8R7WGPv6e/0U2GCR12ZYVEdys8JWFzvPaCt4Ij5w5YFGvQ116dVtbaK0I8Q
         UQTZoRaDXxI2IRgqo0/XF7jlqi9hcCRB0beBbagMgcigIEW2LTOgWVSW5NhgadjQZjFY
         +mRGa8tX5JphaZZw/QrY60udv0aFneY//qduFL4ybdIwOcs6CeEap7ZxUC4EiQ5zXvRM
         A4VZl01sCEN0vM3/dAzSh2QczAA7vcah963C0qXHy5FN+C/XXTQXUvhfyuMEZTc8BYjD
         eYvZKy63vui8Zy31SDZV+AEri+LDada1w6v8EPMssV7vRNSX/Cj7Z1YwpVbkstOdxcNh
         UkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088661; x=1786693461;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMXlhNjfgEVVavursvLkrVBWqQ3YchqAgG6nIZuSJdI=;
        b=HTrQ6eBiCXHbDvWAUUtsDrZlulu82YsFm8xTVfsuES7yZcoleZFn5yMrojLBBqDNYH
         aEtZKtok4jG48K4jDyYGELIuuo2f2slGmct403hs7tcmhSzWq/QykPlwj7uom/wl4L/s
         NkXdvr1xPl2aktz4+w6+3XZs8cgpNAgzXqdlhlfQ6duH4VlakFHUC66MdfMc+GlAtjog
         7VDGryHdLggAJVTyErD8AsiVL6rc7XNNb3vW4pElGCH1vSpl7JdEcfFrF51rOQCDF3uj
         b4kOxFT9DwsokgusHZkYJldt/PHmoloz/qMCSnH3vS3hrI0HFjfVwKBtsUdZnqutTBR1
         NDdg==
X-Forwarded-Encrypted: i=1; AHgh+RpuVhAFSVMN75Kc/NS1wcZd7MaawkytVePKFZehOKn4OktDx3Yoosu5bYNuEixGlD969ZQ5C8RXZk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfC71EMqX2l30212egAR10R9fZ5/oOujEntOtBNgnLgcGCAER9
	D6TTJEBuimUnFQJ8e6oDAHmc+JC4Q4pvb877lusaSXSJQz/CqBro3b0hCVoQPEnPA9i6
X-Gm-Gg: AR+sD10GsMmtrFwr/XActJ9K0kwDRGcpCLly18GPuCBuP1EYTHbMPVQytaOiuwkJGJI
	u+tH2uU3XtwZ2RB1a1Vadc9pL5jMl/l/Ml/9DRzvlDoHWl44hDXieaAA4EsUGm2gFkpAj5nQLgu
	hHO7vYvpvPJxYU2wwu10v5vQBsX7Yk3hRgkvEuWUUyXAQGrWNVgJF7EaHlONT65DfQYfykx0IhS
	7XiP/X2x6rcMqxZzTo+jtDXntVFjQM9BC15mtuOR32jU27GCQpJwv03uEthjvDx/GpWCE3GHLKj
	7sbAH172guZoo4GYXb5bF2L19j4g2j2O4bqvq3gRdB2y11vTTxpeX25D0yx7rdLPVLuqN85XCnH
	Dje4tZ59j37aIWYoaWraZKG0K7Mvgmy5pvV7euzw+tJn75fxjM9X9lDv80RvOwBWVBib/cu0D/0
	JGuXtusbM4QAuQPunnuHtZlsb5gaOMMQqxKQM/zTFy5K+SaaQX1s0TXHaJQ5fh9cF+VlKnZoVZd
	N5k9Cda968waEbjPkZItfm28WlasJD++A==
X-Received: by 2002:a7b:ca4d:0:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-4994e7eb2d2mr211693395e9.19.1786088660739;
        Fri, 07 Aug 2026 00:44:20 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9eb1a0sm17092015e9.5.2026.08.07.00.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:31 -0700 (PDT)
Message-ID: <c4c81fcd-fc3c-4133-bad8-fed256617fc0@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
To: Greg KH <gregkh@linuxfoundation.org>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
 <2026010704-heaviness-quality-f543@gregkh>
Content-Language: en-US
In-Reply-To: <2026010704-heaviness-quality-f543@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 19:36, Greg KH wrote:
> On Wed, Jan 07, 2026 at 04:28:28PM +0000,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> Move the IPC shared-memory hypercall ID from architecture-specific
>> headers into include/linux/bao.h.
> That says _what_ you did, but not why you did it :(
>
> I have no idea why this is needed at all, sorry.
>
>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
>> ---
>>   arch/arm/include/asm/bao.h           | 5 ++---
>>   arch/arm64/include/asm/bao.h         | 5 ++---
>>   arch/riscv/include/asm/bao.h         | 7 +++----
>>   drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
>>   include/linux/bao.h                  | 3 +++
>>   5 files changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
>> index 5ece9ecb1455..7d13591fe669 100644
>> --- a/arch/arm/include/asm/bao.h
>> +++ b/arch/arm/include/asm/bao.h
>> @@ -16,14 +16,13 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/bao.h>
>>   
>> -static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>> -						   unsigned long ipcshmem_id)
>> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
> This does not match what you said you were doing in the changelog :(
You are right on both counts; the message now explains the why and no longer
hides the signature change:

   virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h

   The IPC shared-memory hypercall ID was passed as a parameter through each
   architecture's bao_ipcshmem_hypercall() and defined locally in 
ipcshmem.c.
   Define it once in include/linux/bao.h, next to the Remote I/O 
hypercall ID,
   and reference it directly from the arch helpers. As there is only one IPC
   hypercall, this also lets bao_ipcshmem_hypercall() drop its hypercall_id
   parameter.

See also my reply to Andrew on this patch re: whether to keep it standalone
or fold it into the earlier patches.
