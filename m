Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA42225416
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665630; cv=none; b=CIXWO2nq5HMT41I+RPzp9zWryqceab3B91YWkZUSfvH9fVun+AWvvhBaF4mw3mxCY6xH+pt1A9XE2zi64ic6uSNzbAcVX4yByoCXg0DmAvE/rwZHm4gftqgYLtD7VVuouwx6AjG2VjgItft2Z+7i8Edx1eED/ei+ZaAE9PkCnqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665630; c=relaxed/simple;
	bh=eA7Nw5jjmlJ7WDuoEIo2n+iZY2FkYspPQ+ZIWFh7Uok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRfSaGVyjsgL+HyvdAYQJ6r9wAPXfxSYF57ASUxYMN+iDL1u/9JnS7MKdTFanV5b+7Szzm8bp7XLK93RcvCcyNhl21+Jhkr0O+sgGyb39p7Y5ftOSVFJWXKOqIdVLbtXQrENmFx8gRi+eRaqmGzR3e28H6bsiVAYJ3JvloQ7qpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kvh94TcI; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kvh94TcI"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6cf3174ca4so4220646a12.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 08:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665628; x=1762270428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kSEOBZR+Exc/CaWTiV/k0angiJlxjY7XZP8jViN6sPg=;
        b=Kvh94TcIUi4V1CvHdkpedE6cq9h7DZS5KSLsYB/jreNjjJOs7LFHw8L4E2lI8inn26
         +WOBAVaFAYY4Qj4rNt2x4W8Ai306xQWbuxKmhZDgti2uTytagqTmVkJU2a0pPAZhZeQi
         r7Molx8NyJM4WpFUtpf7RmOL+wF1GTYg3S0+fAbj2aOJDaTmncXsqyWWZB6j+uw1oRpY
         eDYw6kZ9tq3tWTU0KpTxHsDsUm2CMnXGDDM+nGKmPZ8+EQQ7N0cdOqaVOWmlAClz9+Xa
         USYa2yDtxHMAwvZYztoXGyH+9mFgezRHRdGxcgkDXce26oNx1WR8vVAKLop1OtmKbBQb
         tqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665628; x=1762270428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSEOBZR+Exc/CaWTiV/k0angiJlxjY7XZP8jViN6sPg=;
        b=Mjmb3o4HFFmwS2i9cVvKJjoIRV+ngJwaudorjJNJyRSh4WSzZw9YVR4PMEe6/Qdgst
         4L2A5je2dkWkXmZrtN3eVbjZY87072UM8vvXH0kSfE4SgCwr5JnSGRn9QAvLV5hnVCLU
         SI0ljjrcGUwSqeh3FV069hjwuUpdAlHphT9TEC1wUygI+T0h2WLjovOgxK7z2a43tJpn
         9M/yATwgB7nWCnWzfQqSP71Mo3id/A+HvN5pX+PyvwH/dO7aibsxwI9AZeqYON776ZSK
         Qqu6TOcWPRZpEckIwxDwn1im6O1Dp8OsaukOMWxnBOqt5aRCpGwHsxwWKTIWvKIjOkoV
         nRIw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7GHDiaF6/0p3SFAWsNUrkoV5Y0H1xhmG40BxGeQxF/8flyRLg47ouuYtWGh9LQVkZ/y1EtrhZao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQ/1UksBWEggtVtwwypuWXzDC0++n5Vsj1U5xnrRkaQmzw9Ed
	D+eMZswpuLGRp9l53ixS8LzwtzeyHLXCTnfyeCs4cRvwYLNnFCwkXhtK1qsRjQ==
X-Gm-Gg: ASbGncuZB2kPDFypnALvrXhhneOGTz+DbLU0tPf23QpePBIGalWEtn/4IA+csEJdFw+
	ZoHIU/pCU0VPGQlQ1l962D1EG6L+orIF7Xi85WYabgC3hoHg0gX3v+IWY4BpU34orhwyXiJhTUZ
	Pm6Ol7Epst0p/3k7b15vvmG1DPTL4NFh+1tI0lakWq8FvkGsZF09sk5vX6u4MIhJaLNnbkJEIL9
	eQLbJKdxz+mwC4VYVjWWiJGKVJXTXXti3leKTg7UghgVCQ2QddoLFfC7ZAMEMTGzfDP/ERdVl3b
	kbKr1tE95rlPoGd0pWxpRLeqxMaa7le7i4zcbttOt/iGKKeUjk2OEjG7lzEOhwhLRIiNPgIIPwq
	sVaNQBlPo1o4OvEd6eUZrpwUdCb4SunUdDqC3UnSxmqlCLTxK+rGDvNPxfO+mAVhH2QiIsGsYn9
	8cZn4bSFB7QoDiZvSgfz9g0JzxiMybAlfrG5ppqC+NzGTliC+WVIRMPLNTVmI=
X-Google-Smtp-Source: AGHT+IH5tSe4iYRpSGEmjR46kSp3ohJpOhCnmEWATPv4U1WYhUYftb0nmtWlD4ZwEMfhhEGTWWuJLw==
X-Received: by 2002:a17:902:d48f:b0:251:5900:9803 with SMTP id d9443c01a7336-294cb3b37a4mr53846165ad.21.1761665628366;
        Tue, 28 Oct 2025 08:33:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed74028fsm12535371a91.8.2025.10.28.08.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 08:33:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85e83f3e-3509-484b-8cc8-110156d5a2ab@roeck-us.net>
Date: Tue, 28 Oct 2025 08:33:45 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641
 power monitor
To: Igor Reznichenko <igor@reznichenko.net>, robh@kernel.org
Cc: conor+dt@kernel.org, corbet@lwn.net, david.hunter.linux@gmail.com,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, krzk@kernel.org,
 linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20251027191425.GA1403533-robh@kernel.org>
 <20251028151747.663000-1-igor@reznichenko.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251028151747.663000-1-igor@reznichenko.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 08:17, Igor Reznichenko wrote:
> Understood. The bit in question controls the alert pin polarity on the device side,
> independent of whether the pin is used as interrupt or not. I'll drop the property
> for now and revisit if there's a board that actually uses an inverter or needs to
> program the bit explicitly.
> 

This is kind of unusual. The requirement used to be that devicetree properties
shall be complete. "Only if there is a known use case" is a significant policy
change. Has the policy changed recently ?

Thanks,
Guenter

