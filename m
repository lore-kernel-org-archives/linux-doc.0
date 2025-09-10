Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5E26E708
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 23:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757546868; cv=none; b=g0HBUidEkbp+AJSr0KgwpY96gQAfKEkAAD84Xi3dgoXZYqoiNHA3S1ZOMcTHTwTwEirvQBIXGsEL9kKWXDIDrzf6E3XJ8L84+/8zEOahMsGqvuVY7Lg9x4RodYO615NmX+4kKR6YypBL1K2D9VNgV0w+NP6kf1SYL0lcr2VDdwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757546868; c=relaxed/simple;
	bh=3edQ3wiuOkl5Ew2p1AsKKEjc24a+bOKfcgFFJgKaYyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuLjJHRwUVAmmcQn6QGO70WBmWKzeQfFIxcoUKW4ANUz7iEhQsGdMYe8KNMyT6hYxzxKYe8EOHp7wBaHcUacB1NTGh6wK4B5obT5oorX+6rBoTGN0h8MT8cGjGbxRVMgUttfaoJFThtc+u1OMAgHTj3/5yWttE6HcOWfuH6z+Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nh3FneXh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nh3FneXh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso145610a12.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 16:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757546866; x=1758151666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBvz8G4X1Zkxg6w/J/7iMCCyjPI7vNKrmBzdJOfaZII=;
        b=Nh3FneXh1TjPguivkhakbcx+nNjCJijSzMIldu+mMq1PyhJ+JTfdIKUjioBHOXkDxx
         065uy90W5HXcPuhjsjVZnUIHiBpkrrNxE0yuh74p8Y97lQ4/aAhCcaItJMQsuesjA8J9
         f5PaPOvTeKm5fBsePJUVC8QL8kfeJkHJQtcywBwRQ89oXyQbV0qeZwLpTcxW5QeyBJH7
         6mzlP4mcsRTNOuN/GNOnMvHF72I2ntePAKJqeHGZlHHkWe6FDjWIGkVx4oQaPZmDIlDw
         W4MdcFUa3weGQ3bZ2kik86WCzVSR1W2gv0li+3sUD1hDuWg+5RyKoXoUl7lO3tVS1zxf
         Svsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757546866; x=1758151666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBvz8G4X1Zkxg6w/J/7iMCCyjPI7vNKrmBzdJOfaZII=;
        b=U2hhY8Yw3LZhRBymx2/RjbwnfZRDmq82wajVkN0YUAVNz4XJRnb66T67KakIJnVwhC
         a2rBm6cacfMFBWmc12bQH1+XELotcm4DgNusaY3TqGXnCTB0LM2FVTUYzEoc+Q1ztcF3
         uWwi4EP9wAPQsrrHRcRx2WVwbbJv4QBoI1cEExlyhgHwEAGQWS05Lz3cmVPRTUVAL15X
         2O/ti0OxqUooQCIGqERUMRSTS9bOw0SWl5iGtyomQyxZkMjrEbP7yTwBuZ36hvN22M8d
         Cjc0sfOyZqAqWoFtDFUEf4/paTCPzDyLCZXesXL2yT0u7+/YtKJTnFJBKK/iqVjx/7dc
         fC/g==
X-Forwarded-Encrypted: i=1; AJvYcCWK1bbbgqYLBXO+fvHWcuUcLBtiepa8wmhQ0VNntVDgMyPVxe8APbbOTJgFvcEoA6b7Q+ue+PfMzB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEgFyTDByv13rkVxoTsoc0MF78y4FFMwdGwbBXWGy6UHwP/NF
	HyU2/ANZx2ZgCtZxZOPbxVLykZ9SOa5fvfg6rzNAArZzI2I8ZzLVIcNIqp38OA==
X-Gm-Gg: ASbGnctAr4o6uQsiSsW6ij8U9kimSAm6SOFY2fyQG/vyBfDtk+DPkZwIXlO41N7zPMd
	3LQKu/OEwoSLEN9UoWP1Z8i2DppX7qqFys7GHTMvy++6FUc65NuqahaWEQi9gVAvbkZvHvnTjJs
	meDxEQttsMWcwsu2+pGFqQkj+vDuJQyZG0bkboGbkI0iKzO7A5gD3zW5SKmn9T61d4d/xd0eqMR
	L2JBusF+yVW/CsztzG2VkaFohrX0Zm2nHrXaKexX2E+JkNSgdJxMUBTyXXWMCG6Hdim29J3biie
	HXDP6hCru6NGpQ2gw3b1OyKArmvD7L3R3wKOO1V5HxtKohRN5ywWQNvgNlF1wCgNP/2MvJrtn5a
	bb6iR5JSZ7jMZeR7Dm5si3fzUadk/QSDYOa8FvJy9AkEJiZ8H5ZkRd3EkIwQxj3G1k0SHn5i5Ug
	SHMmApoDxtfdnKoQ==
X-Google-Smtp-Source: AGHT+IEw6OJxHhulxO5W0vyjKqEL9UiUEJnQ+QQ+8UVkxR4wstp6ma0MGrwjjjphA87JzXJdOl+Ovg==
X-Received: by 2002:a17:903:f83:b0:246:4077:455b with SMTP id d9443c01a7336-25171cbfb5cmr242343295ad.36.1757546865940;
        Wed, 10 Sep 2025 16:27:45 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2a924eeasm38717835ad.108.2025.09.10.16.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 16:27:45 -0700 (PDT)
Message-ID: <cd7cb4b5-561b-49cb-babb-393b608c98bb@gmail.com>
Date: Thu, 11 Sep 2025 08:27:43 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] docs: kdoc: a few more dump_typedef() tweaks
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org
References: <20250909204349.123680-1-corbet@lwn.net>
 <20250909204349.123680-14-corbet@lwn.net>
 <8ff91be7-7cb7-492b-b1be-2d03516c8386@gmail.com>
 <87segus9nb.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87segus9nb.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 10 Sep 2025 07:46:16 -0600, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> Hi Jon,
>>
>> A quick report on minor regression. Please see below.
>>
>> On Tue,  9 Sep 2025 14:43:49 -0600, Jonathan Corbet wrote:
>>> Merge "typedef" into the typedef_type pattern rather than repeating it
>>> later, and add some comments.
>>
>> I'm seeing new warnings after applying 13/13:
>>
>> WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno ./include/media/demux.h' processing failed with: NameError("name '_type' is not defined")

[...]

> 
> OK, that is embarrassing, not sure how that got through.  My apologies.
> 
> An add-on fix is appended if you have the patience to try it; I'll
> update the series before too long in any case.

Testing the one-liner ... , and yes it silenced the warnings.

I can't do any serious reviews on python code, but can do tests on your
"improvements".

All those noisy warnings current docs-next carries ...

Regards,
Akira

> 
> Thanks for testing!
> 
> jon
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 8215948dd548..2376f180b1fa 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1050,7 +1050,7 @@ class KernelDoc:
>                                f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
>                  return
>  
> -            self.create_parameter_list(ln, 'function',_type, args, ',', declaration_name)
> +            self.create_parameter_list(ln, 'function', args, ',', declaration_name)
>  
>              self.output_declaration('function', declaration_name,
>                                      typedef=True,

