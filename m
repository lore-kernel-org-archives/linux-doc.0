Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23B510E5
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 00:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739924164; cv=none; b=OFFU5GNa++5uW1fjqtiS7Js+LY6+x8v5OTfxFKlWESlydXr74QTzR8qGVyEZVTJkZfW8irLmfCbGFSeeBnrEtgZJRod0w/n16m/lG483qsmRX8qpsB/RFxN5CWMBU+2JIF2c/JUz8w8Kb25j0dNR6TMVERCt95DOmXIkd3VzAd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739924164; c=relaxed/simple;
	bh=4afUTfw8twloTKFv6veqSNc3S7boGpWIpq37cR6mZjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pV1Kv/1vdB4pCiY9fGHF25GmOyi7zRn5sHLAPUW1LmoxmZCsZtKdFZHjevhbiHNkAEiS1GG1inL1cLE657t6AauKoTKtzn1xefEnVSHlC47sbaX9bnY1fmdqRwC/+dZIIwJ2yyS3hva5UGRnrvbM/DrNQJzd2yKR4KR1v55hWt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=uZBJjxtX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="uZBJjxtX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21c2f1b610dso155526275ad.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1739924161; x=1740528961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+Gh4PrfHRYwmN/JuhdKzcKHRNfNVtrP3/weQUhJ/T4=;
        b=uZBJjxtXG1V/LgOjIgKYyr4n2zXeWAD6AttbVKdjmkIF5fUKC6nOjdnPzJgJagkoR1
         ZMveMD981zHR59GLp47hMtP/uXPzRDBnk8YtFf/4/YyldnG3eRPIJlEhMv4PfowsM94P
         tJfr+XWqlE7QEgrgAZmq5MlSYijPvjLUJ7sQanAeDmeZO7+W6aoq07D9/rezEe8SNsMi
         5xtwuYHVCzWrEd+/yVGN8nozsROQ3RFwnqoFuLDN/cUhYMddJ81SPStm9riaSVpUGWqH
         r+g/N6fkKkPLVS+4afb9e6YengMWy2dEYm6CJN2FKDDQoNRwa6zUcSGH7It0HZRupCII
         sclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739924161; x=1740528961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+Gh4PrfHRYwmN/JuhdKzcKHRNfNVtrP3/weQUhJ/T4=;
        b=GYb2Td9VO8F+yFhumMQQDmqlVbWbjBZ2lIW5mKqQ5BC7YNi30iD9VzB/UgEsf7IRsL
         P6aSEu6mirufGNQGs5jU9P92fHfjgHQw0Kx2siCP6jV++q2gyJHRwGPE1GIryXpskS8y
         zKJwjU6lLi5aPeQ7KTm/4yYl9sbs57CCMlQDIBMKLBzX4tm8E0pEng3ER3YVf9mMzCjH
         fgFPSQHVp8rCzaQg/DJ3XtVTDVhVAtZ1V489lFtUSBdkWwvJRfsKElu17i8G58dvRsZJ
         v25jROIBRdX991HVLQ9ptWWvunyMvaND6sZEw722cJ85/wRR2xh8dgoxn8O2rTBD4jnU
         HvkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVYTs+iujsAh6110D1b7vzGYV3OgLA3LCBnP9yzrwcJ1nhhcgKzvDQEZ+yTHddIcErwEPiOEUqi4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxexwq09PnyTbStZZyczsF/W9hGdrJJVIj7rN5etAJHLl2eVIp+
	tQq9jvDTDgYvQemu0qPp8pyk/QNLMkBcotZCjEg/bTIfsFIjVlEEX5vDUAbaKD0=
X-Gm-Gg: ASbGncsOyvI60szFe1ouuyIP3FH/hJW+V5mwuPuzwHUia1/FvOid3eEF4FpPXQAjHV1
	hBaDc03TJrPwa2zDH2IT/toqqn4U+avYqoR6OZJjOFRpgx2QJcs00EQMJmSW2Pr0RreuyFbmrTa
	/LP8c2RPnQTPll5xBWOlH6rqxedF3JHTIDnUQIrc/DynremSLuJXqDtLXzNAe4C5IA9TesRUsr8
	3ffUyAMF7XwSd19J4KTVyW3TDvVHOBOc9qWirubJJ48+IP5eHomnFoSg6MZVcwEIcyiz88nLJ/g
	SwFmBTH/Yum6FeFVfVKNxPz10rfsjVbVUQ1Am//oyOXmFEu9ScumVA==
X-Google-Smtp-Source: AGHT+IEehJ0CJQTvwKtuooa6YZUQtdip7vljh1EEdDBXuWMTdmR+h+2oja8FelNoKTbsjNhXhE4d2w==
X-Received: by 2002:a05:6a00:3d55:b0:730:f1b7:9bb2 with SMTP id d2e1a72fcca58-732617dfd49mr23422020b3a.13.1739924160910;
        Tue, 18 Feb 2025 16:16:00 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1156:1:18cb:90d0:372a:99ae? ([2620:10d:c090:500::7:d699])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326c87a86esm6368001b3a.132.2025.02.18.16.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 16:16:00 -0800 (PST)
