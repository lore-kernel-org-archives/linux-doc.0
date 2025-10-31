Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C852E7BDF
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 18:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761935829; cv=none; b=DemK2sVW93jmqMf0FmxduPMJp1Tm2RdGdX+aCHKpJvK53l46NboyuEg20lJZhnBvc6W80E5LGmzzCgtYoF6lOCgEehk1HC5EidqsjfcBhPkwdsRd7RauVIUhERrCEbJrL8UXE5uKk2/cr1wyW5ai2laxhXUBocq1mFwgnfl+SqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761935829; c=relaxed/simple;
	bh=fq4ahmFZ7bpfJBQK18QsXF0TADYYnB2UkPabqpgqDBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHUJAGzQ8fsEQeoml/+VXwMnLsbs521YYdLnHY98cXMTDQIAcn9A4n+jbZPOAT+A9nNse/kJWWP5U3DgPPpT0ihmuUtIjI2WGV1xpORp0+j6NBzJkEAGGEsjEXULVSWgGDeC1dQ9UzaT0dtqrG8W+rnQxvePBABu/WT67yq6lHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTF7oqyE; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTF7oqyE"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-79af647cef2so2527900b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 11:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761935826; x=1762540626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbNh/oyHxx1gNKK10MMyuZ2NpBZZZZyF3csuO91peh4=;
        b=YTF7oqyEqPc3itBnrFXmD+01epFwqBlLFoX2rXFvCIIg5IwVcD+sP5JHG00cCjfBV5
         qwKsPZosNikjt3BVlkHYF+/Ed0ZtmxmS58DwITtgBHN0NqHL6owFMU+bNQahHPNsLz4E
         dh4wRooT2L7uxeEsvNfiy9SFjwjWWyEy/z4M0Slayv8mbxGiucXW4OHngRdanHxzh7Zd
         cRp8U3b/rhJLwg2zB8bi90U96c40adpOZbuypiz3lILZdMIGt3mqRXATUAgMXOWpy/XR
         XLg/O4jLOd+bX4zQEFyp5wgEueukzDwmS40mjQF/eXihMUvi1sa34IzV2t5bQq9/Vl4W
         ZERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761935826; x=1762540626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbNh/oyHxx1gNKK10MMyuZ2NpBZZZZyF3csuO91peh4=;
        b=hP/Z0X0o6IPx82t/DIeO9YfvsrlY3K5/hI7H8ul00lWaFnG2RHVQHn978ozUpJBcp+
         mqZUqGB9EZPyL06RAa+MnM9hdVfrQjZPmiowanVSLiPH9t7c5qxDRbmGP7QSTy/D4qSO
         E1gZYs7n7LNNX8LMi246tEKTmw42MnBZbdqM81K5b/qyXm8uS+tPRHtNCpfohAqsS9Es
         sd/Vhp91JpoJUCE/GD0B0ykbWnpG+koVx2DdJ5PHLeGGqpYqKyVWtNCySdzgAGxkOaFC
         gKVK3MXxVsj1GkqMN9oCycLs1DkScgvztibFT3YmosndiOGvhjHG8UWDMa2K5JdWmqC2
         3ieQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd2MR/v7ya5eYz9N/lpHSZ9rJQRtccT1yJ6wcCxGK1Lyqt8ok8iJcbs+3xmiGRSDg9pqi/RorxnhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpduIYjALFvU2neuqQYcKw1MyheNpVvNRgcpDAtrAiEY8HzHtw
	Y6j09Ff+GdlDLHI22w2awRA1Z1t1grhqEB3l6bVl+eSx8ny6e1wqExqy
X-Gm-Gg: ASbGnctRqYa74I4IEDbnuTqc7iKACiWbmloTyZNjSyZ1bwuUl0sFldoR7Q6carJd9DN
	ztBvj67t58q3K8tQwzp3s+x3hPYDmTP6awjxkPINKGCBepwlJKGtxoXyf34Ng/cS3GCNktLLPHW
	BehwdLjzTgKIRy6GJPxu63KWhHa9ND49oGUnfMu/jgvOgm7+icHnF4x+WZ/uobriWBAcoNdAffT
	JlTaHxeH52tGL6mqxAiaVu2cOsj5ZnSscgt3cdtOYpylkB8TluHtot2EcoGi/NapQ2hHvgMjxqY
	tX8n642wUz0wzEpioVkrKvWd/2I8C/hSleEvIEJuc2qIap1RkSgjzmqxs46I4ecFg+7aO9tbCYd
	fMqdz+fKCB0vNgxlicGywrlO2K7JyMirP76OVx69kAiSVxsVe5mXw00Sm4B0Ugjj92rI3ETLSc4
	MRE4VBTzqEZph4AzcaIBK2J5Q1aO0rYaKwj0zR5HfwR4gmVpya
X-Google-Smtp-Source: AGHT+IFxM9ZPDKP64KwLTzZY1mRUZoimrQ3Q3TbPQ32t3Aj7lwWBRV06PRS1CSCna8E66/pJLqw2Hw==
X-Received: by 2002:a05:6a20:7484:b0:33d:4e4b:7b3a with SMTP id adf61e73a8af0-348cb187fc4mr6900447637.25.1761935825528;
        Fri, 31 Oct 2025 11:37:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93be4f8cccsm2795935a12.30.2025.10.31.11.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 11:37:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a4245d73-365b-4dca-a2a6-685fb11c34c6@roeck-us.net>
Date: Fri, 31 Oct 2025 11:37:03 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641
 power monitor
To: Igor Reznichenko <igor@reznichenko.net>, krzk@kernel.org
Cc: conor+dt@kernel.org, corbet@lwn.net, david.hunter.linux@gmail.com,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org,
 skhan@linuxfoundation.org
References: <35d41d46-5bc8-43af-a84d-6b118fff08e0@kernel.org>
 <20251031173029.904313-1-igor@reznichenko.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251031173029.904313-1-igor@reznichenko.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 10:30, Igor Reznichenko wrote:
>>>> On 10/28/25 08:17, Igor Reznichenko wrote:
>>>>> Understood. The bit in question controls the alert pin polarity on the device side,
>>>>> independent of whether the pin is used as interrupt or not. I'll drop the property
>>>>> for now and revisit if there's a board that actually uses an inverter or needs to
>>>>> program the bit explicitly.
>>>>>
>>>>
>>>> This is kind of unusual. The requirement used to be that devicetree properties
>>>> shall be complete. "Only if there is a known use case" is a significant policy
>>>> change. Has the policy changed recently ?
>>>>
>>>> Thanks,
>>>> Guenter
>>>
>>> Rob, following up on Guenter's question above.
>>> I'm not sure whether it's better to drop the property as discussed earlier or keep
>>> it for binding completeness.
>>> Could you clarify what approach is preferred?
>>
>> Don't you have there possibility of interrupt (not only SMBus Alert)? At
>> least this is what I understood from previous talks.
> 
> Yes, the alert pin could be used as interrupt in principle.
> Datasheet calls it "Multi-functional digital alert pin".
> 

Maybe you could try adding an optional "interrupts" property.

Guenter

