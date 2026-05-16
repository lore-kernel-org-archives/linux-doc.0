Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A1211A14
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778906725; cv=none; b=E/AeIFGnxEHWHK9rvEHUn8y24tyYvseE1sRYFOkKCIY+YOw2XgDINfcbUxa6gRLNVAp5fpoO4iPK1030OS3g3NnDx+XNTJzDKB54oadabmPA/rwHWJXct4F7LPljemsUoDErrQftvggYulx6GY9v4yy0yNzj/7fKAR9proHz8oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778906725; c=relaxed/simple;
	bh=wPzHki9tUlnySG5icx/eYpjAzQhKbnq6ivdq1KvsuK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNLTTFfGWyyZC/DiznrpzedOgl/5X5HJW0dqvfDSyVfYFiL6sT1UFod0baWlZ7tsBYmcM/tnGW74iucEqeDfk4jJZtXBimzElf3Ivu086Bui8JlJPzJjqwwKTahXj21thREiJJrOrstO/5QIXbijRfTd0n1FYmoOF7c1RHwp59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/X4yuyS; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/X4yuyS"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3698e34a567so243a91.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778906723; x=1779511523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y/tZkrIY7c4MSUy0VnmRTezG8VLXlsrWmKJrFBUQPhs=;
        b=m/X4yuySy0E0Wny3zHPPKs65XfU09ytyo6gHwV+FbFuZpxuYB3jHeNPdK4Y/BcbOqg
         Dp3+CX8XoWa7dagOY6eXOAcUOI3TbC9gS6QJofIkf3vjXjfs1Sod3KJTyXFhUtXs4Vm6
         Iv6jJX8qnRtxKEB45VZSKZY+irKfQJ+i0g2DYwSW/6TzgfPHbrFJP2eKjMxaPE13pZkR
         IWddQRXRlNIdzGANAeJ7uayGqnaPxk2pBf/fe6A8q9VS53+wcC2q+tqEu0KdioVJmYXo
         JL6mFsjrWTy0Aa0qoyObh98vZMMPjRL/VObKj9HvfxMdVqmPWSSGVV8eRHEuGYwW/CYM
         cSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778906723; x=1779511523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/tZkrIY7c4MSUy0VnmRTezG8VLXlsrWmKJrFBUQPhs=;
        b=LvApWdCqZISuCL5bHy9Mi1uO4j+DZ7DsjOjMjSAbBG9Wi/tIKrCmorPjRKumP+bLtv
         o/Pg2rn9vLmhgAhWoghgAmX+AJhidZtEAEmjGuE96GgbYLQjO987zvrkY1skyPFWa4/E
         ux9IgI1mNmGgtyD2/c1qTimMdBPPjgZ29/E8jAzbedztdc7UDcPW6/WPOPegGAqwKqgS
         r6nzsD0AKfabkoqVP+BYfPUtpWBN58jzOcEAsW0+I88YtYE3dyaMauYCmijZSc1nPzcG
         FLBjOJaHEzY7L3q1iZCPc45j+uvLfpUbQYucWT8MUiXq7ofg17PnLH/eothQmUyARWCM
         RRiw==
X-Gm-Message-State: AOJu0YwLICaVnFhc1odOsgOIXmpvEMLEu3Fh1C3MbZUXwNEmu4jzK5/y
	GT6ZYm080jVak2br/xbMw9Ft4XhueFYW2u5irtLCVAo6izqYh6C+sMr3
X-Gm-Gg: Acq92OHR13+XMYQeJI3Nrzf7izV6T0rWpTKEVuRxCU0TRM18PF4uPU0/FwA3OUVXdJO
	6Y6rIMaIuOPkZ3CXdpamHq51iGrWt/cOkoJPhTEgvHVku7OXFIVWYgKlPH1Y1NYpA3nC6fXVpo2
	shgSFx6RyGrZwwo3rWTQFJTKi/yHFkhREn85VbJfphf5XHTGieVjsS+and8Aom40p6uylja6qZ4
	TVuXDKdm0482HGJJVfodVS+5Yh348o/0SUJmTIHJazVY42cM3jETsdQsN17NtZZMoUxtTgU9HtY
	XXH+Wuyr5llMf74s2SpssTXbIECLEb7eF6UUMQ8sbHbAucn2KFPU8NEgfNwVqt9+gAXmFIrxYqz
	+LC5gKbPRNV+5PTTXYhwMGLIS7kygHK7fiTbC0kA1HRjVdB4pfRU0Riu1TmBVZgTy4aV7cv+7/a
	Mkx51gtQ5RoEU5Sp6fY7a0WWogXQUq+1FrLibPUCiWygo0kcInLaCkXDGLEC3ZmUzWraDX3z9/
X-Received: by 2002:a17:90b:2ccd:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-36951cace57mr6501432a91.23.1778906723000;
        Fri, 15 May 2026 21:45:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514361b6sm4191134a91.12.2026.05.15.21.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 21:45:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e370fb0e-c3c4-4f82-a280-49e154a4c08d@roeck-us.net>
Date: Fri, 15 May 2026 21:45:21 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Documentation: fix typo in title for max31730
To: Randy Dunlap <rdunlap@infradead.org>, Hassan Maazu <maazudev@proton.me>,
 "corbet@lwn.net" <corbet@lwn.net>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "khan@linuxfoundation.org" <khan@linuxfoundation.org>
References: <lC2hDaF-g523KA69MW_DVSRix9HHjA5drjH62zaO9eFNuOboR1cxxrTbqNJ8lmvuZ0u35qD4Ds8x0SeARtp5Hi-qIVpOi2zjYoV_vzCJjEM=@proton.me>
 <5e0aa2ae-b179-4cfa-85fc-805c0da79111@infradead.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5e0aa2ae-b179-4cfa-85fc-805c0da79111@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 19:56, Randy Dunlap wrote:
> 
> [adding Guenter]
> 
> On 5/15/26 7:41 PM, Hassan Maazu wrote:
>> Wrong device name used in title.
>>
>> Signed-off-by: Hassan Maazu <maazudev@proton.me>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 

Thanks for copying me, but I wasn't copied on the original patch,
and neither was the hwmon mailing list. I am not going to waste
my time trying to dig up the actual patch, sorry.

Guenter