Message-ID: <5e6974f1-3a8f-42c0-8925-22c7e9c44cf0@davidwei.uk>
Date: Tue, 18 Feb 2025 16:15:56 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 8/8] bnxt_en: add support for device memory
 tcp
Content-Language: en-GB
To: Taehee Yoo <ap420073@gmail.com>, Mina Almasry <almasrymina@google.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, donald.hunter@gmail.com, corbet@lwn.net,
 michael.chan@broadcom.com, andrew+netdev@lunn.ch, hawk@kernel.org,
 ilias.apalodimas@linaro.org, ast@kernel.org, daniel@iogearbox.net,
 john.fastabend@gmail.com, sdf@fomichev.me, asml.silence@gmail.com,
 brett.creeley@amd.com, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 kory.maincent@bootlin.com, maxime.chevallier@bootlin.com,
 danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
 przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com,
 rrameshbabu@nvidia.com, idosch@nvidia.com, jiri@resnulli.us,
 bigeasy@linutronix.de, lorenzo@kernel.org, jdamato@fastly.com,
 aleksander.lobakin@intel.com, kaiyuanz@google.com, willemb@google.com,
 daniel.zahka@gmail.com
References: <20241022162359.2713094-1-ap420073@gmail.com>
 <20241022162359.2713094-9-ap420073@gmail.com>
 <CAHS8izN-PXYC0GspMFPqeACqDTTRK_B8guuXc6+KAXRFaSPG6Q@mail.gmail.com>
 <CAMArcTVY+8rVtnYronP4Ud6T0S1eSgQX3N0TK_BFYjiBxDaSyA@mail.gmail.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <CAMArcTVY+8rVtnYronP4Ud6T0S1eSgQX3N0TK_BFYjiBxDaSyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024-11-01 11:24, Taehee Yoo wrote:
> On Fri, Nov 1, 2024 at 11:53 PM Mina Almasry <almasrymina@google.com> wrote:
>>
>> On Tue, Oct 22, 2024 at 9:25 AM Taehee Yoo <ap420073@gmail.com> wrote:
>>>
>>> Currently, bnxt_en driver satisfies the requirements of Device memory
>>> TCP, which is tcp-data-split.
>>> So, it implements Device memory TCP for bnxt_en driver.
>>>
>>> From now on, the aggregation ring handles netmem_ref instead of page
>>> regardless of the on/off of netmem.
>>> So, for the aggregation ring, memory will be handled with the netmem
>>> page_pool API instead of generic page_pool API.
>>>
>>> If Devmem is enabled, netmem_ref is used as-is and if Devmem is not
>>> enabled, netmem_ref will be converted to page and that is used.
>>>
>>> Driver recognizes whether the devmem is set or unset based on the
>>> mp_params.mp_priv is not NULL.
>>> Only if devmem is set, it passes PP_FLAG_ALLOW_UNREADABLE_NETMEM.
>>
>> Looks like in the latest version, you pass
>> PP_FLAG_ALLOW_UNREADABLE_NETMEM unconditionally, so this line is
>> obsolete.
> 
> Okay, I will remove this line.
> 
>>
>> However, I think you should only pass PP_FLAG_ALLOW_UNREADABLE_NETMEM
>> if hds_thresh==0 and tcp-data-split==1, because otherwise the driver
>> is not configured well enough to handle unreadable netmem, right? I
>> know that we added checks in the devmem binding to detect hds_thresh
>> and tcp-data-split, but we should keep another layer of protection in
>> the driver. The driver should not set PP_FLAG_ALLOW_UNREADABLE_NETMEM
>> unless it's configured to be able to handle unreadable netmem.
> 
> Okay, I agree, I will pass PP_FLAG_ALLOW_UNREADABLE_NETMEM
> only when hds_thresh==0 and tcp-data-split==1.
> 
>>
>>>
>>> Tested-by: Stanislav Fomichev <sdf@fomichev.me>
>>> Signed-off-by: Taehee Yoo <ap420073@gmail.com>
>>> ---
>>>
>>> v4:
>>>  - Do not select NET_DEVMEM in Kconfig.
>>>  - Pass PP_FLAG_ALLOW_UNREADABLE_NETMEM flag unconditionally.
>>>  - Add __bnxt_rx_agg_pages_xdp().
>>>  - Use gfp flag in __bnxt_alloc_rx_netmem().
>>>  - Do not add *offset in the __bnxt_alloc_rx_netmem().
>>>  - Do not pass queue_idx to bnxt_alloc_rx_page_pool().
>>>  - Add Test tag from Stanislav.
>>>  - Add page_pool_recycle_direct_netmem() helper.
>>>
>>> v3:
>>>  - Patch added.
>>>
>>>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 182 ++++++++++++++++------
>>>  drivers/net/ethernet/broadcom/bnxt/bnxt.h |   2 +-
>>>  include/net/page_pool/helpers.h           |   6 +
>>>  3 files changed, 142 insertions(+), 48 deletions(-)

Hi Taehee, what is your plan with this patch? Are you still working on
it? I noticed that you dropped it in later versions of this series. With
io_uring zero copy Rx now merged I also need bnxt support, but I don't
want to duplicate efforts. Please let me know, thanks!
